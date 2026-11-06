/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.shared.settings.preference.LogBufferManager;

/**
 * The one list the settings screen and the diagnostic report read to say what Pause turns off
 * and what it can't reach. It has to cover every switch, every patch and every status flag, or
 * one of them goes unmentioned.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PatchFamilyTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.staysWhilePausedForTests = null;
        PatchFamily.capabilitiesForTests = null;
        PauseForTests.resume();
        for (BooleanSetting setting : PausedHooksTest.settingsSwitches()) setting.resetToDefault();
        HookStatus.clear();
    }

    /**
     * A switch is a family's, or the settings entry's own (the release check), and never both: a
     * switch in neither list goes unmentioned by the screen and the tests that hold Pause to it.
     */
    @Test
    public void everySwitchBelongsToExactlyOneFamily() {
        Map<BooleanSetting, String> owners = new HashMap<>();
        for (PatchFamily family : PatchFamily.values()) {
            for (BooleanSetting setting : family.switches) {
                String earlier = owners.put(setting, family.name());
                assertNull(setting.key + " belongs to " + earlier + " and to " + family, earlier);
            }
        }
        for (BooleanSetting setting : PatchFamily.ENTRY_SWITCHES) {
            String earlier = owners.put(setting, "the settings entry");
            assertNull(setting.key + " belongs to " + earlier + " and to the settings entry", earlier);
        }
        assertEquals(new HashSet<>(PausedHooksTest.settingsSwitches()), owners.keySet());
        assertTrue("the release check is the settings entry's own",
                PatchFamily.ENTRY_SWITCHES.contains(Settings.CHECK_FOR_RELEASES));
    }

    @Test
    public void optionalNudgesHaveIndependentLiveSwitchesAndCoverage() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_BLOG_NOTIFICATION_REMINDERS, PatchFamily.HIDE_GIFT_MESSAGE_POPUPS);
        PatchFamily.inBuildForTests = build;
        assertFalse(Settings.HIDE_BLOG_NOTIFICATION_REMINDERS.defaultValue);
        assertFalse(Settings.HIDE_GIFT_MESSAGE_POPUPS.defaultValue);
        assertTrue(PatchFamily.INTERFACE_PAGE.containsAll(build));
        assertEquals(EnumSet.of(PatchFamily.Capability.BLOG_NOTIFICATION_REMINDER),
                PatchFamily.HIDE_BLOG_NOTIFICATION_REMINDERS.expectedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.GIFT_MESSAGE_POPUP),
                PatchFamily.HIDE_GIFT_MESSAGE_POPUPS.expectedCapabilities());
        Settings.HIDE_BLOG_NOTIFICATION_REMINDERS.save(true);
        Settings.HIDE_GIFT_MESSAGE_POPUPS.save(false);
        List<String> report = PatchFamily.reportLines(build, false);
        assertTrue(report.toString(), report.contains("Hide blog notification reminders: on (hushtumblr_hide_blog_notification_reminders=on)"));
        assertTrue(report.toString(), report.contains("Hide gift purchase popups: disabled by its switch (hushtumblr_hide_gift_message_popups=off)"));
    }

    @Test
    public void everyStatusFlagBelongsToExactlyOneFamily() {
        Set<String> flags = new TreeSet<>();
        for (Method method : SettingsStatus.class.getDeclaredMethods()) {
            int modifiers = method.getModifiers();
            if (Modifier.isPublic(modifiers) && Modifier.isStatic(modifiers)
                    && method.getReturnType() == boolean.class && method.getParameterCount() == 0) {
                flags.add(method.getName());
            }
        }
        Set<String> named = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) {
            assertTrue("two families share " + family.statusMethod, named.add(family.statusMethod));
            for (PatchFamily.Capability capability : family.expectedCapabilities()) {
                assertEquals("a target belongs to the wrong family", family, capability.family);
                assertTrue("two targets share " + capability.statusMethod, named.add(capability.statusMethod));
            }
        }
        assertEquals(flags, named);
    }

    @Test
    public void capabilityListsAreImmutableBuildFactsIndependentOfSavedSwitchesAndPause() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.ADVERTISING_ID);
        Set<PatchFamily.Capability> advertisingId = EnumSet.of(PatchFamily.Capability.ADVERTISING_ID);
        assertEquals(advertisingId, PatchFamily.HIDE_ADVERTISING_ID.expectedCapabilities());
        assertEquals(advertisingId, PatchFamily.HIDE_ADVERTISING_ID.installedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.FIREBASE_CERTIFICATE),
                PatchFamily.FIX_PUSH_NOTIFICATIONS.expectedCapabilities());
        assertTrue(PatchFamily.FIX_PUSH_NOTIFICATIONS.installedCapabilities().isEmpty());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADVERTISING_ID.expectedCapabilities().clear());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADVERTISING_ID.installedCapabilities().clear());

        Settings.HIDE_ADVERTISING_ID.save(false);
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals(advertisingId, PatchFamily.HIDE_ADVERTISING_ID.installedCapabilities());
        assertTrue(PatchFamily.FIX_PUSH_NOTIFICATIONS.installedCapabilities().isEmpty());
        assertEquals("capabilities must never become saved settings", 0, SettingsStatus.class.getDeclaredFields().length);
    }

    /** The names are Morphe Manager's, so a report and the patch list say the same thing. */
    @Test
    public void everyPatchButTheSettingsEntryIsAFamily() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        Set<String> listed = new TreeSet<>();
        for (int i = 0; i < patches.length(); i++) listed.add(patches.getJSONObject(i).getString("name"));
        assertTrue("the settings entry left the patch list", listed.remove("HushTumblr settings"));

        Set<String> families = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) families.add(family.patchName);
        assertEquals(listed, families);
    }

    @Test
    public void aPatchWithNoSwitchSaysWhatOfItStaysIn() {
        for (PatchFamily family : PatchFamily.values()) {
            if (family.switches.isEmpty()) {
                assertNotNull(family.patchName + " has no switch, so Pause can't reach it", family.staysWhilePaused);
            }
        }
    }

    /**
     * Firebase's and Google Analytics' manifest flags stay set whatever the switch for Tumblr's own
     * tracking flags says: the stays row and the report name them with the switch on, off and paused.
     */
    @Test
    public void firebaseManifestDeactivationIsDisclosedWithAnalyticsOnOffAndPaused() {
        PatchFamily family = PatchFamily.DISABLE_ANALYTICS;
        Set<PatchFamily> build = EnumSet.of(family);
        String permanent = "Firebase and Google Analytics collection is turned off";
        String summary = permanent + " (" + L10n.isolate("Disable analytics")
                + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                + "and leave out that patch.";
        assertEquals("Disable analytics", family.patchName);
        assertEquals("disableAnalytics", family.statusMethod);
        assertEquals(permanent, family.staysWhilePaused);
        assertEquals(Collections.singletonList(Settings.DISABLE_ANALYTICS), family.switches);
        assertEquals(EnumSet.of(PatchFamily.Capability.ANALYTICS_FLAGS, PatchFamily.Capability.LIVERAMP_STARTUP),
                family.expectedCapabilities());
        assertTrue("the Privacy page draws it", PatchFamily.PRIVACY_PAGE.contains(family));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(build));
        // Every other family but the two manifest-only ones, which have patch-time edits of their own.
        Set<PatchFamily> everyOther = EnumSet.allOf(PatchFamily.class);
        everyOther.remove(PatchFamily.REMOVE_AD_TRACKING_PERMISSIONS);
        everyOther.remove(PatchFamily.SPOOF_SIGNATURE);
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(everyOther));
        Set<PatchFamily> withoutAnalytics = EnumSet.copyOf(everyOther);
        withoutAnalytics.remove(PatchFamily.DISABLE_ANALYTICS);
        assertNull(PatchFamily.staysWhilePausedSummary(withoutAnalytics));

        Settings.DISABLE_ANALYTICS.save(true);
        assertEquals("Disable analytics: on (hushtumblr_disable_analytics=on); stays in while paused: "
                + permanent, PatchFamily.reportLines(build, false).get(0));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertFalse(Settings.DISABLE_ANALYTICS.get());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
        assertEquals("Disable analytics: disabled while paused (saved hushtumblr_disable_analytics=on); "
                + "stays in while paused: " + permanent, PatchFamily.reportLines(build, true).get(0));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(build));

        PauseForTests.resume();
        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals("Disable analytics: disabled by its switch (hushtumblr_disable_analytics=off); "
                + "stays in while paused: " + permanent, PatchFamily.reportLines(build, false).get(0));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(build));
    }

    /**
     * The removed ad permissions are a manifest edit with no switch: the stays row and the report
     * name it alone and beside Analytics, whatever Pause and the other switches say.
     */
    @Test
    public void removedAdTrackingPermissionsAreDisclosedWithNoSwitch() {
        PatchFamily family = PatchFamily.REMOVE_AD_TRACKING_PERMISSIONS;
        String permanent = "Tumblr's access to the ad ID and Android's ad services is removed";
        assertEquals("Remove ad tracking permissions", family.patchName);
        assertEquals("removeAdTrackingPermissions", family.statusMethod);
        assertEquals(permanent, family.staysWhilePaused);
        assertTrue("no switch can turn it off", family.switches.isEmpty());
        assertTrue("it has no separately recorded targets", family.expectedCapabilities().isEmpty());
        assertTrue("the Privacy page draws it", PatchFamily.PRIVACY_PAGE.contains(family));

        Set<PatchFamily> build = EnumSet.of(family);
        String alone = permanent + " (" + L10n.isolate("Remove ad tracking permissions")
                + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                + "and leave out that patch.";
        assertEquals(alone, PatchFamily.staysWhilePausedSummary(build));
        String both = "Firebase and Google Analytics collection is turned off (" + L10n.isolate("Disable analytics")
                + ") and " + permanent + " (" + L10n.isolate("Remove ad tracking permissions")
                + "). They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                + "again and leave out the patch in brackets after it.";
        assertEquals(both, PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.DISABLE_ANALYTICS, family)));
        assertEquals(both, PatchFamily.staysWhilePausedSummary(EnumSet.complementOf(EnumSet.of(PatchFamily.SPOOF_SIGNATURE))));

        String line = "Remove ad tracking permissions: no switch, stays in while paused: " + permanent;
        assertEquals(Collections.singletonList(line), PatchFamily.reportLines(build, false).subList(0, 1));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals(line, PatchFamily.reportLines(build, true).get(0));
        assertEquals(line, PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true).stream()
                .filter(text -> text.startsWith("Remove ad tracking permissions:")).findFirst().orElse(null));
        assertFalse(PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true).stream()
                .anyMatch(text -> text.startsWith("Remove ad tracking permissions coverage")));
    }

    /**
     * The signature spoofing metadata is a manifest edit with no switch too: the stays row and the
     * report name it alone and beside the other two, whatever Pause says.
     */
    @Test
    public void spoofedSignatureMetadataIsDisclosedWithNoSwitch() {
        PatchFamily family = PatchFamily.SPOOF_SIGNATURE;
        String permanent = "Tumblr's original signature is added to the app";
        assertEquals("Spoof signature for Google sign-in", family.patchName);
        assertEquals("spoofSignature", family.statusMethod);
        assertEquals(permanent, family.staysWhilePaused);
        assertTrue("no switch can turn it off", family.switches.isEmpty());
        assertTrue("it has no separately recorded targets", family.expectedCapabilities().isEmpty());
        assertTrue("the Privacy page draws it", PatchFamily.PRIVACY_PAGE.contains(family));

        Set<PatchFamily> build = EnumSet.of(family);
        assertEquals(permanent + " (" + L10n.isolate("Spoof signature for Google sign-in")
                + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                + "and leave out that patch.", PatchFamily.staysWhilePausedSummary(build));
        String all = L10n.join(Arrays.asList(
                "Firebase and Google Analytics collection is turned off (" + L10n.isolate("Disable analytics") + ")",
                "Tumblr's access to the ad ID and Android's ad services is removed ("
                        + L10n.isolate("Remove ad tracking permissions") + ")",
                permanent + " (" + L10n.isolate("Spoof signature for Google sign-in") + ")"))
                + ". They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                + "again and leave out the patch in brackets after it.";
        assertEquals(all, PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class)));

        String line = "Spoof signature for Google sign-in: no switch, stays in while paused: " + permanent;
        assertEquals(Collections.singletonList(line), PatchFamily.reportLines(build, false).subList(0, 1));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals(line, PatchFamily.reportLines(build, true).get(0));
        assertFalse(PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true).stream()
                .anyMatch(text -> text.startsWith("Spoof signature for Google sign-in coverage")));
    }

    /** Synthetic exceptions keep singular and plural disclosure wording covered. */
    @Test
    public void theStaysRowNamesWhatPauseCantReach() {
        assertNull("the advertising ID and push notification hooks have no permanent patch-time behavior",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID,
                        PatchFamily.FIX_PUSH_NOTIFICATIONS)));

        // Each item names the patch Morphe Manager lists it under, so the reader knows which one
        // to leave out.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADVERTISING_ID,
                "the advertising ID cache cleared when you patched");
        assertEquals("The advertising ID cache cleared when you patched (" + L10n.isolate("Hide advertising ID")
                        + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                        + "and leave out that patch.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID)));

        Map<PatchFamily, String> two = new LinkedHashMap<>();
        two.put(PatchFamily.HIDE_ADVERTISING_ID, "the advertising ID cache cleared when you patched");
        two.put(PatchFamily.FIX_PUSH_NOTIFICATIONS, "the certificate override set when you patched");
        PatchFamily.staysWhilePausedForTests = two;
        assertEquals("The advertising ID cache cleared when you patched (" + L10n.isolate("Hide advertising ID")
                        + ") and the certificate override set when you patched ("
                        + L10n.isolate("Fix push notifications")
                        + "). They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                        + "again and leave out the patch in brackets after it.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID,
                        PatchFamily.FIX_PUSH_NOTIFICATIONS)));

        String everything = PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class));
        assertTrue(everything, everything.contains("Firebase and Google Analytics collection is turned off ("
                + L10n.isolate("Disable analytics") + ")"));
        assertTrue(everything, everything.contains("Tumblr's access to the ad ID and Android's ad services is removed ("
                + L10n.isolate("Remove ad tracking permissions") + ")"));
        assertTrue(everything, everything.contains("Tumblr's original signature is added to the app ("
                + L10n.isolate("Spoof signature for Google sign-in") + ")"));
        for (Map.Entry<PatchFamily, String> entry : two.entrySet()) {
            assertTrue(entry.getKey().patchName + " is missing from: " + everything,
                    everything.toLowerCase().contains(entry.getValue().toLowerCase()));
            assertTrue(entry.getKey().patchName + " isn't named in: " + everything,
                    everything.contains("(" + L10n.isolate(entry.getKey().patchName) + ")"));
        }
    }

    @Test
    public void theReportSaysWhatASwitchRunsAndWhatStaysIn() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID, PatchFamily.FIX_PUSH_NOTIFICATIONS);
        PatchFamily.inBuildForTests = build;
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);

        List<String> running = PatchFamily.reportLines(build, false);
        assertEquals(Arrays.asList(
                "Hide advertising ID: on (hushtumblr_hide_ad_id=on)",
                "Fix push notifications: disabled by its switch (hushtumblr_fix_push_notifications=off)"),
                running.subList(0, 2));
        assertEquals(Arrays.asList(
                "Hide advertising ID coverage: Hide advertising ID",
                "Fix push notifications coverage: Fix push notifications"),
                coverageLines(running));
        Set<String> absent = new HashSet<>(Arrays.asList(PatchFamily.reportLines(
                        EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID), false).stream()
                .filter(line -> line.startsWith("not in this build: ")).findFirst().orElseThrow(AssertionError::new)
                .substring("not in this build: ".length()).split(", ")));
        Set<String> expectedAbsent = Arrays.stream(PatchFamily.values())
                .filter(family -> family != PatchFamily.HIDE_ADVERTISING_ID).map(family -> family.patchName)
                .collect(Collectors.toSet());
        assertEquals(expectedAbsent, absent);

        // A simulated permanent change remains disclosed alongside its runtime switch.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADVERTISING_ID,
                "the advertising ID cache cleared when you patched");
        assertEquals("Hide advertising ID: on (hushtumblr_hide_ad_id=on); stays in while paused: "
                        + "the advertising ID cache cleared when you patched",
                PatchFamily.reportLines(build, false).get(0));

        List<String> paused = PatchFamily.reportLines(build, true);
        assertEquals("Hide advertising ID: disabled while paused (saved hushtumblr_hide_ad_id=on); stays in while "
                + "paused: the advertising ID cache cleared when you patched", paused.get(0));
        assertEquals("Fix push notifications: disabled while paused (saved hushtumblr_fix_push_notifications=off)",
                paused.get(1));
        assertEquals("Pause must keep patch-time coverage facts", coverageLines(running), coverageLines(paused));
    }

    @Test
    public void dependentOptionsCannotReportAFilterOnWhenItsMasterIsOff() {
        Settings.HIDE_REBLOGS.save(false);
        Settings.KEEP_TAGGED_REBLOGS.save(true);
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
        Settings.HIDE_POSTS_WITH_WORDS.save(false);
        for (BooleanSetting scope : Arrays.asList(Settings.WORDS_CURRENT_TEXT, Settings.WORDS_REBLOG_TRAIL,
                Settings.WORDS_TAGS, Settings.WORDS_SUMMARY)) scope.save(true);
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_REBLOGS, PatchFamily.HIDE_POSTS_WITH_WORDS);
        List<String> off = PatchFamily.reportLines(build, false);
        assertEquals("Hide reblogs: disabled by its switch (hushtumblr_hide_reblogs=off, hushtumblr_keep_tagged_reblogs=on, "
                + "hushtumblr_keep_reblogs_with_content=on)", off.get(0));
        assertEquals("Hide posts with these words: disabled by its switch (hushtumblr_hide_posts_with_words=off, "
                + "hushtumblr_words_current_text=on, hushtumblr_words_reblog_trail=on, hushtumblr_words_tags=on, "
                + "hushtumblr_words_summary=on)", off.get(1));
        Settings.HIDE_REBLOGS.save(true);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        List<String> on = PatchFamily.reportLines(build, false);
        assertTrue(on.get(0), on.get(0).startsWith("Hide reblogs: on ("));
        assertTrue(on.get(1), on.get(1).startsWith("Hide posts with these words: on ("));
        List<String> paused = PatchFamily.reportLines(build, true);
        for (int i = 0; i < 2; i++) assertEquals(on.get(i).replace(": on (", ": disabled while paused (saved "), paused.get(i));
        assertTrue(Settings.KEEP_TAGGED_REBLOGS.savedValue());
        assertTrue(Settings.KEEP_REBLOGS_WITH_CONTENT.savedValue());
        assertTrue(Settings.WORDS_REBLOG_TRAIL.savedValue());
    }

    /** Keep Blaze posts is an option of Hide ads: no patch of its own, and on alone it doesn't turn Hide ads on. */
    @Test
    public void keepBlazePostsCannotReportHideAdsOn() {
        assertEquals(Arrays.asList(Settings.HIDE_ADS, Settings.KEEP_BLAZE_POSTS), PatchFamily.HIDE_ADS.switches);
        assertEquals(Collections.singletonList(Settings.HIDE_ADS), PatchFamily.HIDE_ADS.enablers());
        Settings.HIDE_ADS.save(false);
        Settings.KEEP_BLAZE_POSTS.save(true);
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS);
        assertEquals("Hide ads: disabled by its switch (hushtumblr_hide_ads=off, hushtumblr_keep_blaze_posts=on)",
                PatchFamily.reportLines(build, false).get(0));
        Settings.HIDE_ADS.save(true);
        assertTrue(PatchFamily.reportLines(build, false).get(0).startsWith("Hide ads: on ("));
    }

    /** The reblog exceptions are options of Hide reblogs: no patch, status flag or hook of their own. */
    @Test
    public void theReblogExceptionsAddNoPatchOrHook() throws Exception {
        assertEquals(Arrays.asList(Settings.HIDE_REBLOGS, Settings.KEEP_TAGGED_REBLOGS, Settings.KEEP_REBLOGS_WITH_CONTENT),
                PatchFamily.HIDE_REBLOGS.switches);
        assertEquals(EnumSet.of(PatchFamily.Capability.REBLOG_POSTS), PatchFamily.HIDE_REBLOGS.expectedCapabilities());
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        assertEquals("an option of a patch isn't a patch", patches.length() - 1, PatchFamily.values().length);
    }

    @Test
    public void partialCoverageNamesEveryMissingTargetInTheReportWhileOffAndPaused() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID, PatchFamily.FIX_PUSH_NOTIFICATIONS);
        PatchFamily.inBuildForTests = build;
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.ADVERTISING_ID);
        List<String> running = PatchFamily.reportLines(build, false);
        assertTrue(running.toString(), running.contains("Hide advertising ID coverage: Hide advertising ID"));
        assertTrue(running.toString(), running.contains("Fix push notifications coverage: none; missing: Fix push notifications"));
        Settings.HIDE_ADVERTISING_ID.save(false);
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        List<String> disabled = PatchFamily.reportLines(build, false);
        assertEquals(coverageLines(running), coverageLines(disabled));
        assertEquals(coverageLines(running), coverageLines(PatchFamily.reportLines(build, true)));

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        List<String> none = PatchFamily.reportLines(build, false);
        assertTrue(none.toString(), none.contains("Hide advertising ID coverage: none; missing: Hide advertising ID"));
        assertTrue(none.toString(), none.contains("Fix push notifications coverage: none; missing: Fix push notifications"));
    }

    /**
     * A paused export marks the Hook status lines of the families a switch runs, and only those.
     * registerDiagnostics() exempts a family with no switch, today Remove ad tracking permissions and
     * Spoof signature for Google sign-in: a pause changes nothing for either of them, so their lines
     * stay unmarked.
     */
    @Test
    public void aPausedExportMarksEveryFamilyASwitchRuns() {
        HookStatus.clear();
        PatchFamily.registerDiagnostics();
        for (PatchFamily family : PatchFamily.values()) HookStatus.invoked(family.patchName);

        List<String> lines = HookStatus.report(" (paused)");
        Set<PatchFamily> unswitched = EnumSet.noneOf(PatchFamily.class);
        for (PatchFamily family : PatchFamily.values()) {
            if (family.switches.isEmpty()) unswitched.add(family);
            String mark = family.switches.isEmpty() ? "" : " (paused)";
            assertTrue(String.join("\n", lines),
                    lines.contains(family.patchName + ": invoked 1, 0 found, 0 missing" + mark));
        }
        assertEquals(EnumSet.of(PatchFamily.REMOVE_AD_TRACKING_PERMISSIONS, PatchFamily.SPOOF_SIGNATURE), unswitched);
    }

    /** The section goes through the redactor like every other one, and has to come out whole. */
    @Test
    public void theExportCarriesTheSectionWhole() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        LogBufferManager.registerReportSection(PatchFamily.REPORT);
        // A paused process always makes a report, so nothing else has to go wrong first.
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("\n[PATCHES]\n"));
        assertTrue(report, report.contains("what was set when patching stays in"));
        for (String line : PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true)) {
            assertTrue("the export changed or lost \"" + line + "\":\n" + report, report.contains("\n" + line + "\n"));
        }
    }

    private static List<String> coverageLines(List<String> lines) {
        return lines.stream().filter(line -> line.contains(" coverage: ")).collect(Collectors.toList());
    }

    /** patches-list.json at the repository root, found from wherever Gradle runs the test. */
    private static File patchesList() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            File candidate = new File(dir, "patches-list.json");
            if (candidate.isFile()) return candidate;
        }
        throw new AssertionError("no patches-list.json above " + new File("").getAbsolutePath());
    }
}
