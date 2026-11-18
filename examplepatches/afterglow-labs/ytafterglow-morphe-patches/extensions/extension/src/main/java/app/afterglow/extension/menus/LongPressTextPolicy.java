/* Copyright 2026 Morphe. Adapted for YTAfterglow from Copy text, commit
 * 44031c561ea048c8f196877f30a49c13bfd6afb6, pull request 3592.
 * https://github.com/MorpheApp/morphe-patches
 * See NOTICE for GPLv3 Section 7 terms. Not an official Morphe file.
 * Changes: title/description only, reject ambiguous collapsed texts, and expose a
 * bounded testable store for Afterglow's live preference and ownership gates.
 * Portions provided "AS IS" by the Morphe software project, without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.menus;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Morphe's native semantic text recognition, restricted to the video-details fallback. */
public final class LongPressTextPolicy {
    private static final int MAX_TEXTS = 300;
    private static final int MIN_TRUNCATED_LENGTH = 20;
    private static final int MAX_ELLIPSIS_LENGTH = 40;
    private final Map<String, String> descriptions = new LinkedHashMap<String, String>(16, .75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_TEXTS;
        }
    };
    private String title = "";

    public static final class Match {
        public final String text;
        public final boolean selectable;
        Match(String text, boolean selectable) { this.text = text; this.selectable = selectable; }
    }

    public static boolean isDescription(String identifier) {
        return identifier != null && (identifier.startsWith("description_rich_text_list.e")
                || identifier.startsWith("cell_description_body.e"));
    }

    public static boolean isTitle(String identifier, CharSequence path) {
        if (identifier == null || path == null || !identifier.startsWith("video_metadata.e")) return false;
        String value = path.toString();
        return value.contains("video_metadata_inner.e") && !value.contains("video_subtitle.e")
                && value.endsWith("|TextType|");
    }

    public synchronized void observe(String identifier, CharSequence path, CharSequence text) {
        if (text == null) return;
        boolean description = isDescription(identifier);
        if (!description && !isTitle(identifier, path)) return;
        String value = text.toString().trim();
        if (value.isEmpty()) return;
        if (description) {
            String normalized = normalize(value);
            if (!normalized.isEmpty()) descriptions.put(normalized, value);
        } else {
            int end = value.length();
            while (end > 0 && value.charAt(end - 1) >= '\u2060' && value.charAt(end - 1) <= '\u2064') end--;
            title = value.substring(0, end);
        }
    }

    /** Return only a semantic text that is currently drawn by the touched native host. */
    public synchronized Match match(List<? extends CharSequence> items) {
        if (items == null) return null;
        for (CharSequence item : items) {
            if (item == null) continue;
            String shown = item.toString().trim();
            if (shown.isEmpty()) continue;
            if (shownLength(shown, title) >= 0) return new Match(title, false);
            String key = normalize(shown);
            String exact = descriptions.get(key);
            if (exact != null) return new Match(exact, true);
            if (key.length() < MIN_TRUNCATED_LENGTH) continue;
            String best = null;
            int bestLength = -1;
            boolean ambiguous = false;
            for (Map.Entry<String, String> entry : descriptions.entrySet()) {
                int length = shownLength(key, entry.getKey());
                if (length > bestLength) {
                    bestLength = length;
                    best = entry.getValue();
                    ambiguous = false;
                } else if (length >= 0 && length == bestLength && !entry.getValue().equals(best)) {
                    ambiguous = true;
                }
            }
            if (best != null && !ambiguous) return new Match(best, true);
        }
        return null;
    }

    /** Preserve source whitespace when copying; normalization is used only to identify drawn text. */
    public static String normalize(String text) {
        StringBuilder result = new StringBuilder(text.length());
        boolean space = false;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (Character.getType(c) == Character.FORMAT) continue;
            if (Character.isWhitespace(c) || Character.isSpaceChar(c)) {
                space = result.length() > 0;
                continue;
            }
            if (space) { result.append(' '); space = false; }
            result.append(c);
        }
        return result.toString();
    }

    private static int shownLength(String shown, String full) {
        if (full.isEmpty()) return -1;
        if (shown.equals(full)) return full.length();
        int common = 0, max = Math.min(shown.length(), full.length());
        while (common < max && shown.charAt(common) == full.charAt(common)) common++;
        if (common < MIN_TRUNCATED_LENGTH || common == full.length()) return -1;

        // A shared introduction is not text identity. In particular, a recycled
        // view showing another video's final words must never recover old text.
        // Only expand an explicit ellipsis at the first differing character;
        // fade-only truncation has no reliable boundary and stays unmatched.
        int marker = common;
        while (marker < shown.length() && isSpace(shown.charAt(marker))) marker++;
        int markerLength = shown.startsWith("\u2026", marker) ? 1
                : shown.startsWith("...", marker) ? 3 : 0;
        if (markerLength == 0 || shown.length() - marker > MAX_ELLIPSIS_LENGTH) return -1;
        int suffix = marker + markerLength;
        // Native expanded-text labels can be localized, but must be separated
        // from the ellipsis. Do not accept an arbitrary differing continuation.
        return suffix == shown.length() || isSpace(shown.charAt(suffix)) ? common : -1;
    }

    private static boolean isSpace(char value) {
        return Character.isWhitespace(value) || Character.isSpaceChar(value);
    }
}
