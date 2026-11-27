package io.github.bryceaspringfield.morphe.extension.youtube;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.patches.LithoRelayoutPatch;

final class CommentTitle {

    static final int MIN_LIKES = 3;
    private static final int MAX_LENGTH = 120;

    private static final String MARKER = "(?:(?:correct|real|actual|proper|right|true|original|full|official)\\s+(?:song\\s+|track\\s+|video\\s+)?(?:title|name)"
            + "|(?:t[ií]tulo|nombre)\\s+(?:correcto|real|verdadero|original)(?:\\s+de\\s+la\\s+canci[oó]n)?"
            + "|(?:t[ií]tulo|nombre)\\s+de\\s+la\\s+canci[oó]n)";
    private static final Pattern LEADING = Pattern.compile("^\\W*(?:the\\s+|el\\s+)?" + MARKER
            + "\\s*(?:is|would\\s+be|should\\s+be|es|ser[ií]a|:|-|–|=|>|→)+\\s*(.+)$", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern TRAILING = Pattern.compile("^(.+?)[\\s\\-–:(\\[|]*(?:is\\s+the\\s+|es\\s+el\\s+)?" + MARKER
            + "[\\s)\\].!]*$", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    static final class Found {
        final String videoId;
        final String own;
        final String title;
        final long likes;

        Found(String videoId, String own, String title, long likes) {
            this.videoId = videoId;
            this.own = own;
            this.title = title;
            this.likes = likes;
        }
    }

    private static final Map<String, Found> BY_OWN = Collections.synchronizedMap(new LinkedHashMap<>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Found> e) {
            return size() > 500;
        }
    });
    private static final Set<String> ASKED = Collections.synchronizedSet(new HashSet<>());
    private static final Set<String> SHOW_OWN = Collections.synchronizedSet(new HashSet<>());

    private CommentTitle() {
    }

    static Found known(String own) {
        return own == null ? null : BY_OWN.get(own.trim());
    }

    static String shown(String own) {
        if (!XSettings.COMMENT_TITLE.get()) return null;
        Found f = known(own);
        return f == null || SHOW_OWN.contains(f.own) ? null : f.title;
    }

    static void toggle(String own) {
        if (!SHOW_OWN.remove(own)) SHOW_OWN.add(own);
        LithoRelayoutPatch.relayoutOutdatedTexts();
    }

    static void onVideo(String videoId) {
        if (!XSettings.COMMENT_TITLE.get() || videoId == null || videoId.length() != 11 || !ASKED.add(videoId)) return;
        Utils.runOnBackgroundThread(() -> {
            try {
                look(videoId);
            } catch (Throwable t) {
                Logger.printDebug(() -> "YouTube Extras: comment title lookup failed for " + videoId + ": " + t);
            }
        });
    }

    private static JSONObject body() throws Exception {
        return new JSONObject().put("context", new JSONObject().put("client", new JSONObject()
                .put("clientName", "WEB").put("clientVersion", "2.20251101.00.00").put("hl", "en").put("gl", "US")));
    }

    private static void look(String videoId) throws Exception {
        JSONObject first = Http.innertube("next", body().put("videoId", videoId), null);
        if (first == null) return;
        String own = ownTitle(first);
        String token = commentsToken(first);
        if (own == null || token == null) return;
        JSONObject page = Http.innertube("next", body().put("continuation", token), null);
        if (page == null) return;
        List<String[]> comments = new ArrayList<>();
        collectComments(page, comments);
        Found best = null;
        for (String[] c : comments) {
            long likes = likes(c[1]);
            String t = extract(c[0]);
            if (t == null || likes < MIN_LIKES || t.equalsIgnoreCase(own)) continue;
            if (best == null || likes > best.likes) best = new Found(videoId, own, t, likes);
        }
        Found found = best;
        if (XSettings.DEBUG.get()) {
            Logger.printDebug(() -> "YouTube Extras: comment title for " + videoId + " (" + comments.size() + " comments): "
                    + (found == null ? "none" : found.title + " (" + found.likes + " likes)"));
        }
        if (found != null) {
            BY_OWN.put(own.trim(), found);
            LithoRelayoutPatch.relayoutOutdatedTexts();
        }
    }

    static String extract(String comment) {
        if (comment == null) return null;
        for (String line : comment.split("\n")) {
            line = line.trim();
            if (line.isEmpty() || line.contains("?") || line.contains("¿")) continue;
            String t = null;
            Matcher m = LEADING.matcher(line);
            if (m.matches()) t = m.group(1);
            else if ((m = TRAILING.matcher(line)).matches()) t = m.group(1);
            if (t == null) continue;
            t = t.replaceAll("^[\\s\"'“”‘’«»:\\-–]+|[\\s\"'“”‘’«»:\\-–.!,]+$", "").trim();
            String lower = t.toLowerCase(Locale.ROOT);
            if (t.length() < 3 || t.length() > MAX_LENGTH || lower.startsWith("in the description")
                    || lower.matches(".*\\b(below|above|in the comments|en los comentarios|abajo)\\b.*")) continue;
            return t;
        }
        return null;
    }

    private static String ownTitle(JSONObject first) {
        JSONObject r = find(first, "videoPrimaryInfoRenderer");
        if (r == null) return null;
        JSONObject title = r.optJSONObject("title");
        if (title == null) return null;
        JSONArray runs = title.optJSONArray("runs");
        if (runs == null) return title.optString("simpleText", null);
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < runs.length(); i++) b.append(runs.optJSONObject(i).optString("text"));
        return b.toString().trim();
    }

    private static String commentsToken(JSONObject first) {
        JSONObject section = findWhere(first, "sectionIdentifier", "comment-item-section");
        if (section == null) return null;
        JSONObject cmd = find(section, "continuationCommand");
        return cmd == null ? null : cmd.optString("token", null);
    }

    private static void collectComments(Object o, List<String[]> out) {
        if (o instanceof JSONObject j) {
            JSONObject p = j.optJSONObject("commentEntityPayload");
            if (p != null) {
                JSONObject props = p.optJSONObject("properties");
                JSONObject content = props == null ? null : props.optJSONObject("content");
                JSONObject toolbar = p.optJSONObject("toolbar");
                if (content != null) {
                    out.add(new String[]{content.optString("content"), toolbar == null ? "0" : toolbar.optString("likeCountNotliked", "0")});
                }
                return;
            }
            for (java.util.Iterator<String> it = j.keys(); it.hasNext(); ) collectComments(j.opt(it.next()), out);
        } else if (o instanceof JSONArray a) {
            for (int i = 0; i < a.length(); i++) collectComments(a.opt(i), out);
        }
    }

    static long likes(String s) {
        if (s == null) return 0;
        String t = s.trim().toUpperCase(Locale.ROOT).replace(",", "");
        if (t.isEmpty()) return 0;
        double mult = t.endsWith("K") ? 1e3 : t.endsWith("M") ? 1e6 : t.endsWith("B") ? 1e9 : 1;
        if (mult > 1) t = t.substring(0, t.length() - 1);
        try {
            return Math.round(Double.parseDouble(t.trim()) * mult);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static JSONObject find(Object o, String key) {
        if (o instanceof JSONObject j) {
            JSONObject v = j.optJSONObject(key);
            if (v != null) return v;
            for (java.util.Iterator<String> it = j.keys(); it.hasNext(); ) {
                JSONObject r = find(j.opt(it.next()), key);
                if (r != null) return r;
            }
        } else if (o instanceof JSONArray a) {
            for (int i = 0; i < a.length(); i++) {
                JSONObject r = find(a.opt(i), key);
                if (r != null) return r;
            }
        }
        return null;
    }

    private static JSONObject findWhere(Object o, String key, String value) {
        if (o instanceof JSONObject j) {
            if (value.equals(j.optString(key, null))) return j;
            for (java.util.Iterator<String> it = j.keys(); it.hasNext(); ) {
                JSONObject r = findWhere(j.opt(it.next()), key, value);
                if (r != null) return r;
            }
        } else if (o instanceof JSONArray a) {
            for (int i = 0; i < a.length(); i++) {
                JSONObject r = findWhere(a.opt(i), key, value);
                if (r != null) return r;
            }
        }
        return null;
    }
}
