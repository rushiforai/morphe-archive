package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.io.*;
import java.util.*;
import java.util.concurrent.*;

/** Byte-range reader over TDLib file downloads. */
final class NativeAudio {
    final TelegramBridge bridge;
    final Object cacheGuard = new Object();
    final Semaphore slots = new Semaphore(3);
    final Map<Integer, Lease> leases = new HashMap<>();
    int active;

    static final class Lease {
        int readers;
    }

    NativeAudio(TelegramBridge bridge) {
        this.bridge = bridge;
    }

    boolean active() {
        synchronized (cacheGuard) {
            return active > 0;
        }
    }

    boolean applyCacheLimit() throws Exception {
        synchronized (cacheGuard) {
            if (active > 0) return false;
            bridge.optimize(bridge.cacheLimitBytes());
            return true;
        }
    }

    void clearCache() throws Exception {
        synchronized (cacheGuard) {
            if (active > 0) throw new IOException("Stop playback before clearing the cache");
            bridge.optimize(0);
        }
    }

    Reader open(String url, long position, long length) throws IOException {
        if (position < 0 || length < -1) throw new IOException("Invalid audio range");
        if (!slots.tryAcquire()) throw new IOException("Too many active Telegram reads");
        boolean counted = false;
        Lease lease = null;
        int fileId = 0;
        try {
            long generation = bridge.generation;
            String tag = bridge.sessionTag;
            bridge.requireReady();
            String id = InternalAddon.audioId(bridge, url);
            long permissionRevision = bridge.mediaRevision;
            JSONObject row = bridge.resolveTrack(id);
            if (row == null) throw new IOException("Telegram track is unavailable");
            fileId = row.getInt("file");
            long chat = row.getLong("chat");
            TdApi.File file = bridge.call(new TdApi.GetFile(fileId));
            // A song inside a zip is read from its place in the zip, in its own positions; a track
            // of a cue sheet is read as a WAV file of just that track.
            JSONObject zip = row.optJSONObject("zip"), cue = row.optJSONObject("cue");
            long size = zip == null && cue == null ? file.size : row.getLong("size");
            if (zip != null && zip.getLong("data") + zip.getLong("compressed") > file.size)
                throw new IOException("Damaged zip");
            if (size < 0 || position > size)
                throw new IOException("Audio position is outside the file");
            long available = size - position,
                    end = position + (length < 0 ? available : Math.min(length, available));
            synchronized (cacheGuard) {
                if (active == 0) bridge.optimize(bridge.cacheLimitBytes());
                active++;
                counted = true;
                lease = leases.get(fileId);
                if (lease == null) {
                    lease = new Lease();
                    leases.put(fileId, lease);
                }
                lease.readers++;
            }
            Reader reader =
                    new Reader(
                            this,
                            fileId,
                            chat,
                            row.getLong("message"),
                            generation,
                            tag,
                            position,
                            end,
                            size,
                            row.optString("mime"),
                            lease);
            if (cue != null)
                reader.entry =
                        new CueAudio(
                                zip == null
                                        ? reader::readRange
                                        : ZipAlbums.entryRange(
                                                reader::readRange,
                                                zip.getLong("data"),
                                                zip.getInt("method"),
                                                zip.getLong("compressed"),
                                                cue.getLong("total")),
                                cue);
            else if (zip != null)
                reader.entry =
                        new ZipDirectory.EntryReader(
                                reader::readRange,
                                zip.getLong("data"),
                                zip.getInt("method"),
                                zip.getLong("compressed"),
                                size);
            reader.fileSize = file.size;
            reader.revision = permissionRevision;
            reader.check();
            return reader;
        } catch (Exception e) {
            if (counted) release(fileId, lease);
            else slots.release();
            throw io(e);
        }
    }

    void release(int id, Lease lease) {
        synchronized (cacheGuard) {
            try {
                if (--lease.readers == 0) {
                    leases.remove(id);
                    bridge.cancelDownload(id);
                }
            } finally {
                active--;
                slots.release();
            }
        }
    }

    static IOException io(Exception e) {
        if (e instanceof CancellationException) throw (CancellationException) e;
        if (e instanceof InterruptedException) {
            Thread.currentThread().interrupt();
            return new InterruptedIOException("Telegram read interrupted");
        }
        return e instanceof IOException
                ? (IOException) e
                : new IOException("Telegram audio unavailable", e);
    }

    static final class Reader implements Closeable {
        final NativeAudio owner;
        final int id;
        final long chat, message, generation, total;
        final String tag, mime;
        final Lease lease;
        long revision, checkedAt;
        long position, end;
        volatile boolean cancelled;
        boolean released;
        Runnable cancellation = () -> {};
        // Set for a song inside a zip: positions are the song's, read through the zip.
        ZipDirectory.Source entry;
        long fileSize;

        Reader(
                NativeAudio owner,
                int id,
                long chat,
                long message,
                long generation,
                String tag,
                long position,
                long end,
                long total,
                String mime,
                Lease lease) {
            this.owner = owner;
            this.id = id;
            this.chat = chat;
            this.message = message;
            this.generation = generation;
            this.tag = tag;
            this.position = position;
            this.end = end;
            this.total = total;
            this.mime =
                    mime.matches("[a-zA-Z0-9.+-]+/[a-zA-Z0-9.+-]+")
                            ? mime
                            : "application/octet-stream";
            this.lease = lease;
            revision = owner.bridge.mediaRevision;
            checkedAt = System.nanoTime();
        }

        void check() throws IOException {
            cancellation.run();
            if (cancelled || Thread.currentThread().isInterrupted())
                throw new InterruptedIOException("Telegram read cancelled");
            owner.bridge.requireReady();
            if (generation != owner.bridge.generation || !tag.equals(owner.bridge.sessionTag))
                throw new IOException("Telegram session changed");
            if (!owner.bridge.selected.contains(chat))
                throw new IOException("Music chat was deselected");
            if (revision != owner.bridge.mediaRevision
                    || System.nanoTime() - checkedAt > TimeUnit.SECONDS.toNanos(15)) {
                long checking = owner.bridge.mediaRevision;
                try {
                    owner.bridge.verifyMedia(chat, message, id);
                } catch (Exception e) {
                    throw io(e);
                }
                revision = checking;
                checkedAt = System.nanoTime();
                owner.bridge.requireReady();
                if (generation != owner.bridge.generation
                        || !tag.equals(owner.bridge.sessionTag)
                        || !owner.bridge.selected.contains(chat))
                    throw new IOException("Telegram access changed");
            }
        }

        synchronized long remaining() {
            return end - position;
        }

        synchronized int read(byte[] buffer, int offset, int length) throws IOException {
            if (offset < 0 || length < 0 || offset > buffer.length - length)
                throw new IndexOutOfBoundsException();
            if (length == 0) return 0;
            check();
            if (position == end) return -1;
            try {
                int wanted = (int) Math.min(length, end - position);
                int count =
                        entry == null
                                ? physical(position, end, buffer, offset, wanted)
                                : entry.read(position, buffer, offset, wanted);
                if (count < 0) return -1;
                position += count;
                return count;
            } catch (Exception e) {
                throw io(e);
            }
        }

        /** Exactly {@code length} bytes of the zip at {@code at}, or fewer at its end. */
        byte[] readRange(long at, int length) throws Exception {
            byte[] out = new byte[length];
            int n = 0;
            while (n < length) {
                int got = physical(at + n, fileSize, out, n, length - n);
                if (got <= 0) break;
                n += got;
            }
            return n == length ? out : java.util.Arrays.copyOf(out, n);
        }

        /**
         * Reads up to 64 KB of the Telegram file at {@code at}, no further than {@code limit},
         * downloading that part first if it isn't here yet.
         */
        private int physical(long at, long limit, byte[] buffer, int offset, int length)
                throws Exception {
            if (at >= limit) return -1;
            synchronized (lease) {
                check();
                // TDLib has one requested download window per file. Serialize each
                // bounded read, then let another reader seek without cancelling it.
                long prefix = owner.bridge.call(new TdApi.GetFileDownloadedPrefixSize(id, at)).size;
                if (prefix <= 0) {
                    long wanted = Math.min(limit - at, 4L * 1024 * 1024);
                    owner.bridge.call(new TdApi.DownloadFile(id, 32, at, wanted, false));
                    long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(40);
                    do {
                        check();
                        long millis = TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
                        if (millis <= 0) throw new IOException("Telegram download timed out");
                        prefix =
                                owner.bridge.call(
                                                new TdApi.GetFileDownloadedPrefixSize(id, at),
                                                Math.min(millis, 15000))
                                        .size;
                        if (prefix > 0) break;
                        Thread.sleep(100);
                    } while (true);
                }
                check();
                TdApi.File file = owner.bridge.call(new TdApi.GetFile(id));
                int count =
                        (int) Math.min(Math.min(prefix, Math.min(length, 64 * 1024)), limit - at);
                try (RandomAccessFile input = new RandomAccessFile(file.local.path, "r")) {
                    input.seek(at);
                    input.readFully(buffer, offset, count);
                }
                check();
                return count;
            }
        }

        public void close() {
            cancelled = true;
            if (entry != null) entry.close();
            synchronized (this) {
                if (!released) {
                    released = true;
                    owner.release(id, lease);
                }
            }
        }
    }
}
