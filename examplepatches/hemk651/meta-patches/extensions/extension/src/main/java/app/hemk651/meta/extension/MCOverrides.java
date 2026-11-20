/*
 * Meta Patches — MobileConfig overrides installer.
 *
 * Forked from InstaFL (https://github.com/mamiiblt/instafel) by
 * mamiiblt (Muhammed Ali Bulut), rebranded to Meta Patches.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.content.Context;
import android.util.Log;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.zip.Inflater;

/**
 * Installs the bundled MobileConfig overrides into Instagram's native
 * overrides file {@code <filesDir>/mobileconfig/mc_overrides.json}.
 *
 * Instagram loads this file at MobileConfig init through its overrides
 * loader (single-line UTF-8 JSON, keyed {@code "<metaId>:"} with values
 * {@code "<subflag>: <name>: <value>"}). The bundled payload (the curated
 * {@code config/mc_overrides.json}, embedded at build time as
 * {@link BuildConfig#MC_OVERRIDES_JSON}) unlocks the Settings-level
 * Developer options and the dedicated Employee options entry.
 *
 * The file is written atomically (temp file + rename) and only when its
 * content differs, so repeated launches stay cheap. The payload becomes
 * active on the next MobileConfig init — either picked up live by the
 * app's overrides-file callback or after an app restart.
 *
 * A backup imported through the Mods menu (Mods &gt; Misc &gt; Import backup)
 * writes the same file and leaves a marker that makes {@link #install} stand
 * down, so the bundled payload does not overwrite the import; the import
 * screen can restore the bundled payload again.
 *
 * Never throws: any failure is logged and swallowed, it must not break
 * the app shell.
 */
public final class MCOverrides {

    private static final String TAG = "MetaPatchesMC";

    private static final String DIRECTORY = "mobileconfig";
    private static final String FILE_NAME = "mc_overrides.json";
    private static final String TEMP_SUFFIX = ".tmp";
    /**
     * Suffix of the marker file that records a user import. While it exists,
     * the bundled payload is not installed, because it would overwrite the
     * imported overrides on the next app start.
     */
    private static final String USER_MARKER_SUFFIX = ".user";

    private static boolean attempted;

    /**
     * Installs the bundled overrides file. Safe to call multiple times;
     * only the first call does work.
     *
     * @param context any Context (the Application works); may be null
     */
    public static void install(Context context) {
        if (attempted || context == null) {
            return;
        }
        attempted = true;
        try {
            installInternal(context);
        } catch (Throwable t) {
            Log.w(TAG, "Failed to install " + FILE_NAME, t);
        }
    }

    private static void installInternal(Context context) throws Exception {
        String content = inflate(BuildConfig.MC_OVERRIDES_JSON);
        if (content == null || content.isEmpty()) {
            Log.w(TAG, "No overrides payload bundled, skipping");
            return;
        }

        File filesDir = context.getFilesDir();
        if (filesDir == null) {
            return;
        }

        File directory = new File(filesDir, DIRECTORY);
        File target = new File(directory, FILE_NAME);

        // A user import must survive app restarts; the bundled payload would
        // overwrite it here (the content differs), so it wins until the user
        // restores the bundled overrides.
        if (new File(directory, FILE_NAME + USER_MARKER_SUFFIX).isFile()) {
            Log.i(TAG, "User import present, keeping " + FILE_NAME + " as-is");
            return;
        }

        if (target.isFile() && content.equals(readUtf8(target))) {
            return;
        }

        ensureDirectory(directory);
        writeAtomically(directory, target, content);
        Log.i(TAG, "Installed " + FILE_NAME + " (" + content.length() + " chars)");
    }

    /**
     * Installs a backup picked by the user into the overrides file.
     *
     * Mirrors the InstaFL backup import: the backup may wrap its payload
     * under a {@code "backup"} key; in merge mode only the entries the
     * current overrides file does not define are added, so the current
     * values win. The payload is written as compact single-line JSON, the
     * format Instagram's loader parses, and a marker file keeps the bundled
     * payload from overwriting the import on the next app start.
     *
     * @param rawJson the picked file content
     * @param merge   true to merge into the current file, false to replace it
     * @return null on success, otherwise a user-readable error message
     */
    public static String importOverrides(Context context, String rawJson, boolean merge) {
        if (context == null) {
            return "No context";
        }
        if (rawJson == null || rawJson.trim().isEmpty()) {
            return "The file is empty";
        }

        try {
            JSONObject picked = new JSONObject(rawJson);
            // InstaFL backups wrap the payload under "backup"; a bare payload
            // (an overrides file exported as-is) is imported directly.
            JSONObject payload = picked.has("backup") && picked.optJSONObject("backup") != null
                    ? picked.getJSONObject("backup")
                    : picked;

            File directory = overridesDirectory(context);
            if (directory == null) {
                return "Storage is not available";
            }

            JSONObject content = new JSONObject();
            if (merge) {
                JSONObject current = readJsonObject(new File(directory, FILE_NAME));
                if (current != null) {
                    content = current;
                }
            }
            for (Iterator<String> keys = payload.keys(); keys.hasNext(); ) {
                String key = keys.next();
                if (!content.has(key)) {
                    content.put(key, payload.get(key));
                }
            }

            ensureDirectory(directory);
            writeAtomically(directory, new File(directory, FILE_NAME), content.toString());
            writeUserMarker(directory);
            Log.i(TAG, "Imported overrides (" + (merge ? "merge" : "replace")
                    + ", " + content.length() + " keys)");
            return null;
        } catch (Exception e) {
            Log.w(TAG, "Failed to import the overrides backup", e);
            return e.getMessage() == null || e.getMessage().isEmpty()
                    ? e.getClass().getSimpleName() : e.getMessage();
        }
    }

    /**
     * Removes any user import and reinstalls the bundled payload. Future app
     * starts install the bundled payload again (and pick up bundle updates).
     *
     * @return true when the stored overrides were reset
     */
    public static boolean restoreBundled(Context context) {
        if (context == null) {
            return false;
        }
        try {
            File directory = overridesDirectory(context);
            if (directory != null) {
                new File(directory, FILE_NAME + USER_MARKER_SUFFIX).delete();
                new File(directory, FILE_NAME).delete();
            }
            attempted = false;
            install(context);
            Log.i(TAG, "Restored the bundled overrides");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Failed to restore the bundled overrides", t);
            return false;
        }
    }

    private static File overridesDirectory(Context context) {
        File filesDir = context.getFilesDir();
        return filesDir == null ? null : new File(filesDir, DIRECTORY);
    }

    private static void ensureDirectory(File directory) throws Exception {
        if (!directory.exists() && !directory.mkdirs()) {
            throw new IllegalStateException("Could not create " + directory);
        }
    }

    /**
     * Atomic write: temp file in the same directory, then rename; falls back
     * to a direct write when rename fails across filesystems.
     */
    private static void writeAtomically(File directory, File target, String content)
            throws Exception {
        File temp = new File(directory, FILE_NAME + TEMP_SUFFIX);
        try (FileOutputStream out = new FileOutputStream(temp)) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
            out.getFD().sync();
        }
        if (temp.renameTo(target)) {
            return;
        }
        try (FileOutputStream out = new FileOutputStream(target)) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
            out.getFD().sync();
        }
        temp.delete();
    }

    private static void writeUserMarker(File directory) throws Exception {
        File marker = new File(directory, FILE_NAME + USER_MARKER_SUFFIX);
        try (FileOutputStream out = new FileOutputStream(marker)) {
            out.write('1');
            out.flush();
            out.getFD().sync();
        }
    }

    /**
     * The parsed overrides file, or null when it does not exist or is not a
     * JSON object (merge then starts from an empty set of current entries).
     */
    private static JSONObject readJsonObject(File file) {
        if (file == null || !file.isFile()) {
            return null;
        }
        try (FileInputStream in = new FileInputStream(file);
             BufferedReader reader = new BufferedReader(
                     new InputStreamReader(in, StandardCharsets.UTF_8))) {
            StringBuilder content = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line);
            }
            return new JSONObject(content.toString());
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * The build embeds the payload deflated and base64-encoded (the raw
     * multi-parameter payload exceeds the JVM's 64 KiB string-constant
     * limit). The stream is a raw deflate stream with no zlib or gzip
     * wrapper, matching the build-side encoding.
     */
    private static String inflate(String encoded) throws Exception {
        if (encoded == null || encoded.isEmpty()) {
            return "";
        }
        byte[] compressed = android.util.Base64.decode(encoded, android.util.Base64.NO_WRAP);
        Inflater inflater = new Inflater(true);
        try {
            inflater.setInput(compressed);
            ByteArrayOutputStream out = new ByteArrayOutputStream(compressed.length * 4);
            byte[] buffer = new byte[8192];
            while (!inflater.finished()) {
                int n = inflater.inflate(buffer);
                if (n == 0 && inflater.needsInput()) {
                    throw new IllegalStateException("Truncated overrides payload");
                }
                out.write(buffer, 0, n);
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } finally {
            inflater.end();
        }
    }

    private static String readUtf8(File file) throws Exception {
        long length = file.length();
        if (length <= 0 || length > 1 << 20) {
            return "";
        }
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[(int) length];
            int total = 0;
            while (total < buffer.length) {
                int read = in.read(buffer, total, buffer.length - total);
                if (read < 0) {
                    break;
                }
                total += read;
            }
            return new String(buffer, 0, total, StandardCharsets.UTF_8);
        }
    }

    private MCOverrides() {
    }
}
