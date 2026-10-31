package app.bitchord.telegram;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;

/**
 * Copies music from community channels into a private channel you own, a few files at a time.
 *
 * <p>Files are copied, not forwarded, so they show as your own posts, and Telegram doesn't upload
 * them again: the copy points at the same file. Once copied, a file stays in your channel even if
 * the community channel deletes it. The files to copy come from the saved index, oldest post first;
 * the pace never goes above the hourly limit.
 */
final class MainChannel {
    interface Telegram {
        /** Copies messages without "Forwarded from". Throws RateLimited when told to wait. */
        void copy(long toChat, long fromChat, long[] messages) throws Exception;
    }

    interface Clock {
        long millis();
    }

    static final int MAX_PER_HOUR = 500, DEFAULT_PER_HOUR = 100, MAX_BATCH = 10;
    private static final int LOOK_AHEAD = 50, RETRIES = 3;
    private static final long RETRY_MILLIS = 10 * 60_000L;
    private int failures;

    private final File file;
    private final Telegram telegram;
    private final Clock clock;
    private JSONObject saved;
    private long nextAt;
    private Set<String> owned; // duplicate keys of what the main channel has
    volatile String status = "";

    MainChannel(File file, Telegram telegram, Clock clock) {
        this.file = file;
        this.telegram = telegram;
        this.clock = clock;
        try {
            saved =
                    file != null && file.isFile()
                            ? new JSONObject(
                                    new String(
                                            Files.readAllBytes(file.toPath()),
                                            StandardCharsets.UTF_8))
                            : new JSONObject();
        } catch (Exception e) {
            saved = new JSONObject();
        }
    }

    /** Reads the settings again from the file: after a restore. */
    synchronized void reload() {
        try {
            saved =
                    file != null && file.isFile()
                            ? new JSONObject(
                                    new String(
                                            Files.readAllBytes(file.toPath()),
                                            StandardCharsets.UTF_8))
                            : new JSONObject();
        } catch (Exception e) {
            saved = new JSONObject();
        }
        owned = null;
        nextAt = 0;
        status = "";
    }

    // ── Settings ────────────────────────────────────────────────────────────

    synchronized long main() {
        return saved.optLong("main");
    }

    synchronized String mainTitle() {
        return saved.optString("mainTitle");
    }

    synchronized void setMain(long chat, String title) throws Exception {
        if (chat != main()) {
            saved.put("main", chat).put("mainTitle", title).remove("chats");
            saved.put("copied", 0).put("songs", 0).put("lossy", 0).put("duplicates", 0);
            saved.put("failed", 0);
            owned = null;
        }
        save();
    }

    synchronized List<Long> community() {
        List<Long> chats = new ArrayList<>();
        JSONArray list = saved.optJSONArray("community");
        if (list != null) for (int i = 0; i < list.length(); i++) chats.add(list.optLong(i));
        return chats;
    }

    synchronized void setCommunity(Collection<Long> chats) throws Exception {
        List<Long> kept = new ArrayList<>();
        for (long chat : chats)
            if (chat != 0 && chat != main() && !kept.contains(chat)) kept.add(chat);
        saved.put("community", new JSONArray(kept));
        save();
    }

    synchronized boolean option(String name) {
        return saved.optBoolean(name);
    }

    /** "import", "sync", "losslessOnly" or "skipDuplicates". */
    synchronized void setOption(String name, boolean on) throws Exception {
        if (name.equals("import") && on && !option("import")) {
            // An import without sync copies what each channel has now; that's fixed when it starts.
            saved.remove("chats");
            nextAt = 0;
        }
        if (name.equals("skipDuplicates")) owned = null;
        saved.put(name, on);
        save();
    }

    synchronized int perHour() {
        return Math.max(1, Math.min(MAX_PER_HOUR, saved.optInt("perHour", DEFAULT_PER_HOUR)));
    }

    synchronized void setPerHour(int files) throws Exception {
        saved.put("perHour", Math.max(1, Math.min(MAX_PER_HOUR, files)));
        save();
    }

    /** The chats the saved index needs: the main channel and the community channels. */
    synchronized List<Long> indexed() {
        List<Long> chats = new ArrayList<>(community());
        if (main() != 0) chats.add(main());
        return chats;
    }

    // ── Copying ─────────────────────────────────────────────────────────────

    /** Files per copy request, and the gap between requests that keeps to the hourly limit. */
    int batch() {
        return Math.max(1, Math.min(MAX_BATCH, (int) Math.ceil(perHour() / 60.0)));
    }

    long gapMillis(int files) {
        return 3_600_000L * files / perHour();
    }

    /**
     * Copies the next batch when one is due. Returns how long to wait before calling again. Throws
     * RateLimited when Telegram asks for a pause; the next batch waits for it.
     */
    synchronized long step(TelegramIndex index) throws Exception {
        long now = clock.millis();
        long main = main();
        List<Long> sources = community();
        if (!option("import") || main == 0 || sources.isEmpty()) {
            status = "";
            return 60_000;
        }
        if (!index.enabled) {
            status = Strings.t("Waiting for Saved index to be turned on");
            return 60_000;
        }
        if (now < nextAt) return nextAt - now;
        boolean dedupe = option("skipDuplicates");
        if (dedupe && owned == null) {
            if (!index.built(main)) {
                String p = index.progress(main);
                status =
                        p.isEmpty()
                                ? Strings.t(
                                        "Waiting for the main channel to be indexed, so duplicates"
                                                + " can be skipped")
                                : Strings.f(
                                        "Waiting for the main channel to be indexed ({0}), so"
                                                + " duplicates can be skipped",
                                        p);
                return 30_000;
            }
            owned = new HashSet<>();
            List<JSONObject> rows;
            long after = 0;
            while (!(rows = index.after(main, after, 1000)).isEmpty())
                for (JSONObject row : rows) {
                    owned.addAll(keys(row));
                    after = row.optLong("message");
                }
        }
        int batch = batch();
        boolean newestFirst = option("newestFirst");
        List<String> waiting = new ArrayList<>();
        for (long chat : sources)
            if (!index.built(chat) && !newest(chatState(chat), newestFirst))
                waiting.add(index.progress(chat));
        String later = waiting.isEmpty() ? "" : " · " + waiting(waiting, sources.size());
        boolean more = false;
        for (long chat : sources) {
            JSONObject state = chatState(chat);
            boolean newest = newest(state, newestFirst);
            if (!newest && !index.built(chat)) continue;
            // Whole posts at a time: the songs of a zip share its message and are judged together.
            // The window holds the largest zip, so only a post cut off at its end waits for the
            // next.
            int limit = LOOK_AHEAD + ZipAlbums.MAX_SONGS;
            List<List<JSONObject>> posts;
            boolean cutShort, upward = true;
            if (!newest) {
                if (!state.has("cutoff")) state.put("cutoff", newest(index, chat));
                long cutoff = option("sync") ? Long.MAX_VALUE : state.optLong("cutoff");
                List<JSONObject> rows = index.after(chat, state.optLong("after"), limit);
                posts = posts(rows, cutoff);
                cutShort = rows.size() == limit;
            } else {
                // Newest first: from the newest post at the start downwards, as far as the index
                // has got, then, with sync on, anything posted since, oldest of those first.
                if (!state.has("top")) {
                    long top = index.newestMessage(chat);
                    if (top == 0) continue;
                    state.put("top", top).put("below", top + 1);
                }
                List<JSONObject> rows =
                        option("sync")
                                ? index.afterAny(chat, state.getLong("top"), limit)
                                : Collections.emptyList();
                if (rows.isEmpty()) {
                    upward = false;
                    rows = index.before(chat, state.getLong("below"), limit);
                }
                posts = posts(rows, Long.MAX_VALUE);
                cutShort = rows.size() == limit;
            }
            if (cutShort && posts.size() > 1) posts.remove(posts.size() - 1);
            List<Long> picked = new ArrayList<>();
            Set<String> picking = new HashSet<>(); // what the picked posts add to the main channel
            int songs = 0; // audio files in the picked posts: one, or a zip's songs
            long reached = 0; // the last post looked at, picked or skipped
            for (List<JSONObject> post : posts) {
                if (picked.size() >= batch) {
                    more = true;
                    break;
                }
                reached = post.get(0).optLong("message");
                // Copied when any of its songs is wanted; a zip goes over whole, duplicates and
                // all.
                int lossy = 0, duplicates = 0;
                boolean wanted = false;
                for (JSONObject row : post)
                    if (option("losslessOnly") && !lossless(row)) lossy++;
                    else if (dedupe
                            && (!Collections.disjoint(keys(row), owned)
                                    || !Collections.disjoint(keys(row), picking))) duplicates++;
                    else wanted = true;
                if (!wanted) {
                    count(duplicates > 0 ? "duplicates" : "lossy");
                    continue;
                }
                picked.add(reached);
                songs += post.size();
                if (dedupe) for (JSONObject row : post) picking.addAll(keys(row));
            }
            if (cutShort && !posts.isEmpty()) more = true;
            if (!picked.isEmpty()) {
                long[] ids = new long[picked.size()];
                for (int i = 0; i < ids.length; i++) ids[i] = picked.get(i);
                try {
                    telegram.copy(main, chat, ids);
                } catch (LiveSearch.RateLimited e) {
                    nextAt = now + 1000L * e.retrySeconds + 5000;
                    status =
                            Strings.f(
                                    "Telegram asked for a pause; carrying on in {0} s",
                                    e.retrySeconds);
                    save();
                    throw e;
                } catch (Exception e) {
                    HostLog.d(
                            "Unofficial Telegram couldn't copy "
                                    + ids.length
                                    + " posts from chat "
                                    + chat
                                    + " to "
                                    + main
                                    + ": "
                                    + e.getMessage());
                    // Tried again a few times first: when it's the main channel that's refusing
                    // (no right to post, say), skipping would quietly pass over everything.
                    if (++failures < RETRIES) {
                        nextAt = now + RETRY_MILLIS;
                        status =
                                Strings.f(
                                        "Couldn't copy: {0}. Trying again in {1} min.",
                                        e.getMessage(), RETRY_MILLIS / 60_000);
                        save();
                        return RETRY_MILLIS;
                    }
                    count("failed", ids.length);
                    ids = new long[0];
                    songs = 0;
                }
                failures = 0;
                if (dedupe && ids.length > 0) owned.addAll(picking);
                count("copied", ids.length);
                count("songs", songs);
                advance(state, newest, upward, reached);
                nextAt = now + gapMillis(picked.size());
                status = progress(index) + later;
                save();
                return nextAt - now;
            }
            if (reached != 0) advance(state, newest, upward, reached);
        }
        save();
        status = !waiting.isEmpty() || more ? progress(index) + later : done();
        return more ? 1000 : option("sync") ? 600_000 : 60_000;
    }

    /** Whether a chat is copied newest first: decided when copying from it starts. */
    private boolean newest(JSONObject state, boolean newestFirst) throws Exception {
        if (!state.has("order")) {
            if (state.has("after") || state.has("cutoff")) state.put("order", "oldest");
            else return newestFirst;
        }
        return state.optString("order").equals("newest");
    }

    /** Moves a chat's place on past the posts just looked at. */
    private void advance(JSONObject state, boolean newest, boolean upward, long reached)
            throws Exception {
        if (!newest) state.put("order", "oldest").put("after", reached);
        else if (upward) state.put("order", "newest").put("top", reached);
        else state.put("order", "newest").put("below", reached);
    }

    /** Rows grouped into posts, in the order given, up to a message. */
    private static List<List<JSONObject>> posts(List<JSONObject> rows, long cutoff) {
        List<List<JSONObject>> posts = new ArrayList<>();
        for (JSONObject row : rows) {
            long message = row.optLong("message");
            if (message > cutoff) break;
            if (posts.isEmpty() || posts.get(posts.size() - 1).get(0).optLong("message") != message)
                posts.add(new ArrayList<>());
            posts.get(posts.size() - 1).add(row);
        }
        return posts;
    }

    /**
     * "Waiting for a community channel to be indexed (34%). Copying from it starts once it's done,
     * oldest post first."
     */
    private static String waiting(List<String> percents, int of) {
        StringBuilder known = new StringBuilder();
        for (String p : percents)
            if (!p.isEmpty()) known.append(known.length() == 0 ? "" : ", ").append(p);
        String text =
                percents.size() > 1
                        ? Strings.f(
                                "Waiting for {0} community channels to be indexed", percents.size())
                        : Strings.t(
                                of == 1
                                        ? "Waiting for the community channel to be indexed"
                                        : "Waiting for a community channel to be indexed");
        if (known.length() > 0) text += " (" + known + ")";
        return text
                + ". "
                + Strings.t(
                        percents.size() == 1
                                ? "Copying from it starts once it's done, oldest post first."
                                : "Copying from each starts once it's done, oldest post first.");
    }

    private String done() {
        return option("sync")
                ? Strings.f(
                        "Up to date: {0} copied. New posts are copied as they're indexed.",
                        copied())
                : Strings.f("Done: {0} copied.", copied());
    }

    /** "2,140 audio files in 1,310 posts", or "31 audio files" when each post is one. */
    private String copied() {
        int posts = saved.optInt("copied"), songs = Math.max(posts, saved.optInt("songs"));
        String files =
                Strings.f(songs == 1 ? "{0} audio file" : "{0} audio files", Strings.number(songs));
        return songs == posts
                ? files
                : files
                        + " "
                        + Strings.f(
                                posts == 1 ? "in {0} post" : "in {0} posts", Strings.number(posts));
    }

    /**
     * "Copied 2,140 audio files in 1,310 posts · 56 lossy and 12 duplicates skipped · about 4,500
     * to go, up to 9 h".
     */
    String progress(TelegramIndex index) {
        long left = 0;
        try {
            for (long chat : community()) {
                JSONObject state = chatState(chat);
                if (state.optString("order").equals("newest")) {
                    left += index.countBefore(chat, state.optLong("below"));
                    if (option("sync")) left += index.countAfter(chat, state.optLong("top"));
                } else if (index.built(chat))
                    left += index.countAfter(chat, state.optLong("after"));
            }
        } catch (Exception ignored) {
            // Shown without what's left.
        }
        StringBuilder text = new StringBuilder(Strings.f("Copied {0}", copied()));
        int lossy = saved.optInt("lossy"), dupes = saved.optInt("duplicates");
        String lossyText = Strings.f("{0} lossy", Strings.number(lossy));
        String dupesText =
                Strings.f(dupes == 1 ? "{0} duplicate" : "{0} duplicates", Strings.number(dupes));
        if (lossy > 0 && dupes > 0)
            text.append(" · ").append(Strings.f("{0} and {1} skipped", lossyText, dupesText));
        else if (lossy > 0 || dupes > 0)
            text.append(" · ").append(Strings.f("{0} skipped", lossy > 0 ? lossyText : dupesText));
        int failed = saved.optInt("failed");
        if (failed > 0)
            text.append(" · ")
                    .append(
                            Strings.f(
                                    "{0} couldn't be copied (BitChord's log says why)",
                                    Strings.number(failed)));
        if (left > 0)
            text.append(" · ")
                    .append(
                            Strings.f(
                                    "about {0} to go, up to {1}",
                                    Strings.number(left),
                                    TelegramIndex.timeLeft(left * 60.0 / perHour())));
        return text.toString();
    }

    private long newest(TelegramIndex index, long chat) throws Exception {
        long newest = 0;
        List<JSONObject> rows = index.newest(chat, 1);
        if (rows != null && !rows.isEmpty()) newest = rows.get(0).optLong("message");
        return newest;
    }

    private JSONObject chatState(long chat) throws Exception {
        JSONObject chats = saved.optJSONObject("chats");
        if (chats == null) saved.put("chats", chats = new JSONObject());
        JSONObject state = chats.optJSONObject(Long.toString(chat));
        if (state == null) chats.put(Long.toString(chat), state = new JSONObject());
        return state;
    }

    private void count(String name) throws Exception {
        count(name, 1);
    }

    private void count(String name, int n) throws Exception {
        saved.put(name, saved.optInt(name) + n);
    }

    static boolean lossless(JSONObject row) {
        return InternalAddon.quality(row).contains("LOSSLESS");
    }

    /**
     * What makes two posts the same song: the same Telegram file, or the same title, artist, length
     * and format.
     */
    static Set<String> keys(JSONObject row) {
        Set<String> keys = new HashSet<>();
        String unique = row.optString("unique");
        if (!unique.isEmpty()) keys.add("u:" + unique);
        if (row.optInt("file") != 0)
            keys.add(
                    "f:"
                            + row.optInt("file")
                            + (row.optInt("entry") > 0 ? "/" + row.optInt("entry") : ""));
        List<String> title = TrackNames.words(row.optString("title"));
        if (!title.isEmpty() && row.optInt("duration") > 0)
            keys.add(
                    "m:"
                            + String.join(" ", title)
                            + "|"
                            + String.join(" ", TrackNames.words(row.optString("artist")))
                            + "|"
                            + row.optInt("duration")
                            + "|"
                            + row.optString("format").toLowerCase(Locale.ROOT));
        return keys;
    }

    /** Forgets everything: on sign-out. */
    synchronized void clear() {
        saved = new JSONObject();
        owned = null;
        status = "";
        if (file != null) file.delete();
    }

    private void save() throws Exception {
        if (file == null) return;
        File tmp = new File(file.getPath() + ".tmp");
        Files.write(tmp.toPath(), saved.toString().getBytes(StandardCharsets.UTF_8));
        if (!tmp.renameTo(file)) tmp.delete();
    }
}
