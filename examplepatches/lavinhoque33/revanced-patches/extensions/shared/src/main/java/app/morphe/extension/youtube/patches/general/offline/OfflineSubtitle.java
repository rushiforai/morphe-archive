/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-31.
 */

package app.morphe.extension.youtube.patches.general.offline;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.apache.commons.lang3.StringEscapeUtils;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/** Pure subtitle conversion and selection rules, shared by the downloader and built-in player. */
final class OfflineSubtitle {
    static final int MAX_TRACKS = 5;

    record Cue(long startMs, long endMs, String text) {
    }

    private OfflineSubtitle() {
    }

    static boolean select(Set<String> selected, String key, boolean checked) {
        if (!checked) {
            selected.remove(key);
            return true;
        }
        if (selected.contains(key)) return true;
        if (selected.size() >= MAX_TRACKS) return false;
        selected.add(key);
        return true;
    }

    static List<Cue> parseJson3(String json, boolean asr) {
        JsonObject document = JsonParser.parseString(json).getAsJsonObject();
        JsonArray events = document.getAsJsonArray("events");
        if (events == null) return List.of();
        List<Cue> raw = new ArrayList<>();
        for (JsonElement element : events) {
            if (!element.isJsonObject()) continue;
            JsonObject event = element.getAsJsonObject();
            if (event.has("aAppend") && event.get("aAppend").getAsInt() != 0) continue;
            if (!event.has("tStartMs") || !event.has("dDurationMs")) continue;
            long start = Math.max(0, Math.round(event.get("tStartMs").getAsDouble()));
            long duration = Math.round(event.get("dDurationMs").getAsDouble());
            if (duration <= 0 || duration > Long.MAX_VALUE - start) continue;
            JsonArray segments = event.getAsJsonArray("segs");
            if (segments == null) continue;
            StringBuilder text = new StringBuilder();
            for (JsonElement segment : segments) {
                JsonObject part = segment.getAsJsonObject();
                if (part.has("utf8")) text.append(part.get("utf8").getAsString());
            }
            String cleaned = cleanText(text.toString());
            if (!cleaned.isEmpty()) raw.add(new Cue(start, start + duration, cleaned));
        }
        raw.sort(Comparator.comparingLong(Cue::startMs));
        List<Cue> merged = new ArrayList<>(raw.size());
        for (Cue cue : raw) {
            if (!merged.isEmpty()) {
                int last = merged.size() - 1;
                Cue previous = merged.get(last);
                if (asr && cue.startMs <= previous.endMs && cue.text.equals(previous.text)) {
                    merged.set(last, new Cue(previous.startMs, Math.max(previous.endMs, cue.endMs), previous.text));
                    continue;
                }
                // Same-time rolling ASR events replace the incomplete line, not the entire time window.
                if (cue.startMs == previous.startMs) {
                    merged.set(last, cue);
                    continue;
                }
            }
            merged.add(cue);
        }
        List<Cue> result = new ArrayList<>(merged.size());
        for (int index = 0; index < merged.size(); index++) {
            Cue cue = merged.get(index);
            long end = index + 1 < merged.size()
                    ? Math.min(cue.endMs, merged.get(index + 1).startMs) : cue.endMs;
            if (end > cue.startMs) result.add(new Cue(cue.startMs, end, cue.text));
        }
        return result;
    }

    private static String cleanText(String text) {
        return StringEscapeUtils.unescapeHtml4(text)
                .replaceAll("(?i)<br\\s*/?>", "\n")
                .replaceAll("<[^>]*>", "")
                .replaceAll("\\[[^]\\r\\n]*]", "")
                .replace(">>", "")
                .replace('\r', '\n')
                .replace('\u00a0', ' ')
                .replaceAll("[\\t ]+", " ")
                .replaceAll(" *\\n *", "\n")
                .replaceAll("\\n{2,}", "\n")
                .trim();
    }

    static String write(List<Cue> cues, String format) {
        boolean vtt = "vtt".equals(format);
        StringBuilder output = new StringBuilder(vtt ? "WEBVTT\n\n" : "");
        int index = 1;
        for (Cue cue : cues) {
            output.append(index++).append('\n');
            output.append(timestamp(cue.startMs, vtt)).append(" --> ")
                    .append(timestamp(cue.endMs, vtt)).append('\n');
            // VTT treats angle brackets and ampersands as markup. SRT players do too.
            output.append(cue.text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"));
            output.append("\n\n");
        }
        return output.toString();
    }

    private static String timestamp(long millis, boolean vtt) {
        return String.format(Locale.ROOT, "%02d:%02d:%02d%c%03d", millis / 3_600_000,
                millis / 60_000 % 60, millis / 1000 % 60, vtt ? '.' : ',', millis % 1000);
    }

    static String fileName(String title, String videoId, String language, String kind,
                           String translation, String format) {
        String base = sanitize(title);
        int end = 0;
        int bytes = 0;
        while (end < base.length()) {
            int codePoint = base.codePointAt(end);
            int width = codePoint <= 0x7F ? 1 : codePoint <= 0x7FF ? 2 : codePoint <= 0xFFFF ? 3 : 4;
            if (bytes + width > 140) break;
            bytes += width;
            end += Character.charCount(codePoint);
        }
        base = base.substring(0, end);
        String suffix = translation.isEmpty() ? ("asr".equals(kind) ? ".auto" : "") : "." + sanitize(translation);
        return base + " [" + sanitize(videoId) + "]." + sanitize(language) + suffix
                + "." + ("vtt".equals(format) ? "vtt" : "srt");
    }

    static String uniqueName(String name, java.util.function.Predicate<String> exists) {
        String candidate = name;
        int dot = name.lastIndexOf('.');
        int number = 2;
        while (exists.test(candidate)) {
            candidate = name.substring(0, dot) + " (" + number++ + ")" + name.substring(dot);
        }
        return candidate;
    }

    static String visitorCookies(Map<String, List<String>> headers) {
        Map<String, String> cookies = new LinkedHashMap<>();
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            if (!"Set-Cookie".equalsIgnoreCase(entry.getKey())) continue;
            for (String header : entry.getValue()) {
                int semicolon = header.indexOf(';');
                String pair = (semicolon < 0 ? header : header.substring(0, semicolon)).trim();
                int equals = pair.indexOf('=');
                if (equals < 1 || equals == pair.length() - 1) continue;
                String name = pair.substring(0, equals);
                // This is a fresh anonymous session; never forward authentication cookies.
                switch (name) {
                    case "VISITOR_INFO1_LIVE", "VISITOR_PRIVACY_METADATA", "YSC", "GPS",
                            "__Secure-ROLLOUT_TOKEN", "__Secure-YNID" -> cookies.put(name, pair);
                }
            }
        }
        return cookies.containsKey("VISITOR_INFO1_LIVE") ? String.join("; ", cookies.values()) : "";
    }

    static boolean isRateLimited(int status, String body) {
        if (status == 429) return true;
        String trimmed = body.trim();
        if (trimmed.isEmpty() || trimmed.charAt(0) != '<') return false;
        String html = trimmed.toLowerCase(Locale.ROOT);
        return html.contains("sorry") || html.contains("unusual traffic");
    }

    private static String sanitize(String text) {
        String result = text.replaceAll("[\\p{Cntrl}\\\\/:*?\"<>|]", "_")
                .replaceAll("[. ]+$", "").trim();
        return result.isEmpty() || ".".equals(result) || "..".equals(result) ? "subtitle" : result;
    }

    /** Binary lookup also handles seeks backwards and gaps, without reparsing or per-tick allocations. */
    static String textAt(List<Cue> cues, long timeMs) {
        int low = 0;
        int high = cues.size() - 1;
        while (low <= high) {
            int middle = (low + high) >>> 1;
            Cue cue = cues.get(middle);
            if (timeMs < cue.startMs) high = middle - 1;
            else if (timeMs >= cue.endMs) low = middle + 1;
            else return cue.text;
        }
        return "";
    }
}
