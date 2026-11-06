import app.morphe.extension.swiftbackup.LocalDb;
import java.lang.reflect.*;
import java.nio.file.*;
import java.util.*;
import java.net.*;
import java.io.*;
import org.json.JSONObject;

/** Run production LocalDb with real JSON/files and only substitute the Android and cloud boundaries. */
public final class LocalDbTest {
    private static Path directory;
    private static int assertions;
    private static final String TREE = "{\"users\":{\"owner\":{\"apps\":{\"saved\":{\"keyVersion\":1}}}}}";

    /** Serve queued HTTP responses while preserving the production authentication/retry/body-building logic. */
    private static final class Http extends HttpURLConnection {
        static final Deque<Http> replies = new ArrayDeque<>();
        static final List<Http> requests = new ArrayList<>();
        final int status;
        final byte[] response;
        final ByteArrayOutputStream body = new ByteArrayOutputStream();
        boolean disconnected;
        Http(int status, String response) throws Exception {
            super(new URL("https://www.googleapis.com"));
            this.status = status;
            this.response = response.getBytes("UTF-8");
        }
        public void setRequestMethod(String method) { this.method = method; }
        public int getResponseCode() { return status; }
        public InputStream getInputStream() { return new ByteArrayInputStream(response); }
        public InputStream getErrorStream() { return new ByteArrayInputStream(response); }
        public OutputStream getOutputStream() { return body; }
        public void disconnect() { disconnected = true; }
        public void connect() {}
        public boolean usingProxy() { return false; }
    }

    /** Invoke focused private transport functions without changing production visibility. */
    private static Object drive(String method, Class<?>[] types, Object... args) throws Exception {
        Method target = LocalDb.class.getDeclaredMethod(method, types);
        target.setAccessible(true);
        try { return target.invoke(null, args); }
        catch (InvocationTargetException error) { throw (Exception) error.getCause(); }
    }

    /** Execute reseeds synchronously so missing UI updates become observable. */
    public static final class Repo {
        public void post(Runnable task) { task.run(); }
    }

    /** Deterministic cloud transport supports failed uploads and writes arriving while upload is in progress. */
    public static final class Cloud {
        static byte[] remote;
        static byte[] uploaded;
        static boolean accept;
        static Runnable duringUpload;
        static int reseeds;
        public static byte[] morpheCloudDownload() { return remote; }
        public static boolean morpheCloudUpload(byte[] bytes) {
            uploaded = bytes;
            if (duringUpload != null) { Runnable task = duringUpload; duringUpload = null; task.run(); }
            if (accept) remote = bytes;
            return accept;
        }
        public static void morpheLocalDbSeed(Repo repo) { reseeds++; }
    }

    /** Reflect private process state without introducing test hooks into the shipped extension. */
    private static void set(String name, Object value) throws Exception {
        Field field = LocalDb.class.getDeclaredField(name);
        field.setAccessible(true);
        field.set(null, value);
    }

    /** Simulate process death while retaining exactly the files from the preceding operation. */
    private static void restart() throws Exception {
        set("root", null);
        set("initialized", false);
        set("externalReconciled", false);
        set("bootstrap", true);
        set("mirrorPending", true);
        set("pending", new ArrayList<>());
        set("syncedRev", -1L);
        set("lastPull", 0L);
    }

    /** Give each scenario independent catalogs and reset cloud/Android state. */
    private static void fresh() throws Exception {
        directory = Files.createTempDirectory(Paths.get(System.getProperty("test.root")), "case-");
        Files.createDirectories(directory.resolve("private"));
        Files.createDirectories(directory.resolve("shared/SwiftBackup"));
        System.setProperty("test.external", directory.resolve("shared").toString());
        System.setProperty("test.access", "true");
        System.setProperty("test.mount", "mounted");
        qb1.connected = false;
        set("file", directory.resolve("private/morphe_local_db.json").toFile());
        set("helper", Cloud.class);
        set("repo", new Repo());
        set("repoPostMethod", "post");
        Cloud.remote = null;
        Cloud.uploaded = null;
        Cloud.accept = true;
        Cloud.duringUpload = null;
        Cloud.reseeds = 0;
        restart();
    }

    /** The mirror and journal must agree even when one publication was interrupted. */
    private static Path mirror() { return directory.resolve("shared/SwiftBackup/morphe_local_db.json"); }
    private static Path journal() { return directory.resolve("private/morphe_local_db.state"); }

    /** Treat pending null assignments as first-class operations; Firebase supports root and nested deletes. */
    private static void write(String path, Object value) {
        LocalDb.write("p", path.isEmpty() ? Collections.emptyList() : Arrays.asList(path.split("/")), value);
    }

    /** Force an individual scheduled sync tick without starting a background executor. */
    private static void sync() throws Exception {
        set("lastPull", 0L);
        Method method = LocalDb.class.getDeclaredMethod("sync");
        method.setAccessible(true);
        try { method.invoke(null); }
        catch (InvocationTargetException error) { throw (Exception) error.getCause(); }
    }

    /** Construct only the canonical cloud contract; malformed documents are tested separately. */
    private static byte[] remote(String tree, long revision) throws Exception {
        return new JSONObject().put("rev", revision).put("data", new JSONObject(tree)).toString().getBytes("UTF-8");
    }

    /** Check persisted and uploaded catalogs, not just lifecycle flags mirroring the implementation. */
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        assertions++;
        System.out.println("PASS: " + message);
    }

    /** Inspect data without depending on map iteration order. */
    private static boolean saved() { return LocalDb.load().toString().contains("keyVersion"); }
    private static boolean remoteSaved() { return new String(Cloud.remote, java.nio.charset.StandardCharsets.UTF_8).contains("keyVersion"); }

    public static void main(String[] args) throws Exception {
        // Recover an existing installation without trusting its unrelated old revision file.
        fresh();
        Files.writeString(mirror(), TREE);
        Files.writeString(directory.resolve("private/morphe_local_db.json"), "{broken");
        check(saved(), "corrupt internal snapshot recovers the external catalog");

        // Early startup writes must not become authoritative merely because a process restarted.
        fresh();
        Files.writeString(mirror(), TREE);
        System.setProperty("test.access", "false");
        write("startup", true);
        check(Files.readString(mirror()).equals(TREE), "permission-denied writes preserve the mirror");
        restart();
        System.setProperty("test.access", "true");
        write("later", true);
        check(saved() && Files.readString(mirror()).contains("keyVersion"), "restart before permission grant preserves existing backups");
        check(LocalDb.load().toString().contains("startup"), "late recovery preserves startup writes");
        check(Cloud.reseeds > 0, "late external recovery refreshes the Firebase view");

        // A known baseline still needs publication after writes made during a later storage outage.
        fresh();
        LocalDb.load();
        System.setProperty("test.mount", "unmounted");
        write("offlineSetting", true);
        restart();
        System.setProperty("test.mount", "mounted");
        LocalDb.load();
        check(Files.readString(mirror()).contains("offlineSetting"), "mirror catches up after remount without requiring another write or cloud connection");

        // Explicit deletes survive both delayed storage and another process restart.
        fresh();
        Files.writeString(mirror(), TREE);
        Files.writeString(directory.resolve("private/morphe_local_db.json"), TREE);
        System.setProperty("test.mount", "unmounted");
        write("users/owner/apps/saved", null);
        restart();
        System.setProperty("test.mount", "mounted");
        check(!saved(), "offline deletion survives mirror reconciliation after restart");

        // A deliberate empty root remains valid and its pending clear reaches the cloud after restart.
        fresh();
        Files.writeString(mirror(), TREE);
        write("", null);
        restart();
        Cloud.remote = remote(TREE, 4);
        sync();
        check(LocalDb.load().toString().equals("{}"), "empty-root deletion survives restart and cloud reconciliation");
        check(!remoteSaved(), "pending root clear is uploaded rather than silently discarded");

        // Orphaned revision files cannot suppress catalog discovery at an identical remote revision.
        fresh();
        Files.writeString(directory.resolve("private/morphe_local_db.state"), "{\"rev\":4,\"dirty\":false}");
        write("startup", true);
        Cloud.remote = remote(TREE, 4);
        sync();
        check(saved(), "orphaned revision cannot suppress remote adoption");

        // Simulate process death after journal commit but before the raw snapshot was published.
        fresh();
        write("durable", true);
        Files.writeString(directory.resolve("private/morphe_local_db.json"), "{}");
        restart();
        check(LocalDb.load().toString().contains("durable"), "committed journal repairs a stale snapshot");

        // An uncommitted write must neither receive success nor contaminate a later successful transaction.
        Files.createDirectory(journal().resolveSibling("morphe_local_db.state.tmp"));
        boolean writeFailed = false;
        try { write("uncommitted", true); } catch (IllegalStateException expected) { writeFailed = true; }
        check(writeFailed && !LocalDb.load().toString().contains("uncommitted"), "failed journal commit rejects and rolls back the write");
        Files.delete(journal().resolveSibling("morphe_local_db.state.tmp"));
        restart();
        check(LocalDb.load().toString().contains("durable") && !LocalDb.load().toString().contains("uncommitted"),
                "atomic replacement failure preserves the last committed catalog");

        // Recover corruption from the other complete journal, never from a snapshot missing deletion history.
        Files.writeString(journal(), "{broken");
        restart();
        check(LocalDb.load().toString().contains("durable"), "corrupt private journal recovers the complete external journal");
        Files.writeString(journal(), "{broken");
        Files.writeString(directory.resolve("shared/SwiftBackup/morphe_local_db.state"), "{broken");
        restart();
        boolean recoveryFailed = false;
        try { write("unsafe", true); } catch (IllegalStateException expected) { recoveryFailed = true; }
        check(recoveryFailed && Files.readString(journal()).equals("{broken"), "unrecoverable journals fail closed without publishing an incomplete catalog");

        // A deferred external commit can have its own unsynced deletion that an older raw snapshot lacks.
        fresh();
        Files.writeString(mirror(), TREE);
        write("users/owner/apps/saved", null);
        Files.delete(journal());
        Files.writeString(directory.resolve("private/morphe_local_db.json"), TREE);
        restart();
        System.setProperty("test.access", "false");
        write("startup", true);
        restart();
        System.setProperty("test.access", "true");
        check(!saved(), "external pending deletion wins over an older unbound private snapshot");

        // Mirror failures remain retryable after a valid private commit.
        fresh();
        write("first", true);
        Path blockedMirror = directory.resolve("shared/SwiftBackup/morphe_local_db.state.tmp");
        Files.createDirectory(blockedMirror);
        write("second", true);
        Files.delete(blockedMirror);
        LocalDb.load();
        check(Files.readString(mirror()).contains("second"), "failed external publication catches up without losing committed writes");

        // Losing private app data must recover the external self-contained journal, including deletions.
        fresh();
        Files.writeString(mirror(), TREE);
        write("users/owner/apps/saved", null);
        Files.delete(journal());
        Files.delete(directory.resolve("private/morphe_local_db.json"));
        restart();
        Cloud.remote = remote(TREE, 7);
        sync();
        check(!saved() && !remoteSaved(), "reinstall recovery preserves the external deletion journal");

        // A failed upload must preserve operations durably until a later successful attempt.
        fresh();
        write("users/owner/apps/saved", null);
        Cloud.remote = remote(TREE, 8);
        Cloud.accept = false;
        sync();
        restart();
        Cloud.accept = true;
        sync();
        check(!saved() && !remoteSaved(), "failed-upload tombstones survive restart and retry");

        // Remote changes win over clean stale snapshots; only locally pending paths override them.
        fresh();
        Cloud.remote = remote(TREE, 1);
        sync();
        Cloud.remote = remote("{\"remoteSetting\":true}", 2);
        write("localSetting", true);
        sync();
        check(!saved() && !remoteSaved(), "remote deletion is not resurrected by an unrelated local write");
        check(LocalDb.load().toString().contains("localSetting"), "unrelated local write survives remote reconciliation");

        // New writes arriving during network I/O must remain pending after the uploaded prefix is acknowledged.
        fresh();
        write("first", true);
        Cloud.remote = remote("{}", 1);
        Cloud.duringUpload = () -> write("second", true);
        sync();
        restart();
        sync();
        check(new String(Cloud.remote, "UTF-8").contains("second"), "write arriving during upload survives acknowledgement and restart");

        // Increment placeholders must be resolved exactly once rather than executed again during journal replay.
        fresh();
        Map<String, Object> increment = new HashMap<>();
        increment.put("increment", 1L);
        Map<String, Object> placeholder = new HashMap<>();
        placeholder.put(".sv", increment);
        write("counter", placeholder);
        restart();
        Cloud.remote = remote("{}", 1);
        sync();
        check(new JSONObject(new String(Cloud.remote, "UTF-8")).getJSONObject("data").getLong("counter") == 1,
                "replaying pending writes does not increment twice");

        // A valid empty remote catalog at a matching revision still needs to be adopted.
        fresh();
        Cloud.remote = remote("{}", 1);
        sync();
        restart();
        sync();
        check(LocalDb.load().toString().equals("{}"), "empty cloud catalog survives repeated restarts");

        // Invalid and obsolete cloud shapes must fail closed rather than trigger a replacement upload.
        for (String invalid : Arrays.asList("{broken", TREE, "{\"rev\":1}", "{\"rev\":0,\"data\":{}}")) {
            fresh();
            write("local", true);
            Cloud.remote = invalid.getBytes("UTF-8");
            boolean failed = false;
            try { sync(); } catch (Exception expected) { failed = true; }
            check(failed && Cloud.uploaded == null, "invalid cloud document is never overwritten: " + invalid.substring(0, Math.min(18, invalid.length())));
        }

        // Settings snapshots share the same durable cloud reconciliation and survive private-data loss.
        fresh();
        String export = "{\"settings\":{\"theme\":\"dark\"},\"favorites\":{\"items\":[]},\"blacklist\":{\"items\":[{\"packageName\":\"test.app\",\"blackListType\":1}]}}";
        LocalDb.storeSettingsBackup(export);
        restart();
        check(new JSONObject(LocalDb.settingsBackup()).getJSONObject("settings").getJSONObject("blacklist").getJSONArray("items").length() == 1,
                "settings, favorites, and blacklist snapshot survive restart");
        Cloud.remote = remote("{}", 1);
        sync();
        check(new JSONObject(new String(Cloud.remote, "UTF-8")).getJSONObject("data").has("morphe_settings_backup"),
                "settings snapshot uploads through the connected cloud metadata transport");
        Files.delete(journal());
        Files.delete(directory.resolve("private/morphe_local_db.json"));
        Files.delete(directory.resolve("shared/SwiftBackup/morphe_local_db.state"));
        Files.delete(mirror());
        restart();
        sync();
        check(new JSONObject(LocalDb.settingsBackup()).getJSONObject("settings").getJSONObject("settings").getString("theme").equals("dark"),
                "fresh install retrieves the settings snapshot from cloud without applying it");

        // No request can leave this JVM: the factory rejects unexpected HTTP calls instead of reaching the network.
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
            protected URLConnection openConnection(URL url) throws IOException {
                if (Http.replies.isEmpty()) throw new IOException("Unexpected request: " + url);
                Http response = Http.replies.removeFirst();
                Http.requests.add(response);
                return response;
            }
        } : null);
        qb1.connected = true;
        Class<?> contextType = Class.forName("app.morphe.extension.swiftbackup.LocalDb$DriveContext");
        Object context = drive("getDriveContext", new Class<?>[]{});
        check(context != null, "reflective Drive context resolves the verified app member shapes");
        for (String response : Arrays.asList("{}", "{\"files\":[{}]}", "{\"files\":[{\"id\":\"a\"},{\"id\":\"b\"}]}")) {
            Http.replies.add(new Http(200, response));
            boolean failed = false;
            try { drive("findDriveFileId", new Class<?>[]{contextType, String.class}, context, "morphe_local_db.json"); }
            catch (Exception expected) { failed = true; }
            check(failed, "malformed or ambiguous lookup cannot authorize an overwrite");
        }
        Http.replies.add(new Http(503, "unavailable"));
        boolean failed = false;
        try { drive("findDriveFileId", new Class<?>[]{contextType, String.class}, context, "morphe_local_db.json"); }
        catch (IOException expected) { failed = true; }
        check(failed, "HTTP 503 is distinguished from a missing Drive file");
        Http.replies.add(new Http(401, "expired"));
        Http.replies.add(new Http(200, "{\"files\":[]}"));
        Object absent = drive("findDriveFileId", new Class<?>[]{contextType, String.class}, context, "morphe_local_db.json");
        check(absent == null && d04.refreshes == 1, "expired token refreshes once before a successful absence result");
        Http.replies.add(new Http(200, "{\"files\":[{\"id\":\"existing\"}]}"));
        Http.replies.add(new Http(200, ""));
        check(drive("gDriveDownload", new Class<?>[]{}) == null, "empty existing Drive catalog aborts sync rather than authorizing creation");
        Http.replies.add(new Http(200, "{\"files\":[]}"));
        Http created = new Http(200, "{\"id\":\"created\"}");
        Http.replies.add(created);
        check(Boolean.TRUE.equals(drive("gDriveUpload", new Class<?>[]{byte[].class}, (Object) remote(TREE, 1))),
                "new Drive catalog uploads metadata and content in one request");
        check(created.getRequestProperty("Content-Type").startsWith("multipart/related")
                && created.body.toString("UTF-8").contains("keyVersion")
                && created.body.toString("UTF-8").contains("test-folder"), "multipart creation contains both parent metadata and the complete catalog");
        check(Http.requests.stream().allMatch(request -> request.disconnected), "all Drive connections close on success, retry, and failure");

        // Verify WiFi cloud backup reconciliation: unindexed wifi_networks.wfi is discovered from Drive and populates metadata
        fresh();
        set("helper", null);
        qb1.connected = true;
        Map<String, Object> testTree = (Map<String, Object>) drive("fromJson", new Class<?>[]{Object.class},
                new org.json.JSONObject("{\"users\":{\"test_user\":{\"cloud_v1\":{\"google_drive (test@gmailcom)\":{\"tags\":{}}}}}}"));
        Http.replies.add(new Http(200, "{\"files\":[{\"id\":\"wifi-drive-id-123\",\"size\":214533}]}"));
        boolean wifiReconciled = (Boolean) drive("reconcileWifi", new Class<?>[]{Map.class}, testTree);
        check(wifiReconciled, "unindexed wifi_networks.wfi is reconciled from Drive into metadata");
        Map<?, ?> cloudNode = (Map<?, ?>) ((Map<?, ?>) ((Map<?, ?>) testTree.get("users")).get("test_user")).get("cloud_v1");
        Map<?, ?> driveNode = (Map<?, ?>) cloudNode.get("google_drive (test@gmailcom)");
        Map<?, ?> wifiDetails = (Map<?, ?>) driveNode.get("wifi");
        check(wifiDetails != null && "wifi-drive-id-123".equals(wifiDetails.get("driveId"))
                && Long.valueOf(214533).equals(wifiDetails.get("fileSize")),
                "reconciled WiFi metadata contains verified driveId and fileSize");

        // Reproduce the direct-to-Settings startup route: neither Repo, helper, nor executor has initialized yet.
        fresh();
        set("helper", null);
        set("repo", null);
        set("executor", null);
        Cloud.remote = remote("{\"morphe_settings_backup\":{\"version\":1,\"updatedAt\":1,\"settings\":{\"settings\":{}}}}", 2);
        java.util.concurrent.CountDownLatch completed = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.atomic.AtomicReference<Throwable> failure = new java.util.concurrent.atomic.AtomicReference<>();
        LocalDb.runSettingsTask(() -> {
            try {
                if (!LocalDb.syncSettingsNow() || LocalDb.settingsBackup() == null) throw new AssertionError("Settings snapshot not retrieved");
            } catch (Throwable error) { failure.set(error); }
            finally { completed.countDown(); }
        });
        check(completed.await(5, java.util.concurrent.TimeUnit.SECONDS) && failure.get() == null,
                "settings work initializes cloud transport and executor without a Repo or Cloud-tab visit");
        Field executor = LocalDb.class.getDeclaredField("executor");
        executor.setAccessible(true);
        ((java.util.concurrent.ScheduledExecutorService) executor.get(null)).shutdownNow();
        executor.set(null, null);
        System.out.println("Assertions passed: " + assertions);
    }
}
