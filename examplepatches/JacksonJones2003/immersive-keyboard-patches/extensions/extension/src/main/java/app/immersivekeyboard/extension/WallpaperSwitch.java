package app.immersivekeyboard.extension;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.WallpaperManager;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Switches the phone's wallpaper along with the system's dark mode: one image for light mode
 * and one for dark mode, chosen in the Themes screen's "Light & dark pair" card. Gboard's
 * keyboard process stays running in the background, so it hears about the mode change as it
 * happens, and checks again whenever the keyboard is shown in case it missed one.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class WallpaperSwitch {
    private static final String TAG = "ImmersiveKB";
    private static final String ENABLED = "wallpaper_enabled";
    private static final String HOME_ONLY = "wallpaper_home_only";
    private static final String APPLIED_MODE = "wallpaper_applied_mode";
    private static final String FOLDER = "immersive_wallpapers";
    private static final String PICKER_TAG = "immersive_keyboard_wallpaper_picker";

    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean listening;

    private WallpaperSwitch() {
    }

    /** Called whenever the keyboard checks the dark mode. */
    static void check(Context context, boolean light) {
        listen(context);
        update(context, light, false);
    }

    /** Hears dark mode changes while the keyboard is hidden. */
    private static synchronized void listen(Context context) {
        if (listening) {
            return;
        }
        listening = true;
        Context application = context.getApplicationContext();
        application.registerComponentCallbacks(new ComponentCallbacks() {
            @Override
            public void onConfigurationChanged(Configuration configuration) {
                try {
                    boolean light = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK)
                            != Configuration.UI_MODE_NIGHT_YES;
                    ThemeDarkMode.modeChanged(application, light);
                    update(application, light, false);
                } catch (Throwable failure) {
                    Log.w(TAG, "wallpaper mode change failed", failure);
                }
            }

            @Override
            public void onLowMemory() {
            }
        });
    }

    static boolean enabled(Context context) {
        return ThemeDarkMode.memory(context).getBoolean(ENABLED, false);
    }

    static void setEnabled(Context context, boolean enabled) {
        ThemeDarkMode.memory(context).edit().putBoolean(ENABLED, enabled)
                .remove(APPLIED_MODE).apply();
        if (enabled) {
            update(context, ThemeDarkMode.isLight(context), true);
        }
    }

    static boolean homeOnly(Context context) {
        return ThemeDarkMode.memory(context).getBoolean(HOME_ONLY, false);
    }

    static void setHomeOnly(Context context, boolean homeOnly) {
        ThemeDarkMode.memory(context).edit().putBoolean(HOME_ONLY, homeOnly).apply();
        update(context, ThemeDarkMode.isLight(context), true);
    }

    /** Sets the wallpaper of the mode showing again, after something else changed it. */
    static void reapply(Context context) {
        update(context, ThemeDarkMode.isLight(context), true);
    }

    static File image(Context context, boolean light) {
        return new File(new File(context.getFilesDir(), FOLDER), light ? "light" : "dark");
    }

    static boolean hasImage(Context context, boolean light) {
        return image(context, light).isFile();
    }

    static void remove(Context context, boolean light) {
        // Only our own copy; the photo itself stays where it was.
        image(context, light).delete();
        ThemeDarkMode.memory(context).edit().remove(APPLIED_MODE).apply();
    }

    /** A small preview of a chosen image, or null. Decodes on the calling thread. */
    static Bitmap thumbnail(Context context, boolean light, int size) {
        File file = image(context, light);
        if (!file.isFile()) {
            return null;
        }
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getPath(), bounds);
        int sample = 1;
        while (bounds.outWidth / (sample * 2) >= size && bounds.outHeight / (sample * 2) >= size) {
            sample *= 2;
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sample;
        return BitmapFactory.decodeFile(file.getPath(), options);
    }

    /** Sets the wallpaper for the mode, unless it was already set for it. */
    private static void update(Context context, boolean light, boolean force) {
        SharedPreferences memory = ThemeDarkMode.memory(context);
        if (!memory.getBoolean(ENABLED, false)) {
            return;
        }
        String mode = light ? "light" : "dark";
        if (!force && mode.equals(memory.getString(APPLIED_MODE, null))) {
            return;
        }
        Context application = context.getApplicationContext();
        WORKER.execute(() -> {
            try {
                File file = image(application, light);
                if (!file.isFile()) {
                    return;
                }
                int which = memory.getBoolean(HOME_ONLY, false) ? WallpaperManager.FLAG_SYSTEM
                        : WallpaperManager.FLAG_SYSTEM | WallpaperManager.FLAG_LOCK;
                try (InputStream input = new FileInputStream(file)) {
                    WallpaperManager.getInstance(application).setStream(input, null, true, which);
                }
                memory.edit().putString(APPLIED_MODE, mode).apply();
                Log.i(TAG, "switched to the " + mode + " wallpaper");
            } catch (Throwable failure) {
                Log.w(TAG, "could not set the " + mode + " wallpaper", failure);
            }
        });
    }

    /** Opens the photo picker; the chosen image is copied and used for the mode. */
    static void pick(Activity activity, boolean light, Runnable done) {
        FragmentManager manager = activity.getFragmentManager();
        Fragment old = manager.findFragmentByTag(PICKER_TAG);
        Picker picker = new Picker();
        picker.light = light;
        picker.done = done;
        android.app.FragmentTransaction transaction = manager.beginTransaction();
        if (old != null) {
            transaction.remove(old);
        }
        transaction.add(picker, PICKER_TAG).commitNowAllowingStateLoss();
    }

    /** Where a chosen image is read from. */
    interface Source {
        InputStream open() throws Exception;
    }

    private static void save(Context context, Uri uri, boolean light, Runnable done) {
        Context application = context.getApplicationContext();
        save(application, () -> application.getContentResolver().openInputStream(uri), light,
                done);
    }

    /** Copies the image for the mode, then uses it if that mode is showing. */
    static void save(Context context, Source source, boolean light, Runnable done) {
        Context application = context.getApplicationContext();
        WORKER.execute(() -> {
            boolean saved = false;
            try {
                File file = image(application, light);
                File folder = file.getParentFile();
                if (folder != null) {
                    folder.mkdirs();
                }
                File partial = new File(folder, file.getName() + ".part");
                try (InputStream input = source.open();
                        OutputStream output = new FileOutputStream(partial)) {
                    if (input == null) {
                        throw new IllegalStateException("no image");
                    }
                    byte[] buffer = new byte[64 * 1024];
                    int read;
                    while ((read = input.read(buffer)) > 0) {
                        output.write(buffer, 0, read);
                    }
                }
                saved = partial.renameTo(file);
            } catch (Throwable failure) {
                Log.w(TAG, "could not save the wallpaper image", failure);
            }
            boolean ok = saved;
            MAIN.post(() -> {
                Toast.makeText(application, ok
                        ? (light ? "Light" : "Dark") + " mode wallpaper saved"
                        : "Couldn't use that image", Toast.LENGTH_SHORT).show();
                if (ok && light == ThemeDarkMode.isLight(application)) {
                    update(application, light, true);
                }
                if (done != null) {
                    done.run();
                }
            });
        });
    }

    /** Receives the photo picker's result for the Themes screen. */
    public static final class Picker extends Fragment {
        private static final int REQUEST = 0x1D5;
        boolean light;
        Runnable done;

        public Picker() {
        }

        @Override
        public void onCreate(android.os.Bundle state) {
            super.onCreate(state);
            if (state != null) {
                // Recreated after the app was in the background: there is no menu to update.
                light = state.getBoolean("light");
                return;
            }
            Intent intent;
            if (Build.VERSION.SDK_INT >= 33) {
                intent = new Intent(MediaStore.ACTION_PICK_IMAGES).setType("image/*");
            } else {
                intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                        .addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
            }
            try {
                startActivityForResult(intent, REQUEST);
            } catch (Throwable failure) {
                startActivityForResult(new Intent(Intent.ACTION_GET_CONTENT)
                        .addCategory(Intent.CATEGORY_OPENABLE).setType("image/*"), REQUEST);
            }
        }

        @Override
        public void onSaveInstanceState(android.os.Bundle state) {
            super.onSaveInstanceState(state);
            state.putBoolean("light", light);
        }

        @Override
        public void onActivityResult(int request, int result, Intent data) {
            if (request != REQUEST) {
                return;
            }
            Activity activity = getActivity();
            if (result == Activity.RESULT_OK && data != null && data.getData() != null
                    && activity != null) {
                save(activity, data.getData(), light, done);
            }
            if (activity != null && !activity.isFinishing()) {
                getFragmentManager().beginTransaction().remove(this)
                        .commitAllowingStateLoss();
            }
        }
    }
}
