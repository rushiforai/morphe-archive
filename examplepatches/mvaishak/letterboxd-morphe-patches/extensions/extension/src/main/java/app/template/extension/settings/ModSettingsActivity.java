package app.template.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import app.template.extension.artwork.ArtworkHooks;
import app.template.extension.artwork.ArtworkStore;
import app.template.extension.artwork.TmdbCredential;
import app.template.extension.trivia.ImdbTrivia;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Standalone host for {@link ModSettingsView}. Added to the Letterboxd manifest by the "Mod
 * settings" patch and launched from a launcher long-press shortcut / the profile-tab gear.
 *
 * <p>The manifest theme is {@code @android:style/Theme.Material.NoActionBar}; this class draws its
 * own header and applies the system-bar insets itself.
 */
@SuppressWarnings("deprecation")
public class ModSettingsActivity extends Activity {

    private boolean refreshOnCreate;
    private static final int SETTINGS = 1;
    private static final int ARTWORK = 2;

    private byte[] pendingExport;
    private int pendingExportSections;
    private LinearLayout body;
    private ModSettingsView settings;
    private TextView title;
    private boolean guideOpen;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            pendingExportSections = savedInstanceState.getInt("pendingExportSections");
        }

        final LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(SurfaceColors.background(this));

        root.addView(buildHeader(), new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        body = new LinearLayout(this);
        root.addView(body, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
        settings = new ModSettingsView(this);
        showPage(savedInstanceState != null && savedInstanceState.getBoolean("featureGuideOpen"));

        root.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                v.setPadding(0, insets.getSystemWindowInsetTop(), 0,
                        insets.getSystemWindowInsetBottom());
                return insets;
            }
        });

        setContentView(root);
        if (savedInstanceState != null && savedInstanceState.getBoolean("modsRestartPending")) {
            RestartHelper.promptRestart(this);
        }
    }

    private View buildHeader() {
        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(16), dp(14), dp(16), dp(14));

        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextColor(Color.WHITE);
        back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 26f);
        back.setPadding(0, 0, dp(18), 0);
        back.setContentDescription("Back");
        back.setOnClickListener(v -> onBackPressed());
        header.addView(back);

        title = new TextView(this);
        title.setText("Letterboxd Mods");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        header.addView(title);

        return header;
    }

    void openFeatureGuide() {
        showPage(true);
    }

    private void showPage(boolean guide) {
        guideOpen = guide;
        title.setText(guide ? "Feature Guide" : "Letterboxd Mods");
        body.removeAllViews();
        body.addView(guide ? new ModSettingsView(this, true) : settings,
                new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.MATCH_PARENT));
    }

    @Override
    public void onBackPressed() {
        if (guideOpen) showPage(false);
        else super.onBackPressed();
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    // --- config export / import -----------------------------------------

    private static final int MAX_BACKUP_BYTES = 16 * 1024 * 1024;
    private static final int REQ_EXPORT = 0x4011;
    private static final int REQ_IMPORT = 0x4012;
    private static final int REQ_ARTWORK_EXPORT = 0x4013;
    private static final int REQ_ARTWORK_IMPORT = 0x4014;

    void pickArtworkBackup(boolean export) {
        try {
            Intent intent = new Intent(export ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType(export ? "application/json" : "*/*");
            if (export) intent.putExtra(Intent.EXTRA_TITLE, "letterboxd-custom-artwork.json");
            startActivityForResult(intent, export ? REQ_ARTWORK_EXPORT : REQ_ARTWORK_IMPORT);
        } catch (android.content.ActivityNotFoundException e) {
            toast("No file picker available");
        }
    }

    private void transferArtwork(int requestCode, Uri uri) {
        ArtworkStore store = new ArtworkStore(this);
        String member = ArtworkHooks.account();
        if (requestCode == REQ_ARTWORK_EXPORT) {
            try {
                writeBackup(uri, backupBytes(store.exportJson(member)));
                toast("Custom artwork exported");
            } catch (Exception e) {
                toast("Couldn't export the artwork backup");
            }
        } else {
            try (InputStream in = getContentResolver().openInputStream(uri)) {
                if (in == null) throw new java.io.IOException();
                int count = store.importJson(readAll(in), member);
                toast(count == 0 ? "No empty artwork slots to import"
                        : "Imported " + count + (count == 1 ? " artwork choice" : " artwork choices"));
            } catch (Exception e) {
                toast("Couldn't read the artwork backup");
            }
        }
    }

    private void chooseBackupSections(boolean export, int available,
                                      java.util.function.IntConsumer onConfirm) {
        List<String> labels = new ArrayList<>(2);
        List<Integer> sections = new ArrayList<>(2);
        if ((available & SETTINGS) != 0) {
            labels.add("Mods settings");
            sections.add(SETTINGS);
        }
        if ((available & ARTWORK) != 0) {
            labels.add("Custom artwork");
            sections.add(ARTWORK);
        }
        ModDialog.choose(this, export ? "Export Mods backup" : "Import Mods backup",
                labels.toArray(new String[0]), export ? "Export" : "Import", checked -> {
                    int selected = 0;
                    for (int i = 0; i < checked.length; i++) {
                        if (checked[i]) selected |= sections.get(i);
                    }
                    onConfirm.accept(selected);
                });
    }

    void pickExport() {
        chooseBackupSections(true, SETTINGS | ARTWORK, this::openExportPicker);
    }

    private byte[] prepareExport(int sections) throws JSONException, IOException {
        return backupBytes(ConfigTransfer.export(this,
                (sections & SETTINGS) != 0, (sections & ARTWORK) != 0));
    }

    private void openExportPicker(int sections) {
        try {
            pendingExport = prepareExport(sections);
        } catch (Exception e) {
            toast("Couldn't create the Mods backup. " + e.getMessage());
            return;
        }
        pendingExportSections = sections;
        try {
            startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("application/json")
                    .putExtra(Intent.EXTRA_TITLE, "letterboxd-mods-config.json"), REQ_EXPORT);
        } catch (android.content.ActivityNotFoundException e) {
            pendingExport = null;
            pendingExportSections = 0;
            toast("No file picker available");
        }
    }

    void pickImport() {
        try {
            // "*/*" not "application/json" — some pickers hide .json files under the strict type.
            startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("*/*"), REQ_IMPORT);
        } catch (Throwable t) {
            toast("No file picker available");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        byte[] prepared = requestCode == REQ_EXPORT ? pendingExport : null;
        int exportSections = pendingExportSections;
        if (requestCode == REQ_EXPORT) {
            pendingExport = null;
            pendingExportSections = 0;
        }
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();

        if (requestCode == REQ_ARTWORK_EXPORT || requestCode == REQ_ARTWORK_IMPORT) {
            transferArtwork(requestCode, uri);
        } else if (requestCode == REQ_EXPORT) {
            try {
                if (exportSections == 0) {
                    toast("Choose which sections to export again");
                    return;
                }
                writeBackup(uri, prepared != null ? prepared : prepareExport(exportSections));
                toast("Mods backup saved");
            } catch (JSONException e) {
                toast("Couldn't create backup. " + e.getMessage());
            } catch (Exception e) {
                toast("Couldn't write the Mods backup");
            }
        } else if (requestCode == REQ_IMPORT) {
            String text;
            try (InputStream in = getContentResolver().openInputStream(uri)) {
                if (in == null) throw new IOException("No input stream");
                text = readAll(in);
            } catch (IOException | SecurityException e) {
                toast("Couldn't read the Mods backup. " + e.getMessage());
                return;
            }
            try {
                JSONObject backup = ConfigTransfer.readBackup(text);
                int available = (backup.has("settings") ? SETTINGS : 0)
                        | (backup.has("artwork") ? ARTWORK : 0);
                chooseBackupSections(false, available, sections -> importBackup(backup, sections));
            } catch (JSONException e) {
                toast("Invalid Mods backup. " + e.getMessage());
            }
        }
    }

    private void importBackup(JSONObject backup, int sections) {
        boolean settings = (sections & SETTINGS) != 0;
        boolean artwork = (sections & ARTWORK) != 0;
        try {
            ConfigTransfer.ImportResult result = ConfigTransfer.importJson(this, backup, settings, artwork);
            String message = "Imported ";
            if (settings) message += result.settings + " settings";
            if (settings && artwork) message += " and ";
            if (artwork) message += result.artwork.imported + " artwork choices";
            if (result.skippedSettings > 0) message += ". Skipped " + result.skippedSettings + " invalid settings";
            if (result.artwork.occupied > 0) message += ". Kept " + result.artwork.occupied + " existing artwork choices";
            boolean changed = result.settings > 0 || result.artwork.imported > 0;
            ModDialog.show(this, "Backup imported", message + ".", "OK",
                    changed ? this::refreshSettings : null, null, null);
        } catch (JSONException e) {
            toast("Invalid Mods backup. " + e.getMessage());
        } catch (RuntimeException e) {
            toast("Couldn't finish restoring the backup. Some changes may have been applied.");
        }
    }

    private static byte[] backupBytes(String text) throws IOException {
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        if (bytes.length > MAX_BACKUP_BYTES) throw new IOException("Backup is too large");
        return bytes;
    }

    private void writeBackup(Uri uri, byte[] bytes) throws IOException {
        try (OutputStream out = getContentResolver().openOutputStream(uri, "wt")) {
            if (out == null) throw new IOException("No output stream");
            out.write(bytes);
        }
    }

    void confirmReset(boolean all) {
        ModDialog.show(this, all ? "Reset all Morphe data?" : "Reset settings?",
                all ? "Delete your Mods settings, custom artwork, TMDB API key, and temporary Mods caches. "
                        + "Your Letterboxd account and app data stay as they are."
                    : "Restore Mods preferences to their defaults. Your custom artwork and TMDB API key are kept.",
                "Reset", () -> reset(all), "Cancel", null);
    }

    private void reset(boolean all) {
        boolean saved;
        if (all) {
            saved = ConfigTransfer.preferences(this).edit().clear().commit();
            saved &= new ArtworkStore(this).reset();
            saved &= TmdbCredential.remove(this);
            ImdbTrivia.clearCache();
            ArtworkHooks.clearCache();
            File[] caches = getCodeCacheDir().listFiles((dir, name) -> name.equals("morphe-navicon.arsc")
                    || name.equals("morphe-oled.arsc")
                    || (name.startsWith("morphe-accent-") && name.endsWith(".arsc")));
            if (caches != null) {
                for (File cache : caches) saved &= cache.delete();
            }
        } else {
            saved = ConfigTransfer.resetSettings(this);
        }
        toast(saved ? (all ? "Morphe data reset" : "Mods settings reset")
                : "Reset was incomplete. Please try again.");
        refreshSettings();
    }

    private void refreshSettings() {
        refreshOnCreate = true;
        recreate();
    }

    @Override
    protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putBoolean("modsRestartPending", refreshOnCreate);
        state.putBoolean("featureGuideOpen", guideOpen);
        state.putInt("pendingExportSections", pendingExportSections);
    }

    private static String readAll(InputStream in) throws IOException {
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        byte[] chunk = new byte[4096];
        int read;
        int total = 0;
        while ((read = in.read(chunk)) != -1) {
            total += read;
            if (total > MAX_BACKUP_BYTES) throw new IOException("Backup is too large");
            buf.write(chunk, 0, read);
        }
        return buf.toString("UTF-8");
    }

    private void toast(String message) {
        try {
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }
}
