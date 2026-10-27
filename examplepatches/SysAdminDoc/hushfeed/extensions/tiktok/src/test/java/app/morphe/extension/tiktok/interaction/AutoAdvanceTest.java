package app.morphe.extension.tiktok.interaction;

import static org.junit.Assert.*;
import android.view.View;
import android.widget.ListView;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.wellbeing.FeedLock;
import app.morphe.extension.tiktok.wellbeing.SessionBudget;
import app.morphe.extension.tiktok.wellbeing.SessionPlaybackHold;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.SettingsMenuPreference;
import app.morphe.extension.tiktok.settings.preference.TikTokPreferenceFragment;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.Before;
import org.junit.Test;
import org.junit.After;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "night")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class AutoAdvanceTest {
    @After public void tearDown() {
        // clear() is the public way in from another package: it ends any hold and empties both
        // counts, in memory and in the record.
        SessionBudget.clear();
        Settings.SESSION_BUDGET_VIDEOS.resetToDefault();
        Settings.SESSION_BUDGET_LOCK_MINUTES.resetToDefault();
        Settings.SESSION_BUDGET_STATE.resetToDefault();
        SettingsStatus.autoAdvanceEnabled = false;
        SettingsStatus.playbackSpeedEnabled = false;
        SettingsStatus.playbackQualityEnabled = false;
        Settings.AUTO_ADVANCE_LIMIT.save(0);
    }
    enum State { AUTO_SCROLL_STATE_START, AUTO_SCROLL_STATE_STOP, AUTO_SCROLL_STATE_PAUSE }
    /**
     * A real view in a real hierarchy, so isShown() and getParent() answer for themselves.
     * Only window focus is stubbed, because Robolectric grants none to a visible activity.
     */
    static final class IndicatorView extends View {
        IndicatorView(android.content.Context context) { super(context); }
        @Override public boolean hasWindowFocus() { return true; }
    }
    /**
     * The feed, with the host's auto scroll indicator inside it. The control is given the
     * indicator, because that is the view the patch hands over, and the indicator is GONE
     * because that is how the host keeps it until scrolling runs. Being on screen is therefore
     * the feed's answer, not the indicator's, which is the whole point of the check.
     */
    static final class FeedView extends android.widget.FrameLayout {
        boolean attached = true, shown = true, focused = true;
        final View indicator = new View(RuntimeEnvironment.getApplication()) {
            @Override public boolean isAttachedToWindow() { return attached; }
            @Override public boolean hasWindowFocus() { return focused; }
        };
        FeedView() {
            super(RuntimeEnvironment.getApplication());
            indicator.setVisibility(GONE);
            addView(indicator);
        }
        @Override public boolean isShown() { return shown; }
    }
    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        // The Playback page is captured below, and the speed rows on it are process-wide
        // settings another class may have left at any value: the capture has to start from
        // the defaults or it moves with the order the classes ran in.
        Settings.DEFAULT_SPEED_ENABLED.resetToDefault();
        Settings.DEFAULT_SPEED.resetToDefault();
        Settings.CUSTOM_SPEEDS.resetToDefault();
        Settings.HOLD_SPEED.resetToDefault();
        Settings.AUTO_ADVANCE.save(true);
        Settings.SESSION_BUDGET_VIDEOS.resetToDefault();
        Settings.SESSION_BUDGET_LOCK_MINUTES.resetToDefault();
        SessionBudget.clear();
    }
    /** The two constants the host chooses between, standing in for its own obfuscated enum. */
    enum LoadStrategy { IMMEDIATE, LAZY }
    /** What the patch writes into the bridge: the host's own immediate constant, nothing else. */
    @Implements(AutoAdvance.class)
    public static class ImmediateLoadBridge {
        @Implementation protected static Object immediateLoad() { return LoadStrategy.IMMEDIATE; }
    }

    @Test @Config(shadows = ImmediateLoadBridge.class)
    public void anEnabledSettingHasTheHostBuildTheComponentWithTheRest() {
        Settings.AUTO_ADVANCE.save(true);
        assertEquals(LoadStrategy.IMMEDIATE, AutoAdvance.loadStrategy(LoadStrategy.LAZY));
    }

    @Test @Config(shadows = ImmediateLoadBridge.class)
    public void aDisabledSettingLeavesTheHostsOwnLazyRegistrationAlone() {
        Settings.AUTO_ADVANCE.save(false);
        assertEquals(LoadStrategy.LAZY, AutoAdvance.loadStrategy(LoadStrategy.LAZY));
    }

    @Test public void withoutTheNativeBridgeTheHostsOwnChoiceStands() {
        // The bridge body only exists in a patched build. Unpatched it answers nothing, and
        // answering nothing must not blank out the strategy the host registered.
        Settings.AUTO_ADVANCE.save(true);
        assertEquals(LoadStrategy.LAZY, AutoAdvance.loadStrategy(LoadStrategy.LAZY));
    }

    /** A component the host has stopped, so a look that decides to start it is visible. */
    @Implements(AutoAdvance.class)
    public static class StoppedComponent {
        static int starts;
        @Implementation protected static Object readState(Object component) {
            return State.AUTO_SCROLL_STATE_STOP;
        }
        @Implementation protected static void start(Object component) { starts++; }
        @Implementation protected static void stop(Object component) { }
        @Implementation protected static Object readAweme(Object component) { return null; }
    }

    private int completionsAgainst(AutoAdvance.Control control) {
        StoppedComponent.starts = 0;
        Object component = new Object();
        java.util.Map<Object, AutoAdvance.Control> controls =
                org.robolectric.util.ReflectionHelpers.getStaticField(AutoAdvance.class, "CONTROLS");
        controls.put(component, control);
        try {
            AutoAdvance.beforeCompletion(component, "a");
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            return StoppedComponent.starts;
        } finally {
            controls.remove(component);
        }
    }

    @Test @Config(shadows = StoppedComponent.class)
    public void aCompletionLooksAgainWhenTheSessionIsStoodDown() {
        // Changing the limit resets the count through the posted update, but that update runs
        // while the settings page still holds the window, so nothing starts. The host keeps
        // reporting completions of the video it is looping, and that is the second look.
        var control = new AutoAdvance.Control(new FeedView().indicator);
        control.owned = false;
        assertEquals("a stood-down session never looked again", 1, completionsAgainst(control));
        assertEquals("the completion was counted while it was not running", 0, control.completedCount);
    }

    @Test @Config(shadows = StoppedComponent.class)
    public void aCompletionCannotStartASessionTheLimitHasAlreadyEnded() {
        // Saved before the control is built, so this is a session that spent its limit rather
        // than one whose limit just changed. A changed limit is the case above.
        Settings.AUTO_ADVANCE_LIMIT.save(2);
        var control = new AutoAdvance.Control(new FeedView().indicator);
        control.owned = false;
        control.completedCount = 2;
        assertEquals("a spent session was started again", 0, completionsAgainst(control));
    }

    @Test @Config(shadows = StoppedComponent.class)
    public void aCompletionCannotStartASessionOnAFeedThatIsNotOnScreen() {
        FeedView feed = new FeedView();
        feed.shown = false;
        var control = new AutoAdvance.Control(feed.indicator);
        control.owned = false;
        assertEquals("an off-screen feed was started", 0, completionsAgainst(control));
    }

    @Test public void restartsNativeStopButPreservesPauseAndStopsWhenDisabled() {
        // The control holds the view weakly, so the test has to hold it strongly. Without
        // this the view can be collected part way through and every later update returns
        // early, which showed up as one failing run in ten.
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_STOP);
        var starts = new AtomicInteger();
        var stops = new AtomicInteger();
        Runnable start = () -> { starts.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_START); };
        Runnable stop = () -> { stops.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_STOP); };
        control.update(state::get, start, stop);
        assertEquals(1, starts.get());
        assertTrue(control.owned);
        control.update(state::get, start, stop);
        assertEquals(1, starts.get());
        state.set(State.AUTO_SCROLL_STATE_PAUSE);
        control.update(state::get, start, stop);
        assertEquals(State.AUTO_SCROLL_STATE_PAUSE, state.get());
        state.set(State.AUTO_SCROLL_STATE_STOP);
        control.update(state::get, start, stop);
        assertEquals(2, starts.get());
        Settings.AUTO_ADVANCE.save(false);
        control.update(state::get, start, stop);
        control.update(state::get, start, stop);
        assertEquals(1, stops.get());
        assertFalse(control.owned);
    }
    @Test public void aRunningHoldStopsAutoAdvanceAndLetsItStartAgainAfterwards() {
        // Advancing behind the hold walks through videos nobody can see, and each one used to
        // spend a place in this session's own limit as well.
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_STOP);
        var starts = new AtomicInteger();
        var stops = new AtomicInteger();
        Runnable start = () -> { starts.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_START); };
        Runnable stop = () -> { stops.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_STOP); };

        control.update(state::get, start, stop);
        assertTrue(control.owned);

        Settings.SESSION_BUDGET_VIDEOS.save(1);
        Settings.SESSION_BUDGET_LOCK_MINUTES.save(5);
        SessionBudget.noteVideo("a");
        assertTrue(SessionBudget.claimNotice());
        assertTrue("no hold started", SessionBudget.isLocked());

        control.update(state::get, start, stop);
        assertEquals("the feed kept advancing behind the hold", 1, stops.get());
        assertFalse("ownership was kept through the hold", control.owned);
        control.update(state::get, start, stop);
        assertEquals("it started again while the hold was still running", 1, starts.get());

        SessionBudget.releaseLock();
        assertFalse(SessionBudget.isLocked());
        control.update(state::get, start, stop);
        assertEquals("it never started again once the hold ended", 2, starts.get());
        assertTrue(control.owned);
    }

    @Test public void aVideoFinishingBehindTheHoldIsNotCountedAgainstTheSessionLimit() throws Exception {
        // The hold check used to be reached only through update(), which runs after the
        // completion is recorded, so the video that finished behind the panel still spent a
        // place in this session's limit and could put its notice on top of the hold.
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        control.owned = true;
        Object component = new Object();
        java.util.Map<Object, AutoAdvance.Control> controls =
                org.robolectric.util.ReflectionHelpers.getStaticField(AutoAdvance.class, "CONTROLS");
        controls.put(component, control);

        Settings.SESSION_BUDGET_VIDEOS.save(1);
        Settings.SESSION_BUDGET_LOCK_MINUTES.save(5);
        SessionBudget.noteVideo("a");
        assertTrue(SessionBudget.claimNotice());
        assertTrue("no hold started", SessionBudget.isLocked());

        AutoAdvance.beforeCompletion(component, "finished-behind-the-panel");

        assertEquals("a video nobody could see was counted", 0, control.completedCount);
        assertFalse("the feed kept advancing behind the hold", control.owned);
    }

    @Test public void aSharedVideoPlayingAloneStandsAutoAdvanceDownUntilAnotherVideoPlays() {
        // Open shared videos alone: a link's video has no feed after it, and the end of the
        // video is where Auto-advance would have moved on into one.
        SettingsStatus.blockAuthorEnabled = true;
        SettingsStatus.feedNavigationEnabled = true;
        Settings.SHARED_VIDEO_ALONE.save(true);
        Object component = new Object();
        java.util.Map<Object, AutoAdvance.Control> controls =
                org.robolectric.util.ReflectionHelpers.getStaticField(AutoAdvance.class, "CONTROLS");
        try {
            FeedView feed = new FeedView();
            var control = new AutoAdvance.Control(feed.indicator);
            var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_STOP);
            var starts = new AtomicInteger();
            Runnable start = () -> { starts.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_START); };
            Runnable stop = () -> state.set(State.AUTO_SCROLL_STATE_STOP);
            control.update(state::get, start, stop);
            assertTrue(control.owned);

            FeedLock.onNewIntent(new android.content.Intent(android.content.Intent.ACTION_VIEW,
                    android.net.Uri.parse("https://www.tiktok.com/@a/video/1")));
            playing("linked");
            assertTrue(FeedLock.linkVideoAlone());

            // Its end, before the completion is counted: stood down, and not counted.
            controls.put(component, control);
            AutoAdvance.beforeCompletion(component, "linked");
            assertFalse("Auto-advance moved on from a shared video", control.owned);
            assertEquals("the shared video spent a place in the session's limit", 0, control.completedCount);
            // The host's component, stopped by that stand-down through the native bridge.
            state.set(State.AUTO_SCROLL_STATE_STOP);
            control.update(state::get, start, stop);
            assertEquals("it started again on the shared video", 1, starts.get());

            playing("next");
            assertFalse(FeedLock.linkVideoAlone());
            control.update(state::get, start, stop);
            assertEquals("it never started again once another video played", 2, starts.get());
            assertTrue(control.owned);
        } finally {
            controls.remove(component);
            Settings.SHARED_VIDEO_ALONE.resetToDefault();
            SettingsStatus.blockAuthorEnabled = false;
            SettingsStatus.feedNavigationEnabled = false;
            org.robolectric.util.ReflectionHelpers.callStaticMethod(FeedLock.class, "resetForTests");
            org.robolectric.util.ReflectionHelpers.setStaticField(SessionPlaybackHold.class, "current", null);
        }
    }

    @Test public void tikToksOwnScrollStopsOnASharedVideoPlayingAloneToo() {
        // Started from the panel action, or by search on its own: not Hushfeed's, and the
        // pager's touch guard doesn't stop a move the app makes itself.
        SettingsStatus.blockAuthorEnabled = true;
        SettingsStatus.feedNavigationEnabled = true;
        Settings.SHARED_VIDEO_ALONE.save(true);
        try {
            FeedView feed = new FeedView();
            var control = new AutoAdvance.Control(feed.indicator);
            var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_START);
            var stops = new AtomicInteger();
            Runnable start = () -> fail("it started a scroll that was already running");
            Runnable stop = () -> { stops.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_STOP); };
            control.update(state::get, start, stop);
            assertFalse(control.owned);
            assertEquals("TikTok's own scroll was stopped with no shared video", 0, stops.get());

            FeedLock.onNewIntent(new android.content.Intent(android.content.Intent.ACTION_VIEW,
                    android.net.Uri.parse("https://www.tiktok.com/@a/video/1")));
            playing("linked");
            assertTrue(FeedLock.linkVideoAlone());
            control.update(state::get, start, stop);
            assertEquals("TikTok's own scroll moved on from a shared video", 1, stops.get());
            control.update(state::get, start, stop);
            assertEquals("a stopped scroll was stopped again", 1, stops.get());

            // With Hushfeed's own Auto-advance off, TikTok's still doesn't move on from it.
            Settings.AUTO_ADVANCE.save(false);
            state.set(State.AUTO_SCROLL_STATE_PAUSE);
            control.update(state::get, start, stop);
            assertEquals(2, stops.get());

            app.morphe.extension.shared.settings.PausedProcess.set(true);
            state.set(State.AUTO_SCROLL_STATE_START);
            control.update(state::get, start, stop);
            assertEquals("paused, Hushfeed still stopped TikTok's scroll", 2, stops.get());
        } finally {
            app.morphe.extension.shared.settings.PausedProcess.set(false);
            Settings.SHARED_VIDEO_ALONE.resetToDefault();
            SettingsStatus.blockAuthorEnabled = false;
            SettingsStatus.feedNavigationEnabled = false;
            org.robolectric.util.ReflectionHelpers.callStaticMethod(FeedLock.class, "resetForTests");
            org.robolectric.util.ReflectionHelpers.setStaticField(SessionPlaybackHold.class, "current", null);
        }
    }

    /** The player reporting the video it plays, the way it reaches the hold and the feed lock. */
    private static void playing(String awemeId) {
        SessionPlaybackHold.onPlayerProgress(new Object(), awemeId);
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
    }

    @Test public void disabledSettingLeavesPreexistingNativeAutoScrollAlone() {
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_START);
        control.update(state::get, () -> fail("Already running"), () -> fail("Native ownership"));
        Settings.AUTO_ADVANCE.save(false);
        control.update(state::get, () -> fail("Disabled"), () -> fail("Native ownership"));
        assertFalse(AutoAdvance.available(false));
        assertTrue(AutoAdvance.available(true));
    }

    /** The panel's Auto scroll action can be hidden on its own; the feed gate is not touched. */
    @Test public void theHideSwitchTakesOnlyThePanelAction() {
        Settings.AUTO_ADVANCE.save(true);
        assertTrue(AutoAdvance.panelAvailable(false));
        Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.save(true);
        assertFalse("the panel action stayed with the hide switch on", AutoAdvance.panelAvailable(true));
        assertTrue("the feed gate went with the panel action", AutoAdvance.available(false));

        // Off, the hide switch changes nothing: the action follows the feed gate as before.
        Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.save(false);
        Settings.AUTO_ADVANCE.save(false);
        assertFalse(AutoAdvance.panelAvailable(false));
        assertTrue(AutoAdvance.panelAvailable(true));
    }
    /** #234: an account in TikTok's own rollout can hide its Auto scroll with Auto-advance off. */
    @Test public void theHideSwitchWorksWithAutoAdvanceOff() {
        Settings.AUTO_ADVANCE.save(false);
        Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.save(true);
        try {
            assertFalse("the panel action stayed for a rollout account",
                    AutoAdvance.panelAvailable(true));
            assertFalse(AutoAdvance.panelAvailable(false));
            assertFalse("the foldable's rail switch stayed", AutoAdvance.railAvailable(true));
            assertTrue("the feed gate went with the hidden controls", AutoAdvance.available(true));
        } finally {
            Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.resetToDefault();
        }
    }
    @Test public void theRailControlFollowsTheGateUntilHidden() {
        Settings.AUTO_ADVANCE.save(true);
        assertTrue(AutoAdvance.railAvailable(true));
        assertFalse("the rail answered yes over a no gate", AutoAdvance.railAvailable(false));
        Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.save(true);
        try {
            assertFalse("the rail switch stayed with the hide switch on", AutoAdvance.railAvailable(true));
        } finally {
            Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.resetToDefault();
        }
        assertTrue("each video cell builds its rail once, so flipping the switch needs a restart",
                Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION.rebootApp);
    }
    @Test public void aCollectedFeedViewEndsTheControlsWork() {
        FeedView view = new FeedView();
        var control = new AutoAdvance.Control(view.indicator);
        control.update(() -> State.AUTO_SCROLL_STATE_STOP, () -> { }, () -> fail("Not started"));

        // Ownership of the view is deliberately weak. Once it is gone the control must do
        // nothing at all, which is also why every case here keeps its own reference.
        control.view.clear();
        control.update(() -> State.AUTO_SCROLL_STATE_STOP, () -> fail("View is gone"), () -> fail("View is gone"));
    }
    @Test public void hiddenDetachedAndUnfocusedViewsCannotStartScrolling() {
        FeedView view = new FeedView();
        var control = new AutoAdvance.Control(view.indicator);
        for (int i = 0; i < 3; i++) {
            view.attached = i != 0;
            view.shown = i != 1;
            view.focused = i != 2;
            control.update(() -> State.AUTO_SCROLL_STATE_STOP, () -> fail("Inactive view"), () -> fail("Inactive view"));
        }
        view.attached = view.shown = view.focused = true;
        control.update(() -> null, () -> fail("Unknown state"), () -> fail("Unknown state"));
    }
    @Test public void theHostsHiddenIndicatorStillStartsWhileItsFeedIsOnScreen() {
        // The component's own view is the host's auto scroll indicator, and the host keeps it
        // GONE until scrolling is running. That is the state a cold start builds it in, so
        // asking that view about itself stood in the way of ever starting.
        try (var owner = Robolectric.buildActivity(
                app.morphe.extension.tiktok.captions.CaptionToolsTest.CaptionActivity.class).setup().visible()) {
            var feed = new android.widget.FrameLayout(owner.get());
            owner.get().setContentView(feed);
            var indicator = new IndicatorView(owner.get());
            indicator.setVisibility(View.GONE);
            feed.addView(indicator);
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertFalse("the host keeps its indicator hidden", indicator.isShown());
            assertTrue("the feed it sits in is on screen", feed.isShown());
            assertTrue("the indicator is attached", indicator.isAttachedToWindow());

            var control = new AutoAdvance.Control(indicator);
            var started = new AtomicInteger();
            control.update(() -> started.get() == 0 ? State.AUTO_SCROLL_STATE_STOP : State.AUTO_SCROLL_STATE_START,
                    started::incrementAndGet, () -> fail("Nothing to stop"));
            assertEquals(1, started.get());
            assertTrue(control.owned);
        }
    }

    @Test public void aFeedThatIsNotOnScreenCannotStartScrolling() {
        try (var owner = Robolectric.buildActivity(
                app.morphe.extension.tiktok.captions.CaptionToolsTest.CaptionActivity.class).setup().visible()) {
            var feed = new android.widget.FrameLayout(owner.get());
            owner.get().setContentView(feed);
            var indicator = new IndicatorView(owner.get());
            feed.addView(indicator);
            feed.setVisibility(View.GONE);
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();

            var control = new AutoAdvance.Control(indicator);
            control.update(() -> State.AUTO_SCROLL_STATE_STOP,
                    () -> fail("The feed is not on screen"), () -> fail("The feed is not on screen"));
            assertFalse(control.owned);
        }
    }

    @Test public void nativeRefusalDoesNotClaimOwnershipAndSettingIsReachable() throws Exception {
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        control.update(() -> State.AUTO_SCROLL_STATE_STOP, () -> { }, () -> fail("Not started"));
        assertFalse(control.owned);
        try (var owner = Robolectric.buildActivity(app.morphe.extension.tiktok.captions.CaptionToolsTest.CaptionActivity.class).setup().visible()) {
            var activity = owner.get();
            Utils.setContext(activity);
            Utils.setIsDarkModeEnabled(true);
            SettingsStatus.autoAdvanceEnabled = true;
            SettingsStatus.playbackSpeedEnabled = true;
            SettingsStatus.playbackQualityEnabled = true;
            var fragment = new TikTokPreferenceFragment();
            android.os.Bundle arguments = new android.os.Bundle();
            arguments.putString("morphe_settings_section", "PLAYBACK");
            fragment.setArguments(arguments);
            activity.getFragmentManager().beginTransaction().replace(android.R.id.content, fragment).commit();
            activity.getFragmentManager().executePendingTransactions();
            var playback = (SettingsMenuPreference) fragment.findPreference("section_playback");
            assertNotNull(playback);
            assertTrue(playback.isExpanded());
            var preference = playback.findPreference(Settings.AUTO_ADVANCE.key);
            assertNotNull(preference);
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            ListView list = fragment.getView().findViewById(android.R.id.list);
            int position = -1;
            for (int index = 0; index < list.getCount(); index++) {
                if (list.getItemAtPosition(index) == preference) position = index;
            }
            assertTrue("Auto-advance is absent from the expanded list", position >= 0);
            list.setSelectionFromTop(position, 0);
            View decor = activity.getWindow().getDecorView();
            for (int frame = 0; frame < 4; frame++) {
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper())
                        .idleFor(java.time.Duration.ofMillis(16));
                decor.measure(View.MeasureSpec.makeMeasureSpec(480, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(960, View.MeasureSpec.EXACTLY));
                decor.layout(0, 0, 480, 960);
            }
            View shown = list.getChildAt(position - list.getFirstVisiblePosition());
            assertNotNull("Auto-advance was not laid out for its capture", shown);
            assertTrue(shown.isShown());
            assertTrue(shown.getGlobalVisibleRect(new android.graphics.Rect()));
            app.morphe.extension.tiktok.UiCapture.save(decor, "auto-advance-settings.png");
        }
    }

    @Test public void ownedSessionStopsAtItsVisibleCompletionLimitAndCanBeReset() {
        Settings.AUTO_ADVANCE_LIMIT.save(2);
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_STOP);
        var starts = new AtomicInteger();
        var stops = new AtomicInteger();
        Runnable start = () -> { starts.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_START); };
        Runnable stop = () -> { stops.incrementAndGet(); state.set(State.AUTO_SCROLL_STATE_STOP); };

        control.update(state::get, start, stop);
        assertTrue(control.owned);
        assertTrue(control.recordCompletion("first"));
        state.set(State.AUTO_SCROLL_STATE_STOP);
        control.update(state::get, start, stop);
        assertEquals(2, starts.get());
        assertTrue(control.recordCompletion("second"));
        state.set(State.AUTO_SCROLL_STATE_STOP);
        control.update(state::get, start, stop);
        assertEquals(1, stops.get());
        assertFalse(control.owned);
        assertFalse(control.recordCompletion("second"));

        // Removing the limit lets this feed session continue. A new component starts at zero.
        Settings.AUTO_ADVANCE_LIMIT.save(0);
        control.update(state::get, start, stop);
        assertEquals(3, starts.get());
        var fresh = new AutoAdvance.Control(new FeedView().indicator);
        assertEquals(0, fresh.completedCount);
    }

    @Test public void nativeOnlyCompletionsDoNotConsumeTheHushfeedLimit() {
        Settings.AUTO_ADVANCE_LIMIT.save(1);
        FeedView feed = new FeedView();
        var control = new AutoAdvance.Control(feed.indicator);
        var state = new AtomicReference<>(State.AUTO_SCROLL_STATE_START);
        control.update(state::get, () -> fail("native scrolling is already running"),
                () -> fail("native scrolling is not owned"));
        assertFalse(control.owned);
        assertFalse(control.recordCompletion("native"));
        assertEquals(0, control.completedCount);
    }
}
