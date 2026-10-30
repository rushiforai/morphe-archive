package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * A colours-only theme for Material You (#115), shared as a small piece of JSON:
 * {"hushmessenger_theme": 1, "name": "Sunset", "accent": "#E1306C", "neutral": "#1A1418", "pure_black": true}.
 * The accent tints Messenger's blues and the neutral its greys, each at Messenger's own lightness, so
 * contrast stays what Messenger gave it. Either colour can be left out. Keys it doesn't know are ignored,
 * so a later format can add to it without breaking older readers.
 */
final class ThemeFile {
    /** The saved theme, as encode() wrote it. Absent means the wallpaper's colours. */
    static final String KEY = "material_you_theme";
    static final String VERSION_KEY = "hushmessenger_theme";
    static final int VERSION = 1;
    static final int MAX_TEXT = 4096;
    static final int MAX_NAME = 40;
    /** The accent of a theme that only gives a neutral: Messenger's own blue. */
    static final int MESSENGER_BLUE = 0xFF0866FF;

    private static final Pattern HEX = Pattern.compile("#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})");

    /** Empty when the theme has no name. */
    final String name;
    /** Opaque colours, or null when the theme leaves one out. */
    final Integer accent;
    final Integer neutral;
    /** The pure black switch to set when the theme is used, or null to leave it as it is. */
    final Boolean pureBlack;

    ThemeFile(String name, Integer accent, Integer neutral, Boolean pureBlack) {
        this.name = name;
        this.accent = accent;
        this.neutral = neutral;
        this.pureBlack = pureBlack;
    }

    /**
     * Reads a theme from pasted text. The text around the first { and the last } is skipped, so a theme
     * copied out of a message or a code block still reads.
     *
     * @throws IllegalArgumentException when the text isn't a theme this version can use
     */
    static ThemeFile parse(String text) {
        if (text == null || text.trim().isEmpty()) throw new IllegalArgumentException("empty");
        if (text.length() > MAX_TEXT) throw new IllegalArgumentException("longer than " + MAX_TEXT);
        int start = text.indexOf('{'), end = text.lastIndexOf('}');
        if (start < 0 || end < start) throw new IllegalArgumentException("no JSON object");
        JSONObject json;
        try {
            json = new JSONObject(text.substring(start, end + 1));
        } catch (JSONException e) {
            throw new IllegalArgumentException("not JSON", e);
        }
        Object version = json.opt(VERSION_KEY);
        if (version != null && version != JSONObject.NULL && !(version instanceof Number && ((Number) version).doubleValue() == VERSION))
            throw new IllegalArgumentException("version " + version);
        Integer accent = color(json, "accent"), neutral = color(json, "neutral");
        if (accent == null && neutral == null) throw new IllegalArgumentException("no accent or neutral");
        Object black = json.opt("pure_black");
        if (black != null && black != JSONObject.NULL && !(black instanceof Boolean))
            throw new IllegalArgumentException("pure_black is " + black);
        Object name = json.opt("name");
        return new ThemeFile(name instanceof String ? clean((String) name) : "", accent, neutral,
                black instanceof Boolean ? (Boolean) black : null);
    }

    /** The saved theme, or null when there is none or it can't be read. */
    static ThemeFile saved() {
        SharedPreferences preferences = Settings.preferences;
        String text = preferences == null ? null : preferences.getString(KEY, null);
        if (text == null) return null;
        try {
            return parse(text);
        } catch (IllegalArgumentException unreadable) {
            return null;
        }
    }

    /** The palette the theme stands for. */
    TonePalette palette() {
        int a = accent != null ? accent : MESSENGER_BLUE;
        return neutral != null ? TonePalette.fromSeeds(a, neutral) : TonePalette.fromAccent(a);
    }

    /** The same colours with another pure black choice. */
    ThemeFile withPureBlack(Boolean black) {
        return new ThemeFile(name, accent, neutral, black);
    }

    /** The theme as JSON text, version first and the keys it leaves out omitted. */
    String encode() {
        try {
            JSONObject json = new JSONObject();
            json.put(VERSION_KEY, VERSION);
            if (!name.isEmpty()) json.put("name", name);
            if (accent != null) json.put("accent", hex(accent));
            if (neutral != null) json.put("neutral", hex(neutral));
            if (pureBlack != null) json.put("pure_black", pureBlack.booleanValue());
            return json.toString();
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    static String hex(int color) {
        return String.format(Locale.ROOT, "#%06X", color & 0xFFFFFF);
    }

    private static Integer color(JSONObject json, String key) {
        Object value = json.opt(key);
        if (value == null || value == JSONObject.NULL) return null;
        Matcher m = value instanceof String ? HEX.matcher(((String) value).trim()) : null;
        if (m == null || !m.matches()) throw new IllegalArgumentException(key + " is " + value);
        String digits = m.group(1);
        if (digits.length() == 3) {
            StringBuilder doubled = new StringBuilder(6);
            for (char c : digits.toCharArray()) doubled.append(c).append(c);
            digits = doubled.toString();
        }
        return 0xFF000000 | Integer.parseInt(digits, 16);
    }

    /**
     * The name without control characters, bidi embeddings, overrides and isolates, or line separators,
     * cut to MAX_NAME characters without splitting one. A pasted name can't flip or break the row it sits in.
     */
    private static String clean(String name) {
        StringBuilder kept = new StringBuilder();
        name.codePoints().filter(c -> !hidden(c)).forEach(kept::appendCodePoint);
        String trimmed = kept.toString().trim();
        if (trimmed.codePointCount(0, trimmed.length()) > MAX_NAME)
            trimmed = trimmed.substring(0, trimmed.offsetByCodePoints(0, MAX_NAME)).trim();
        return trimmed;
    }

    /** Joiners stay, since emoji like flags and families are built with them. */
    private static boolean hidden(int c) {
        int type = Character.getType(c);
        return Character.isISOControl(c) || type == Character.LINE_SEPARATOR || type == Character.PARAGRAPH_SEPARATOR
                || (c >= 0x202A && c <= 0x202E) || (c >= 0x2066 && c <= 0x2069);
    }
}
