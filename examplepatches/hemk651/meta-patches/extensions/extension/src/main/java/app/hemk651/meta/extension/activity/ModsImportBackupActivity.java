/*
 * Meta Patches — overrides backup import activity.
 *
 * Forked from InstaFL activity/devmode/ifl_a_devmode_import.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches with the following changes:
 *   - the old-backup tile (restoring a saved InstaFL export) was dropped;
 *     Meta Patches has no export flow yet
 *   - the mapping-file import was dropped; Meta Patches ships no mapping file
 *   - a "Restore bundled overrides" tile was added to undo imports
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.LinearLayout;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import app.hemk651.meta.extension.MCOverrides;
import app.hemk651.meta.extension.ModsInit;
import app.hemk651.meta.extension.ModsUi;

/**
 * Imports a MobileConfig overrides backup into the app: full replace or
 * merge, like the InstaFL developer options import screen.
 */
public class ModsImportBackupActivity extends Activity {

    /** Request codes of the file pickers, mirroring InstaFL's values. */
    private static final int REQUEST_FULL_REPLACE = 15;
    private static final int REQUEST_MERGE = 22;

    /** Backups larger than this are rejected before they can stress memory. */
    private static final int MAX_BACKUP_CHARS = 2 * 1024 * 1024;

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Import backup"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        content.addView(ui.paragraph(
                "Imports a MobileConfig overrides backup (JSON) into Instagram. "
                        + "The imported values become active after the app restarts.\n\n"
                        + "InstaFL backups (with a \"backup\" wrapper) and plain "
                        + "overrides files are both accepted."));

        content.addView(ui.sectionTitle("Import"));
        content.addView(ui.tile(
                "⤓", "Full replace",
                "Replace all overrides with the backup file", "›",
                v -> openPicker(REQUEST_FULL_REPLACE)));
        content.addView(ui.tile(
                "⊕", "Merge",
                "Add backup entries, keep the current ones", "›",
                v -> openPicker(REQUEST_MERGE)));

        content.addView(ui.sectionTitle("Restore"));
        content.addView(ui.tile(
                "↻", "Restore bundled overrides",
                "Undo imports; reinstall the patch bundle payload", null,
                v -> confirmRestore()));

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }

    private void openPicker(int requestCode) {
        ModsInit.safeRun(this, () -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            // Any openable file: file managers label .json files in
            // inconsistent ways, so filtering by mime type would hide them.
            intent.setType("*/*");
            startActivityForResult(
                    Intent.createChooser(intent, "Select backup JSON"), requestCode);
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) {
            return;
        }
        ModsInit.safeRun(this, () -> handlePickedFile(
                requestCode, data.getData()));
    }

    private void handlePickedFile(int requestCode, Uri uri) {
        String json = readText(uri);
        if (json == null) {
            showResult("Import failed", "The file could not be read.", null);
            return;
        }
        if (json.length() > MAX_BACKUP_CHARS) {
            showResult("Import failed", "The file is too large for a backup.", null);
            return;
        }

        boolean merge = requestCode == REQUEST_MERGE;
        String error = MCOverrides.importOverrides(this, json, merge);
        if (error != null) {
            showResult("Import failed", error, null);
            return;
        }

        showResult("Backup imported",
                (merge ? "Backup entries were merged into the current overrides "
                        + "(current values were kept)."
                        : "The overrides file was replaced with the backup.")
                        + "\n\nRestart the app to apply them.",
                this::restartApp);
    }

    /**
     * Reads the picked document as text, stripping line breaks like InstaFL's
     * backup reader does; null when the file cannot be read.
     */
    private String readText(Uri uri) {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                getContentResolver().openInputStream(uri)))) {
            StringBuilder content = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line);
            }
            return content.toString();
        } catch (Exception e) {
            return null;
        }
    }

    private void confirmRestore() {
        ModsInit.safeRun(this, () -> new AlertDialog.Builder(this)
                .setTitle("Restore bundled overrides")
                .setMessage("The imported overrides are removed and the payload "
                        + "bundled with this build is installed again.")
                .setPositiveButton("Restore", (dialog, which) -> {
                    boolean restored = MCOverrides.restoreBundled(this);
                    showResult(restored ? "Restored" : "Restore failed",
                            restored
                                    ? "The bundled overrides were installed. Restart "
                                    + "the app to apply them."
                                    : "The bundled overrides could not be restored.",
                            restored ? this::restartApp : null);
                })
                .setNegativeButton("Cancel", null)
                .show());
    }

    private void restartApp() {
        ModsInit.restartApp(this);
    }

    private void showResult(String title, String message, Runnable positive) {
        ModsInit.safeRun(this, () -> {
            AlertDialog.Builder builder = new AlertDialog.Builder(this)
                    .setTitle(title)
                    .setMessage(message)
                    .setPositiveButton(positive != null ? "Restart app" : "OK",
                            positive != null
                                    ? (dialog, which) -> positive.run()
                                    : null);
            if (positive != null) {
                builder.setNegativeButton("Later", null);
            }
            builder.show();
        });
    }
}
