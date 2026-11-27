package app.ayham.extension.music.automix;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Mix files (spec/automix/mix-file.md, the extension's readMixFile, writeMixFile, mixChanges and
 * importPlan): one or more pairs' overrides in one JSON file, so a mix made in one app plays in
 * another. Reading refuses a file that isn't one and skips a mix it can't use; each override is
 * normalized as the editor saves it, without this app's engine and savedAt.
 */
public final class MixFile {
    public static final String FORMAT = "vivi-mix";
    public static final int VERSION = 1, MAX = 300, MAX_BYTES = 2 * 1024 * 1024;
    private static final Pattern VIDEO_ID = Pattern.compile("^[A-Za-z0-9_-]{11}$");

    private MixFile() {
    }

    /** A song: the YouTube video id (the key), its title and artist only for the reader. */
    public static final class Song {
        public final String videoId, title, artist;

        public Song(String videoId, String title, String artist) {
            this.videoId = videoId;
            this.title = text(title);
            this.artist = text(artist);
        }
    }

    /** A mix as read: the pair's key ("A>B"), its songs and its override (normalized). */
    public static final class Mix {
        public final String key;
        public final Song from, to;
        public final MixOverride override;
        /** What replacing the saved one changes (importPlan), one line per field. */
        public List<String> changes;

        public Mix(Song from, Song to, MixOverride override) {
            this.key = from.videoId + ">" + to.videoId;
            this.from = from;
            this.to = to;
            this.override = override;
        }
    }

    /** A file read: refused (nothing imported), or its mixes and the ones skipped, numbered from 1. */
    public static final class Read {
        public String refused;
        public final List<Mix> mixes = new ArrayList<>();
        public final List<String> skipped = new ArrayList<>();
        /** A Spotify export's playlist, its songs in order (spotify-mixes.md rule 8); null for a mix file. */
        public List<String> queue;
        /** What a Spotify export lost on the way (spotify-mixes.md rule 9). */
        public final List<String> notes = new ArrayList<>();
        /** A Spotify export's playlist name. */
        public String name;
    }

    /** One mix as read, before rule 4's checks: its number, songs and override JSON, or why it is skipped. */
    static final class Item {
        final int n;
        final Song from, to;
        final Object override;
        final String why;

        Item(int n, Song from, Song to, Object override) {
            this.n = n;
            this.from = from;
            this.to = to;
            this.override = override;
            this.why = null;
        }

        private Item(int n, String why) {
            this.n = n;
            this.from = null;
            this.to = null;
            this.override = null;
            this.why = why;
        }

        static Item skip(int n, String why) {
            return new Item(n, why);
        }
    }

    private static String text(Object t) {
        if (!(t instanceof String)) return null;
        String s = ((String) t).trim();
        if (s.isEmpty()) return null;
        return s.length() > 200 ? s.substring(0, 200) : s;
    }

    @SuppressWarnings("unchecked")
    private static Song song(Object json) {
        if (!(json instanceof Map)) return null;
        Map<String, Object> m = (Map<String, Object>) json;
        Object id = m.get("videoId");
        if (!(id instanceof String) || !VIDEO_ID.matcher((String) id).matches()) return null;
        return new Song((String) id, text(m.get("title")), text(m.get("artist")));
    }

    /** The override as a mix file carries it: normalized, without engine and savedAt; null: Auto. */
    public static MixOverride carried(MixOverride o) {
        MixOverride n = MixOverride.normalize(o);
        if (n == null) return null;
        n.engine = 0;
        n.savedAt = 0;
        return n;
    }

    /** Rules 3 and 4. */
    @SuppressWarnings("unchecked")
    public static Read read(String text) {
        Read r = new Read();
        if (text == null) return refuse(r, "not a Vivimusic mix file");
        if (text.length() > MAX_BYTES) return refuse(r, "the file is over 2 MB: not a Vivimusic mix file");
        if (text.startsWith("﻿")) text = text.substring(1);
        Object j;
        try {
            j = Json.parse(text);
        } catch (Throwable t) {
            return refuse(r, "not a Vivimusic mix file: it is not JSON");
        }
        // a Spotify mix export, converted here (spotify-mixes.md)
        if (j instanceof Map && SpotifyMixes.FORMAT.equals(((Map<String, Object>) j).get("format"))) return SpotifyMixes.read((Map<String, Object>) j);
        if (!(j instanceof Map) || !FORMAT.equals(((Map<String, Object>) j).get("format"))) return refuse(r, "not a Vivimusic mix file");
        Map<String, Object> m = (Map<String, Object>) j;
        Object v = m.get("version");
        double ver = v instanceof Number ? ((Number) v).doubleValue() : Double.NaN;
        if (!(ver >= 1) || ver != Math.rint(ver)) return refuse(r, "the mix file has no valid version");
        if (ver > VERSION) {
            return refuse(r, "this mix file is version " + (long) ver + ", newer than this app reads (" + VERSION + "): update the app to import it");
        }
        Object list = m.get("mixes");
        if (!(list instanceof List) || ((List<?>) list).isEmpty()) return refuse(r, "the mix file has no mixes");
        List<Object> mixes = (List<Object>) list;
        if (mixes.size() > MAX) return refuse(r, "the mix file has " + mixes.size() + " mixes: " + MAX + " is the most");
        List<Item> items = new ArrayList<>();
        for (int i = 0; i < mixes.size(); i++) {
            Map<String, Object> x = mixes.get(i) instanceof Map ? (Map<String, Object>) mixes.get(i) : new HashMap<>();
            items.add(new Item(i + 1, song(x.get("from")), song(x.get("to")), x.get("override")));
        }
        collect(items, r);
        return r;
    }

    /** Rule 4 over the mixes read: each checked, normalized, or skipped with its reason (automix.js collectMixes). */
    @SuppressWarnings("unchecked")
    static void collect(List<Item> items, Read r) {
        Map<String, int[]> at = new HashMap<>(); // key -> {index in r.mixes, its number in the file}
        for (Item it : items) {
            int n = it.n;
            if (it.why != null) {
                r.skipped.add("mix " + n + " skipped: " + it.why);
                continue;
            }
            Song from = it.from, to = it.to;
            if (from == null || to == null) {
                r.skipped.add("mix " + n + " skipped: a song has no valid videoId");
                continue;
            }
            if (from.videoId.equals(to.videoId)) {
                r.skipped.add("mix " + n + " skipped: the same song on both sides");
                continue;
            }
            Object raw = it.override;
            MixOverride ov = raw instanceof Map ? carried(MixOverride.fromJson(raw)) : null;
            // a preset or a lane this app doesn't know is not dropped quietly
            Object rp = raw instanceof Map ? ((Map<String, Object>) raw).get("preset") : null;
            if (rp instanceof String && !rp.equals("auto") && (ov == null || !rp.equals(ov.preset))) {
                r.skipped.add("mix " + n + " skipped: " + (rp.equals("custom") ? "its lanes are not valid" : "the preset \"" + rp + "\" is unknown here"));
                continue;
            }
            if (ov == null) {
                r.skipped.add("mix " + n + " skipped: nothing but Auto in it");
                continue;
            }
            Mix mix = new Mix(from, to, ov);
            int[] was = at.get(mix.key);
            if (was != null) {
                r.skipped.add("mix " + was[1] + " skipped: the same pair again in mix " + n + ": the later one is used");
                r.mixes.set(was[0], mix);
                was[1] = n;
                continue;
            }
            at.put(mix.key, new int[]{r.mixes.size(), n});
            r.mixes.add(mix);
        }
    }

    private static Read refuse(Read r, String why) {
        r.refused = why;
        return r;
    }

    /** Rule 8: the file's object; an entry with no valid song or override is left out. */
    public static Map<String, Object> write(List<Mix> entries) {
        List<Object> mixes = new ArrayList<>();
        for (Mix e : entries) {
            if (e == null || e.from == null || e.to == null) continue;
            if (!VIDEO_ID.matcher(e.from.videoId).matches() || !VIDEO_ID.matcher(e.to.videoId).matches()) continue;
            MixOverride o = carried(e.override);
            if (o == null) continue;
            Map<String, Object> m = new LinkedHashMap<>();
            m.put("from", songJson(e.from));
            m.put("to", songJson(e.to));
            m.put("override", o.toJson());
            mixes.add(m);
        }
        Map<String, Object> f = new LinkedHashMap<>();
        f.put("format", FORMAT);
        f.put("version", VERSION);
        f.put("mixes", mixes);
        return f;
    }

    private static Map<String, Object> songJson(Song s) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("videoId", s.videoId);
        if (s.title != null) m.put("title", s.title);
        if (s.artist != null) m.put("artist", s.artist);
        return m;
    }

    /** The file as text, 2-space indented as the PC writes it, a point [x, v] on one line. */
    public static String text(Map<String, Object> file) {
        StringBuilder b = new StringBuilder();
        pretty(b, file, "");
        return b.append('\n').toString();
    }

    @SuppressWarnings("unchecked")
    private static void pretty(StringBuilder b, Object v, String ind) {
        if (v instanceof Map && !((Map<?, ?>) v).isEmpty()) {
            b.append("{\n");
            boolean first = true;
            for (Map.Entry<String, Object> e : ((Map<String, Object>) v).entrySet()) {
                if (!first) b.append(",\n");
                first = false;
                b.append(ind).append("  ").append(Json.write(e.getKey())).append(": ");
                pretty(b, e.getValue(), ind + "  ");
            }
            b.append('\n').append(ind).append('}');
        } else if (v instanceof List && !((List<?>) v).isEmpty() && !flat((List<Object>) v)) {
            b.append("[\n");
            boolean first = true;
            for (Object o : (List<Object>) v) {
                if (!first) b.append(",\n");
                first = false;
                b.append(ind).append("  ");
                pretty(b, o, ind + "  ");
            }
            b.append('\n').append(ind).append(']');
        } else {
            b.append(Json.write(v));
        }
    }

    private static boolean flat(List<Object> l) {
        for (Object o : l) if (!(o instanceof Number)) return false;
        return true;
    }

    /** Rule 8 (plain .json, the user 2026-11-26): "<from>-<to>.json" for one mix, "mixes-<date>.json" for more. */
    public static String fileName(Map<String, Object> file, String isoDate) {
        List<?> mixes = (List<?>) file.get("mixes");
        if (mixes.size() == 1) {
            Map<?, ?> m = (Map<?, ?>) mixes.get(0);
            return slug((Map<?, ?>) m.get("from")) + "-" + slug((Map<?, ?>) m.get("to")) + ".json";
        }
        return "mixes-" + isoDate + ".json";
    }

    private static String slug(Map<?, ?> song) {
        Object t = song.get("title") != null ? song.get("title") : song.get("videoId");
        String s = Normalizer.normalize(String.valueOf(t).toLowerCase(Locale.ROOT), Normalizer.Form.NFKD)
                .replaceAll("[\\u0300-\\u036f]", "").replaceAll("[^a-z0-9]+", "");
        if (s.length() > 24) s = s.substring(0, 24);
        return s.isEmpty() ? "song" : s;
    }

    /** Whether two overrides carry the same edit (engine, savedAt and gridBpm aside: rule 5). */
    public static boolean same(MixOverride a, MixOverride b) {
        MixOverride x = carried(a), y = carried(b);
        if (x == null || y == null) return x == y;
        x.gridBpm = 0;
        y.gridBpm = 0;
        return Json.write(x.toJson()).equals(Json.write(y.toJson()));
    }

    /** Rule 5: what replacing [was] with [now] changes, one line per field ("length: auto → 16 bars"). */
    public static List<String> changes(MixOverride was, MixOverride now) {
        MixOverride a = carried(was), b = carried(now);
        if (a == null) a = new MixOverride();
        if (b == null) b = new MixOverride();
        // (the lane rows: row i + 1 is lane i)
        String[][] rows = {
                {"preset", a.preset != null ? a.preset : "auto", b.preset != null ? b.preset : "auto"},
                {"volume", lane(a, 0), lane(b, 0)},
                {"eq", lane(a, 1), lane(b, 1)},
                {"effect", lane(a, 2), lane(b, 2)},
                {"effects", lane(a, MixOverride.FX), lane(b, MixOverride.FX)},
                {"looping", lane(a, MixOverride.LOOPING), lane(b, MixOverride.LOOPING)},
                {"length", a.bars > 0 ? a.bars + " bars" : "auto", b.bars > 0 ? b.bars + " bars" : "auto"},
                {"beat match", a.beatMatch != null ? a.beatMatch : "auto", b.beatMatch != null ? b.beatMatch : "auto"},
                {"speed", speedText(a), speedText(b)},
                {"mix-out", pos(a.out), pos(b.out)},
                {"mix-in", pos(a.in), pos(b.in)},
                {"lock", a.lock ? "on" : "off", b.lock ? "on" : "off"}};
        List<String> out = new ArrayList<>();
        for (int i = 0; i < rows.length; i++) {
            String[] r = rows[i];
            // (the Effects lane only when a side has one: most mixes have none)
            if (r[0].equals("effects") && !hasFx(a) && !hasFx(b)) continue;
            if (r[0].equals("looping") && !hasLooping(a) && !hasLooping(b)) continue;
            boolean drawn = r[1].equals("drawn");
            boolean same = r[1].equals(r[2]) && !(drawn && !Json.write(a.drawn[i - 1].toJson(MixOverride.LANES[i - 1]))
                    .equals(Json.write(b.drawn[i - 1].toJson(MixOverride.LANES[i - 1]))));
            if (!same) out.add(r[0] + ": " + r[1] + " → " + (drawn && r[2].equals("drawn") ? "another drawing" : r[2]));
        }
        return out;
    }

    private static boolean hasFx(MixOverride o) {
        return "custom".equals(o.preset) && o.fx != null;
    }

    private static boolean hasLooping(MixOverride o) {
        return "custom".equals(o.preset) && o.looping != null;
    }

    /** automix.js speedText: "A x0.97057 B x1", or "x1" with none saved. */
    static String speedText(MixOverride o) {
        if (!o.hasSpeed()) return "x1";
        return "A x" + jsNumber(Double.isNaN(o.speedOut) ? 1 : o.speedOut) + " B x" + jsNumber(Double.isNaN(o.speedIn) ? 1 : o.speedIn);
    }

    private static String lane(MixOverride o, int k) {
        if (!"custom".equals(o.preset)) return "loop".equals(o.preset) ? "loop" : o.preset != null ? o.preset + "'s" : "auto";
        String l = o.lanes()[k];
        return MixOverride.DRAW.equals(l) ? "drawn" : l;
    }

    private static String pos(MixOverride.Position p) {
        if (p == null) return "auto";
        // (B's late entry, mix-file.md rule 2: "0 s, 3.217 s into the mix")
        String late = p.delaySec > 0 ? ", " + jsNumber(p.delaySec) + " s into the mix" : "";
        if (p.secOnly) return jsNumber(p.sec) + " s" + (p.nudgeMs != 0 ? " " + (p.nudgeMs > 0 ? "+" : "") + p.nudgeMs + " ms" : "") + late;
        return "bar " + p.bar + (p.beat != 0 ? "." + (p.beat + 1) : "") + (p.nudgeMs != 0 ? " " + (p.nudgeMs > 0 ? "+" : "") + p.nudgeMs + " ms" : "") + late;
    }

    /** A number as JavaScript writes it (218.142, 0, -1.5). */
    static String jsNumber(double v) {
        if (v == Math.rint(v) && Math.abs(v) < 1e15) return Long.toString((long) v);
        return new java.math.BigDecimal(Double.toString(v)).stripTrailingZeros().toPlainString();
    }

    /** At most this many songs go in the temporary list Play these mixes falls back to (YouTube's watch_videos limit). */
    public static final int PLAY_MAX = 50;

    /**
     * "Play these mixes": the file's songs in its order, each mix's from then its to, a song that is
     * already next in line (the one just before) not added twice.
     */
    public static List<String> playOrder(List<Mix> mixes) {
        List<String> ids = new ArrayList<>();
        for (Mix m : mixes) {
            for (Song s : new Song[]{m.from, m.to}) {
                if (s == null || s.videoId == null) continue;
                if (!ids.isEmpty() && ids.get(ids.size() - 1).equals(s.videoId)) continue;
                ids.add(s.videoId);
            }
        }
        return ids;
    }

    /** The songs Play these mixes queues for a file read: a Spotify export's playlist, else playOrder. */
    public static List<String> playQueue(Read r) {
        return r.queue != null ? new ArrayList<>(r.queue) : playOrder(r.mixes);
    }

    /**
     * Play these mixes' fresh queue (rule 7), once the queue holds only the playing song [cur]: the
     * songs added behind it, [ids] without a first one that is the playing song (it plays on).
     */
    public static List<String> freshAdds(List<String> ids, String cur) {
        List<String> add = new ArrayList<>(ids);
        if (!add.isEmpty() && add.get(0).equals(cur)) add.remove(0);
        return add;
    }

    /** The queue indexes the fresh queue removes, last first: all of a [size] queue but the playing [current]. */
    public static List<Integer> clearOrder(int size, int current) {
        List<Integer> out = new ArrayList<>();
        for (int i = size - 1; i >= 0; i--) if (i != current) out.add(i);
        return out;
    }

    /** importPlan: the file's mixes against the saved overrides: new, replacing one (with its changes), or the same. */
    public static final class Plan {
        public final List<Mix> add = new ArrayList<>(), replace = new ArrayList<>(), same = new ArrayList<>();
    }

    public static Plan plan(List<Mix> mixes, Map<String, MixOverride> saved) {
        Plan p = new Plan();
        for (Mix m : mixes) {
            MixOverride was = saved.get(m.key);
            if (was == null || MixOverride.normalize(was) == null) p.add.add(m);
            else if (same(was, m.override)) p.same.add(m);
            else {
                m.changes = changes(was, m.override);
                p.replace.add(m);
            }
        }
        return p;
    }

    /**
     * Rule 7: the one line after an import. refusedLocks: "<key>: why" for each lock refused;
     * notes: "<title>: why" for each imported mix whose beats are taken as they are (rule 4).
     */
    public static String summary(Read r, Plan p, int saved, int declined, List<String> refusedLocks, List<String> notes) {
        List<String> parts = new ArrayList<>();
        parts.add("Imported " + saved + " mix" + (saved == 1 ? "" : "es"));
        if (!p.same.isEmpty()) parts.add(p.same.size() + " already saved as they are");
        if (declined > 0) parts.add(declined + " kept as saved");
        parts.addAll(refusedLocks);
        parts.addAll(r.skipped);
        parts.addAll(notes);
        parts.addAll(r.notes);
        return String.join(" · ", parts) + ".";
    }
}
