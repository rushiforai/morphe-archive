package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/** Transparent Activity that owns the Storage Access Framework picker callbacks. */
public final class HelakuruLiteSettingsBackupActivity extends Activity {
    private static final int REQUEST_EXPORT = 7401;
    private static final int REQUEST_IMPORT = 7402;
    private static final int MAX_PROFILE_BYTES = 1024 * 1024;
    private static final String FORMAT = "helakuru-lite-morphe-settings";
    private static final int FORMAT_VERSION = 1;
    private static final String GENERAL_PREFERENCES = "generalPreferences";
    private static final String[] GENERAL_KEYS = {"vibrate", "sound"};
    private static final Map<String, String> DEFAULT_TYPES = createDefaultTypes();
    private static final Map<String, String> GENERAL_TYPES = createGeneralTypes();

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        String mode = getIntent().getStringExtra(HelakuruLiteSettingsBackupExtension.EXTRA_MODE);
        if (HelakuruLiteSettingsBackupExtension.MODE_EXPORT.equals(mode)) {
            Intent picker = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .setType("application/json")
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .putExtra(Intent.EXTRA_TITLE, "helakuru-lite-morphe-settings.json");
            launchPicker(picker, REQUEST_EXPORT);
        } else if (HelakuruLiteSettingsBackupExtension.MODE_IMPORT.equals(mode)) {
            Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .setType("application/json")
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            launchPicker(picker, REQUEST_IMPORT);
        } else {
            finish();
        }
    }

    private void launchPicker(Intent intent, int requestCode) {
        try {
            startActivityForResult(intent, requestCode);
        } catch (Throwable ignored) {
            Toast.makeText(this, "No file picker is available", Toast.LENGTH_LONG).show();
            finish();
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_EXPORT && requestCode != REQUEST_IMPORT) return;
        if (resultCode != RESULT_OK || data == null || data.getData() == null) {
            finish();
            return;
        }
        try {
            if (requestCode == REQUEST_EXPORT) {
                exportProfile(data.getData());
                Toast.makeText(this, "Keyboard settings exported", Toast.LENGTH_SHORT).show();
            } else {
                ImportPlan plan = readImportPlan(data.getData());
                if (plan.crossPackage) {
                    confirmCrossPackageImport(plan);
                    return;
                }
                applyImport(plan);
                finishImport();
            }
        } catch (Throwable exception) {
            Toast.makeText(this, "Unable to read or write the settings file", Toast.LENGTH_LONG).show();
        }
        finish();
    }

    private void exportProfile(android.net.Uri uri) throws Exception {
        JSONObject profile = new JSONObject();
        profile.put("format", FORMAT);
        profile.put("version", FORMAT_VERSION);
        profile.put("package", getPackageName());

        JSONObject defaultValues = new JSONObject();
        SharedPreferences defaults = PreferenceManager.getDefaultSharedPreferences(this);
        for (Map.Entry<String, ?> entry : defaults.getAll().entrySet()) {
            if (entry.getKey().startsWith("morphe_")) {
                defaultValues.put(entry.getKey(), encode(entry.getValue()));
            }
        }
        profile.put("defaultPreferences", defaultValues);

        JSONObject generalValues = new JSONObject();
        SharedPreferences general = getSharedPreferences(GENERAL_PREFERENCES, MODE_PRIVATE);
        for (String key : GENERAL_KEYS) {
            if (general.contains(key)) generalValues.put(key, encode(general.getAll().get(key)));
        }
        profile.put("generalPreferences", generalValues);

        try (OutputStream output = getContentResolver().openOutputStream(uri, "w")) {
            if (output == null) throw new java.io.IOException("Unable to open output file");
            output.write(profile.toString(2).getBytes(StandardCharsets.UTF_8));
            output.flush();
        }
    }

    private ImportPlan readImportPlan(android.net.Uri uri) throws Exception {
        String content;
        try (InputStream input = getContentResolver().openInputStream(uri)) {
            if (input == null) throw new java.io.IOException("Unable to open input file");
            content = readLimited(input);
        }

        JSONObject profile = new JSONObject(content);
        if (!FORMAT.equals(profile.optString("format"))
                || profile.optInt("version", -1) != FORMAT_VERSION) {
            throw new JSONException("Unsupported settings profile");
        }
        String sourcePackage = profile.optString("package", "");
        if (sourcePackage.trim().isEmpty()) throw new JSONException("Missing profile package");
        boolean crossPackage = !getPackageName().equals(sourcePackage);

        JSONObject encodedDefaults = profile.getJSONObject("defaultPreferences");
        JSONObject encodedGeneral = profile.getJSONObject("generalPreferences");
        Map<String, Object> defaultValues;
        Map<String, Object> generalValues;
        int total = encodedDefaults.length() + encodedGeneral.length();
        int compatible;
        if (crossPackage) {
            FilteredValues defaults = decodeCompatibleValues(encodedDefaults, DEFAULT_TYPES);
            FilteredValues general = decodeCompatibleValues(encodedGeneral, GENERAL_TYPES);
            defaultValues = defaults.values;
            generalValues = general.values;
            compatible = defaultValues.size() + generalValues.size();
        } else {
            defaultValues = decodeValues(encodedDefaults, false);
            generalValues = decodeValues(encodedGeneral, true);
            compatible = defaultValues.size() + generalValues.size();
        }
        return new ImportPlan(sourcePackage, crossPackage, defaultValues, generalValues,
                compatible, total - compatible);
    }

    private void confirmCrossPackageImport(ImportPlan plan) {
        String message = "This profile was exported from a different package.\n\n"
                + "From: " + plan.sourcePackage + "\n"
                + "To: " + getPackageName() + "\n\n"
                + "Compatible settings to import: " + plan.compatibleCount + "\n"
                + "Settings to skip: " + plan.skippedCount;
        AlertDialog.Builder builder = new AlertDialog.Builder(this)
                .setTitle(plan.compatibleCount == 0
                        ? "No compatible settings" : "Import settings from another package?")
                .setMessage(message);
        if (plan.compatibleCount == 0) {
            builder.setPositiveButton("OK", (d, which) -> finish());
        } else {
            builder.setNegativeButton("Cancel", (d, which) -> finish())
                .setPositiveButton("Import", (d, which) -> {
                    try {
                        applyImport(plan);
                        finishImport();
                    } catch (Throwable exception) {
                        Toast.makeText(this, "Unable to save imported settings", Toast.LENGTH_LONG).show();
                        finish();
                    }
                });
        }
        AlertDialog dialog = builder.create();
        dialog.setOnCancelListener(ignored -> finish());
        dialog.show();
    }

    private void applyImport(ImportPlan plan) throws Exception {

        SharedPreferences defaults = PreferenceManager.getDefaultSharedPreferences(this);
        SharedPreferences general = getSharedPreferences(GENERAL_PREFERENCES, MODE_PRIVATE);
        SharedPreferences.Editor defaultsEditor = defaults.edit();
        SharedPreferences.Editor generalEditor = general.edit();
        for (Map.Entry<String, Object> entry : plan.defaultValues.entrySet()) {
            put(defaultsEditor, entry.getKey(), entry.getValue());
        }
        for (Map.Entry<String, Object> entry : plan.generalValues.entrySet()) {
            put(generalEditor, entry.getKey(), entry.getValue());
        }
        if (!defaultsEditor.commit() || !generalEditor.commit()) {
            throw new java.io.IOException("Unable to save imported settings");
        }
    }

    private void finishImport() {
        HelakuruLiteSettingsBackupExtension.refreshSettingsScreen();
        Toast.makeText(this, "Keyboard settings imported", Toast.LENGTH_SHORT).show();
        finish();
    }

    private static JSONObject encode(Object value) throws JSONException {
        JSONObject encoded = new JSONObject();
        if (value instanceof Boolean) {
            encoded.put("type", "boolean").put("value", value);
        } else if (value instanceof Integer) {
            encoded.put("type", "int").put("value", value);
        } else if (value instanceof Long) {
            encoded.put("type", "long").put("value", value);
        } else if (value instanceof Float) {
            encoded.put("type", "float").put("value", value);
        } else if (value instanceof String) {
            encoded.put("type", "string").put("value", value);
        } else if (value instanceof Set) {
            JSONArray values = new JSONArray();
            for (Object item : (Set<?>) value) {
                if (!(item instanceof String)) throw new JSONException("Invalid string set");
                values.put(item);
            }
            encoded.put("type", "string_set").put("value", values);
        } else {
            throw new JSONException("Unsupported preference value");
        }
        return encoded;
    }

    private static Map<String, Object> decodeValues(JSONObject values, boolean generalStore)
            throws JSONException {
        Map<String, Object> decoded = new HashMap<>();
        Iterator<String> keys = values.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (generalStore) {
                if (!"vibrate".equals(key) && !"sound".equals(key)) {
                    throw new JSONException("Unknown general preference");
                }
            } else if (!key.startsWith("morphe_")) {
                throw new JSONException("Unknown Morphe preference");
            }
            decoded.put(key, decode(values.getJSONObject(key)));
        }
        return decoded;
    }

    private static FilteredValues decodeCompatibleValues(JSONObject values, Map<String, String> registry)
            throws JSONException {
        Map<String, Object> decoded = new HashMap<>();
        Iterator<String> keys = values.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            JSONObject encoded = values.getJSONObject(key);
            String expectedType = registry.get(key);
            if (expectedType == null || !expectedType.equals(encoded.optString("type"))) continue;
            decoded.put(key, decode(encoded));
        }
        return new FilteredValues(decoded);
    }

    private static Map<String, String> createDefaultTypes() {
        Map<String, String> types = new HashMap<>();
        addTypes(types, "boolean", "morphe_live_keyboard_blur_lite",
                "morphe_frosted_pause_blur_while_typing", "morphe_frosted_transparency_follow_theme",
                "morphe_glass_press_enabled", "morphe_glass_press_key_dip",
                "morphe_spacebar_cursor_enabled", "morphe_keypress_vibrate", "morphe_keypress_sound");
        addTypes(types, "int", "morphe_frosted_blur_strength", "morphe_frosted_resume_blur_delay",
                "morphe_frosted_transparency_amount", "morphe_glass_press_glow_strength",
                "morphe_glass_press_glow_size", "morphe_glass_press_glow_duration",
                "morphe_key_background_size", "morphe_key_tile_transparency");
        addTypes(types, "string", "morphe_frosted_blur_mode", "morphe_frosted_transparency_mode",
                "morphe_frosted_color_theme", "morphe_frosted_accent", "morphe_key_tile_color");
        return Collections.unmodifiableMap(types);
    }

    private static Map<String, String> createGeneralTypes() {
        Map<String, String> types = new HashMap<>();
        addTypes(types, "boolean", GENERAL_KEYS);
        return Collections.unmodifiableMap(types);
    }

    private static void addTypes(Map<String, String> types, String type, String... keys) {
        for (String key : keys) types.put(key, type);
    }

    private static final class FilteredValues {
        final Map<String, Object> values;
        FilteredValues(Map<String, Object> values) { this.values = values; }
    }

    private static final class ImportPlan {
        final String sourcePackage;
        final boolean crossPackage;
        final Map<String, Object> defaultValues;
        final Map<String, Object> generalValues;
        final int compatibleCount;
        final int skippedCount;

        ImportPlan(String sourcePackage, boolean crossPackage, Map<String, Object> defaultValues,
                   Map<String, Object> generalValues, int compatibleCount, int skippedCount) {
            this.sourcePackage = sourcePackage;
            this.crossPackage = crossPackage;
            this.defaultValues = defaultValues;
            this.generalValues = generalValues;
            this.compatibleCount = compatibleCount;
            this.skippedCount = skippedCount;
        }
    }

    private static Object decode(JSONObject encoded) throws JSONException {
        String type = encoded.getString("type");
        Object value = encoded.get("value");
        switch (type) {
            case "boolean":
                if (value instanceof Boolean) return value;
                break;
            case "int":
                if (value instanceof Number) {
                    long number = ((Number) value).longValue();
                    if (number >= Integer.MIN_VALUE && number <= Integer.MAX_VALUE
                            && ((Number) value).doubleValue() == number) return (int) number;
                }
                break;
            case "long":
                if (value instanceof Number && ((Number) value).doubleValue()
                        == ((Number) value).longValue()) return ((Number) value).longValue();
                break;
            case "float":
                if (value instanceof Number) {
                    float number = ((Number) value).floatValue();
                    if (!Float.isInfinite(number) && !Float.isNaN(number)) return number;
                }
                break;
            case "string":
                if (value instanceof String) return value;
                break;
            case "string_set":
                if (value instanceof JSONArray) {
                    JSONArray array = (JSONArray) value;
                    Set<String> strings = new HashSet<>();
                    for (int i = 0; i < array.length(); i++) strings.add(array.getString(i));
                    return strings;
                }
                break;
            default:
                throw new JSONException("Unsupported preference type");
        }
        throw new JSONException("Invalid preference value");
    }

    private static void put(SharedPreferences.Editor editor, String key, Object value) {
        if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Long) editor.putLong(key, (Long) value);
        else if (value instanceof Float) editor.putFloat(key, (Float) value);
        else if (value instanceof String) editor.putString(key, (String) value);
        else if (value instanceof Set) {
            @SuppressWarnings("unchecked") Set<String> strings = (Set<String>) value;
            editor.putStringSet(key, strings);
        }
    }

    private static String readLimited(InputStream input) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int total = 0;
        int count;
        while ((count = input.read(buffer)) != -1) {
            total += count;
            if (total > MAX_PROFILE_BYTES) throw new java.io.IOException("Settings file is too large");
            output.write(buffer, 0, count);
        }
        return new String(output.toByteArray(), StandardCharsets.UTF_8);
    }
}
