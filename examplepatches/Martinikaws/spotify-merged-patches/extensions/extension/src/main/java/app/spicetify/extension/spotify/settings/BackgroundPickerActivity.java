package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import app.spicetify.extension.spotify.theme.ThemeBackground;
import app.spicetify.extension.spotify.theme.ThemeRuntime;
import app.spicetify.extension.spotify.theme.ThemeState;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Lets the user pick one of their own pictures as the image behind Spotify's pages. The settings pages are
 * dialogs over Spotify's activity, which can't receive a picker's result, so this see-through activity asks
 * Android's document picker, saves the picture through {@link ThemeRuntime#select} with the theme in use,
 * and closes. The theme patch declares it in the manifest; a root mount install keeps the stock manifest,
 * and {@link #start} says so there. Nothing leaves the device: the picture is read once and a copy at about
 * screen size is kept in Spotify's private files.
 */
public final class BackgroundPickerActivity extends Activity {
    private static final String TAG = "Spicetify";
    private static final int REQUEST_IMAGE = 1;
    /** The most bytes read from a picked file. Photos are well under this; {@link ThemeBackground#fit} scales them down. */
    private static final int MAX_BYTES = 48 * 1024 * 1024;

    /** Opens the picker from a settings page, or explains why it can't open. */
    static void start(Context context) {
        try {
            context.startActivity(new Intent(context, BackgroundPickerActivity.class));
        } catch (ActivityNotFoundException | SecurityException e) {
            Toast.makeText(context, "Picking a picture isn't available for root mount installs.", Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) return; // The picker is already open; its result comes to the recreated activity.
        Intent pick = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        try {
            startActivityForResult(pick, REQUEST_IMAGE);
        } catch (ActivityNotFoundException e) {
            done("No app on this device can pick a picture.");
        }
    }

    @Override
    protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        Uri picture = request == REQUEST_IMAGE && result == RESULT_OK && data != null ? data.getData() : null;
        if (picture == null) {
            finish();
            return;
        }
        Context application = getApplicationContext();
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            String message;
            try {
                byte[] fitted = ThemeBackground.fit(application, read(picture));
                if (ThemeRuntime.select(application, ThemeState.load(application), fitted)) {
                    ThemeBackground.setCustom(application, true);
                    PatchSettings.markRestartRequired();
                    message = "Background image set. Restart Spotify to see it everywhere.";
                } else {
                    message = "Spotify couldn't apply that picture, so nothing changed.";
                }
            } catch (IOException | SecurityException e) {
                Log.w(TAG, "Background picture could not be read", e);
                message = "That picture couldn't be read: " + e.getMessage();
            } catch (OutOfMemoryError e) {
                message = "That picture is too large to use.";
            }
            String shown = message;
            main.post(() -> done(shown));
        }, "spicetify-background").start();
    }

    private byte[] read(Uri picture) throws IOException {
        try (InputStream input = getContentResolver().openInputStream(picture)) {
            if (input == null) throw new IOException("the file could not be opened");
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[64 * 1024];
            for (int count; (count = input.read(buffer)) >= 0; ) {
                if (bytes.size() + count > MAX_BYTES) throw new IOException("the file is larger than 48 MB");
                bytes.write(buffer, 0, count);
            }
            return bytes.toByteArray();
        }
    }

    private void done(String message) {
        Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
        finish();
    }
}
