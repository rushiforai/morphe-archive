/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.SOURCE_ADDRESS;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.SOURCE_URL;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.STAYS_WHILE_PAUSED;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.amoledSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.category;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.info;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.mark;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.toggle;

import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.text.Layout;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.Set;

import app.morphe.extension.facebook.navigation.HiddenTabs;
import app.morphe.extension.facebook.coexist.MessengerLinkCheck;
import app.morphe.extension.facebook.settings.SettingsRows.BackupRow;
import app.morphe.extension.facebook.settings.SettingsRows.ClearRow;
import app.morphe.extension.facebook.settings.SettingsRows.ExportRow;
import app.morphe.extension.facebook.settings.SettingsRows.FontRow;
import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.facebook.theme.AmoledTheme;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.preference.ClearLogBufferPreference;
import app.morphe.extension.shared.settings.preference.ExportDiagnosticReportPreference;

/**
 * The category pages about Hushfacebook itself: Updates, Appearance, Set when you patched, Pause,
 * backup and diagnostics, and About. Each method adds its section to the page
 * {@link HushfacebookPreferenceFragment#initialize} builds, and leaves it out when the build has none of
 * its patches, but for the sections every build has.
 */
@SuppressWarnings("deprecation")
final class HushfacebookPages {
    private HushfacebookPages() {
    }

    /** Updates, in every build, with the release check. */
    static void updates(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        if (build.contains(PatchFamily.UPDATE_PROMPTS)) {
            updates.addPreference(toggle(context, Settings.STOP_UPDATE_PROMPTS,
                    L10n.t("Facebook stops asking you to update through Meta App Manager and stops having it look for one. "
                            + "Chat promotions aimed at older versions go too. A patched build can't install Meta's updates anyway.")));
        }
        updates.addPreference(toggle(context, Settings.CHECK_FOR_RELEASES,
                L10n.t("Ask GitHub once a day at startup and show newer releases on the overview. Off by default. Nothing is downloaded.")));
        updates.addPreference(page.checkNowRow(context));
        ReleaseCheck.watch(page);
    }

    /** Appearance: the font, the emoji, where the tab bar goes, dark mode, haptics and screen transitions. */
    static void appearance(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.SYSTEM_FONT) || build.contains(PatchFamily.SYSTEM_EMOJI)
                || build.contains(PatchFamily.BOTTOM_TAB_BAR) || build.contains(PatchFamily.FORCE_DARK_MODE)
                || build.contains(PatchFamily.HIDDEN_TABS) || build.contains(PatchFamily.HAPTICS)
                || build.contains(PatchFamily.SCREEN_TRANSITIONS)) {
            PreferenceCategory appearance = category(screen, L10n.t("Appearance"));
            if (build.contains(PatchFamily.SYSTEM_FONT)) {
                appearance.addPreference(toggle(context, Settings.USE_SYSTEM_FONT,
                        L10n.t("Use your phone's font or a file chosen below. Restart Facebook after changing it.")));
                // The file the switch draws in, and, while one is picked, the way back to the phone's font.
                // The way back goes in once whatever is picked, so it keeps its place right after Font file
                // when a pick brings it back, rather than landing at the end of the section.
                FontRow choose = new FontRow(page, context, FontFilePreference.CHOOSE);
                choose.wayBack = new FontRow(page, context, FontFilePreference.PHONE_FONT);
                appearance.addPreference(choose);
                appearance.addPreference(choose.wayBack);
                choose.show();
            }
            if (build.contains(PatchFamily.SYSTEM_EMOJI)) {
                // The quick emoji picker keeps the first typeface it's given until Facebook restarts.
                appearance.addPreference(toggle(context, Settings.USE_SYSTEM_EMOJI,
                        L10n.t("Use your phone's emoji. Reactions and stickers stay the same. Restart Facebook after changing it.")));
            }
            if (build.contains(PatchFamily.BOTTOM_TAB_BAR)) {
                // Facebook places the tab bar as its main screen starts, so a change waits for a restart.
                appearance.addPreference(toggle(context, Settings.BOTTOM_TAB_BAR,
                        L10n.t("Put Facebook's tab bar at the bottom of the screen on accounts that have it at the top. "
                                + "Restart Facebook after changing it.")));
            }
            if (build.contains(PatchFamily.HIDDEN_TABS)) {
                // Facebook builds the tab bar once, so a change waits for a restart.
                for (HiddenTabs.Tab tab : HiddenTabs.Tab.values()) {
                    appearance.addPreference(toggle(context, tab.setting(),
                            L10n.t("Takes the tab off the tab bar. Its page stays in the Menu. Restart Facebook after "
                                    + "changing it.")));
                }
            }
            if (build.contains(PatchFamily.FORCE_DARK_MODE)) {
                // Facebook asks for dark mode as each screen applies its theme, so a change shows fully after a restart.
                appearance.addPreference(toggle(context, Settings.FORCE_DARK_MODE,
                        L10n.t("Keep Facebook in dark mode whatever its own setting says, for tablets where Facebook's "
                                + "settings have no Dark mode. Restart Facebook after changing it.")));
            }
            if (build.contains(PatchFamily.HAPTICS)) {
                appearance.addPreference(toggle(context, Settings.TURN_OFF_HAPTICS,
                        L10n.t("No short vibrations on Facebook's own taps and gestures. The keyboard and your "
                                + "phone's own haptics stay.")));
            }
            if (build.contains(PatchFamily.SCREEN_TRANSITIONS)) {
                // Asked at each tap and each screen change, so a change shows from the next one.
                appearance.addPreference(toggle(context, Settings.TURN_OFF_SCREEN_TRANSITIONS,
                        L10n.t("Tabs, the Menu and screens that open over Facebook show at once, without the slide "
                                + "between them. Swiping between tabs stays.")));
            }
        }
    }

    /** Set when you patched: what the patches picked in Morphe Manager do, which no switch changes. */
    static void patched(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.AD_PREFETCH) || build.contains(PatchFamily.AD_TELEMETRY)
                || build.contains(PatchFamily.AUDIENCE_NETWORK) || build.contains(PatchFamily.AMOLED_THEME)
                || build.contains(PatchFamily.MATERIAL_YOU_THEME) || build.contains(PatchFamily.RESTORE_TRUST)
                || build.contains(PatchFamily.INSTALL_BESIDE_META_APPS)) {
            PreferenceCategory patched = category(screen, L10n.t("Set when you patched"));
            if (build.contains(PatchFamily.AD_PREFETCH)) {
                patched.addPreference(mark(info(context, L10n.t("Background ad prefetch blocked"),
                        L10n.t("Facebook doesn't download ads or its ad model in the background.")), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.AD_TELEMETRY)) {
                patched.addPreference(mark(info(context, L10n.t("Ad telemetry blocked"),
                        L10n.t("No screenshot watching for ads, and no reports of which apps you install.")), SettingsIcons.TELEMETRY));
            }
            if (build.contains(PatchFamily.AUDIENCE_NETWORK)) {
                patched.addPreference(mark(info(context, L10n.t("Audience Network off"),
                        L10n.t("Facebook doesn't serve ads to other apps on this phone.")), SettingsIcons.NETWORK));
            }
            if (build.contains(PatchFamily.AMOLED_THEME)) {
                patched.addPreference(mark(info(context, L10n.t("AMOLED black theme"),
                        amoledSummary(AmoledTheme.backgroundColour())), SettingsIcons.MOON));
            }
            if (build.contains(PatchFamily.MATERIAL_YOU_THEME)) {
                patched.addPreference(mark(info(context, L10n.t("Material You theme"),
                        L10n.t("Facebook dark mode and this screen use your wallpaper colours. Android 11 uses blue "
                                + "instead. Turn on Facebook dark mode to see it.")), SettingsIcons.APPEARANCE));
            }
            if (build.contains(PatchFamily.RESTORE_TRUST)) {
                patched.addPreference(mark(info(context, L10n.t("Re-signed build fix"),
                        L10n.t("Profiles and some Settings pages open again on this re-signed build.")), SettingsIcons.BUILD));
            }
            if (build.contains(PatchFamily.INSTALL_BESIDE_META_APPS)) {
                patched.addPreference(mark(info(context, L10n.t("Room for Meta's apps"),
                        L10n.t("Messenger, Facebook Lite, Business Suite and Workplace install beside this Facebook. "
                                + "It gives the two permissions they share with it names of its own.")), SettingsIcons.PHONE));
            }
            patched.addPreference(info(context, L10n.t("Changing these"),
                    L10n.t("They're chosen in Morphe Manager when you patch, and Pause doesn't turn them off. "
                            + "Patch again to change them.")));
        }
    }

    /** Pause, backup and diagnostics, in every build. */
    static void pause(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        // Named for its rows: the screen's own title already says Hushfacebook.
        PreferenceCategory hushfacebook = category(screen, L10n.t("Pause, backup and diagnostics"));
        hushfacebook.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause Hushfacebook"),
                L10n.t("From the next start, every switch but Debug logging acts as if it were off. "
                        + "Changes made when you patched stay in, and your choices stay saved.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        hushfacebook.addPreference(mark(new BackupRow(page, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Save your switches and download settings to a file. Pause and Debug logging aren't included, "
                        + "and neither is the release check.")), SettingsIcons.EXPORT));
        // The preview gives a count of the switches and the download settings' new values, not
        // each switch by name.
        hushfacebook.addPreference(mark(new BackupRow(page, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Choose a settings file. Before anything is imported, you'll see how many switches it "
                        + "changes and any new download settings.")), SettingsIcons.DOWNLOADS));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        hushfacebook.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Record patch activity and show errors for a bug report. Leave off during normal use.")), SettingsIcons.BUG));
        // A test for Debug logging only: a Messenger patched with this build's key, asked now
        // instead of on Facebook's own schedule. Restore screens fills it in. The screen is built
        // once, so the row comes and goes when settings open again after Debug logging changes: a
        // row this page can only disable would sit greyed out in every build with Restore screens.
        if (build.contains(PatchFamily.RESTORE_TRUST) && BaseSettings.DEBUG.get() && MessengerLinkCheck.available()) {
            Preference link = new Row(context);
            link.setTitle(L10n.t("Test the Messenger link"));
            link.setSummary(L10n.t("Runs the two reads Facebook makes of Messenger at startup, now, and shows whether "
                    + "each one answered. Shown while Debug logging is on."));
            link.setPersistent(false);
            link.setOnPreferenceClickListener(p -> {
                MessengerLinkCheck.start(context);
                return true;
            });
            hushfacebook.addPreference(mark(link, SettingsIcons.BUG));
        }
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Facebook's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.t("Copy a quick report or save the full one to Download/Morphe. Links, IDs, cookies "
                + "and sign-in tokens are left out. Check it for other private text before you share it."));
        hushfacebook.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Empties the log and the filter counts a report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        hushfacebook.addPreference(mark(clear, SettingsIcons.DELETE));
        // Keep the detailed patch-time exception list after the controls people come here for.
        if (stays != null) hushfacebook.addPreference(info(context, L10n.t(STAYS_WHILE_PAUSED), stays));
    }

    /** About, in every build. */
    static void about(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("Hushfacebook %1$s on Facebook %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))
                + "\n" + L10n.f("Build %1$s", L10n.isolate(Utils.getPatchesBuildIdentity()))), SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                page.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Facebook.
                Logger.printInfo(() -> "No app opened the source code link");
                Utils.showToastLong(L10n.f("No app on this phone can open the link. The address is %1$s.",
                        L10n.isolate(SOURCE_ADDRESS)));
            }
            return true;
        });
        about.addPreference(mark(source, SettingsIcons.OPENING));

        // Section 7b asks that its notice reach the person using the software, and a file in the
        // repository does not reach them.
        Preference licenses = new Row(context);
        licenses.setTitle(L10n.t("Licenses"));
        licenses.setSummary(L10n.t("GPL-3.0, with the notices of the projects this is built on"));
        licenses.setPersistent(false);
        licenses.setOnPreferenceClickListener(p -> {
            showNotice(page, context);
            return true;
        });
        about.addPreference(mark(licenses, SettingsIcons.LICENSE));
    }

    /**
     * The notice itself stays in English, as the licence texts it carries are: a translation of
     * the GPL is not the licence.
     */
    private static void showNotice(HushfacebookPreferenceFragment page, Context context) {
        TextView text = new TextView(context);
        // NOTICE is hard-wrapped for a source file. Reflow prose on a narrow screen while keeping
        // blank lines, headings, lists and the generated notice itself intact.
        String notice = LicenseNotice.TEXT.replaceAll("(?<=[\\p{L}.,;])\\n(?=\\p{L})", " ")
                .replaceAll("(?m)^(  .+?) {2,}(https?://[^\\n]+)$", "$1\n$2\n");
        text.setText(notice);
        text.setTextIsSelectable(true);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setBreakStrategy(Layout.BREAK_STRATEGY_HIGH_QUALITY);
        int pad = Math.round(16 * context.getResources().getDisplayMetrics().density);
        text.setPadding(pad, pad, pad, pad);
        text.setLineSpacing(Math.round(2 * context.getResources().getDisplayMetrics().density), 1.04f);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(text);
        ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
        text.setTextColor(colors.summary);
        text.setLinkTextColor(colors.heading);
        Linkify.addLinks(text, Linkify.WEB_URLS);
        page.show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Licenses"))
                .setView(scroll)
                .setPositiveButton(L10n.t("OK"), null));
    }
}
