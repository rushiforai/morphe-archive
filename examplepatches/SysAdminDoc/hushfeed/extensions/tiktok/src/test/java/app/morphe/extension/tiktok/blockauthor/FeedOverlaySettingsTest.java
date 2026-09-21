package app.morphe.extension.tiktok.blockauthor;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ListView;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.feedfilter.FeedRuleLimits;
import app.morphe.extension.tiktok.settings.preference.TikTokPreferenceFragment;
import app.morphe.extension.tiktok.wellbeing.SessionBudget;
import app.morphe.extension.tiktok.wellbeing.SessionLockOverlay;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/** The installed settings rows must refresh a previously selected creator without a new bind. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@SuppressWarnings("deprecation")
public class FeedOverlaySettingsTest {
    private ActivityController<Activity> controller;
    private Activity activity;
    private TikTokPreferenceFragment fragment;
    private boolean oldBlock, oldLocal, oldSound, oldFeedback;
    private boolean oldBlockStatus, oldFeedbackStatus, oldFeedFilterStatus;

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        oldBlock = Settings.BLOCK_AUTHOR_BUTTON.get();
        oldLocal = Settings.LOCAL_HIDE_BUTTON.get();
        oldSound = Settings.BLOCK_SOUND_BUTTON.get();
        oldFeedback = Settings.NOT_INTERESTED_BUTTON.get();
        oldBlockStatus = SettingsStatus.blockAuthorEnabled;
        oldFeedbackStatus = SettingsStatus.notInterestedEnabled;
        oldFeedFilterStatus = SettingsStatus.feedFilterEnabled;
        SettingsStatus.blockAuthorEnabled = true;
        SettingsStatus.notInterestedEnabled = true;
        SettingsStatus.feedFilterEnabled = true;
        Settings.BLOCK_AUTHOR_BUTTON.save(false);
        Settings.LOCAL_HIDE_BUTTON.save(true);
        Settings.BLOCK_SOUND_BUTTON.save(true);
        Settings.NOT_INTERESTED_BUTTON.save(false);
        BlockAuthorOverlay.onAuthorChanged(null);
        CurrentVideoAuthor.resetForTests();
        idle();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        activity = controller.get();
        Utils.setContext(activity);
        Utils.setActivity(activity);
    }

    @After public void tearDown() {
        if (controller != null) controller.pause().stop().destroy();
        Settings.BLOCK_AUTHOR_BUTTON.save(false);
        Settings.LOCAL_HIDE_BUTTON.save(true);
        Settings.BLOCK_SOUND_BUTTON.save(true);
        Settings.NOT_INTERESTED_BUTTON.save(false);
        BlockAuthorOverlay.onAuthorChanged(null);
        CurrentVideoAuthor.resetForTests();
        idle();
        Settings.BLOCK_AUTHOR_BUTTON.save(oldBlock);
        Settings.LOCAL_HIDE_BUTTON.save(oldLocal);
        Settings.BLOCK_SOUND_BUTTON.save(oldSound);
        Settings.NOT_INTERESTED_BUTTON.save(oldFeedback);
        SettingsStatus.blockAuthorEnabled = oldBlockStatus;
        SettingsStatus.notInterestedEnabled = oldFeedbackStatus;
        SettingsStatus.feedFilterEnabled = oldFeedFilterStatus;
        Utils.setActivity(null);
        Utils.setContext(RuntimeEnvironment.getApplication());
    }

    @Test public void feedbackRowEnablesTheCurrentCreatorWhileBlockIsOff() {
        showSettings(false, false);
        bind("video-one");
        assertNull(button("Not interested in this video"));

        click(Settings.NOT_INTERESTED_BUTTON);

        assertTrue(Settings.NOT_INTERESTED_BUTTON.get());
        assertFalse(Settings.BLOCK_AUTHOR_BUTTON.get());
        assertVisible("Not interested in this video");
        assertEquals(View.GONE, button("Block this creator").getVisibility());
        View installed = button("Not interested in this video");
        bind("video-two");
        assertSame("another video by the same creator should retain the control", installed,
                button("Not interested in this video"));
    }

    @Test public void blockRowEnablesTheCurrentCreatorWhileFeedbackIsOff() {
        showSettings(false, false);
        bind("video-one");
        assertNull(button("Block this creator"));

        click(Settings.BLOCK_AUTHOR_BUTTON);

        assertTrue(Settings.BLOCK_AUTHOR_BUTTON.get());
        assertFalse(Settings.NOT_INTERESTED_BUTTON.get());
        assertVisible("Block this creator");
        assertEquals(View.GONE, button("Not interested in this video").getVisibility());
    }

    @Test public void localHideRefusesTheTenThousandAndFirstEntryWithoutThrowing() {
        String before = Settings.LOCAL_HIDDEN_CREATORS.get();
        try {
            StringBuilder full = new StringBuilder();
            for (int index = 0; index < FeedRuleLimits.MAX_ENTRIES; index++) {
                if (index > 0) full.append(',');
                full.append("creator").append(index);
            }
            Settings.LOCAL_HIDDEN_CREATORS.save(full.toString());
            showSettings(true, false);
            bind("video-at-limit");
            ShadowToast.reset();

            button("Hide this creator on this phone").performClick();
            idle();

            assertEquals(full.toString(), Settings.LOCAL_HIDDEN_CREATORS.get());
            assertEquals("That list has too many entries. Keep it to 10,000 or fewer.",
                    ShadowToast.getTextOfLatestToast());
        } finally {
            Settings.LOCAL_HIDDEN_CREATORS.save(before);
        }
    }

    @Test public void lastFeedbackRowOffDetachesTheInstalledControls() {
        showSettings(false, true);
        bind("video-one");
        assertVisible("Not interested in this video");

        click(Settings.NOT_INTERESTED_BUTTON);

        assertFalse(Settings.NOT_INTERESTED_BUTTON.get());
        assertNoControls();
    }

    @Test public void lastBlockRowOffDetachesTheInstalledControls() {
        showSettings(true, false);
        bind("video-one");
        assertVisible("Block this creator");

        click(Settings.BLOCK_AUTHOR_BUTTON);

        assertFalse(Settings.BLOCK_AUTHOR_BUTTON.get());
        assertNoControls();
    }

    @Test public void turningOffOneRowKeepsTheOtherControlInstalled() {
        showSettings(true, true);
        bind("video-one");
        View block = button("Block this creator");
        View feedback = button("Not interested in this video");

        click(Settings.BLOCK_AUTHOR_BUTTON);
        assertEquals(View.GONE, block.getVisibility());
        assertSame(feedback, button("Not interested in this video"));
        assertVisible("Not interested in this video");

        click(Settings.BLOCK_AUTHOR_BUTTON);
        click(Settings.NOT_INTERESTED_BUTTON);
        assertEquals(View.GONE, feedback.getVisibility());
        assertSame(block, button("Block this creator"));
        assertVisible("Block this creator");
    }

    @Test public void theTwoSecondaryBlockControlsCanBeHiddenIndependently() {
        showSettings(true, false);
        bind("video-one");
        assertVisible("Block this creator");
        assertVisible("Hide this creator on this phone");
        assertVisible("Block this sound");

        click(Settings.LOCAL_HIDE_BUTTON);
        assertEquals(View.GONE, button("Hide this creator on this phone").getVisibility());
        assertVisible("Block this creator");
        assertVisible("Block this sound");

        click(Settings.BLOCK_SOUND_BUTTON);
        assertEquals(View.GONE, button("Block this sound").getVisibility());
        assertVisible("Block this creator");
    }

    @Test public void enablingLocalHideAfterAttachDoesNotOverlapTheSoundButton() {
        String oldBlockPosition = Settings.BLOCK_AUTHOR_BUTTON_POSITION.get();
        String oldLocalPosition = Settings.LOCAL_HIDE_BUTTON_POSITION.get();
        String oldSoundPosition = Settings.BLOCK_SOUND_BUTTON_POSITION.get();
        try {
            // This is an upgrade-shaped state: older builds saved only the block/group position.
            Settings.BLOCK_AUTHOR_BUTTON_POSITION.save("0.25,0.3");
            Settings.LOCAL_HIDE_BUTTON_POSITION.save("");
            Settings.BLOCK_SOUND_BUTTON_POSITION.save("");
            Settings.LOCAL_HIDE_BUTTON.save(false);
            showSettings(true, false);
            bind("video-one");
            layoutRoot(activity.findViewById(android.R.id.content));

            View local = button("Hide this creator on this phone");
            View sound = button("Block this sound");
            assertEquals(View.GONE, local.getVisibility());
            click(Settings.LOCAL_HIDE_BUTTON);

            FrameLayout.LayoutParams localPosition =
                    (FrameLayout.LayoutParams) local.getLayoutParams();
            FrameLayout.LayoutParams soundPosition =
                    (FrameLayout.LayoutParams) sound.getLayoutParams();
            FrameLayout.LayoutParams blockPosition =
                    (FrameLayout.LayoutParams) button("Block this creator").getLayoutParams();
            assertVisible("Hide this creator on this phone");
            assertVisible("Block this sound");
            assertEquals(blockPosition.leftMargin, localPosition.leftMargin);
            assertEquals(blockPosition.leftMargin, soundPosition.leftMargin);
            assertTrue("local hide did not retain the first slot beside the saved block position",
                    localPosition.topMargin > blockPosition.topMargin);
            assertTrue("enabling a hidden default control covered the sound control",
                    soundPosition.topMargin > localPosition.topMargin);
        } finally {
            Settings.BLOCK_AUTHOR_BUTTON_POSITION.save(oldBlockPosition);
            Settings.LOCAL_HIDE_BUTTON_POSITION.save(oldLocalPosition);
            Settings.BLOCK_SOUND_BUTTON_POSITION.save(oldSoundPosition);
        }
    }

    @Test public void openingCommentsHidesEveryCustomFeedControlUntilTheSheetCloses() {
        showSettings(true, true);
        bind("video-one");
        for (String description : new String[] {"Block this creator", "Hide this creator on this phone",
                "Block this sound", "Not interested in this video"}) {
            assertVisible(description);
        }

        ViewGroup content = activity.findViewById(android.R.id.content);
        FrameLayout comments = new FrameLayout(activity);
        comments.setId(0x7f0a2001);
        View title = new View(activity);
        title.setId(0x7f0a2002);
        comments.addView(title, new FrameLayout.LayoutParams(400, 100));
        content.addView(comments, new FrameLayout.LayoutParams(1080, 1200));
        FeedVisibility.resolveForTests(activity.getPackageName(), "p_5", comments.getId());
        FeedVisibility.resolveForTests(activity.getPackageName(), "vjb", title.getId());
        layoutRoot(content);
        content.getViewTreeObserver().dispatchOnGlobalLayout();

        for (String description : new String[] {"Block this creator", "Hide this creator on this phone",
                "Block this sound", "Not interested in this video"}) {
            assertEquals(description + " remained above comments", View.GONE,
                    button(description).getVisibility());
        }

        comments.setVisibility(View.GONE);
        content.getViewTreeObserver().dispatchOnGlobalLayout();
        for (String description : new String[] {"Block this creator", "Hide this creator on this phone",
                "Block this sound", "Not interested in this video"}) {
            assertVisible(description);
        }
    }

    @Test public void feedbackRowCannotExposeControlsOverARetainedDailyHold() {
        assertControlStaysBehindHold(Settings.NOT_INTERESTED_BUTTON, "Not interested in this video");
    }

    @Test public void blockRowCannotExposeControlsOverARetainedDailyHold() {
        assertControlStaysBehindHold(Settings.BLOCK_AUTHOR_BUTTON, "Block this creator");
    }

    private void assertControlStaysBehindHold(BooleanSetting setting, String description) {
        ReflectionHelpers.callStaticMethod(SessionBudget.class, "awaitWritesForTests");
        String oldState = Settings.SESSION_BUDGET_STATE.get();
        int oldVideos = Settings.SESSION_BUDGET_VIDEOS.get();
        int oldMinutes = Settings.SESSION_BUDGET_MINUTES.get();
        boolean oldLock = Settings.SESSION_BUDGET_LOCK.get();
        WeakReference<View> oldHome = ReflectionHelpers.getStaticField(FeedVisibility.class, "homeTabReference");
        try {
            Settings.SESSION_BUDGET_STATE.save("");
            Settings.SESSION_BUDGET_VIDEOS.save(1);
            Settings.SESSION_BUDGET_MINUTES.save(0);
            Settings.SESSION_BUDGET_LOCK.save(true);
            ReflectionHelpers.callStaticMethod(SessionBudget.class, "resetForTests");
            showSettings(false, false);
            bind("held-video");
            ViewGroup root = activity.findViewById(android.R.id.content);
            View home = new View(activity);
            root.addView(home, new FrameLayout.LayoutParams(96, 100, Gravity.BOTTOM));
            home.setSelected(true);
            // TikTok's tab resource is absent from the test app; seed the native view lookup only.
            ReflectionHelpers.setStaticField(FeedVisibility.class, "homeTabReference", new WeakReference<>(home));
            layoutRoot(root);
            // The real author selection already counts this video and claims its notice.
            assertTrue("the native-shaped bind did not start its daily hold", SessionBudget.lockedToday());
            SessionLockOverlay.sync();
            View panel = (View) button("Open the feed anyway").getParent();
            assertEquals(View.VISIBLE, panel.getVisibility());

            home.setSelected(false);
            SessionLockOverlay.sync();
            assertEquals("the retained hold should leave Profile usable", View.GONE, panel.getVisibility());
            click(setting);
            View control = button(description);
            assertNotNull("the first settings row did not install its control", control);
            assertTrue("the regression requires controls added after the retained panel",
                    root.indexOfChild(control) > root.indexOfChild(panel));

            home.setSelected(true);
            SessionLockOverlay.sync();
            layoutRoot(root);
            root.getViewTreeObserver().dispatchOnGlobalLayout();
            layoutRoot(root);
            assertSame("returning Home replaced the retained panel", panel,
                    button("Open the feed anyway").getParent());
            AtomicInteger controlTaps = new AtomicInteger();
            AtomicInteger panelDowns = new AtomicInteger();
            control.setOnClickListener(view -> controlTaps.incrementAndGet());
            panel.setOnTouchListener((view, event) -> {
                if (event.getActionMasked() == MotionEvent.ACTION_DOWN) panelDowns.incrementAndGet();
                return false;
            });
            FrameLayout.LayoutParams position = (FrameLayout.LayoutParams) control.getLayoutParams();
            float x = position.leftMargin + position.width / 2f;
            float y = position.topMargin + position.height / 2f;
            MotionEvent down = MotionEvent.obtain(10, 10, MotionEvent.ACTION_DOWN, x, y, 0);
            MotionEvent up = MotionEvent.obtain(10, 30, MotionEvent.ACTION_UP, x, y, 0);
            try {
                assertTrue(root.dispatchTouchEvent(down));
                assertTrue(root.dispatchTouchEvent(up));
            } finally {
                down.recycle();
                up.recycle();
            }
            idle();
            assertEquals("the new control received a tap through the daily hold", 0, controlTaps.get());
            assertEquals("the retained hold did not receive the touch", 1, panelDowns.get());
            assertEquals("the new control was drawn over the held video", View.GONE, control.getVisibility());
            assertTrue(SessionBudget.isLocked());
        } finally {
            ReflectionHelpers.callStaticMethod(SessionBudget.class, "awaitWritesForTests");
            Settings.SESSION_BUDGET_STATE.save("");
            ReflectionHelpers.callStaticMethod(SessionBudget.class, "resetForTests");
            SessionLockOverlay.sync();
            Settings.SESSION_BUDGET_STATE.save(oldState);
            Settings.SESSION_BUDGET_VIDEOS.save(oldVideos);
            Settings.SESSION_BUDGET_MINUTES.save(oldMinutes);
            Settings.SESSION_BUDGET_LOCK.save(oldLock);
            ReflectionHelpers.callStaticMethod(SessionBudget.class, "resetForTests");
            ReflectionHelpers.setStaticField(FeedVisibility.class, "homeTabReference", oldHome);
        }
    }

    private static void layoutRoot(View root) {
        root.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 1080, 1920);
        idle();
    }

    private void showSettings(boolean block, boolean feedback) {
        Settings.BLOCK_AUTHOR_BUTTON.save(block);
        Settings.NOT_INTERESTED_BUTTON.save(feedback);
        fragment = new TikTokPreferenceFragment();
        Bundle arguments = new Bundle();
        arguments.putString("morphe_settings_section", "FEED_FILTER");
        fragment.setArguments(arguments);
        activity.getFragmentManager().beginTransaction()
                .replace(android.R.id.content, fragment).commit();
        activity.getFragmentManager().executePendingTransactions();
        View decor = activity.getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 1080, 1920);
        idle();
    }

    private void bind(String id) {
        BlockAuthorPatch.setCurrentVideoParams(new Params(id));
        BlockAuthorPatch.setPlayingAweme(id);
        idle();
        assertNotNull("the native-shaped bind did not select an author", CurrentVideoAuthor.get());
        assertEquals(id, CurrentVideoAuthor.get().awemeId);
    }

    private void click(BooleanSetting setting) {
        ListView list = fragment.getView().findViewById(android.R.id.list);
        for (int i = 0; i < list.getCount(); i++) {
            Preference row = (Preference) list.getItemAtPosition(i);
            if (setting.key.equals(row.getKey())) {
                assertTrue(list.performItemClick(list.getAdapter().getView(i, null, list),
                        i, list.getItemIdAtPosition(i)));
                idle();
                return;
            }
        }
        throw new AssertionError("The settings page did not install " + setting.key);
    }

    private void assertVisible(String description) {
        View view = button(description);
        assertNotNull("the settings row did not attach " + description, view);
        assertEquals(description, View.VISIBLE, view.getVisibility());
    }

    private void assertNoControls() {
        for (String description : new String[] {"Block this creator", "Hide this creator on this phone",
                "Block this sound", "Not interested in this video"}) {
            assertNull("the last switch left " + description + " attached", button(description));
        }
    }

    private View button(String description) {
        return find(activity.findViewById(android.R.id.content), description);
    }

    private static View find(View view, String description) {
        if (description.contentEquals(view.getContentDescription() == null ? "" : view.getContentDescription())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View result = find(group.getChildAt(i), description);
                if (result != null) return result;
            }
        }
        return null;
    }

    private static void idle() { Shadows.shadowOf(Looper.getMainLooper()).idle(); }

    public static final class Params {
        private final Aweme aweme;
        Params(String id) { aweme = new Aweme(id); }
        public Aweme getAweme() { return aweme; }
    }

    public static final class Aweme {
        private final String id;
        Aweme(String id) { this.id = id; }
        public String getAid() { return id; }
        public User getAuthor() { return new User(); }
        public Music getMusic() { return new Music(); }
    }

    public static final class Music {
        public String getId() { return "sound-1"; }
        public String getTitle() { return "A sound"; }
        public String getAuthorName() { return "An artist"; }
    }

    public static final class User {
        public String getUid() { return "123"; }
        public String getSecUid() { return "sec123"; }
        public String getUniqueId() { return "natgeo"; }
    }
}
