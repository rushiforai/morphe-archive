package app.linkedin.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;

/** Shows the changes of the installed patch bundle once, the first time LinkedIn opens after patching. */
final class WhatsNew {
    /** Newest first: {version, notes in English}. Notes are translated like any other text. */
    static final String[][] CHANGELOG = {
            {"1.0.0", "The first release of Loki Patches.\n\n"
                    + "• Copy text: long press a post, comment, or any text to select and copy it, "
                    + "like on Reddit\n"
                    + "• Hide ads, promoted jobs, suggested posts, and Premium promotions\n"
                    + "• Download photos and videos, feed filters, ghost mode in chat, and more\n\n"
                    + "Open the settings from the Me panel → Loki Patches, or long press the LinkedIn icon "
                    + "→ Loki Patches."},
    };

    private static boolean checked;

    private WhatsNew() {
    }

    /** Text for a version, or null. Pre-release builds (1.1.0-dev.2) use their base version's entry. */
    static String notesFor(String version) {
        String base = version.split("-", 2)[0];
        for (String[] entry : CHANGELOG) {
            if (entry[0].equals(base)) return I18n.tr(entry[1]);
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
            AlertDialog dialog = new AlertDialog.Builder(activity, dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                    : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                    .setTitle(I18n.f("What's new in %1$s %2$s", SettingsActivity.BRAND, version))
                    .setMessage(notes)
                    .setPositiveButton("OK", null)
                    .setNeutralButton(I18n.tr("Settings"), (d, which) -> SettingsActivity.open(activity))
                    .show();
            SettingsActivity.tintButtons(dialog, activity);
        } catch (Throwable t) {
            Diagnostics.error("WhatsNew failed", t);
        }
    }
}
