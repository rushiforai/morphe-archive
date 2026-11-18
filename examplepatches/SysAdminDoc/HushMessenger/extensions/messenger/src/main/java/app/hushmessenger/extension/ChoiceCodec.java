package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/**
 * Settings-only UTF-8 backups. Both clipboard and documents use this exact format.
 *
 * <p>A v2 backup keeps every switch as {@code key=true|false}, the way v1 did, and adds the choices that aren't switches
 * as typed lines: {@code s:key=text}, {@code i:key=number} and {@code b:key=true|false}. Text escapes {@code %} as
 * {@code %25} and line breaks as {@code %0A} and {@code %0D}, and a key also escapes {@code =} as {@code %3D}. Files,
 * pictures and caches stay out, so a backup carries no messages and nothing that only made sense on the old phone.
 */
final class ChoiceCodec {
    static final int MAX_BYTES = 128 * 1024;
    static final String HEADER = "hushmessenger:choices:v2";
    static final String V1_HEADER = "hushmessenger:choices:v1";
    static final String LEGACY_HEADER = "hushmessenger:choices";
    private static final int MAX_KEY_CHARS = 256;

    /** A choice that isn't one of the switches: its key or key prefix, its type, and the patch it belongs to. */
    static final class Value {
        final String key;
        final boolean prefix;
        /** 's' for text, 'i' for a number, 'b' for a switch. */
        final char type;
        /** The installed patch the choice belongs to. The settings page's own choices, like its theme, stay out. */
        final String owner;

        private Value(String key, boolean prefix, char type, String owner) {
            this.key = key;
            this.prefix = prefix;
            this.type = type;
            this.owner = owner;
        }

        boolean matches(String name) {
            return prefix ? name.length() > key.length() && name.startsWith(key) : name.equals(key);
        }

        boolean availableIn(Set<String> installed) {
            return installed.contains(owner);
        }
    }

    private static Value text(String key, String owner) { return new Value(key, false, 's', owner); }
    private static Value number(String key, String owner) { return new Value(key, false, 'i', owner); }
    private static Value bool(String key, String owner) { return new Value(key, false, 'b', owner); }
    private static Value texts(String prefix, String owner) { return new Value(prefix, true, 's', owner); }
    private static Value bools(String prefix, String owner) { return new Value(prefix, true, 'b', owner); }

    /** The patch the Menu tab's rows come with. It has no switch of its own. */
    static final String MENU_ROW = "menu_row";

    static final List<Value> VALUES = Collections.unmodifiableList(Arrays.asList(
        text(AutoReply.RULES, AutoReply.KEY),
        bool(AutoReply.GROUPS, AutoReply.KEY),
        text(ChatMenuItems.HIDDEN, ChatMenuItems.KEY),
        text(MenuRows.HIDDEN, MENU_ROW),
        bool(MenuRows.LOG_OUT, MENU_ROW),
        bool("hide_drawer_icon", MENU_ROW),
        text(InvisibleButtons.HIDDEN, InvisibleButtons.KEY),
        text(InvisibleButtons.LEVELS, InvisibleButtons.KEY),
        text(HiddenWords.WORDS, HiddenWords.KEY),
        text(HomeHeader.TEXT, HomeHeader.KEY),
        number(MessageLog.KEEP_DAYS, MessageLog.KEY),
        number(QuietMode.FROM, QuietMode.KEY),
        number(QuietMode.TO, QuietMode.KEY),
        text(CallRecordings.KEEP, CallRecording.KEY),
        text(CallRecordings.SCOPE, CallRecording.KEY),
        text(CallRecordings.FORMAT, CallRecording.KEY),
        text(CallRecordings.TRACKS, CallRecording.KEY),
        bool(CallRecordings.NOTIFY, CallRecording.KEY),
        bools(CallRecordings.CHAT_PREFIX, CallRecording.KEY),
        text(CallCaptions.HEARD_LANGUAGE, CallCaptions.KEY),
        text(CallCaptions.SHOWN_LANGUAGE, CallCaptions.KEY),
        text(ThemeFile.KEY, MaterialYouTheme.KEY),
        text(MaterialYouTheme.STYLE_KEY, MaterialYouTheme.KEY),
        bool("material_you_black", MaterialYouTheme.KEY),
        bool(MaterialYouTheme.LIGHT_KEY, MaterialYouTheme.KEY),
        bool(MaterialYouTheme.LIGHT_GRAYS_KEY, MaterialYouTheme.KEY),
        number(OwnFont.SCALE_KEY, OwnFont.KEY),
        number(OwnFont.SHIFT_KEY, OwnFont.KEY),
        texts(MessageActions.ORDER, MessageActions.KEY),
        texts(MessageActions.HIDDEN, MessageActions.KEY),
        texts(ChatHiding.SAVED, ChatHiding.KEY),
        texts(LocalPins.SAVED, LocalPins.KEY),
        bools(QuietCalls.CHAT_PREFIX, QuietCalls.KEY)));

    /** The spec for [key], or null when it's a switch or nothing this version keeps. */
    static Value value(String key) {
        if (key == null) return null;
        for (Value spec : VALUES) if (spec.matches(key)) return spec;
        return null;
    }

    static String encode(SharedPreferences preferences, Set<String> installed) {
        StringBuilder result = new StringBuilder(HEADER).append('\n');
        result.append("paused=").append(preferences.getBoolean("paused", false)).append('\n');
        for (String[] spec : SettingsActivity.CONTROLS) {
            String key = spec[0];
            if (installed.contains(key)) result.append(key).append('=')
                .append(preferences.getBoolean(key, false)).append('\n');
        }
        for (Map.Entry<String, String> sub : Settings.SUB_SWITCHES.entrySet()) {
            if (installed.contains(sub.getValue())) result.append(sub.getKey()).append('=')
                .append(preferences.getBoolean(sub.getKey(), false)).append('\n');
        }
        // Sorted, so the same choices always give the same backup and a changed one is easy to spot.
        Map<String, String> typed = new TreeMap<>();
        for (Map.Entry<String, ?> saved : preferences.getAll().entrySet()) {
            String key = saved.getKey();
            Value spec = value(key);
            if (spec == null || !spec.availableIn(installed) || key.length() > MAX_KEY_CHARS) continue;
            String shown = shown(spec, saved.getValue());
            if (shown != null) typed.put(key, spec.type + ":" + escape(key, true) + "=" + shown);
        }
        for (String line : typed.values()) result.append(line).append('\n');
        return result.toString();
    }

    /** [value] as a typed line writes it, or null when it isn't the type the spec says. */
    private static String shown(Value spec, Object value) {
        switch (spec.type) {
            case 's': return value instanceof String ? escape((String) value, false) : null;
            case 'i': return value instanceof Integer ? value.toString() : null;
            default: return value instanceof Boolean ? value.toString() : null;
        }
    }

    /** More than a backup can carry, counted the way [read] and [parse] count it. */
    static boolean tooLarge(String backup) {
        return backup != null && (backup.length() > MAX_BYTES || backup.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES);
    }

    /** The patch whose typed lines take the most room in [backup], or null without any. Says what to trim. */
    static String biggest(String backup) {
        Map<String, Integer> sizes = new HashMap<>();
        String largest = null;
        for (String line : backup.split("\n")) {
            int colon = line.indexOf(':'), equals = line.indexOf('=');
            if (colon != 1 || equals < 2) continue;
            Value spec;
            try { spec = value(unescape(line.substring(2, equals))); }
            catch (IllegalArgumentException damaged) { continue; }
            if (spec == null) continue;
            int size = sizes.merge(spec.owner, line.length(), Integer::sum);
            if (largest == null || size > sizes.get(largest)) largest = spec.owner;
        }
        return largest;
    }

    /**
     * Switches come back as Boolean. Typed lines come back as String, Integer or Boolean, and only a v2 backup has them.
     * Anything this version doesn't keep still parses, so the restore can count it as skipped.
     */
    static Map<String, Object> parse(String raw) {
        if (raw == null || tooLarge(raw))
            throw new IllegalArgumentException("Backup exceeds 128 KiB or is missing");
        String[] lines = raw.split("\r?\n", -1);
        boolean typed = HEADER.equals(lines[0]);
        if (!typed && !V1_HEADER.equals(lines[0]) && !LEGACY_HEADER.equals(lines[0]))
            throw new IllegalArgumentException("Unsupported backup header");
        Map<String, Object> result = new LinkedHashMap<>();
        for (int index = 1; index < lines.length; index++) {
            String line = lines[index];
            if (index == lines.length - 1 && line.isEmpty()) continue;
            int equals = line.indexOf('=');
            if (equals < 1) throw new IllegalArgumentException("Invalid backup line");
            String key, value = line.substring(equals + 1);
            Object parsed;
            if (typed && equals > 2 && line.charAt(1) == ':' && "sib".indexOf(line.charAt(0)) >= 0) {
                key = unescape(line.substring(2, equals));
                if (key.isEmpty() || key.length() > MAX_KEY_CHARS || key.charAt(0) < 'a' || key.charAt(0) > 'z')
                    throw new IllegalArgumentException("Invalid backup key");
                switch (line.charAt(0)) {
                    case 's': parsed = unescape(value); break;
                    case 'i':
                        if (!value.matches("-?[0-9]{1,10}")) throw new IllegalArgumentException("Invalid number");
                        parsed = Integer.parseInt(value);
                        break;
                    default: parsed = bool(value);
                }
            } else {
                key = line.substring(0, equals);
                if (!key.matches("[a-z][a-z0-9_]{0,63}")) throw new IllegalArgumentException("Invalid backup line");
                parsed = bool(value);
            }
            if (result.containsKey(key)) throw new IllegalArgumentException("Duplicate choice");
            result.put(key, parsed);
        }
        return result;
    }

    private static Boolean bool(String value) {
        if ("true".equals(value)) return Boolean.TRUE;
        if ("false".equals(value)) return Boolean.FALSE;
        throw new IllegalArgumentException("Invalid switch");
    }

    /**
     * [value] the way this version saves it, or null when it can't be one of [spec]'s choices. Values go through the
     * same limits their own rows apply, so a hand-edited backup can't save anything a row couldn't.
     */
    static Object clean(Value spec, Object value) {
        switch (spec.type) {
            case 'b': return value instanceof Boolean ? value : null;
            case 'i': {
                if (!(value instanceof Integer)) return null;
                int number = (Integer) value;
                if (MessageLog.KEEP_DAYS.equals(spec.key)) return MessageLog.keepDays(number);
                if (QuietMode.FROM.equals(spec.key) || QuietMode.TO.equals(spec.key))
                    return number >= 0 && number < QuietMode.DAY ? number : null;
                return number;
            }
            default: {
                if (!(value instanceof String)) return null;
                String text = (String) value;
                if (AutoReply.RULES.equals(spec.key)) return AutoReply.clean(text);
                if (HomeHeader.TEXT.equals(spec.key)) return HomeHeader.clean(text);
                if (HiddenWords.WORDS.equals(spec.key)) return cut(text, HiddenWords.MAX_LENGTH);
                if (MaterialYouTheme.STYLE_KEY.equals(spec.key))
                    return Arrays.asList(TonePalette.STYLES).contains(text) ? text : null;
                if (ThemeFile.KEY.equals(spec.key)) {
                    try { return ThemeFile.parse(text).encode(); }
                    catch (IllegalArgumentException damaged) { return null; }
                }
                return text;
            }
        }
    }

    /** The first [max] characters, the way the row's field stops typing there, with no half of a pair left at the end. */
    private static String cut(String text, int max) {
        if (text.length() <= max) return text;
        int end = Character.isHighSurrogate(text.charAt(max - 1)) ? max - 1 : max;
        return text.substring(0, end);
    }

    private static String escape(String text, boolean key) {
        StringBuilder result = null;
        for (int index = 0; index < text.length(); index++) {
            char character = text.charAt(index);
            String code = character == '%' ? "%25" : character == '\n' ? "%0A" : character == '\r' ? "%0D"
                : key && character == '=' ? "%3D" : null;
            if (code != null && result == null) result = new StringBuilder(text.length() + 8).append(text, 0, index);
            if (result != null) {
                if (code != null) result.append(code);
                else result.append(character);
            }
        }
        return result == null ? text : result.toString();
    }

    private static String unescape(String text) {
        if (text.indexOf('%') < 0) return text;
        StringBuilder result = new StringBuilder(text.length());
        for (int index = 0; index < text.length(); index++) {
            char character = text.charAt(index);
            if (character != '%') {
                result.append(character);
                continue;
            }
            if (index + 2 >= text.length()) throw new IllegalArgumentException("Cut-off escape");
            switch (text.substring(index + 1, index + 3)) {
                case "25": result.append('%'); break;
                case "0A": result.append('\n'); break;
                case "0D": result.append('\r'); break;
                case "3D": result.append('='); break;
                default: throw new IllegalArgumentException("Unknown escape");
            }
            index += 2;
        }
        return result.toString();
    }

    /** The document was read fine, it just isn't a backup: too big for one. */
    static final class TooLarge extends IOException {
        TooLarge() { super("Backup exceeds 128 KiB"); }
    }

    static String read(InputStream stream) throws IOException {
        if (stream == null) throw new IOException("No readable document");
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] bytes = new byte[4096];
        int length;
        while ((length = stream.read(bytes)) != -1) {
            if (result.size() + length > MAX_BYTES) throw new TooLarge();
            result.write(bytes, 0, length);
        }
        return result.toString(StandardCharsets.UTF_8.name());
    }

    private ChoiceCodec() { }
}
