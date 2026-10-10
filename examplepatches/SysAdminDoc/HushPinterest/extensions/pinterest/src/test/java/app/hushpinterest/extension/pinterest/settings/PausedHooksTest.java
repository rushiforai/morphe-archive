/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.net.Uri;
import android.view.View;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import app.hushpinterest.extension.pinterest.actions.BoardDownloads;
import app.hushpinterest.extension.pinterest.actions.ExternalBrowser;
import app.hushpinterest.extension.pinterest.actions.LongPressDownloadForTests;
import app.hushpinterest.extension.pinterest.actions.LongPressDownloadTest;
import app.hushpinterest.extension.pinterest.actions.PinDownloads;
import app.hushpinterest.extension.pinterest.actions.SystemShare;
import app.hushpinterest.extension.pinterest.ads.Ads;
import app.hushpinterest.extension.pinterest.ads.FeedFilter;
import app.hushpinterest.extension.pinterest.privacy.Analytics;
import app.hushpinterest.extension.pinterest.privacy.AdvertisingId;
import app.hushpinterest.extension.pinterest.privacy.LinkTracking;
import app.hushpinterest.extension.pinterest.ui.InterfaceControls;
import app.hushpinterest.extension.pinterest.ui.UiHooks;
import app.hushpinterest.extension.pinterest.ui.UiHooksForTests;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * What Pause and safe mode promise: every hook a switch runs takes Pinterest's own path, and every
 * saved value stays as it is.
 *
 * <p>Each probe is one hook with its switch on. It must change what Pinterest does while HushPinterest
 * runs, which is the control, and leave it alone while paused. A family that gains a switch
 * without a probe here fails the first test.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = LongPressDownloadTest.NativeMenu.class)
public class PausedHooksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int MEASURE_SPEC = View.MeasureSpec.makeMeasureSpec(300, View.MeasureSpec.AT_MOST);
    private static final String TRACKED_LINK = "https://www.pinterest.com/pin/123456/?utm_source=share&keep=1";
    private static final Map<String, Object> PIN = Map.of("id", "123456", "images", Map.of(
            "orig", Map.of("url", "https://i.pinimg.com/originals/pin.jpg")));
    /** A pin as a board's own page carries it: saved to board 4242. */
    private static final Map<String, Object> BOARD_PIN = Map.of("id", "654321", "images", Map.of(),
            "board", Map.of("id", "4242"));
    private enum Tab { CREATE, NOTIFICATIONS, SEARCH }
    private enum Source { PIN }
    private enum Task { TAG_APPSFLYER_INIT }

    /** Stands in for Pinterest's obfuscated Gson annotation: any annotation with a String value(). */
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    public @interface Json {
        String value();
    }

    /** A pin with the two fields the feed families read. */
    static final class ProbePin {
        @Json("is_promoted") Boolean promoted;
        @Json("ai_disclosures") List<Integer> aiDisclosures;
        @Json("is_shoppable") Boolean shoppable;
    }

    /** One hook with its switch on: true when it changed what Pinterest would have done. */
    interface Probe {
        boolean changedPinterest();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : settingsSwitches()) setting.resetToDefault();
        PatchFamily.capabilitiesForTests = null;
        PatchFamily.inBuildForTests = null;
        ReleaseCheckForTests.forget();
        Utils.setActivity(null);
        HookStatus.clear();
    }

    /**
     * The settings entry's own switches, which no family owns, one probe each, held to the same
     * promise as a family's: paused, or before the settings are ready, a start makes no request.
     */
    private static Map<BooleanSetting, Probe> entryProbes() {
        Map<BooleanSetting, Probe> probes = new LinkedHashMap<>();
        // Loads the check's own settings here, with the context, so a probe run without one reads
        // them rather than loading them.
        ReleaseCheck.Stored.CHECKED_AT.savedValue();
        // A Pinterest start a day after the last try asks GitHub for the newest release.
        probes.put(Settings.CHECK_FOR_RELEASES, ReleaseCheckForTests::aStartAsksGitHub);
        return probes;
    }

    /** A page of a promoted or labeled pin and a plain one: true when the filter took one out. */
    private static boolean filtersOut(ProbePin marked) {
        List<Object> page = new ArrayList<>(Arrays.asList(marked, new ProbePin()));
        return FeedFilter.filter(page).size() != page.size();
    }

    /** A save toast reaching the container: true when the hook drops it. */
    private static boolean dropsSaveToast() {
        UiHooksForTests.saveToast(StringBuilder.class);
        try {
            return UiHooks.hideSaveToast(new StringBuilder());
        } finally {
            UiHooksForTests.saveToast(null);
        }
    }

    /** A topic suggestion row Pinterest binds: true when the hook hid it. */
    private static boolean hidesTopicRow() {
        View row = new View(RuntimeEnvironment.getApplication());
        UiHooks.topicSuggestions(row);
        return row.getVisibility() == View.GONE;
    }

    /** A topic suggestion row Pinterest binds and then measures: true when the measure folded. */
    private static boolean foldsTopicRow() {
        View row = new View(RuntimeEnvironment.getApplication());
        UiHooks.topicSuggestions(row);
        return UiHooks.topicSuggestionsMeasureSpec(row, MEASURE_SPEC) != MEASURE_SPEC;
    }

    private static Map<BooleanSetting, List<Probe>> probes() {
        // Every hook is in this build, so the filter reads each family's switch.
        PatchFamily.capabilitiesForTests = EnumSet.allOf(PatchFamily.Capability.class);
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DISABLE_ANALYTICS, PatchFamily.HIDE_ADVERTISING_ID);
        Map<BooleanSetting, List<Probe>> probes = new LinkedHashMap<>();
        // A promoted pin leaves the page, and an ad-only view stays hidden and sizeless.
        probes.put(Settings.HIDE_ADS, Arrays.asList(
                () -> {
                    ProbePin ad = new ProbePin();
                    ad.promoted = true;
                    return filtersOut(ad);
                },
                () -> Ads.adViewVisibility(View.VISIBLE) != View.VISIBLE,
                Ads::skipGoogleAds,
                () -> Ads.adViewMeasureSpec(MEASURE_SPEC) != MEASURE_SPEC));
        // A pin Pinterest labels as AI-modified leaves the page.
        probes.put(Settings.HIDE_AI_PINS, Collections.singletonList(() -> {
            ProbePin labeled = new ProbePin();
            labeled.aiDisclosures = Collections.singletonList(1);
            return filtersOut(labeled);
        }));
        probes.put(Settings.HIDE_SHOPPING, Collections.singletonList(() -> {
            ProbePin product = new ProbePin();
            product.shoppable = true;
            return filtersOut(product);
        }));
        probes.put(Settings.DISABLE_ANALYTICS, Arrays.asList(Analytics::blockUpload,
                () -> Analytics.blockTask(Task.TAG_APPSFLYER_INIT), PausedHooksTest::quietsSdkConnection));
        probes.put(Settings.STRIP_LINK_TRACKING, Arrays.asList(
                () -> !TRACKED_LINK.equals(LinkTracking.cleanText(TRACKED_LINK).toString()),
                () -> !TRACKED_LINK.equals(LinkTracking.putStringExtra(new Intent(), Intent.EXTRA_TEXT,
                        TRACKED_LINK).getStringExtra(Intent.EXTRA_TEXT)),
                () -> !TRACKED_LINK.contentEquals(LinkTracking.putTextExtra(new Intent(), Intent.EXTRA_TEXT,
                        TRACKED_LINK).getCharSequenceExtra(Intent.EXTRA_TEXT)),
                () -> !TRACKED_LINK.contentEquals(LinkTracking.newPlainText("Pin link", TRACKED_LINK)
                        .getItemAt(0).getText())));
        probes.put(Settings.HIDE_ADVERTISING_ID, Arrays.asList(
                () -> !"real".equals(AdvertisingId.id("real")),
                () -> AdvertisingId.limitTracking(false)));
        probes.put(Settings.DOWNLOAD_PINS, Collections.singletonList(PausedHooksTest::queuesPinDownload));
        probes.put(Settings.DOWNLOAD_BOARD, Collections.singletonList(() -> BoardDownloads.record(Collections.singletonList(BOARD_PIN))));
        probes.put(Settings.LONG_PRESS_DOWNLOAD, Collections.singletonList(PausedHooksTest::addsLongPressDownload));
        probes.put(Settings.EXTERNAL_BROWSER, Collections.singletonList(() -> withActivity(activity -> {
            ResolveInfo browser = new ResolveInfo();
            browser.activityInfo = new ActivityInfo();
            browser.activityInfo.packageName = "com.example.browser";
            browser.activityInfo.name = "com.example.browser.BrowserActivity";
            browser.activityInfo.exported = true;
            Intent query = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/"))
                    .addCategory(Intent.CATEGORY_BROWSABLE);
            Shadows.shadowOf(activity.getPackageManager()).addResolveInfoForIntent(query, browser);
            boolean opened = ExternalBrowser.open("https://example.org/recipe?keep=1", PIN);
            Intent launched = Shadows.shadowOf(activity).getNextStartedActivity();
            assertEquals("browser result must match an actual launch", opened, launched != null);
            if (launched != null) {
                assertEquals("com.example.browser", launched.getPackage());
                assertEquals("https://example.org/recipe?keep=1", launched.getDataString());
            }
            return launched != null;
        })));
        probes.put(Settings.SYSTEM_SHARE, Collections.singletonList(() -> withActivity(activity -> {
            boolean opened = SystemShare.open(PIN, Source.PIN);
            Intent launched = Shadows.shadowOf(activity).getNextStartedActivity();
            assertEquals("share result must match an actual chooser", opened, launched != null);
            if (launched != null) {
                assertEquals(Intent.ACTION_CHOOSER, launched.getAction());
                Intent send = launched.getParcelableExtra(Intent.EXTRA_INTENT);
                assertEquals("https://www.pinterest.com/pin/123456/", send.getStringExtra(Intent.EXTRA_TEXT));
            }
            return launched != null;
        })));
        probes.put(Settings.HIDE_SCREENSHOT_SHARE, Collections.singletonList(UiHooks::hideScreenshotShare));
        probes.put(Settings.HIDE_SEARCH_HISTORY, Arrays.asList(
                () -> UiHooks.searchHistoryVisibility(View.INVISIBLE) != View.INVISIBLE,
                () -> UiHooks.searchHistoryMeasureSpec(MEASURE_SPEC) != MEASURE_SPEC));
        probes.put(Settings.HIDE_NAV_CREATE, Collections.singletonList(() -> hidesNavigation(Tab.CREATE)));
        probes.put(Settings.HIDE_NAV_NOTIFICATIONS, Collections.singletonList(() -> hidesNavigation(Tab.NOTIFICATIONS)));
        probes.put(Settings.HIDE_NAV_SEARCH, Collections.singletonList(() -> hidesNavigation(Tab.SEARCH)));
        probes.put(Settings.HIDE_HEADER_BUTTONS, Collections.singletonList(() -> {
            View header = namedView("end_container_icon_bt");
            InterfaceControls.headerButtons(header);
            return header.getVisibility() != View.INVISIBLE;
        }));
        probes.put(Settings.HIDE_PIN_MENU_COLLAGE, Collections.singletonList(() -> hidesMenuItem("overflow_menu_add_to_collage")));
        probes.put(Settings.HIDE_PIN_MENU_VISUAL_SEARCH, Collections.singletonList(() -> hidesMenuItem("contextmenu_visual_search_image")));
        probes.put(Settings.HIDE_PIN_MENU_PIN_BOOST, Collections.singletonList(() -> hidesMenuItem("overflow_menu_pin_boost")));
        probes.put(Settings.HIDE_COMMENTS, Arrays.asList(
                () -> UiHooks.commentsVisibility(View.INVISIBLE) != View.INVISIBLE,
                () -> UiHooks.commentsMeasureSpec(MEASURE_SPEC) != MEASURE_SPEC,
                () -> !UiHooks.commentsVisible(true)));
        probes.put(Settings.HIDE_TOPIC_SUGGESTIONS, Arrays.asList(PausedHooksTest::hidesTopicRow, PausedHooksTest::foldsTopicRow));
        probes.put(Settings.QUIET_EMAIL_REMINDER, Collections.singletonList(UiHooks::quietEmailReminder));
        probes.put(Settings.HIDE_SURVEY_PROMPTS, Arrays.asList(UiHooks::hideSurveyPrompts, UiHooks::hideSponsoredPolls));
        probes.put(Settings.HIDE_SAVE_TOASTS, Collections.singletonList(PausedHooksTest::dropsSaveToast));
        probes.put(Settings.ORIGINAL_IMAGES, Arrays.asList(UiHooks::originalImages, () -> {
            Set<String> sizes = new HashSet<>();
            UiHooks.imageSizes(sizes);
            return !sizes.isEmpty();
        }));
        probes.put(Settings.DISABLE_UPDATE_NAG, Collections.singletonList(UiHooks::disableUpdateNag));
        return probes;
    }

    private static boolean withActivity(Function<Activity, Boolean> action) {
        org.robolectric.android.controller.ActivityController<Activity> controller =
                Robolectric.buildActivity(Activity.class).setup();
        Utils.setActivity(controller.get());
        try { return action.apply(controller.get()); }
        finally {
            Utils.setActivity(null);
            controller.pause().stop().destroy();
        }
    }

    /**
     * The long-press button saves through Download pins, so it needs that switch on as well. When
     * a test has it off, the probe turns it on for its own run and puts it back.
     */
    private static boolean addsLongPressDownload() {
        boolean pins = Settings.DOWNLOAD_PINS.savedValue();
        if (!pins) Settings.DOWNLOAD_PINS.save(true);
        try {
            return LongPressDownloadForTests.addsDownloadButton();
        } finally {
            if (!pins) Settings.DOWNLOAD_PINS.save(false);
        }
    }

    /** Robolectric records the queued request without transferring data or opening a socket. */
    private static boolean queuesPinDownload() {
        return withActivity(activity -> {
            DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
            int before = Shadows.shadowOf(manager).getRequestCount();
            try {
                Method start = PinDownloads.class.getDeclaredMethod("start", Object.class, Context.class);
                start.setAccessible(true);
                boolean queued = (Boolean) start.invoke(null, PIN, activity);
                Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
                await.setAccessible(true);
                await.invoke(null);
                boolean changed = Shadows.shadowOf(manager).getRequestCount() != before;
                assertEquals("download result must match a queued media request", queued, changed);
                return changed;
            } catch (ReflectiveOperationException failure) {
                throw new AssertionError(failure);
            }
        });
    }

    private static boolean quietsSdkConnection() {
        try {
            URLConnection[] original = new URLConnection[1];
            URL url = new URL(null, "https://example.com/sdk-events", new URLStreamHandler() {
                @Override protected URLConnection openConnection(URL address) {
                    return original[0] = new URLConnection(address) {
                        @Override public void connect() {}
                    };
                }
            });
            URLConnection connection = Analytics.openConnection(url);
            return original[0] == null && connection != null;
        } catch (java.io.IOException failure) {
            throw new AssertionError(failure);
        }
    }

    private static boolean hidesNavigation(Tab tab) {
        View view = new View(RuntimeEnvironment.getApplication());
        view.setVisibility(View.INVISIBLE);
        InterfaceControls.bindNavigation(view, tab);
        return view.getVisibility() != View.INVISIBLE;
    }

    private static boolean hidesMenuItem(String resource) {
        View row = new View(RuntimeEnvironment.getApplication());
        row.setVisibility(View.INVISIBLE);
        InterfaceControls.pinMenuItem(row, resource);
        return row.getVisibility() != View.INVISIBLE;
    }

    /** Supplies a real header resource name without borrowing an ID from another application. */
    private static View namedView(String name) {
        Context context = RuntimeEnvironment.getApplication();
        Resources original = context.getResources();
        Resources resources = new Resources(context.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int id) { return name; }
        };
        View view = new View(context) {
            @Override public Resources getResources() { return resources; }
        };
        view.setId(1);
        view.setVisibility(View.INVISIBLE);
        return view;
    }

    /** Every switch the settings screen can show, read off the class so a new one can't hide. */
    static List<BooleanSetting> settingsSwitches() {
        List<BooleanSetting> switches = new ArrayList<>();
        for (Field field : Settings.class.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != BooleanSetting.class) continue;
            try {
                switches.add((BooleanSetting) field.get(null));
            } catch (IllegalAccessException unreadable) {
                throw new AssertionError(unreadable);
            }
        }
        return switches;
    }

    private static Set<BooleanSetting> familySwitches() {
        Set<BooleanSetting> switched = new HashSet<>();
        for (PatchFamily family : PatchFamily.values()) {
            switched.addAll(family.switches);
        }
        return switched;
    }

    /** Adds a line to [wrong] for every probe that didn't answer [changes]. */
    private static void everyProbe(Map<BooleanSetting, List<Probe>> probes, boolean changes, String when,
                                   List<String> wrong) {
        for (Map.Entry<BooleanSetting, List<Probe>> entry : probes.entrySet()) {
            for (int i = 0; i < entry.getValue().size(); i++) {
                if (entry.getValue().get(i).changedPinterest() != changes) {
                    wrong.add(entry.getKey().key + ", probe " + i + ", " + when
                            + (changes ? ": left Pinterest alone" : ": still changed Pinterest"));
                }
            }
        }
    }

    /** Adds a line to [wrong] for every entry probe that didn't answer [changes]. */
    private static void everyEntryProbe(Map<BooleanSetting, Probe> probes, boolean changes, String when,
                                        List<String> wrong) {
        for (Map.Entry<BooleanSetting, Probe> entry : probes.entrySet()) {
            if (entry.getValue().changedPinterest() != changes) {
                wrong.add(entry.getKey().key + ", " + when + (changes ? ": left Pinterest alone" : ": still changed Pinterest"));
            }
        }
    }

    @Test
    public void everyHookASwitchRunsTakesPinterestsOwnPathWhilePaused() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<BooleanSetting, List<Probe>> probes = probes();
        assertEquals("every family's switch needs a probe here", familySwitches(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();
        assertEquals("every switch of the settings entry needs a probe here",
                new HashSet<>(PatchFamily.ENTRY_SWITCHES), entry.keySet());

        // Every hook is asked every time, so one run names every hook that broke the promise.
        List<String> wrong = new ArrayList<>();
        everyProbe(probes, true, "running", wrong);
        everyEntryProbe(entry, true, "running", wrong);

        for (HushPinterestPause.Reason why : new HushPinterestPause.Reason[]{
                HushPinterestPause.Reason.SWITCH, HushPinterestPause.Reason.CRASH_LOOP,
                HushPinterestPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            everyProbe(probes, false, "paused by " + why, wrong);
            everyEntryProbe(entry, false, "paused by " + why, wrong);
        }

        PauseForTests.resume();
        everyProbe(probes, true, "running again", wrong);
        everyEntryProbe(entry, true, "running again", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /** With its switch off, each hook leaves Pinterest alone too, so a probe can't pass by luck. */
    @Test
    public void everyHookLeavesPinterestAloneWithItsSwitchOff() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        List<String> wrong = new ArrayList<>();
        everyProbe(probes(), false, "switched off", wrong);
        everyEntryProbe(entryProbes(), false, "switched off", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    @Test
    public void eachHookReadsItsOwnSwitchWhenEveryOtherSwitchIsOff() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        Map<BooleanSetting, List<Probe>> probes = probes();
        assertEquals("every family's switch needs a probe here", familySwitches(), probes.keySet());
        List<String> wrong = new ArrayList<>();
        for (Map.Entry<BooleanSetting, List<Probe>> entry : probes.entrySet()) {
            entry.getKey().save(true);
            everyProbe(Collections.singletonMap(entry.getKey(), entry.getValue()), true, "its switch alone is on", wrong);
            entry.getKey().save(false);
        }
        assertEquals(Collections.emptyList(), wrong);
    }

    /**
     * Pinterest can call a hook before its application's onCreate hands HushPinterest the context,
     * from a thread it starts early, and again while setContext is still deciding whether this
     * start runs paused. Until both are done, every hook takes Pinterest's own path whatever is
     * saved (see Utils.settingsReady). This JVM's Setting class loaded with a context, so a hook
     * that reads its switch anyway answers on here and is named.
     */
    @Test
    public void untilTheSettingsAreReadyEveryHookTakesPinterestsOwnPath() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<BooleanSetting, List<Probe>> probes = probes();
        assertEquals("every family's switch needs a probe here", familySwitches(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();

        List<String> wrong = new ArrayList<>();
        SettingsContextRule.withoutContext(() -> {
            everyProbe(probes, false, "before the context is set", wrong);
            everyEntryProbe(entry, false, "before the context is set", wrong);
        });
        // Safe mode on, as after three crashed starts: the context is set and the pause undecided.
        BaseSettings.SAFE_MODE.save(true);
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> {
                everyProbe(probes, false, "before the pause is decided", wrong);
                everyEntryProbe(entry, false, "before the pause is decided", wrong);
            });
        } finally {
            BaseSettings.SAFE_MODE.resetToDefault();
        }
        everyProbe(probes, true, "once they're ready", wrong);
        everyEntryProbe(entry, true, "once they're ready", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    @Test
    public void pausedEverySwitchAnswersOffAndKeepsWhatWasSaved() {
        List<BooleanSetting> switches = settingsSwitches();
        assertFalse("found no switches to check", switches.isEmpty());
        for (BooleanSetting setting : switches) setting.save(true);

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        for (BooleanSetting setting : switches) {
            assertFalse(setting.key + " answered on while paused", setting.get());
            assertTrue(setting.key + " lost what was saved", setting.savedValue());
        }

        PauseForTests.resume();
        for (BooleanSetting setting : switches) {
            assertTrue(setting.key + " stayed off after the pause ended", setting.get());
        }
    }

    /**
     * The Pause row and the paused card say Debug logging keeps working, which is how a paused
     * start gets logged for a report.
     */
    @Test
    public void debugLoggingKeepsWorkingWhilePaused() {
        BaseSettings.DEBUG.save(true);
        try {
            for (HushPinterestPause.Reason why : HushPinterestPause.Reason.values()) {
                if (why == HushPinterestPause.Reason.NONE) continue;
                PauseForTests.pause(why);
                assertTrue("Debug logging answered off while paused by " + why, BaseSettings.DEBUG.get());
            }
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
    }
}
