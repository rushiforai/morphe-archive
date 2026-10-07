package app.linkedin.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;
import android.util.Log;

/** Shows the changes of the installed patch bundle once, the first time LinkedIn opens after patching. */
final class WhatsNew {
    /** Newest first. Add an entry for every release that users should read about. */
    static final String[][] CHANGELOG = {
            {"1.0.0", "Rilis pertama Michii Patches.\n\n"
                    + "• Sembunyikan iklan, lowongan promosi, post disarankan, dan promosi Premium\n"
                    + "• Download foto, video, foto profil, dan banner, dengan lokasi simpan yang bisa diatur\n"
                    + "• Filter feed: mode fokus, perayaan, lowongan, repost, video\n"
                    + "• Chat: sembunyikan pesan bersponsor dan mode hantu\n"
                    + "• Buka link langsung (termasuk lnkd.in) dan bersihkan link share\n"
                    + "• Blokir tracking dan matikan double-tap like\n\n"
                    + "Buka pengaturan lewat panel Me → Michii Patches."},
    };

    private static boolean checked;

    private WhatsNew() {
    }

    /** Text for a version, or null. Pre-release builds (1.1.0-dev.2) use their base version's entry. */
    static String notesFor(String version) {
        String base = version.split("-", 2)[0];
        for (String[] entry : CHANGELOG) {
            if (entry[0].equals(base)) return entry[1];
        }
        return null;
    }

    static void maybeShow(Activity activity) {
        if (checked) return;
        checked = true;
        try {
            String version = Settings.patchesVersion();
            if (version.equals(Settings.getString(Settings.LAST_SEEN_VERSION, null))) return;
            Settings.setString(Settings.LAST_SEEN_VERSION, version);

            String notes = notesFor(version);
            if (notes == null) return;
            boolean dark = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            new AlertDialog.Builder(activity, dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                    : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                    .setTitle("Apa yang baru di " + SettingsActivity.BRAND + " " + version)
                    .setMessage(notes)
                    .setPositiveButton("Oke", null)
                    .setNeutralButton("Pengaturan", (dialog, which) -> SettingsActivity.open(activity))
                    .show();
        } catch (Throwable t) {
            Log.e(Settings.TAG, "WhatsNew failed", t);
        }
    }
}
