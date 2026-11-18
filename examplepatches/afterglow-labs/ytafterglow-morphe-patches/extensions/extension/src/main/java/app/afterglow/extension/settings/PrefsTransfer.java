package app.afterglow.extension.settings;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/** iOS preference files, with explicit bridges for Android's scalar storage. */
public final class PrefsTransfer {
    public static final String FORMAT = "YTAfterglowPreferences";
    public static final int VERSION = 1;
    public static final String FILE_NAME = "YTAfterglow-preferences.ytagprefs";
    // Retained originals apply only while their converted Android value is unchanged.
    // Reset-all removes this record with the rest of the Afterglow domain.
    static final String ROUND_TRIP = "__afterglow_android_plist_roundtrip_v1";

    public static final class ImportException extends Exception {
        public ImportException(String message) { super(message); }
    }
    private PrefsTransfer() {}

    public static byte[] exportPlist() throws IOException {
        Map<String, ?> snapshot = AfterglowPrefs.snapshot();
        Map<String, Object> preferences = new TreeMap<>();
        for (Map.Entry<String, ?> entry : snapshot.entrySet()) {
            if (!ROUND_TRIP.equals(entry.getKey())) preferences.put(entry.getKey(), exported(entry.getKey(), entry.getValue()));
        }
        Object preserved = snapshot.get(ROUND_TRIP);
        if (preserved instanceof String) {
            try {
                Object decoded = PropertyList.read(((String) preserved).getBytes(StandardCharsets.UTF_8));
                if (decoded instanceof Map) for (Map.Entry<?, ?> entry : ((Map<?, ?>) decoded).entrySet()) {
                    if (!(entry.getKey() instanceof String) || !(entry.getValue() instanceof Map) || ROUND_TRIP.equals(entry.getKey())
                            || AfterglowPrefs.isStorageKey((String) entry.getKey())) continue;
                    String key = (String) entry.getKey(); Map<?, ?> record = (Map<?, ?>) entry.getValue();
                    boolean unchanged = record.containsKey("storedHash")
                            ? snapshot.containsKey(key) && record.get("storedHash").equals(fingerprint(snapshot.get(key)))
                            : !snapshot.containsKey(key);
                    if (unchanged && record.containsKey("original")) preferences.put(key, record.get("original"));
                }
            } catch (Exception invalidRecord) { /* Current native values remain exportable. */ }
        }
        Map<String, Object> root = new LinkedHashMap<>();
        root.put("format", FORMAT); root.put("version", VERSION);
        root.put("exportedAt", System.currentTimeMillis() / 1000d); root.put("preferences", preferences);
        return PropertyList.write(root);
    }

    private static Object exported(String key, Object value) throws IOException {
        if (ThemeRole.forLegacyKey(key) != null) {
            Integer color = ThemeColors.decode(value);
            if (color != null) return LegacyColor.encode(color);
        }
        if (ScrubberImage.KEY.equals(key) && value instanceof String) {
            try { return Base64.getDecoder().decode((String) value); }
            catch (IllegalArgumentException invalid) { return value; }
        }
        if (TabStore.ACTIVE_TABS_KEY.equals(key)) {
            List<String> tabs = TabStore.decode(value);
            if (tabs != null) return tabs;
        }
        if (structuredThemeKey(key) && value instanceof String) {
            try {
                Object record = ThemeJson.parse((String) value);
                if (themeShape(key, record)) return record;
            } catch (IllegalArgumentException invalid) { /* Preserve malformed external strings, too. */ }
        }
        return value;
    }

    /** Replace the Afterglow domain only after the complete file has been validated. */
    public static int importPlist(InputStream input) throws ImportException {
        byte[] bytes;
        try { bytes = readAll(input); }
        catch (IOException error) { throw new ImportException(error.getMessage()); }
        if (bytes.length == 0) throw new ImportException("The selected preferences file is empty.");
        Object plist;
        try { plist = PropertyList.read(bytes); }
        catch (Exception invalid) { throw new ImportException("The selected file is not a preferences plist."); }
        if (!(plist instanceof Map)) throw new ImportException("The selected file is not a preferences plist.");
        Map<?, ?> root = (Map<?, ?>) plist;
        Object source = root.get("preferences");
        if (source == null && root.get("format") == null) source = root;
        if (!(source instanceof Map)) throw new ImportException("The selected file does not contain Afterglow preferences.");
        Map<String, Object> values = new LinkedHashMap<>(), retained = new LinkedHashMap<>();
        int inactive = 0;
        try {
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) source).entrySet()) {
                if (!(entry.getKey() instanceof String) || ROUND_TRIP.equals(entry.getKey())
                        || AfterglowPrefs.isStorageKey((String) entry.getKey())) continue;
                String key = (String) entry.getKey(); Object original = entry.getValue();
                Object converted = converted(key, original);
                if (converted != null) values.put(key, converted); else inactive++;
                // Tab lists deliberately normalize invalid entries; never restore their raw input.
                if (!TabStore.ACTIVE_TABS_KEY.equals(key) && (converted == null || original instanceof byte[]
                        || original instanceof Map || original instanceof List || original instanceof Double || original instanceof BigInteger)) {
                    Map<String, Object> record = new LinkedHashMap<>(); record.put("original", original);
                    if (converted != null) record.put("storedHash", fingerprint(converted));
                    retained.put(key, record);
                }
            }
            if (!retained.isEmpty()) values.put(ROUND_TRIP, new String(PropertyList.write(retained), StandardCharsets.UTF_8));
            // Bound expanded binary object graphs before any preferences change.
            PropertyList.write(source);
        } catch (Exception invalid) {
            throw new ImportException(invalid.getMessage() != null ? invalid.getMessage() : "Failed to import preferences");
        }
        AfterglowPrefs.replaceAll(values);
        TabStore.currentActiveTabs();
        return inactive;
    }

    private static Object converted(String key, Object value) {
        if (value instanceof byte[]) {
            if (ThemeRole.forLegacyKey(key) != null) return LegacyColor.decode((byte[]) value);
            if (ScrubberImage.KEY.equals(key)) {
                try { return ScrubberImage.normalize((byte[]) value); }
                catch (IOException invalid) { return null; }
            }
            return null;
        }
        if (themeShape(key, value)) {
            try { return ThemeJson.write(value); } catch (IllegalArgumentException invalid) { return null; }
        }
        if (value instanceof Boolean || value instanceof String) return value;
        if (value instanceof Long) {
            long number = (Long) value;
            return number >= Integer.MIN_VALUE && number <= Integer.MAX_VALUE ? (Object) (int) number : (Object) number;
        }
        if (value instanceof Double) {
            float number = ((Double) value).floatValue();
            return Float.isFinite(number) ? number : null;
        }
        if (value instanceof List && TabStore.ACTIVE_TABS_KEY.equals(key)) {
            List<String> strings = new ArrayList<>();
            for (Object item : (List<?>) value) if (item instanceof String) strings.add((String) item);
            return TabStore.encode(strings);
        }
        return null;
    }

    private static boolean structuredThemeKey(String key) { return "theme_semanticTheme".equals(key) || "theme_savedThemes".equals(key); }
    private static boolean themeShape(String key, Object value) {
        return "theme_semanticTheme".equals(key) && value instanceof Map || "theme_savedThemes".equals(key) && value instanceof List;
    }
    private static String fingerprint(Object value) {
        try {
            byte[] bytes = (value.getClass().getName() + ":" + value).getBytes(StandardCharsets.UTF_8);
            return Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-256").digest(bytes));
        } catch (java.security.NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
    private static byte[] readAll(InputStream input) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(); byte[] buffer = new byte[8192]; int read;
        while ((read = input.read(buffer)) != -1) {
            if (out.size() + read > PropertyList.MAX_BYTES) throw new IOException("Preferences file is too large.");
            out.write(buffer, 0, read);
        }
        return out.toByteArray();
    }
    public static Object parsePropertyList(byte[] data) throws Exception {
        if (data.length > ThemeJson.MAX_LENGTH) throw new IOException("Theme file is too large.");
        return PropertyList.read(data);
    }
}
