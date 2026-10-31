package app.bitchord.telegram;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.*;

/** Where the saved index keeps its files: SQLite on the phone, memory in tests. */
interface IndexStore {
    /** How far one chat's index has got. */
    final class State {
        final long chat;
        // Building: the oldest message reached so far for each kind (0 = from the newest).
        final long[] cursor = new long[TelegramIndex.KINDS];
        final boolean[] complete = new boolean[TelegramIndex.KINDS];
        // Telegram's own count of each kind (-1 until known), and how many of those this build has
        // gone through.
        final int[] total = new int[TelegramIndex.KINDS];
        final int[] scanned = new int[TelegramIndex.KINDS];
        long builtAt, refreshed;
        // Files written by the current build. A rebuild bumps it and then drops older files,
        // which are the ones deleted from the chat.
        long generation = 1;
        boolean rebuilding;
        // Which version of the index built it: 1 before cue sheets and albums.
        int version = 1;

        State(long chat) {
            this.chat = chat;
            Arrays.fill(total, -1);
        }

        boolean built() {
            for (boolean done : complete) if (!done) return false;
            return true;
        }

        JSONObject toJson() throws Exception {
            return new JSONObject()
                    .put("cursor", new JSONArray(cursor))
                    .put("complete", new JSONArray(complete))
                    .put("total", new JSONArray(total))
                    .put("scanned", new JSONArray(scanned))
                    .put("builtAt", builtAt)
                    .put("refreshed", refreshed)
                    .put("generation", generation)
                    .put("rebuilding", rebuilding)
                    .put("version", version);
        }

        static State fromJson(long chat, JSONObject saved) throws Exception {
            State s = new State(chat);
            JSONArray cursor = saved.getJSONArray("cursor"),
                    complete = saved.getJSONArray("complete"),
                    total = saved.optJSONArray("total"),
                    scanned = saved.optJSONArray("scanned");
            for (int k = 0; k < TelegramIndex.KINDS; k++) {
                s.cursor[k] = cursor.getLong(k);
                s.complete[k] = complete.getBoolean(k);
                if (total != null) s.total[k] = total.optInt(k, -1);
                if (s.total[k] == 0 && !s.complete[k] && saved.optJSONArray("scanned") == null)
                    s.total[k] = -1; // 1.0.8 wrote 0 for "not known".
                if (scanned != null) s.scanned[k] = scanned.optInt(k);
            }
            s.builtAt = saved.optLong("builtAt");
            s.refreshed = saved.optLong("refreshed");
            s.generation = saved.optLong("generation", 1);
            s.rebuilding = saved.optBoolean("rebuilding");
            s.version = saved.optInt("version", 1);
            return s;
        }
    }

    State state(long chat) throws Exception;

    void save(State state) throws Exception;

    /**
     * Adds or updates files, marking them as part of this generation. A song inside a zip is one
     * file of the zip's message, told apart by its "entry" (from 1; 0 for the message's own file).
     */
    void put(long chat, List<JSONObject> rows, long generation) throws Exception;

    boolean has(long chat, long message) throws Exception;

    int count(long chat) throws Exception;

    /** Files in these chats with every word as the start of one of theirs, newest first. */
    List<JSONObject> search(Collection<Long> chats, List<String> words, int limit) throws Exception;

    /** One chat's newest files, newest first. */
    List<JSONObject> newest(long chat, int limit) throws Exception;

    /** One chat's files posted after {@code message}, oldest first. */
    List<JSONObject> after(long chat, long message, int limit) throws Exception;

    /** How many of one chat's files were posted after {@code message}. */
    int countAfter(long chat, long message) throws Exception;

    /** One chat's files posted before {@code message}, newest first. */
    List<JSONObject> before(long chat, long message, int limit) throws Exception;

    /** How many of one chat's files were posted before {@code message}. */
    int countBefore(long chat, long message) throws Exception;

    /** One file, or null. */
    JSONObject row(long chat, long message, int entry) throws Exception;

    /**
     * Zip posts to look into. New ones wait their turn; ones already looked into have their songs
     * marked as part of this generation, so a rebuild keeps them.
     */
    void queueZips(long chat, List<JSONObject> zips, long generation) throws Exception;

    /** A zip waiting to be looked into in one of these chats, or null. */
    JSONObject nextZip(Collection<Long> chats) throws Exception;

    /** A zip has been looked into, or couldn't be. */
    void zipDone(long chat, long message) throws Exception;

    /**
     * A cue sheet whose album file isn't in the index yet: set aside until the chat has been gone
     * through, since the album may have been posted before it.
     */
    void deferZip(long chat, long message) throws Exception;

    /** The chat has been gone through: cue sheets set aside get their turn. */
    void wakeZips(long chat) throws Exception;

    int zipsWaiting(Collection<Long> chats) throws Exception;

    /** Drops a chat's files from before this generation. */
    void prune(long chat, long generation) throws Exception;

    /**
     * What listening to a file found: whether it's really lossless ({@link LosslessCheck}, by
     * {@link LosslessCheck#key}), or, for a file without tags, its title and artist recognised by
     * sound (by its id). Kept apart from the files, so a rebuild doesn't lose them. Null when
     * nothing is known.
     */
    JSONObject found(String kind, String key) throws Exception;

    /**
     * Remembers what listening to a file found, and adds it to the file's rows already saved.
     * {@code kind} is "check" or "names".
     */
    void putFound(long chat, long message, String kind, String key, JSONObject value)
            throws Exception;

    /**
     * The row with what's known about its file: a check result, and recognised names for a file
     * without tags. What a shared index brings is remembered, unless this phone already knows.
     */
    static JSONObject withFound(IndexStore store, JSONObject row, boolean remember)
            throws Exception {
        String checkKey = LosslessCheck.key(row), id = row.optString("id");
        JSONObject check = store.found("check", checkKey);
        if (check == null && remember && row.optJSONObject("check") != null) {
            check = row.getJSONObject("check");
            store.putFound(row.optLong("chat"), row.optLong("message"), "check", checkKey, check);
        }
        if (check != null) row.put("check", check);
        JSONObject names = id.isEmpty() ? null : store.found("names", id);
        if (names == null && remember && row.optJSONObject("recognized") != null) {
            names = row.getJSONObject("recognized");
            store.putFound(row.optLong("chat"), row.optLong("message"), "names", id, names);
        }
        if (names != null) named(row, names);
        return row;
    }

    /** A file without tags, with the title and artist it was recognised as. */
    static JSONObject named(JSONObject row, JSONObject names) throws Exception {
        if (names.optString("title").isEmpty()) return row;
        return row.put("title", names.optString("title"))
                .put("artist", names.optString("artist"))
                .put("tagged", true)
                .put("recognized", names);
    }

    /** Whether a found value belongs to this row. */
    static boolean belongs(JSONObject row, String kind, String key) {
        return kind.equals("check")
                ? LosslessCheck.key(row).equals(key)
                : row.optString("id").equals(key);
    }

    void clear() throws Exception;

    /**
     * The words of a text both split at apostrophes and joined across them ("you re" and "youre"),
     * since BitChord asks for "youre" when the file says "You're".
     */
    static List<String> looseWords(String text) {
        Set<String> words = new LinkedHashSet<>(TrackNames.words(text));
        words.addAll(TrackNames.words(text.replaceAll("['’ʼ`´]", "")));
        return new ArrayList<>(words);
    }

    /** What a file is searched by: its title, artist, file name and, inside a zip, its album. */
    static String text(JSONObject row) {
        return String.join(
                " ",
                looseWords(
                        row.optString("title")
                                + " "
                                + row.optString("artist")
                                + " "
                                + row.optString("fileName")
                                + " "
                                + row.optString("album")));
    }

    /** True when every wanted word starts one of the words in {@code text}. */
    static boolean matches(String text, List<String> wanted) {
        if (wanted.isEmpty()) return false;
        List<String> have = Arrays.asList(text.split(" "));
        for (String word : wanted) {
            boolean hit = false;
            for (String w : have)
                if (w.startsWith(word)) {
                    hit = true;
                    break;
                }
            if (!hit) return false;
        }
        return true;
    }

    /** Kept in memory: for tests, and small enough only for them. */
    final class Memory implements IndexStore {
        private static final class Entry {
            final String row, text;
            final long generation;

            Entry(String row, String text, long generation) {
                this.row = row;
                this.text = text;
                this.generation = generation;
            }
        }

        private final Map<Long, String> states = new HashMap<>();
        // Keyed by message * 65536 + entry, which keeps posting order.
        private final Map<Long, TreeMap<Long, Entry>> files = new HashMap<>();
        private final Map<Long, TreeMap<Long, String>> zips = new HashMap<>();
        private final Set<String> zipsDone = new HashSet<>(), zipsDeferred = new HashSet<>();
        private final Map<String, String> found = new HashMap<>();

        private static long key(long message, int entry) {
            return message * 65536 + entry;
        }

        @Override
        public synchronized State state(long chat) throws Exception {
            String saved = states.get(chat);
            return saved == null ? new State(chat) : State.fromJson(chat, new JSONObject(saved));
        }

        @Override
        public synchronized void save(State state) throws Exception {
            states.put(state.chat, state.toJson().toString());
        }

        @Override
        public synchronized void put(long chat, List<JSONObject> rows, long generation)
                throws Exception {
            TreeMap<Long, Entry> chatFiles = files.computeIfAbsent(chat, c -> new TreeMap<>());
            for (JSONObject row : rows) {
                withFound(this, row, true);
                chatFiles.put(
                        key(row.optLong("message"), row.optInt("entry")),
                        new Entry(row.toString(), text(row), generation));
            }
        }

        @Override
        public synchronized JSONObject found(String kind, String key) throws Exception {
            String value = found.get(kind + ":" + key);
            return value == null ? null : new JSONObject(value);
        }

        @Override
        public synchronized void putFound(
                long chat, long message, String kind, String key, JSONObject value)
                throws Exception {
            found.put(kind + ":" + key, value.toString());
            TreeMap<Long, Entry> chatFiles = files.get(chat);
            if (chatFiles == null) return;
            for (Map.Entry<Long, Entry> e :
                    chatFiles.subMap(key(message, 0), key(message + 1, 0)).entrySet()) {
                JSONObject row = new JSONObject(e.getValue().row);
                if (!belongs(row, kind, key)) continue;
                withFound(this, row, false);
                e.setValue(new Entry(row.toString(), text(row), e.getValue().generation));
            }
        }

        @Override
        public synchronized boolean has(long chat, long message) {
            return !files.getOrDefault(chat, new TreeMap<>())
                    .subMap(key(message, 0), key(message + 1, 0))
                    .isEmpty();
        }

        @Override
        public synchronized int count(long chat) {
            return files.getOrDefault(chat, new TreeMap<>()).size();
        }

        @Override
        public synchronized List<JSONObject> search(
                Collection<Long> chats, List<String> words, int limit) throws Exception {
            List<long[]> hits = new ArrayList<>();
            List<String> rows = new ArrayList<>();
            for (long chat : chats)
                for (Map.Entry<Long, Entry> e :
                        files.getOrDefault(chat, new TreeMap<>()).entrySet())
                    if (matches(e.getValue().text, words)) {
                        hits.add(new long[] {e.getKey(), rows.size()});
                        rows.add(e.getValue().row);
                    }
            hits.sort((a, b) -> Long.compare(b[0], a[0]));
            List<JSONObject> found = new ArrayList<>();
            for (long[] hit : hits.subList(0, Math.min(limit, hits.size())))
                found.add(new JSONObject(rows.get((int) hit[1])));
            return found;
        }

        @Override
        public synchronized List<JSONObject> newest(long chat, int limit) throws Exception {
            List<JSONObject> found = new ArrayList<>();
            for (Entry e : files.getOrDefault(chat, new TreeMap<>()).descendingMap().values()) {
                if (found.size() >= limit) break;
                found.add(new JSONObject(e.row));
            }
            return found;
        }

        @Override
        public synchronized List<JSONObject> after(long chat, long message, int limit)
                throws Exception {
            List<JSONObject> found = new ArrayList<>();
            for (Entry e :
                    files.getOrDefault(chat, new TreeMap<>())
                            .tailMap(key(message + 1, 0), true)
                            .values()) {
                if (found.size() >= limit) break;
                found.add(new JSONObject(e.row));
            }
            return found;
        }

        @Override
        public synchronized int countAfter(long chat, long message) {
            return files.getOrDefault(chat, new TreeMap<>())
                    .tailMap(key(message + 1, 0), true)
                    .size();
        }

        @Override
        public synchronized List<JSONObject> before(long chat, long message, int limit)
                throws Exception {
            List<JSONObject> found = new ArrayList<>();
            // Newest post first, and within a post (a zip), its songs in order.
            TreeMap<Long, List<Entry>> posts = new TreeMap<>(Comparator.reverseOrder());
            long end = message >= Long.MAX_VALUE / 65536 ? Long.MAX_VALUE : key(message, 0);
            for (Map.Entry<Long, Entry> e :
                    files.getOrDefault(chat, new TreeMap<>()).headMap(end, false).entrySet())
                posts.computeIfAbsent(e.getKey() / 65536, m -> new ArrayList<>()).add(e.getValue());
            for (List<Entry> post : posts.values())
                for (Entry e : post) {
                    if (found.size() >= limit) return found;
                    found.add(new JSONObject(e.row));
                }
            return found;
        }

        @Override
        public synchronized int countBefore(long chat, long message) {
            return files.getOrDefault(chat, new TreeMap<>()).headMap(key(message, 0), false).size();
        }

        @Override
        public synchronized JSONObject row(long chat, long message, int entry) throws Exception {
            Entry e = files.getOrDefault(chat, new TreeMap<>()).get(key(message, entry));
            return e == null ? null : new JSONObject(e.row);
        }

        @Override
        public synchronized void queueZips(long chat, List<JSONObject> list, long generation) {
            TreeMap<Long, String> chatZips = zips.computeIfAbsent(chat, c -> new TreeMap<>());
            for (JSONObject zip : list) {
                long message = zip.optLong("message");
                if (!chatZips.containsKey(message)) chatZips.put(message, zip.toString());
                else if (zip.optString("kind").equals("cue")) {
                    // A cue sheet's tracks are filed under its album's post: read it again.
                    zipsDone.remove(chat + "_" + message);
                    zipsDeferred.remove(chat + "_" + message);
                } else {
                    TreeMap<Long, Entry> chatFiles = files.get(chat);
                    if (chatFiles == null) continue;
                    for (Map.Entry<Long, Entry> e :
                            chatFiles.subMap(key(message, 1), key(message + 1, 0)).entrySet())
                        e.setValue(new Entry(e.getValue().row, e.getValue().text, generation));
                }
            }
        }

        @Override
        public synchronized JSONObject nextZip(Collection<Long> chats) throws Exception {
            for (long chat : chats)
                for (Map.Entry<Long, String> e :
                        zips.getOrDefault(chat, new TreeMap<>()).descendingMap().entrySet())
                    if (!zipsDone.contains(chat + "_" + e.getKey())
                            && !zipsDeferred.contains(chat + "_" + e.getKey()))
                        return new JSONObject(e.getValue());
            return null;
        }

        @Override
        public synchronized void zipDone(long chat, long message) {
            zipsDone.add(chat + "_" + message);
        }

        @Override
        public synchronized void deferZip(long chat, long message) {
            zipsDeferred.add(chat + "_" + message);
        }

        @Override
        public synchronized void wakeZips(long chat) {
            zipsDeferred.removeIf(key -> key.startsWith(chat + "_"));
        }

        @Override
        public synchronized int zipsWaiting(Collection<Long> chats) {
            int n = 0;
            for (long chat : chats)
                for (long message : zips.getOrDefault(chat, new TreeMap<>()).keySet())
                    if (!zipsDone.contains(chat + "_" + message)
                            && !zipsDeferred.contains(chat + "_" + message)) n++;
            return n;
        }

        @Override
        public synchronized void prune(long chat, long generation) {
            TreeMap<Long, Entry> chatFiles = files.get(chat);
            if (chatFiles != null) chatFiles.values().removeIf(e -> e.generation < generation);
        }

        @Override
        public synchronized void clear() {
            states.clear();
            files.clear();
            zips.clear();
            zipsDone.clear();
            zipsDeferred.clear();
            found.clear();
        }
    }
}
