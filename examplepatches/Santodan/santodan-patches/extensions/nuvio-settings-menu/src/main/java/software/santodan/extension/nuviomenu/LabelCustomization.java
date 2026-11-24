package software.santodan.extension.nuviomenu;

import java.util.*;

/** Sparse overrides: absent values retain the native renderer's own style and translated text. */
public final class LabelCustomization {
    public static final String SCOPE = "santodan_nuvio_label_styles";
    public static final String[] FIELDS = {"background_color", "foreground_color", "size_percent", "font_size_percent", "position", "text"};
    public static final String[] IDS = {"new_season", "new_episode", "next_up", "upcoming", "resume", "percent_watched", "time_left", "airs_today", "airs_tomorrow", "airs_date", "airs_days", "file_size", "remaining_count", "date_label"};
    public static final String[] NAMES = {"New Season", "New Episode", "Next Up", "Upcoming", "Resume", "Watched progress", "Time remaining", "Airs today", "Airs tomorrow", "Air date", "Airs in days", "File size", "Continue Watching remaining count", "Date label"};
    public static final int[][] RESOURCES = {{0x7f1103ed}, {0x7f1103eb,0x7f1103ec}, {0x7f1103ee,0x7f1103ef}, {0x7f1103f2}, {0x7f1103f1}, {0x7f1103f0}, {0x7f1103e9,0x7f1103ea}, {0x7f1103e3,0x7f1103e4}, {0x7f1103e5,0x7f1103e6}, {0x7f1103e1,0x7f1103e2}, {}, {}, {}, {}};
    public enum Copy { TEXT, LABEL, ALL }
    private LabelCustomization() {}

    public static String key(String id, String field) {
        if (!id.matches("[a-z][a-z0-9_]{0,95}") || !Arrays.asList(FIELDS).contains(field)) throw new IllegalArgumentException("Unknown label setting");
        return "label_" + id + ":" + field;
    }
    public static String type(String key) {
        if (key.matches("name_[a-z][a-z0-9_]{0,95}")) return "string";
        if (key.matches("label_[a-z][a-z0-9_]{0,95}:(background_color|foreground_color)")) return "long";
        if (key.matches("label_[a-z][a-z0-9_]{0,95}:(size_percent|font_size_percent|position)")) return "int";
        if (key.matches("label_[a-z][a-z0-9_]{0,95}:text")) return "string";
        return key.equals("enabled") ? "boolean" : null;
    }
    public static Object valid(String field, Object value) {
        if (field.endsWith("_color")) {
            if (!(value instanceof Long) || (((Long)value) & 0xffffffffL) != 0L) throw new IllegalArgumentException("Invalid label color");
        } else if (field.endsWith("_percent")) {
            if (!(value instanceof Integer) || (Integer)value < 50 || (Integer)value > 200 || (Integer)value % 10 != 0) throw new IllegalArgumentException("Invalid label size");
        } else if (field.equals("position")) {
            if (!(value instanceof Integer) || (Integer)value < 0 || (Integer)value > 8) throw new IllegalArgumentException("Invalid label position");
        } else if (field.equals("text")) {
            if (!(value instanceof String)) throw new IllegalArgumentException("Invalid label text");
            String text = ((String)value).trim();
            if (text.codePointCount(0,text.length()) > 80 || text.codePoints().anyMatch(Character::isISOControl)) throw new IllegalArgumentException("Use up to 80 characters on one line");
            return text;
        } else throw new IllegalArgumentException("Unknown label field");
        return value;
    }
    private static boolean dynamic(String id) {
        return Arrays.asList("percent_watched","time_left","airs_date","airs_days","file_size","metadata_year","metadata_runtime","remaining_count","date_label").contains(id);
    }
    public static String text(String override, String nativeText) {
        return override == null || override.isEmpty() ? nativeText : override.replace("{value}", nativeText == null ? "" : nativeText);
    }

    public static final class Draft {
        public final String id;
        private final Map<String,Object> values = new LinkedHashMap<>();
        public final long nativeBackground, nativeForeground;
        public final String nativeText;
        public boolean dirty;
        public Draft(String id, Map<String,?> saved, long background, long foreground, String text) {
            key(id,"text"); this.id=id; nativeBackground=background; nativeForeground=foreground; nativeText=text;
            for (String field : FIELDS) if (saved.containsKey(field)) {
                try { values.put(field, valid(field,saved.get(field))); } catch (IllegalArgumentException ignored) { /* Native fallback for malformed preferences. */ }
            }
        }
        public Map<String,Object> values() { return Collections.unmodifiableMap(new LinkedHashMap<>(values)); }
        public boolean has(String field) { return values.containsKey(field); }
        public long color(boolean background) { return (Long)values.getOrDefault(background?"background_color":"foreground_color",background?nativeBackground:nativeForeground); }
        public int size(boolean background) { return (Integer)values.getOrDefault(background?"size_percent":"font_size_percent",100); }
        public int position() { return (Integer)values.getOrDefault("position",id.equals("date_label")?7:id.equals("remaining_count")?0:2); }
        public String caption() { return LabelCustomization.text((String)values.get("text"),nativeText); }
        public String textOverride() { return (String)values.getOrDefault("text",""); }
        public void set(String field,Object value) {
            Object checked=valid(field,value);
            if (field.equals("text") && ((String)checked).isEmpty()) values.remove(field); else values.put(field,checked);
            dirty=true;
        }
        public void reset() { values.clear(); dirty=true; }
        public void copyFrom(Draft source, Copy what) {
            if (what==Copy.TEXT || what==Copy.ALL) {
                set("foreground_color",source.color(false)); set("font_size_percent",source.size(false));
                set("text",source.has("text")?source.textOverride():dynamic(source.id)?"{value}":source.nativeText);
            }
            if (what==Copy.LABEL || what==Copy.ALL) {
                set("background_color",source.color(true)); set("size_percent",source.size(true)); set("position",source.position());
            }
        }
    }
}
