package dev.jason.gboardpatches.extension.rambler;

import android.Manifest;
import android.content.Context;
import android.content.SharedPreferences;
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
 * Adds the phone's contact names to Rambler's voice correction list.
 *
 * <p>Names go into the same list the user edits under Rambler settings, so they can be reviewed
 * and deleted there. Each name is added once: a deleted name is remembered and never re-added,
 * and later starts only add contacts that are new since the last run.
 */
public final class GboardRamblerContactsRuntime {
    private static final String TAG = "MorpheRamblerContacts";
    private static final String PREFS = "morphe_rambler_contacts";
    /** Names Gboard's list has accepted. v1.66.0's "seeded_names" also held names that were never accepted. */
    private static final String SEEDED = "added_names";
    private static final String UNCONFIRMED_SEEDED = "seeded_names";
    /** Gboard's own import accepts entries up to this length. */
    static final int MAX_NAME_LENGTH = 64;
    /** Rambler receives the whole list with every request; keep the contact share bounded. */
    static final int MAX_NAMES = 1000;
    /**
     * Gboard registers the list's store some time after the keyboard starts and rebuilds it when its
     * flags change; until then additions are dropped. Keep trying for about two minutes.
     */
    static final int READY_ATTEMPTS = 60;
    static final long READY_INTERVAL_MS = 2000;

    private static final AtomicBoolean RUNNING = new AtomicBoolean();

    private GboardRamblerContactsRuntime() {
    }

    /**
     * Called by Parakeet when a voice session starts, so contact names reach the list without
     * ever using Rambler; returns immediately. Does nothing unless Rambler contact names is patched.
     */
    public static void onVoiceTypingStart(Context context) {
        if (wired()) {
            onRamblerStart(context);
        }
    }

    /** True once the patch has supplied Gboard's import call; the placeholder says false. */
    static boolean wired() {
        return false;
    }

    /** Called when Gboard's Rambler extension starts; returns immediately. */
    public static void onRamblerStart(Context context) {
        if (context == null || !RUNNING.compareAndSet(false, true)) {
            return;
        }
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Thread worker = new Thread(() -> {
            try {
                seed(app);
            } catch (Throwable error) {
                Log.w(TAG, "Adding contact names to Rambler failed", error);
            } finally {
                RUNNING.set(false);
            }
        }, "morphe-rambler-contacts");
        worker.setDaemon(true);
        worker.start();
    }

    private static void seed(Context context) throws InterruptedException {
        if (context.checkSelfPermission(Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
            Log.i(TAG, "Contacts access not granted; no contact names added");
            return;
        }
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (prefs.contains(UNCONFIRMED_SEEDED)) {
            prefs.edit().remove(UNCONFIRMED_SEEDED).apply();
        }
        Set<String> seeded = new HashSet<>(prefs.getStringSet(SEEDED, new HashSet<>()));
        LinkedHashSet<String> fresh = selectNewNames(readContactNames(context), seeded, MAX_NAMES - seeded.size());
        if (fresh.isEmpty()) {
            return;
        }
        if (!addWhenReady(() -> addToVoiceCorrectionList(context, fresh), READY_ATTEMPTS, READY_INTERVAL_MS)) {
            Log.w(TAG, "Voice correction list not ready; " + fresh.size() + " contact names will be added next start");
            return;
        }
        seeded.addAll(fresh);
        prefs.edit().putStringSet(SEEDED, seeded).apply();
        Log.i(TAG, "Added " + fresh.size() + " contact names to the voice correction list");
    }

    /** One attempt to hand the words to Gboard; false while its list is not ready. */
    interface Attempt {
        boolean run();
    }

    /** Runs {@code attempt} until it succeeds, at most {@code attempts} times, {@code intervalMs} apart. */
    static boolean addWhenReady(Attempt attempt, int attempts, long intervalMs) throws InterruptedException {
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
        List<String> names = new ArrayList<>();
        String[] projection = {ContactsContract.Contacts.DISPLAY_NAME_PRIMARY};
        try (Cursor cursor = context.getContentResolver().query(
                ContactsContract.Contacts.CONTENT_URI, projection, null, null,
                ContactsContract.Contacts.DISPLAY_NAME_PRIMARY + " ASC")) {
            if (cursor == null) {
                return names;
            }
            while (cursor.moveToNext()) {
                names.add(cursor.getString(0));
            }
        }
        return names;
    }

    /**
     * Picks contact names worth adding: trimmed, de-duplicated (ignoring case), within Gboard's
     * length limit, containing a letter and not an e-mail address or phone number, and not added
     * before. At most {@code limit} names are returned.
     */
    static LinkedHashSet<String> selectNewNames(Collection<String> names, Set<String> alreadySeeded, int limit) {
        LinkedHashSet<String> picked = new LinkedHashSet<>();
        Set<String> seen = new HashSet<>();
        for (String seededName : alreadySeeded) {
            seen.add(seededName.toLowerCase(Locale.ROOT));
        }
        for (String raw : names) {
            if (picked.size() >= limit) {
                break;
            }
            if (raw == null) {
                continue;
            }
            String name = raw.trim().replaceAll("\\s+", " ");
            if (name.isEmpty() || name.length() > MAX_NAME_LENGTH || name.contains("@") || !hasLetter(name)) {
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

    /**
     * Adds words exactly like the list's own Import action does, once the list's store can be read
     * the way its settings screen reads it. Returns false when the store is not ready, because Gboard
     * would silently drop the words. The patch replaces this body with Gboard's calls; unpatched it
     * adds nothing and reports not ready, so a mismatch can never write elsewhere.
     */
    static boolean addToVoiceCorrectionList(Context context, LinkedHashSet<String> words) {
        return false;
    }
}
