package com.facebook.aura.settings.internal.mcdebug;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import org.json.JSONException;
import org.json.JSONObject;

public final class AuraMCDebugJsonBridge {
    private static final int REQUEST_EXPORT = 48173;
    private static final int REQUEST_IMPORT = 48174;
    private static final int MAX_IMPORT_BYTES = 16 * 1024 * 1024;
    private static final String[] IMPORT_MIME_TYPES = {
        "application/json", "application/x-ibackup"
    };

    private AuraMCDebugJsonBridge() {}

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) return (Activity) current;
            current = ((ContextWrapper) current).getBaseContext();
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static File overrideFile(Context context) {
        return new File(new File(context.getFilesDir(), "mobileconfig"), "mc_overrides.json");
    }

    public static void exportOverrides(Context context) {
        File source = overrideFile(context);
        if (!source.isFile()) {
            Toast.makeText(context, "Override file not found: " + source.getAbsolutePath(), Toast.LENGTH_LONG).show();
            return;
        }
        Activity activity = findActivity(context);
        if (activity == null) {
            Toast.makeText(context, "Document picker unavailable", Toast.LENGTH_LONG).show();
            return;
        }
        Intent intent = new Intent("android.intent.action.CREATE_DOCUMENT");
        intent.addCategory("android.intent.category.OPENABLE");
        intent.setType("application/json");
        intent.putExtra("android.intent.extra.TITLE", "muse_overrides.json");
        activity.startActivityForResult(intent, REQUEST_EXPORT);
    }

    public static void importOverrides(Context context) {
        Activity activity = findActivity(context);
        if (activity == null) {
            Toast.makeText(context, "Document picker unavailable", Toast.LENGTH_LONG).show();
            return;
        }
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
        intent.addCategory("android.intent.category.OPENABLE");
        intent.setType("*/*");
        intent.putExtra("android.intent.extra.MIME_TYPES", IMPORT_MIME_TYPES);
        activity.startActivityForResult(intent, REQUEST_IMPORT);
    }

    public static void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        if (requestCode != REQUEST_EXPORT && requestCode != REQUEST_IMPORT) return;
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) return;

        Uri uri = data.getData();
        try {
            ContentResolver resolver = activity.getContentResolver();
            if (requestCode == REQUEST_EXPORT) {
                copyToDocument(overrideFile(activity), resolver.openOutputStream(uri));
                Toast.makeText(activity, "muse_overrides.json exported", Toast.LENGTH_LONG).show();
            } else {
                copyToOverrideFile(resolver.openInputStream(uri), overrideFile(activity));
                Toast.makeText(activity, "Mobile Config overrides imported", Toast.LENGTH_LONG).show();
            }
        } catch (Exception error) {
            String message = error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
            Toast.makeText(activity, "JSON import/export failed: " + message, Toast.LENGTH_LONG).show();
        }
    }

    private static void copyToDocument(File source, OutputStream output) throws Exception {
        if (output == null) throw new IllegalStateException("Unable to write selected file");
        if (!source.isFile()) {
            output.close();
            throw new IllegalStateException("Override file not found: " + source.getAbsolutePath());
        }
        try (InputStream input = new FileInputStream(source); OutputStream destination = output) {
            copy(input, destination);
        }
    }

    private static void copyToOverrideFile(InputStream input, File destination) throws Exception {
        if (input == null) throw new IllegalStateException("Unable to read selected file");
        File parent = destination.getParentFile();
        if (parent == null || (!parent.isDirectory() && !parent.mkdirs())) {
            input.close();
            throw new IllegalStateException("Unable to access app storage for Mobile Config overrides");
        }

        File temporary = new File(parent, destination.getName() + ".tmp");
        try (InputStream source = input; OutputStream output = new FileOutputStream(temporary)) {
            copyWithLimit(source, output, MAX_IMPORT_BYTES);
        } catch (Exception error) {
            temporary.delete();
            throw error;
        }

        try {
            JSONObject imported = readJsonObject(temporary);
            JSONObject overrides = extractOverrides(imported);
            if (overrides == null) throw new JSONException("Import must contain a JSON object of overrides");
            try (OutputStream output = new FileOutputStream(temporary)) {
                output.write(overrides.toString().getBytes(StandardCharsets.UTF_8));
                output.flush();
            }
        } catch (Exception error) {
            temporary.delete();
            throw error;
        }

        File backup = new File(parent, destination.getName() + ".bak");
        if (backup.exists() && !backup.delete()) {
            temporary.delete();
            throw new IllegalStateException("Unable to prepare override file replacement");
        }
        boolean hadDestination = destination.exists();
        if (hadDestination && !destination.renameTo(backup)) {
            temporary.delete();
            throw new IllegalStateException("Unable to preserve existing override file");
        }
        if (!temporary.renameTo(destination)) {
            temporary.delete();
            if (hadDestination && !backup.renameTo(destination)) {
                throw new IllegalStateException("Unable to save import or restore the existing override file");
            }
            throw new IllegalStateException("Unable to save imported override file");
        }
        if (hadDestination) backup.delete();
    }

    private static JSONObject readJsonObject(File file) throws Exception {
        StringBuilder json = new StringBuilder();
        try (InputStream input = new FileInputStream(file);
             InputStreamReader inputReader = new InputStreamReader(input, StandardCharsets.UTF_8);
             BufferedReader reader = new BufferedReader(inputReader)) {
            char[] buffer = new char[4096];
            int count;
            while ((count = reader.read(buffer)) != -1) json.append(buffer, 0, count);
        }
        return new JSONObject(json.toString());
    }

    private static JSONObject extractOverrides(JSONObject imported) throws JSONException {
        boolean hasEnvelopeMarker = imported.has("manifest_version")
                || imported.has("info") || imported.has("backup");
        if (hasEnvelopeMarker) {
            if (!imported.has("manifest_version") || !imported.has("info") || !imported.has("backup")
                    || !(imported.get("info") instanceof JSONObject)
                    || !(imported.get("backup") instanceof JSONObject)) {
                throw new JSONException("Invalid Instafel .ibackup file");
            }
            return imported.getJSONObject("backup");
        }
        return imported;
    }

    private static void copyWithLimit(InputStream input, OutputStream output, int maxBytes) throws Exception {
        byte[] buffer = new byte[8192];
        int total = 0;
        int count;
        while ((count = input.read(buffer)) != -1) {
            total += count;
            if (total > maxBytes) throw new IllegalStateException("Selected file is too large (maximum 16 MB)");
            output.write(buffer, 0, count);
        }
        output.flush();
    }

    private static void copy(InputStream input, OutputStream output) throws Exception {
        byte[] buffer = new byte[8192];
        int count;
        while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
        output.flush();
    }
}
