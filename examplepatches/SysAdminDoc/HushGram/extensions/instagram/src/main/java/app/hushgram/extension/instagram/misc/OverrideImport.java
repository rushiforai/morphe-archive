/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import android.app.Activity;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.TreeMap;
import java.util.TreeSet;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;

/**
 * Applies a validated overrides document through the typed native table Instagram's own override
 * editor writes, one parameter at a time.
 *
 * <p>Nothing reaches the native table while Allow importing overrides is off or HushGram is
 * paused, or until the document matches this exact build, schema and session, every changed
 * parameter's type agrees with Instagram's own decoder, the store's file reads the same twice a
 * settle window apart, and a last capture right before the first write still sees the same
 * manager, store and bytes. The previous overrides are saved first, outside the native store, under
 * a pending name that becomes the restore point only once the import applied or couldn't be put
 * back. After writing, the store is read back; if it doesn't hold the result, every change is put
 * back the same typed way. Nothing here writes the native file directly, imports a string, wipes
 * the table or reloads it.
 */
public final class OverrideImport {
    public enum Outcome {
        /** The document already matches the store. No native call was made. */
        UNCHANGED,
        /** The store now holds the document. Instagram applies it after a restart. */
        APPLIED,
        /** The store didn't take the change, and its previous values were put back and read back. */
        ROLLED_BACK,
        /** The store didn't take the change and the put-back couldn't be confirmed. Restore is armed. */
        UNRECOVERED,
        /**
         * Restore put back every change a typed writer can make and the store held them, but some
         * overrides hold Instagram's null value on one side, which no typed writer sets or clears.
         */
        PARTIAL
    }

    public static final class Result {
        public final Outcome outcome;
        /** Typed changes written and confirmed. */
        public final int changes;
        /** Overrides Restore couldn't put back because one side holds Instagram's null value. */
        public final int skipped;
        /** Whether imports for this store still wait for Restore or Discard. */
        public final boolean blocked;
        Result(Outcome outcome, int changes, int skipped, boolean blocked) {
            this.outcome = outcome; this.changes = changes; this.skipped = skipped; this.blocked = blocked;
        }
    }

    /** An earlier import couldn't be confirmed or put back, so only Restore or Discard may run for this store. */
    public static final class RestoreFirst extends IOException {
        RestoreFirst() { super("An earlier override import needs Restore"); }
    }

    /** There's no saved copy for this store. */
    public static final class NothingSaved extends IOException {
        NothingSaved() { super("No saved overrides for this store"); }
    }

    /** The saved copy doesn't pass Validate for this session, build and schema. */
    public static final class SavedCopyDoesntFit extends IOException {
        SavedCopyDoesntFit() { super("The saved overrides don't fit this store"); }
    }

    /** The store's file changed between two reads a settle window apart, so Instagram is still saving. */
    public static final class StoreChanging extends IOException {
        StoreChanging() { super("The native overrides are still changing"); }
    }

    /** Allow importing overrides is off, or HushGram is paused. */
    public static final class NotAllowed extends IOException {
        NotAllowed() { super("Override import is off"); }
    }

    static final int MAX_CHANGES = 512;
    static final String DIRECTORY = "hushgram-overrides";
    private static final String NULL = "__NULL_VALUE__";
    private static final long POLL_MILLIS = 50;
    /**
     * How long the native store gets to show a typed write in its file. Instagram's editor changes
     * the table first and the file after, so it's also how long two reads must agree before one is
     * trusted.
     */
    static long settleMillis = 3000;
    /** Syncs a directory after a file is moved into it. Replaced in tests, where Os isn't native. */
    static DirectorySync directorySync = OverrideImport::syncDirectory;
    private static final Object LOCK = new Object();

    interface DirectorySync {
        void sync(File directory) throws IOException;
    }

    private OverrideImport() {}

    /** Imports a document chosen by the user. Throws before any native call when it doesn't fit. */
    public static Result apply(Activity activity, byte[] document) throws IOException {
        return run(activity, document, false);
    }

    /**
     * Puts back the overrides saved before the last import into this session's store. What a
     * typed writer can't put back is counted in {@link Result#skipped}, not refused.
     */
    public static Result restore(Activity activity) throws IOException {
        return run(activity, null, true);
    }

    /**
     * Forgets this store's restore point and lets imports run again. Instagram's overrides aren't
     * touched. Answers whether there was anything to forget.
     */
    public static boolean discard(Activity activity) throws IOException {
        synchronized (LOCK) {
            allowed();
            return new Store(activity, OverrideExchange.capture(activity)).discard();
        }
    }

    private static final class Change {
        final OverrideExchange.Parameter parameter;
        final String before, after;
        Change(OverrideExchange.Parameter parameter, String before, String after) {
            this.parameter = parameter; this.before = before; this.after = after;
        }
    }

    /** The typed changes from one set of values to another, and how many can't be made. */
    private static final class Plan {
        final List<Change> changes = new ArrayList<>();
        int skipped;
    }

    private static Result run(Activity activity, byte[] document, boolean restoring) throws IOException {
        synchronized (LOCK) {
            allowed();
            OverrideExchange.Snapshot first = OverrideExchange.capture(activity);
            Store store = new Store(activity, first);
            boolean wasArmed = store.isArmed();
            if (restoring) document = store.restorePoint(wasArmed);
            else if (wasArmed) throw new RestoreFirst();
            Map<Long, String> target = new TreeMap<>();
            try { OverrideExchange.validated(document, first, target); }
            catch (IOException failure) { throw restoring ? new SavedCopyDoesntFit() : failure; }
            OverrideExchange.Snapshot before = settled(activity, first);
            Map<Long, String> current = OverrideExchange.values(bytes(before.raw), before);
            Plan plan = plan(before, current, target);
            if (!restoring) {
                // A null override has no typed writer, and the limit bounds the work and its rollback.
                if (plan.skipped > 0 || plan.changes.size() > MAX_CHANGES) throw invalid();
                // Restore must be able to undo this import with the same typed writes.
                Plan undo = plan(before, expected(current, plan.changes), current);
                if (undo.skipped > 0 || undo.changes.size() > MAX_CHANGES) throw invalid();
            }
            if (plan.changes.isEmpty()) {
                if (restoring) return restored(store, wasArmed, plan, Outcome.UNCHANGED);
                return new Result(Outcome.UNCHANGED, 0, 0, false);
            }
            try {
                for (Change change : plan.changes) {
                    if (DeveloperOptions.getOverrideTypeNative(change.parameter.nativeId) != change.parameter.type) throw invalid();
                }
            } catch (IOException mismatch) { throw mismatch; }
            catch (Throwable failure) { throw invalid(); }
            // The commit boundary: the same session manager, store, schema and bytes as planned.
            OverrideExchange.Snapshot now = OverrideExchange.capture(activity);
            unchanged(before, now);
            Object table;
            try { table = DeveloperOptions.getOverrideTableNative(now.manager); }
            catch (Throwable failure) { throw invalid(); }
            if (table == null) throw invalid();
            try {
                if (restoring) store.saveReplaced(OverrideExchange.export(before));
                else store.savePending(OverrideExchange.export(before));
                store.arm(before);
            } catch (IOException failure) {
                // Nothing was written, so the store keeps its restore point and its marker state.
                if (!restoring) store.dropPending();
                if (!wasArmed) store.settle();
                throw failure;
            }

            int reached = 0;
            boolean written = true;
            for (Change change : plan.changes) {
                reached++;
                if (!write(table, change.parameter, change.after)) { written = false; break; }
            }
            if (written && holds(now, expected(current, plan.changes))) {
                if (restoring) return restored(store, wasArmed, plan, Outcome.APPLIED);
                store.promote();
                store.settle();
                return new Result(Outcome.APPLIED, plan.changes.size(), 0, false);
            }
            // Put back everything that may have reached the table, the failed write included.
            boolean undone = true;
            for (int i = reached - 1; i >= 0; i--) {
                Change change = plan.changes.get(i);
                undone &= write(table, change.parameter, change.before);
            }
            if (undone && holds(now, current)) {
                // The store is as it was, and so is its restore point and whether it was armed.
                if (!restoring) store.dropPending();
                if (!restoring || !wasArmed) store.settle();
                return new Result(Outcome.ROLLED_BACK, 0, 0, wasArmed && restoring);
            }
            // This import's copy is now the only way back.
            if (!restoring) store.promote();
            return new Result(Outcome.UNRECOVERED, 0, 0, true);
        }
    }

    /**
     * A restore that held. When nothing was skipped the store matches its restore point again, so
     * it stops blocking imports; otherwise it keeps whatever it had, and a blocked store waits for
     * Discard.
     */
    private static Result restored(Store store, boolean wasArmed, Plan plan, Outcome held) {
        if (plan.skipped == 0) {
            store.restoredFully();
            return new Result(held, plan.changes.size(), 0, false);
        }
        if (!wasArmed) store.settle();
        return new Result(Outcome.PARTIAL, plan.changes.size(), plan.skipped, wasArmed);
    }

    /** Off or paused, nothing here reads or writes the native store. */
    private static void allowed() throws NotAllowed {
        if (!Utils.settingsReady() || !Settings.ALLOW_OVERRIDE_IMPORT.get()) throw new NotAllowed();
    }

    /**
     * Reads the store again a settle window after the first read and answers that second read
     * only when its file hasn't moved: a change Instagram's editor made just before is in the
     * table at once but in the file only later.
     */
    private static OverrideExchange.Snapshot settled(Activity activity, OverrideExchange.Snapshot first) throws IOException {
        try { Thread.sleep(settleMillis); }
        catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); throw invalid(); }
        OverrideExchange.Snapshot again = OverrideExchange.capture(activity);
        unchanged(first, again);
        return again;
    }

    private static void unchanged(OverrideExchange.Snapshot one, OverrideExchange.Snapshot other) throws IOException {
        if (other.manager != one.manager || !other.file.equals(one.file) || !OverrideExchange.sameSchema(other, one)) throw invalid();
        if (!Arrays.equals(other.raw, one.raw)) throw new StoreChanging();
    }

    /**
     * The typed changes from current to target. A null override has no typed writer, so a change
     * to or from one is skipped and counted.
     */
    private static Plan plan(OverrideExchange.Snapshot snapshot, Map<Long, String> current,
                             Map<Long, String> target) throws IOException {
        Plan plan = new Plan();
        TreeSet<Long> keys = new TreeSet<>(current.keySet());
        keys.addAll(target.keySet());
        for (long key : keys) {
            OverrideExchange.Parameter parameter = OverrideExchange.parameter(snapshot, key);
            if (parameter == null) throw invalid();
            String before = current.get(key), after = target.get(key);
            if (before != null && after != null && same(parameter.type, before, after)) continue;
            if (NULL.equals(before) || NULL.equals(after)) { plan.skipped++; continue; }
            plan.changes.add(new Change(parameter, before, after));
        }
        return plan;
    }

    private static Map<Long, String> expected(Map<Long, String> current, List<Change> changes) {
        Map<Long, String> expected = new TreeMap<>(current);
        for (Change change : changes) {
            if (change.after == null) expected.remove(key(change.parameter));
            else expected.put(key(change.parameter), change.after);
        }
        return expected;
    }

    /**
     * One typed write through the patched bridge. The cases follow Instagram's decoder codes, and
     * the patch proves its put sends each code to the same writer: 1 bool, 2 long, 3 string, 4 double.
     */
    private static boolean write(Object table, OverrideExchange.Parameter parameter, String value) {
        try {
            long id = parameter.nativeId;
            if (value == null) return DeveloperOptions.removeOverrideNative(table, id) == 1;
            switch (parameter.type) {
                case 1: return DeveloperOptions.setOverrideBooleanNative(table, id, "true".equals(value) ? 1 : 0) == 1;
                case 2: return DeveloperOptions.setOverrideLongNative(table, id, Long.parseLong(value)) == 1;
                case 3: return DeveloperOptions.setOverrideStringNative(table, id, value) == 1;
                case 4: return DeveloperOptions.setOverrideDoubleNative(table, id, Double.parseDouble(value)) == 1;
                default: return false;
            }
        } catch (Throwable failure) {
            // A native failure can carry a value or a session path. Keep only the verdict.
            return false;
        }
    }

    /** Waits for the store's own file to hold exactly these values, compared by type. */
    private static boolean holds(OverrideExchange.Snapshot snapshot, Map<Long, String> expected) {
        long deadline = System.nanoTime() + settleMillis * 1_000_000L;
        while (true) {
            try {
                byte[] bytes = null;
                if (snapshot.file.exists()) {
                    try (InputStream input = new FileInputStream(snapshot.file)) { bytes = OverrideExchange.read(input); }
                }
                if (same(snapshot, OverrideExchange.values(bytes(bytes), snapshot), expected)) return true;
            } catch (IOException | RuntimeException partial) {
                // The native writer may be partway through the file. Read it again.
            }
            if (System.nanoTime() - deadline >= 0) return false;
            try { Thread.sleep(POLL_MILLIS); }
            catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); return false; }
        }
    }

    private static boolean same(OverrideExchange.Snapshot snapshot, Map<Long, String> one, Map<Long, String> other) {
        if (!one.keySet().equals(other.keySet())) return false;
        for (Map.Entry<Long, String> entry : one.entrySet()) {
            OverrideExchange.Parameter parameter = OverrideExchange.parameter(snapshot, entry.getKey());
            if (parameter == null || !same(parameter.type, entry.getValue(), other.get(entry.getKey()))) return false;
        }
        return true;
    }

    private static boolean same(int type, String one, String other) {
        if (one.equals(other)) return true;
        if (NULL.equals(one) || NULL.equals(other)) return false;
        try {
            if (type == 2) return Long.parseLong(one) == Long.parseLong(other);
            if (type == 4) return Double.compare(Double.parseDouble(one), Double.parseDouble(other)) == 0;
        } catch (NumberFormatException failure) { return false; }
        return false;
    }

    private static long key(OverrideExchange.Parameter parameter) { return OverrideExchange.key(parameter.config, parameter.index); }
    private static byte[] bytes(byte[] raw) { return raw == null ? "{}".getBytes(StandardCharsets.UTF_8) : raw; }
    static IOException invalid() { return new IOException("Invalid or unavailable native overrides"); }

    /** Opens the directory and syncs it, so a file just moved into it is still there after a crash. */
    static void syncDirectory(File directory) throws IOException {
        FileDescriptor descriptor;
        try { descriptor = Os.open(directory.getPath(), OsConstants.O_RDONLY, 0); }
        catch (ErrnoException failure) { throw invalid(); }
        try { Os.fsync(descriptor); }
        catch (ErrnoException failure) { if (!syncUnsupported(failure.errno)) throw invalid(); }
        finally {
            try { Os.close(descriptor); } catch (ErrnoException ignored) { /* Read-only; the sync already answered. */ }
        }
    }

    /** A filesystem that can't sync a directory answers EINVAL or EROFS. Anything else means the move may not last. */
    static boolean syncUnsupported(int errno) {
        return errno == OsConstants.EINVAL || errno == OsConstants.EROFS;
    }

    /**
     * The files kept for one native store, named by a hash of its path so an account's copy never
     * applies to another, in Instagram's private files outside the native store. The restore point
     * is NAME.json. An import saves the previous overrides as NAME.pending.json and promotes it once
     * it applied or couldn't be put back. A restore saves what it's about to replace as
     * NAME.replaced.json. NAME.armed blocks imports until Restore or Discard. Every write is a
     * synced temporary file moved into place, and the directory is synced after the move.
     */
    private static final class Store {
        final File directory, backup, pending, replaced, armed;
        /** Set when Restore read the pending copy an interrupted or unpromoted import left. */
        boolean restoringPending;

        Store(Activity activity, OverrideExchange.Snapshot snapshot) throws IOException {
            directory = new File(activity.getFilesDir(), DIRECTORY);
            String name = sha256(snapshot.file.getPath());
            backup = new File(directory, name + ".json");
            pending = new File(directory, name + ".pending.json");
            replaced = new File(directory, name + ".replaced.json");
            armed = new File(directory, name + ".armed");
        }

        boolean isArmed() { return armed.exists(); }

        /**
         * The copy Restore puts back. An armed store whose import never promoted its copy (it
         * stopped partway, or the promotion failed) restores that pending copy, which holds the
         * overrides from just before it.
         */
        byte[] restorePoint(boolean wasArmed) throws IOException {
            restoringPending = wasArmed && pending.isFile();
            File source = restoringPending ? pending : backup;
            if (!source.isFile()) throw new NothingSaved();
            try (InputStream input = new FileInputStream(source)) { return OverrideExchange.read(input); }
        }

        void savePending(byte[] document) throws IOException { replace(pending, document); }
        void saveReplaced(byte[] document) throws IOException { replace(replaced, document); }
        void arm(OverrideExchange.Snapshot snapshot) throws IOException {
            replace(armed, String.valueOf(OverrideExchange.hostCode(snapshot)).getBytes(StandardCharsets.UTF_8));
        }

        /**
         * Makes the pending copy the restore point, after the outcome is already known. If the move
         * fails, the older restore point is removed so Restore can't put back the wrong overrides,
         * and an armed store still restores from the pending copy. A sync failure after the move
         * leaves nothing to undo: the writes are done and the copy is in place.
         */
        void promote() {
            try {
                Files.move(pending.toPath(), backup.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException | RuntimeException failure) {
                //noinspection ResultOfMethodCallIgnored
                backup.delete();
                return;
            }
            try { directorySync.sync(directory); }
            catch (IOException | RuntimeException failure) { /* See above: the outcome already stands. */ }
        }

        /** Best effort: a leftover pending copy is never read unless the store is armed. */
        void dropPending() {
            //noinspection ResultOfMethodCallIgnored
            pending.delete();
        }

        /**
         * Best effort, after the outcome is already known. A marker that won't go away only keeps
         * imports waiting for Restore or Discard, which is the safe side.
         */
        void settle() {
            //noinspection ResultOfMethodCallIgnored
            armed.delete();
        }

        /** The store matches its restore point again: a pending copy Restore read becomes it. */
        void restoredFully() {
            if (restoringPending) promote();
            settle();
        }

        /** Removes the restore point, any pending copy and the marker, the marker last. */
        boolean discard() throws IOException {
            boolean found = false;
            for (File file : new File[]{backup, pending, armed}) {
                if (!file.exists()) continue;
                found = true;
                if (!file.delete() && file.exists()) throw invalid();
            }
            return found;
        }

        private static void replace(File target, byte[] bytes) throws IOException {
            File directory = Objects.requireNonNull(target.getParentFile());
            if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) throw invalid();
            File temporary = new File(directory, target.getName() + ".tmp");
            try {
                try (FileOutputStream output = new FileOutputStream(temporary)) {
                    output.write(bytes);
                    output.getFD().sync();
                }
                Files.move(temporary.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException | RuntimeException failure) {
                //noinspection ResultOfMethodCallIgnored
                temporary.delete();
                throw invalid();
            }
            directorySync.sync(directory);
        }

        private static String sha256(String text) throws IOException {
            try {
                StringBuilder name = new StringBuilder();
                for (byte value : MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8))) {
                    name.append(String.format(Locale.ROOT, "%02x", value & 255));
                }
                return name.toString();
            } catch (Exception failure) { throw invalid(); }
        }
    }
}
