/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.settings;

import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.RESTORE_QUICK_SETUPS_ROW_KEY;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.category;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.mark;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.restoreQuickSetupsSummary;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.Row;
import app.hushgram.extension.shared.L10n;

/** Builds the Settings backup category of HushGram settings. */
final class BackupCategory {
    private BackupCategory() { }

    static void add(HushgramPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        PreferenceCategory backup = category(screen, L10n.t("Settings backup"), SettingsIcons.TOOLS,
                L10n.t("Save your HushGram choices to a file, or bring them back."));
        page.exportConfiguration = new Row(context);
        page.exportConfiguration.setKey("hushgram_export_configuration");
        page.exportConfiguration.setPersistent(false);
        page.exportConfiguration.setTitle(L10n.t("Export HushGram settings"));
        page.exportConfiguration.setSummary(L10n.t("Choose a file for your installed patches' settings. Accounts and history stay on this device."));
        page.exportConfiguration.setOnPreferenceClickListener(p -> { page.pickConfiguration(false); return true; });
        backup.addPreference(mark(page.exportConfiguration, SettingsIcons.EXPORT));
        page.importConfiguration = new Row(context);
        page.importConfiguration.setKey("hushgram_import_configuration");
        page.importConfiguration.setPersistent(false);
        page.importConfiguration.setTitle(L10n.t("Import HushGram settings"));
        page.importConfiguration.setSummary(L10n.t("Choose a settings file. All valid choices apply together, and ones "
                + "this version doesn't know are skipped. The Undo row shows how long you can undo."));
        page.importConfiguration.setOnPreferenceClickListener(p -> { page.pickConfiguration(true); return true; });
        backup.addPreference(mark(page.importConfiguration, SettingsIcons.EXPORT));
        page.undoConfiguration = new Row(context);
        page.undoConfiguration.setKey("hushgram_undo_configuration");
        page.undoConfiguration.setPersistent(false);
        page.undoConfiguration.setTitle(L10n.t("Undo settings import"));
        backup.addPreference(mark(page.undoConfiguration, SettingsIcons.DELETE));
        page.showConfiguration();
        Row restoreQuick = new Row(context);
        restoreQuick.setKey(RESTORE_QUICK_SETUPS_ROW_KEY);
        restoreQuick.setPersistent(false);
        restoreQuick.actsAtOnce = true;
        restoreQuick.setTitle(L10n.t("Quick setups on the home page"));
        restoreQuick.setSummary(restoreQuickSetupsSummary());
        restoreQuick.setOnPreferenceClickListener(p -> {
            if (Settings.HIDE_QUICK_SETUPS.save(!Settings.HIDE_QUICK_SETUPS.savedValue())) {
                p.setSummary(restoreQuickSetupsSummary());
                page.filterSettings();
            }
            return true;
        });
        backup.addPreference(mark(restoreQuick, SettingsIcons.TOOLS));
    }
}
