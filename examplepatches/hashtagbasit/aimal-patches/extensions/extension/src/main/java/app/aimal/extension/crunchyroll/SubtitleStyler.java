package app.aimal.extension.crunchyroll;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Restyles Crunchyroll's subtitles by rewriting the ASS script before libass
 * ever parses it.
 *
 * Crunchyroll does not use media3's SubtitleView. It ships libass and renders
 * subtitles to bitmaps natively — by the time anything reaches the view layer it
 * is a Bitmap in an AssFrame, so there is no text left to restyle. What there
 * is, one step earlier, is the whole ASS document arriving as a String in
 * SubtitlesRendererImpl.loadTrack(String). ASS keeps its styling in plain text:
 *
 *   [V4+ Styles]
 *   Format: Name, Fontname, Fontsize, PrimaryColour, ..., BorderStyle, Outline, ...
 *   Style: Default,Trebuchet MS,32,&H00FFFFFF,...,1,2,...
 *
 * So rewriting those Style lines restyles every subtitle in the track, and
 * libass does the rest.
 *
 * Column positions are read from the Format line rather than assumed, because
 * ASS allows the columns in any order.
 *
 * Size, colour and the outline/box options are pure numbers and colours, so they
 * always work. Changing the font *name* is best-effort: libass is initialised
 * with the app's asset manager and cache dir, and if it cannot resolve the
 * family it silently falls back to its default.
 */
public final class SubtitleStyler {

    private static final String PREFS = "aimal_crunchyroll_subtitles";
    private static final String KEY_SIZE = "size";
    private static final String KEY_FONT = "font";
    private static final String KEY_BORDER = "border";

    /** Multipliers applied to the script's own Fontsize. */
    private static final float[] SIZES = {0.75f, 0.9f, 1.0f, 1.25f, 1.5f};
    private static final String[] SIZE_LABELS = {"0.75×", "0.9×", "1.0×", "1.25×", "1.5×"};

    /** "" keeps whatever font the script asked for. */
    private static final String[] FONTS = {"", "Roboto", "Noto Sans", "Droid Sans Mono", "serif"};
    private static final String[] FONT_LABELS = {"FONT: AS-IS", "ROBOTO", "NOTO", "MONO", "SERIF"};

    private static final String[] BORDER_LABELS = {"BORDER: AS-IS", "OUTLINE", "BOX"};

    static final String TAG = "StreamPlayback";

    /**
     * The values live in memory, not in SharedPreferences.
     *
     * An earlier version read every setting straight from SharedPreferences and
     * treated a null instance as "everything is default". Since the only thing
     * that created that instance was the player view attaching, a tap could be
     * silently discarded and the script was never modified — the settings
     * appeared to do nothing at all. Memory is now the source of truth and
     * storage is best-effort on top.
     */
    private static volatile int size = 2;
    private static volatile int font = 0;
    private static volatile int border = 0;

    private static SharedPreferences preferences;
    private static boolean loaded;

    /** Set once the user cycles anything, so [load] cannot clobber the choice. */
    private static volatile boolean userChanged;

    /**
     * Set the first time the patched loadTrack hook calls in. Lets the UI tell
     * "no subtitle track has loaded yet" apart from "the Subtitle styling patch
     * was never applied", which look identical from the user's side.
     */
    private static volatile boolean hookSeen;

    static boolean hookSeen() {
        return hookSeen;
    }

    /**
     * Set from the patched subtitle renderer's initialize(), which runs long
     * before any track loads. Without this, "the patch was never applied" and
     * "no subtitle has loaded yet" are indistinguishable from the outside.
     */
    private static volatile boolean patched;

    static boolean patched() {
        return patched;
    }

    /** Called from the patch. Must not throw. */
    public static void markPatched() {
        patched = true;
        Log.i(TAG, "Subtitle styling patch is active");
    }

    private SubtitleStyler() {
    }

    static void init(Context context) {
        load(context);
    }

    /**
     * Resolves SharedPreferences once, from a supplied Context or, failing
     * that, from the running Application. Not depending on a hook to hand over
     * a Context matters because the subtitle track can load before any of the
     * view-level hooks have run.
     */
    private static synchronized void load(Context context) {
        if (loaded) return;

        try {
            Context resolved = context != null ? context.getApplicationContext() : currentApplication();
            if (resolved == null) return; // Try again on the next call.

            preferences = resolved.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

            if (userChanged) {
                // The user cycled a setting before storage could be resolved -
                // the subtitle track can load before any view hook has run, so
                // this really happens. Their choice is the newer one, so write
                // it out rather than overwriting it with the previous run's.
                preferences.edit()
                        .putInt(KEY_SIZE, size)
                        .putInt(KEY_FONT, font)
                        .putInt(KEY_BORDER, border)
                        .apply();
            } else {
                size = preferences.getInt(KEY_SIZE, size);
                font = preferences.getInt(KEY_FONT, font);
                border = preferences.getInt(KEY_BORDER, border);
            }

            loaded = true;
            Log.i(TAG, "Subtitle settings loaded: size=" + size + " font=" + font + " border=" + border);
        } catch (Throwable t) {
            Log.e(TAG, "Could not load subtitle settings", t);
        }
    }

    private static Context currentApplication() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    // Settings ----------------------------------------------------------------

    static int size() {
        load(null);
        return size;
    }

    static int font() {
        load(null);
        return font;
    }

    static int border() {
        load(null);
        return border;
    }

    static int cycleSize() {
        size = (size() + 1) % SIZES.length;
        return put(KEY_SIZE, size);
    }

    static int cycleFont() {
        font = (font() + 1) % FONTS.length;
        return put(KEY_FONT, font);
    }

    static int cycleBorder() {
        border = (border() + 1) % BORDER_LABELS.length;
        return put(KEY_BORDER, border);
    }

    private static int put(String key, int value) {
        userChanged = true;
        // The in-memory value has already been updated; storing is a bonus so
        // the choice survives a restart.
        try {
            if (preferences != null) preferences.edit().putInt(key, value).apply();
        } catch (Throwable ignored) {
        }
        Log.i(TAG, "Subtitle setting " + key + " = " + value);
        return value;
    }

    static String sizeLabel() {
        return SIZE_LABELS[bound(size(), SIZE_LABELS.length)];
    }

    static String fontLabel() {
        return FONT_LABELS[bound(font(), FONT_LABELS.length)];
    }

    static String borderLabel() {
        return BORDER_LABELS[bound(border(), BORDER_LABELS.length)];
    }

    /** Nothing to do when every option is still on its default. */
    private static boolean isModified() {
        return size() != 2 || font() != 0 || border() != 0;
    }

    // Rewriting ---------------------------------------------------------------

    /**
     * Called from SubtitlesRendererImpl.loadTrack with the raw ASS script.
     * Returns the script to hand to libass. Any failure returns the input
     * untouched — a broken subtitle track is far worse than an unstyled one.
     */
    public static String restyle(String script) {
        try {
            hookSeen = true;
            Log.i(TAG, "restyle() called, script=" + (script == null ? "null" : script.length() + " chars")
                    + " size=" + size() + " font=" + font() + " border=" + border());

            if (script == null || script.length() == 0) return script;
            if (!isModified()) {
                Log.i(TAG, "Subtitle settings are all default; script left untouched");
                return script;
            }

            String[] lines = script.split("\n", -1);
            List<String> columns = null;
            boolean inStyles = false;
            int rewritten = 0;

            for (int i = 0; i < lines.length; i++) {
                String trimmed = lines[i].trim();

                if (trimmed.startsWith("[")) {
                    // Section header: only the style sections are of interest.
                    inStyles = trimmed.equalsIgnoreCase("[V4+ Styles]")
                            || trimmed.equalsIgnoreCase("[V4 Styles]");
                    columns = null;
                } else if (inStyles && startsWith(trimmed, "Format:")) {
                    columns = split(trimmed.substring("Format:".length()), -1);
                } else if (inStyles && columns != null && startsWith(trimmed, "Style:")) {
                    String rewrittenLine = rewriteStyle(lines[i], columns);
                    if (rewrittenLine != null) {
                        lines[i] = rewrittenLine;
                        rewritten++;
                    }
                }
            }

            if (rewritten == 0) {
                // Either there is no [V4+ Styles] section or its Format line was
                // missing; without the column names nothing can be rewritten.
                Log.i(TAG, "No Style lines were rewritten - is this really an ASS script?");
                return script;
            }
            Log.i(TAG, "Rewrote " + rewritten + " Style line(s)");

            // Rewriting the styles is not always enough: an inline override tag
            // on a dialogue line beats the [V4+ Styles] block, so a track that
            // carries {\fs28} on every line ignores everything above - which is
            // precisely what "the settings do nothing" looks like from outside.
            int overridden = stripOverrides(lines);
            Log.i(TAG, "Stripped inline overrides from " + overridden + " dialogue line(s)");

            StringBuilder out = new StringBuilder(script.length() + 128);
            for (int i = 0; i < lines.length; i++) {
                if (i > 0) out.append('\n');
                out.append(lines[i]);
            }
            return out.toString();
        } catch (Throwable t) {
            Log.e(TAG, "restyle failed; using the original script", t);
            return script;
        }
    }

    private static String rewriteStyle(String line, List<String> columns) {
        int colon = line.indexOf(':');
        if (colon < 0) return null;

        String prefix = line.substring(0, colon + 1);
        List<String> values = split(line.substring(colon + 1), columns.size());
        if (values.size() != columns.size()) return null;

        // Only the fields actually being changed are rewritten; everything else
        // keeps its original text, whitespace included, so the rewritten script
        // differs from the original in exactly the places it has to.
        for (int i = 0; i < columns.size(); i++) {
            String column = columns.get(i).trim();
            String value = values.get(i).trim();

            if (column.equalsIgnoreCase("Fontsize")) {
                String scaled = scaleSize(value);
                if (!scaled.equals(value)) values.set(i, scaled);
            } else if (column.equalsIgnoreCase("Fontname") && font() != 0) {
                values.set(i, FONTS[bound(font(), FONTS.length)]);
            } else if (column.equalsIgnoreCase("BorderStyle") && border() != 0) {
                // 1 = outline + drop shadow, 3 = opaque box behind the text.
                values.set(i, border() == 2 ? "3" : "1");
            } else if (column.equalsIgnoreCase("Outline") && border() == 1) {
                // Give the outline enough weight to actually read against video.
                values.set(i, "3");
            } else if (column.equalsIgnoreCase("BackColour") && border() == 2) {
                // Opaque black box. ASS colours are &HAABBGGRR, alpha 00 = solid.
                values.set(i, "&H00000000");
            }
        }

        StringBuilder out = new StringBuilder(line.length() + 32);
        out.append(prefix);
        for (int i = 0; i < values.size(); i++) {
            if (i > 0) out.append(',');
            out.append(values.get(i));
        }
        return out.toString();
    }

    /**
     * Removes the inline override tags that would otherwise beat the rewritten
     * [V4+ Styles] block.
     *
     * Only tags matching a setting the user actually changed are removed, so a
     * track keeps its positioning, karaoke, colour and drawing tags. Returns how
     * many dialogue lines were touched.
     */
    private static int stripOverrides(String[] lines) {
        boolean dropSize = size() != 2;
        boolean dropFont = font() != 0;
        if (!dropSize && !dropFont) return 0;

        int changed = 0;
        boolean inEvents = false;

        for (int i = 0; i < lines.length; i++) {
            String trimmed = lines[i].trim();

            if (trimmed.startsWith("[")) {
                inEvents = trimmed.equalsIgnoreCase("[Events]");
                continue;
            }
            if (!inEvents || !startsWith(trimmed, "Dialogue:")) continue;

            String updated = stripBlocks(lines[i], dropSize, dropFont);
            if (!updated.equals(lines[i])) {
                lines[i] = updated;
                changed++;
            }
        }

        return changed;
    }

    /** Rewrites every {...} override block in one dialogue line. */
    private static String stripBlocks(String line, boolean dropSize, boolean dropFont) {
        if (line.indexOf('{') < 0) return line;

        StringBuilder out = new StringBuilder(line.length());
        int i = 0;

        while (i < line.length()) {
            char c = line.charAt(i);
            if (c != '{') {
                out.append(c);
                i++;
                continue;
            }

            int end = line.indexOf('}', i);
            if (end < 0) {
                // Unbalanced brace: leave the rest exactly as it was.
                out.append(line.substring(i));
                break;
            }

            String block = line.substring(i + 1, end);

            // An animation tag nests its own backslashes inside parentheses -
            // \t(0,500,\fs30). Splitting on backslashes would tear that apart,
            // so such a block is left completely alone.
            String kept = block.contains("\\t(")
                    ? block
                    : stripTags(block, dropSize, dropFont);

            if (kept.length() > 0) out.append('{').append(kept).append('}');
            i = end + 1;
        }

        return out.toString();
    }

    /** Drops \fs&lt;number&gt; and \fn&lt;name&gt; from one override block. */
    private static String stripTags(String block, boolean dropSize, boolean dropFont) {
        StringBuilder out = new StringBuilder(block.length());
        int i = 0;

        while (i < block.length()) {
            if (block.charAt(i) != '\\') {
                out.append(block.charAt(i));
                i++;
                continue;
            }

            // A tag runs to the next backslash, or to the end of the block.
            int end = block.indexOf('\\', i + 1);
            if (end < 0) end = block.length();

            String tag = block.substring(i, end);
            if ((dropSize && isFontSizeTag(tag)) || (dropFont && tag.startsWith("\\fn"))) {
                i = end;
                continue;
            }

            out.append(tag);
            i = end;
        }

        return out.toString();
    }

    /**
     * True for \fs28, false for \fsp (letter spacing) and \fscx / \fscy
     * (scaling), which only share the prefix.
     */
    private static boolean isFontSizeTag(String tag) {
        if (!tag.startsWith("\\fs") || tag.length() < 4) return false;
        char next = tag.charAt(3);
        return next >= '0' && next <= '9';
    }

    private static String scaleSize(String value) {
        float factor = SIZES[bound(size(), SIZES.length)];
        if (factor == 1.0f) return value;
        try {
            float parsed = Float.parseFloat(value);
            int scaled = Math.round(parsed * factor);
            if (scaled < 1) scaled = 1;
            return String.format(Locale.US, "%d", scaled);
        } catch (NumberFormatException e) {
            return value;
        }
    }

    /** ASS fields are comma separated; limit mirrors String.split's semantics. */
    private static List<String> split(String input, int limit) {
        List<String> parts = new ArrayList<>();
        int start = 0;
        for (int i = 0; i < input.length(); i++) {
            if (input.charAt(i) != ',') continue;
            if (limit > 0 && parts.size() == limit - 1) break;
            parts.add(input.substring(start, i));
            start = i + 1;
        }
        parts.add(input.substring(start));
        return parts;
    }

    private static boolean startsWith(String value, String prefix) {
        return value.regionMatches(true, 0, prefix, 0, prefix.length());
    }

    private static int bound(int index, int length) {
        return (index < 0 || index >= length) ? 0 : index;
    }
}
