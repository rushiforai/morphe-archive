package local.wazemaps.themes;

import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;

/** Separate theme sources and independent day/night choices, applied on restart. */
public final class ThemeSelector {
    private static Context application() throws Exception {
        return (Context) Class.forName("k.z").getMethod("j", Class.class).invoke(null, Application.class);
    }

    private static final String TAG = "MorpheThemes";
    private static final String PREFS = "morphe_map_themes";
    private static final String[] IDS = {"waze", "google_v2", "oled"};
    private static final String[] NAMES = {"Waze original", "Google Maps", "OLED black"};
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static int index(String id) {
        for (int i = 0; i < IDS.length; i++) if (IDS[i].equals(id)) return i;
        return 1; // Includes the retired google_v1 preference.
    }

    private static String selected(Context context, String mode) {
        return IDS[index(prefs(context).getString(mode, "google_v2"))];
    }

    /** Runs after Waze's resource preparation, before the native renderer starts. */
    public static void prepare() {
        try {
            Context context = application();
            installFiles(context, selected(context, "day"), selected(context, "night"));
            Log.i(TAG, "Map themes prepared: light=" + selected(context, "day") + ", dark=" + selected(context, "night"));
        } catch (Exception error) {
            Log.e(TAG, "Could not prepare map themes", error);
        }
    }

    private static void write(File file, byte[] bytes) throws Exception {
        File parent = file.getParentFile();
        if (!parent.isDirectory() && !parent.mkdirs()) throw new java.io.IOException("Cannot create skin directory");
        File staged = new File(parent, file.getName() + ".morphe-tmp");
        try {
            Files.write(staged.toPath(), bytes);
            Files.move(staged.toPath(), file.toPath(), StandardCopyOption.ATOMIC_MOVE,
                    StandardCopyOption.REPLACE_EXISTING);
        } finally {
            Files.deleteIfExists(staged.toPath());
        }
    }

    /** Validate/read the entire pair first; restore the working copies on failure. */
    private static synchronized void installFiles(Context context, String day, String night) throws Exception {
        File root = new File(context.getFilesDir().getParentFile(), "waze/skins/default");
        File[] targets = new File[8];
        byte[][] before = new byte[8][];
        byte[][] after = new byte[8][];
        int n = 0;
        for (String variant : new String[]{"", "experiment/"}) {
            for (String mode : new String[]{"day", "night"}) {
              for (String editor : new String[]{"", "editor."}) {
                String id = "day".equals(mode) ? day : night;
                String relative = variant + "skin_values." + editor + mode + ".lua";
                boolean stock = "waze".equals(id) || (!editor.isEmpty() && !"oled".equals(id));
                String asset = stock ? "res/skins/default/" + relative
                        : "morphe/themes/" + IDS[index(id)] + "/" + relative;
                try (InputStream input = context.getAssets().open(asset);
                     java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream()) {
                    byte[] buffer = new byte[8192];
                    int length;
                    while ((length = input.read(buffer)) != -1) output.write(buffer, 0, length);
                    after[n] = output.toByteArray();
                }
                if (after[n].length < 1000) throw new java.io.IOException("Incomplete map theme");
                targets[n] = new File(root, relative);
                before[n] = targets[n].isFile() ? Files.readAllBytes(targets[n].toPath()) : null;
                n++;
              }
            }
        }
        int written = 0;
        try {
            for (; written < targets.length; written++) {
                if (!Arrays.equals(before[written], after[written])) write(targets[written], after[written]);
            }
        } catch (Exception error) {
            for (int i = 0; i < written; i++) {
                try {
                    if (before[i] == null) Files.deleteIfExists(targets[i].toPath());
                    else write(targets[i], before[i]);
                } catch (Exception restoreError) { error.addSuppressed(restoreError); }
            }
            throw error;
        }
    }

    /** Wrap only the existing Dark mode row, keeping its original click behaviour. */
    public static View decorate(View original) {
        if (original == null) return null;
        try {
            if (!"map_mode".equals(original.getTag()) && !"morphe_map_mode".equals(original.getTag())) return original;
            if (original.findViewWithTag("morphe_themes") != null) return original;
            Context context = original.getContext();
            boolean wrapped = "morphe_map_mode".equals(original.getTag());
            LinearLayout container = wrapped ? (LinearLayout) original : new LinearLayout(context);
            container.setOrientation(LinearLayout.VERTICAL);
            container.setTag("morphe_map_mode");
            View themes = row(context, "Themes", summary(context));
            themes.setTag("morphe_themes");
            themes.setOnClickListener(view -> show(context, themes));
            if (!wrapped) container.addView(original, new LinearLayout.LayoutParams(-1, -2));
            container.addView(themes, 1, new LinearLayout.LayoutParams(-1, -2));
            return container;
        } catch (Exception error) {
            Log.e(TAG, "Could not add Themes setting", error);
            return original;
        }
    }

    private static String summary(Context context) {
        return "Light: " + NAMES[index(selected(context, "day"))]
                + "  ·  Dark: " + NAMES[index(selected(context, "night"))];
    }

    private static View row(Context context, String title, String subtitle) throws Exception {
        Class<?> type = Class.forName("com.waze.settings.tree.views.WazeSettingsView");
        View view = (View) type.getConstructor(Context.class).newInstance(context);
        type.getMethod("N", String.class).invoke(view, title);
        type.getMethod("P", String.class).invoke(view, subtitle);
        type.getMethod("B", int.class).invoke(view, 1);
        return view;
    }

    private static void subtitle(View row, String text) throws Exception {
        row.getClass().getMethod("P", String.class).invoke(row, text);
    }

    private static void show(Context context, View settingsRow) {
        try {
            String[] draft = {selected(context, "day"), selected(context, "night")};
            LinearLayout content = new LinearLayout(context);
            content.setOrientation(LinearLayout.VERTICAL);
            View light = row(context, "Light theme", NAMES[index(draft[0])]);
            View dark = row(context, "Dark theme", NAMES[index(draft[1])]);
            content.addView(light, new LinearLayout.LayoutParams(-1, -2));
            content.addView(dark, new LinearLayout.LayoutParams(-1, -2));
            light.setOnClickListener(view -> choose(context, draft, 0, light));
            dark.setOnClickListener(view -> choose(context, draft, 1, dark));
            TextView note = new TextView(context);
            note.setText("Dark mode controls when Waze uses each map theme. OLED uses a pure black map background. Waze will restart to apply your choices.");
            int padding = Math.round(20 * context.getResources().getDisplayMetrics().density);
            note.setPadding(padding, padding, padding, padding);
            content.addView(note);
            AlertDialog dialog = new AlertDialog.Builder(context).setTitle("Themes")
                    .setView(content).setNegativeButton("Cancel", null).setPositiveButton("Apply & restart", null).create();
            dialog.setOnShowListener(ignored -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
                apply(context, draft, settingsRow, dialog);
            }));
            dialog.show();
        } catch (Exception error) {
            Log.e(TAG, "Could not show Themes", error);
            Toast.makeText(context, "Could not open Themes", Toast.LENGTH_LONG).show();
        }
    }

    private static void choose(Context context, String[] draft, int slot, View row) {
        new AlertDialog.Builder(context).setTitle(slot == 0 ? "Light theme" : "Dark theme")
                .setSingleChoiceItems(NAMES, index(draft[slot]), (dialog, which) -> {
                    draft[slot] = IDS[which];
                    try { subtitle(row, NAMES[which]); }
                    catch (Exception error) { Log.e(TAG, "Could not update theme label", error); }
                    dialog.dismiss();
                }).setNegativeButton("Cancel", null).show();
    }

    private static void apply(Context context, String[] draft, View settingsRow, AlertDialog dialog) {
        Context app = context.getApplicationContext();
        Runnable task = () -> {
            boolean saved = false;
            try {
                String oldDay = selected(app, "day"), oldNight = selected(app, "night");
                installFiles(app, draft[0], draft[1]);
                if (!prefs(app).edit().putString("day", draft[0]).putString("night", draft[1]).commit()) {
                    installFiles(app, oldDay, oldNight);
                    throw new java.io.IOException("Could not save theme choices");
                }
                saved = true;
                Log.i(TAG, "Theme choices saved: light=" + draft[0] + ", dark=" + draft[1]);
            } catch (Exception error) { Log.e(TAG, "Could not apply map themes", error); }
            final boolean didSave = saved;
            MAIN.post(() -> {
                if (didSave) {
                    try { subtitle(settingsRow, summary(context)); }
                    catch (Exception error) { Log.e(TAG, "Could not update Themes summary", error); }
                    dialog.dismiss();
                    restart(context);
                } else {
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);
                    Toast.makeText(context, "Could not apply themes. Please try again.", Toast.LENGTH_LONG).show();
                }
            });
        };
        try {
            Object queued = Class.forName("com.waze.NativeManager").getMethod("Post", Runnable.class).invoke(null, task);
            if (Boolean.FALSE.equals(queued)) throw new IllegalStateException("Map engine unavailable");
        } catch (Exception error) {
            Log.e(TAG, "Could not queue theme update", error);
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);
            Toast.makeText(context, "Map engine is not ready. Please try again.", Toast.LENGTH_LONG).show();
        }
    }

    static void restart(Context context) {
        try {
            // Match WazeApplication's existing respawn path: schedule a new root activity,
            // then terminate this process so native Lua caches are rebuilt on launch.
            Intent intent = Intent.makeRestartActivityTask(new ComponentName(context, "com.waze.FreeMapAppActivity"));
            context.startActivity(intent);
            System.exit(0);
        } catch (Exception error) {
            Log.e(TAG, "Could not restart Waze", error);
            Toast.makeText(context, "Themes saved. Close and reopen Waze to apply.", Toast.LENGTH_LONG).show();
        }
    }
}
