package dev.jason.gboardpatches.extension.sharedmodel;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.provider.ContactsContract.Contacts;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/** Reads only display names on demand. A slow contacts provider must not stall dictation. */
final class SharedSpeechContactNames {
    private static final int MAX_SCANNED_CONTACTS = 128;
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(0, 1, 30, TimeUnit.SECONDS,
        new SynchronousQueue<>(), task -> {
            Thread thread = new Thread(task, "gboard-local-speech-contacts");
            thread.setDaemon(true);
            return thread;
        });

    private SharedSpeechContactNames() {}

    static boolean canRead(Context context) {
        return context.checkSelfPermission(Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED;
    }

    static List<String> read(Context context) {
        Future<List<String>> lookup;
        try {
            lookup = WORKER.submit(() -> readDisplayNames(context));
        } catch (RejectedExecutionException busy) {
            return Collections.emptyList();
        }
        try {
            return lookup.get(500, TimeUnit.MILLISECONDS);
        } catch (InterruptedException cancelled) {
            Thread.currentThread().interrupt();
        } catch (ExecutionException | TimeoutException unavailable) {
            // Contact hints are optional and the underlying error may include private data.
        } finally {
            lookup.cancel(true);
        }
        return Collections.emptyList();
    }

    private static List<String> readDisplayNames(Context context) {
        Phrases names = new Phrases();
        String order = Contacts.STARRED + " DESC, " + Contacts.DISPLAY_NAME_PRIMARY + " COLLATE LOCALIZED ASC, " + Contacts._ID;
        try (Cursor cursor = context.getContentResolver().query(Contacts.CONTENT_URI,
                new String[]{Contacts.DISPLAY_NAME_PRIMARY}, null, null, order)) {
            if (cursor != null) {
                for (int seen = 0; seen < MAX_SCANNED_CONTACTS && !names.full()
                        && !Thread.currentThread().isInterrupted() && cursor.moveToNext(); seen++) {
                    names.offer(cursor.getString(0));
                }
            }
        }
        return names.values();
    }

    /** Matches the host's session validation without exposing unbounded contact-provider data. */
    static final class Phrases {
        private static final int MAX_PHRASES = 32;
        private static final int MAX_BYTES = 4096;
        private static final int MAX_CODE_POINTS = 64;
        private final LinkedHashSet<String> names = new LinkedHashSet<>();
        private int bytes;

        boolean full() { return names.size() >= MAX_PHRASES || bytes >= MAX_BYTES; }

        void offer(String raw) {
            if (raw == null || full() || raw.length() > MAX_CODE_POINTS * 2) return;
            String name = Normalizer.normalize(raw, Normalizer.Form.NFC).trim().replaceAll(" +", " ");
            int count = name.codePointCount(0, name.length());
            if (count < 1 || count > MAX_CODE_POINTS) return;
            boolean hasLetter = false;
            // Check the untrimmed provider value so controls are never silently dropped.
            for (int offset = 0; offset < raw.length();) {
                int codePoint = raw.codePointAt(offset);
                if (Character.isLetter(codePoint)) hasLetter = true;
                else if (!isNameCharacter(codePoint)) return;
                offset += Character.charCount(codePoint);
            }
            if (!hasLetter || names.contains(name)) return;
            int size = name.getBytes(StandardCharsets.UTF_8).length;
            if (bytes + size > MAX_BYTES) return;
            names.add(name);
            bytes += size;
        }

        private static boolean isNameCharacter(int codePoint) {
            int type = Character.getType(codePoint);
            return Character.isDigit(codePoint) || type == Character.NON_SPACING_MARK ||
                type == Character.COMBINING_SPACING_MARK || type == Character.ENCLOSING_MARK ||
                " .'’-‐‑".indexOf(codePoint) >= 0;
        }

        List<String> values() { return new ArrayList<>(names); }
    }
}
