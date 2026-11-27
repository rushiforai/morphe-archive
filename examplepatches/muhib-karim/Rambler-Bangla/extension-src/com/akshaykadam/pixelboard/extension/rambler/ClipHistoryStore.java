package com.akshaykadam.pixelboard.extension.rambler;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Bounded text history: up to LIMIT recent entries, newest first, below up to MAX_PINNED pinned entries.
 * In-memory state changes only after durable storage succeeds.
 */
public final class ClipHistoryStore {
    public static final int LIMIT = 50;
    public static final int MAX_PINNED = 10;
    public static final int MAX_TEXT_CHARS = 32768; // larger clips are skipped, never truncated
    private static final int MAGIC = 0x52434832; // RCH2

    public interface Storage {
        byte[] read() throws IOException;
        void write(byte[] value) throws IOException;
    }

    private final Storage storage;
    private List<String> pinned = new ArrayList<>(); // most recently pinned first
    private List<String> recent = new ArrayList<>(); // newest first
    private long lastTimestamp; // clipboard event already handled; no text or hash of it is kept

    public ClipHistoryStore(Storage storage) throws IOException {
        this.storage = storage;
        byte[] saved = storage.read();
        if (saved == null) return;
        try {
            DataInputStream in = new DataInputStream(new ByteArrayInputStream(saved));
            if (in.readInt() != MAGIC) return;
            long timestamp = in.readLong();
            int count = in.readInt();
            if (count < 0 || count > LIMIT + MAX_PINNED) return;
            List<String> loadedPinned = new ArrayList<>();
            List<String> loadedRecent = new ArrayList<>();
            for (int i = 0; i < count; i++) {
                byte flags = in.readByte();
                int length = in.readInt();
                if ((flags & ~1) != 0 || length <= 0 || length > MAX_TEXT_CHARS) return;
                char[] chars = new char[length];
                for (int j = 0; j < length; j++) chars[j] = in.readChar();
                String text = new String(chars);
                if (loadedPinned.contains(text) || loadedRecent.contains(text)) return;
                if (flags == 1) {
                    if (!loadedRecent.isEmpty()) return; // pinned entries are stored first
                    loadedPinned.add(text);
                } else {
                    loadedRecent.add(text);
                }
            }
            if (in.available() != 0 || loadedPinned.size() > MAX_PINNED || loadedRecent.size() > LIMIT) return;
            pinned = loadedPinned;
            recent = loadedRecent;
            lastTimestamp = timestamp;
        } catch (IOException malformed) {
            // Never expose partially decoded history. A future safe clip can replace corruption.
        }
    }

    /** Returns true when the clip was accepted and stored. */
    public synchronized boolean record(String text, long timestamp, boolean sensitive) throws IOException {
        if (sensitive || text == null || text.isEmpty() || text.length() > MAX_TEXT_CHARS || timestamp <= 0)
            return false;
        // Each clipboard event has its own timestamp; reading it again (process restart) is not a new copy,
        // and must not bring back an entry the user deleted.
        if (timestamp == lastTimestamp) return false;
        List<String> nextRecent = new ArrayList<>(recent);
        if (!pinned.contains(text)) {
            nextRecent.remove(text);
            nextRecent.add(0, text);
            if (nextRecent.size() > LIMIT) nextRecent.remove(LIMIT);
        }
        save(pinned, nextRecent, timestamp);
        return true;
    }

    public synchronized boolean delete(String text) throws IOException {
        List<String> nextPinned = new ArrayList<>(pinned);
        List<String> nextRecent = new ArrayList<>(recent);
        if (!nextPinned.remove(text) && !nextRecent.remove(text)) return false;
        save(nextPinned, nextRecent, lastTimestamp);
        return true;
    }

    /** Pin moves an entry above the recent list; unpin returns it to the top of the recent list. */
    public synchronized boolean setPinned(String text, boolean pin) throws IOException {
        List<String> nextPinned = new ArrayList<>(pinned);
        List<String> nextRecent = new ArrayList<>(recent);
        if (pin) {
            if (nextPinned.size() >= MAX_PINNED || !nextRecent.remove(text)) return false;
            nextPinned.add(0, text);
        } else {
            if (!nextPinned.remove(text)) return false;
            nextRecent.add(0, text);
            if (nextRecent.size() > LIMIT) nextRecent.remove(LIMIT);
        }
        save(nextPinned, nextRecent, lastTimestamp);
        return true;
    }

    public synchronized boolean isPinned(String text) { return pinned.contains(text); }

    public synchronized boolean canPin() { return pinned.size() < MAX_PINNED; }

    /** Display order: pinned entries, then recent entries newest first. */
    public synchronized List<String> snapshot() {
        List<String> all = new ArrayList<>(pinned);
        all.addAll(recent);
        return all;
    }

    /** Pinned entries in display order. */
    public synchronized List<String> pinnedSnapshot() { return new ArrayList<>(pinned); }

    private void save(List<String> nextPinned, List<String> nextRecent, long timestamp) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(buffer);
        out.writeInt(MAGIC);
        out.writeLong(timestamp);
        out.writeInt(nextPinned.size() + nextRecent.size());
        for (String text : nextPinned) write(out, text, 1);
        for (String text : nextRecent) write(out, text, 0);
        out.flush();
        storage.write(buffer.toByteArray());
        pinned = nextPinned;
        recent = nextRecent;
        lastTimestamp = timestamp;
    }

    private static void write(DataOutputStream out, String text, int flags) throws IOException {
        out.writeByte(flags);
        out.writeInt(text.length());
        out.writeChars(text);
    }
}
