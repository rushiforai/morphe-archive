package app.immersivekeyboard.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

/**
 * Picks a light or dark mode wallpaper in vivo's own Themes app. Themes cannot hand an image
 * back to another app, it can only apply one, so this opens its wallpaper section and, once
 * a wallpaper has been applied there and Gboard is back on screen, copies the wallpaper that
 * is now set. Anything Themes can apply works, downloads from its store included, except
 * live wallpapers, which are not images. The wallpaper of the mode currently showing is put
 * back afterwards.
 *
 * Reading the current wallpaper needs All files access, which is asked for only here.
 */
final class VivoThemesPicker {
    private static final String TAG = "ImmersiveKB";
    private static final String THEMES_PACKAGE = "com.bbk.theme";
    private static final String[] WALLPAPER_ACTIONS = {
            "vivo.intent.action.theme.WALLPAPER_FROM_SETTINGS",
            "com.bbk.theme.wallpaper",
            Intent.ACTION_SET_WALLPAPER,
    };

    private static Pending pending;

    private VivoThemesPicker() {
    }

    static void pick(Activity activity, boolean light, Runnable done) {
        if (!Environment.isExternalStorageManager()) {
            new AlertDialog.Builder(activity)
                    .setTitle("Allow access to the wallpaper")
                    .setMessage("To copy the wallpaper you apply in vivo Themes, Gboard needs "
                            + "All files access. Turn it on for Gboard on the next screen, "
                            + "then come back and choose \"Pick in vivo Themes\" again.")
                    .setPositiveButton("Continue", (dialog, which) -> openAccessSettings(activity))
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
            return;
        }
        WallpaperManager manager = WallpaperManager.getInstance(activity);
        int startId = manager.getWallpaperId(WallpaperManager.FLAG_SYSTEM);
        Intent intent = null;
        for (String action : WALLPAPER_ACTIONS) {
            Intent candidate = new Intent(action).setPackage(THEMES_PACKAGE);
            if (candidate.resolveActivity(activity.getPackageManager()) != null) {
                intent = candidate;
                break;
            }
        }
        if (intent == null) {
            intent = activity.getPackageManager().getLaunchIntentForPackage(THEMES_PACKAGE);
        }
        if (intent == null) {
            Toast.makeText(activity, "vivo Themes isn't available", Toast.LENGTH_SHORT).show();
            return;
        }
        cancel();
        pending = new Pending(activity, light, startId, done);
        activity.getApplication().registerActivityLifecycleCallbacks(pending);
        try {
            activity.startActivity(intent);
            Toast.makeText(activity, "Apply a wallpaper, then come back to Gboard",
                    Toast.LENGTH_LONG).show();
        } catch (Throwable failure) {
            cancel();
            Log.w(TAG, "could not open vivo Themes", failure);
            Toast.makeText(activity, "Couldn't open vivo Themes", Toast.LENGTH_SHORT).show();
        }
    }

    private static void openAccessSettings(Activity activity) {
        try {
            activity.startActivity(new Intent(
                    Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                    Uri.parse("package:" + activity.getPackageName())));
        } catch (Throwable failure) {
            activity.startActivity(new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION));
        }
    }

    private static void cancel() {
        if (pending != null) {
            pending.application.unregisterActivityLifecycleCallbacks(pending);
            pending = null;
        }
    }

    /** Copies the wallpaper now set, as the given mode's wallpaper. */
    private static void capture(Activity activity, Pending request) {
        Context context = activity.getApplicationContext();
        WallpaperManager manager = WallpaperManager.getInstance(context);
        if (manager.getWallpaperId(WallpaperManager.FLAG_SYSTEM) == request.startId) {
            Toast.makeText(context, "The wallpaper didn't change", Toast.LENGTH_SHORT).show();
            return;
        }
        if (manager.getWallpaperInfo() != null) {
            Toast.makeText(context, "That's a live wallpaper, which can't be switched. "
                    + "Choose a still one.", Toast.LENGTH_LONG).show();
            restore(context);
            return;
        }
        byte[] image;
        try {
            image = read(manager);
        } catch (Throwable failure) {
            Log.w(TAG, "could not read the wallpaper", failure);
            image = null;
        }
        if (image == null) {
            Toast.makeText(context, "Couldn't read the wallpaper", Toast.LENGTH_SHORT).show();
            return;
        }
        byte[] bytes = image;
        boolean light = request.light;
        WallpaperSwitch.save(context, () -> new ByteArrayInputStream(bytes), light, () -> {
            if (light != ThemeDarkMode.isLight(context)) {
                // Themes set the other mode's wallpaper; show this mode's again.
                restore(context);
            }
            if (request.done != null) {
                request.done.run();
            }
        });
    }

    private static void restore(Context context) {
        WallpaperSwitch.reapply(context);
    }

    private static byte[] read(WallpaperManager manager) throws Exception {
        try (ParcelFileDescriptor file = manager.getWallpaperFile(WallpaperManager.FLAG_SYSTEM)) {
            if (file != null) {
                try (ParcelFileDescriptor.AutoCloseInputStream input =
                             new ParcelFileDescriptor.AutoCloseInputStream(file.dup())) {
                    ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                    byte[] buffer = new byte[64 * 1024];
                    int read;
                    while ((read = input.read(buffer)) > 0) {
                        bytes.write(buffer, 0, read);
                    }
                    if (bytes.size() > 0) {
                        return bytes.toByteArray();
                    }
                }
            }
        }
        // The built-in default wallpaper has no file of its own.
        Drawable drawable = manager.getDrawable(WallpaperManager.FLAG_SYSTEM);
        if (drawable instanceof BitmapDrawable) {
            Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, bytes);
            return bytes.toByteArray();
        }
        return null;
    }

    private static final class Pending implements Application.ActivityLifecycleCallbacks {
        final Application application;
        final Activity host;
        final boolean light;
        final int startId;
        final Runnable done;
        boolean left;

        Pending(Activity host, boolean light, int startId, Runnable done) {
            this.application = host.getApplication();
            this.host = host;
            this.light = light;
            this.startId = startId;
            this.done = done;
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (activity == host) {
                left = true;
            }
        }

        @Override
        public void onActivityResumed(Activity activity) {
            if (activity != host || !left) {
                return;
            }
            cancel();
            try {
                capture(activity, this);
            } catch (Throwable failure) {
                Log.w(TAG, "could not copy the vivo wallpaper", failure);
            }
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (activity == host) {
                cancel();
            }
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {
        }
    }
}
