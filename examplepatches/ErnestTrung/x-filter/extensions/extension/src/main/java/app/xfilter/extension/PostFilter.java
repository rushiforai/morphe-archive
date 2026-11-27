package app.xfilter.extension;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * Removes timeline entries from X's GraphQL responses before the app parses them.
 *
 * X 12.19.1 timeline JSON (verified against the app's LoganSquare mappers):
 * data.timeline_response.timeline (home), data.timeline_response (replies),
 * data.search.timeline_response.timeline, data.list.timeline_response.timeline.
 * Entries live in "entries" / "moduleItems" / "items" arrays of objects with "entryId".
 * A post item holds "tweetResult".result, the GraphQL tweet (legacy, core.user_result(s), ...).
 */
@SuppressWarnings("unused")
public final class PostFilter {
    static final String PREFS = "xfilter";
    private static final String TAG = "XFilter";
    private static final byte[] GRAPHQL_PREFIX = "{\"data\":{".getBytes(StandardCharsets.US_ASCII);
    private static final Set<String> ENTRY_ARRAYS = new HashSet<>(Arrays.asList("entries", "moduleItems", "items"));

    enum Scope { HOME, SEARCH, REPLIES, LISTS, OTHER }

    // Preference keys.
    static final String PROMOTED = "promoted", WHO_TO_FOLLOW = "who_to_follow", CREATORS = "creators",
            COMMUNITIES = "communities", NEWS = "news", PREMIUM_PROMPTS = "premium_prompts", DISCOVER_MORE = "discover_more",
            REPOSTS = "reposts", QUOTES = "quotes", REPLIES = "replies", NOT_FOLLOWED = "not_followed",
            BLUE_NOT_FOLLOWED = "blue_not_followed", PHOTOS = "photos", VIDEOS = "videos", TEXT_ONLY = "text_only",
            LINKS = "links", POLLS = "polls", SENSITIVE = "sensitive", COMMUNITY_POSTS = "community_posts",
            MAX_HASHTAGS = "max_hashtags", CONTAINS = "contains", STARTS_WITH = "starts_with", ENDS_WITH = "ends_with",
            REGEX = "regex", MIN_LENGTH = "min_length", MAX_LENGTH = "max_length", MUTED_USERS = "muted_users",
            LANGUAGES = "languages", SCOPE_HOME = "scope_home", SCOPE_SEARCH = "scope_search",
            SCOPE_REPLIES = "scope_replies", SCOPE_LISTS = "scope_lists";

    static final Set<String> DEFAULT_ON = new HashSet<>(Arrays.asList(PROMOTED, SCOPE_HOME, SCOPE_SEARCH, SCOPE_REPLIES));

    /** Called at the start of Jackson's createParser(InputStream). */
    public static InputStream filter(InputStream in) throws IOException {
        if (in == null) return null;

        BufferedInputStream buffered = new BufferedInputStream(in);
        buffered.mark(GRAPHQL_PREFIX.length);
        byte[] head = new byte[GRAPHQL_PREFIX.length];
        int n = 0, r;
        while (n < head.length && (r = buffered.read(head, n, head.length - n)) > 0) n += r;
        buffered.reset();
        // Only GraphQL bodies are buffered; everything else keeps streaming.
        if (n < head.length || !Arrays.equals(head, GRAPHQL_PREFIX)) return buffered;

        byte[] body = readAll(buffered);
        try {
            String json = new String(body, StandardCharsets.UTF_8);
            if (!json.contains("\"instructions\"")) return new ByteArrayInputStream(body);
            Rules rules = Rules.from(loadPrefs());
            if (!rules.any) return new ByteArrayInputStream(body);

            JSONObject root = new JSONObject(json);
            int removed = filterResponse(root, rules);
            Log.d(TAG, "data=" + root.optJSONObject("data").names() + " removed=" + removed);
            if (removed == 0) return new ByteArrayInputStream(body);
            return new ByteArrayInputStream(root.toString().getBytes(StandardCharsets.UTF_8));
        } catch (Throwable t) {
            // Never break the app: fall back to the untouched response.
            Log.e(TAG, "filter failed", t);
            return new ByteArrayInputStream(body);
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(64 * 1024);
        byte[] buf = new byte[16 * 1024];
        int r;
        while ((r = in.read(buf)) != -1) out.write(buf, 0, r);
        in.close();
        return out.toByteArray();
    }

    private static Map<String, ?> loadPrefs() throws Exception {
        Context ctx = (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        return ctx == null ? Collections.<String, Object>emptyMap()
                : ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getAll();
    }

    /** Filters a parsed GraphQL response in place. Returns the number of removed entries. */
    static int filterResponse(JSONObject root, Rules rules) {
        JSONObject data = root.optJSONObject("data");
        return data == null ? 0 : walk(data, rules, scopeOf(data), false);
    }

    static Scope scopeOf(JSONObject data) {
        if (data.has("search")) return Scope.SEARCH;
        if (data.has("list")) return Scope.LISTS;
        JSONObject tr = data.optJSONObject("timeline_response");
        if (tr != null) return tr.has("timeline") ? Scope.HOME : Scope.REPLIES;
        return Scope.OTHER;
    }

    private static int walk(Object node, Rules r, Scope s, boolean inThread) {
        int removed = 0;
        if (node instanceof JSONArray) {
            JSONArray a = (JSONArray) node;
            for (int i = 0; i < a.length(); i++) removed += walk(a.opt(i), r, s, inThread);
        } else if (node instanceof JSONObject) {
            JSONObject o = (JSONObject) node;
            for (Iterator<String> it = o.keys(); it.hasNext(); ) {
                String key = it.next();
                Object v = o.opt(key);
                if (v instanceof JSONArray && ENTRY_ARRAYS.contains(key)) {
                    removed += filterEntries((JSONArray) v, r, s, inThread);
                } else if (!key.equals("tweetResult") && !key.equals("tweet_results")) {
                    removed += walk(v, r, s, inThread);
                }
            }
        }
        return removed;
    }

    private static int filterEntries(JSONArray entries, Rules r, Scope s, boolean inThread) {
        int removed = 0;
        for (int i = entries.length() - 1; i >= 0; i--) {
            JSONObject e = entries.optJSONObject(i);
            if (e == null) continue;
            if (!e.has("entryId")) {
                removed += walk(e, r, s, inThread);
                continue;
            }
            String id = e.optString("entryId");
            if (id.startsWith("cursor-")) continue;
            if (r.hidesEntry(id)) {
                entries.remove(i);
                removed++;
                continue;
            }
            boolean thread = inThread || id.startsWith("conversationthread-");

            JSONObject holder = findTweetHolder(e);
            if (holder != null) {
                if (r.hidesPost(holder, s, thread)) {
                    entries.remove(i);
                    removed++;
                }
                continue;
            }

            JSONArray items = findItems(e);
            if (items != null) {
                int before = items.length();
                removed += filterEntries(items, r, s, thread);
                if (before > 0 && items.length() == 0) entries.remove(i);
                continue;
            }
            removed += walk(e, r, s, thread);
        }
        return removed;
    }

    /** The object holding "tweetResult" (or web's "tweet_results"). Post items have no arrays on the way. */
    private static JSONObject findTweetHolder(JSONObject o) {
        if (o.has("tweetResult") || o.has("tweet_results")) return o;
        for (Iterator<String> it = o.keys(); it.hasNext(); ) {
            JSONObject child = o.optJSONObject(it.next());
            if (child == null) continue;
            JSONObject found = findTweetHolder(child);
            if (found != null) return found;
        }
        return null;
    }

    /** A module's "items" array of entries. */
    private static JSONArray findItems(JSONObject o) {
        JSONArray items = o.optJSONArray("items");
        if (items != null && items.length() > 0 && items.optJSONObject(0) != null
                && items.optJSONObject(0).has("entryId")) return items;
        for (Iterator<String> it = o.keys(); it.hasNext(); ) {
            JSONObject child = o.optJSONObject(it.next());
            if (child == null) continue;
            JSONArray found = findItems(child);
            if (found != null) return found;
        }
        return null;
    }

    // JSON helpers that treat JSON null as absent (org.json's optString returns "null").
    static JSONObject obj(JSONObject o, String... path) {
        for (String k : path) {
            if (o == null) return null;
            o = o.optJSONObject(k);
        }
        return o;
    }

    static String str(JSONObject o, String k) {
        Object v = o == null ? null : o.opt(k);
        return v instanceof String ? (String) v : null;
    }

    static boolean bool(JSONObject o, String k) {
        return o != null && o.optBoolean(k, false);
    }

    /** TweetWithVisibilityResults wraps the tweet in "tweet". */
    static JSONObject unwrapTweet(JSONObject result) {
        if (result != null && result.optJSONObject("legacy") == null && result.optJSONObject("tweet") != null) {
            return result.optJSONObject("tweet");
        }
        return result;
    }

    static JSONObject author(JSONObject tweet) {
        JSONObject core = obj(tweet, "core");
        JSONObject results = obj(core, "user_results");
        if (results == null) results = obj(core, "user_result");
        return obj(results, "result");
    }

    /** The text as shown in the app: note-tweet text, or full_text cut to display_text_range. */
    static String displayText(JSONObject tweet) {
        String note = str(obj(tweet, "note_tweet", "note_tweet_results", "result"), "text");
        if (note != null) return note.trim();
        JSONObject legacy = obj(tweet, "legacy");
        String full = str(legacy, "full_text");
        if (full == null) return "";
        full = full.replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&");
        JSONArray range = legacy.optJSONArray("display_text_range");
        if (range != null && range.length() == 2) {
            int cps = full.codePointCount(0, full.length());
            int start = Math.max(0, Math.min(range.optInt(0), cps));
            int end = Math.max(start, Math.min(range.optInt(1), cps));
            full = full.substring(full.offsetByCodePoints(0, start), full.offsetByCodePoints(0, end));
        }
        return full.trim();
    }

    static final class Rules {
        private static final Set<String> ALWAYS_PASS_LANGS = new HashSet<>(Arrays.asList("und", "zxx", "qme", "qam"));

        final boolean promoted, whoToFollow, creators, communities, news, premiumPrompts, discoverMore;
        final boolean reposts, quotes, replies, notFollowed, blueNotFollowed, photos, videos, textOnly, links,
                polls, sensitive, communityPosts;
        final boolean home, search, repliesScope, lists;
        final int maxHashtags, minLength, maxLength;
        final List<String> contains, startsWith, endsWith;
        final List<Pattern> regex = new ArrayList<>();
        final Set<String> mutedUsers = new HashSet<>(), languages = new HashSet<>();
        final boolean any;

        private final Map<String, ?> prefs;

        static Rules from(Map<String, ?> prefs) {
            return new Rules(prefs);
        }

        private Rules(Map<String, ?> prefs) {
            this.prefs = prefs;
            promoted = flag(PROMOTED);
            whoToFollow = flag(WHO_TO_FOLLOW);
            creators = flag(CREATORS);
            communities = flag(COMMUNITIES);
            news = flag(NEWS);
            premiumPrompts = flag(PREMIUM_PROMPTS);
            discoverMore = flag(DISCOVER_MORE);
            reposts = flag(REPOSTS);
            quotes = flag(QUOTES);
            replies = flag(REPLIES);
            notFollowed = flag(NOT_FOLLOWED);
            blueNotFollowed = flag(BLUE_NOT_FOLLOWED);
            photos = flag(PHOTOS);
            videos = flag(VIDEOS);
            textOnly = flag(TEXT_ONLY);
            links = flag(LINKS);
            polls = flag(POLLS);
            sensitive = flag(SENSITIVE);
            communityPosts = flag(COMMUNITY_POSTS);
            home = flag(SCOPE_HOME);
            search = flag(SCOPE_SEARCH);
            repliesScope = flag(SCOPE_REPLIES);
            lists = flag(SCOPE_LISTS);
            maxHashtags = number(MAX_HASHTAGS);
            minLength = number(MIN_LENGTH);
            maxLength = number(MAX_LENGTH);
            contains = lines(CONTAINS);
            startsWith = lines(STARTS_WITH);
            endsWith = lines(ENDS_WITH);
            for (String line : rawLines(REGEX)) {
                try {
                    regex.add(Pattern.compile(line, Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE));
                } catch (Exception ignored) {
                    // Invalid patterns are skipped.
                }
            }
            for (String u : lines(MUTED_USERS)) mutedUsers.add(u.startsWith("@") ? u.substring(1) : u);
            for (String l : string(LANGUAGES).split("[,\\s]+")) {
                if (!l.trim().isEmpty()) languages.add(l.trim().toLowerCase(Locale.ROOT));
            }
            boolean postRules = reposts || quotes || replies || notFollowed || blueNotFollowed || photos || videos
                    || textOnly || links || polls || sensitive || communityPosts || maxHashtags > 0 || minLength > 0
                    || maxLength > 0 || !contains.isEmpty() || !startsWith.isEmpty() || !endsWith.isEmpty()
                    || !regex.isEmpty() || !mutedUsers.isEmpty() || !languages.isEmpty();
            any = promoted || whoToFollow || creators || communities || news || premiumPrompts || discoverMore
                    || (postRules && (home || search || repliesScope || lists));
        }

        private boolean flag(String key) {
            Object v = prefs.get(key);
            return v instanceof Boolean ? (Boolean) v : DEFAULT_ON.contains(key);
        }

        private String string(String key) {
            Object v = prefs.get(key);
            return v instanceof String ? (String) v : "";
        }

        private int number(String key) {
            try {
                return Math.max(0, Integer.parseInt(string(key).trim()));
            } catch (NumberFormatException e) {
                return 0;
            }
        }

        private List<String> rawLines(String key) {
            List<String> out = new ArrayList<>();
            for (String line : string(key).split("\n")) {
                if (!line.trim().isEmpty()) out.add(line.trim());
            }
            return out;
        }

        private List<String> lines(String key) {
            List<String> out = new ArrayList<>();
            for (String line : rawLines(key)) out.add(line.toLowerCase(Locale.ROOT));
            return out;
        }

        /** Feed items identified by entry id, removed in every timeline. */
        boolean hidesEntry(String id) {
            return (promoted && (id.contains("promoted") || id.contains("rtb")))
                    || (whoToFollow && id.startsWith("who-to-follow"))
                    || (creators && id.startsWith("who-to-subscribe"))
                    || (communities && id.startsWith("community-to-join"))
                    || (news && id.startsWith("stories"))
                    || (premiumPrompts && id.startsWith("messageprompt-"))
                    || (discoverMore && id.startsWith("tweetdetailrelatedtweets"));
        }

        private boolean inScope(Scope s, boolean inThread) {
            switch (s) {
                case HOME: return home;
                case SEARCH: return search;
                case LISTS: return lists;
                // Only replies are filtered, never the opened post or its parents.
                case REPLIES: return repliesScope && inThread;
                default: return false;
            }
        }

        /** @param holder the timeline tweet object holding "tweetResult". */
        boolean hidesPost(JSONObject holder, Scope s, boolean inThread) {
            if (promoted && (holder.optJSONObject("promotedMetadata") != null
                    || holder.optJSONObject("tweetPromotedMetadata") != null)) return true;
            if (!inScope(s, inThread)) return false;
            JSONObject results = holder.optJSONObject("tweetResult");
            if (results == null) results = holder.optJSONObject("tweet_results");
            JSONObject tweet = unwrapTweet(obj(results, "result"));
            return tweet != null && hidesTweet(tweet, s);
        }

        boolean hidesTweet(JSONObject tweet, Scope s) {
            JSONObject legacy = obj(tweet, "legacy");
            if (legacy == null) return false;
            JSONObject user = author(tweet);

            JSONObject reposted = unwrapTweet(obj(legacy, "retweeted_status_result", "result"));
            if (reposted != null && obj(reposted, "legacy") != null) {
                if (reposts || isMuted(user)) return true;
                tweet = reposted;
                legacy = obj(tweet, "legacy");
                user = author(tweet);
            }
            if (isMuted(user)) return true;

            if (quotes && bool(legacy, "is_quote_status")) return true;
            if (replies && s != Scope.REPLIES && str(legacy, "in_reply_to_status_id_str") != null) return true;

            JSONObject userLegacy = obj(user, "legacy");
            boolean following = bool(userLegacy, "following");
            if (notFollowed && !following) return true;
            if (blueNotFollowed && !following && isPaidBlue(user)) return true;

            JSONArray media = obj(legacy, "extended_entities") == null ? null
                    : obj(legacy, "extended_entities").optJSONArray("media");
            boolean photo = false, video = false, flagged = bool(legacy, "possibly_sensitive");
            int mediaCount = media == null ? 0 : media.length();
            for (int i = 0; i < mediaCount; i++) {
                JSONObject m = media.optJSONObject(i);
                String type = str(m, "type");
                photo |= "photo".equals(type);
                video |= "video".equals(type) || "animated_gif".equals(type);
                flagged |= bool(m, "possibly_sensitive") || obj(m, "sensitive_media_warning") != null;
            }
            if (photos && photo) return true;
            if (videos && video) return true;
            if (textOnly && mediaCount == 0) return true;
            if (sensitive && flagged) return true;

            String card = cardName(tweet);
            boolean poll = card != null && card.startsWith("poll");
            if (polls && poll) return true;
            JSONObject entities = obj(legacy, "entities");
            JSONArray urls = entities == null ? null : entities.optJSONArray("urls");
            if (links && ((urls != null && urls.length() > 0) || (card != null && !poll))) return true;

            if (communityPosts && (str(legacy, "community_id_str") != null || str(tweet, "community_id_str") != null
                    || obj(tweet, "author_community_relationship") != null)) return true;

            JSONArray hashtags = entities == null ? null : entities.optJSONArray("hashtags");
            if (maxHashtags > 0 && hashtags != null && hashtags.length() > maxHashtags) return true;

            String lang = str(legacy, "lang");
            if (!languages.isEmpty() && lang != null && !ALWAYS_PASS_LANGS.contains(lang)
                    && !languages.contains(lang.toLowerCase(Locale.ROOT))) return true;

            return hidesText(tweet);
        }

        private boolean hidesText(JSONObject tweet) {
            String text = displayText(tweet);
            String lower = text.toLowerCase(Locale.ROOT);
            int length = text.codePointCount(0, text.length());
            if (minLength > 0 && length < minLength) return true;
            if (maxLength > 0 && length > maxLength) return true;
            for (String s : startsWith) if (lower.startsWith(s)) return true;
            for (String s : endsWith) if (lower.endsWith(s)) return true;

            JSONObject quoted = unwrapTweet(obj(tweet, "quoted_status_result", "result"));
            String quotedText = quoted == null ? "" : displayText(quoted);
            String quotedLower = quotedText.toLowerCase(Locale.ROOT);
            for (String s : contains) if (lower.contains(s) || quotedLower.contains(s)) return true;
            for (Pattern p : regex) if (p.matcher(text).find() || p.matcher(quotedText).find()) return true;
            return false;
        }

        private boolean isMuted(JSONObject user) {
            if (mutedUsers.isEmpty() || user == null) return false;
            String name = str(obj(user, "legacy"), "screen_name");
            if (name == null) name = str(obj(user, "core"), "screen_name");
            return name != null && mutedUsers.contains(name.toLowerCase(Locale.ROOT));
        }

        /** Paid Premium check: blue badge without a business/government verified type. */
        private static boolean isPaidBlue(JSONObject user) {
            JSONObject legacy = obj(user, "legacy");
            boolean blue = bool(user, "is_blue_verified") || bool(legacy, "is_blue_verified")
                    || bool(legacy, "ext_is_blue_verified");
            return blue && str(legacy, "verified_type") == null && str(user, "verified_type") == null;
        }

        private static String cardName(JSONObject tweet) {
            for (JSONObject card : new JSONObject[]{obj(tweet, "card"), obj(tweet, "legacy", "card")}) {
                String name = str(card, "name");
                if (name == null) name = str(obj(card, "legacy"), "name");
                if (name != null) return name;
            }
            return null;
        }
    }
}
