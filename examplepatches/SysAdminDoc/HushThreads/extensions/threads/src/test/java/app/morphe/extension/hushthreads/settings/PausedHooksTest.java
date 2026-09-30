/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.hushthreads.ads.FeedAds;
import app.morphe.extension.hushthreads.ads.ShadowFeedAds;
import app.morphe.extension.hushthreads.misc.Analytics;
import app.morphe.extension.hushthreads.misc.LinkCleaner;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * What Pause and safe mode promise: every hook a switch runs takes Threads' own path, and every
 * saved value stays as it is.
 *
 * <p>Each probe is one hook with its switch on. It must change what Threads does while HushThreads
 * runs, which is the control, and leave it alone while paused. A family that gains a switch
 * without a probe here fails the first test.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = ShadowFeedAds.class, instrumentedPackages = "app.morphe.extension.hushthreads.ads")
public class PausedHooksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** One hook with its switch on: true when it changed what Threads would have done. */
    interface Probe {
        boolean changedThreads();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : settingsSwitches()) setting.resetToDefault();
        ReleaseCheckForTests.forget();
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
        // A Threads start a day after the last try asks GitHub for the newest release.
        probes.put(Settings.CHECK_FOR_RELEASES, ReleaseCheckForTests::aStartAsksGitHub);
        return probes;
    }

    private static Map<PatchFamily, List<Probe>> probes() {
        Map<PatchFamily, List<Probe>> probes = new EnumMap<>(PatchFamily.class);
        // A feed page with a sponsored post in it comes back without the post.
        probes.put(PatchFamily.HIDE_ADS, Collections.singletonList(() -> {
            List<Object> page = Arrays.asList("a post", ShadowFeedAds.AD, "another post");
            return FeedAds.filter(page).size() != page.size();
        }));
        // A shared post link loses the tracking tags Threads added to it.
        probes.put(PatchFamily.SANITIZE_SHARING_LINKS, Collections.singletonList(() -> {
            String shared = "https://www.threads.com/@zuck/post/C8abc?xmt=AQGz&slof=1";
            return !shared.equals(LinkCleaner.sanitizeShared(shared));
        }));
        // The event log upload address Threads built is swapped for one that answers nothing.
        probes.put(PatchFamily.DISABLE_ANALYTICS, Collections.singletonList(() -> {
            String upload = "https://graph.threads.net/logging_client_events";
            return !upload.equals(Analytics.endpoint(upload));
        }));
        return probes;
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

    private static Set<PatchFamily> switched() {
        Set<PatchFamily> switched = EnumSet.noneOf(PatchFamily.class);
        for (PatchFamily family : PatchFamily.values()) {
            if (!family.switches.isEmpty()) switched.add(family);
        }
        return switched;
    }

    /** Adds a line to [wrong] for every probe that didn't answer [changes]. */
    private static void everyProbe(Map<PatchFamily, List<Probe>> probes, boolean changes, String when,
                                   List<String> wrong) {
        for (Map.Entry<PatchFamily, List<Probe>> entry : probes.entrySet()) {
            for (int i = 0; i < entry.getValue().size(); i++) {
                if (entry.getValue().get(i).changedThreads() != changes) {
                    wrong.add(entry.getKey().patchName + ", probe " + i + ", " + when
                            + (changes ? ": left Threads alone" : ": still changed Threads"));
                }
            }
        }
    }

    /** Adds a line to [wrong] for every entry probe that didn't answer [changes]. */
    private static void everyEntryProbe(Map<BooleanSetting, Probe> probes, boolean changes, String when,
                                        List<String> wrong) {
        for (Map.Entry<BooleanSetting, Probe> entry : probes.entrySet()) {
            if (entry.getValue().changedThreads() != changes) {
                wrong.add(entry.getKey().key + ", " + when + (changes ? ": left Threads alone" : ": still changed Threads"));
            }
        }
    }

    @Test
    public void everyHookASwitchRunsTakesThreadsOwnPathWhilePaused() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<PatchFamily, List<Probe>> probes = probes();
        assertEquals("every family with a switch needs a probe here", switched(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();
        assertEquals("every switch of the settings entry needs a probe here",
                new HashSet<>(PatchFamily.ENTRY_SWITCHES), entry.keySet());

        // Every hook is asked every time, so one run names every hook that broke the promise.
        List<String> wrong = new ArrayList<>();
        everyProbe(probes, true, "running", wrong);
        everyEntryProbe(entry, true, "running", wrong);

        for (HushThreadsPause.Reason why : new HushThreadsPause.Reason[]{
                HushThreadsPause.Reason.SWITCH, HushThreadsPause.Reason.CRASH_LOOP,
                HushThreadsPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            everyProbe(probes, false, "paused by " + why, wrong);
            everyEntryProbe(entry, false, "paused by " + why, wrong);
        }

        PauseForTests.resume();
        everyProbe(probes, true, "running again", wrong);
        everyEntryProbe(entry, true, "running again", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /** With its switch off, each hook leaves Threads alone too, so a probe can't pass by luck. */
    @Test
    public void everyHookLeavesThreadsAloneWithItsSwitchOff() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        List<String> wrong = new ArrayList<>();
        everyProbe(probes(), false, "switched off", wrong);
        everyEntryProbe(entryProbes(), false, "switched off", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /**
     * Threads can call a hook before its application's onCreate hands HushThreads the context,
     * from a thread it starts early, and again while setContext is still deciding whether this
     * start runs paused. Until both are done, every hook takes Threads' own path whatever is
     * saved (see Utils.settingsReady). This JVM's Setting class loaded with a context, so a hook
     * that reads its switch anyway answers on here and is named.
     */
    @Test
    public void untilTheSettingsAreReadyEveryHookTakesThreadsOwnPath() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<PatchFamily, List<Probe>> probes = probes();
        assertEquals("every family with a switch needs a probe here", switched(), probes.keySet());
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

        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
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
            for (HushThreadsPause.Reason why : HushThreadsPause.Reason.values()) {
                if (why == HushThreadsPause.Reason.NONE) continue;
                PauseForTests.pause(why);
                assertTrue("Debug logging answered off while paused by " + why, BaseSettings.DEBUG.get());
            }
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
    }
}
