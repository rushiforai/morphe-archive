/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;

import org.json.JSONArray;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.hushgram.extension.shared.Utils;

/** Prompts for the version-matched Instagram ID-to-name map used by MetaConfig. */
public final class DeveloperFlagMapping {
    private static final String MAPPINGS_URL = "https://raw.githubusercontent.com/xboyrex/rex-ig-lite/main/docs/mappings/";
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final ExecutorService DOWNLOAD = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean promptOpen;

    private DeveloperFlagMapping() { }

    public static File mappingFile(Context context) {
        File directory = new File(context.getFilesDir(), "mobileconfig");
        if (!directory.exists()) directory.mkdirs();
        return new File(directory, "id_name_mapping.json");
    }

    /** Validate Instagram's id_name_mapping format, then replace the saved file atomically. */
    public static int importMapping(Context context, byte[] bytes) throws Exception {
        if (bytes == null || bytes.length == 0 || bytes.length > MAX_BYTES) throw new IllegalArgumentException("Invalid mapping size");
        JSONArray rows = new JSONArray(new String(bytes, StandardCharsets.UTF_8));
        if (rows.length() == 0 || !(rows.opt(0) instanceof String)) throw new IllegalArgumentException("No mapping rows");
        for (int i = 0; i < rows.length(); i++) {
            String row = rows.optString(i, "");
            String[] fields = row.split(":", -1);
            if (fields.length < 4 || fields.length % 2 != 0 || fields[1].trim().isEmpty()) {
                throw new IllegalArgumentException("Invalid mapping row");
            }
            if (Integer.parseInt(fields[0]) < 0) throw new IllegalArgumentException("Invalid config ID");
            for (int field = 2; field < fields.length; field += 2) {
                if (Integer.parseInt(fields[field]) < 0 || fields[field + 1].trim().isEmpty()) {
                    throw new IllegalArgumentException("Invalid parameter mapping");
                }
            }
        }
        File destination = mappingFile(context);
        File temporary = new File(destination.getParentFile(), destination.getName() + ".tmp");
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(bytes);
            output.getFD().sync();
        }
        replace(temporary, destination);
        return rows.length();
    }

    private static void replace(File temporary, File destination) throws Exception {
        File backup = new File(destination.getParentFile(), destination.getName() + ".bak");
        if (backup.exists() && !backup.delete()) throw new IllegalStateException("Could not clear old mapping backup");
        boolean hadPrevious = destination.exists();
        if (hadPrevious && !destination.renameTo(backup)) throw new IllegalStateException("Could not preserve old mapping");
        if (!temporary.renameTo(destination)) {
            if (hadPrevious) backup.renameTo(destination);
            throw new IllegalStateException("Could not save mapping file");
        }
        backup.delete();
    }

    public static void checkMappings(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        File existing = mappingFile(activity);
        if (existing.isFile() && existing.length() > 10 * 1024) return;
        synchronized (DeveloperFlagMapping.class) {
            if (promptOpen) return;
            promptOpen = true;
        }
        activity.runOnUiThread(() -> {
            try {
                new AlertDialog.Builder(activity)
                        .setTitle("Developer option names")
                        .setMessage("The mapping file for this Instagram version is missing. Download it to show setting names in MetaConfig?")
                        .setNegativeButton("Later", (dialog, which) -> { })
                        .setPositiveButton("Download", (dialog, which) -> download(activity))
                        .setOnDismissListener(dialog -> promptOpen = false)
                        .show();
            } catch (RuntimeException failure) {
                promptOpen = false;
            }
        });
    }

    private static void download(Activity activity) {
        DOWNLOAD.execute(() -> {
            File destination = mappingFile(activity);
            File temporary = new File(destination.getParentFile(), destination.getName() + ".tmp");
            HttpURLConnection connection = null;
            try {
                PackageInfo info = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0);
                String version = info.versionName;
                if (version == null || !version.matches("[0-9.]+")) throw new IllegalStateException("Instagram version is unavailable");
                connection = (HttpURLConnection) new URL(MAPPINGS_URL + version + ".json").openConnection();
                connection.setConnectTimeout(15000);
                connection.setReadTimeout(20000);
                connection.setRequestProperty("User-Agent", "HushGram");
                if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                    throw new IllegalStateException("No mapping file is published for Instagram " + version);
                }
                try (InputStream input = connection.getInputStream(); ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                    byte[] buffer = new byte[8192];
                    int count;
                    while ((count = input.read(buffer)) != -1) {
                        if (output.size() + count > MAX_BYTES) throw new IllegalStateException("Mapping file is too large");
                        output.write(buffer, 0, count);
                    }
                    byte[] bytes = output.toByteArray();
                    JSONArray rows = new JSONArray(new String(bytes, StandardCharsets.UTF_8));
                    if (rows.length() == 0 || !(rows.opt(0) instanceof String)) {
                        throw new IllegalStateException("Mapping file has no ID-name rows");
                    }
                    try (FileOutputStream file = new FileOutputStream(temporary)) {
                        file.write(bytes);
                        file.getFD().sync();
                    }
                }
                replace(temporary, destination);
                MAIN.post(() -> restart(activity));
            } catch (Exception failure) {
                temporary.delete();
                MAIN.post(() -> {
                    if (!activity.isFinishing()) new AlertDialog.Builder(activity)
                            .setMessage("Couldn't download the mapping for this Instagram version. Try again later.")
                            .setPositiveButton(android.R.string.ok, null).show();
                });
            } finally {
                if (connection != null) connection.disconnect();
            }
        });
    }

    private static void restart(Activity activity) {
        if (activity.isFinishing()) return;
        new AlertDialog.Builder(activity)
                .setMessage("Mapping downloaded. Restart Instagram to show the names in MetaConfig.")
                .setCancelable(false)
                .setPositiveButton("Restart", (dialog, which) -> {
                    android.content.Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
                    if (intent != null) {
                        intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK | android.content.Intent.FLAG_ACTIVITY_CLEAR_TASK);
                        activity.startActivity(intent);
                        Process.killProcess(Process.myPid());
                    }
                })
                .setNegativeButton("Later", null)
                .show();
    }
}
