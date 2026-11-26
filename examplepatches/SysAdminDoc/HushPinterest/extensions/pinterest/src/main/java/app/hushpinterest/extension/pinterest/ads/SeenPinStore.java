/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import android.content.Context;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;

/**
 * The pins Hide pins you've already seen remembers (#52), each with the minute it last came on
 * screen, oldest first and at most {@link #LIMIT} of them, so "forever" means the newest fifty
 * thousand. Only pin IDs and minutes are kept, in one file in the app's own storage that no backup
 * or report reads.
 *
 * <p>The file is a header and then one 12-byte line per sighting. A new sighting goes on the end a
 * moment later, off the main thread, so scrolling never waits on storage. Reading it back keeps each
 * pin's last line. Once it holds many more lines than pins, or after Forget, it's written over whole.
 */
final class SeenPinStore {
    private SeenPinStore() {}

    static final int LIMIT = 50_000;
    static final String FILE = "hushpinterest_seen_pins";
    /** "HSP1": the file's first four bytes, so a file of another shape is never read as pins. */
    static final int MAGIC = 0x48535031;
    static final int LINE = 12;
    /** A pin seen again sooner than this keeps its minute, so scrolling up and down adds no lines. */
    static final int REFRESH_MINUTES = 60;
    /** How long sightings wait before going to the file, so a scroll's worth goes in one write. */
    static final long WRITE_DELAY_MS = 2_000;

    /** Pin ID to the minute it was last seen, oldest first. */
    private static LinkedHashMap<Long, Integer> seen = new LinkedHashMap<>();
    /** What Forget took, until something brings it back or the app restarts. */
    private static LinkedHashMap<Long, Integer> forgotten;
    private static boolean loaded;
    /** Lines in the file once the pending ones are written. */
    private static int lines;
    private static long[] pendingIds = new long[64];
    private static int[] pendingMinutes = new int[64];
    private static int pending;
    private static boolean writeQueued;
    /** True when the file has to be written over whole rather than added to. */
    private static boolean rewrite;

    /** Taken first by every write, so the file sees writes in the order their contents were read. */
    private static final Object FILE_LOCK = new Object();

    /** Whether [id] was seen at [sinceMinute] or later. */
    static synchronized boolean seenSince(long id, int sinceMinute) {
        load();
        Integer minute = seen.get(id);
        return minute != null && minute >= sinceMinute;
    }

    /** Notes [id] as seen at [minute]. A pin seen again within the hour keeps its minute. */
    static synchronized void record(long id, int minute) {
        load();
        Integer last = seen.get(id);
        if (last != null && minute - last < REFRESH_MINUTES) return;
        put(id, minute);
        if (pending == pendingIds.length) {
            pendingIds = Arrays.copyOf(pendingIds, pending * 2);
            pendingMinutes = Arrays.copyOf(pendingMinutes, pending * 2);
        }
        pendingIds[pending] = id;
        pendingMinutes[pending] = minute;
        pending++;
        lines++;
        queueWrite();
    }

    /** How many pins it remembers. */
    static synchronized int size() {
        load();
        return seen.size();
    }

    /** Forgets every pin, keeping them until {@link #bringBack} or a restart, and says how many there were. */
    static synchronized int forget() {
        load();
        int count = seen.size();
        if (count == 0) return 0;
        forgotten = seen;
        seen = new LinkedHashMap<>();
        pending = 0;
        rewrite = true;
        queueWrite();
        return count;
    }

    /** How many pins the last Forget took that can still come back, 0 when none can. */
    static synchronized int forgottenCount() {
        return forgotten == null ? 0 : forgotten.size();
    }

    /** Puts back what the last Forget took, keeping what was seen since, and says how many came back. */
    static synchronized int bringBack() {
        if (forgotten == null) return 0;
        int count = forgotten.size();
        LinkedHashMap<Long, Integer> since = seen;
        seen = forgotten;
        forgotten = null;
        for (Map.Entry<Long, Integer> entry : since.entrySet()) put(entry.getKey(), entry.getValue());
        pending = 0;
        rewrite = true;
        queueWrite();
        return count;
    }

    /** Puts [id] at the newest end with [minute], dropping the oldest past the limit. */
    private static void put(long id, int minute) {
        Integer last = seen.remove(id);
        seen.put(id, last == null ? minute : Math.max(last, minute));
        Iterator<Long> oldest = seen.keySet().iterator();
        for (int over = seen.size() - LIMIT; over > 0; over--) {
            oldest.next();
            oldest.remove();
        }
    }

    private static void queueWrite() {
        if (writeQueued) return;
        writeQueued = true;
        Utils.runOnMainThreadDelayed(() -> {
            if (!Utils.runOnBackgroundThread(SeenPinStore::write)) {
                synchronized (SeenPinStore.class) {
                    writeQueued = false;
                }
            }
        }, WRITE_DELAY_MS);
    }

    /** Reads the file once, the first time anything asks. A file it can't read is written over next time. */
    private static void load() {
        if (loaded) return;
        loaded = true;
        File file = file();
        if (file == null || !file.isFile()) return;
        long length = file.length();
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(file)))) {
            if (length < 4 || in.readInt() != MAGIC) {
                rewrite = true;
                return;
            }
            long count = (length - 4) / LINE;
            for (long line = 0; line < count; line++) put(in.readLong(), in.readInt());
            lines = (int) Math.min(Integer.MAX_VALUE, count);
            // A write cut off partway leaves part of a line on the end.
            if ((length - 4) % LINE != 0) rewrite = true;
        } catch (IOException | RuntimeException failure) {
            Logger.printException(() -> "Couldn't read the pins Hide pins you've already seen remembers", failure);
            rewrite = true;
        }
    }

    /** Writes what's waiting: the new lines on the end, or the whole list when it's due to be written over. */
    static void write() {
        synchronized (FILE_LOCK) {
            boolean whole;
            long[] ids;
            int[] minutes;
            File file;
            synchronized (SeenPinStore.class) {
                writeQueued = false;
                file = file();
                if (file == null) return;
                whole = rewrite || lines > seen.size() + LIMIT / 2;
                if (whole) {
                    ids = new long[seen.size()];
                    minutes = new int[seen.size()];
                    int at = 0;
                    for (Map.Entry<Long, Integer> entry : seen.entrySet()) {
                        ids[at] = entry.getKey();
                        minutes[at++] = entry.getValue();
                    }
                    rewrite = false;
                    lines = ids.length;
                } else {
                    if (pending == 0) return;
                    ids = Arrays.copyOf(pendingIds, pending);
                    minutes = Arrays.copyOf(pendingMinutes, pending);
                }
                pending = 0;
            }
            try {
                if (whole) writeWhole(file, ids, minutes);
                else append(file, ids, minutes);
            } catch (IOException | RuntimeException failure) {
                Logger.printException(() -> "Couldn't save the pins Hide pins you've already seen remembers", failure);
                synchronized (SeenPinStore.class) {
                    rewrite = true;
                }
            }
        }
    }

    private static void writeWhole(File file, long[] ids, int[] minutes) throws IOException {
        File next = new File(file.getPath() + ".new");
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(next)))) {
            out.writeInt(MAGIC);
            for (int at = 0; at < ids.length; at++) {
                out.writeLong(ids[at]);
                out.writeInt(minutes[at]);
            }
        }
        try {
            // Replaces the old file in one step, on the phone and on a desktop test run alike.
            Files.move(next.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
        } catch (IOException failure) {
            //noinspection ResultOfMethodCallIgnored
            next.delete();
            throw failure;
        }
    }

    private static void append(File file, long[] ids, int[] minutes) throws IOException {
        boolean fresh = !file.isFile() || file.length() < 4;
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file, !fresh)))) {
            if (fresh) out.writeInt(MAGIC);
            for (int at = 0; at < ids.length; at++) {
                out.writeLong(ids[at]);
                out.writeInt(minutes[at]);
            }
        }
    }

    private static File file() {
        Context context = Utils.getContext();
        return context == null ? null : new File(context.getFilesDir(), FILE);
    }

    /** Back to nothing read and nothing waiting, as a fresh start finds it. */
    static synchronized void resetForTests() {
        seen = new LinkedHashMap<>();
        forgotten = null;
        loaded = false;
        lines = 0;
        pending = 0;
        writeQueued = false;
        rewrite = false;
    }

    /** Nothing seen at all: memory as {@link #resetForTests} leaves it, and no file. */
    static synchronized void deleteForTests() {
        resetForTests();
        File file = file();
        //noinspection ResultOfMethodCallIgnored
        if (file != null) file.delete();
    }

    /** Lines the file holds once what's waiting is written. */
    static synchronized int linesForTests() {
        return lines;
    }
}
