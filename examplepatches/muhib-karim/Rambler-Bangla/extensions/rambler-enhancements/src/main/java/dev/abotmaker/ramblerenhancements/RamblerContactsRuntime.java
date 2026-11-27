package dev.abotmaker.ramblerenhancements;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.provider.ContactsContract;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Adds the phone's contact names to Rambler's {@code MUSE_STATS} biasing list.
 *
 * <p>Hooked from {@code AgenticDictationExtension.<init>} (never touching {@code hU()}), so it
 * coexists cleanly alongside upstream GboardWu.</p>
 */
public final class RamblerContactsRuntime {
    private static final String TAG = "RamblerContacts";
    static final int MAX_NAME_LENGTH = RamblerMuseStatsBridge.MAX_WORD_LENGTH;
    static final int MAX_NAMES = 1000;
    static final int READY_ATTEMPTS = 60;
    static final long READY_INTERVAL_MS = 2000L;
    private static final int MANUAL_SYNC_ATTEMPTS = 5;
    private static final long MANUAL_SYNC_INTERVAL_MS = 500L;

    private static final AtomicBoolean RUNNING = new AtomicBoolean();

    public enum SyncStatus {
        ADDED,
        UP_TO_DATE,
        NO_PERMISSION,
        STORE_NOT_READY,
        BUSY,
        ERROR
    }

    public static final class SyncResult {
        private final SyncStatus status;
        private final int addedCount;

        public SyncResult(SyncStatus status, int addedCount) {
            this.status = status;
            this.addedCount = addedCount;
        }

        public SyncStatus getStatus() {
            return status;
        }

        public int getAddedCount() {
            return addedCount;
        }
    }

    public interface SyncCallback {
        void onComplete(SyncResult result);
    }

    private RamblerContactsRuntime() {
    }

    /**
     * Called from {@code AgenticDictationExtension.<init>(Context, ...)}; also hydrates
     * {@link RamblerFlagRuntime} with the real Context on first startup.
     */
    public static void onRamblerStart(Context context) {
        if (context == null) {
            return;
        }
        RamblerFlagRuntime.seedAndRefreshIfNeeded(context);
        if (!RamblerDynamicConfig.FEATURE_CONTACT_NAMES) {
            return;
        }
        if (!RUNNING.compareAndSet(false, true)) {
            return;
        }
        final Context app = context.getApplicationContext() != null
                ? context.getApplicationContext()
                : context;
        Thread worker = new Thread(() -> {
            try {
                seed(app, READY_ATTEMPTS, READY_INTERVAL_MS);
            } catch (Throwable error) {
                Log.w(TAG, "Adding contact names to Rambler failed", error);
            } finally {
                RUNNING.set(false);
            }
        }, "rambler-enhancements-contacts");
        worker.setDaemon(true);
        worker.start();
    }

    public static void syncNowAsync(Context context, SyncCallback callback) {
        if (context == null) {
            if (callback != null) {
                callback.onComplete(new SyncResult(SyncStatus.ERROR, 0));
            }
            return;
        }
        if (!hasContactsPermission(context)) {
            if (callback != null) {
                callback.onComplete(new SyncResult(SyncStatus.NO_PERMISSION, 0));
            }
            return;
        }
        if (!RUNNING.compareAndSet(false, true)) {
            if (callback != null) {
                callback.onComplete(new SyncResult(SyncStatus.BUSY, 0));
            }
            return;
        }
        final Context app = context.getApplicationContext() != null
                ? context.getApplicationContext()
                : context;
        Thread worker = new Thread(() -> {
            SyncResult result;
            try {
                result = seed(app, MANUAL_SYNC_ATTEMPTS, MANUAL_SYNC_INTERVAL_MS);
            } catch (Throwable error) {
                Log.w(TAG, "Manual contact sync failed", error);
                result = new SyncResult(SyncStatus.ERROR, 0);
            } finally {
                RUNNING.set(false);
            }
            if (callback != null) {
                callback.onComplete(result);
            }
        }, "rambler-enhancements-contacts-sync");
        worker.setDaemon(true);
        worker.start();
    }

    public static boolean hasContactsPermission(Context context) {
        if (context == null) {
            return false;
        }
        try {
            return context.checkSelfPermission(Manifest.permission.READ_CONTACTS)
                    == PackageManager.PERMISSION_GRANTED;
        } catch (Throwable error) {
            return false;
        }
    }

    public static int readSeededCount(Context context) {
        return RamblerEnhancementsSettings.readSeededContacts(context).size();
    }

    public static boolean resetSeededMemory(Context context) {
        return RamblerEnhancementsSettings.clearSeededContacts(context);
    }

    private static SyncResult seed(Context context, int attempts, long intervalMs)
            throws InterruptedException {
        if (!hasContactsPermission(context)) {
            Log.i(TAG, "Contacts access not granted; no contact names added");
            return new SyncResult(SyncStatus.NO_PERMISSION, 0);
        }
        Set<String> seeded = new HashSet<String>(
                RamblerEnhancementsSettings.readSeededContacts(context));
        int remaining = Math.max(0, MAX_NAMES - seeded.size());
        LinkedHashSet<String> fresh = selectNewNames(
                readContactNames(context), seeded, remaining);
        if (fresh.isEmpty()) {
            return new SyncResult(SyncStatus.UP_TO_DATE, 0);
        }
        if (!addWhenReady(
                () -> RamblerMuseStatsBridge.addWords(context, fresh),
                attempts,
                intervalMs)) {
            Log.w(TAG, "MUSE_STATS store not ready; " + fresh.size()
                    + " contact names will be added next start");
            return new SyncResult(SyncStatus.STORE_NOT_READY, 0);
        }
        seeded.addAll(fresh);
        RamblerEnhancementsSettings.writeSeededContacts(context, seeded);
        Log.i(TAG, "Added " + fresh.size() + " contact names to Rambler voice dictionary");
        return new SyncResult(SyncStatus.ADDED, fresh.size());
    }

    interface Attempt {
        boolean run();
    }

    static boolean addWhenReady(Attempt attempt, int attempts, long intervalMs)
            throws InterruptedException {
        for (int i = 0; i < attempts; i++) {
            if (i > 0) {
                Thread.sleep(intervalMs);
            }
            if (attempt.run()) {
                return true;
            }
        }
        return false;
    }

    private static List<String> readContactNames(Context context) {
        List<String> names = new ArrayList<String>();
        String[] projection = {ContactsContract.Contacts.DISPLAY_NAME_PRIMARY};
        try (Cursor cursor = context.getContentResolver().query(
                ContactsContract.Contacts.CONTENT_URI,
                projection,
                null,
                null,
                ContactsContract.Contacts.DISPLAY_NAME_PRIMARY + " ASC")) {
            if (cursor == null) {
                return names;
            }
            while (cursor.moveToNext()) {
                names.add(cursor.getString(0));
            }
        } catch (Throwable error) {
            Log.w(TAG, "Reading Android contacts failed", error);
        }
        return names;
    }

    static LinkedHashSet<String> selectNewNames(
            Collection<String> names,
            Set<String> alreadySeeded,
            int limit) {
        LinkedHashSet<String> picked = new LinkedHashSet<String>();
        if (limit <= 0 || names == null) {
            return picked;
        }
        Set<String> seen = new HashSet<String>();
        if (alreadySeeded != null) {
            for (String seededName : alreadySeeded) {
                if (seededName != null) {
                    seen.add(seededName.toLowerCase(Locale.ROOT));
                }
            }
        }
        for (String raw : names) {
            if (picked.size() >= limit) {
                break;
            }
            if (raw == null) {
                continue;
            }
            String name = raw.trim().replaceAll("\\s+", " ");
            if (name.isEmpty() || name.length() > MAX_NAME_LENGTH
                    || name.contains("@") || !hasLetter(name)) {
                continue;
            }
            if (seen.add(name.toLowerCase(Locale.ROOT))) {
                picked.add(name);
            }
        }
        return picked;
    }

    private static boolean hasLetter(String text) {
        for (int i = 0; i < text.length(); i++) {
            if (Character.isLetter(text.charAt(i))) {
                return true;
            }
        }
        return false;
    }
}
