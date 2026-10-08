/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings.preference;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Xml;

import androidx.annotation.Nullable;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;

/**
 * A preferences file as one of Facebook's other processes (a game, the ad screens) sees it: read
 * from its XML, opened to read and nothing else, and never changed by reading.
 *
 * <p>Android's own load of a preferences file, finding the {@code .bak} copy the main process keeps
 * while it saves, deletes the half-written file and renames the copy over it, so a side process that
 * started during a save would lose that save on disk. This reads the {@code .bak} while it's there,
 * else the file, and touches neither. A file cut short as the write starts is read again once, by
 * which time the copy is there. When neither can be read whole, the last values read stand, or none
 * before there was a read. With no file and no copy nothing was ever saved, and every key is absent.
 *
 * <p>Nothing can be written: {@link #edit} gives an editor that changes nothing and whose
 * {@code commit} says false. Only the main process writes settings, and every setting write already
 * refuses in another process before it gets here. The parse is kept until the size or modified time
 * of the file or its copy changes, so a check that runs often reads the disk only after a save.
 */
public final class ReadOnlyPreferences implements SharedPreferences {
    private final File file;
    private final File backup;
    /** What the files last held when read whole, with the signature of the files at that read. */
    @Nullable
    private Map<String, Object> cached;
    private long[] cachedSignature;
    /** The values of the last whole read, kept for a read that finds the file mid-write. */
    @Nullable
    private Map<String, Object> lastRead;

    public ReadOnlyPreferences(Context context, String name) {
        file = new File(new File(context.getDataDir(), "shared_prefs"), name + ".xml");
        backup = new File(file.getPath() + ".bak");
    }

    private long[] signature() {
        return new long[]{file.lastModified(), file.length(), backup.lastModified(), backup.length()};
    }

    /** The values as the files hold them now, or null when they can't be read and never were. */
    @Nullable
    public synchronized Map<String, Object> snapshot() {
        long[] now = signature();
        if (cached != null && java.util.Arrays.equals(now, cachedSignature)) return cached;
        for (int attempt = 0; attempt < 2; attempt++) {
            File source = backup.exists() ? backup : file;
            if (source == file && !file.exists()) {
                if (backup.exists()) continue;
                return remember(Collections.emptyMap(), now);
            }
            Map<String, Object> read = parse(source);
            if (read != null) return remember(read, now);
            now = signature();
        }
        return lastRead;
    }

    private Map<String, Object> remember(Map<String, Object> values, long[] signature) {
        lastRead = values;
        cached = values;
        cachedSignature = signature;
        return values;
    }

    private Map<String, Object> values() {
        Map<String, Object> values = snapshot();
        return values == null ? Collections.emptyMap() : values;
    }

    /** Every value in a preferences file's XML, or null when it can't be opened or read to its end. */
    @Nullable
    static Map<String, Object> parse(File source) {
        byte[] bytes;
        try (InputStream in = new FileInputStream(source)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int read; (read = in.read(buffer)) > 0; ) out.write(buffer, 0, read);
            bytes = out.toByteArray();
        } catch (IOException gone) {
            return null;
        }
        try {
            XmlPullParser parser = Xml.newPullParser();
            parser.setInput(new ByteArrayInputStream(bytes), "UTF-8");
            Map<String, Object> values = new HashMap<>();
            boolean closed = false;
            for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
                if (event == XmlPullParser.START_TAG) {
                    if (parser.getDepth() == 1) {
                        if (!"map".equals(parser.getName())) return null;
                        continue;
                    }
                    String name = parser.getAttributeValue(null, "name");
                    if (name == null) continue;
                    switch (parser.getName()) {
                        case "boolean":
                            values.put(name, Boolean.valueOf(parser.getAttributeValue(null, "value")));
                            break;
                        case "int":
                            values.put(name, Integer.valueOf(parser.getAttributeValue(null, "value")));
                            break;
                        case "long":
                            values.put(name, Long.valueOf(parser.getAttributeValue(null, "value")));
                            break;
                        case "float":
                            values.put(name, Float.valueOf(parser.getAttributeValue(null, "value")));
                            break;
                        case "string":
                            values.put(name, parser.nextText());
                            break;
                        case "set":
                            Set<String> members = new HashSet<>();
                            while (parser.next() != XmlPullParser.END_TAG || parser.getDepth() > 2) {
                                if (parser.getEventType() == XmlPullParser.START_TAG && "string".equals(parser.getName())) {
                                    members.add(parser.nextText());
                                } else if (parser.getEventType() == XmlPullParser.END_DOCUMENT) {
                                    return null;
                                }
                            }
                            values.put(name, members);
                            break;
                        default:
                            break;
                    }
                } else if (event == XmlPullParser.END_TAG && parser.getDepth() == 1) {
                    closed = true;
                }
            }
            // A file cut short mid-write either fails to parse or ends before its map closes.
            return closed ? values : null;
        } catch (XmlPullParserException | IOException | RuntimeException unreadable) {
            return null;
        }
    }

    @Override
    public Map<String, ?> getAll() {
        return new HashMap<>(values());
    }

    @Nullable
    @Override
    public String getString(String key, @Nullable String defValue) {
        Object value = values().get(key);
        return value != null ? (String) value : defValue;
    }

    @Nullable
    @Override
    @SuppressWarnings("unchecked")
    public Set<String> getStringSet(String key, @Nullable Set<String> defValues) {
        Object value = values().get(key);
        return value != null ? new HashSet<>((Set<String>) value) : defValues;
    }

    @Override
    public int getInt(String key, int defValue) {
        Object value = values().get(key);
        return value != null ? (Integer) value : defValue;
    }

    @Override
    public long getLong(String key, long defValue) {
        Object value = values().get(key);
        return value != null ? (Long) value : defValue;
    }

    @Override
    public float getFloat(String key, float defValue) {
        Object value = values().get(key);
        return value != null ? (Float) value : defValue;
    }

    @Override
    public boolean getBoolean(String key, boolean defValue) {
        Object value = values().get(key);
        return value != null ? (Boolean) value : defValue;
    }

    @Override
    public boolean contains(String key) {
        return values().containsKey(key);
    }

    @Override
    public Editor edit() {
        Logger.printInfo(() -> "Ignored a settings edit in a secondary process");
        return new Editor() {
            @Override public Editor putString(String key, @Nullable String value) { return this; }
            @Override public Editor putStringSet(String key, @Nullable Set<String> values) { return this; }
            @Override public Editor putInt(String key, int value) { return this; }
            @Override public Editor putLong(String key, long value) { return this; }
            @Override public Editor putFloat(String key, float value) { return this; }
            @Override public Editor putBoolean(String key, boolean value) { return this; }
            @Override public Editor remove(String key) { return this; }
            @Override public Editor clear() { return this; }
            @Override public boolean commit() { return false; }
            @Override public void apply() { }
        };
    }

    @Override
    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
    }

    @Override
    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
    }
}
