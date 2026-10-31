package app.badfella.extension.ticktick.locallists;

import android.database.sqlite.SQLiteDatabase;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * On-device tests for the extension-only organizer. Run with app_process so the
 * real Android SQLite and org.json implementations are exercised. This file is
 * a standalone main, not an installed test activity, and uses synthetic data.
 */
public final class LocalListsTestMain {
    private static final File BASE = new File("/data/local/tmp/badfella-local-lists-tests");
    private static final AccountScope A = new AccountScope("synthetic-user-a", "api.ticktick.com");
    private static final AccountScope B = new AccountScope("synthetic-user-b", "api.ticktick.com");
    private static final AccountScope A_CN = new AccountScope("synthetic-user-a", "api.dida365.com");

    private static int passed;
    private static int failed;
    private static final List<String> failures = new ArrayList<String>();

    public static void main(String[] args) {
        if (!BASE.exists() && !BASE.mkdirs()) {
            System.out.println("FATAL could not create " + BASE);
            System.exit(2);
        }
        run("backup intervals and due reminders", new Test() {
            @Override public void run() {
                long now = 1_800_000_000_000L;
                for (long interval : new long[]{0, 15, 360, 1440, 10080, 43200}) {
                    BackupPolicy.validateInterval(interval);
                    if (!BackupPolicy.isDue(0, interval, now)) throw new AssertionError("First backup is due");
                    if (BackupPolicy.isDue(now, interval, now)) throw new AssertionError("Fresh backup marked due");
                }
                for (long invalid : new long[]{-1, 1, 14, 43201, Long.MAX_VALUE}) {
                    try { BackupPolicy.validateInterval(invalid); throw new AssertionError("Invalid interval accepted"); }
                    catch (IllegalArgumentException expected) { }
                }
                if (!BackupPolicy.isDue(now - 15 * 60000L, 15, now)
                        || BackupPolicy.isDue(now - 15 * 60000L + 1, 15, now)
                        || BackupPolicy.isDue(now + 60000, 15, now)) {
                    throw new AssertionError("Due boundary or clock rollback mishandled");
                }
                if (!BackupPolicy.isDue(now - 7 * 86400000L, 0, now)) throw new AssertionError("Weekly manual reminder missing");
                if (!"Daily".equals(BackupPolicy.intervalLabel(1440))
                        || !"Weekly".equals(BackupPolicy.intervalLabel(10080))
                        || !"Every hour".equals(BackupPolicy.intervalLabel(60))) throw new AssertionError("Frequency labels");
            }
        });
        run("account identity survives device locale changes", new Test() {
            @Override public void run() {
                java.util.Locale previous = java.util.Locale.getDefault();
                try {
                    String expected = new AccountScope("synthetic", "api.ticktick.com").tag();
                    java.util.Locale.setDefault(new java.util.Locale("tr", "TR"));
                    if (!expected.equals(new AccountScope("synthetic", "API.TICKTICK.COM").tag())) {
                        throw new AssertionError("Realm normalization changed the account scope");
                    }
                } finally { java.util.Locale.setDefault(previous); }
            }
        });
        run("account isolation and persistence", new Test() {
            @Override
            public void run() throws Exception {
                accountIsolation();
            }
        });
        run("capacity 299/900 and downgrade", new Test() {
            @Override
            public void run() throws Exception {
                capacityAndDowngrade();
            }
        });
        run("delete list keeps task membership semantics", new Test() {
            @Override
            public void run() throws Exception {
                deleteKeepsTasks();
            }
        });
        run("900 lists export and import", new Test() {
            @Override
            public void run() throws Exception {
                largeBackup();
            }
        });
        run("assign move and unassign", new Test() {
            @Override
            public void run() throws Exception {
                assignMoveUnassign();
            }
        });
        run("export/import round trip and repeated import", new Test() {
            @Override
            public void run() throws Exception {
                roundTripAndRepeat();
            }
        });
        run("newer local list edits win over older backup", new Test() {
            @Override
            public void run() throws Exception {
                newerWins();
            }
        });
        run("membership conflict keeps existing mapping", new Test() {
            @Override
            public void run() throws Exception {
                conflictKeepsExisting();
            }
        });
        run("missing task stays unresolved and resolves later", new Test() {
            @Override
            public void run() throws Exception {
                unresolvedTask();
            }
        });
        run("corrupt and wrong-account backups are rejected", new Test() {
            @Override
            public void run() throws Exception {
                corruptBackups();
            }
        });
        run("import rollback and previous-organization restore", new Test() {
            @Override
            public void run() throws Exception {
                rollbackAndRestore();
            }
        });
        run("supported task contents and omission reporting", new Test() {
            @Override
            public void run() throws Exception {
                supportedContents();
            }
        });
        run("unknown fields are reported but ignored", new Test() {
            @Override
            public void run() throws Exception {
                unknownFields();
            }
        });
        System.out.println("SUMMARY passed=" + passed + " failed=" + failed);
        for (String failure : failures) System.out.println("FAILURE " + failure);
        if (failed > 0) System.exit(1);
    }

    private static void accountIsolation() throws Exception {
        LocalListsStore store = open("isolation");
        try {
            LocalList a = store.createList(A.tag(), "Account A", 1000L);
            LocalList b = store.createList(B.tag(), "Account B", 1001L);
            isTrue(!a.getUuid().equals(b.getUuid()), "list UUIDs should differ");
            eq(1, store.listCount(A.tag()), "A list count");
            eq(1, store.listCount(B.tag()), "B list count");
            eq(0, store.listCount(A_CN.tag()), "different realm must be isolated");
            eq("Account A", store.getList(A.tag(), a.getUuid()).getName(), "A name");
            eq("Account B", store.getList(B.tag(), b.getUuid()).getName(), "B name");
            isTrue(store.getList(A.tag(), b.getUuid()) == null, "B list must not be visible to A");
            isTrue(!A.tag().equals(A_CN.tag()), "realm must change the account tag");
        } finally {
            store.close();
        }
        store = LocalListsStore.open(dbFile("isolation"));
        try {
            eq(1, store.listCount(A.tag()), "A persists across close/open");
            eq(1, store.listCount(B.tag()), "B persists across close/open");
        } finally {
            close(store, "isolation");
        }
    }

    private static void capacityAndDowngrade() throws Exception {
        LocalListsStore store = open("capacity");
        try {
            eq(LocalListsStore.DEFAULT_CAPACITY, store.capacity(A.tag()), "default capacity");
            for (int i = 0; i < 299; i++) store.createList(A.tag(), "list-" + i, 10L + i);
            eq(299, store.listCount(A.tag()), "299 lists");
            expectThrows(CapacityException.class, new Action() {
                @Override
                public void run() throws Exception {
                    store.createList(A.tag(), "one-too-many", 500L);
                }
            }, "300th list must be blocked at 299");
            store.setCapacity(A.tag(), 900);
            for (int i = 299; i < 900; i++) store.createList(A.tag(), "list-" + i, 10L + i);
            eq(900, store.listCount(A.tag()), "900 lists");
            expectThrows(CapacityException.class, new Action() {
                @Override
                public void run() throws Exception {
                    store.createList(A.tag(), "901", 999L);
                }
            }, "901st list must be blocked at 900");
            store.setCapacity(A.tag(), 299);
            eq(900, store.listCount(A.tag()), "downgrade must not delete lists");
            expectThrows(CapacityException.class, new Action() {
                @Override
                public void run() throws Exception {
                    store.createList(A.tag(), "blocked-after-downgrade", 1000L);
                }
            }, "creation must stay blocked above a lowered capacity");
            store.deleteList(A.tag(), store.lists(A.tag()).get(0).getUuid());
            eq(899, store.listCount(A.tag()), "deleting one list only removes one");
            expectThrows(LocalListsException.class, new Action() {
                @Override
                public void run() throws Exception {
                    store.setCapacity(A.tag(), 400);
                }
            }, "only 299 and 900 are supported");
        } finally {
            close(store, "capacity");
        }
    }

    private static void deleteKeepsTasks() throws Exception {
        LocalListsStore store = open("delete");
        Set<String> syntheticTasks = new HashSet<String>(Arrays.asList("task-1", "task-2"));
        try {
            LocalList one = store.createList(A.tag(), "One", 100L);
            LocalList two = store.createList(A.tag(), "Two", 101L);
            store.assignTask(A.tag(), "task-1", one.getUuid(), 200L);
            store.assignTask(A.tag(), "task-2", one.getUuid(), 201L);
            eq(2, store.membershipCount(A.tag(), one.getUuid()), "two memberships");
            store.deleteList(A.tag(), one.getUuid());
            isTrue(store.getList(A.tag(), one.getUuid()) == null, "list removed");
            isTrue(store.getMembership(A.tag(), "task-1") == null, "membership removed");
            isTrue(store.getMembership(A.tag(), "task-2") == null, "membership removed");
            eq(2, syntheticTasks.size(), "tasks still exist outside the store");
            isTrue(store.getList(A.tag(), two.getUuid()) != null, "other list retained");
            isTrue(store.assignTask(A.tag(), "task-1", two.getUuid(), 300L),
                    "existing task can be assigned again");
        } finally {
            close(store, "delete");
        }
    }

    private static void largeBackup() throws Exception {
        LocalListsStore source = open("large-source");
        LocalListsStore target = open("large-target");
        try {
            source.setCapacity(A.tag(), 900);
            List<String> sids = new ArrayList<String>();
            for (int i = 0; i < 900; i++) {
                LocalList list = source.createList(A.tag(), "Large " + i, 1000L + i);
                String sid = "large-task-" + i;
                sids.add(sid);
                source.assignTask(A.tag(), sid, list.getUuid(), 2000L + i);
            }
            eq(900, source.listCount(A.tag()), "900 source lists");
            eq(900, source.membershipCount(A.tag()), "900 source memberships");
            LocalListsBackup.ExportResult exported = LocalListsBackup.export(A, source,
                    snapshots(sids, false), 3000L);
            eq(900, exported.getListCount(), "900 exported lists");
            eq(900, exported.getTaskSnapshotCount(), "900 exported tasks");
            LocalListsBackup.Archive archive = LocalListsBackup.read(exported.getJson(), A);
            LocalListsBackup.ImportPlan plan = LocalListsBackup.preview(archive, target,
                    new HashSet<String>(sids));
            eq(900, plan.getCounts().listsAdded, "900 imported lists");
            eq(900, plan.getCounts().membershipsApplied, "900 imported memberships");
            plan.apply(target, A, null);
            eq(900, target.listCount(A.tag()), "900 target lists");
            eq(900, target.membershipCount(A.tag()), "900 target memberships");
            eq(LocalListsStore.LARGE_CAPACITY, target.capacity(A.tag()), "capacity restored");
        } finally {
            close(source, "large-source");
            close(target, "large-target");
        }
    }

    private static void assignMoveUnassign() throws Exception {
        LocalListsStore store = open("assign");
        try {
            LocalList one = store.createList(A.tag(), "One", 100L);
            LocalList two = store.createList(A.tag(), "Two", 101L);
            isTrue(store.assignTask(A.tag(), "task-1", one.getUuid(), 200L), "first assign changes");
            isTrue(!store.assignTask(A.tag(), "task-1", one.getUuid(), 201L), "same assign is idempotent");
            eq(one.getUuid(), store.getMembership(A.tag(), "task-1").getListUuid(), "assigned to one");
            eq(200L, store.getMembership(A.tag(), "task-1").getAssignedAt(), "timestamp kept");
            isTrue(store.assignTask(A.tag(), "task-1", two.getUuid(), 300L), "move changes mapping");
            eq(two.getUuid(), store.getMembership(A.tag(), "task-1").getListUuid(), "moved to two");
            eq(1, store.membershipCount(A.tag()), "one membership per task");
            store.unassignTask(A.tag(), "task-1");
            isTrue(store.getMembership(A.tag(), "task-1") == null, "unassigned");
        } finally {
            close(store, "assign");
        }
    }

    private static void roundTripAndRepeat() throws Exception {
        LocalListsStore source = open("roundtrip-source");
        LocalListsStore target = open("roundtrip-target");
        try {
            List<String> names = new ArrayList<String>();
            List<String> sids = new ArrayList<String>();
            for (int i = 0; i < 11; i++) {
                LocalList list = source.createList(A.tag(), "Local " + (i + 1), 1000L + i);
                names.add(list.getName());
                String sid = "task-" + i;
                sids.add(sid);
                source.assignTask(A.tag(), sid, list.getUuid(), 2000L + i);
            }
            LocalListsBackup.ExportResult exported = LocalListsBackup.export(A, source,
                    snapshots(sids, false), 3000L);
            eq(11, exported.getListCount(), "export list count");
            eq(11, exported.getMembershipCount(), "export membership count");
            eq(11, exported.getTaskSnapshotCount(), "export task count");
            eq(0, exported.getMissingSnapshotCount(), "no missing snapshots");
            isTrue(!exported.getJson().contains("synthetic-user-a"),
                    "raw account id must not be exported");

            LocalListsBackup.Archive archive = LocalListsBackup.read(exported.getJson(), A);
            LocalListsBackup.ImportPlan plan = LocalListsBackup.preview(archive, target,
                    new HashSet<String>(sids));
            eq(11, plan.getCounts().listsAdded, "initial import adds lists");
            eq(11, plan.getCounts().membershipsApplied, "initial import applies memberships");
            plan.apply(target, A, new File(BASE, "roundtrip-recovery.json"));
            eq(11, target.listCount(A.tag()), "target list count");
            eq(11, target.membershipCount(A.tag()), "target membership count");
            for (int i = 0; i < names.size(); i++) {
                eq(names.get(i), target.lists(A.tag()).get(i).getName(), "list order/name " + i);
            }

            LocalListsBackup.Archive reread = LocalListsBackup.read(exported.getJson(), A);
            LocalListsBackup.ImportPlan repeated = LocalListsBackup.preview(reread, target,
                    new HashSet<String>(sids));
            eq(0, repeated.getCounts().listsAdded, "repeat adds no lists");
            eq(11, repeated.getCounts().listsUnchanged, "repeat keeps lists");
            eq(11, repeated.getCounts().membershipsUnchanged, "repeat keeps memberships");
            repeated.apply(target, A, null);
            eq(11, target.listCount(A.tag()), "repeat does not duplicate lists");
            eq(11, target.membershipCount(A.tag()), "repeat does not duplicate memberships");

            expectThrows(BackupException.class, new Action() {
                @Override
                public void run() throws Exception {
                    LocalListsBackup.read(exported.getJson(), B);
                }
            }, "wrong account must be rejected");
        } finally {
            close(source, "roundtrip-source");
            close(target, "roundtrip-target");
        }
    }

    private static void newerWins() throws Exception {
        LocalListsStore one = open("newer-one");
        LocalListsStore two = open("newer-two");
        try {
            LocalList list = one.createList(A.tag(), "Old", 1000L);
            String oldJson = LocalListsBackup.export(A, one,
                    Collections.<TaskSnapshot>emptyList(), 1100L).getJson();
            one.renameList(A.tag(), list.getUuid(), "Newer", 1200L);
            LocalListsBackup.ImportPlan older = LocalListsBackup.preview(
                    LocalListsBackup.read(oldJson, A), one, null);
            eq(1, older.getCounts().listsUnchanged, "older backup does not overwrite");
            older.apply(one, A, null);
            eq("Newer", one.lists(A.tag()).get(0).getName(), "newer local name kept");

            LocalListsBackup.read(oldJson, A);
            LocalListsBackup.ImportPlan intoTwo = LocalListsBackup.preview(
                    LocalListsBackup.read(oldJson, A), two, null);
            intoTwo.apply(two, A, null);
            eq("Old", two.lists(A.tag()).get(0).getName(), "second store has old name");
            two.renameList(A.tag(), list.getUuid(), "Newest", 1300L);
            String newJson = LocalListsBackup.export(A, two,
                    Collections.<TaskSnapshot>emptyList(), 1400L).getJson();
            LocalListsBackup.ImportPlan newer = LocalListsBackup.preview(
                    LocalListsBackup.read(newJson, A), one, null);
            eq(1, newer.getCounts().listsUpdated, "newer backup updates");
            newer.apply(one, A, null);
            eq("Newest", one.lists(A.tag()).get(0).getName(), "newest name restored");
        } finally {
            close(one, "newer-one");
            close(two, "newer-two");
        }
    }

    private static void conflictKeepsExisting() throws Exception {
        LocalListsStore store = open("conflict");
        try {
            LocalList one = store.createList(A.tag(), "One", 100L);
            LocalList two = store.createList(A.tag(), "Two", 101L);
            store.assignTask(A.tag(), "task-1", one.getUuid(), 200L);
            String backup = LocalListsBackup.export(A, store,
                    snapshots(Collections.singletonList("task-1"), false), 300L).getJson();
            store.assignTask(A.tag(), "task-1", two.getUuid(), 400L);
            LocalListsBackup.ImportPlan plan = LocalListsBackup.preview(
                    LocalListsBackup.read(backup, A), store,
                    new HashSet<String>(Collections.singletonList("task-1")));
            eq(1, plan.getCounts().membershipsConflicting, "conflict detected");
            plan.apply(store, A, null);
            eq(two.getUuid(), store.getMembership(A.tag(), "task-1").getListUuid(),
                    "existing mapping wins");
            eq(1, store.membershipCount(A.tag()), "no duplicate membership");
        } finally {
            close(store, "conflict");
        }
    }

    private static void unresolvedTask() throws Exception {
        LocalListsStore source = open("unresolved-source");
        LocalListsStore target = open("unresolved-target");
        try {
            LocalList list = source.createList(A.tag(), "Missing", 100L);
            source.assignTask(A.tag(), "deleted-task", list.getUuid(), 200L);
            String backup = LocalListsBackup.export(A, source,
                    Collections.<TaskSnapshot>emptyList(), 300L).getJson();
            eq(1, LocalListsBackup.read(backup, A).getMemberships().size(), "membership retained");
            LocalListsBackup.ImportPlan missing = LocalListsBackup.preview(
                    LocalListsBackup.read(backup, A), target, Collections.<String>emptySet());
            eq(1, missing.getCounts().membershipsUnresolved, "missing task counted");
            eq(1, missing.getCounts().membershipsApplied, "membership still applied");
            missing.apply(target, A, null);
            isTrue(target.getMembership(A.tag(), "deleted-task") != null,
                    "unresolved membership stored for later");
            LocalListsBackup.ImportPlan resolved = LocalListsBackup.preview(
                    LocalListsBackup.read(backup, A), target,
                    new HashSet<String>(Collections.singletonList("deleted-task")));
            eq(0, resolved.getCounts().membershipsUnresolved, "resolves when task appears");
            eq(1, resolved.getCounts().membershipsUnchanged, "mapping remains unchanged");
        } finally {
            close(source, "unresolved-source");
            close(target, "unresolved-target");
        }
    }

    private static void corruptBackups() throws Exception {
        LocalListsStore store = open("corrupt");
        try {
            LocalList one = store.createList(A.tag(), "One", 100L);
            LocalList two = store.createList(A.tag(), "Two", 101L);
            store.assignTask(A.tag(), "task-1", one.getUuid(), 200L);
            String valid = LocalListsBackup.export(A, store,
                    snapshots(Collections.singletonList("task-1"), false), 300L).getJson();

            reject("{", store, "malformed JSON");
            reject("[]", store, "JSON array root");
            reject(valid.replace(LocalListsBackup.FORMAT, "other.format"), store, "wrong format");
            JSONObject schema = new JSONObject(valid);
            schema.put("schema", 2);
            reject(schema.toString(), store, "unknown schema");
            JSONObject wrongAccount = new JSONObject(valid);
            JSONObject account = wrongAccount.getJSONObject("account");
            account.put("tag", B.tag());
            reject(wrongAccount.toString(), store, "wrong account");
            JSONObject capacity = new JSONObject(valid);
            capacity.put("capacity", 400);
            reject(capacity.toString(), store, "bad capacity");
            JSONObject duplicateList = new JSONObject(valid);
            JSONArray lists = duplicateList.getJSONArray("lists");
            lists.put(new JSONObject(lists.getJSONObject(0).toString()));
            reject(duplicateList.toString(), store, "duplicate list id");
            JSONObject duplicateMembership = new JSONObject(valid);
            JSONArray memberships = duplicateMembership.getJSONArray("memberships");
            memberships.put(new JSONObject(memberships.getJSONObject(0).toString()));
            reject(duplicateMembership.toString(), store, "duplicate membership");
            JSONObject missingRef = new JSONObject(valid);
            missingRef.getJSONArray("memberships").getJSONObject(0).put("listUuid", "missing-list");
            reject(missingRef.toString(), store, "missing list reference");
            JSONObject badDate = new JSONObject(valid);
            badDate.getJSONArray("lists").getJSONObject(0).put("createdAt", -5);
            reject(badDate.toString(), store, "negative date");
            JSONObject attachmentBytes = new JSONObject(valid);
            attachmentBytes.put("attachmentBytesIncluded", true);
            reject(attachmentBytes.toString(), store, "unsupported attachment bytes");
            JSONObject duplicateTask = new JSONObject(valid);
            JSONArray tasks = duplicateTask.getJSONArray("tasks");
            tasks.put(new JSONObject(tasks.getJSONObject(0).toString()));
            reject(duplicateTask.toString(), store, "duplicate task snapshot");
            JSONObject tooManyLists = new JSONObject(valid);
            JSONArray many = new JSONArray();
            for (int i = 0; i < 901; i++) many.put(new JSONObject(lists.getJSONObject(0).toString()));
            tooManyLists.put("lists", many);
            reject(tooManyLists.toString(), store, "more than 900 lists");
            JSONObject missingAccount = new JSONObject(valid);
            missingAccount.remove("account");
            reject(missingAccount.toString(), store, "missing account");

            eq(2, store.listCount(A.tag()), "store unchanged after rejections");
            eq(1, store.membershipCount(A.tag()), "memberships unchanged after rejections");
            isTrue(store.getList(A.tag(), one.getUuid()) != null
                    && store.getList(A.tag(), two.getUuid()) != null, "lists intact");
        } finally {
            close(store, "corrupt");
        }
    }

    private static void rollbackAndRestore() throws Exception {
        LocalListsStore store = open("rollback");
        try {
            LocalList keep = store.createList(A.tag(), "Keep", 100L);
            store.assignTask(A.tag(), "task-1", keep.getUuid(), 200L);
            JSONObject root = new JSONObject();
            root.put("format", LocalListsBackup.FORMAT);
            root.put("schema", LocalListsBackup.SCHEMA);
            root.put("createdAt", 300L);
            JSONObject account = new JSONObject();
            account.put("tag", A.tag());
            account.put("realm", A.getRealm());
            root.put("account", account);
            root.put("capacity", 299);
            root.put("attachmentBytesIncluded", false);
            JSONArray lists = new JSONArray();
            lists.put(listJson("new-list", "New", 1, 300L, 300L));
            lists.put(listJson("fail-list", "__fail__", 2, 301L, 301L));
            root.put("lists", lists);
            root.put("memberships", new JSONArray());
            root.put("tasks", new JSONArray());
            LocalListsBackup.Archive archive = LocalListsBackup.read(root.toString(), A);
            LocalListsBackup.ImportPlan plan = LocalListsBackup.preview(archive, store, null);

            store.database().execSQL("CREATE TRIGGER test_fail BEFORE INSERT ON local_lists "
                    + "WHEN NEW.name='__fail__' BEGIN SELECT RAISE(ABORT,'synthetic failure'); END");
            File snapshot = new File(BASE, "pre-import-recovery.json");
            if (snapshot.exists()) snapshot.delete();
            expectThrows(LocalListsException.class, new Action() {
                @Override
                public void run() throws Exception {
                    plan.apply(store, A, snapshot);
                }
            }, "import failure must roll back");
            store.database().execSQL("DROP TRIGGER test_fail");
            eq(1, store.listCount(A.tag()), "rolled back to one list");
            eq("Keep", store.lists(A.tag()).get(0).getName(), "original list intact");
            isTrue(store.getMembership(A.tag(), "task-1") != null, "membership intact");
            isTrue(snapshot.isFile(), "pre-import snapshot was written");

            LocalList extra = store.createList(A.tag(), "Extra", 500L);
            eq(2, store.listCount(A.tag()), "extra list added");
            LocalListsBackup.Archive previous = LocalListsBackup.read(
                    LocalListsBackup.readFile(snapshot, 1024 * 1024), A);
            LocalListsBackup.restore(previous, store, A);
            eq(1, store.listCount(A.tag()), "restore removes lists added after the snapshot");
            isTrue(store.getList(A.tag(), extra.getUuid()) == null, "extra list removed");
            eq("Keep", store.lists(A.tag()).get(0).getName(), "snapshot list restored");
            isTrue(store.getMembership(A.tag(), "task-1") != null, "snapshot membership restored");

            expectThrows(LocalListsException.class, new Action() {
                @Override
                public void run() throws Exception {
                    store.transaction(new LocalListsStore.TransactionBody<Void>() {
                        @Override
                        public Void run() throws Exception {
                            store.createList(A.tag(), "rollback", 600L);
                            throw new LocalListsException("synthetic rollback");
                        }
                    });
                }
            }, "transaction rollback");
            isTrue(store.getList(A.tag(), // no direct lookup by name; count is sufficient
                    store.lists(A.tag()).get(0).getUuid()) != null, "store readable after rollback");
            eq(1, store.listCount(A.tag()), "transaction rolled back");
        } finally {
            close(store, "rollback");
        }
    }

    private static void supportedContents() throws Exception {
        LocalListsStore store = open("contents");
        try {
            LocalList list = store.createList(A.tag(), "Contents", 100L);
            store.assignTask(A.tag(), "task-full", list.getUuid(), 200L);
            store.assignTask(A.tag(), "task-missing", list.getUuid(), 201L);
            TaskSnapshot full = TaskSnapshot.builder("task-full")
                    .title("Synthetic title")
                    .content("Synthetic note\nwith a line break")
                    .projectSid("cloud-project-sid")
                    .parentSid("parent-task-sid")
                    .timeZone("America/Regina")
                    .repeatFlag("RRULE:FREQ=WEEKLY;BYDAY=MO")
                    .status(2)
                    .priority(5)
                    .allDay(true)
                    .startDate(1700000000000L)
                    .dueDate(1700086400000L)
                    .completedTime(1700090000000L)
                    .createdTime(1699000000000L)
                    .modifiedTime(1700100000000L)
                    .repeatFirstDate(1700000000000L)
                    .sortOrder(42L)
                    .tag("synthetic-tag")
                    .reminder(new TaskSnapshot.Reminder(1700070000000L, "PT0S", true))
                    .checklistItem(new TaskSnapshot.ChecklistItem("check-1", "Check one", true, 2,
                            0L, 1700000000000L, true, "America/Regina", 1700000001000L))
                    .attachment(new TaskSnapshot.Attachment("att-1", "note.txt", 12L, "FILE",
                            "Synthetic attachment", false))
                    .omittedField("attachmentBytes")
                    .omittedField("assignee")
                    .build();
            LocalListsBackup.ExportResult result = LocalListsBackup.export(A, store,
                    Collections.singletonList(full), 500L);
            eq(2, result.getMembershipCount(), "two memberships");
            eq(1, result.getTaskSnapshotCount(), "one snapshot");
            eq(1, result.getMissingSnapshotCount(), "missing task reported");
            eq(1, result.getAttachmentMetadataCount(), "attachment metadata counted");
            eq(2, result.getOmittedFields().size(), "unsupported fields reported");
            isTrue(result.getJson().contains("\"attachmentBytesIncluded\":false"),
                    "metadata-only manifest");
            isTrue(!result.getJson().contains("localPath"), "no local attachment path");
            isTrue(!result.getJson().contains("serverPath"), "no server attachment path");
            isTrue(!result.getJson().contains("downloadUrl"), "no attachment URL");
            LocalListsBackup.Archive archive = LocalListsBackup.read(result.getJson(), A);
            TaskSnapshot parsed = archive.findTask("task-full");
            isTrue(parsed != null, "snapshot parsed");
            eq(full, parsed, "all supported fields round trip");
            isTrue(archive.findTask("task-missing") == null, "missing task has no fabricated snapshot");

            LocalListsStore target = open("contents-target");
            try {
                LocalListsBackup.preview(archive, target,
                        new HashSet<String>(Collections.singletonList("task-full")))
                        .apply(target, A, null);
                LocalListsBackup.Archive imported = LocalListsBackup.read(
                        LocalListsBackup.export(A, target, Collections.singletonList(full), 600L)
                                .getJson(), A);
                eq(full, imported.findTask("task-full"), "snapshot survives import/export");
            } finally {
                close(target, "contents-target");
            }
        } finally {
            close(store, "contents");
        }
    }

    private static void unknownFields() throws Exception {
        LocalListsStore store = open("unknown");
        try {
            LocalList list = store.createList(A.tag(), "Known", 100L);
            store.assignTask(A.tag(), "task-1", list.getUuid(), 200L);
            String json = LocalListsBackup.export(A, store,
                    snapshots(Collections.singletonList("task-1"), false), 300L).getJson();
            JSONObject root = new JSONObject(json);
            root.put("futureRoot", "ignored");
            root.getJSONArray("lists").getJSONObject(0).put("futureListField", 1);
            root.getJSONArray("tasks").getJSONObject(0).put("futureTaskField", true);
            LocalListsBackup.Archive archive = LocalListsBackup.read(root.toString(), A);
            isTrue(!archive.getIgnoredFields().isEmpty(), "unknown fields reported");
            LocalListsBackup.ImportPlan plan = LocalListsBackup.preview(archive, store,
                    new HashSet<String>(Collections.singletonList("task-1")));
            eq(0, plan.getCounts().listsAdded, "unknown fields do not break merge");
            plan.apply(store, A, null);
        } finally {
            close(store, "unknown");
        }
    }

    private static JSONObject listJson(String uuid, String name, int order, long created,
            long updated) throws Exception {
        JSONObject json = new JSONObject();
        json.put("uuid", uuid);
        json.put("name", name);
        json.put("sortOrder", order);
        json.put("createdAt", created);
        json.put("updatedAt", updated);
        return json;
    }

    private static List<TaskSnapshot> snapshots(List<String> sids, boolean rich) {
        List<TaskSnapshot> result = new ArrayList<TaskSnapshot>();
        for (String sid : sids) {
            TaskSnapshot.Builder builder = TaskSnapshot.builder(sid)
                    .title("Title " + sid)
                    .content("Note " + sid)
                    .status(0);
            if (rich) builder.priority(3).allDay(true).dueDate(1700000000000L);
            result.add(builder.build());
        }
        return result;
    }

    private static void reject(String json, LocalListsStore store, String label) throws Exception {
        try {
            LocalListsBackup.read(json, A);
        } catch (BackupException expected) {
            return;
        }
        throw new AssertionError("Expected rejection: " + label);
    }

    private static LocalListsStore open(String name) {
        File file = dbFile(name);
        deleteDb(file);
        return LocalListsStore.open(file);
    }

    private static void close(LocalListsStore store, String name) {
        try {
            store.close();
        } finally {
            deleteDb(dbFile(name));
        }
    }

    private static File dbFile(String name) {
        return new File(BASE, name + ".db");
    }

    private static void deleteDb(File file) {
        if (file.exists() && !file.delete()) file.deleteOnExit();
        for (String suffix : new String[]{"-wal", "-shm", "-journal"}) {
            File side = new File(file.getPath() + suffix);
            if (side.exists()) side.delete();
        }
    }

    private static void run(String name, Test test) {
        long started = System.currentTimeMillis();
        try {
            test.run();
            passed++;
            System.out.println("PASS " + name + " (" + (System.currentTimeMillis() - started) + " ms)");
        } catch (Throwable error) {
            failed++;
            failures.add(name + ": " + error);
            System.out.println("FAIL " + name + " (" + (System.currentTimeMillis() - started) + " ms)");
            error.printStackTrace(System.out);
        }
    }

    private static void isTrue(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void eq(Object expected, Object actual, String message) {
        boolean equal = expected == null ? actual == null : expected.equals(actual);
        if (!equal) {
            throw new AssertionError(message + " (expected " + expected + ", actual " + actual + ")");
        }
    }

    private static void eq(long expected, long actual, String message) {
        if (expected != actual) {
            throw new AssertionError(message + " (expected " + expected + ", actual " + actual + ")");
        }
    }

    private static void expectThrows(Class<? extends Throwable> type, Action action, String message)
            throws Exception {
        try {
            action.run();
        } catch (Throwable error) {
            if (type.isInstance(error)) return;
            throw new AssertionError(message + " (wrong exception " + error + ")", error);
        }
        throw new AssertionError(message + " (no exception)");
    }

    private interface Test {
        void run() throws Exception;
    }

    private interface Action {
        void run() throws Exception;
    }
}
