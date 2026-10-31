package app.badfella.extension.ticktick.locallists;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Versioned JSON export/import of local organization and allowlisted task
 * snapshots. It never writes TickTick's project or task tables.
 *
 * <p>The organization import is a merge: list definitions are matched by UUID,
 * memberships by task SID, and the existing cloud task always wins. Repeating
 * an import is idempotent. Task snapshots are used only by the explicit
 * recovery flow, never applied automatically.</p>
 */
public final class LocalListsBackup {
    public static final String FORMAT = "badfella.ticktick.locallists";
    public static final int SCHEMA = 1;
    public static final int MAX_LISTS = 900;
    public static final int MAX_MEMBERSHIPS = 20000;
    public static final int MAX_TASKS = 5000;
    public static final int MAX_JSON_BYTES = 20 * 1024 * 1024;
    public static final int MAX_IGNORED_FIELDS = 100;

    private static final int MAX_ID = 200;
    private static final int MAX_REALM = 200;
    private static final int MAX_NAME = 200;

    private LocalListsBackup() {
    }

    public static ExportResult export(AccountScope account, LocalListsStore store,
            Collection<TaskSnapshot> snapshots, long now) throws LocalListsException {
        if (account == null) throw new IllegalArgumentException("account is required");
        String profile = account.tag();
        List<LocalList> lists = store.lists(profile);
        List<Membership> memberships = store.memberships(profile);
        int capacity = store.capacity(profile);

        Map<String, TaskSnapshot> bySid = new HashMap<String, TaskSnapshot>();
        if (snapshots != null) {
            for (TaskSnapshot snapshot : snapshots) {
                if (snapshot != null) bySid.put(snapshot.getSid(), snapshot);
            }
        }
        Set<String> assignedSids = new HashSet<String>();
        for (Membership membership : memberships) assignedSids.add(membership.getTaskSid());

        List<String> missing = new ArrayList<String>();
        List<TaskSnapshot> included = new ArrayList<TaskSnapshot>();
        Set<String> omitted = new LinkedHashSet<String>();
        int attachmentMetadata = 0;
        int attachmentsWithLocalBytes = 0;
        for (Membership membership : memberships) {
            TaskSnapshot snapshot = bySid.get(membership.getTaskSid());
            if (snapshot == null) {
                missing.add(membership.getTaskSid());
                continue;
            }
            if (!included.contains(snapshot)) included.add(snapshot);
            for (String field : snapshot.getOmittedFields()) {
                if (omitted.size() < MAX_IGNORED_FIELDS) omitted.add(field);
            }
            for (TaskSnapshot.Attachment attachment : snapshot.getAttachments()) {
                attachmentMetadata++;
                if (attachment.isLocalBytesAvailable()) attachmentsWithLocalBytes++;
            }
        }
        Collections.sort(missing);
        Collections.sort(included, new Comparator<TaskSnapshot>() {
            @Override
            public int compare(TaskSnapshot left, TaskSnapshot right) {
                return left.getSid().compareTo(right.getSid());
            }
        });

        try {
            JSONObject root = new JSONObject();
            root.put("format", FORMAT);
            root.put("schema", SCHEMA);
            root.put("createdAt", now);
            JSONObject accountJson = new JSONObject();
            accountJson.put("tag", account.tag());
            accountJson.put("realm", account.getRealm());
            root.put("account", accountJson);
            root.put("capacity", capacity);
            root.put("attachmentBytesIncluded", false);
            root.put("lists", listsToJson(lists));
            root.put("memberships", membershipsToJson(memberships));
            JSONArray taskArray = new JSONArray();
            for (TaskSnapshot snapshot : included) taskArray.put(snapshot.toJson());
            root.put("tasks", taskArray);
            return new ExportResult(root.toString(), lists.size(), memberships.size(),
                    included.size(), missing, attachmentMetadata, attachmentsWithLocalBytes,
                    new ArrayList<String>(omitted));
        } catch (JSONException error) {
            throw new LocalListsException("Could not build the backup", error);
        }
    }

    private static JSONArray listsToJson(List<LocalList> lists) throws JSONException {
        JSONArray array = new JSONArray();
        for (LocalList list : lists) {
            JSONObject json = new JSONObject();
            json.put("uuid", list.getUuid());
            json.put("name", list.getName());
            json.put("sortOrder", list.getSortOrder());
            json.put("createdAt", list.getCreatedAt());
            json.put("updatedAt", list.getUpdatedAt());
            array.put(json);
        }
        return array;
    }

    private static JSONArray membershipsToJson(List<Membership> memberships) throws JSONException {
        JSONArray array = new JSONArray();
        for (Membership membership : memberships) {
            JSONObject json = new JSONObject();
            json.put("taskSid", membership.getTaskSid());
            json.put("listUuid", membership.getListUuid());
            json.put("assignedAt", membership.getAssignedAt());
            array.put(json);
        }
        return array;
    }

    public static Archive read(String json, AccountScope current) throws BackupException {
        if (json == null) throw new BackupException("The backup file is empty");
        if (json.length() > MAX_JSON_BYTES) throw new BackupException("The backup file is too large");
        if (json.trim().isEmpty()) throw new BackupException("The backup file is empty");
        try {
            JSONObject root = new JSONObject(json);
            List<String> ignored = new ArrayList<String>();
            JsonFields.FieldSink sink = new JsonFields.FieldSink() {
                @Override
                public void ignored(String path) {
                    if (ignored.size() < MAX_IGNORED_FIELDS) ignored.add(path);
                }
            };
            JsonFields.rejectUnknown(root, ROOT_FIELDS, "backup", sink);
            String format = JsonFields.optString(root, "format", 100, "backup.format", false);
            if (!FORMAT.equals(format)) {
                throw new BackupException("Not a BadFella local-lists backup");
            }
            Integer schema = JsonFields.optInt(root, "schema", 0, Integer.MAX_VALUE, "backup.schema");
            if (schema == null) throw new BackupException("The backup has no schema version");
            if (schema.intValue() != SCHEMA) {
                throw new BackupException("Unsupported backup version " + schema
                        + "; this build reads version " + SCHEMA);
            }
            Long createdAt = JsonFields.optLong(root, "createdAt", 0, JsonFields.MAX_DATE,
                    "backup.createdAt");
            JSONObject accountJson = JsonFields.object(root, "account", "backup.account");
            JsonFields.rejectUnknown(accountJson, ACCOUNT_FIELDS, "backup.account", sink);
            String tag = JsonFields.requiredString(accountJson, "tag", 64, "backup.account.tag");
            String realm = JsonFields.requiredString(accountJson, "realm", MAX_REALM,
                    "backup.account.realm");
            if (!isHex(tag) || tag.length() != 64) {
                throw new BackupException("The backup has an invalid account identity");
            }
            if (current == null) throw new BackupException("A signed-in account is required");
            if (!tag.equals(current.tag())) {
                throw new BackupException("This backup belongs to a different account or server ("
                        + shortTag(tag) + "). Current account: " + current.shortTag() + ".");
            }
            if (JsonFields.optBoolean(root, "attachmentBytesIncluded", false,
                    "backup.attachmentBytesIncluded")) {
                throw new BackupException("This build cannot import backups containing attachment bytes");
            }
            Integer capacity = JsonFields.optInt(root, "capacity", 0, 10000, "backup.capacity");
            if (capacity == null || !LocalListsStore.isSupportedCapacity(capacity.intValue())) {
                throw new BackupException("The backup has an unsupported list capacity");
            }

            List<LocalList> lists = new ArrayList<LocalList>();
            List<Membership> memberships = new ArrayList<Membership>();
            List<TaskSnapshot> tasks = new ArrayList<TaskSnapshot>();
            Set<String> listIds = new HashSet<String>();
            Set<String> membershipSids = new HashSet<String>();
            Set<String> taskSids = new HashSet<String>();

            JSONArray listArray = JsonFields.array(root, "lists", "backup.lists");
            if (listArray.length() > MAX_LISTS) {
                throw new BackupException("The backup declares more than " + MAX_LISTS + " lists");
            }
            for (int i = 0; i < listArray.length(); i++) {
                Object value = listArray.opt(i);
                if (!(value instanceof JSONObject)) {
                    throw JsonFields.invalid("backup.lists[" + i + "]", "must be an object");
                }
                JSONObject listJson = (JSONObject) value;
                String path = "backup.lists[" + i + "]";
                JsonFields.rejectUnknown(listJson, LIST_FIELDS, path, sink);
                String uuid = JsonFields.requiredString(listJson, "uuid", MAX_ID, path + ".uuid");
                if (LocalListsStore.hasControl(uuid)) {
                    throw JsonFields.invalid(path + ".uuid", "contains control characters");
                }
                String name = JsonFields.requiredString(listJson, "name", MAX_NAME, path + ".name");
                if (LocalListsStore.hasControl(name)) {
                    throw JsonFields.invalid(path + ".name", "contains control characters");
                }
                long sortOrder = JsonFields.requiredLong(listJson, "sortOrder",
                        Long.MIN_VALUE, Long.MAX_VALUE, path + ".sortOrder");
                long listCreated = JsonFields.requiredLong(listJson, "createdAt", 0,
                        JsonFields.MAX_DATE, path + ".createdAt");
                long listUpdated = JsonFields.requiredLong(listJson, "updatedAt", 0,
                        JsonFields.MAX_DATE, path + ".updatedAt");
                if (listUpdated < listCreated) {
                    throw JsonFields.invalid(path + ".updatedAt", "is before createdAt");
                }
                if (!listIds.add(uuid)) {
                    throw new BackupException("The backup repeats local list id " + uuid);
                }
                lists.add(new LocalList(uuid, name, sortOrder, listCreated, listUpdated));
            }

            JSONArray membershipArray = JsonFields.array(root, "memberships", "backup.memberships");
            if (membershipArray.length() > MAX_MEMBERSHIPS) {
                throw new BackupException("The backup declares more than "
                        + MAX_MEMBERSHIPS + " memberships");
            }
            for (int i = 0; i < membershipArray.length(); i++) {
                Object value = membershipArray.opt(i);
                if (!(value instanceof JSONObject)) {
                    throw JsonFields.invalid("backup.memberships[" + i + "]", "must be an object");
                }
                JSONObject membershipJson = (JSONObject) value;
                String path = "backup.memberships[" + i + "]";
                JsonFields.rejectUnknown(membershipJson, MEMBERSHIP_FIELDS, path, sink);
                String taskSid = JsonFields.requiredString(membershipJson, "taskSid", MAX_ID,
                        path + ".taskSid");
                String listUuid = JsonFields.requiredString(membershipJson, "listUuid", MAX_ID,
                        path + ".listUuid");
                long assignedAt = JsonFields.requiredLong(membershipJson, "assignedAt", 0,
                        JsonFields.MAX_DATE, path + ".assignedAt");
                if (LocalListsStore.hasControl(taskSid) || LocalListsStore.hasControl(listUuid)) {
                    throw JsonFields.invalid(path, "contains control characters");
                }
                if (!membershipSids.add(taskSid)) {
                    throw new BackupException("The backup repeats the membership for task " + taskSid);
                }
                if (!listIds.contains(listUuid)) {
                    throw new BackupException("Membership for task " + taskSid
                            + " references a list that is not in the backup");
                }
                memberships.add(new Membership(taskSid, listUuid, assignedAt));
            }

            JSONArray taskArray = JsonFields.array(root, "tasks", "backup.tasks");
            if (taskArray.length() > MAX_TASKS) {
                throw new BackupException("The backup declares more than " + MAX_TASKS + " tasks");
            }
            for (int i = 0; i < taskArray.length(); i++) {
                Object value = taskArray.opt(i);
                if (!(value instanceof JSONObject)) {
                    throw JsonFields.invalid("backup.tasks[" + i + "]", "must be an object");
                }
                TaskSnapshot task = TaskSnapshot.fromJson((JSONObject) value,
                        "backup.tasks[" + i + "]", sink);
                if (!taskSids.add(task.getSid())) {
                    throw new BackupException("The backup repeats task snapshot " + task.getSid());
                }
                tasks.add(task);
            }

            return new Archive(createdAt == null ? 0 : createdAt.longValue(), tag, realm,
                    capacity.intValue(), lists, memberships, tasks,
                    Collections.unmodifiableList(ignored), current);
        } catch (JSONException error) {
            throw new BackupException("The backup file is not valid JSON", error);
        }
    }

    public static Archive read(InputStream input, AccountScope current, int maxBytes)
            throws BackupException {
        if (input == null) throw new BackupException("The backup file is empty");
        int limit = maxBytes <= 0 ? MAX_JSON_BYTES : Math.min(maxBytes, MAX_JSON_BYTES);
        try {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int total = 0;
            int read;
            while ((read = input.read(buffer)) != -1) {
                total += read;
                if (total > limit) throw new BackupException("The backup file is too large");
                output.write(buffer, 0, read);
            }
            return read(new String(output.toByteArray(), "UTF-8"), current);
        } catch (IOException error) {
            throw new BackupException("Could not read the backup file", error);
        }
    }

    public static ImportPlan preview(Archive archive, LocalListsStore store,
            Set<String> knownTaskSids) throws BackupException {
        if (archive == null || store == null) throw new IllegalArgumentException("archive is required");
        Counts counts = computeCounts(archive, store, knownTaskSids);
        return new ImportPlan(archive, knownTaskSids, counts);
    }

    private static Counts computeCounts(Archive archive, LocalListsStore store,
            Set<String> knownTaskSids) {
        String profile = archive.getCurrentAccount().tag();
        Map<String, LocalList> existing = new HashMap<String, LocalList>();
        for (LocalList list : store.lists(profile)) existing.put(list.getUuid(), list);
        Counts counts = new Counts();
        for (LocalList list : archive.getLists()) {
            LocalList present = existing.get(list.getUuid());
            if (present == null) counts.listsAdded++;
            else if (list.getUpdatedAt() > present.getUpdatedAt()) counts.listsUpdated++;
            else counts.listsUnchanged++;
        }
        for (Membership membership : archive.getMemberships()) {
            Membership present = store.getMembership(profile, membership.getTaskSid());
            if (present == null) counts.membershipsApplied++;
            else if (present.getListUuid().equals(membership.getListUuid())) counts.membershipsUnchanged++;
            else counts.membershipsConflicting++;
            if (knownTaskSids != null && !knownTaskSids.contains(membership.getTaskSid())) {
                counts.membershipsUnresolved++;
            }
        }
        counts.capacityChanged = store.capacity(profile) != archive.getCapacity();
        return counts;
    }

    public static ImportPlan previewJson(String json, AccountScope current, LocalListsStore store,
            Set<String> knownTaskSids) throws BackupException {
        return preview(read(json, current), store, knownTaskSids);
    }

    /**
     * Replaces the local organization with an exact previous snapshot. This is
     * used only after an explicit "restore previous organization" confirmation.
     * It never deletes or edits a TickTick task.
     */
    public static RestoreResult restore(Archive archive, LocalListsStore store,
            AccountScope current) throws LocalListsException {
        if (archive == null || store == null) throw new IllegalArgumentException("archive is required");
        if (current == null) throw new BackupException("A signed-in account is required");
        if (!archive.getAccountTag().equals(current.tag())) {
            throw new BackupException("The signed-in account changed; nothing was restored");
        }
        final String profile = current.tag();
        store.transaction(new LocalListsStore.TransactionBody<Void>() {
            @Override
            public Void run() throws Exception {
                store.clearLocalOrganization(profile);
                store.setCapacity(profile, archive.getCapacity());
                for (LocalList list : archive.getLists()) store.upsertListFromBackup(profile, list);
                for (Membership membership : archive.getMemberships()) {
                    store.insertMembershipFromBackup(profile, membership);
                }
                return null;
            }
        });
        return new RestoreResult(archive.getLists().size(), archive.getMemberships().size());
    }

    public static final class RestoreResult {
        private final int lists;
        private final int memberships;

        private RestoreResult(int lists, int memberships) {
            this.lists = lists;
            this.memberships = memberships;
        }

        public int getListCount() { return lists; }
        public int getMembershipCount() { return memberships; }
    }

    public static String organizationJson(AccountScope account, LocalListsStore store, long now)
            throws LocalListsException {
        return export(account, store, Collections.<TaskSnapshot>emptyList(), now).getJson();
    }

    public static void writeAtomic(File file, String content) throws IOException {
        if (file == null) throw new IllegalArgumentException("file is required");
        File parent = file.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IOException("Could not create the backup directory");
        }
        File temporary = new File(file.getPath() + ".tmp");
        FileOutputStream output = null;
        try {
            output = new FileOutputStream(temporary);
            output.write(content.getBytes("UTF-8"));
            output.flush();
            output.getFD().sync();
            output.close();
            output = null;
            if (!temporary.renameTo(file)) {
                if (file.exists() && !file.delete()) {
                    throw new IOException("Could not replace the previous backup");
                }
                if (!temporary.renameTo(file)) {
                    throw new IOException("Could not finalize the backup file");
                }
            }
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException ignored) {
                }
            }
            if (temporary.exists()) temporary.delete();
        }
    }

    public static String readFile(File file, int maxBytes) throws IOException, BackupException {
        if (file == null || !file.isFile()) throw new BackupException("The backup file is missing");
        int limit = maxBytes <= 0 ? MAX_JSON_BYTES : Math.min(maxBytes, MAX_JSON_BYTES);
        if (file.length() > limit) throw new BackupException("The backup file is too large");
        FileInputStream input = new FileInputStream(file);
        try {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int total = 0;
            int read;
            while ((read = input.read(buffer)) != -1) {
                total += read;
                if (total > limit) throw new BackupException("The backup file is too large");
                output.write(buffer, 0, read);
            }
            return new String(output.toByteArray(), "UTF-8");
        } finally {
            input.close();
        }
    }

    public static String shortTag(String tag) {
        return tag != null && tag.length() >= 12 ? tag.substring(0, 12) : "unknown";
    }

    private static boolean isHex(String value) {
        if (value == null) return false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'))) return false;
        }
        return true;
    }

    private static final Set<String> ROOT_FIELDS = setOf("format", "schema", "createdAt",
            "account", "capacity", "attachmentBytesIncluded", "lists", "memberships", "tasks");
    private static final Set<String> ACCOUNT_FIELDS = setOf("tag", "realm");
    private static final Set<String> LIST_FIELDS = setOf("uuid", "name", "sortOrder",
            "createdAt", "updatedAt");
    private static final Set<String> MEMBERSHIP_FIELDS = setOf("taskSid", "listUuid", "assignedAt");

    private static Set<String> setOf(String... values) {
        Set<String> result = new HashSet<String>();
        Collections.addAll(result, values);
        return Collections.unmodifiableSet(result);
    }

    public static final class Archive {
        private final long createdAt;
        private final String accountTag;
        private final String realm;
        private final int capacity;
        private final List<LocalList> lists;
        private final List<Membership> memberships;
        private final List<TaskSnapshot> tasks;
        private final List<String> ignoredFields;
        private final AccountScope currentAccount;

        private Archive(long createdAt, String accountTag, String realm, int capacity,
                List<LocalList> lists, List<Membership> memberships, List<TaskSnapshot> tasks,
                List<String> ignoredFields, AccountScope currentAccount) {
            this.createdAt = createdAt;
            this.accountTag = accountTag;
            this.realm = realm;
            this.capacity = capacity;
            this.lists = Collections.unmodifiableList(new ArrayList<LocalList>(lists));
            this.memberships = Collections.unmodifiableList(new ArrayList<Membership>(memberships));
            this.tasks = Collections.unmodifiableList(new ArrayList<TaskSnapshot>(tasks));
            this.ignoredFields = ignoredFields;
            this.currentAccount = currentAccount;
        }

        public long getCreatedAt() { return createdAt; }
        public String getAccountTag() { return accountTag; }
        public String getRealm() { return realm; }
        public int getCapacity() { return capacity; }
        public List<LocalList> getLists() { return lists; }
        public List<Membership> getMemberships() { return memberships; }
        public List<TaskSnapshot> getTasks() { return tasks; }
        public List<String> getIgnoredFields() { return ignoredFields; }
        public AccountScope getCurrentAccount() { return currentAccount; }
        public TaskSnapshot findTask(String sid) {
            for (TaskSnapshot task : tasks) if (task.getSid().equals(sid)) return task;
            return null;
        }
    }

    public static final class ExportResult {
        private final String json;
        private final int listCount;
        private final int membershipCount;
        private final int taskSnapshotCount;
        private final List<String> missingSnapshotSids;
        private final int attachmentMetadataCount;
        private final int attachmentsWithLocalBytes;
        private final List<String> omittedFields;

        private ExportResult(String json, int listCount, int membershipCount,
                int taskSnapshotCount, List<String> missingSnapshotSids,
                int attachmentMetadataCount, int attachmentsWithLocalBytes,
                List<String> omittedFields) {
            this.json = json;
            this.listCount = listCount;
            this.membershipCount = membershipCount;
            this.taskSnapshotCount = taskSnapshotCount;
            this.missingSnapshotSids = Collections.unmodifiableList(
                    new ArrayList<String>(missingSnapshotSids));
            this.attachmentMetadataCount = attachmentMetadataCount;
            this.attachmentsWithLocalBytes = attachmentsWithLocalBytes;
            this.omittedFields = Collections.unmodifiableList(new ArrayList<String>(omittedFields));
        }

        public String getJson() { return json; }
        public int getListCount() { return listCount; }
        public int getMembershipCount() { return membershipCount; }
        public int getTaskSnapshotCount() { return taskSnapshotCount; }
        public int getMissingSnapshotCount() { return missingSnapshotSids.size(); }
        public List<String> getMissingSnapshotSids() { return missingSnapshotSids; }
        public int getAttachmentMetadataCount() { return attachmentMetadataCount; }
        public int getAttachmentsWithLocalBytes() { return attachmentsWithLocalBytes; }
        public List<String> getOmittedFields() { return omittedFields; }
        public boolean hasAttachmentByteOmissions() { return attachmentMetadataCount > 0; }
    }

    public static final class Counts {
        public int listsAdded;
        public int listsUpdated;
        public int listsUnchanged;
        public int membershipsApplied;
        public int membershipsUnchanged;
        public int membershipsConflicting;
        public int membershipsUnresolved;
        public boolean capacityChanged;

        public int listsTotal() { return listsAdded + listsUpdated + listsUnchanged; }
        public int membershipsTotal() {
            return membershipsApplied + membershipsUnchanged + membershipsConflicting;
        }
    }

    public static final class ImportPlan {
        private final Archive archive;
        private final Set<String> knownTaskSids;
        private final Counts counts;

        private ImportPlan(Archive archive, Set<String> knownTaskSids, Counts counts) {
            this.archive = archive;
            this.knownTaskSids = knownTaskSids == null ? null
                    : Collections.unmodifiableSet(new HashSet<String>(knownTaskSids));
            this.counts = counts;
        }

        public Archive getArchive() { return archive; }
        public Counts getCounts() { return counts; }

        public ImportResult apply(LocalListsStore store, AccountScope current,
                File recoverySnapshot) throws LocalListsException {
            if (store == null) throw new IllegalArgumentException("store is required");
            if (current == null) throw new BackupException("A signed-in account is required");
            if (!archive.getAccountTag().equals(current.tag())) {
                throw new BackupException("The signed-in account changed; nothing was imported");
            }
            final String profile = current.tag();
            final Counts fresh = computeCounts(archive, store, knownTaskSids);
            if (recoverySnapshot != null) {
                try {
                    writeAtomic(recoverySnapshot,
                            organizationJson(current, store, System.currentTimeMillis()));
                } catch (IOException error) {
                    throw new LocalListsException(
                            "Could not save the pre-import recovery snapshot; nothing was imported",
                            error);
                }
            }
            final AccountScope account = current;
            store.transaction(new LocalListsStore.TransactionBody<Void>() {
                @Override
                public Void run() throws Exception {
                    store.setCapacity(profile, archive.getCapacity());
                    for (LocalList list : archive.getLists()) store.upsertListFromBackup(profile, list);
                    for (Membership membership : archive.getMemberships()) {
                        store.insertMembershipFromBackup(profile, membership);
                    }
                    return null;
                }
            });
            return new ImportResult(fresh, archive, recoverySnapshot);
        }
    }

    public static final class ImportResult {
        private final Counts counts;
        private final Archive archive;
        private final File recoverySnapshot;

        private ImportResult(Counts counts, Archive archive, File recoverySnapshot) {
            this.counts = counts;
            this.archive = archive;
            this.recoverySnapshot = recoverySnapshot;
        }

        public Counts getCounts() { return counts; }
        public Archive getArchive() { return archive; }
        public File getRecoverySnapshot() { return recoverySnapshot; }
    }
}
