package app.morphe.extension.chmate;

import org.json.JSONArray;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Approximate byte count of visible post text; attached-media URL ranges are omitted. */
final class XPostLength {
    static final int POSSIBLE_TRUNCATION_BYTES = 420;
    static final int POSSIBLE_TRUNCATION_POINTS = 280;
    private static final Pattern URL = Pattern.compile("(?i)(?:https?://|www\\.)[^\\s<>]+|t\\.co/[^\\s<>]+");
    private static final Pattern MENTION = Pattern.compile("@[A-Za-z0-9_]{1,50}");
    private XPostLength() {}

    static int visibleBytes(String text, JSONObject post) {
        return visibleBytes(text, post, 0);
    }

    static int visibleBytes(String text, JSONObject post, int startOffset) {
        if (text == null || text.isEmpty()) return 0;
        int start = Math.max(0, Math.min(startOffset, text.length()));
        List<Range> media = countExcludedRanges(text, post);
        int bytes = 0;
        for (int index = start; index < text.length();) {
            Range attachment = containing(index, media);
            if (attachment != null) {
                index = Math.min(text.length(), attachment.end);
                continue;
            }
            int cp = text.codePointAt(index);
            bytes += new String(Character.toChars(cp)).getBytes(StandardCharsets.UTF_8).length;
            index += Character.charCount(cp);
        }
        return bytes;
    }

    static int detailedPoints(String text, JSONObject post) {
        return detailedPoints(text, post, 0);
    }

    static int detailedPoints(String text, JSONObject post, int startOffset) {
        if (text == null || text.isEmpty()) return 0;
        int start = Math.max(0, Math.min(startOffset, text.length()));
        List<Range> media = countExcludedRanges(text, post);
        Matcher matcher = URL.matcher(text);
        matcher.region(start, text.length());
        int points = 0, position = start;
        while (matcher.find()) {
            points += weightedPlain(text, position, matcher.start(), media);
            if (!overlapsMedia(matcher.start(), matcher.end(), media)) points += 23;
            position = matcher.end();
        }
        return points + weightedPlain(text, position, text.length(), media);
    }

    /**
     * Attachment short URLs are rendered by the separate media preview. Remove them
     * from the text preview, including only their immediately preceding ASCII space.
     */
    static String withoutAttachmentUrls(String text, JSONObject post) {
        if (text == null || text.isEmpty()) return text == null ? "" : text;
        List<Range> ranges = mediaRanges(post);
        StringBuilder result = null;
        int cursor = 0;
        for (Range range : ranges) {
            if (range.end > text.length() || range.start < cursor
                    || !isAttachmentShortUrl(text.substring(range.start, range.end))) continue;
            int start = range.start;
            if (start > cursor && text.charAt(start - 1) == ' ') start--;
            if (result == null) result = new StringBuilder(text.length());
            result.append(text, cursor, start);
            cursor = range.end;
        }
        if (result == null) return text;
        return result.append(text, cursor, text.length()).toString();
    }

    private static boolean isAttachmentShortUrl(String value) {
        return value.regionMatches(true, 0, "t.co/", 0, 5)
                || value.regionMatches(true, 0, "https://t.co/", 0, 13)
                || value.regionMatches(true, 0, "http://t.co/", 0, 12);
    }

    private static List<Range> countExcludedRanges(String text, JSONObject post) {
        ArrayList<Range> result = new ArrayList<>();
        for (Range range : mediaRanges(post)) {
            if (range.end > text.length()) continue;
            int start = range.start;
            if (start > 0 && text.charAt(start - 1) == ' ') start--;
            result.add(new Range(start, range.end));
        }
        return result;
    }

    /** Reply recipients are transport metadata, not text that should trigger a truncation warning. */
    static int replyMentionPrefixEnd(String text, JSONObject post) {
        if (text == null || text.isEmpty() || post == null || !isReply(post)) return 0;
        int position = 0;
        while (position < text.length() && Character.isWhitespace(text.charAt(position))) position++;
        int end = position;
        Matcher matcher = MENTION.matcher(text);
        while (position < text.length()) {
            matcher.region(position, text.length());
            if (!matcher.lookingAt()) break;
            int after = matcher.end();
            if (after < text.length() && !Character.isWhitespace(text.charAt(after))) break;
            end = after;
            position = after;
            while (position < text.length() && Character.isWhitespace(text.charAt(position))) position++;
            end = position;
        }
        return end;
    }

    private static boolean isReply(JSONObject post) {
        return nonempty(post, "in_reply_to_status_id_str")
                || nonempty(post, "in_reply_to_status_id")
                || nonempty(post, "in_reply_to_user_id_str")
                || nonempty(post, "in_reply_to_screen_name")
                || post.optJSONObject("legacy") != null && isReply(post.optJSONObject("legacy"));
    }

    private static boolean nonempty(JSONObject post, String key) {
        Object value = post.opt(key);
        return value != null && value != JSONObject.NULL && !String.valueOf(value).isEmpty();
    }

    private static int weightedPlain(String text, int start, int end, List<Range> media) {
        int points = 0;
        for (int index = start; index < end;) {
            Range attachment = containing(index, media);
            if (attachment != null) { index = Math.min(end, attachment.end); continue; }
            int cp = text.codePointAt(index), width = Character.charCount(cp);
            if (index + width > end) break;
            int type = Character.getType(cp);
            if (cp == 0x200D || cp == 0xFE0E || cp == 0xFE0F
                    || type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK
                    || type == Character.COMBINING_SPACING_MARK) { index += width; continue; }
            points += isEmoji(cp) || cp > 0x10FF ? 2 : 1;
            index = isEmoji(cp) ? emojiEnd(text, index, end) : index + width;
        }
        return points;
    }

    private static int emojiEnd(String text, int index, int end) {
        int first = text.codePointAt(index);
        int nextIndex = index + Character.charCount(first);
        while (nextIndex < end) {
            int next = text.codePointAt(nextIndex);
            if (isEmojiModifier(next) || next == 0xFE0F || next == 0x20E3) {
                nextIndex += Character.charCount(next);
                continue;
            }
            if (next == 0x200D && nextIndex + 1 < end) {
                nextIndex++;
                nextIndex += Character.charCount(text.codePointAt(nextIndex));
                continue;
            }
            if (isRegional(first) && isRegional(next)) nextIndex += Character.charCount(next);
            break;
        }
        return nextIndex;
    }

    /** Fold the displayed text at the same limit used for the selected warning mode. */
    static String excerpt(String text, int bodyStart, boolean detailed) {
        int limit = detailed ? POSSIBLE_TRUNCATION_POINTS : POSSIBLE_TRUNCATION_BYTES;
        Matcher url = URL.matcher(text);
        url.region(bodyStart, text.length());
        boolean hasUrl = url.find();
        int total = 0;
        for (int start = bodyStart; start < text.length();) {
            int end;
            int amount;
            if (hasUrl && start == url.start()) {
                end = url.end();
                amount = detailed ? 23 : text.substring(start, end).getBytes(StandardCharsets.UTF_8).length;
                hasUrl = url.find();
            } else {
                int cp = text.codePointAt(start);
                end = isEmoji(cp) ? emojiEnd(text, start, text.length()) : start + Character.charCount(cp);
                int type = Character.getType(cp);
                if (detailed) amount = cp == 0x200D || cp == 0xFE0E || cp == 0xFE0F
                        || type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK
                        || type == Character.COMBINING_SPACING_MARK ? 0 : isEmoji(cp) || cp > 0x10FF ? 2 : 1;
                else amount = text.substring(start, end).getBytes(StandardCharsets.UTF_8).length;
            }
            total += amount;
            if (total > limit) return text.substring(0, start);
            start = end;
        }
        return text;
    }

    private static boolean overlapsMedia(int start, int end, List<Range> ranges) {
        for (Range range : ranges) if (start < range.end && end > range.start) return true;
        return false;
    }
    private static boolean isEmoji(int cp) {
        return cp >= 0x1F000 && cp <= 0x1FAFF || cp >= 0x2600 && cp <= 0x27FF
                || cp >= 0x2300 && cp <= 0x23FF || cp == 0x00A9 || cp == 0x00AE
                || cp == 0x203C || cp == 0x2049 || cp == 0x2122 || cp == 0x2139
                || cp == 0x3030 || cp == 0x303D || cp == 0x3297 || cp == 0x3299;
    }
    private static boolean isEmojiModifier(int cp) { return cp >= 0x1F3FB && cp <= 0x1F3FF; }
    private static boolean isRegional(int cp) { return cp >= 0x1F1E6 && cp <= 0x1F1FF; }

    private static List<Range> mediaRanges(JSONObject post) {
        ArrayList<Range> ranges = new ArrayList<>();
        JSONObject entities = post == null ? null : post.optJSONObject("extended_entities");
        JSONArray media = entities == null ? null : entities.optJSONArray("media");
        if (media == null && post != null) {
            entities = post.optJSONObject("entities");
            media = entities == null ? null : entities.optJSONArray("media");
        }
        if (media != null) for (int i = 0; i < media.length(); i++) {
            JSONObject item = media.optJSONObject(i);
            JSONArray indices = item == null ? null : item.optJSONArray("indices");
            if (indices == null || indices.length() < 2) continue;
            int start = indices.optInt(0, -1), end = indices.optInt(1, -1);
            if (start >= 0 && end > start && end <= Integer.MAX_VALUE)
                ranges.add(new Range(start, end));
        }
        ranges.sort(Comparator.comparingInt(value -> value.start));
        return ranges;
    }

    private static Range containing(int index, List<Range> ranges) {
        for (Range range : ranges) if (index >= range.start && index < range.end) return range;
        return null;
    }

    static boolean overlapsAttachment(int start, int end, JSONObject post) {
        return overlapsMedia(start, end, mediaRanges(post));
    }

    private static final class Range {
        final int start, end;
        Range(int start, int end) { this.start = start; this.end = end; }
    }
}
