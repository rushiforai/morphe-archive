package app.tikkamasalla.stremio.oneahead;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.CRC32;

/**
 * On-disk stores. Feature cache: detector int8 files (FeatureCache format), 300 MB total,
 * oldest out first, pinned entries survive eviction. Results: one file per video id, bound
 * to the measured file identity and detector version. Attempts: one line per episode per
 * day (the one-attempt rule). Corrupt or old-version files are rejected cleanly (deleted
 * for cache/attempts, ignored for results) — a bad file is a miss, never a crash.
 * No URL or token is ever written: keys are episode id + file identity only.
 */
public final class OneAheadStores {
    public static final long FEATURE_CAP = 300_000_000L;
    private OneAheadStores() {}

    static String key(String episodeId, long size, long hash) {
        String s = (episodeId == null ? "ep" : episodeId) + "_" + size + "_" + Long.toHexString(hash);
        return s.replaceAll("[^A-Za-z0-9._-]", "_");
    }
    static String hashUrl(String url) { // for planner FileRef.urlHash; the URL itself is discarded
        long h = 1125899906842597L;
        if (url != null) for (int i = 0; i < url.length(); i++) h = 31 * h + url.charAt(i);
        return Long.toHexString(h);
    }
    public static long urlHash(String url) {
        long h = 1125899906842597L;
        if (url != null) for (int i = 0; i < url.length(); i++) h = 31 * h + url.charAt(i);
        return h;
    }

    // ---- feature cache ----------------------------------------------------
    public static final class FeatureStore {
        private final File dir;
        private final Set<String> pinned = new HashSet<>();
        public FeatureStore(File dir) { this.dir = dir; dir.mkdirs(); }
        public synchronized void pin(String k) { pinned.add(k); }
        public synchronized void unpin(String k) { pinned.remove(k); }
        public synchronized boolean has(String k) { return new File(dir, k + ".oafc").isFile(); }

        public synchronized EpisodeFeatures load(String k) {
            File f = new File(dir, k + ".oafc");
            if (!f.isFile()) return null;
            try (InputStream in = new FileInputStream(f)) {
                EpisodeFeatures e = FeatureCache.read(in);
                f.setLastModified(System.currentTimeMillis()); // LRU touch
                return e;
            } catch (IOException | RuntimeException bad) {
                f.delete(); // corrupt or old version: a miss, re-derived later
                return null;
            }
        }

        public synchronized void save(String k, EpisodeFeatures e) throws IOException {
            dir.mkdirs();
            File tmp = new File(dir, k + ".tmp"), dst = new File(dir, k + ".oafc");
            try (OutputStream o = new FileOutputStream(tmp)) { FeatureCache.write(e, o); }
            move(tmp, dst);
            evict();
        }

        synchronized void evict() {
            File[] fs = dir.listFiles((d, n) -> n.endsWith(".oafc"));
            if (fs == null) return;
            long total = 0;
            for (File f : fs) total += f.length();
            Arrays.sort(fs, Comparator.comparingLong(File::lastModified));
            for (File f : fs) {
                if (total <= FEATURE_CAP) break;
                String k = f.getName().substring(0, f.getName().length() - 5); // strip the ".oafc" suffix only
                if (pinned.contains(k)) continue;
                long len = f.length();
                if (f.delete()) total -= len;
            }
        }
        /** The stored key for an episode (its file identity is parsed from the key), or null. */
        public synchronized String keyForEpisode(String episodeId) {
            File[] fs = dir.listFiles((d, n) -> n.endsWith(".oafc"));
            if (fs == null) return null;
            String prefix = key(episodeId, 0, 0);
            prefix = prefix.substring(0, prefix.length() - 3); // keeps the trailing separator
            for (File f : fs) {
                String k = f.getName().substring(0, f.getName().length() - 5);
                if (!k.startsWith(prefix)) continue;
                try (InputStream in = new FileInputStream(f)) {
                    if (FeatureCache.isCurrent(in)) return k;
                } catch (IOException bad) { /* unreadable: deleted below */ }
                f.delete(); // an old version is a miss: the episode is fetched again
            }
            return null;
        }

        public synchronized long totalBytes() {
            long t = 0; File[] fs = dir.listFiles((d, n) -> n.endsWith(".oafc"));
            if (fs != null) for (File f : fs) t += f.length();
            return t;
        }
    }

    // ---- results ----------------------------------------------------------
    public static final class ResultStore {
        private static final int MAGIC = 0x4F415253, VERSION = 2;
        private final File dir;
        public ResultStore(File dir) { this.dir = dir; dir.mkdirs(); }

        public synchronized void save(OneAheadResult r) throws IOException {
            dir.mkdirs();
            File tmp = new File(dir, key(r.videoId, 0, 0) + ".tmp");
            File dst = new File(dir, key(r.videoId, 0, 0) + ".oars");
            CRC32 crc = new CRC32();
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            DataOutputStream o = new DataOutputStream(bos);
            o.writeInt(MAGIC); o.writeShort(VERSION); o.writeInt(r.detectorVersion);
            o.writeLong(r.fileSize); o.writeLong(r.headHash);
            o.writeInt(r.segments.size());
            for (OneAheadResult.Segment s : r.segments) {
                o.writeUTF(s.type); o.writeDouble(s.start); o.writeDouble(s.end); o.writeBoolean(s.eofAgree); o.writeUTF(s.source);
            }
            o.flush();
            crc.update(bos.toByteArray());
            try (DataOutputStream f = new DataOutputStream(new FileOutputStream(tmp))) {
                f.write(bos.toByteArray()); f.writeInt((int) crc.getValue());
            }
            move(tmp, dst);
        }

        /** A result file exists for this video id; says nothing about which file it binds to. */
        public synchronized boolean has(String videoId) {
            return new File(dir, key(videoId, 0, 0) + ".oars").isFile();
        }

        /** The stored result, or null when absent, corrupt, old-version, or for another file. */
        public synchronized OneAheadResult load(String videoId, long size, long hash) {
            File f = new File(dir, key(videoId, 0, 0) + ".oars");
            if (!f.isFile()) return null;
            try {
                byte[] all = Files.readAllBytes(f.toPath());
                if (all.length < 8) return null;
                CRC32 crc = new CRC32(); crc.update(all, 0, all.length - 4);
                int stored = 0;
                for (int i = all.length - 4; i < all.length; i++) stored = (stored << 8) | (all[i] & 0xFF);
                if ((int) crc.getValue() != stored) return null;
                DataInputStream d = new DataInputStream(new ByteArrayInputStream(all));
                if (d.readInt() != MAGIC || d.readUnsignedShort() != VERSION) return null;
                int dv = d.readInt(); long fs = d.readLong(); long hh = d.readLong();
                OneAheadResult r = new OneAheadResult(videoId, fs, hh, dv);
                int n = d.readInt();
                if (n < 0 || n > 8) return null;
                for (int i = 0; i < n; i++)
                    r.segments.add(new OneAheadResult.Segment(d.readUTF(), d.readDouble(), d.readDouble(), d.readBoolean(), d.readUTF()));
                return r.appliesTo(size, hash) ? r : null;
            } catch (IOException | RuntimeException bad) { return null; }
        }
    }

    // ---- attempts (one per episode per day) --------------------------------
    public static final class AttemptLog {
        private final File file;
        public AttemptLog(File dir) { dir.mkdirs(); this.file = new File(dir, "attempts.txt"); }
        private synchronized List<String> lines() {
            List<String> s = new ArrayList<>(); // a list: identical byte lines must both count
            try {
                if (file.isFile()) for (String l : Files.readAllLines(file.toPath()))
                    if (!l.trim().isEmpty()) s.add(l.trim());
            } catch (IOException | RuntimeException bad) {
                file.delete(); // corrupt log: the next mark starts clean instead of failing every check
                s.clear();
            }
            return s;
        }
        public synchronized boolean attemptedToday(String episodeId, String day) {
            int n = 0;
            for (String l : lines()) {
                if (l.startsWith(day + " " + episodeId + " ")) n++;
                else if (l.startsWith(day + " -" + episodeId + " ")) n--;
            }
            return n > 0;
        }
        public synchronized int showEpisodesToday(String showId, String day) {
            int n = 0;
            for (String l : lines()) {
                if (!l.startsWith(day + " ") || !(l.contains(" show=" + showId + " ") || l.endsWith(" show=" + showId))) continue;
                n += l.startsWith(day + " -") ? -1 : 1;
            }
            return n;
        }
        public synchronized void mark(String episodeId, String showId, String day) {
            try (FileWriter w = new FileWriter(file, true)) {
                w.write(day + " " + episodeId + " show=" + showId + " \n");
            } catch (IOException ignored) { /* see lines() */ }
        }
        /** Takes a mark back: a job stopped by the setting or the heap did not use its attempt. */
        public synchronized void unmark(String episodeId, String showId, String day) {
            try (FileWriter w = new FileWriter(file, true)) {
                w.write(day + " -" + episodeId + " show=" + showId + " \n");
            } catch (IOException ignored) { /* see lines() */ }
        }

        /** Media bytes spent on a day, summed from the same append-only log. */
        public synchronized long bytesToday(String day) {
            long n = 0;
            for (String l : lines()) {
                if (!l.startsWith(day + " bytes=")) continue;
                try { n += Long.parseLong(l.substring(day.length() + 7).trim()); } catch (NumberFormatException ignored) {}
            }
            return n;
        }
        public synchronized void addBytes(String day, long bytes) {
            if (bytes <= 0) return;
            try (FileWriter w = new FileWriter(file, true)) { w.write(day + " bytes=" + bytes + "\n"); }
            catch (IOException ignored) { /* see lines() */ }
        }
    }

    /** File size recorded in a feature-cache key, or 0 when unparsable. */
    public static long keySize(String k) {
        try {
            int a = k.lastIndexOf('_'), b = k.lastIndexOf('_', a - 1);
            return Long.parseLong(k.substring(b + 1, a));
        } catch (RuntimeException bad) { return 0; }
    }

    /** Head hash recorded in a feature-cache key, or 0 when unparsable. */
    public static long keyHash(String k) {
        try {
            return Long.parseUnsignedLong(k.substring(k.lastIndexOf('_') + 1), 16);
        } catch (RuntimeException bad) { return 0; }
    }

    static void move(File tmp, File dst) throws IOException {
        try { Files.move(tmp.toPath(), dst.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING); }
        catch (AtomicMoveNotSupportedException e) {
            Files.move(tmp.toPath(), dst.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
    }
}
