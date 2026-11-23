package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Saves and reads theme files through Android's file picker. It borrows no screen of its own: a
 * fragment with no view is attached to the open screen, asks for the file and gets the answer, then
 * removes itself. That works on any screen the Theme Manager is opened from.
 */
final class ThemeFiles {
    interface Done {
        void imported(String id);
    }

    private static final int REQUEST = 48160;

    private ThemeFiles() {
    }

    static void export(Activity from, String name, String text) {
        Picker picker = new Picker();
        picker.saving = true;
        picker.name = name;
        picker.text = text;
        launch(from, picker);
    }

    static void importFrom(Activity from, Done done) {
        Picker picker = new Picker();
        picker.done = done;
        launch(from, picker);
    }

    private static void launch(Activity from, Picker picker) {
        try {
            FragmentManager manager = from.getFragmentManager();
            manager.beginTransaction().add(picker, "mighty_morphing_theme_file").commitAllowingStateLoss();
            manager.executePendingTransactions();
            picker.begin();
        } catch (Throwable t) {
            Toast.makeText(from.getApplicationContext(), "Could not open the file picker", Toast.LENGTH_SHORT).show();
        }
    }

    public static final class Picker extends Fragment {
        boolean saving;
        String name;
        String text;
        Done done;

        void begin() {
            Intent pick;
            if (saving) {
                pick = new Intent(Intent.ACTION_CREATE_DOCUMENT);
                pick.addCategory(Intent.CATEGORY_OPENABLE);
                pick.setType("application/json");
                String clean = name == null ? "" : name.replaceAll("[^A-Za-z0-9 _-]", "").trim();
                pick.putExtra(Intent.EXTRA_TITLE, (clean.isEmpty() ? "theme" : clean) + ".mmtheme.json");
            } else {
                pick = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                pick.addCategory(Intent.CATEGORY_OPENABLE);
                pick.setType("*/*");
            }
            startActivityForResult(pick, REQUEST);
        }

        @Override
        public void onActivityResult(int request, int result, Intent data) {
            Activity activity = getActivity();
            try {
                if (request != REQUEST || activity == null) return;
                Uri uri = result == Activity.RESULT_OK && data != null ? data.getData() : null;
                if (uri == null) return;
                if (saving) {
                    if (text == null) return;
                    try (OutputStream out = activity.getContentResolver().openOutputStream(uri, "wt")) {
                        out.write(text.getBytes(StandardCharsets.UTF_8));
                    }
                    say(activity, "Theme saved");
                } else {
                    String content = read(activity, uri);
                    String id = content == null ? null : ModernTheme.importFile(activity, content);
                    if (id == null) say(activity, "That file is not a valid theme");
                    else if (done != null) done.imported(id);
                }
            } catch (Throwable t) {
                if (activity != null) say(activity, saving ? "Could not save the theme" : "That file is not a valid theme");
            } finally {
                try {
                    if (activity != null) activity.getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
                } catch (Throwable ignored) {
                }
            }
        }

        private static void say(Activity activity, String message) {
            Toast.makeText(activity.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
        }

        private static String read(Activity activity, Uri uri) throws Exception {
            try (InputStream in = activity.getContentResolver().openInputStream(uri)) {
                if (in == null) return null;
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int n;
                while ((n = in.read(buffer)) > 0) {
                    out.write(buffer, 0, n);
                    if (out.size() > 65536) return null;
                }
                return new String(out.toByteArray(), StandardCharsets.UTF_8);
            }
        }
    }
}
