package io.github.jordanwoodson.extension.shared.twitch;

import android.content.Context;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.LongSupplier;

import io.github.jordanwoodson.extension.shared.Logger;

/**
 * Lurk's own image cache for the third-party chat add-ons: 7TV, BetterTTV and FrankerFaceZ emotes and the
 * third-party badges that are loaded from the network.
 *
 * <p>Twitch loads every image through Glide, whose disk cache is 64 MB for the whole app and whose memory
 * cache is sized for a couple of screens of bitmaps. Twitch's own emotes are a few kilobytes each; an
 * animated 7TV emote is a GIF of 275 kB on average at 2x, and a large channel's set is far more than the
 * whole cache. So those images pushed each other out, and were downloaded again whenever chat or the emote
 * picker showed them again. This cache sits under Glide's network fetch: an image a service has sent once is
 * kept in the app's cache directory and handed to Glide from there, without another request.
 *
 * <p>Bounded three ways: {@link #MAX_DISK_BYTES} on disk, least recently used out first; a file unused for
 * {@link #MAX_IDLE_MS}, or older than {@link #MAX_AGE_MS}, is deleted; and {@link #MAX_MEMORY_BYTES} of the
 * smaller, most recently used images are kept in memory so chat lines don't wait for the disk. Only complete
 * responses that start like an image are stored. Every other image URL of the app passes through untouched.
 */
@SuppressWarnings("unused")
public final class TwitchImageCache {
    static final long MAX_DISK_BYTES = 256L * 1024 * 1024;
    /** The limits in use: the constants, unless a test lowered them. */
    static volatile long maxDiskBytes = MAX_DISK_BYTES;
    /** A single image larger than this is never stored (the largest 2x emote GIFs are around 3 MB). */
    static final int MAX_ENTRY_BYTES = 6 * 1024 * 1024;
    static final long MAX_MEMORY_BYTES = 8L * 1024 * 1024;
    static volatile long maxMemoryBytes = MAX_MEMORY_BYTES;
    /** Images above this stay on disk only. */
    static final int MAX_MEMORY_ENTRY_BYTES = 192 * 1024;
    static final long DAY_MS = 24 * 60 * 60_000L;
    static final long MAX_IDLE_MS = 14 * DAY_MS;
    static final long MAX_AGE_MS = 30 * DAY_MS;
    /** How often a file's last-used time is written again while it keeps being used. */
    private static final long TOUCH_MS = 6 * 60 * 60_000L;
    private static final int MAX_EXTRA_URLS = 2048;
    private static final String DIRECTORY = "lurk-images";

    private static final String[] HOSTS = {
            "https://cdn.7tv.app/", "https://cdn.betterttv.net/", "https://cdn.frankerfacez.com/",
    };

    /** Exact URLs on other hosts (third-party badges whose list names the image address). */
    private static final Set<String> EXTRA = Collections.synchronizedSet(Collections.newSetFromMap(
            new LinkedHashMap<String, Boolean>() {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
                    return size() > MAX_EXTRA_URLS;
                }
            }));

    private static final Object LOCK = new Object();
    /** File name -> entry, least recently used first. Null until the directory has been read. */
    private static LinkedHashMap<String, Entry> index;
    private static long diskBytes;
    /** URL -> image, least recently used first. */
    private static final LinkedHashMap<String, Hot> MEMORY = new LinkedHashMap<>(64, 0.75f, true);
    private static long memoryBytes;

    private static final AtomicLong HITS = new AtomicLong();
    private static final AtomicLong STORED = new AtomicLong();

    /** Where the files go; tests set it. Null means the app's cache directory. */
    static volatile File directory;
    /** Wall clock in milliseconds; tests set it. */
    static volatile LongSupplier clock = System::currentTimeMillis;

    private TwitchImageCache() {
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /**
     * Injection point: Glide's network fetcher is about to request {@code model} (its URL object). Returns the
     * image when Lurk has it, which the fetcher hands to Glide instead of making the request; null for every
     * other URL and for images not stored yet.
     */
    public static InputStream cached(Object model) {
        try {
            String url = model == null ? null : model.toString();
            if (!wants(url)) return null;
            byte[] data = get(url);
            return data == null ? null : new ByteArrayInputStream(data);
        } catch (RuntimeException e) {
            Logger.d("image cache: read failed: " + e);
            return null;
        }
    }

    /**
     * Injection point: Glide's network fetcher got a successful response for {@code model}. For a third-party
     * image, returns a stream that keeps a copy of what Glide reads and stores it once the body has been read
     * to its end; {@code stream} itself for everything else.
     */
    public static InputStream store(Object model, InputStream stream) {
        try {
            String url = model == null ? null : model.toString();
            if (stream == null || !wants(url)) return stream;
            return new Copy(stream, url);
        } catch (RuntimeException e) {
            Logger.d("image cache: copy failed: " + e);
            return stream;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // For Lurk's own image loads

    /** Whether {@code url} is an image this cache keeps: one on a third-party emote CDN, or a listed badge. */
    static boolean wants(String url) {
        if (url == null || url.length() < 20 || !url.startsWith("https://")) return false;
        for (String host : HOSTS) {
            if (url.startsWith(host)) return true;
        }
        return !EXTRA.isEmpty() && EXTRA.contains(url);
    }

    /** Adds a third-party badge image on another host to the URLs this cache keeps. */
    static void include(String url) {
        if (url != null && url.startsWith("https://") && url.length() <= 512) EXTRA.add(url);
    }

    /** The stored image at {@code url}, or null. */
    static byte[] get(String url) {
        if (!wants(url)) return null;
        String name;
        Entry entry;
        synchronized (LOCK) {
            LinkedHashMap<String, Entry> entries = index();
            if (entries == null) return null;
            long now = clock.getAsLong();
            Hot hot = MEMORY.get(url);
            name = hot != null ? hot.name : name(url);
            // Looking it up also makes it the most recently used file.
            entry = entries.get(name);
            if (entry == null || entry.expired(now)) {
                if (entry != null) remove(entries, name, entry);
                forget(url);
                return null;
            }
            touch(entry, now);
            if (hot != null) {
                served();
                return hot.data;
            }
        }
        // Read without the lock, so Glide's other loads don't wait for this file. The file can only go away
        // meanwhile (trimmed, replaced), which reads as a miss.
        byte[] data = read(entry.file);
        synchronized (LOCK) {
            LinkedHashMap<String, Entry> entries = index;
            if (entries == null || entries.get(name) != entry) return null;
            if (data == null || !isImage(data, data.length)) {
                remove(entries, name, entry);
                return null;
            }
            remember(url, name, data);
            served();
            return data;
        }
    }

    private static void touch(Entry entry, long now) {
        if (now - entry.used > TOUCH_MS || now < entry.used) {
            entry.used = now;
            // Best effort: without it the file only looks unused earlier than it was.
            entry.file.setLastModified(now);
        }
    }

    /** Stores a complete image for {@code url}. Anything that isn't one of ours, or isn't an image, is ignored. */
    static void put(String url, byte[] data) {
        if (data == null || !wants(url) || data.length > MAX_ENTRY_BYTES || !isImage(data, data.length)) return;
        synchronized (LOCK) {
            LinkedHashMap<String, Entry> entries = index();
            if (entries == null) return;
            long now = clock.getAsLong();
            String name = name(url);
            Entry old = entries.get(name);
            if (old != null) remove(entries, name, old);
            forget(url);
            File dir = directory();
            if (dir == null) return;
            File file = new File(dir, name + "." + now / DAY_MS);
            File partial = new File(dir, name + ".tmp");
            try {
                try (FileOutputStream out = new FileOutputStream(partial)) {
                    out.write(data);
                }
                if (!partial.renameTo(file)) throw new IOException("can't rename");
                file.setLastModified(now);
            } catch (IOException | RuntimeException e) {
                partial.delete();
                Logger.d("image cache: write failed: " + e);
                return;
            }
            entries.put(name, new Entry(file, data.length, now, now));
            diskBytes += data.length;
            remember(url, name, data);
            trim(entries, now, false);
            long stored = STORED.incrementAndGet();
            if (stored == 1 || stored % 50 == 0) Logger.d("image cache: " + stats());
        }
    }

    /**
     * Deletes what has expired and what is over the size limit. Called once when a chat opens, off the main
     * thread: the files of someone who turned the add-ons off go away after {@link #MAX_IDLE_MS}.
     */
    static void maintain() {
        synchronized (LOCK) {
            LinkedHashMap<String, Entry> entries = index();
            if (entries == null) return;
            trim(entries, clock.getAsLong(), true);
            if (!entries.isEmpty()) Logger.d("image cache: " + stats());
        }
    }

    /** Counts an image served from the cache; Debug logging gets the first and every 50th. Call with the lock held. */
    private static void served() {
        long hits = HITS.incrementAndGet();
        if (hits == 1 || hits % 50 == 0) Logger.d("image cache: " + stats());
    }

    /** "N images, M kB on disk, K kB in memory, H served, S stored", for Debug logging. */
    static String stats() {
        synchronized (LOCK) {
            return (index == null ? 0 : index.size()) + " images, " + diskBytes / 1024 + " kB on disk, "
                    + memoryBytes / 1024 + " kB in memory, " + HITS.get() + " served, " + STORED.get() + " stored";
        }
    }

    static long hits() {
        return HITS.get();
    }

    static long diskBytes() {
        synchronized (LOCK) {
            index();
            return diskBytes;
        }
    }

    static long memoryBytes() {
        synchronized (LOCK) {
            return memoryBytes;
        }
    }

    static int size() {
        synchronized (LOCK) {
            LinkedHashMap<String, Entry> entries = index();
            return entries == null ? 0 : entries.size();
        }
    }

    /** Forgets everything held in memory, as a new process would; the files stay. For tests. */
    static void forget() {
        synchronized (LOCK) {
            index = null;
            diskBytes = 0;
            MEMORY.clear();
            memoryBytes = 0;
            HITS.set(0);
            STORED.set(0);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Disk

    private static File directory() {
        File dir = directory;
        if (dir == null) {
            Context context = TwitchContext.application();
            File cache = context == null ? null : context.getCacheDir();
            if (cache == null) return null;
            directory = dir = new File(cache, DIRECTORY);
        }
        return dir.isDirectory() || dir.mkdirs() ? dir : null;
    }

    /** The index, read from the directory on first use: oldest use first, expired files deleted. */
    private static LinkedHashMap<String, Entry> index() {
        if (index != null) return index;
        File dir = directory();
        if (dir == null) return null;
        long now = clock.getAsLong();
        java.util.ArrayList<Entry> found = new java.util.ArrayList<>();
        java.util.ArrayList<String> names = new java.util.ArrayList<>();
        File[] files = dir.listFiles();
        if (files != null) {
            for (File file : files) {
                String fileName = file.getName();
                int dot = fileName.lastIndexOf('.');
                long stored = -1;
                if (dot == 64) {
                    try {
                        stored = Long.parseLong(fileName.substring(dot + 1)) * DAY_MS;
                    } catch (NumberFormatException ignored) {
                        // Not one of ours, or a partial file a killed process left: deleted below.
                    }
                }
                Entry entry = stored < 0 ? null : new Entry(file, file.length(), file.lastModified(), stored);
                if (entry == null || entry.size <= 0 || entry.size > MAX_ENTRY_BYTES || entry.expired(now)) {
                    file.delete();
                    continue;
                }
                found.add(entry);
                names.add(fileName.substring(0, dot));
            }
        }
        Integer[] order = new Integer[found.size()];
        for (int i = 0; i < order.length; i++) order[i] = i;
        java.util.Arrays.sort(order, (a, b) -> Long.compare(found.get(a).used, found.get(b).used));
        LinkedHashMap<String, Entry> entries = new LinkedHashMap<>(Math.max(16, order.length * 2), 0.75f, true);
        long bytes = 0;
        for (int i : order) {
            Entry previous = entries.put(names.get(i), found.get(i));
            if (previous != null) {
                // Two days' files of one image: keep the one used last.
                previous.file.delete();
                bytes -= previous.size;
            }
            bytes += found.get(i).size;
        }
        diskBytes = bytes;
        index = entries;
        return entries;
    }

    /**
     * Deletes the least recently used files until the directory fits its limit; with {@code expired}, also
     * every file past its idle time or age.
     */
    private static void trim(LinkedHashMap<String, Entry> entries, long now, boolean expired) {
        Iterator<Map.Entry<String, Entry>> iterator = entries.entrySet().iterator();
        while (iterator.hasNext()) {
            Entry entry = iterator.next().getValue();
            if (diskBytes <= maxDiskBytes && !entry.expired(now)) {
                if (expired) continue;
                break;
            }
            entry.file.delete();
            diskBytes -= entry.size;
            iterator.remove();
        }
    }

    private static void remove(LinkedHashMap<String, Entry> entries, String name, Entry entry) {
        entry.file.delete();
        entries.remove(name);
        diskBytes -= entry.size;
    }

    private static byte[] read(File file) {
        long length = file.length();
        if (length <= 0 || length > MAX_ENTRY_BYTES) return null;
        byte[] data = new byte[(int) length];
        try (FileInputStream in = new FileInputStream(file)) {
            int at = 0;
            while (at < data.length) {
                int read = in.read(data, at, data.length - at);
                if (read < 0) return null;
                at += read;
            }
            return data;
        } catch (IOException e) {
            return null;
        }
    }

    /** The SHA-256 of the URL in hex: 64 characters, safe as a file name, and nothing about it on disk. */
    static String name(String url) {
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(url.getBytes(StandardCharsets.UTF_8));
            StringBuilder name = new StringBuilder(64);
            for (byte b : hash) {
                name.append(Character.forDigit((b >> 4) & 15, 16)).append(Character.forDigit(b & 15, 16));
            }
            return name.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Memory

    private static void remember(String url, String name, byte[] data) {
        if (data.length > MAX_MEMORY_ENTRY_BYTES) return;
        Hot previous = MEMORY.put(url, new Hot(name, data));
        if (previous != null) memoryBytes -= previous.data.length;
        memoryBytes += data.length;
        Iterator<Map.Entry<String, Hot>> iterator = MEMORY.entrySet().iterator();
        while (memoryBytes > maxMemoryBytes && iterator.hasNext()) {
            memoryBytes -= iterator.next().getValue().data.length;
            iterator.remove();
        }
    }

    private static void forget(String url) {
        Hot previous = MEMORY.remove(url);
        if (previous != null) memoryBytes -= previous.data.length;
    }

    // ---------------------------------------------------------------------------------------------
    // Types

    /** Whether the first bytes are a GIF, PNG, JPEG, WebP or AVIF file's. */
    static boolean isImage(byte[] data, int length) {
        if (length < 12) return false;
        if (data[0] == 'G' && data[1] == 'I' && data[2] == 'F' && data[3] == '8') return true;
        if ((data[0] & 0xff) == 0x89 && data[1] == 'P' && data[2] == 'N' && data[3] == 'G') return true;
        if ((data[0] & 0xff) == 0xff && (data[1] & 0xff) == 0xd8 && (data[2] & 0xff) == 0xff) return true;
        if (data[0] == 'R' && data[1] == 'I' && data[2] == 'F' && data[3] == 'F'
                && data[8] == 'W' && data[9] == 'E' && data[10] == 'B' && data[11] == 'P') return true;
        return data[4] == 'f' && data[5] == 't' && data[6] == 'y' && data[7] == 'p';
    }

    /** An image held in memory, with its file's name. */
    private static final class Hot {
        final String name;
        final byte[] data;

        Hot(String name, byte[] data) {
            this.name = name;
            this.data = data;
        }
    }

    private static final class Entry {
        final File file;
        final long size;
        /** When it was last used (the file's modification time). */
        long used;
        /** When it was downloaded, to the day (the file name's suffix). */
        final long stored;

        Entry(File file, long size, long used, long stored) {
            this.file = file;
            this.size = size;
            this.used = used;
            this.stored = stored;
        }

        boolean expired(long now) {
            return now - used > MAX_IDLE_MS || now - stored > MAX_AGE_MS + DAY_MS;
        }
    }

    /**
     * Passes a response body through and keeps what was read. The copy is stored when the body ends, which
     * the HTTP client only reports for a complete response; a body that fails, is closed early or grows past
     * {@link #MAX_ENTRY_BYTES} is not stored.
     */
    private static final class Copy extends FilterInputStream {
        private final String url;
        private ByteArrayOutputStream copy = new ByteArrayOutputStream(16 * 1024);

        Copy(InputStream in, String url) {
            super(in);
            this.url = url;
        }

        @Override
        public int read() throws IOException {
            int value;
            try {
                value = in.read();
            } catch (IOException | RuntimeException e) {
                copy = null;
                throw e;
            }
            if (value < 0) finish();
            else if (copy != null) {
                if (copy.size() >= MAX_ENTRY_BYTES) copy = null;
                else copy.write(value);
            }
            return value;
        }

        @Override
        public int read(byte[] buffer, int offset, int length) throws IOException {
            int read;
            try {
                read = in.read(buffer, offset, length);
            } catch (IOException | RuntimeException e) {
                copy = null;
                throw e;
            }
            if (read < 0) finish();
            else if (copy != null && read > 0) {
                if (copy.size() + read > MAX_ENTRY_BYTES) copy = null;
                else copy.write(buffer, offset, read);
            }
            return read;
        }

        @Override
        public long skip(long count) throws IOException {
            // Skipped bytes aren't seen, so the copy would have a hole.
            copy = null;
            return in.skip(count);
        }

        @Override
        public boolean markSupported() {
            return false;
        }

        @Override
        public void close() throws IOException {
            copy = null;
            in.close();
        }

        private void finish() {
            ByteArrayOutputStream done = copy;
            copy = null;
            if (done == null || done.size() == 0) return;
            try {
                put(url, done.toByteArray());
            } catch (RuntimeException e) {
                Logger.d("image cache: store failed: " + e);
            }
        }
    }
}
