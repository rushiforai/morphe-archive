/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.UriPermission;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.DocumentsContract;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Keeps Android 9 destination facts, never permission to delete, resume or append a file. */
public final class PendingSaveJournal {
    static final int LIMIT = 16;
    static final String STORE = "hushpinterest_pending_saves";
    static final String RECORDS = "destinations_v1";
    private static final int MODES = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;
    private static final int URI_LIMIT = 2048;
    private static final int TEXT_LIMIT = 48 * 1024;
    private static final Object LOCK = new Object();
    // A durable pending record and a volatile live worker are different facts. After process
    // loss even a file whose close succeeded might still have only its pending record on disk.
    private static final Set<Long> ACTIVE = new HashSet<>();
    private static Context activeContext;

    private final Context app;
    private final ContentResolver resolver;
    private final SharedPreferences preferences;

    PendingSaveJournal(Context context) {
        app = application(context);
        resolver = app.getContentResolver();
        preferences = app.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    public enum State { SAVING, INTERRUPTED, MISSING, ACCESS_LOST, UNAVAILABLE, RELEASE_PENDING }

    public static final class FullHistoryException extends IOException {
        private FullHistoryException() {
            super("Save history is full. Remove an old entry before saving another pin.");
        }
    }

    /** The caller keeps this token only for the current worker. It contains no media URL. */
    public static final class Ticket {
        public final long id;
        private final Context app;
        private Ticket(Context app, long id) { this.app = app; this.id = id; }
    }

    public static final class Entry {
        public final long id;
        public final long createdAt;
        public final State state;

        private Entry(Record record, State state) {
            id = record.id;
            createdAt = record.createdAt;
            this.state = state;
        }

        public String statusText() {
            switch (state) {
                case SAVING: return L10n.t("Saving");
                case INTERRUPTED: return L10n.t("Interrupted");
                case MISSING: return L10n.t("Missing");
                case ACCESS_LOST: return L10n.t("Access unavailable");
                case RELEASE_PENDING: return L10n.t("Save cleanup pending");
                default: return L10n.t("Unavailable");
            }
        }

        public String guidanceText() {
            switch (state) {
                case SAVING: return L10n.t("This save is still running. Try again when it's finished.");
                case ACCESS_LOST:
                case UNAVAILABLE: return L10n.t("Couldn't check your chosen save location. Open your Files app to inspect it.");
                case RELEASE_PENDING: return L10n.t("Save cleanup couldn't be confirmed. The file was kept. Try removing this history entry again.");
                default: return L10n.t("Check your chosen save location before saving again. HushPinterest won't resume or delete this file.");
            }
        }
    }

    private static final class Record {
        final long id, createdAt;
        final Uri destination;
        final int ownedModes;
        final boolean terminal;

        Record(long id, long createdAt, Uri destination, int ownedModes, boolean terminal) {
            this.id = id;
            this.createdAt = createdAt;
            this.destination = destination;
            this.ownedModes = ownedModes;
            this.terminal = terminal;
        }

        Record terminal() { return new Record(id, createdAt, destination, ownedModes, true); }
    }

    /** Must run on the save worker before opening the destination, including before "w". */
    public static Ticket begin(Context context, Uri destination, int offeredFlags) throws IOException {
        if (context == null || Build.VERSION.SDK_INT != 28 || !Utils.isMainProcess()) {
            throw new IOException("Android 9 save journal unavailable");
        }
        try { return new PendingSaveJournal(context).beginNow(destination, offeredFlags); }
        catch (RuntimeException failure) {
            report("record chosen save location", failure);
            throw new IOException("Couldn't record the save location. No file data was written.", failure);
        }
    }

    /** Call only after PinTransfer.save returns successfully, including a successful close. */
    public static boolean completed(Context context, Ticket ticket) {
        interrupted(context, ticket);
        try { return context != null && new PendingSaveJournal(context).completedNow(ticket); }
        catch (RuntimeException failure) { report("finish chosen save journal", failure); return false; }
    }

    /** End the volatile worker claim. This does not claim incompleteness or touch its file. */
    public static void interrupted(Context context, Ticket ticket) {
        if (context == null || ticket == null || ticket.app != application(context)) return;
        synchronized (LOCK) { if (activeContext == ticket.app) ACTIVE.remove(ticket.id); }
    }

    /** A missing live worker marks pending records interrupted even if the file looks complete. */
    public static void onStart(Context context) { if (Build.VERSION.SDK_INT == 28) refresh(context, null); }

    /** Main-thread callback. Null means the journal couldn't be loaded or work was refused. */
    public static boolean refresh(Context context, Consumer<List<Entry>> after) {
        AtomicReference<List<Entry>> result = new AtomicReference<>();
        return schedule(context, journal -> result.set(journal.reconcile()),
                after == null ? null : () -> after.accept(result.get()),
                L10n.t("Couldn't check your chosen save location. Open your Files app to inspect it."));
    }

    /** Removes private facts and owned retained access, never the document itself. */
    public static boolean forget(Context context, long id, Runnable after) {
        return schedule(context, journal -> {
            boolean removed = journal.forgetNow(id);
            Utils.showToastLong(L10n.t(removed ? "Save history removed. The file was kept."
                    : "Save cleanup couldn't be confirmed. The file was kept. Try removing this history entry again."));
        }, after, L10n.t("Couldn't remove this history entry. Try again."));
    }

    Ticket beginNow(Uri destination, int offeredFlags) throws IOException {
        if (!validDestination(destination)) throw new IllegalArgumentException("Save location is not a document");
        synchronized (LOCK) {
            List<Record> records = load();
            if (records.size() == LIMIT) throw new FullHistoryException();
            for (Record record : records) if (record.destination.equals(destination)) {
                throw new IllegalStateException("Save location already has a pending record");
            }
            int offered = (offeredFlags & Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION) == 0 ? 0 : offeredFlags & MODES;
            int owned = 0;
            if (offered != 0) {
                try { owned = offered & ~persistedModes(destination); }
                catch (RuntimeException unavailable) {
                    // Without a baseline we cannot distinguish a host grant from one we own.
                    report("check existing save access", unavailable);
                }
            }
            long id;
            do { id = UUID.randomUUID().getMostSignificantBits() & Long.MAX_VALUE; }
            while (id == 0 || find(records, id) != null);
            Record record = new Record(id, Math.max(1, System.currentTimeMillis()), destination, owned, false);
            records.add(0, record);
            // Journal the proposed grant delta before taking it. Death on either side of the
            // binder call keeps enough facts to release only these previously absent modes.
            store(records);
            if (owned != 0) {
                try { resolver.takePersistableUriPermission(destination, owned); }
                catch (RuntimeException unavailable) { report("retain offered save access", unavailable); }
            }
            if (activeContext != app) { ACTIVE.clear(); activeContext = app; }
            ACTIVE.add(id);
            return new Ticket(app, id);
        }
    }

    boolean completedNow(Ticket ticket) {
        if (ticket == null || ticket.app != app) return false;
        synchronized (LOCK) {
            if (activeContext == app) ACTIVE.remove(ticket.id);
            List<Record> records = load();
            Record record = find(records, ticket.id);
            if (record == null) return true;
            Record terminal = record.terminal();
            records.set(records.indexOf(record), terminal);
            // Persist before release. Death after a successful close but before this commit
            // leaves an interrupted record; death afterwards can safely finish releasing access.
            store(records);
            return retire(records, terminal);
        }
    }

    boolean forgetNow(long id) {
        synchronized (LOCK) {
            if (activeContext == app && ACTIVE.contains(id)) {
                throw new IllegalStateException("This save is still running. Try again when it's finished.");
            }
            List<Record> records = load();
            Record record = find(records, id);
            if (record == null) return true;
            Record terminal = record.terminal();
            records.set(records.indexOf(record), terminal);
            store(records);
            return retire(records, terminal);
        }
    }

    List<Entry> reconcile() {
        synchronized (LOCK) {
            List<Record> records = load();
            List<Entry> entries = new ArrayList<>();
            for (Record record : new ArrayList<>(records)) {
                if (activeContext == app && ACTIVE.contains(record.id)) {
                    entries.add(new Entry(record, State.SAVING));
                } else if (record.terminal) {
                    if (!retire(records, record)) entries.add(new Entry(record, State.RELEASE_PENDING));
                } else {
                    entries.add(new Entry(record, inspect(record)));
                }
            }
            return Collections.unmodifiableList(entries);
        }
    }

    private State inspect(Record record) {
        int modes;
        try { modes = persistedModes(record.destination); }
        catch (RuntimeException unavailable) { report("check retained save access", unavailable); return State.UNAVAILABLE; }
        if ((modes & Intent.FLAG_GRANT_READ_URI_PERMISSION) == 0) return State.ACCESS_LOST;
        try {
            try (Cursor cursor = resolver.query(record.destination,
                    new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, null, null, null)) {
                if (cursor == null) return State.UNAVAILABLE;
                if (!cursor.moveToFirst()) return State.MISSING;
                int column = cursor.getColumnIndexOrThrow(DocumentsContract.Document.COLUMN_DOCUMENT_ID);
                return DocumentsContract.getDocumentId(record.destination).equals(cursor.getString(column))
                        ? State.INTERRUPTED : State.UNAVAILABLE;
            }
        } catch (SecurityException revoked) { return State.ACCESS_LOST; }
        catch (RuntimeException unavailable) { report("check interrupted save location", unavailable); return State.UNAVAILABLE; }
    }

    private boolean retire(List<Record> records, Record record) {
        try {
            if (record.ownedModes != 0) {
                int retained = persistedModes(record.destination) & record.ownedModes;
                if (retained != 0) resolver.releasePersistableUriPermission(record.destination, retained);
            }
            records.remove(record);
            store(records);
            return true;
        } catch (RuntimeException unavailable) {
            report("release chosen save access", unavailable);
            return false;
        }
    }

    private int persistedModes(Uri destination) {
        int modes = 0;
        List<UriPermission> permissions = resolver.getPersistedUriPermissions();
        if (permissions == null) throw new IllegalStateException("Save access query unavailable");
        for (UriPermission permission : permissions) if (destination.equals(permission.getUri())) {
            if (permission.isReadPermission()) modes |= Intent.FLAG_GRANT_READ_URI_PERMISSION;
            if (permission.isWritePermission()) modes |= Intent.FLAG_GRANT_WRITE_URI_PERMISSION;
        }
        return modes;
    }

    private List<Record> load() {
        try {
            String text = preferences.getString(RECORDS, "[]");
            if (text == null || text.length() > TEXT_LIMIT) throw new IllegalStateException("Save journal exceeds its bound");
            JSONArray json = new JSONArray(text);
            if (json.length() > LIMIT) throw new IllegalStateException("Too many pending saves");
            List<Record> records = new ArrayList<>();
            for (int i = 0; i < json.length(); i++) {
                JSONArray row = json.getJSONArray(i);
                if (row.length() != 5 || !integer(row.get(0)) || !integer(row.get(1))
                        || !(row.get(2) instanceof String) || !(row.get(3) instanceof Integer) || !(row.get(4) instanceof Boolean)) {
                    throw new IllegalStateException("Malformed pending save");
                }
                long id = row.getLong(0), created = row.getLong(1);
                Uri destination = Uri.parse(row.getString(2));
                int owned = row.getInt(3);
                if (id <= 0 || created <= 0 || !validDestination(destination) || (owned & ~MODES) != 0 ||
                        find(records, id) != null) throw new IllegalStateException("Invalid pending save");
                for (Record record : records) if (record.destination.equals(destination)) {
                    throw new IllegalStateException("Duplicate pending destination");
                }
                records.add(new Record(id, created, destination, owned, row.getBoolean(4)));
            }
            return records;
        } catch (JSONException malformed) { throw new IllegalStateException("Malformed save journal", malformed); }
    }

    private void store(List<Record> records) {
        JSONArray json = new JSONArray();
        for (Record record : records) json.put(new JSONArray().put(record.id).put(record.createdAt)
                .put(record.destination.toString()).put(record.ownedModes).put(record.terminal));
        if (!preferences.edit().putString(RECORDS, json.toString()).commit()) {
            throw new IllegalStateException("Save journal write failed");
        }
    }

    private static Record find(List<Record> records, long id) {
        for (Record record : records) if (record.id == id) return record;
        return null;
    }

    private static boolean integer(Object value) { return value instanceof Long || value instanceof Integer; }

    private static boolean validDestination(Uri destination) {
        if (destination == null || !"content".equals(destination.getScheme()) || !destination.isHierarchical()
                || destination.toString().length() > URI_LIMIT || destination.getAuthority() == null
                || destination.getAuthority().isEmpty() || destination.getQuery() != null || destination.getFragment() != null) return false;
        try { return !DocumentsContract.getDocumentId(destination).isEmpty(); }
        catch (IllegalArgumentException malformed) { return false; }
    }

    private static boolean schedule(Context context, Consumer<PendingSaveJournal> work, Runnable after, String error) {
        Runnable callback = () -> {
            if (after != null) {
                try { after.run(); }
                catch (RuntimeException failure) { report("deliver chosen save history", failure); }
            }
        };
        if (context == null || Build.VERSION.SDK_INT != 28 || !Utils.isMainProcess()) {
            Utils.runOnMainThread(callback);
            return false;
        }
        boolean queued = Utils.runOnBackgroundThread(() -> {
            try { work.accept(new PendingSaveJournal(context)); }
            catch (RuntimeException failure) { report("update chosen save history", failure); Utils.showToastLong(error); }
            finally { Utils.runOnMainThread(callback); }
        });
        if (!queued) {
            report("schedule chosen save history", new IllegalStateException("Worker unavailable"));
            Utils.showToastLong(error);
            Utils.runOnMainThread(callback);
        }
        return queued;
    }

    private static Context application(Context context) {
        Context app = context.getApplicationContext();
        return app == null ? context : app;
    }

    private static void report(String action, RuntimeException failure) {
        HookStatus.threw(FamilyNames.DOWNLOAD_PINS, action, failure);
    }
}
