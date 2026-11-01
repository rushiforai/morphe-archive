package dev.jason.gboardpatches.extension.extendeddictionary;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

/** Adds rows without adopting existing ones, and removes only rows that still match. */
final class ExtendedDictionaryImporter {
    static final String JAPANESE_LOCALE_TAG = "ja-JP";
    /**
     * Every imported row is stored under a BCP 47 private-use variant of its own tag (for example
     * en-US-x-extdict). Gboard's word list then shows the imported words as their own language
     * section (titled through GboardExtendedDictionaryRuntime) instead of mixing them into the
     * user's list, while the language subtag still routes them to the same input engines.
     * Rows already carrying the suffix (for example from a Gboard export) keep their tag; rows
     * without a language (all languages) cannot carry a variant and are stored unchanged.
     */
    static final String EXTENDED_TAG_SUFFIX = "-x-extdict";
    static final String EXTENDED_JA_TAG = JAPANESE_LOCALE_TAG + EXTENDED_TAG_SUFFIX;
    /** Gboard POS label for a noun; Mozc ignores ja-JP rows without a POS label. */
    static final String JAPANESE_DEFAULT_POS_TAG = new String(new int[] {0x540D, 0x8A5E}, 0, 2);

    static final class ImportResult {
        final int inserted;
        final int skippedExisting;
        final int failed;
        final boolean rolledBack;
        final int rollbackLeftovers;
        final boolean cancelled;
        /** ja-JP rows whose reading Mozc would never ingest (see isMozcReading). */
        final int skippedReading;
        /** Stored entries dropped because the user deleted or edited them in Gboard. */
        final int forgotten;
        /** Inserted rows matching no enabled input language (0 when that is unknown). */
        final int unmatchedLanguage;
        /** Managed rows given back their POS after Gboard's own Restore dropped it. */
        final int repairedPos;

        ImportResult(int inserted, int skippedExisting, int failed, boolean rolledBack,
                int rollbackLeftovers) {
            this(inserted, skippedExisting, failed, rolledBack, rollbackLeftovers, false);
        }

        ImportResult(int inserted, int skippedExisting, int failed, boolean rolledBack,
                int rollbackLeftovers, boolean cancelled) {
            this(inserted, skippedExisting, failed, rolledBack, rollbackLeftovers, cancelled,
                    0, 0, 0, 0);
        }

        private ImportResult(int inserted, int skippedExisting, int failed, boolean rolledBack,
                int rollbackLeftovers, boolean cancelled, int skippedReading, int forgotten,
                int unmatchedLanguage, int repairedPos) {
            this.inserted = inserted;
            this.skippedExisting = skippedExisting;
            this.failed = failed;
            this.rolledBack = rolledBack;
            this.rollbackLeftovers = rollbackLeftovers;
            this.cancelled = cancelled;
            this.skippedReading = skippedReading;
            this.forgotten = forgotten;
            this.unmatchedLanguage = unmatchedLanguage;
            this.repairedPos = repairedPos;
        }

        ImportResult withSkippedReading(int count) {
            return new ImportResult(inserted, skippedExisting, failed, rolledBack,
                    rollbackLeftovers, cancelled, count, forgotten, unmatchedLanguage,
                    repairedPos);
        }

        ImportResult withForgotten(int count) {
            return new ImportResult(inserted, skippedExisting, failed, rolledBack,
                    rollbackLeftovers, cancelled, skippedReading, count, unmatchedLanguage,
                    repairedPos);
        }

        ImportResult withUnmatchedLanguage(int count) {
            return new ImportResult(inserted, skippedExisting, failed, rolledBack,
                    rollbackLeftovers, cancelled, skippedReading, forgotten, Math.max(0, count),
                    repairedPos);
        }

        ImportResult withRepair(int repaired) {
            return new ImportResult(inserted, skippedExisting, failed, rolledBack,
                    rollbackLeftovers, cancelled, skippedReading, forgotten, unmatchedLanguage,
                    repaired);
        }
    }

    static final class RemoveResult {
        final int deleted;
        final int forgotten;
        final int failed;
        /** Extended-tag rows that no managed entry recorded (left by a failed import). */
        final int orphansDeleted;
        final int repairedPos;

        RemoveResult(int deleted, int forgotten, int failed) {
            this(deleted, forgotten, failed, 0, 0);
        }

        RemoveResult(int deleted, int forgotten, int failed, int orphansDeleted, int repaired) {
            this.deleted = deleted;
            this.forgotten = forgotten;
            this.failed = failed;
            this.orphansDeleted = orphansDeleted;
            this.repairedPos = repaired;
        }
    }

    interface Progress {
        void onProgress(int done, int total);
    }

    /** Job-level progress: every phase reports its own units, and expected units ahead. */
    interface JobProgress {
        void expect(PhasedEta.Phase phase, long units);

        void onProgress(PhasedEta.Phase phase, int done, int total);

        /** The job did what it was asked (not cancelled, not rolled back, no error). */
        default void succeeded() {
        }

        /** A throttled per-unit callback for one phase. */
        default Progress phase(PhasedEta.Phase phase) {
            return new ProgressThrottle((done, total) -> onProgress(phase, done, total));
        }

        /** Adapts a plain callback that only wants one phase. */
        static JobProgress only(PhasedEta.Phase wanted, Progress progress) {
            return new JobProgress() {
                @Override
                public void expect(PhasedEta.Phase phase, long units) {
                }

                @Override
                public void onProgress(PhasedEta.Phase phase, int done, int total) {
                    if (phase == wanted) {
                        progress.onProgress(done, total);
                    }
                }
            };
        }
    }

    /** Passes on every PROGRESS_ROW_STEP rows, after PROGRESS_INTERVAL_NANOS, or at the end. */
    static final class ProgressThrottle implements Progress {
        static final int PROGRESS_ROW_STEP = 250;
        static final long PROGRESS_INTERVAL_NANOS = 200_000_000L;

        private final Progress progress;
        private int lastDone;
        private long lastNanos = System.nanoTime();

        ProgressThrottle(Progress progress) {
            this.progress = progress;
        }

        @Override
        public void onProgress(int done, int total) {
            long now = System.nanoTime();
            if (done == total || done - lastDone >= PROGRESS_ROW_STEP
                    || (done > lastDone && now - lastNanos >= PROGRESS_INTERVAL_NANOS)) {
                lastDone = done;
                lastNanos = now;
                progress.onProgress(done, total);
            }
        }
    }

    private ExtendedDictionaryImporter() {
    }

    static String posTagFor(WordListParser.Row row) {
        if (!isJapanese(row)) {
            return "";
        }
        return row.posTag.isEmpty() ? JAPANESE_DEFAULT_POS_TAG : row.posTag;
    }

    static ImportResult importRows(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            List<WordListParser.Row> rows) {
        return importRows(gateway, store, rows, (done, total) -> {
        }, new AtomicBoolean());
    }

    static ImportResult importRows(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            List<WordListParser.Row> rows, Progress progress, AtomicBoolean cancel) {
        return importRows(gateway, store, rows,
                JobProgress.only(PhasedEta.Phase.INSERT, progress), cancel);
    }

    static ImportResult importRows(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            List<WordListParser.Row> rows, JobProgress progress, AtomicBoolean cancel) {
        List<WordListParser.Row> accepted = new ArrayList<>(rows.size());
        for (WordListParser.Row row : rows) {
            if (!isJapanese(row) || isMozcReading(row.shortcut)) {
                accepted.add(withExtendedTag(gateway, row));
            }
        }
        return importAccepted(gateway, store, accepted, progress, cancel)
                .withSkippedReading(rows.size() - accepted.size());
    }

    static boolean isExtendedTag(String localeTag) {
        return localeTag != null && localeTag.regionMatches(true,
                localeTag.length() - EXTENDED_TAG_SUFFIX.length(), EXTENDED_TAG_SUFFIX, 0,
                EXTENDED_TAG_SUFFIX.length());
    }

    private static WordListParser.Row withExtendedTag(PersonalDictionaryGateway gateway,
            WordListParser.Row row) {
        if (row.localeTag.isEmpty() || isExtendedTag(row.localeTag)) {
            return row;
        }
        return new WordListParser.Row(row.shortcut, row.word,
                gateway.normalizedTag(row.localeTag) + EXTENDED_TAG_SUFFIX, row.posTag);
    }

    private static boolean isJapanese(WordListParser.Row row) {
        return isJapaneseLanguage(row.localeTag);
    }

    /** True when the tag's language subtag is "ja" (ja, ja-JP, ja-JP-x-extdict, ...). */
    static boolean isJapaneseLanguage(String localeTag) {
        if (localeTag == null) {
            return false;
        }
        int end = localeTag.indexOf('-');
        int underscore = localeTag.indexOf('_');
        if (end < 0 || (underscore >= 0 && underscore < end)) {
            end = underscore;
        }
        return (end < 0 ? localeTag : localeTag.substring(0, end)).equalsIgnoreCase("ja");
    }

    /**
     * Mirrors Gboard 18.5.4 iis.d(), the filter its Mozc shortcuts handler applies to
     * each reading: non-empty, at most 256 chars, and only these code points.
     */
    static boolean isMozcReading(String reading) {
        if (reading == null || reading.isEmpty() || reading.length() > 256) {
            return false;
        }
        for (int index = 0; index < reading.length(); ) {
            int c = reading.codePointAt(index);
            boolean allowed = (c >= 0x21 && c <= 0x7E) // printable ASCII
                    || (c >= 0x3041 && c <= 0x3096) // hiragana
                    || (c >= 0x309B && c <= 0x309C) // (han)dakuten
                    || (c >= 0x30A1 && c <= 0x30F6) // katakana
                    || (c >= 0x30FB && c <= 0x30FC) // middle dot, prolonged sound mark
                    || (c >= 0x3001 && c <= 0x3002) // ideographic comma and full stop
                    || (c >= 0x300C && c <= 0x300F) // corner brackets
                    || c == 0x301C // wave dash
                    || (c >= 0xFF01 && c <= 0xFF5E) // full-width ASCII
                    || (c >= 0xFF61 && c <= 0xFF9F); // half-width katakana and punctuation
            if (!allowed) {
                return false;
            }
            index += Character.charCount(c);
        }
        return true;
    }

    private static ImportResult importAccepted(PersonalDictionaryGateway gateway,
            ManagedEntryStore store, List<WordListParser.Row> rows, JobProgress progress,
            AtomicBoolean cancel) {
        // Rows the user deleted or edited in Gboard are no longer ours; their rowids may be
        // reused by this very import, so they must leave the store first.
        // Streamed: the managed list can hold hundreds of thousands of rows, so it is never
        // materialised; only the (usually few) ids to forget are kept.
        int repair = repair(gateway, store, progress);
        int storedCount = store.count();
        progress.expect(PhasedEta.Phase.RECONCILE, storedCount);
        progress.expect(PhasedEta.Phase.DEDUPE, rows.size());
        progress.expect(PhasedEta.Phase.INSERT, rows.size());
        progress.expect(PhasedEta.Phase.STORE_WRITE, rows.size());
        Set<Long> forgottenIds;
        try (ManagedEntryStore.EntryCursor stored = store.iterateById()) {
            forgottenIds = gateway.mismatchedIds(counting(stored,
                    progress.phase(PhasedEta.Phase.RECONCILE), storedCount));
        }
        int forgotten = forgottenIds.size();
        Set<Long> goneReleasedIds = goneReleasedIds(gateway, store);
        List<ManagedEntryStore.Entry> candidates = new ArrayList<>(rows.size());
        for (WordListParser.Row row : rows) {
            candidates.add(new ManagedEntryStore.Entry(
                    -1L, row.word, row.shortcut, row.localeTag, posTagFor(row)));
        }
        // SQLite decides what already exists, so no in-memory copy of the dictionary is needed.
        java.util.BitSet skip = gateway.duplicateOrExisting(
                candidates, progress.phase(PhasedEta.Phase.DEDUPE));
        int skipped = skip.cardinality();
        List<ManagedEntryStore.Entry> pending = new ArrayList<>(candidates.size() - skipped);
        for (int index = 0; index < candidates.size(); index++) {
            if (!skip.get(index)) {
                pending.add(candidates.get(index));
            }
        }
        candidates = null;
        progress.expect(PhasedEta.Phase.INSERT, pending.size());
        progress.expect(PhasedEta.Phase.STORE_WRITE, pending.size());
        progress.onProgress(PhasedEta.Phase.INSERT, 0, pending.size());
        if (pending.isEmpty()) {
            if (forgotten > 0 || !goneReleasedIds.isEmpty()) {
                store.update(forgottenIds, Collections.emptyList(), goneReleasedIds);
            }
            return new ImportResult(0, skipped, 0, false, 0).withForgotten(forgotten)
                    .withRepair(repair);
        }
        long[] ids;
        try {
            ids = gateway.insertAll(pending, progress.phase(PhasedEta.Phase.INSERT), cancel);
        } catch (CancellationException cancelled) {
            return new ImportResult(0, skipped, 0, false, 0, true).withRepair(repair);
        } catch (RuntimeException failure) {
            return new ImportResult(0, skipped, 0, true, 0).withRepair(repair);
        }
        List<ManagedEntryStore.Entry> inserted = new ArrayList<>(pending.size());
        for (int index = 0; index < pending.size(); index++) {
            ManagedEntryStore.Entry entry = pending.get(index);
            inserted.add(new ManagedEntryStore.Entry(ids[index], entry.word, entry.shortcut,
                    entry.localeTag, entry.posTag));
        }
        pending = null;
        try {
            // Record first: the ids come from our own committed inserts, so they are
            // authoritative and need no read-back before the store knows about them.
            store.update(forgottenIds, inserted, goneReleasedIds,
                    progress.phase(PhasedEta.Phase.STORE_WRITE));
        } catch (Throwable failure) {
            // Committed but not recorded: anything here, including OutOfMemoryError, must
            // undo the rows or they would stay behind as untracked extended-tag rows.
            return new ImportResult(0, skipped, 0, true, rollBack(gateway, inserted))
                    .withRepair(repair);
        }
        return new ImportResult(inserted.size(), skipped, 0, false, 0)
                .withForgotten(forgotten)
                .withUnmatchedLanguage(countWithoutEnabledLanguage(gateway, inserted))
                .withRepair(repair);
    }

    /**
     * Gives managed Japanese rows back the POS that Gboard's own Restore drops. Only managed
     * rows are touched: unmanaged extended rows (including copies Restore added) are the user's
     * business and only an explicit "Remove all" deletes them.
     */
    private static int repair(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            JobProgress progress) {
        List<Long> missing = gateway.japaneseExtendedIdsWithoutPos();
        progress.expect(PhasedEta.Phase.REPAIR, missing.size());
        Progress phase = progress.phase(PhasedEta.Phase.REPAIR);
        phase.onProgress(0, missing.size());
        java.util.Map<Long, ManagedEntryStore.Entry> tracked = store.entriesOf(missing, phase);
        // Only rows still holding what was recorded (word, reading, tag; their POS is the part
        // that is missing): a user row that reused a managed rowid is never touched.
        List<ManagedEntryStore.Entry> withoutPos = new ArrayList<>(tracked.size());
        for (ManagedEntryStore.Entry entry : tracked.values()) {
            if (entry.posTag != null && !entry.posTag.isEmpty()) {
                withoutPos.add(new ManagedEntryStore.Entry(
                        entry.id, entry.word, entry.shortcut, entry.localeTag, ""));
            }
        }
        java.util.Map<Long, String> restore = new java.util.HashMap<>();
        if (!withoutPos.isEmpty()) {
            for (long id : gateway.matchingIds(withoutPos)) {
                restore.put(id, tracked.get(id).posTag);
            }
        }
        phase.onProgress(missing.size(), missing.size());
        return gateway.restorePos(restore);
    }

    /** Released ids whose rows the user has since deleted; they leave the released set. */
    private static Set<Long> goneReleasedIds(PersonalDictionaryGateway gateway,
            ManagedEntryStore store) {
        Set<Long> released = store.releasedIds();
        if (released.isEmpty()) {
            return released;
        }
        Set<Long> gone = new HashSet<>(released);
        gone.removeAll(gateway.existingIds(released));
        return gone;
    }

    /** Extended-tag rows that are neither managed nor released, for the Remove prompt. */
    static int countUntracked(PersonalDictionaryGateway gateway, ManagedEntryStore store) {
        Set<Long> released = store.releasedIds();
        try (ManagedEntryStore.EntryCursor managed = store.iterateById()) {
            return gateway.countUntracked(managed, released);
        }
    }

    /** The given entries whose rows still hold exactly what was recorded, in order. */
    private static List<ManagedEntryStore.Entry> matching(PersonalDictionaryGateway gateway,
            List<ManagedEntryStore.Entry> entries) {
        Set<Long> ids = gateway.matchingIds(entries);
        List<ManagedEntryStore.Entry> result = new ArrayList<>(ids.size());
        for (ManagedEntryStore.Entry entry : entries) {
            if (ids.contains(entry.id)) {
                result.add(entry);
            }
        }
        return result;
    }

    static RemoveResult removeAll(PersonalDictionaryGateway gateway, ManagedEntryStore store) {
        return removeAll(gateway, store, (done, total) -> {
        }, false);
    }

    static RemoveResult removeAll(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            Progress progress) {
        return removeAll(gateway, store, progress, false);
    }

    /**
     * Deletes the managed rows that still match; changed ones are released to the user. Only
     * with includeUntracked are other extended-tag rows (not managed, not released) deleted too.
     */
    static RemoveResult removeAll(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            Progress progress, boolean includeUntracked) {
        return removeAll(gateway, store,
                JobProgress.only(PhasedEta.Phase.DELETE, progress), includeUntracked);
    }

    static RemoveResult removeAll(PersonalDictionaryGateway gateway, ManagedEntryStore store,
            JobProgress progress, boolean includeUntracked) {
        int repair;
        try {
            repair = repair(gateway, store, progress);
        } catch (RuntimeException failure) {
            return new RemoveResult(0, 0, store.count());
        }
        int stored = store.count();
        progress.expect(PhasedEta.Phase.RECONCILE, stored);
        progress.expect(PhasedEta.Phase.DELETE, stored);
        int[] counts;
        Set<Long> forgottenIds;
        try {
            try (ManagedEntryStore.EntryCursor managed = store.iterateById()) {
                forgottenIds = gateway.mismatchedIds(counting(managed,
                        progress.phase(PhasedEta.Phase.RECONCILE), stored));
            }
            Set<Long> released = store.releasedIds();
            int total = stored - forgottenIds.size();
            progress.onProgress(PhasedEta.Phase.DELETE, 0, total);
            try (ManagedEntryStore.EntryCursor managed = store.iterateById()) {
                counts = gateway.deleteImported(managed, forgottenIds, released,
                        includeUntracked, progress.phase(PhasedEta.Phase.DELETE), total);
            }
        } catch (RuntimeException failure) {
            // Nothing was committed: every managed entry stays recorded for a later retry.
            return new RemoveResult(0, 0, stored);
        }
        store.clearAndRelease(forgottenIds);
        return new RemoveResult(counts[0], forgottenIds.size(), 0, counts[1], repair);
    }

    /** Reports each element taken from source as one unit of a phase. */
    private static <T> java.util.Iterator<T> counting(java.util.Iterator<T> source,
            Progress progress, int total) {
        progress.onProgress(0, total);
        return new java.util.Iterator<T>() {
            private int taken;

            @Override
            public boolean hasNext() {
                boolean more = source.hasNext();
                if (!more) {
                    progress.onProgress(total, total);
                }
                return more;
            }

            @Override
            public T next() {
                T next = source.next();
                progress.onProgress(Math.min(++taken, total), total);
                return next;
            }
        };
    }

    /** Informational only: never fails an import that has already been committed. */
    private static int countWithoutEnabledLanguage(PersonalDictionaryGateway gateway,
            List<ManagedEntryStore.Entry> inserted) {
        try {
            return inserted.isEmpty() ? 0 : gateway.countWithoutEnabledLanguage(inserted);
        } catch (Throwable failure) {
            return -1;
        }
    }

    private static int rollBack(PersonalDictionaryGateway gateway,
            List<ManagedEntryStore.Entry> inserted) {
        try {
            gateway.deleteAll(matching(gateway, inserted), (done, total) -> {
            });
            return 0;
        } catch (Throwable failure) {
            return inserted.size();
        }
    }
}
