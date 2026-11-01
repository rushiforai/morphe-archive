package dev.jason.gboardpatches.extension.extendeddictionary;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/** Access to Gboard personal dictionary rows; failures surface as runtime exceptions. */
interface PersonalDictionaryGateway {
    boolean contains(String word, String shortcut, String localeTag);

    /**
     * Bit i is set when candidate i already exists (under its tag, or under the original tag of
     * an extended one) or repeats an earlier candidate. Decided by the database, not in memory.
     */
    java.util.BitSet duplicateOrExisting(List<ManagedEntryStore.Entry> candidates,
            ExtendedDictionaryImporter.Progress progress);

    /** True when row id still holds exactly this entry, including its ja-JP POS tag. */
    boolean exists(long id, String word, String shortcut, String localeTag, String posTag);

    /** Ids of the entries for which exists() holds, checked in one pass. */
    java.util.Set<Long> matchingIds(List<ManagedEntryStore.Entry> entries);

    /** Ids for which exists() fails, streaming entries that arrive in ascending id order. */
    java.util.Set<Long> mismatchedIds(java.util.Iterator<ManagedEntryStore.Entry> entriesById);

    /**
     * Inserts every entry in one transaction and returns their row ids in order. Nothing is
     * written when it throws; cancellation surfaces as a CancellationException.
     */
    long[] insertAll(List<ManagedEntryStore.Entry> entries,
            ExtendedDictionaryImporter.Progress progress, AtomicBoolean cancel);

    /**
     * In one transaction, deletes every managed entry (ascending id) except keepIds and, when
     * includeUntracked, every other extended-tag row that is neither kept nor released (failed
     * imports, or words the user added to an Extended section). POS rows go with their entries.
     * Returns {managed, untracked}.
     */
    int[] deleteImported(java.util.Iterator<ManagedEntryStore.Entry> managedById,
            java.util.Set<Long> keepIds, java.util.Set<Long> releasedIds,
            boolean includeUntracked, ExtendedDictionaryImporter.Progress progress, int total);

    /** Ids of Japanese extended-tag rows that have no POS row (read only, no lock held). */
    List<Long> japaneseExtendedIdsWithoutPos();

    /** Writes the given POS rows in one short transaction; returns how many were written. */
    int restorePos(java.util.Map<Long, String> posById);

    /** Extended-tag rows that are neither managed (ascending id) nor in excludedIds. */
    int countUntracked(java.util.Iterator<ManagedEntryStore.Entry> managedById,
            java.util.Set<Long> excludedIds);

    /** The subset of ids that still exist as dictionary rows. */
    java.util.Set<Long> existingIds(java.util.Collection<Long> ids);

    /** Deletes the given rows (and their POS rows) in one transaction. */
    void deleteAll(List<ManagedEntryStore.Entry> entries,
            ExtendedDictionaryImporter.Progress progress);

    /**
     * How many entries match no enabled input language by language and region (such rows reach
     * no engine), or -1 when the enabled languages cannot be determined.
     */
    int countWithoutEnabledLanguage(List<ManagedEntryStore.Entry> entries);

    /** The language tag exactly as Gboard stores it in the locale column. */
    String normalizedTag(String localeTag);
}
