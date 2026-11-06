package app.morphe.extension.swiftbackup;

import android.os.Environment;
import android.os.Build;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Local replacement for Swift Backup's Firebase Realtime Database backend.
 * Commits the tree and pending path replacements together in a private journal, with readable JSON snapshots.
 * A shared-storage copy permits recovery after reinstall when storage access is granted; the cloud copy
 * permits recovery on another device. Pending deletions survive both paths instead of being merged away.
 * Called from smali injected by the "Swift Backup Local Cloud Metadata" patch.
 */
@SuppressWarnings({"unchecked", "rawtypes", "unused"})
public final class LocalDb {
    private static final String TAG = "MorpheLocalDb";
    private static final String FILE_NAME = "morphe_local_db.json";
    private static final String FALLBACK_DIR = "/data/data/org.swiftapps.swiftbackup/files";

    private static final String STATE_FILE_NAME = "morphe_local_db.state";
    private static final long SYNC_INTERVAL_SECONDS = 20;
    private static final long PULL_INTERVAL_MS = 5 * 60 * 1000;

    private static Map<String, Object> root;
    private static File file;

    // The journal commits the tree and pending path replacements together; snapshots alone cannot preserve deletes.
    private static boolean initialized;
    private static boolean externalReconciled;
    private static boolean bootstrap = true;
    private static List<Map<String, Object>> pending = new ArrayList<>();
    // Retry mirror publication after remounts even when there is no new write or usable cloud connection.
    private static boolean mirrorPending = true;

    // Cloud sync state. syncedRev is the remote revision the local tree was last reconciled with.
    private static long syncedRev = -1;
    private static long lastPull;
    private static ScheduledExecutorService executor;

    // Obfuscated app objects, handed over by the patched code and only used reflectively.
    private static Object repo;
    private static Class<?> helper;
    private static String repoPostMethod;

    // Settings use one explicit node in the existing cloud document, independent of app-backup catalog paths.
    private static final String SETTINGS_BACKUP_NODE = "morphe_settings_backup";

    private LocalDb() {
    }

    /** Mounted media and an actual all-files grant are required before inspecting the shared mirror. */
    private static boolean isExternalStorageAccessible() {
        if (Build.VERSION.SDK_INT >= 30 && !Environment.isExternalStorageManager()) return false;
        String state = Environment.getExternalStorageState();
        return Environment.MEDIA_MOUNTED.equals(state) || Environment.MEDIA_MOUNTED_READ_ONLY.equals(state);
    }

    /** Read an entire candidate, accepting an intentionally empty object and rejecting truncated JSON. */
    private static Map<String, Object> readTree(File candidate) throws Exception {
        if (!candidate.isFile()) return null;
        return (Map<String, Object>) fromJson(new JSONObject(new String(readAll(candidate), "UTF-8")));
    }

    /** A journal is self-contained; an unrelated snapshot or revision file cannot suppress recovery. */
    private static Map<String, Object> readJournal(File candidate) throws Exception {
        Map<String, Object> state = readTree(candidate);
        if (state == null || !Long.valueOf(1).equals(state.get("version"))) return null;
        if (!(state.get("data") instanceof Map) || !(state.get("pending") instanceof List)
                || !(state.get("rev") instanceof Number) || !(state.get("bootstrap") instanceof Boolean)
                || !(state.get("externalReconciled") instanceof Boolean)) {
            throw new IllegalStateException("Invalid local metadata journal: " + candidate);
        }
        for (Object entry : (List) state.get("pending")) {
            if (!(entry instanceof Map) || !(((Map) entry).get("path") instanceof List)) {
                throw new IllegalStateException("Invalid pending metadata operation");
            }
            for (Object segment : (List) ((Map) entry).get("path")) {
                if (!(segment instanceof String)) throw new IllegalStateException("Invalid metadata path");
            }
        }
        return state;
    }

    /** Restore the complete durable commit, including a pending clear and deferred external recovery. */
    private static void adoptJournal(Map<String, Object> state) {
        root = (Map<String, Object>) state.get("data");
        pending = (List<Map<String, Object>>) (List) state.get("pending");
        syncedRev = ((Number) state.get("rev")).longValue();
        bootstrap = (Boolean) state.get("bootstrap");
        externalReconciled = (Boolean) state.get("externalReconciled");
    }

    /** Pending assignments contain resolved values, so replay does not repeat increments or timestamps. */
    private static Map<String, Object> replay(Map<String, Object> base, List<Map<String, Object>> operations) throws Exception {
        Object value = fromJson(toJson(base));
        for (Map<String, Object> operation : operations) {
            value = set(value, (List<String>) (List) operation.get("path"), 0,
                    fromJson(toJson(operation.get("value"))));
        }
        return value instanceof Map ? (Map<String, Object>) value : new HashMap<String, Object>();
    }

    /** Import a deferred mirror only before cloud reconciliation, then replay explicit deletes as well as puts. */
    private static boolean reconcileExternalMirrorIfNeeded() throws Exception {
        if (externalReconciled || !isExternalStorageAccessible()) return false;
        Map<String, Object> external = readJournal(externalStateFile());
        Map<String, Object> tree = external == null ? readTree(externalFile())
                : (Map<String, Object>) external.get("data");
        if (bootstrap && tree != null) {
            Map<String, Object> recovered = (Map<String, Object>) merge(tree, root);
            // The external journal may itself have unsynced deletes; replay those before newer private operations.
            if (external != null) recovered = replay(recovered, (List<Map<String, Object>>) (List) external.get("pending"));
            root = replay(recovered, pending);
        }
        externalReconciled = true;
        // Persist completion before publishing the mirror; process death cannot turn a partial tree into a complete one.
        save();
        return tree != null && bootstrap;
    }

    /** Load once per process; the journal, rather than tree emptiness, determines recovery and deletion state. */
    public static synchronized Object load() {
        if (!initialized) {
            root = new HashMap<>();
            try {
                Map<String, Object> state = null;
                boolean journalFailed = false;
                try {
                    state = readJournal(new File(file().getParentFile(), STATE_FILE_NAME));
                } catch (Exception t) {
                    journalFailed = true;
                    log("Internal journal unavailable; trying the external recovery copy", t);
                }
                if (state != null) {
                    adoptJournal(state);
                } else {
                    Map<String, Object> internal = null;
                    try {
                        internal = readTree(file());
                    } catch (Exception t) {
                        log("Internal snapshot unavailable; trying the external recovery copy", t);
                    }
                    if (isExternalStorageAccessible()) {
                        // Prefer an external commit over an unbound snapshot: it may contain pending deletions.
                        state = readJournal(externalStateFile());
                        if (state != null) adoptJournal(state);
                        else if (journalFailed) throw new IllegalStateException("No valid recovery journal is available");
                        else if (internal != null) root = internal;
                    } else if (journalFailed) {
                        throw new IllegalStateException("Recovery journal requires access to the external mirror");
                    } else if (internal != null) {
                        root = internal;
                    }
                }
                initialized = true;
            } catch (Exception t) {
                // Fail closed instead of acknowledging writes against a catalog whose recovery failed.
                throw new IllegalStateException("Cannot recover local cloud metadata", t);
            }
        }
        try {
            if (reconcileExternalMirrorIfNeeded() && repo != null) reseed();
            if (mirrorPending && externalReconciled && isExternalStorageAccessible()) save();
        } catch (Exception t) {
            log("External recovery deferred; existing mirror is preserved", t);
        }
        return root;
    }

    /** Record one final path value, including null tombstones, after resolving Firebase placeholders once. */
    private static void record(List<String> path, Object value) throws Exception {
        put(path, value);
        Map<String, Object> operation = new HashMap<>();
        operation.put("path", new ArrayList<>(path));
        operation.put("value", fromJson(toJson(get(path))));
        pending.add(operation);
    }

    /** Commit a put or multi-path merge before the injected Firebase code acknowledges it. */
    public static synchronized Object write(String action, List path, Object data) {
        load();
        List<String> segments = new ArrayList<>();
        if (path != null) for (Object segment : path) segments.add(String.valueOf(segment));
        Map<String, Object> before = root;
        int pendingCount = pending.size();
        try {
            // Isolate the transaction so a failed atomic commit cannot leak unacknowledged values into later writes.
            root = (Map<String, Object>) fromJson(toJson(root));
            if ("m".equals(action) && data instanceof Map) {
                for (Map.Entry<?, ?> entry : ((Map<?, ?>) data).entrySet()) {
                    List<String> child = new ArrayList<>(segments);
                    for (String part : String.valueOf(entry.getKey()).split("/")) {
                        if (!part.isEmpty()) child.add(part);
                    }
                    record(child, entry.getValue());
                }
            } else {
                record(segments, data);
            }
            save();
            return get(segments);
        } catch (Exception t) {
            root = before;
            pending = new ArrayList<>(pending.subList(0, pendingCount));
            // Throwing prevents the injected success acknowledgement from claiming an undurable write succeeded.
            throw new IllegalStateException("Cannot persist local cloud metadata", t);
        }
    }

    /**
     * Called once the database client is set up.
     *
     * @param repo           the Firebase Repo.
     * @param helper         class holding the injected static helpers
     *                       (morpheLocalDbSeed, morpheCloudDownload, morpheCloudUpload).
     * @param repoPostMethod name of the Repo method that posts a Runnable to its run loop.
     */
    public static synchronized void attach(Object repo, Class<?> helper, String repoPostMethod) {
        LocalDb.repo = repo;
        LocalDb.helper = helper;
        LocalDb.repoPostMethod = repoPostMethod;
        ensureExecutor();
    }

    /** Settings can be opened before Firebase Repo exists; keep one executor for both startup routes. */
    private static synchronized void ensureExecutor() {
        if (executor == null) {
            executor = Executors.newSingleThreadScheduledExecutor();
            executor.scheduleWithFixedDelay(new Runnable() {
                @Override
                public void run() {
                    try {
                        SettingsBackup.tick();
                    } catch (Throwable t) {
                        log("Automatic settings capture failed; previous backup retained", t);
                    }
                    try {
                        sync();
                    } catch (Throwable t) {
                        log("sync failed", t);
                    }
                }
            }, 5, SYNC_INTERVAL_SECONDS, TimeUnit.SECONDS);
        }
    }

    /** Serialize settings work on the cloud executor so restore and upload cannot race with a normal sync tick. */
    public static synchronized void runSettingsTask(Runnable task) {
        ensureExecutor();
        executor.execute(task);
    }

    /** Force a fresh cloud reconciliation before an explicit restore or a user-requested backup. */
    public static boolean syncSettingsNow() throws Exception {
        lastPull = 0;
        sync();
        return lastPull != 0;
    }

    /** Commit the native export through the same durable journal as backup catalogs, preserving its JSON shape. */
    public static void storeSettingsBackup(String settings) throws Exception {
        JSONObject backup = new JSONObject();
        backup.put("version", 1);
        backup.put("updatedAt", System.currentTimeMillis());
        backup.put("settings", new JSONObject(settings));
        write("p", java.util.Collections.singletonList(SETTINGS_BACKUP_NODE), fromJson(backup));
    }

    /** Return a detached snapshot so UI work cannot mutate the metadata tree outside the journal. */
    public static synchronized String settingsBackup() throws Exception {
        load();
        Object backup = root.get(SETTINGS_BACKUP_NODE);
        return backup == null ? null : ((JSONObject) toJson(backup)).toString();
    }

    /** Reconcile the downloaded snapshot with pending operations; stale local snapshots never override cloud deletes. */
    private static void sync() throws Exception {
        long now = System.currentTimeMillis();
        synchronized (LocalDb.class) {
            load();
            if (pending.isEmpty() && !bootstrap && lastPull != 0 && now - lastPull < PULL_INTERVAL_MS) return;
        }

        // The patch injects this static transport independently of Repo initialization; no Cloud-tab visit is needed.
        if (helper == null) helper = Class.forName("wz5");
        byte[] remote = (byte[]) helper.getMethod("morpheCloudDownload").invoke(null);
        if (remote == null) remote = gDriveDownload();
        if (remote == null) return;

        // One cloud contract: reject malformed or raw documents without ever replacing them.
        long remoteRev = 0;
        Map<String, Object> remoteData = null;
        if (remote.length > 0) {
            JSONObject document = new JSONObject(new String(remote, "UTF-8"));
            Object revision = document.get("rev");
            if (!(revision instanceof Number) || ((Number) revision).longValue() < 1
                    || ((Number) revision).doubleValue() != ((Number) revision).longValue()) {
                throw new IllegalStateException("Invalid cloud metadata revision");
            }
            remoteRev = ((Number) revision).longValue();
            remoteData = (Map<String, Object>) fromJson(document.getJSONObject("data"));
        }

        byte[] upload = null;
        Map<String, Object> uploadedTree = null;
        int uploadedCount = 0;
        boolean adopted;
        synchronized (LocalDb.class) {
            Map<String, Object> before = root;
            if (remoteData != null) {
                // Unbound snapshots seed existing installations once; thereafter only explicit pending paths win.
                root = replay(bootstrap ? (Map<String, Object>) merge(remoteData, root) : remoteData, pending);
                bootstrap = false;
                syncedRev = remoteRev;
            }
            adopted = !root.equals(before);
            // Reconcile unindexed cloud WiFi backups (e.g. wifi_networks.wfi) into metadata
            if (reconcileWifi(root)) adopted = true;
            if (!pending.isEmpty() || (remoteData == null && !root.isEmpty())
                    || (remoteData != null && !root.equals(remoteData))) {
                uploadedTree = (Map<String, Object>) fromJson(toJson(root));
                JSONObject document = new JSONObject();
                document.put("rev", remoteRev + 1);
                document.put("data", toJson(uploadedTree));
                upload = document.toString().getBytes("UTF-8");
                uploadedCount = pending.size();
            }
            // Persist adopted data and outstanding operations together before network I/O or UI reseeding.
            save();
        }
        if (adopted) reseed();
        if (upload != null) {
            boolean ok = Boolean.TRUE.equals(helper.getMethod("morpheCloudUpload", byte[].class)
                    .invoke(null, (Object) upload));
            if (!ok) ok = gDriveUpload(upload);
            if (!ok) return;
            synchronized (LocalDb.class) {
                // Writes arriving during upload remain queued; only the uploaded prefix is acknowledged.
                pending = new ArrayList<>(pending.subList(uploadedCount, pending.size()));
                root = replay(uploadedTree, pending);
                syncedRev = remoteRev + 1;
                bootstrap = false;
                save();
            }
        }
        lastPull = now;
    }

    /** Pushes the current tree into the database client again, on its run loop. */
    private static void reseed() throws Exception {
        final Object repo = LocalDb.repo;
        // An eventual Firebase initialization seeds from the committed journal; there is no UI tree to update yet.
        if (repo == null) return;
        repo.getClass().getMethod(repoPostMethod, Runnable.class).invoke(repo, new Runnable() {
            @Override
            public void run() {
                try {
                    helper.getMethod("morpheLocalDbSeed", repo.getClass()).invoke(null, repo);
                } catch (Throwable t) {
                    log("reseed failed", t);
                }
            }
        });
    }

    private static Object merge(Object base, Object overlay) {
        if (!(base instanceof Map) || !(overlay instanceof Map)) return overlay;
        Map<String, Object> out = new HashMap<>((Map<String, Object>) base);
        for (Map.Entry<String, Object> e : ((Map<String, Object>) overlay).entrySet()) {
            Object existing = out.get(e.getKey());
            out.put(e.getKey(), existing == null ? e.getValue() : merge(existing, e.getValue()));
        }
        return out;
    }

    private static byte[] readAll(File f) throws Exception {
        byte[] bytes = new byte[(int) f.length()];
        try (FileInputStream in = new FileInputStream(f)) {
            int off = 0;
            while (off < bytes.length) {
                int n = in.read(bytes, off, bytes.length - off);
                if (n < 0) break;
                off += n;
            }
        }
        return bytes;
    }

    private static void put(List<String> path, Object value) {
        value = resolve(value, get(path));
        if (path.isEmpty()) {
            root = value instanceof Map ? (Map<String, Object>) value : new HashMap<String, Object>();
            return;
        }
        root = (Map<String, Object>) set(root, path, 0, value);
        if (root == null) root = new HashMap<>();
    }

    /** Returns the node with the value applied, or null if the node became empty. */
    private static Object set(Object node, List<String> path, int index, Object value) {
        if (index == path.size()) return isEmpty(value) ? null : value;
        Map<String, Object> map = asMap(node);
        String key = path.get(index);
        Object child = set(map.get(key), path, index + 1, value);
        if (child == null) map.remove(key);
        else map.put(key, child);
        return map.isEmpty() ? null : map;
    }

    private static Object get(List<String> path) {
        Object node = root;
        for (String key : path) {
            if (node instanceof List) node = asMap(node);
            if (!(node instanceof Map)) return null;
            node = ((Map) node).get(key);
        }
        return node;
    }

    private static Map<String, Object> asMap(Object node) {
        if (node instanceof Map) return (Map<String, Object>) node;
        Map<String, Object> map = new HashMap<>();
        if (node instanceof List) {
            List list = (List) node;
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i) != null) map.put(String.valueOf(i), list.get(i));
            }
        }
        return map;
    }

    private static boolean isEmpty(Object value) {
        return value == null
                || (value instanceof Map && ((Map) value).isEmpty())
                || (value instanceof List && ((List) value).isEmpty());
    }

    /** Resolves server value placeholders and normalises number types. */
    private static Object resolve(Object value, Object existing) {
        if (value instanceof Map) {
            Map<?, ?> in = (Map<?, ?>) value;
            Object sv = in.get(".sv");
            if (sv != null) {
                if ("timestamp".equals(sv)) return System.currentTimeMillis();
                if (sv instanceof Map && ((Map) sv).get("increment") instanceof Number) {
                    Number delta = (Number) ((Map) sv).get("increment");
                    if (existing instanceof Number) {
                        Number current = (Number) existing;
                        if (current instanceof Double || delta instanceof Double) {
                            return current.doubleValue() + delta.doubleValue();
                        }
                        return current.longValue() + delta.longValue();
                    }
                    return delta instanceof Double ? (Object) delta : (Object) delta.longValue();
                }
            }
            Map existingMap = existing instanceof Map ? (Map) existing : null;
            Map<String, Object> out = new HashMap<>();
            for (Map.Entry<?, ?> e : in.entrySet()) {
                String key = String.valueOf(e.getKey());
                Object child = resolve(e.getValue(), existingMap == null ? null : existingMap.get(key));
                if (!isEmpty(child)) out.put(key, child);
            }
            return out;
        }
        if (value instanceof List) {
            List<Object> out = new ArrayList<>();
            for (Object o : (List) value) out.add(resolve(o, null));
            return out;
        }
        if (value instanceof Integer || value instanceof Short || value instanceof Byte) {
            return ((Number) value).longValue();
        }
        if (value instanceof Float) return ((Number) value).doubleValue();
        return value;
    }

    /** Replace within the same directory atomically; never delete or truncate the last good target on failure. */
    private static void writeFileAtomic(File target, byte[] bytes) throws Exception {
        File parent = target.getParentFile();
        if (!parent.isDirectory() && !parent.mkdirs()) throw new java.io.IOException("Cannot create " + parent);
        File tmp = new File(target.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(bytes);
            out.getFD().sync();
        }
        Files.move(tmp.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
    }

    /** The self-contained journal is authoritative; JSON files are replaceable snapshots for inspection/recovery. */
    private static void save() throws Exception {
        mirrorPending = true;
        JSONObject state = new JSONObject();
        state.put("version", 1);
        state.put("data", toJson(root));
        state.put("pending", toJson(pending));
        state.put("rev", syncedRev);
        state.put("bootstrap", bootstrap);
        state.put("externalReconciled", externalReconciled);
        byte[] journal = state.toString().getBytes("UTF-8");
        byte[] snapshot = ((JSONObject) toJson(root)).toString().getBytes("UTF-8");
        File internal = file();
        writeFileAtomic(new File(internal.getParentFile(), STATE_FILE_NAME), journal);
        try {
            writeFileAtomic(internal, snapshot);
        } catch (Exception t) {
            // The committed journal can repair a missing or stale snapshot after process death.
            log("Internal snapshot update deferred", t);
        }
        if (!externalReconciled || !isExternalStorageAccessible()) return;
        try {
            writeFileAtomic(externalStateFile(), journal);
            writeFileAtomic(externalFile(), snapshot);
            mirrorPending = false;
        } catch (Exception t) {
            log("External mirror update deferred; internal journal is committed", t);
        }
    }

    private static Object toJson(Object value) throws Exception {
        if (value instanceof Map) {
            JSONObject o = new JSONObject();
            for (Map.Entry<?, ?> e : ((Map<?, ?>) value).entrySet()) {
                o.put(String.valueOf(e.getKey()), toJson(e.getValue()));
            }
            return o;
        }
        if (value instanceof List) {
            JSONArray a = new JSONArray();
            for (Object o : (List) value) a.put(o == null ? JSONObject.NULL : toJson(o));
            return a;
        }
        return value;
    }

    private static Object fromJson(Object value) throws Exception {
        if (value instanceof JSONObject) {
            JSONObject o = (JSONObject) value;
            Map<String, Object> map = new HashMap<>();
            for (Iterator<String> it = o.keys(); it.hasNext(); ) {
                String key = it.next();
                Object child = fromJson(o.get(key));
                if (child != null) map.put(key, child);
            }
            return map;
        }
        if (value instanceof JSONArray) {
            JSONArray a = (JSONArray) value;
            List<Object> list = new ArrayList<>();
            for (int i = 0; i < a.length(); i++) list.add(fromJson(a.get(i)));
            return list;
        }
        if (value == null || value == JSONObject.NULL) return null;
        if (value instanceof Integer) return ((Integer) value).longValue();
        return value;
    }

    /**
     * Resolves the internal sandbox database file (/data/data/org.swiftapps.swiftbackup/files/morphe_local_db.json).
     */
    private static File file() throws Exception {
        if (file == null) {
            File dir;
            try {
                // No Context is reachable from the Firebase run loop, so ask the framework.
                Object app = Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                dir = (File) app.getClass().getMethod("getFilesDir").invoke(app);
            } catch (Throwable t) {
                dir = new File(FALLBACK_DIR);
            }
            file = new File(dir, FILE_NAME);
        }
        return file;
    }

    /**
     * Returns the external mirror file located in Swift Backup's primary storage directory
     * (/storage/emulated/0/SwiftBackup/morphe_local_db.json).
     * This location survives application uninstall, data wipe, and updates.
     */
    private static File externalFile() {
        try {
            File ext = Environment.getExternalStorageDirectory();
            if (ext != null) {
                File dir = new File(ext, "SwiftBackup");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                return new File(dir, FILE_NAME);
            }
        } catch (Throwable t) {
            log("externalFile resolution failed", t);
        }
        return new File("/storage/emulated/0/SwiftBackup", FILE_NAME);
    }

    /**
     * Returns the external authoritative journal, including catalog and unsynced replacements.
     */
    private static File externalStateFile() {
        try {
            File ext = Environment.getExternalStorageDirectory();
            if (ext != null) {
                File dir = new File(ext, "SwiftBackup");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                return new File(dir, STATE_FILE_NAME);
            }
        } catch (Throwable t) {
            log("externalStateFile resolution failed", t);
        }
        return new File("/storage/emulated/0/SwiftBackup", STATE_FILE_NAME);
    }

    /* -------------------------------------------------------------------------
     * Google Drive Cloud Sync Implementation
     * ------------------------------------------------------------------------- */

    /**
     * Holds reflective runtime references to Swift Backup's Google Drive client,
     * the remote main backup folder ID, and the active OAuth access token.
     */
    private static class DriveContext {
        final Object d04;
        final String folderId;
        String token;

        DriveContext(Object d04, String folderId, String token) {
            this.d04 = d04;
            this.folderId = folderId;
            this.token = token;
        }
    }

    /**
     * Resolves the Google Drive context reflectively from Swift Backup's obfuscated classes.
     * Uses qb1 (cloud connection manager) and fu3 (Google Drive client) to extract d04 (Drive REST client)
     * and the active OAuth Bearer token. Returns null if Google Drive is not currently connected/authorized.
     */
    private static DriveContext getDriveContext() {
        try {
            Class<?> qb1 = Class.forName("qb1");
            Method isAuth = qb1.getMethod("d");
            if (!Boolean.TRUE.equals(isAuth.invoke(null))) return null;

            Object client = qb1.getMethod("c").invoke(null);
            if (client == null) return null;

            // Swift Backup 5.1.0: fu3 is the Google Drive GClient implementation
            if (!"fu3".equals(client.getClass().getName())) {
                return null;
            }

            Field hField = client.getClass().getField("h");
            Object d04 = hField.get(client);
            if (d04 == null) return null;

            Method getFolderId = qb1.getMethod("j");
            String folderId = (String) getFolderId.invoke(null);
            if (folderId == null || folderId.trim().isEmpty()) return null;

            String token = getDriveToken(d04);
            if (token == null || token.trim().isEmpty()) {
                token = refreshDriveToken(d04);
            }
            if (token == null || token.trim().isEmpty()) return null;

            return new DriveContext(d04, folderId, token);
        } catch (Throwable t) {
            log("getDriveContext failed", t);
        }
        return null;
    }

    /**
     * Retrieves the current OAuth bearer token from d04's token provider function (d04.a).
     */
    private static String getDriveToken(Object d04) {
        try {
            Field aField = d04.getClass().getField("a");
            Object invokable = aField.get(d04);
            Method m = invokable.getClass().getMethod("invoke");
            return (String) m.invoke(invokable);
        } catch (Throwable t) {
            log("getDriveToken failed", t);
        }
        return null;
    }

    /**
     * Refreshes the OAuth token via d04's refresh function (d04.b) and returns the updated token.
     */
    private static String refreshDriveToken(Object d04) {
        try {
            Field bField = d04.getClass().getField("b");
            Object invokable = bField.get(d04);
            Method m = invokable.getClass().getMethod("invoke");
            Boolean ok = (Boolean) m.invoke(invokable);
            if (Boolean.TRUE.equals(ok)) {
                return getDriveToken(d04);
            }
        } catch (Throwable t) {
            log("refreshDriveToken failed", t);
        }
        return null;
    }

    /**
     * Opens an HttpURLConnection configured for Google Drive REST API v3 with authentication.
     */
    private static HttpURLConnection openDriveConnection(String urlStr, String method, String token) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(method);
        conn.setConnectTimeout(30000);
        conn.setReadTimeout(30000);
        conn.setRequestProperty("Authorization", "Bearer " + token);
        return conn;
    }

    /** Represents a file discovered in Google Drive storage with its unique ID and byte size. */
    private static class DriveFile {
        final String id;
        final long size;

        DriveFile(String id, long size) {
            this.id = id;
            this.size = size;
        }
    }

    /** A failed, ambiguous, or malformed lookup must never authorize creation or replacement of a catalog. */
    private static String findDriveFileId(DriveContext ctx, String fileName) throws Exception {
        DriveFile file = findDriveFile(ctx, fileName);
        return file != null ? file.id : null;
    }

    /**
     * Queries Google Drive REST API for a specific file by name in the backup folder.
     * Extracts both file ID and byte size to support metadata reconciliation.
     */
    private static DriveFile findDriveFile(DriveContext ctx, String fileName) throws Exception {
        String q = "name = '" + fileName + "' and '" + ctx.folderId + "' in parents and trashed = false";
        String url = "https://www.googleapis.com/drive/v3/files?q=" + URLEncoder.encode(q, "UTF-8")
                + "&fields=nextPageToken,files(id,size)&spaces=drive&supportsAllDrives=true";
        for (int attempt = 0; attempt < 2; attempt++) {
            HttpURLConnection conn = openDriveConnection(url, "GET", ctx.token);
            try {
                int code = conn.getResponseCode();
                if (code == 401 && attempt == 0) {
                    ctx.token = refreshDriveToken(ctx.d04);
                    if (ctx.token == null) throw new java.io.IOException("Drive token refresh failed");
                    continue;
                }
                if (code != 200) throw new java.io.IOException("Drive lookup HTTP " + code + ": " + readError(conn));
                JSONObject response;
                try (InputStream in = conn.getInputStream()) {
                    response = new JSONObject(new String(readAllBytes(in), "UTF-8"));
                }
                JSONArray files = response.getJSONArray("files");
                if (response.has("nextPageToken") || files.length() > 1) {
                    throw new java.io.IOException("Multiple cloud catalogs found; refusing an ambiguous overwrite");
                }
                if (files.length() == 0) return null;
                JSONObject file = files.getJSONObject(0);
                String id = file.getString("id");
                if (id.isEmpty()) throw new java.io.IOException("Drive lookup returned an empty file ID");
                long size = file.optLong("size", -1L);
                return new DriveFile(id, size);
            } finally {
                conn.disconnect();
            }
        }
        throw new java.io.IOException("Drive authentication retry exhausted");
    }

    /**
     * Reconciles unindexed WiFi backups from cloud storage into users.<uid>.cloud_v1.<cloudDir>.wifi.
     * When WiFi is backed up while offline or before the local metadata database was installed,
     * the raw .wfi file was uploaded to the cloud folder but its metadata was never written to
     * Firebase. This inspects cloud storage, populates the missing metadata, and ensures Swift Backup
     * recognizes and lists the cloud backup for restore.
     */
    private static boolean reconcileWifi(Map<String, Object> targetRoot) {
        if (targetRoot == null) return false;
        Object usersObj = targetRoot.get("users");
        if (!(usersObj instanceof Map)) return false;
        Map<String, Object> users = (Map<String, Object>) usersObj;
        boolean modified = false;

        for (Map.Entry<String, Object> userEntry : users.entrySet()) {
            if (!(userEntry.getValue() instanceof Map)) continue;
            Map<String, Object> user = (Map<String, Object>) userEntry.getValue();
            Object cloudV1Obj = user.get("cloud_v1");
            if (!(cloudV1Obj instanceof Map)) continue;
            Map<String, Object> cloudV1 = (Map<String, Object>) cloudV1Obj;

            for (Map.Entry<String, Object> cloudEntry : cloudV1.entrySet()) {
                if (!(cloudEntry.getValue() instanceof Map)) continue;
                Map<String, Object> cloudNode = (Map<String, Object>) cloudEntry.getValue();
                Object wifiObj = cloudNode.get("wifi");
                if (wifiObj instanceof Map && ((Map<?, ?>) wifiObj).get("driveId") != null) {
                    // Already indexed with a valid cloud file ID
                    continue;
                }

                // Check Google Drive storage
                try {
                    DriveContext ctx = getDriveContext();
                    if (ctx != null) {
                        DriveFile file = findDriveFile(ctx, "wifi_networks.wfi");
                        if (file != null && file.id != null && !file.id.isEmpty()) {
                            Map<String, Object> details = new LinkedHashMap<>();
                            details.put("driveId", file.id);
                            if (file.size > 0) details.put("fileSize", file.size);
                            cloudNode.put("wifi", details);
                            modified = true;
                            continue;
                        }
                    }
                } catch (Throwable t) {
                    log("reconcileWifi Drive check failed", t);
                }

                // Check generic cloud clients (WebDAV, Nextcloud, SMB, etc.)
                if (helper != null) {
                    try {
                        Object client = helper.getMethod("morpheCloudClient").invoke(null);
                        if (client != null) {
                            String path = (String) helper.getMethod("morpheCloudPath", client.getClass())
                                    .invoke(null, client);
                            if (path != null && path.contains("/")) {
                                String wifiPath = path.substring(0, path.lastIndexOf('/') + 1) + "wifi_networks.wfi";
                                boolean exists = (Boolean) client.getClass().getMethod("r", String.class)
                                        .invoke(client, wifiPath);
                                if (exists) {
                                    Map<String, Object> details = new LinkedHashMap<>();
                                    details.put("driveId", wifiPath);
                                    cloudNode.put("wifi", details);
                                    modified = true;
                                }
                            }
                        }
                    } catch (Throwable t) {
                        log("reconcileWifi generic cloud check failed", t);
                    }
                }
            }
        }
        return modified;
    }

    /** Only a successful empty lookup returns byte[0]; an empty existing file is a damaged catalog. */
    private static byte[] gDriveDownload() {
        try {
            DriveContext ctx = getDriveContext();
            if (ctx == null) return null;
            String id = findDriveFileId(ctx, FILE_NAME);
            if (id == null) return new byte[0];
            String url = "https://www.googleapis.com/drive/v3/files/" + id + "?alt=media&supportsAllDrives=true";
            for (int attempt = 0; attempt < 2; attempt++) {
                HttpURLConnection conn = openDriveConnection(url, "GET", ctx.token);
                try {
                    int code = conn.getResponseCode();
                    if (code == 401 && attempt == 0) {
                        ctx.token = refreshDriveToken(ctx.d04);
                        if (ctx.token == null) return null;
                        continue;
                    }
                    if (code != 200) throw new java.io.IOException("Drive download HTTP " + code + ": " + readError(conn));
                    try (InputStream in = conn.getInputStream()) {
                        byte[] bytes = readAllBytes(in);
                        if (bytes.length == 0) throw new java.io.IOException("Existing Drive catalog is empty");
                        return bytes;
                    }
                } finally {
                    conn.disconnect();
                }
            }
        } catch (Exception t) {
            log("Drive catalog download failed; sync deferred", t);
        }
        return null;
    }

    /** Create metadata and content in one request so a failed upload cannot leave an empty catalog behind. */
    private static boolean gDriveUpload(byte[] upload) {
        try {
            DriveContext ctx = getDriveContext();
            if (ctx == null) return false;
            String id = findDriveFileId(ctx, FILE_NAME);
            if (id != null) {
                return executeUpload(ctx, "https://www.googleapis.com/upload/drive/v3/files/" + id
                        + "?uploadType=media&supportsAllDrives=true", "PATCH", "application/json; charset=utf-8", upload);
            }
            JSONObject metadata = new JSONObject();
            metadata.put("name", FILE_NAME);
            metadata.put("parents", new JSONArray().put(ctx.folderId));
            String boundary = "morphe_" + java.util.UUID.randomUUID().toString();
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            body.write(("--" + boundary + "\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n"
                    + metadata + "\r\n--" + boundary + "\r\nContent-Type: application/json\r\n\r\n").getBytes("UTF-8"));
            body.write(upload);
            body.write(("\r\n--" + boundary + "--\r\n").getBytes("UTF-8"));
            return executeUpload(ctx, "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&supportsAllDrives=true",
                    "POST", "multipart/related; boundary=" + boundary, body.toByteArray());
        } catch (Exception t) {
            log("Drive catalog upload failed; pending writes retained", t);
            return false;
        }
    }

    /** Retry only explicit authentication rejection; ambiguous network failures are reconciled on the next tick. */
    private static boolean executeUpload(DriveContext ctx, String url, String method, String contentType, byte[] body) throws Exception {
        for (int attempt = 0; attempt < 2; attempt++) {
            HttpURLConnection conn = openDriveConnection(url, method, ctx.token);
            try {
                conn.setRequestProperty("Content-Type", contentType);
                conn.setFixedLengthStreamingMode(body.length);
                conn.setDoOutput(true);
                try (OutputStream out = conn.getOutputStream()) {
                    out.write(body);
                }
                int code = conn.getResponseCode();
                if (code == 401 && attempt == 0) {
                    ctx.token = refreshDriveToken(ctx.d04);
                    if (ctx.token == null) return false;
                    continue;
                }
                if (code >= 200 && code < 300) return true;
                throw new java.io.IOException("Drive upload HTTP " + code + ": " + readError(conn));
            } finally {
                conn.disconnect();
            }
        }
        return false;
    }

    /**
     * Reads all bytes from an InputStream into a byte array.
     */
    private static byte[] readAllBytes(InputStream in) throws Exception {
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) != -1) {
            bout.write(buf, 0, n);
        }
        return bout.toByteArray();
    }

    /**
     * Safely reads the error body from an HttpURLConnection for diagnostics.
     */
    private static String readError(HttpURLConnection conn) {
        try (InputStream err = conn.getErrorStream()) {
            if (err == null) return "";
            return new String(readAllBytes(err), "UTF-8");
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static void log(String message, Throwable t) {
        Log.e(TAG, message, t);
    }

    /**
     * Wraps a PersistentConnection request callback so it can be posted to the Repo run loop.
     * The callback type is obfuscated, so it is invoked reflectively: (null, null) means success.
     */
    public static Runnable ack(final Object callback) {
        return new Runnable() {
            @Override
            public void run() {
                try {
                    for (Method m : callback.getClass().getMethods()) {
                        Class<?>[] p = m.getParameterTypes();
                        if (p.length == 2 && p[0] == String.class && p[1] == String.class
                                && m.getReturnType() == void.class) {
                            m.invoke(callback, null, null);
                            return;
                        }
                    }
                    log("ack: no callback method on " + callback.getClass(), null);
                } catch (Throwable t) {
                    log("ack failed", t);
                }
            }
        };
    }

    /** No-op implementation of the (obfuscated) ValueEventListener interface. */
    public static Object noopListener(Class<?> listenerInterface) {
        return Proxy.newProxyInstance(listenerInterface.getClassLoader(),
                new Class<?>[]{listenerInterface}, new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) {
                        switch (method.getName()) {
                            case "equals":
                                return proxy == args[0];
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "toString":
                                return "MorpheLocalDbListener";
                            default:
                                return null;
                        }
                    }
                });
    }
}
