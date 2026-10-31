package app.badfella.extension.ticktick;

import app.badfella.extension.ticktick.locallists.AccountScope;
import app.badfella.extension.ticktick.locallists.LocalListsBackup;
import app.badfella.extension.ticktick.locallists.LocalListsException;
import app.badfella.extension.ticktick.locallists.LocalListsStore;
import app.badfella.extension.ticktick.locallists.Membership;
import app.badfella.extension.ticktick.locallists.TaskSnapshot;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Explicit recovery of task snapshots for local memberships whose task SID no
 * longer exists in the current account. New tasks are created through
 * TickTick's native service in Inbox, then only the local membership is moved
 * to the fresh SID. Existing cloud tasks are never overwritten.
 */
public final class LocalListsRecovery {
    private LocalListsRecovery() {
    }

    public static Preview preview(LocalListsBackup.Archive archive, LocalListsStore store,
            AccountScope scope, Set<String> knownTaskSids) throws LocalListsException {
        if (archive == null || store == null || scope == null) {
            throw new IllegalArgumentException("archive, store and account are required");
        }
        Map<String, Membership> memberships = new HashMap<String, Membership>();
        for (Membership membership : store.memberships(scope.tag())) {
            memberships.put(membership.getTaskSid(), membership);
        }
        List<TaskSnapshot> recoverable = new ArrayList<TaskSnapshot>();
        List<String> missingWithoutSnapshot = new ArrayList<String>();
        Set<String> omitted = new LinkedHashSet<String>();
        int attachments = 0;
        boolean hasTags = false;
        for (Membership membership : memberships.values()) {
            if (knownTaskSids != null && knownTaskSids.contains(membership.getTaskSid())) continue;
            TaskSnapshot snapshot = archive.findTask(membership.getTaskSid());
            if (snapshot == null) {
                missingWithoutSnapshot.add(membership.getTaskSid());
                continue;
            }
            recoverable.add(snapshot);
            attachments += snapshot.getAttachments().size();
            if (!snapshot.getTags().isEmpty()) hasTags = true;
            for (String field : snapshot.getOmittedFields()) omitted.add(field);
        }
        Collections.sort(missingWithoutSnapshot);
        recoverable = orderParentsFirst(recoverable);
        return new Preview(recoverable, missingWithoutSnapshot, attachments,
                new ArrayList<String>(omitted), hasTags);
    }

    public static Result recover(LocalListsBackup.Archive archive, LocalListsStore store,
            AccountScope scope, Set<String> knownTaskSids, TickTickBridge bridge, long now)
            throws LocalListsException {
        Preview preview = preview(archive, store, scope, knownTaskSids);
        String profile = scope.tag();
        Map<String, String> remapped = new HashMap<String, String>();
        List<Recovered> created = new ArrayList<Recovered>();
        List<String> failures = new ArrayList<String>();
        for (TaskSnapshot snapshot : preview.getRecoverable()) {
            Membership membership = store.getMembership(profile, snapshot.getSid());
            if (membership == null) continue;
            String parent = null;
            if (snapshot.getParentSid() != null) {
                if (remapped.containsKey(snapshot.getParentSid())) {
                    parent = remapped.get(snapshot.getParentSid());
                } else if (knownTaskSids != null && knownTaskSids.contains(snapshot.getParentSid())) {
                    parent = snapshot.getParentSid();
                }
            }
            TickTickBridge.CreatedTask task;
            try {
                task = bridge.recoverTask(scope, snapshot, parent);
            } catch (Exception error) {
                failures.add(snapshot.getSid() + ": " + message(error));
                break;
            }
            try {
                final String oldSid = snapshot.getSid();
                final String newSid = task.getSid();
                final String listUuid = membership.getListUuid();
                final long assignedAt = Math.max(now, membership.getAssignedAt());
                store.transaction(new LocalListsStore.TransactionBody<Void>() {
                    @Override
                    public Void run() throws Exception {
                        Membership existing = store.getMembership(profile, newSid);
                        if (existing == null) store.assignTask(profile, newSid, listUuid, assignedAt);
                        store.unassignTask(profile, oldSid);
                        return null;
                    }
                });
                remapped.put(oldSid, newSid);
                created.add(new Recovered(oldSid, newSid, snapshot.getTitle()));
            } catch (LocalListsException error) {
                failures.add(snapshot.getSid()
                        + ": the task was created, but its local assignment could not be updated");
                break;
            }
        }
        return new Result(created, failures, preview.getMissingWithoutSnapshot(),
                preview.getAttachmentMetadataCount(), preview.getOmittedFields());
    }

    private static List<TaskSnapshot> orderParentsFirst(List<TaskSnapshot> input) {
        List<TaskSnapshot> pending = new ArrayList<TaskSnapshot>(input);
        List<TaskSnapshot> ordered = new ArrayList<TaskSnapshot>();
        Set<String> pendingSids = new HashSet<String>();
        for (TaskSnapshot snapshot : pending) pendingSids.add(snapshot.getSid());
        while (!pending.isEmpty()) {
            boolean progressed = false;
            for (int i = 0; i < pending.size(); i++) {
                TaskSnapshot candidate = pending.get(i);
                if (candidate.getParentSid() == null || !pendingSids.contains(candidate.getParentSid())) {
                    ordered.add(candidate);
                    pendingSids.remove(candidate.getSid());
                    pending.remove(i);
                    progressed = true;
                    break;
                }
            }
            if (!progressed) {
                // A parent cycle in a corrupt archive: keep a stable order and
                // let recovery create these without a parent link.
                ordered.addAll(pending);
                break;
            }
        }
        return ordered;
    }

    private static String message(Throwable error) {
        String text = error.getMessage();
        return text == null || text.isEmpty() ? error.getClass().getSimpleName() : text;
    }

    public static final class Preview {
        private final List<TaskSnapshot> recoverable;
        private final List<String> missingWithoutSnapshot;
        private final int attachmentMetadataCount;
        private final List<String> omittedFields;
        private final boolean hasTags;

        private Preview(List<TaskSnapshot> recoverable, List<String> missingWithoutSnapshot,
                int attachmentMetadataCount, List<String> omittedFields, boolean hasTags) {
            this.recoverable = Collections.unmodifiableList(new ArrayList<TaskSnapshot>(recoverable));
            this.missingWithoutSnapshot = Collections.unmodifiableList(
                    new ArrayList<String>(missingWithoutSnapshot));
            this.attachmentMetadataCount = attachmentMetadataCount;
            this.omittedFields = Collections.unmodifiableList(new ArrayList<String>(omittedFields));
            this.hasTags = hasTags;
        }

        public List<TaskSnapshot> getRecoverable() { return recoverable; }
        public List<String> getMissingWithoutSnapshot() { return missingWithoutSnapshot; }
        public int getRecoverableCount() { return recoverable.size(); }
        public int getAttachmentMetadataCount() { return attachmentMetadataCount; }
        public List<String> getOmittedFields() { return omittedFields; }
        public boolean hasTags() { return hasTags; }
    }

    public static final class Recovered {
        private final String oldSid;
        private final String newSid;
        private final String title;

        private Recovered(String oldSid, String newSid, String title) {
            this.oldSid = oldSid;
            this.newSid = newSid;
            this.title = title;
        }

        public String getOldSid() { return oldSid; }
        public String getNewSid() { return newSid; }
        public String getTitle() { return title; }
    }

    public static final class Result {
        private final List<Recovered> created;
        private final List<String> failures;
        private final List<String> stillMissing;
        private final int attachmentMetadataCount;
        private final List<String> omittedFields;

        private Result(List<Recovered> created, List<String> failures, List<String> stillMissing,
                int attachmentMetadataCount, List<String> omittedFields) {
            this.created = Collections.unmodifiableList(new ArrayList<Recovered>(created));
            this.failures = Collections.unmodifiableList(new ArrayList<String>(failures));
            this.stillMissing = Collections.unmodifiableList(new ArrayList<String>(stillMissing));
            this.attachmentMetadataCount = attachmentMetadataCount;
            this.omittedFields = Collections.unmodifiableList(new ArrayList<String>(omittedFields));
        }

        public List<Recovered> getCreated() { return created; }
        public List<String> getFailures() { return failures; }
        public List<String> getStillMissing() { return stillMissing; }
        public int getAttachmentMetadataCount() { return attachmentMetadataCount; }
        public List<String> getOmittedFields() { return omittedFields; }
    }
}
