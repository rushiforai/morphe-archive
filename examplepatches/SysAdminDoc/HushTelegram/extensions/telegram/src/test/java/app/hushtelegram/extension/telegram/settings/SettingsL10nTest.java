/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Intent;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceGroup;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;

/**
 * What the settings screen shows, in each language the bundle carries and under the two
 * pseudo-locales. The screen is built with every patch in, once running and once for each reason
 * it can be paused, with its recovery page, its export dialog, the settings file's preview and
 * the toasts its rows raise.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsL10nTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Text that stays as it is in every language: the product's name and its source's address. */
    private static final Set<String> AS_IS = new LinkedHashSet<>(Arrays.asList(
            "HushTelegram", "github.com/SysAdminDoc/HushTelegram"));

    @Before
    public void everyPatchIn() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        // Another class may have left a bundle's own sentences set; this one reads the catalog's.
        LogBufferManager.clearedMessage = null;
        LogBufferManager.nothingToClearMessage = null;
        LogBufferManager.restoredMessage = null;
        LogBufferManager.nothingToRestoreMessage = null;
        LogBufferManager.restoreFailedMessage = null;
        LogBufferManager.copiedMessage = null;
    }

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.staysWhilePausedForTests = null;
        PatchFamily.capabilitiesForTests = null;
        HushTelegramPreferenceFragment.failNextInitialization = null;
        PauseForTests.resume();
        ShadowToast.reset();
    }

    /**
     * Under en-XA everything the catalog draws is bracketed and accented, so a plain English word
     * on the screen is one that never went through it. That is how an English label on a German
     * phone is found before a German phone finds it. Anywhere in a string, not only at its ends:
     * an English sentence set between two of the catalog's in the paused card passed a check
     * that looked at the first and last characters.
     */
    @Test
    @Config(qualifiers = "en-rXA")
    public void underEnXaEveryWordOnTheScreenComesFromTheCatalog() throws Exception {
        List<String> plain = new ArrayList<>();
        Set<String> shown = everythingShown();
        for (String text : shown) {
            if (AS_IS.contains(text)) continue;
            String outside = without(without(text, ISOLATE, POP_ISOLATE), '[', ']');
            if (LETTER.matcher(outside).find()) plain.add(text);
        }
        assertEquals("shown without going through the catalog: " + plain, 0, plain.size());
        assertTrue("the screen came out nearly empty: " + shown.size(), shown.size() > 60);
    }

    /** Under ar-XB every word the catalog draws is inside a right-to-left override. */
    @Test
    @Config(qualifiers = "ar-rXB-ldrtl")
    public void underArXbEveryWordOnTheScreenIsMirrored() throws Exception {
        List<String> plain = new ArrayList<>();
        for (String text : everythingShown()) {
            if (AS_IS.contains(text)) continue;
            String outside = without(without(text, ISOLATE, POP_ISOLATE), OVERRIDE, POP_OVERRIDE);
            if (LETTER.matcher(outside).find()) plain.add(text);
        }
        assertEquals("shown without going through the catalog: " + plain, 0, plain.size());
    }

    /** The partial-build sentence and each target label must pass through the catalog together. */
    @Test
    @Config(qualifiers = "en-rXA")
    public void partialAndMissingCoverageUseTheCatalogForEveryWord() {
        List<String> plain = new ArrayList<>();
        for (PatchFamily.Capability missing : PatchFamily.Capability.values()) {
            Set<PatchFamily.Capability> installed = EnumSet.allOf(PatchFamily.Capability.class);
            installed.remove(missing);
            PatchFamily.capabilitiesForTests = installed;
            String summary = missing.family.coverageSummary("");
            if (LETTER.matcher(without(summary, '[', ']')).find()) plain.add(summary);
        }
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        for (PatchFamily family : new PatchFamily[]{PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS}) {
            String summary = family.coverageSummary("");
            if (LETTER.matcher(without(summary, '[', ']')).find()) plain.add(summary);
        }
        assertEquals("coverage shown without going through the catalog: " + plain, Collections.emptyList(), plain);
    }

    /** The check above has to see English set between two of the catalog's own strings. */
    @Test
    public void thePseudoLocaleCheckFindsEnglishInTheMiddle() {
        String isolated = ISOLATE + "0.1.2" + POP_ISOLATE;
        assertFalse(LETTER.matcher(without(without("[" + isolated + " one] [two]", ISOLATE, POP_ISOLATE), '[', ']')).find());
        assertTrue(LETTER.matcher(without("[one] Your feed is unfiltered. [two]", '[', ']')).find());
        assertTrue(LETTER.matcher(without("[[nested] one] plain", '[', ']')).find());
        assertTrue(LETTER.matcher(without(OVERRIDE + "eno" + POP_OVERRIDE + " plain", OVERRIDE, POP_OVERRIDE)).find());
    }

    private static final char ISOLATE = (char) 0x2068;
    private static final char POP_ISOLATE = (char) 0x2069;
    private static final char OVERRIDE = (char) 0x202E;
    private static final char POP_OVERRIDE = (char) 0x202C;
    private static final java.util.regex.Pattern LETTER = java.util.regex.Pattern.compile("[A-Za-z]");

    /** [text] with every span from [open] to its [close] taken out, nested spans included. */
    private static String without(String text, char open, char close) {
        StringBuilder outside = new StringBuilder();
        int depth = 0;
        for (int index = 0; index < text.length(); index++) {
            char at = text.charAt(index);
            if (at == open) {
                depth++;
            } else if (at == close && depth > 0) {
                depth--;
            } else if (depth == 0) {
                outside.append(at);
            }
        }
        return outside.toString();
    }

    /**
     * In each shipped language, nothing the table translates is left in English. Words a language
     * spells the same way can't tell the two apart, so only rows that change are evidence.
     */
    @Test
    public void inEveryShippedLanguageNothingOnTheScreenStaysEnglish() throws Exception {
        String[][] languages = {{"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        for (String[] language : languages) {
            RuntimeEnvironment.setQualifiers("+" + language[0]);
            Map<String, String> table = TranslationsForTests.of(language[1]);
            Set<String> shown = everythingShown();
            List<String> english = new ArrayList<>();
            for (String text : shown) {
                String translated = table.get(text);
                if (translated != null && !translated.equals(text)) english.add(text);
            }
            assertEquals(language[0] + " still shows English: " + english, 0, english.size());
            assertTrue(language[0] + " doesn't show its own title for the first switch",
                    shown.contains(table.get("Hide ads")));
        }
    }

    /**
     * Telegram can set its own language on the application, and its activities can carry another.
     * The screen, its dialogs and their buttons all follow the application: with it in German
     * and the activity in English nothing the table translates is left English, and the other
     * way round nothing German shows. Built from the activity, the Back label, the export
     * dialog and Android's own Cancel and OK came out in the activity's language.
     */
    @Test
    @Config(qualifiers = "de")
    public void anActivityInAnotherLanguageLeavesTheWholeScreenInThreadsLanguage() throws Exception {
        Map<String, String> german = TranslationsForTests.of("de");
        List<String> english = new ArrayList<>();
        for (String text : everythingShown(ActivityInEnglish.class)) {
            String translated = german.get(text);
            if (translated != null && !translated.equals(text)) english.add(text);
        }
        assertEquals("shown in the activity's English: " + english, 0, english.size());

        RuntimeEnvironment.setQualifiers("en-rUS");
        Set<String> germanOnly = new java.util.HashSet<>();
        for (Map.Entry<String, String> row : german.entrySet()) {
            if (!row.getKey().equals(row.getValue())) germanOnly.add(row.getValue());
        }
        Set<String> shown = everythingShown(ActivityInGerman.class);
        List<String> shownGerman = new ArrayList<>();
        for (String text : shown) {
            if (germanOnly.contains(text)) shownGerman.add(text);
        }
        assertEquals("shown in the activity's German: " + shownGerman, 0, shownGerman.size());
        assertTrue("the English screen lost its Back label: " + shown, shown.contains("Back"));
        assertTrue("the English screen lost its Cancel: " + shown, shown.contains("Cancel"));
    }

    /** An activity that runs in English whatever the application's language is. */
    public static class ActivityInEnglish extends Activity {
        @Override
        protected void attachBaseContext(android.content.Context base) {
            super.attachBaseContext(inLanguage(base, Locale.US));
        }
    }

    /** An activity that runs in German whatever the application's language is. */
    public static class ActivityInGerman extends Activity {
        @Override
        protected void attachBaseContext(android.content.Context base) {
            super.attachBaseContext(inLanguage(base, Locale.GERMANY));
        }
    }

    private static android.content.Context inLanguage(android.content.Context base, Locale locale) {
        android.content.res.Configuration configuration =
                new android.content.res.Configuration(base.getResources().getConfiguration());
        configuration.setLocales(new android.os.LocaleList(locale));
        return base.createConfigurationContext(configuration);
    }

    /**
     * The row listing what Pause can't reach is built from pieces: the items, the language's own
     * "and", and a sentence around them. In each language it has to start with a capital, carry
     * every item, and switch to the plural sentence past one item.
     *
     * <p>Every family in this build has a switch, so none has a {@link PatchFamily#staysWhilePaused}
     * of its own and a real build never shows this row. {@link PatchFamily#staysWhilePausedForTests}
     * substitutes two already-translated strings (the Hide ads and Disable analytics titles), so
     * the sentence-building and pluralization logic stays covered in every shipped language.
     */
    @Test
    public void theStaysRowReadsAsOneSentenceInEveryLanguage() {
        String one = "%1$s. It was set when you patched, so Pause can't turn it off. To get rid of it, patch again "
                + "without that patch.";
        String other = "%1$s. They were set when you patched, so Pause can't turn them off. To get rid of one, patch "
                + "again without the patch named in brackets after it.";
        String[][] languages = {{"en", null}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"},
                {"tr", "tr"}};
        Map<PatchFamily, String> stand = new java.util.LinkedHashMap<>();
        stand.put(PatchFamily.HIDE_ADS, "Hide ads");
        stand.put(PatchFamily.DISABLE_ANALYTICS, "Stop usage reports");
        PatchFamily.staysWhilePausedForTests = stand;
        try {
            for (String[] language : languages) {
                RuntimeEnvironment.setQualifiers("+" + language[0]);
                Map<String, String> table = language[1] == null ? null : TranslationsForTests.of(language[1]);

                String single = PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS));
                String item = row(table, "Hide ads");
                assertNotNull(single);
                assertTrue(language[0] + " doesn't start with a capital: " + single,
                        Character.isUpperCase(single.codePointAt(0)));
                assertTrue(language[0] + " lost its item: " + single,
                        single.toLowerCase(Locale.ROOT).contains(item.toLowerCase(Locale.ROOT).substring(1)));
                // One item takes the language's own form for one: Indonesian has none and takes the other.
                String singleFrame = "one".equals(android.icu.text.PluralRules.forLocale(L10n.locale()).select(1))
                        ? row(table, one) : row(table, other);
                String singleTail = singleFrame.substring(singleFrame.indexOf("%1$s") + 4);
                String pluralTail = row(table, other).substring(row(table, other).indexOf("%1$s") + 4);
                assertTrue(language[0] + ": " + single, single.endsWith(singleTail));

                String all = PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class));
                assertTrue(language[0] + ": " + all, all.endsWith(pluralTail));
                for (Map.Entry<PatchFamily, String> entry : stand.entrySet()) {
                    String part = row(table, entry.getValue()).toLowerCase(Locale.ROOT);
                    assertTrue(language[0] + " lost " + entry.getKey() + ": " + all,
                            all.toLowerCase(Locale.ROOT).contains(part.substring(1)));
                }
            }
        } finally {
            PatchFamily.staysWhilePausedForTests = null;
        }
    }

    /**
     * Each stays item is followed by its patch's name in brackets, so an item that was the name
     * would read it twice: "the Remove the advertising ID patch (Remove the advertising ID)". In
     * English and in each shipped language the name shows once, in the brackets, and the item says
     * what stays in with words of its own. Every word of the name in another order repeats it just
     * the same: "the sharing links sanitize step (Sanitize sharing links)".
     */
    @Test
    public void noStaysItemRepeatsItsPatchNameInAnyLanguage() {
        // The check has to be able to say yes, to the name itself and to its words reordered.
        assertTrue(repeatsItsName("The Remove the advertising ID patch (" + L10n.isolate("Remove the advertising ID")
                + ").", "Remove the advertising ID"));
        assertTrue(repeatsItsName("The sharing links sanitize step (" + L10n.isolate("Sanitize sharing links") + ").",
                "Sanitize sharing links"));
        assertFalse(repeatsItsName("The removed advertising ID permission (" + L10n.isolate("Remove the advertising ID")
                + ").", "Remove the advertising ID"));

        // Every family in this build has a switch, so none has a staysWhilePaused of its own to
        // check here for real. staysWhilePausedForTests substitutes one that, correctly, doesn't
        // repeat its patch's name, so the check above still runs against every shipped language.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
        try {
            List<String> repeats = new ArrayList<>();
            for (String language : new String[]{"en", "de", "es", "in-rID", "pt-rBR", "tr"}) {
                RuntimeEnvironment.setQualifiers("+" + language);
                String shown = PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS));
                if (repeatsItsName(shown, PatchFamily.HIDE_ADS.patchName)) repeats.add(language + ": " + shown);
            }
            assertEquals("items that say their patch's name again: " + repeats, 0, repeats.size());
        } finally {
            PatchFamily.staysWhilePausedForTests = null;
        }
    }

    /**
     * Whether [shown], a stays item with [patchName] in brackets after it, says the name again:
     * more than once anywhere, or every word of it before the bracket.
     */
    private static boolean repeatsItsName(String shown, String patchName) {
        int bracket = shown.indexOf(" (" + L10n.isolate(patchName) + ")");
        assertTrue("no bracketed " + patchName + " in: " + shown, bracket > 0);
        String name = patchName.toLowerCase(Locale.ROOT);
        String lower = shown.toLowerCase(Locale.ROOT);
        int count = 0;
        for (int at = lower.indexOf(name); at >= 0; at = lower.indexOf(name, at + 1)) count++;
        Set<String> itemWords = new java.util.HashSet<>(Arrays.asList(
                shown.substring(0, bracket).toLowerCase(Locale.ROOT).split("[^\\p{L}\\p{N}-]+")));
        return count > 1 || itemWords.containsAll(Arrays.asList(name.split(" ")));
    }

    private static String row(Map<String, String> table, String english) {
        return table == null ? english : table.get(english);
    }

    /** Titles, summaries, dialog text and toasts, from every state the screen can be drawn in. */
    private static Set<String> everythingShown() throws Exception {
        return everythingShown(Activity.class);
    }

    /** As above, over an activity of this class. */
    private static Set<String> everythingShown(Class<? extends Activity> host) throws Exception {
        Set<String> shown = new LinkedHashSet<>();
        try (ActivityController<? extends Activity> controller = Robolectric.buildActivity(host).setup()) {
            Activity activity = controller.get();

            SettingsDialog dialog = show(activity);
            HushTelegramPreferenceFragment page = pageOf(dialog);
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows, shown);
            shown.add(String.valueOf(backOf(dialog).getContentDescription()));

            // The export row's dialog.
            Preference export = find(rows, "action_export_diagnostic_report");
            export.getOnPreferenceClickListener().onPreferenceClick(export);
            ShadowLooper.idleMainLooper();
            AlertDialog choices = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertNotNull("the export row opened no dialog", choices);
            ShadowAlertDialog shadow = org.robolectric.Shadows.shadowOf(choices);
            shown.add(String.valueOf(shadow.getTitle()));
            // Each choice is its name and, on the next line, what it does: two catalog strings.
            for (CharSequence item : shadow.getItems()) shown.addAll(Arrays.asList(String.valueOf(item).split("\n")));
            // Its button is the catalog's Cancel, so the activity's own language can't reach it.
            String cancel = String.valueOf(choices.getButton(AlertDialog.BUTTON_NEGATIVE).getText());
            assertEquals(L10n.t("Cancel"), cancel);
            shown.add(cancel);
            choices.dismiss();

            // The licences dialog's title; the notice under it stays English, as the licences do.
            Preference licenses = null;
            for (Preference row : rows) if (L10n.t("Licenses").contentEquals(String.valueOf(row.getTitle()))) licenses = row;
            assertNotNull("no Licenses row", licenses);
            licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
            ShadowLooper.idleMainLooper();
            AlertDialog notice = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertNotNull("the licences row opened no dialog", notice);
            shown.add(String.valueOf(org.robolectric.Shadows.shadowOf(notice).getTitle()));
            shown.add(String.valueOf(notice.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            notice.dismiss();

            addSettingsFileText(activity, rows, shown);
            addReleaseCheckText(shown);

            // What the diagnostics rows say in a toast, with nothing to export or clear. The quick
            // report is built on a worker and answers on the main thread.
            LogBufferManager.exportToClipboard();
            settle();
            addToast(shown);
            Preference clear = find(rows, "action_clear_diagnostic_data");
            clear.getOnPreferenceClickListener().onPreferenceClick(clear);
            ShadowLooper.idleMainLooper();
            addToast(shown);
            if (LogBufferManager.canUndoClear()) {
                // Whatever an earlier test left is put back, and the undo says so in a toast too.
                clear.getOnPreferenceClickListener().onPreferenceClick(clear);
                ShadowLooper.idleMainLooper();
                addToast(shown);
            }
            dialog.dismissAllowingStateLoss();
            ShadowLooper.idleMainLooper();

            // Paused, for each reason, and the card after a tap.
            for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
                if (reason == HushTelegramPause.Reason.NONE) continue;
                PauseForTests.pause(reason);
                SettingsDialog paused = show(activity);
                List<Preference> pausedRows = new ArrayList<>();
                collect(pageOf(paused).getPreferenceScreen(), pausedRows, shown);
                Preference card = pausedRows.get(0);
                card.getOnPreferenceClickListener().onPreferenceClick(card);
                shown.add(String.valueOf(card.getSummary()));
                paused.dismissAllowingStateLoss();
                ShadowLooper.idleMainLooper();
                PauseForTests.resume();
            }

            // The page shown when the screen fails to build.
            HushTelegramPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
            SettingsDialog failed = show(activity);
            collect(pageOf(failed).getPreferenceScreen(), new ArrayList<>(), shown);
            failed.dismissAllowingStateLoss();
            ShadowLooper.idleMainLooper();

            // What saving a restart-gated switch says.
            app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.showRestartDialog(activity);
            addToast(shown);
        }
        shown.remove("null");
        return shown;
    }

    /**
     * Export settings and Import settings through the picker: the toast an export ends with, the
     * preview an import shows, both ways it can read, the toast after it, and every refusal.
     */
    private static void addSettingsFileText(Activity activity, List<Preference> rows, Set<String> shown)
            throws Exception {
        SettingsFileProvider.install("settings-l10n");
        Uri written = SettingsFileProvider.put("settings-l10n", "export.json", new byte[0]);
        answer(activity, pick(activity, find(rows, "action_export_settings")), written);
        addToast(shown);

        String key = Settings.HIDE_ADS.key;
        String changesOne = "{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"" + key
                + "\":false,\"a_later_switch\":true}}";
        AlertDialog preview = importPreview(activity, rows, changesOne);
        org.robolectric.shadows.ShadowAlertDialog shadow = org.robolectric.Shadows.shadowOf(preview);
        shown.add(String.valueOf(shadow.getTitle()));
        shown.add(String.valueOf(shadow.getMessage()));
        shown.add(String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
        String cancel = String.valueOf(preview.getButton(AlertDialog.BUTTON_NEGATIVE).getText());
        assertEquals(L10n.t("Cancel"), cancel);
        shown.add(cancel);
        preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        addToast(shown);
        Settings.HIDE_ADS.resetToDefault();

        String changesNothing = "{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"" + key + "\":true}}";
        AlertDialog unchanged = importPreview(activity, rows, changesNothing);
        shown.add(String.valueOf(org.robolectric.Shadows.shadowOf(unchanged).getMessage()));
        shown.add(String.valueOf(unchanged.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
        unchanged.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();

        for (SettingsBackup.Reason reason : SettingsBackup.Reason.values()) {
            shown.add(SettingsBackupPreference.refusal(reason));
        }
        // The toast after an import, for none and for several switches changed.
        shown.add(SettingsBackupPreference.importedMessage(0));
        shown.add(SettingsBackupPreference.importedMessage(2));

        // A phone with nothing to answer the picker.
        org.robolectric.shadows.ShadowApplication application =
                org.robolectric.Shadows.shadowOf(RuntimeEnvironment.getApplication());
        application.checkActivities(true);
        try {
            Preference importRow = find(rows, "action_import_settings");
            importRow.getOnPreferenceClickListener().onPreferenceClick(importRow);
            ShadowLooper.idleMainLooper();
            addToast(shown);
        } finally {
            application.checkActivities(false);
        }
    }

    /**
     * What the release check can say, not only what it says now: the status card's line for a newer
     * release and for another Telegram target, and the Check now row on its way and for every way a
     * try can end.
     */
    private static void addReleaseCheckText(Set<String> shown) {
        shown.add(ReleaseCheck.statusLine("0.2.0", "451.0.0.40.70", "0.1.8", "449.0.0.54.82"));
        shown.add(ReleaseCheck.statusLine("0.1.8", "449.0.0.54.82", "0.1.8", "447.0.0.50.72"));
        shown.add(ReleaseCheck.checkingSummary());
        shown.add(ReleaseCheck.idleSummary());
        for (ReleaseCheck.Result result : ReleaseCheck.Result.values()) {
            shown.add(ReleaseCheck.resultLine(result, "0.2.0", "0.1.8"));
            shown.add(ReleaseCheck.resultLine(result, "0.1.8", "0.1.8"));
            shown.add(ReleaseCheck.resultLine(result, "0.2.0", ""));
        }
    }

    private static AlertDialog importPreview(Activity activity, List<Preference> rows, String file) throws Exception {
        Uri uri = SettingsFileProvider.put("settings-l10n", System.nanoTime() + ".json",
                file.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        answer(activity, pick(activity, find(rows, "action_import_settings")), uri);
        AlertDialog preview = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("the import showed no preview", preview);
        assertTrue(preview.isShowing());
        return preview;
    }

    private static Intent pick(Activity activity, Preference row) {
        row.getOnPreferenceClickListener().onPreferenceClick(row);
        org.robolectric.shadows.ShadowActivity.IntentForResult started =
                org.robolectric.Shadows.shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull(row.getKey() + " opened no picker", started);
        return started.intent;
    }

    private static void answer(Activity activity, Intent picker, Uri chosen) throws Exception {
        org.robolectric.Shadows.shadowOf(activity).receiveResult(picker, Activity.RESULT_OK, new Intent().setData(chosen));
        settle();
    }

    private static void settle() throws Exception {
        app.hushtelegram.extension.shared.Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        app.hushtelegram.extension.shared.Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    private static void addToast(Set<String> shown) {
        String toast = ShadowToast.getTextOfLatestToast();
        assertNotNull("no toast was shown", toast);
        shown.add(toast);
        ShadowToast.reset();
    }

    private static Preference find(List<Preference> rows, String key) {
        for (Preference row : rows) {
            if (key.equals(row.getKey())) return row;
        }
        throw new AssertionError("no row keyed " + key);
    }

    static SettingsDialog show(Activity activity) {
        SettingsDialog dialog = new SettingsDialog();
        dialog.show(activity.getFragmentManager(), "hushtelegram_settings");
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        return dialog;
    }

    static HushTelegramPreferenceFragment pageOf(SettingsDialog dialog) {
        Fragment page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no preference page in the dialog: " + page, page instanceof HushTelegramPreferenceFragment);
        return (HushTelegramPreferenceFragment) page;
    }

    /** The back arrow: the first view in the dialog's title bar. */
    static android.widget.ImageButton backOf(SettingsDialog dialog) {
        android.view.ViewGroup root = (android.view.ViewGroup) dialog.getView();
        android.view.ViewGroup bar = (android.view.ViewGroup) root.getChildAt(0);
        return (android.widget.ImageButton) bar.getChildAt(0);
    }

    private static void collect(PreferenceGroup group, List<Preference> rows, Set<String> shown) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            shown.add(String.valueOf(preference.getTitle()));
            if (preference.getSummary() != null) shown.add(String.valueOf(preference.getSummary()));
            // A row's own dialog: its title and message, a field's button and hint, and a list's choices.
            if (preference instanceof android.preference.DialogPreference) {
                android.preference.DialogPreference dialog = (android.preference.DialogPreference) preference;
                if (dialog.getDialogTitle() != null) shown.add(String.valueOf(dialog.getDialogTitle()));
                if (dialog.getDialogMessage() != null) shown.add(String.valueOf(dialog.getDialogMessage()));
                // Left unset, Android fills Cancel in the activity's language, not Telegram's.
                if (dialog.getNegativeButtonText() != null) shown.add(String.valueOf(dialog.getNegativeButtonText()));
            }
            if (preference instanceof android.preference.EditTextPreference) {
                android.preference.EditTextPreference field = (android.preference.EditTextPreference) preference;
                if (field.getPositiveButtonText() != null) shown.add(String.valueOf(field.getPositiveButtonText()));
                if (field.getEditText().getHint() != null) shown.add(String.valueOf(field.getEditText().getHint()));
            }
            if (preference instanceof android.preference.ListPreference) {
                for (CharSequence entry : ((android.preference.ListPreference) preference).getEntries()) {
                    shown.add(String.valueOf(entry));
                }
            }
            if (preference instanceof PreferenceGroup) {
                collect((PreferenceGroup) preference, rows, shown);
            } else {
                rows.add(preference);
            }
        }
    }

    /** Reaches the generated tables from outside their package. */
    static final class TranslationsForTests {
        static Map<String, String> of(String language) {
            Map<String, String> table = app.hushtelegram.extension.shared.L10nTablesForTests.of(language);
            assertNotNull("no table for " + language, table);
            assertFalse(table.isEmpty());
            return table;
        }
    }
}
