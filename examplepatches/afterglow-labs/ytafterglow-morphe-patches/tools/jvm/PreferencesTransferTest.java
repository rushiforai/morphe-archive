package app.afterglow.extension.settings;

import android.content.SharedPreferences;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/** Real preference replacement and codecs; only Android storage/Xml factories are supplied. */
public final class PreferencesTransferTest {
    private static int checks;
    private static void check(boolean condition, String message) {
        checks++; if (!condition) throw new AssertionError(message);
    }
    private static Map<?, ?> exported() throws Exception {
        return (Map<?, ?>) ((Map<?, ?>) PropertyList.read(PrefsTransfer.exportPlist())).get("preferences");
    }
    private static void load(byte[] data) throws Exception { PrefsTransfer.importPlist(new ByteArrayInputStream(data)); }

    /** The actual SDK serializer, configured as SharedPreferencesImpl/XmlUtils configure it. */
    private static String persistedText(String value) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        org.xmlpull.v1.XmlSerializer writer = new com.android.internal.util.FastXmlSerializer();
        writer.setOutput(bytes, "UTF-8"); writer.startDocument(null, true);
        writer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
        writer.startTag(null, "map"); writer.startTag(null, "string"); writer.text(value);
        writer.endTag(null, "string"); writer.endTag(null, "map"); writer.endDocument();
        org.xmlpull.v1.XmlPullParser reader = android.util.Xml.newPullParser();
        reader.setInput(new ByteArrayInputStream(bytes.toByteArray()), null);
        reader.nextTag(); reader.nextTag(); return reader.nextText();
    }

    public static void main(String[] args) throws Exception {
        Path directory = Path.of(args[0]);
        MemPrefs prefs = new MemPrefs();
        Field field = AfterglowPrefs.class.getDeclaredField("prefs"); field.setAccessible(true); field.set(null, prefs);
        AtomicInteger notifications = new AtomicInteger();
        AfterglowPrefs.addListener(key -> notifications.incrementAndGet());
        check(persistedText("line\n").equals("line\n    "), "SDK serializer reproduces the observed four-space suffix");
        for (String format : new String[] {"xml", "binary"}) {
            PropertyList.read(Files.readAllBytes(directory.resolve("input-" + format + ".plist")));
            AfterglowPrefs.setBool("staleValue", true);
            int before = notifications.get();
            load(Files.readAllBytes(directory.resolve("input-" + format + ".plist")));
            check(notifications.get() == before + 1, format + " single atomic replacement notification");
            check(!AfterglowPrefs.contains("staleValue"), format + " removes old domain values");
            check(AfterglowPrefs.getBool("advancedMode") && AfterglowPrefs.getBool("hideShortsPlayerLayer"), format + " live booleans");
            check(AfterglowPrefs.getInt("negative") == -42, format + " signed integer");
            check(AfterglowPrefs.getInt("theme_background") == 0x804080bf, format + " binary UIColor channels");
            check(AfterglowPrefs.getInt("theme_glowColor") == 0x802e2e2e, format + " XML grayscale UIColor");
            check(ThemeStore.snapshot().palette.explicit(ThemeRole.BACKGROUND) == 0x804080bf, format + " active palette consumes converted color");
            check(ThemeStore.snapshot().palette.explicit(ThemeRole.ELEVATED_SURFACE) == 0xff1a334d, format + " semantic role survives");
            check(ThemeStore.snapshot().palette.identifier.equals("custom-transfer-fixture"), format + " custom identity retained");
            check(ThemeStore.savedThemes().size() == 1 && ThemeStore.savedThemes().get(0).name.equals("Transfer 🌙"), format + " saved theme library works");
            check(TabStore.currentActiveTabs().equals(Arrays.asList("FEwhat_to_watch", "FEshorts", "FElibrary")), format + " ordered tabs");
            Map<?, ?> out = exported();
            check(out.get("unknownBlob") instanceof byte[] && out.get("unknownNested") instanceof Map, format + " unmapped data retained");
            check(!out.containsKey(PrefsTransfer.ROUND_TRIP), format + " private storage record never exported");
            Map<String, ?> beforeReload = AfterglowPrefs.snapshot();
            prefs.reloadStrings();
            check(beforeReload.equals(AfterglowPrefs.snapshot()), format + " exact logical values after real XML persistence");
            check(Arrays.equals(PropertyList.write(out), PropertyList.write(exported())), format + " export survives persistence including whitespace");
            Files.write(directory.resolve("roundtrip-" + format + ".plist"), PrefsTransfer.exportPlist());
        }
        AfterglowPrefs.setInt("theme_background", 0xffaabbcc);
        AfterglowPrefs.setFloat("precise", .875f);
        ThemeStore.rename("custom-transfer-fixture", "Edited on Android");
        Map<?, ?> edited = exported();
        check(LegacyColor.decode((byte[]) edited.get("theme_background")) == 0xffaabbcc, "changed color wins over retained archive");
        check(((Number) edited.get("precise")).doubleValue() == .875, "changed scalar wins over retained precision");
        Files.write(directory.resolve("edited.plist"), PrefsTransfer.exportPlist());
        AfterglowPrefs.remove("theme_background");
        check(!exported().containsKey("theme_background"), "removed native color is not resurrected");

        Map<String, ?> stable = AfterglowPrefs.snapshot();
        int notificationsBefore = notifications.get();
        try (java.util.stream.Stream<Path> files = Files.list(directory)) {
            for (Path file : (Iterable<Path>) files.filter(p -> p.getFileName().toString().startsWith("invalid-"))::iterator) {
                boolean rejected = false;
                try { load(Files.readAllBytes(file)); } catch (PrefsTransfer.ImportException expected) { rejected = true; }
                check(rejected, "reject " + file.getFileName());
                check(stable.equals(AfterglowPrefs.snapshot()) && notifications.get() == notificationsBefore, "rejected file leaves values/listeners untouched");
            }
        }
        boolean oversized = false;
        try { PrefsTransfer.importPlist(new InputStream() {
            int remaining = PropertyList.MAX_BYTES + 1;
            public int read() { return remaining-- > 0 ? 32 : -1; }
            public int read(byte[] bytes, int offset, int length) {
                if (remaining <= 0) return -1; int count = Math.min(remaining, length); remaining -= count; return count;
            }
        }); } catch (PrefsTransfer.ImportException expected) { oversized = true; }
        check(oversized && stable.equals(AfterglowPrefs.snapshot()), "oversized import is atomic");

        load("<plist><dict><key>activeTabs</key><array><string>FEexplore</string><string>FEexplore</string><string>FElibrary</string><integer>1</integer></array></dict></plist>".getBytes(StandardCharsets.UTF_8));
        check(TabStore.currentActiveTabs().equals(Arrays.asList("FEhype_leaderboard", "FElibrary")), "tabs canonicalize, deduplicate and drop non-strings");
        check(exported().get("activeTabs").equals(Arrays.asList("FEhype_leaderboard", "FElibrary")), "export uses corrected tabs");
        load("<plist><dict><key>activeTabs</key><array><string>FEwhat_to_watch</string><string>FEshorts</string><integer>1</integer></array></dict></plist>".getBytes(StandardCharsets.UTF_8));
        check(exported().get("activeTabs").equals(Arrays.asList("FEwhat_to_watch", "FEshorts")), "a dropped non-string tab never returns through retained originals");
        load(Files.readAllBytes(directory.resolve("input-binary.plist")));
        AfterglowPrefs.resetAll();
        check(exported().isEmpty(), "reset removes retained originals with native values");
        AfterglowPrefs.setString(PrefsTransfer.ROUND_TRIP, "broken");
        AfterglowPrefs.setBool("advancedMode", true);
        check(exported().equals(Map.of("advancedMode", true)), "damaged private record cannot break native export");

        check(LegacyColor.decode(PropertyList.write(Map.of("UIRed", 7, "UIGreen", -3, "UIBlue", .5, "UIAlpha", Double.NaN))) == 0x00ff0080,
                "legacy color channels use iOS clamping including NaN");
        for (int color : new int[] {0, 0xffffffff, 0x01010203, 0x7fabcdef, 0xfe012345})
            check(LegacyColor.decode(LegacyColor.encode(color)) == color, "ARGB boundary archive " + Integer.toHexString(color));
        check(LegacyColor.decode(PropertyList.write(Map.of("UIAlpha", 1))) == null, "color archive needs channels");
        AfterglowPrefs.resetAll();
        for (String value : new String[] {"", "ordinary", "line\n", "line\r\n", "\n", "café 🌙\n", "line\n    ", "bGluZQo=", "__afterglow_android_string_v1:literal"}) {
            AfterglowPrefs.setString("text", value); prefs.reloadStrings();
            check(value.equals(AfterglowPrefs.getString("text")) && exported().equals(Map.of("text", value)),
                    "native reads and exports retain exact text: " + value.replace("\n", "\\n"));
        }
        AfterglowPrefs.setString("text", "ends\n"); AfterglowPrefs.setInt("text", 42); prefs.reloadStrings();
        check(AfterglowPrefs.getInt("text") == 42 && prefs.values.size() == 1, "type change removes encoding marker");
        AfterglowPrefs.setString("text", "ends\n"); AfterglowPrefs.remove("text");
        check(prefs.values.isEmpty(), "remove clears value and marker");
        AfterglowPrefs.setString("text", "ends\n"); AfterglowPrefs.setString("text", null);
        check(prefs.values.isEmpty(), "null string clears value and marker");
        load(PropertyList.write(Map.of("text", "bGluZQo=", "__afterglow_android_string_v1:dGV4dA==", true)));
        check(AfterglowPrefs.getString("text").equals("bGluZQo=") && exported().equals(Map.of("text", "bGluZQo=")),
                "import cannot forge private encoding markers");
        AfterglowPrefs.setString("text", "ends\n"); AfterglowPrefs.resetAll();
        check(prefs.values.isEmpty() && exported().isEmpty(), "full reset clears encoded strings and all metadata");
        System.out.println("PASS preferences transfer: " + checks + " checks");
    }

    private static final class MemPrefs implements SharedPreferences {
        final Map<String, Object> values = new HashMap<>();
        void reloadStrings() throws Exception {
            for (Map.Entry<String, Object> entry : new HashMap<>(values).entrySet())
                if (entry.getValue() instanceof String) values.put(entry.getKey(), persistedText((String) entry.getValue()));
        }
        public Map<String, ?> getAll() { return new HashMap<>(values); }
        public String getString(String k, String d) { return values.containsKey(k) ? (String) values.get(k) : d; }
        @SuppressWarnings("unchecked") public Set<String> getStringSet(String k, Set<String> d) { return values.containsKey(k) ? (Set<String>) values.get(k) : d; }
        public int getInt(String k, int d) { return values.containsKey(k) ? (Integer) values.get(k) : d; }
        public long getLong(String k, long d) { return values.containsKey(k) ? (Long) values.get(k) : d; }
        public float getFloat(String k, float d) { return values.containsKey(k) ? (Float) values.get(k) : d; }
        public boolean getBoolean(String k, boolean d) { return values.containsKey(k) ? (Boolean) values.get(k) : d; }
        public boolean contains(String k) { return values.containsKey(k); }
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {}
        public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {}
        public Editor edit() { return new MemEditor(); }
        final class MemEditor implements Editor {
            final Map<String, Object> writes = new HashMap<>(); final Set<String> removed = new HashSet<>(); boolean clear;
            public Editor putString(String k, String v) { writes.put(k, v); return this; }
            public Editor putStringSet(String k, Set<String> v) { writes.put(k, v); return this; }
            public Editor putInt(String k, int v) { writes.put(k, v); return this; }
            public Editor putLong(String k, long v) { writes.put(k, v); return this; }
            public Editor putFloat(String k, float v) { writes.put(k, v); return this; }
            public Editor putBoolean(String k, boolean v) { writes.put(k, v); return this; }
            public Editor remove(String k) { removed.add(k); return this; }
            public Editor clear() { clear = true; return this; }
            public void apply() { if (clear) values.clear(); for (String k : removed) values.remove(k); values.putAll(writes); }
            public boolean commit() { apply(); return true; }
        }
    }
}
