package samsungcompat.sync;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.UUID;

/**
 * Decides what one sync run does, with no files, Android or clock. Version vectors order edits, so device
 * clocks don't matter; the losing side of a conflict becomes a copy whose UUID comes from its content.
 */
public final class SyncPlanner {
    public static final String CONFLICT_SUFFIX = " (conflict copy)";

    /** Current state of a note in this app. {@code deleted} means it is in the trash. */
    public static final class LocalNote {
        public final String uuid;
        public final String hash;
        public final String title;
        public final String categoryUuid;
        public final long createdAt;
        public final long modifiedAt;
        public final boolean favorite;
        public final boolean deleted;
        public final long deletedAt;

        public LocalNote(String uuid, String hash, String title, String categoryUuid,
                         long createdAt, long modifiedAt, boolean favorite, boolean deleted,
                         long deletedAt) {
            this.uuid = uuid;
            this.hash = hash;
            this.title = title;
            this.categoryUuid = categoryUuid;
            this.createdAt = createdAt;
            this.modifiedAt = modifiedAt;
            this.favorite = favorite;
            this.deleted = deleted;
            this.deletedAt = deletedAt;
        }

        NoteRecord toRecord(VersionVector version) {
            return new NoteRecord(uuid, hash, version, title, categoryUuid, createdAt,
                modifiedAt, favorite, deleted, deletedAt);
        }
    }

    /** Which payloads ({@code notes/<uuid>/<hash>.sdocx}) are already in the shared folder. */
    public interface PayloadStore {
        boolean has(String uuid, String hash);
    }

    public enum ActionType {
        /** Copy this device's current file for {@code record.uuid} to the payload {@code record.hash}. */
        PUBLISH,
        /** Bring the local note to {@code record}: content (if {@code contentChanged}), metadata, trash state. */
        APPLY,
        /** Import payload {@code sourceUuid/record.hash} as a new note {@code record.uuid}. */
        CREATE_COPY,
        /** A needed payload has not arrived yet; retry on a later run. */
        WAIT
    }

    public static final class Action {
        public final ActionType type;
        public final NoteRecord record;
        public final boolean contentChanged;
        public final String sourceUuid;

        Action(ActionType type, NoteRecord record, boolean contentChanged, String sourceUuid) {
            this.type = type;
            this.record = record;
            this.contentChanged = contentChanged;
            this.sourceUuid = sourceUuid;
        }

        @Override
        public String toString() {
            return type + " " + record + (sourceUuid != null ? " from " + sourceUuid : "")
                + (type == ActionType.APPLY ? " content=" + contentChanged : "");
        }
    }

    public static final class Plan {
        /** Execute in order; a later action may overwrite the local file an earlier one reads. */
        public final List<Action> actions;
        /** Publish only after every action succeeded; it becomes the next run's base. */
        public final Manifest manifest;
        public final int conflicts;
        public final int waiting;
        public final int skippedExcluded;

        Plan(List<Action> actions, Manifest manifest, int conflicts, int waiting, int skippedExcluded) {
            this.actions = Collections.unmodifiableList(actions);
            this.manifest = manifest;
            this.conflicts = conflicts;
            this.waiting = waiting;
            this.skippedExcluded = skippedExcluded;
        }
    }

    private final String deviceId;
    private final String deviceName;
    private final String appVersion;
    private final long tombstoneRetentionMs;

    public SyncPlanner(String deviceId, String deviceName, String appVersion,
                       long tombstoneRetentionMs) {
        this.deviceId = Objects.requireNonNull(deviceId, "deviceId");
        this.deviceName = deviceName;
        this.appVersion = appVersion;
        this.tombstoneRetentionMs = tombstoneRetentionMs;
    }

    /**
     * @param base     this device's manifest from the last successful run (empty on first run)
     * @param local    syncable local notes, including notes in the trash
     * @param excluded local notes that must not be synced (e.g. locked); left untouched
     * @param remotes  other devices' manifests; this device's own manifest is ignored if present
     */
    public Plan plan(Manifest base, Collection<LocalNote> local, Set<String> excluded,
                     Collection<Manifest> remotes, PayloadStore payloads, long now) {
        Map<String, LocalNote> localById = new TreeMap<>();
        for (LocalNote n : local) localById.put(n.uuid, n);
        List<Manifest> others = new ArrayList<>();
        for (Manifest m : remotes) if (!deviceId.equals(m.deviceId)) others.add(m);

        TreeSet<String> ids = new TreeSet<>(localById.keySet());
        ids.addAll(base.notes.keySet());
        for (Manifest m : others) ids.addAll(m.notes.keySet());

        Run run = new Run(payloads, now, others);
        for (String uuid : ids) {
            if (excluded.contains(uuid)) {
                NoteRecord kept = base.get(uuid);
                if (kept != null) run.own.put(uuid, kept);
                run.skippedExcluded++;
                continue;
            }
            List<NoteRecord> remoteRecords = new ArrayList<>();
            for (Manifest m : others) {
                NoteRecord r = m.get(uuid);
                if (r != null) remoteRecords.add(r);
            }
            run.decide(uuid, localById.get(uuid), base.get(uuid), remoteRecords);
        }
        Manifest manifest = new Manifest(deviceId, deviceName, appVersion, now, run.own);
        return new Plan(run.actions, manifest, run.conflicts, run.waiting, run.skippedExcluded);
    }

    /** Deterministic UUID for the conflict copy of {@code loser}, identical on every device. */
    public static String conflictCopyUuid(String uuid, String loserHash) {
        return UUID.nameUUIDFromBytes(("conflict:" + uuid + ":" + loserHash)
            .getBytes(StandardCharsets.UTF_8)).toString();
    }

    private final class Run {
        final PayloadStore payloads;
        final long now;
        final List<Manifest> others;
        final TreeMap<String, NoteRecord> own = new TreeMap<>();
        final List<Action> actions = new ArrayList<>();
        int conflicts;
        int waiting;
        int skippedExcluded;

        Run(PayloadStore payloads, long now, List<Manifest> others) {
            this.payloads = payloads;
            this.now = now;
            this.others = others;
        }

        void decide(String uuid, LocalNote l, NoteRecord b, List<NoteRecord> remoteRecords) {
            VersionVector baseVersion = b == null ? VersionVector.EMPTY : b.version;
            boolean localChanged;
            NoteRecord current;
            if (l != null) {
                NoteRecord unversioned = l.toRecord(baseVersion);
                localChanged = b == null || !unversioned.sameState(b);
                current = localChanged ? l.toRecord(baseVersion.increment(deviceId)) : unversioned;
            } else if (b != null) {
                // Gone locally (purged from the trash): publish a tombstone if we had not already.
                localChanged = !b.deleted;
                current = localChanged
                    ? b.asTombstone(now).withVersion(baseVersion.increment(deviceId)) : b;
            } else {
                localChanged = false;
                current = null;
            }

            Remote remote = reduceRemotes(uuid, remoteRecords);
            if (remote == null) {
                keep(uuid, current, localChanged, l == null);
                return;
            }
            if (remote.waiting) {
                waitFor(uuid, remote.record, current, localChanged);
                return;
            }
            NoteRecord r = remote.record;

            if (current == null) {
                // Never seen here. Ignore remote tombstones; import live notes as new.
                if (r.deleted) return;
                if (!payloads.has(uuid, r.hash)) {
                    waitFor(uuid, r, null, false);
                    return;
                }
                actions.addAll(remote.copies);
                actions.add(new Action(ActionType.APPLY, r, true, null));
                own.put(uuid, r);
                return;
            }

            switch (r.version.compare(current.version)) {
                case EQUAL:
                case BEFORE:
                    actions.addAll(remote.copies);
                    keep(uuid, current, localChanged, l == null);
                    return;
                case AFTER:
                    if (r.sameState(current)) {
                        actions.addAll(remote.copies);
                        own.put(uuid, current.withVersion(r.version));
                        return;
                    }
                    boolean needsContent = !r.deleted && !Objects.equals(r.hash, current.hash);
                    if (needsContent && !payloads.has(uuid, r.hash)) {
                        waitFor(uuid, r, current, false);
                        return;
                    }
                    actions.addAll(remote.copies);
                    actions.add(new Action(ActionType.APPLY, r, needsContent, null));
                    own.put(uuid, r);
                    return;
                case CONCURRENT:
                default:
                    resolveConcurrent(uuid, current, localChanged, remote);
            }
        }

        void resolveConcurrent(String uuid, NoteRecord current, boolean localChanged, Remote remote) {
            NoteRecord r = remote.record;
            VersionVector merged = current.version.merge(r.version);
            if (r.sameState(current)) {
                actions.addAll(remote.copies);
                if (localChanged && !current.deleted) publish(current);
                own.put(uuid, current.withVersion(merged));
                return;
            }
            NoteRecord winner = pick(current, r);
            NoteRecord loser = winner == current ? r : current;
            boolean copyLoser = !winner.deleted && !loser.deleted
                && !Objects.equals(winner.hash, loser.hash);
            boolean remoteWins = winner == r;
            boolean needsContent = remoteWins && !r.deleted && !Objects.equals(r.hash, current.hash);

            // Every remote payload this resolution reads must be present, or nothing is decided.
            if ((needsContent || (copyLoser && !remoteWins)) && !payloads.has(uuid, r.hash)) {
                waitFor(uuid, r, current, localChanged);
                return;
            }
            conflicts++;
            actions.addAll(remote.copies);
            if (copyLoser) {
                if (!remoteWins) {
                    actions.add(copyOf(uuid, r));
                } else {
                    // Our losing content must reach the folder before APPLY overwrites the file.
                    publish(current);
                    actions.add(copyOf(uuid, current));
                }
            }
            if (remoteWins) {
                actions.add(new Action(ActionType.APPLY, r.withVersion(merged), needsContent, null));
                own.put(uuid, r.withVersion(merged));
            } else {
                if (!current.deleted) publish(current.withVersion(merged));
                own.put(uuid, current.withVersion(merged));
            }
        }

        /** Combine what all other devices published for one note. */
        Remote reduceRemotes(String uuid, List<NoteRecord> records) {
            if (records.isEmpty()) return null;
            NoteRecord best = records.get(0);
            List<Action> copies = new ArrayList<>();
            for (int i = 1; i < records.size(); i++) {
                NoteRecord next = records.get(i);
                switch (next.version.compare(best.version)) {
                    case AFTER:
                        best = next;
                        break;
                    case CONCURRENT: {
                        VersionVector merged = best.version.merge(next.version);
                        if (!next.sameState(best)) {
                            NoteRecord winner = pick(best, next);
                            NoteRecord loser = winner == best ? next : best;
                            if (!winner.deleted && !loser.deleted
                                && !Objects.equals(winner.hash, loser.hash)) {
                                if (!payloads.has(uuid, loser.hash)) {
                                    return Remote.waitingFor(loser);
                                }
                                copies.add(copyOf(uuid, loser));
                            }
                            best = winner;
                        }
                        best = best.withVersion(merged);
                        break;
                    }
                    default:
                        break;
                }
            }
            return new Remote(best, copies, false);
        }

        void keep(String uuid, NoteRecord current, boolean localChanged, boolean goneLocally) {
            if (current == null) return;
            if (localChanged && !current.deleted) publish(current);
            if (goneLocally && current.deleted && tombstoneExpired(uuid, current)) return;
            own.put(uuid, current);
        }

        void waitFor(String uuid, NoteRecord pending, NoteRecord current, boolean localChanged) {
            waiting++;
            actions.add(new Action(ActionType.WAIT, pending, false, null));
            if (current == null) return;
            // Still publish our own edit, unmerged, so the other side can see the conflict too.
            if (localChanged && !current.deleted) publish(current);
            own.put(uuid, current);
        }

        void publish(NoteRecord record) {
            actions.add(new Action(ActionType.PUBLISH, record, true, null));
        }

        Action copyOf(String uuid, NoteRecord loser) {
            NoteRecord copy = new NoteRecord(conflictCopyUuid(uuid, loser.hash), loser.hash,
                VersionVector.EMPTY, loser.title + CONFLICT_SUFFIX, loser.categoryUuid,
                loser.createdAt, loser.modifiedAt, false, false, 0);
            return new Action(ActionType.CREATE_COPY, copy, true, uuid);
        }

        /** Drop an old tombstone once every other device has also deleted or forgotten the note. */
        boolean tombstoneExpired(String uuid, NoteRecord tombstone) {
            if (tombstoneRetentionMs <= 0 || now - tombstone.deletedAt < tombstoneRetentionMs) {
                return false;
            }
            for (Manifest m : others) {
                NoteRecord r = m.get(uuid);
                if (r != null && !r.deleted) return false;
            }
            return true;
        }
    }

    /** Newer edit wins; ties go to the larger hash so every device picks the same side. */
    static NoteRecord pick(NoteRecord a, NoteRecord b) {
        if (a.deleted != b.deleted) return a.deleted ? b : a;
        if (a.modifiedAt != b.modifiedAt) return a.modifiedAt > b.modifiedAt ? a : b;
        String ha = a.hash == null ? "" : a.hash;
        String hb = b.hash == null ? "" : b.hash;
        return ha.compareTo(hb) >= 0 ? a : b;
    }

    private static final class Remote {
        final NoteRecord record;
        final List<Action> copies;
        final boolean waiting;

        Remote(NoteRecord record, List<Action> copies, boolean waiting) {
            this.record = record;
            this.copies = copies;
            this.waiting = waiting;
        }

        static Remote waitingFor(NoteRecord record) {
            return new Remote(record, Collections.<Action>emptyList(), true);
        }
    }
}
