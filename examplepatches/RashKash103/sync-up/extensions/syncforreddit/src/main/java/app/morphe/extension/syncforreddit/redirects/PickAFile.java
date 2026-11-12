package app.morphe.extension.syncforreddit.redirects;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.OpenableColumns;
import android.util.Base64;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Reading a file the reader chooses, for the certificates.
 *
 * <p>A certificate was pasted in and nothing else, because Sync asks for no storage permission
 * at all — and a .p12 is a few kilobytes of base64 that cannot sensibly be typed or even pasted
 * from most places. What needs no permission is the system's own document picker: it hands back
 * a reference to one file the reader chose, and that grant is all the access it gives. Nothing
 * here can read a path of its own choosing, which is exactly the point.
 *
 * <p><b>Why the result comes back here rather than to the screen that asked.</b> A result is
 * delivered to the activity, and the way a fragment is handed one goes through members the app's
 * minifier has renamed. What has not been renamed is {@code onActivityResult} itself: it
 * overrides a method of the framework's, so its name is fixed, and {@code ComponentActivity}
 * carries one that every activity in the app inherits. The patch calls {@link #whatCameBack}
 * from there, and the one thing waiting for a file is told.
 */
public final class PickAFile {
    /**
     * Our request, distinctive enough not to be confused with one of the app's and small enough
     * to leave the top sixteen bits clear — a fragment's results are told apart by those, and a
     * code with any of them set is dispatched to a fragment instead of reaching the activity.
     */
    private static final int OURS = 0x5C07;

    /** A certificate is kilobytes. Anything of this size is not one, and is not read in. */
    private static final int MOST_BYTES = 512 * 1024;

    /** What is to be done with the file, where something is waiting for one. */
    public interface Read {
        /**
         * @param name What the file is called, for saying which one was read.
         * @param contents Its text where it is PEM, and base64 of its bytes otherwise.
         */
        void read(String name, String contents);
    }

    /** At most one thing waits for a file: there is one dialog, and it is in front. */
    @Nullable
    private static volatile Read waiting;

    private PickAFile() {}

    /**
     * Asks for a file.
     *
     * @return Whether the picker opened. Where it did not — an activity that cannot be reached,
     *         or a device with nothing to pick with — what asked says so rather than appearing
     *         to do nothing.
     */
    public static boolean ask(Context from, Read whenRead) {
        Activity activity = activityOf(from);
        if (activity == null) {
            Logger.printInfo(() -> "pick: no activity to open the picker from");
            return false;
        }
        try {
            Intent asking = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            asking.addCategory(Intent.CATEGORY_OPENABLE);
            // Anything: a certificate arrives as .p12, .pfx, .pem, .crt or no ending at all,
            // and most providers give the wrong type for all of them.
            asking.setType("*/*");
            waiting = whenRead;
            activity.startActivityForResult(asking, OURS);
            return true;
        } catch (Exception ex) {
            waiting = null;
            Logger.printInfo(() -> "pick: could not open the picker: " + ex);
            return false;
        }
    }

    /**
     * Called for every result the app is handed, so the first thing it does is decide whether
     * this one is ours. Everything else is left alone untouched.
     */
    public static void whatCameBack(int requestCode, int resultCode, @Nullable Intent data) {
        if (requestCode != OURS) {
            return;
        }
        Read told = waiting;
        waiting = null;
        if (told == null) {
            return;
        }
        // Whatever the picker said, nothing is thrown from here: this runs inside the app's own
        // onActivityResult, and an exception there takes down the screen that is coming back.
        try {
            Uri chosen = resultCode == Activity.RESULT_OK && data != null ? data.getData() : null;
            if (chosen == null) {
                Logger.printDebug(() -> "pick: nothing was chosen");
                return;
            }
            // Off the drawing thread: a file from a cloud provider is downloaded as it is read,
            // and the picker is still closing.
            new Thread(() -> readIt(chosen, told), "sync-up-pick").start();
        } catch (Exception ex) {
            Logger.printInfo(() -> "pick: could not read what was chosen: " + ex);
        }
    }

    private static void readIt(Uri chosen, Read told) {
        String name = nameOf(chosen);
        try {
            byte[] bytes = bytesOf(chosen);
            if (bytes == null) {
                return;
            }
            // PEM is text and is kept as text, so that what is stored is what a reader would
            // recognise; anything else is bytes and is written out as base64, which is the
            // other thing a certificate is accepted as.
            String text = new String(bytes, StandardCharsets.UTF_8);
            String contents = text.contains("-----BEGIN")
                    ? text : Base64.encodeToString(bytes, Base64.NO_WRAP);
            Logger.printDebug(() -> "pick: read " + bytes.length + " bytes from " + name);
            onTheScreen(() -> told.read(name, contents));
        } catch (Exception ex) {
            Logger.printInfo(() -> "pick: could not read " + name + ": " + ex);
        }
    }

    @Nullable
    private static byte[] bytesOf(Uri chosen) {
        Context context = Utils.getContext();
        if (context == null) {
            return null;
        }
        try (InputStream reading = context.getContentResolver().openInputStream(chosen)) {
            if (reading == null) {
                return null;
            }
            ByteArrayOutputStream held = new ByteArrayOutputStream();
            byte[] block = new byte[8192];
            int read;
            while ((read = reading.read(block)) > 0) {
                held.write(block, 0, read);
                if (held.size() > MOST_BYTES) {
                    Logger.printInfo(() -> "pick: that file is larger than " + MOST_BYTES
                            + " bytes, which no certificate is");
                    return null;
                }
            }
            return held.toByteArray();
        } catch (Exception ex) {
            Logger.printInfo(() -> "pick: could not be read: " + ex);
            return null;
        }
    }

    /** @return What the file is called, or the end of its address where that cannot be had. */
    private static String nameOf(Uri chosen) {
        Context context = Utils.getContext();
        if (context != null) {
            ContentResolver asking = context.getContentResolver();
            try (Cursor said = asking.query(chosen, null, null, null, null)) {
                if (said != null && said.moveToFirst()) {
                    int column = said.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                    if (column >= 0) {
                        String name = said.getString(column);
                        if (name != null && !name.isEmpty()) {
                            return name;
                        }
                    }
                }
            } catch (Exception ex) {
                // Not every provider answers that, and the name is only for saying which file
                // was read.
                Logger.printDebug(() -> "pick: no name for what was chosen: " + ex);
            }
        }
        String last = chosen.getLastPathSegment();
        if (last == null || last.isEmpty()) {
            return "the file";
        }
        int slash = Math.max(last.lastIndexOf('/'), last.lastIndexOf(':'));
        return slash < 0 ? last : last.substring(slash + 1);
    }

    /** @return The activity behind a context, which is what a result can be asked for from. */
    @Nullable
    private static Activity activityOf(Context from) {
        Context looking = from;
        for (int depth = 0; depth < 20 && looking != null; depth++) {
            if (looking instanceof Activity) {
                return (Activity) looking;
            }
            if (!(looking instanceof ContextWrapper)) {
                return null;
            }
            looking = ((ContextWrapper) looking).getBaseContext();
        }
        return null;
    }

    private static void onTheScreen(Runnable what) {
        try {
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    what.run();
                } catch (Exception ex) {
                    Logger.printDebug(() -> "pick: nothing to hand the file to any more: " + ex);
                }
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "pick: could not reach the drawing thread: " + ex);
        }
    }
}
