package app.myspoti.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Environment;
import android.os.FileObserver;
import android.os.Handler;
import android.os.Looper;
import android.media.MediaMetadataRetriever;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Runtime bridge for the R8-minified Myspoti 2.2.0 stable APK.
 * Verified APK mappings: OfflineStore=ud5, OfflineTrack=vd5,
 * OfflineCrypto=lc5, OfflineCollections=ic5, OfflineAccounts=cc5.
 * Myspoti source origin: https://github.com/kota-zo/myspoti (GPL-3.0).
 */
public final class DownloadPatch {
    private static final String TAG = "MyspotiStoragePatch";
    private static final String PREFS = "morphe_download_tools";
    private static final String PREF_LOCATION = "storage_id";

    // R8 class names and member names are pinned to the inspected 2.2.0 stable APK.
    private static final String STORE = "ud5";
    private static final String TRACK = "vd5";
    private static final String CRYPTO = "lc5";
    private static final String COLLECTIONS = "ic5";

    private static volatile Context appContext;
    private static volatile Activity foregroundActivity;
    private static boolean activityCallbacksInstalled;
    private static final Object ACTION_TAG = new Object();
    private static final Map<Activity, View> DOWNLOAD_ACTIONS = new WeakHashMap<>();

    private static final Object AUTO_SYNC_OBSERVER_LOCK = new Object();
    private static final Object EXPORT_SYNC_LOCK = new Object();
    private static final Handler AUTO_SYNC_HANDLER = new Handler(Looper.getMainLooper());
    private static final ExecutorService AUTO_SYNC_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "myspoti-export-auto-sync");
        thread.setPriority(Thread.MIN_PRIORITY);
        return thread;
    });
    private static FileObserver autoSyncObserver;
    private static String autoSyncObservedPath;
    private static FileObserver lyricsCacheObserver;
    private static String lyricsCacheObservedPath;
    private static Runnable pendingAutoSync;
    private static boolean autoSyncRunning;
    private static boolean autoSyncAgain;

    private DownloadPatch() {}

    /** Called from MyspotiApplication.onCreate. Keeps an application context for storage helpers. */
    public static void install(Context context) {
        appContext = context.getApplicationContext();
        if (appContext instanceof Application) {
            synchronized (DownloadPatch.class) {
                if (!activityCallbacksInstalled) {
                    ((Application) appContext).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                        @Override public void onActivityCreated(Activity activity, Bundle state) {}
                        @Override public void onActivityStarted(Activity activity) {}
                        @Override public void onActivityResumed(Activity activity) {
                            if (!(activity instanceof DownloadToolsActivity)) foregroundActivity = activity;
                            Context current = appContext;
                            if (current != null) startAutoSyncObserver(current);
                        }
                        @Override public void onActivityPaused(Activity activity) {
                            if (foregroundActivity == activity) foregroundActivity = null;
                        }
                        @Override public void onActivityStopped(Activity activity) {}
                        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
                        @Override public void onActivityDestroyed(Activity activity) {
                            if (foregroundActivity == activity) foregroundActivity = null;
                            removeDownloadsAction(activity);
                        }
                    });
                    activityCallbacksInstalled = true;
                }
            }
        }
        startAutoSyncObserver(appContext);
    }

    /** Called only while Myspoti's Settings > Downloads composable is being composed. */
    public static void showForCurrentActivity() {
        attachForForegroundActivity(0);
    }

    /** Called by the Settings page router before it composes the newly selected subpage. */
    public static void hideSettingsAction() {
        Activity activity = foregroundActivity;
        if (activity == null) return;
        runOnMain(() -> removeDownloadsAction(activity));
        Log.i(TAG, "Settings subpage changed; removed Export & storage action");
    }

    private static void attachForForegroundActivity(int attempt) {
        Activity activity = foregroundActivity;
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            if (attempt < 10) {
                new Handler(Looper.getMainLooper()).postDelayed(
                        () -> attachForForegroundActivity(attempt + 1), 250L);
            } else {
                Log.w(TAG, "Settings Downloads page composed, but no resumed Myspoti Activity was available");
            }
            return;
        }
        Log.i(TAG, "Settings > Downloads page composed; showing Export & storage action");
        runOnMain(() -> attachDownloadsActionWhenReady(activity, 0));
    }

    /** Direct trigger from the inspected Classic Downloads composable (legacy compatibility). */
    public static void showFromDownloadsScreen(Object navController) {
        Activity activity = activityFromNavController(navController);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            Log.w(TAG, "Classic Downloads screen composed, but host Activity was not available");
            return;
        }
        Log.i(TAG, "Classic Downloads screen composed; showing Export & storage action");
        runOnMain(() -> attachDownloadsActionWhenReady(activity, 0));
    }

    /**
     * APK 2.2.0 mapping verified from DEX: NavController Le65 has field b (Lh65),
     * Lh65.h() returns the current NavDestination Lq65, whose field c is its route String.
     */
    private static String currentDestinationRoute(Object navController) {
        if (navController == null) return null;
        try {
            Object controllerImpl = declaredField(navController.getClass(), "b").get(navController);
            if (controllerImpl == null) return null;
            Method currentDestination = controllerImpl.getClass().getDeclaredMethod("h");
            currentDestination.setAccessible(true);
            Object destination = currentDestination.invoke(controllerImpl);
            if (destination == null) return null;
            Object route = declaredField(destination.getClass(), "c").get(destination);
            return route == null ? null : String.valueOf(route);
        } catch (Throwable t) {
            Log.w(TAG, "Could not inspect the current NavDestination", t);
            return null;
        }
    }

    private static Activity activityFromNavController(Object navController) {
        if (navController == null) return null;
        try {
            // In MySpoti 2.2.0, the obfuscated NavController stores its host Activity in field d.
            Field host = navController.getClass().getDeclaredField("d");
            host.setAccessible(true);
            Object value = host.get(navController);
            if (value instanceof Activity) return (Activity) value;
        } catch (Throwable t) {
            Log.w(TAG, "Could not resolve the host Activity from NavController; using the resumed app Activity", t);
        }
        Activity activity = foregroundActivity;
        return activity instanceof DownloadToolsActivity ? null : activity;
    }

    private static void attachDownloadsActionWhenReady(Activity activity, int attempt) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        if (decor == null) return;
        decor.post(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            View content = activity.findViewById(android.R.id.content);
            if (content instanceof FrameLayout) {
                attachDownloadsAction(activity, (FrameLayout) content);
            } else if (decor instanceof FrameLayout) {
                attachDownloadsAction(activity, (FrameLayout) decor);
            } else if (attempt < 6) {
                new Handler(Looper.getMainLooper()).postDelayed(
                        () -> attachDownloadsActionWhenReady(activity, attempt + 1), 180L);
            } else {
                Log.e(TAG, "Could not find a FrameLayout to attach the Settings Downloads action");
            }
        });
    }

    private static void attachDownloadsAction(Activity activity, FrameLayout root) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        root.setClipChildren(false);
        root.setClipToPadding(false);
        View current = root.findViewWithTag(ACTION_TAG);
        if (current != null) {
            DOWNLOAD_ACTIONS.put(activity, current);
            return;
        }

        TextView action = new TextView(activity);
        action.setText("Export & storage");
        action.setContentDescription("Export downloaded songs or change download location");
        action.setTextColor(Color.BLACK);
        action.setTextSize(13f);
        action.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        int horizontal = dp(activity, 14);
        int vertical = dp(activity, 9);
        action.setPadding(horizontal, vertical, horizontal, vertical);
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.rgb(30, 215, 96));
        background.setCornerRadius(dp(activity, 22));
        action.setBackground(background);
        action.setElevation(dp(activity, 8));
        action.setClickable(true);
        action.setFocusable(true);
        action.setTag(ACTION_TAG);
        action.setOnClickListener(v -> {
            try {
                activity.startActivity(new Intent(activity, DownloadToolsActivity.class));
            } catch (Throwable t) {
                Log.e(TAG, "Could not open Export & storage screen", t);
                String detail = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
                Toast.makeText(activity, "Could not open Export & storage: " + detail, Toast.LENGTH_LONG).show();
            }
        });

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.END);
        params.topMargin = statusBarHeight(activity) + dp(activity, 8);
        params.rightMargin = dp(activity, 16);
        root.addView(action, params);
        DOWNLOAD_ACTIONS.put(activity, action);
        Log.i(TAG, "Export & storage action attached to the Settings Downloads page root");
    }

    private static void removeDownloadsAction(Activity activity) {
        if (activity == null) return;
        View action = DOWNLOAD_ACTIONS.remove(activity);
        View content = activity.findViewById(android.R.id.content);
        if (action == null && content instanceof FrameLayout) action = ((FrameLayout) content).findViewWithTag(ACTION_TAG);
        if (action == null && activity.getWindow() != null) {
            View decor = activity.getWindow().getDecorView();
            if (decor instanceof FrameLayout) action = ((FrameLayout) decor).findViewWithTag(ACTION_TAG);
        }
        if (action != null && action.getParent() instanceof FrameLayout) {
            ((FrameLayout) action.getParent()).removeView(action);
        }
    }

    private static void runOnMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else new Handler(Looper.getMainLooper()).post(action);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static int statusBarHeight(Activity activity) {
        int id = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
        return id == 0 ? 0 : activity.getResources().getDimensionPixelSize(id);
    }

    /** Called after the app's first collections read. Repoint and reload its obfuscated index. */
    public static void onAppReady(Context context) {
        appContext = context.getApplicationContext();
        if (!setCollectionsFileAndRead(appContext)) {
            Log.w(TAG, "Could not reopen downloaded-list index at the selected location");
        }
        startAutoSyncObserver(appContext);
    }

    /** Current offline folder. Only app-owned File-based volumes are supported for playback. */
    public static File storageRoot(Context context) {
        Context app = context.getApplicationContext();
        String id = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(PREF_LOCATION, "internal");
        File base = baseForId(app, id);
        if (base == null) base = app.getFilesDir();
        else if (!base.exists() && !base.mkdirs()) base = app.getFilesDir();
        return new File(base, "offline");
    }

    /** Entry used by the patched static OfflineStore.load(File), after appContext is installed. */
    public static File storageRootNoArg() {
        Context context = appContext;
        if (context == null) throw new IllegalStateException("Myspoti application context is not ready");
        File root = storageRoot(context);
        startAutoSyncObserver(context);
        return root;
    }

    /** True only when both native indexes parse and match loaded app state, never during a partial load. */
    public static boolean canMirrorDeletedDownloads(Context context, Set<String> expectedTrackIds,
            Set<String> expectedCollectionKeys, Set<String> expectedSingleIds) {
        if (expectedTrackIds == null || expectedCollectionKeys == null || expectedSingleIds == null) return false;
        Context app = context.getApplicationContext();
        File root = storageRoot(app);
        File nativeIndex = new File(root, "index.json");
        File nativeBackup = new File(root, "index.json.bak");
        File collectionIndex = new File(root, "collections.json");
        if ((!nativeIndex.isFile() && !nativeBackup.isFile()) || !collectionIndex.isFile()) return false;
        try {
            JSONArray persisted = readNativeIndex(nativeIndex, nativeBackup);
            Set<String> persistedIds = new LinkedHashSet<>();
            for (int i = 0; i < persisted.length(); i++) {
                JSONObject item = persisted.optJSONObject(i);
                if (item == null) throw new IOException("A download index entry is incomplete.");
                String id = item.optString("id", "");
                String filename = item.optString("file", "");
                if (id.isEmpty() || filename.isEmpty() || !persistedIds.add(id)) {
                    throw new IOException("A download index entry has an invalid or duplicate identity.");
                }
            }
            Set<String> loadedIds = new LinkedHashSet<>();
            for (Object track : downloadedTracks(app)) {
                String id = trackId(track);
                if (id == null || id.isEmpty() || !loadedIds.add(id)) {
                    throw new IOException("The in-memory download list is incomplete.");
                }
            }
            // A mismatch usually means the app is still loading/reopening its index. Never
            // interpret that transient state as a user's mass deletion.
            if (!persistedIds.equals(loadedIds) || !persistedIds.equals(expectedTrackIds)) return false;

            JSONObject collections = new JSONObject(readText(collectionIndex));
            JSONArray persistedLists = collections.optJSONArray("lists");
            JSONArray persistedSinglesArray = collections.optJSONArray("singles");
            if (persistedLists == null || persistedSinglesArray == null) {
                throw new IOException("The downloaded collection index is incomplete.");
            }
            Set<String> persistedCollectionKeys = new LinkedHashSet<>();
            for (int i = 0; i < persistedLists.length(); i++) {
                JSONObject item = persistedLists.optJSONObject(i);
                if (item == null) throw new IOException("A downloaded collection entry is incomplete.");
                String uri = item.optString("uri", "");
                String type = item.optString("type", "");
                if (uri.isEmpty() || type.isEmpty() || !persistedCollectionKeys.add(type + "|" + uri)) {
                    throw new IOException("A downloaded collection entry has an invalid or duplicate identity.");
                }
            }
            Set<String> loadedCollectionKeys = new LinkedHashSet<>();
            for (CollectionSnapshot collection : downloadedCollections()) {
                loadedCollectionKeys.add(collection.type + "|" + collection.uri);
            }
            if (!persistedCollectionKeys.equals(loadedCollectionKeys)
                    || !persistedCollectionKeys.equals(expectedCollectionKeys)) return false;

            Set<String> persistedSingles = new LinkedHashSet<>();
            for (int i = 0; i < persistedSinglesArray.length(); i++) {
                String id = persistedSinglesArray.optString(i, "");
                if (id.isEmpty() || !persistedSingles.add(id)) {
                    throw new IOException("The individual-download index is incomplete.");
                }
            }
            if (!persistedSingles.equals(downloadedSingles())
                    || !persistedSingles.equals(expectedSingleIds)) return false;
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "Skipped export deletion sync because MySpoti's native indexes are not readable or fully loaded", error);
            return false;
        }
    }

    /** Shared lock also serializes manual and background export writes to the same SAF index. */
    static Object exportSyncLock() { return EXPORT_SYNC_LOCK; }

    /** Watch MySpoti's atomically replaced native indexes, not transient audio temp files. */
    private static void startAutoSyncObserver(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        File root = storageRoot(app);
        if (!root.exists() && !root.mkdirs()) {
            Log.w(TAG, "Could not create the offline folder for the export sync observer");
            return;
        }
        // Lyrics may be resolved after the audio and native download indexes have been
        // written. Watch MySpoti's own durable lyrics cache as a second sync trigger.
        startLyricsCacheObserver(app);
        final String path = root.getAbsolutePath();
        synchronized (AUTO_SYNC_OBSERVER_LOCK) {
            if (path.equals(autoSyncObservedPath) && autoSyncObserver != null) return;
            if (autoSyncObserver != null) {
                try { autoSyncObserver.stopWatching(); } catch (Throwable ignored) {}
                autoSyncObserver = null;
            }
            autoSyncObservedPath = path;
            autoSyncObserver = new FileObserver(path,
                    FileObserver.CLOSE_WRITE | FileObserver.MOVED_TO | FileObserver.CREATE) {
                @Override public void onEvent(int event, String name) {
                    if (name == null || "index.json".equals(name) || "collections.json".equals(name)) {
                        scheduleAutoSync(app);
                    }
                }
            };
            autoSyncObserver.startWatching();
            Log.i(TAG, "Watching native Downloads and collection indexes for export auto-sync");
        }
    }

    /**
     * MySpoti writes complete synced lyrics to filesDir/lyrics_cache2 using an atomic rename.
     * When that happens after the download index event, a second export pass can add the
     * .lrc/JSON sidecars and embed lyrics into an already-exported audio file.
     */
    private static void startLyricsCacheObserver(Context context) {
        Context app = context.getApplicationContext();
        File directory = new File(app.getFilesDir(), "lyrics_cache2");
        if (!directory.exists() && !directory.mkdirs()) {
            Log.w(TAG, "Could not create MySpoti's lyrics cache directory for export observation");
            return;
        }
        final String path = directory.getAbsolutePath();
        boolean started = false;
        synchronized (AUTO_SYNC_OBSERVER_LOCK) {
            if (path.equals(lyricsCacheObservedPath) && lyricsCacheObserver != null) return;
            if (lyricsCacheObserver != null) {
                try { lyricsCacheObserver.stopWatching(); } catch (Throwable ignored) {}
                lyricsCacheObserver = null;
            }
            lyricsCacheObservedPath = path;
            lyricsCacheObserver = new FileObserver(path,
                    FileObserver.CLOSE_WRITE | FileObserver.MOVED_TO | FileObserver.CREATE) {
                @Override public void onEvent(int event, String name) {
                    if (name != null && name.endsWith(".json")) scheduleAutoSync(app);
                }
            };
            lyricsCacheObserver.startWatching();
            started = true;
            Log.i(TAG, "Watching MySpoti's native lyrics cache for export auto-sync");
        }
        // On the first launch after installing this update, run one pass when opted in so
        // already-downloaded tracks can be backfilled without waiting for another file event.
        if (started) scheduleAutoSync(app);
    }

    private static void scheduleAutoSync(Context context) {
        Context app = context.getApplicationContext();
        if (!app.getSharedPreferences(ExportIndex.PREFS, Context.MODE_PRIVATE)
                .getBoolean(ExportIndex.PREF_AUTO_SYNC, false)) return;
        String tree = app.getSharedPreferences(ExportIndex.PREFS, Context.MODE_PRIVATE)
                .getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (tree == null || tree.trim().isEmpty()) return;
        synchronized (AUTO_SYNC_OBSERVER_LOCK) {
            if (pendingAutoSync != null) AUTO_SYNC_HANDLER.removeCallbacks(pendingAutoSync);
            pendingAutoSync = () -> {
                synchronized (AUTO_SYNC_OBSERVER_LOCK) { pendingAutoSync = null; }
                startAutoSync(app);
            };
            AUTO_SYNC_HANDLER.postDelayed(pendingAutoSync, 1400L);
        }
    }

    private static void startAutoSync(Context context) {
        Context app = context.getApplicationContext();
        android.content.SharedPreferences preferences = app.getSharedPreferences(ExportIndex.PREFS, Context.MODE_PRIVATE);
        if (!preferences.getBoolean(ExportIndex.PREF_AUTO_SYNC, false)) return;
        String value = preferences.getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (value == null || value.trim().isEmpty()) return;
        final Uri tree;
        try { tree = Uri.parse(value); }
        catch (Throwable error) { Log.w(TAG, "Invalid saved export folder URI", error); return; }

        synchronized (AUTO_SYNC_OBSERVER_LOCK) {
            if (autoSyncRunning) {
                autoSyncAgain = true;
                return;
            }
            autoSyncRunning = true;
            autoSyncAgain = false;
        }
        AUTO_SYNC_EXECUTOR.execute(() -> {
            try {
                boolean deleteRemoved = preferences.getBoolean(ExportIndex.PREF_DELETE_REMOVED, false);
                ExportSyncRunner.sync(app, tree, deleteRemoved);
            } catch (Throwable error) {
                Log.w(TAG, "Automatic export sync did not complete", error);
            } finally {
                boolean runAgain;
                synchronized (AUTO_SYNC_OBSERVER_LOCK) {
                    autoSyncRunning = false;
                    runAgain = autoSyncAgain;
                    autoSyncAgain = false;
                }
                if (runAgain) scheduleAutoSync(app);
            }
        });
    }

    public static String selectedStorageId(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString(PREF_LOCATION, "internal");
    }

    public static String storageLabel(Context context) {
        String id = selectedStorageId(context);
        if ("internal".equals(id)) return "Internal app storage";
        File[] dirs = context.getApplicationContext().getExternalFilesDirs(null);
        try {
            int index = Integer.parseInt(id.substring("external_".length()));
            if (index >= 0 && index < dirs.length && dirs[index] != null) {
                return Environment.isExternalStorageRemovable(dirs[index]) ? "SD card (app folder)" : "Phone shared storage (app folder)";
            }
        } catch (Throwable ignored) {}
        return "Selected storage unavailable (using internal storage)";
    }

    /** IDs and labels for mounted, app-writable storage volumes. */
    public static List<StorageOption> storageOptions(Context context) {
        Context app = context.getApplicationContext();
        List<StorageOption> out = new ArrayList<>();
        out.add(new StorageOption("internal", "Internal app storage", app.getFilesDir()));
        File[] dirs = app.getExternalFilesDirs(null);
        if (dirs != null) {
            for (int i = 0; i < dirs.length; i++) {
                File dir = dirs[i];
                if (dir == null) continue;
                String state = Environment.getExternalStorageState(dir);
                if (!Environment.MEDIA_MOUNTED.equals(state)) continue;
                if (!dir.exists() && !dir.mkdirs()) continue;
                if (!dir.canWrite()) continue;
                boolean removable = Environment.isExternalStorageRemovable(dir);
                String label = removable ? "SD card (app folder)" : "Phone shared storage (app folder)";
                if (!removable && i > 0) label += " " + (i + 1);
                out.add(new StorageOption("external_" + i, label, dir));
            }
        }
        return out;
    }

    public static final class StorageOption {
        public final String id;
        public final String label;
        public final File base;
        StorageOption(String id, String label, File base) { this.id = id; this.label = label; this.base = base; }
    }

    private static File baseForId(Context app, String id) {
        if (id == null || "internal".equals(id)) return app.getFilesDir();
        if (id.startsWith("external_")) {
            try {
                int index = Integer.parseInt(id.substring("external_".length()));
                File[] dirs = app.getExternalFilesDirs(null);
                if (dirs != null && index >= 0 && index < dirs.length) {
                    File dir = dirs[index];
                    if (dir != null && Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState(dir))) {
                        if (!dir.exists()) dir.mkdirs();
                        if (dir.canWrite()) return dir;
                    }
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    /**
     * Snapshot of whole downloaded playlists, albums and Liked Songs.
     * APK 2.2.0 DEX mapping: ic5.e is SnapshotStateMap<String, dc5>;
     * dc5 fields a/b/c/d are uri/type/name/trackIds respectively.
     */
    public static List<CollectionSnapshot> downloadedCollections() throws Exception {
        Class<?> collectionsClass = Class.forName(COLLECTIONS);
        Object value = declaredField(collectionsClass, "e").get(null);
        if (!(value instanceof Map)) {
            throw new IllegalStateException("MySpoti downloaded collection map was not found");
        }
        List<CollectionSnapshot> result = new ArrayList<>();
        for (Object collection : ((Map<?, ?>) value).values()) {
            if (collection == null) continue;
            String uri = safeFieldString(collection, "a");
            String type = safeFieldString(collection, "b");
            String name = safeFieldString(collection, "c");
            if (uri.isEmpty() || type.isEmpty()) continue;
            List<String> ids = new ArrayList<>();
            try {
                Object trackIds = declaredField(collection.getClass(), "d").get(collection);
                if (trackIds instanceof Iterable) {
                    for (Object id : (Iterable<?>) trackIds) {
                        if (id != null && !String.valueOf(id).trim().isEmpty()) ids.add(String.valueOf(id));
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "Could not read track IDs for downloaded collection " + name, t);
            }
            result.add(new CollectionSnapshot(uri, type, name, ids));
        }
        Collections.sort(result, new Comparator<CollectionSnapshot>() {
            @Override public int compare(CollectionSnapshot left, CollectionSnapshot right) {
                int type = left.type.compareToIgnoreCase(right.type);
                return type != 0 ? type : left.name.compareToIgnoreCase(right.name);
            }
        });
        return result;
    }

    private static String safeFieldString(Object owner, String field) {
        try {
            Object value = declaredField(owner.getClass(), field).get(owner);
            return value == null ? "" : String.valueOf(value);
        } catch (Throwable ignored) {
            return "";
        }
    }

    public static final class CollectionSnapshot {
        public final String uri;
        public final String type;
        public final String name;
        public final List<String> trackIds;

        CollectionSnapshot(String uri, String type, String name, List<String> trackIds) {
            this.uri = uri;
            this.type = type;
            this.name = name;
            this.trackIds = Collections.unmodifiableList(new ArrayList<>(trackIds));
        }
    }

    /** Snapshot of downloaded OfflineTrack records, newest first (same order as Myspoti list()). */
    public static List<?> downloadedTracks(Context context) throws Exception {
        Field tracksField = declaredField(Class.forName(STORE), "d");
        Object value = tracksField.get(null);
        if (!(value instanceof Map)) throw new IllegalStateException("Offline download map was not found");
        List<Object> tracks = new ArrayList<>(((Map<?, ?>) value).values());
        Collections.sort(tracks, new Comparator<Object>() {
            @Override public int compare(Object left, Object right) {
                return Long.compare(trackLong(right, "m"), trackLong(left, "m"));
            }
        });
        return tracks;
    }

    public static File audioFile(Context context, Object track) throws Exception {
        String filename = trackString(track, "h");
        if (filename.isEmpty()) throw new IOException("Downloaded item has no audio filename");
        return new File(new File(storageRoot(context), "audio"), filename);
    }

    public static String trackId(Object track) { return safeTrackString(track, "a"); }
    public static String trackTitle(Object track) { return safeTrackString(track, "b"); }
    public static String trackArtist(Object track) { return safeTrackString(track, "c"); }
    public static String trackAlbum(Object track) { return safeTrackString(track, "d"); }
    public static String trackAlbumId(Object track) { return safeTrackString(track, "e"); }
    public static String trackCoverUrl(Object track) { return safeTrackString(track, "g"); }
    public static String trackCover(Object track) { return safeTrackString(track, "i"); }
    public static String trackSource(Object track) { return safeTrackString(track, "j"); }
    public static boolean trackVerified(Object track) {
        try { return Boolean.TRUE.equals(declaredField(track.getClass(), "k").get(track)); }
        catch (Throwable ignored) { return false; }
    }
    public static String trackKind(Object track) { return safeTrackString(track, "n"); }
    public static String trackProviderId(Object track) { return safeTrackString(track, "o"); }
    public static long trackDurationMs(Object track) { return trackLong(track, "f"); }

    /** Individually downloaded songs, persisted separately from downloaded collection membership. */
    public static Set<String> downloadedSingles() throws Exception {
        Object value = declaredField(Class.forName(COLLECTIONS), "f").get(null);
        LinkedHashSet<String> result = new LinkedHashSet<>();
        if (value instanceof Iterable) for (Object id : (Iterable<?>) value) {
            if (id != null && !String.valueOf(id).trim().isEmpty()) result.add(String.valueOf(id));
        }
        return result;
    }

    /**
     * Rebuild MySpoti's native private offline store from the portable, playable export archive.
     * The old installation's Keystore key cannot survive uninstall, so exported plaintext is
     * encrypted again with the new installation's OfflineCrypto key and a fresh native index.
     */
    public static RestoreResult restoreArchive(Context context, ExportIndex archive) throws Exception {
        Context app = context.getApplicationContext();
        if (hasPendingDownloads(app)) throw new IOException("Finish or cancel active downloads before restoring the export archive.");
        File root = storageRoot(app);
        File audioDir = new File(root, "audio");
        File coverDir = new File(root, "covers");
        File tmpDir = new File(root, "tmp");
        if (!audioDir.exists() && !audioDir.mkdirs()) throw new IOException("Could not create MySpoti's private audio folder.");
        if (!coverDir.exists() && !coverDir.mkdirs()) throw new IOException("Could not create MySpoti's private artwork folder.");
        if (!tmpDir.exists() && !tmpDir.mkdirs()) throw new IOException("Could not create MySpoti's temporary restore folder.");

        File nativeIndexFile = new File(root, "index.json");
        JSONArray nativeIndex = readNativeIndex(nativeIndexFile, new File(root, "index.json.bak"));
        JSONArray mergedIndex = new JSONArray();
        LinkedHashSet<String> availableIds = new LinkedHashSet<>();
        for (int i = 0; i < nativeIndex.length(); i++) {
            JSONObject item = nativeIndex.optJSONObject(i);
            if (item == null) continue;
            String id = item.optString("id", "");
            String filename = item.optString("file", "");
            if (id.isEmpty() || filename.isEmpty() || !new File(audioDir, filename).isFile()) continue;
            mergedIndex.put(item);
            availableIds.add(id);
        }

        RestoreResult result = new RestoreResult();
        List<JSONObject> portableTracks = archive.trackEntries();
        long estimatedBytes = 0L;
        long largestMissingTrack = 0L;
        for (JSONObject portable : portableTracks) {
            String id = portable.optString("trackId", "");
            if (!id.isEmpty() && !availableIds.contains(id)) {
                long trackBytes = Math.max(0L, portable.optLong("exportedBytes", 0L));
                estimatedBytes += trackBytes + 20L;
                largestMissingTrack = Math.max(largestMissingTrack, trackBytes);
            }
        }
        // The restore pipeline stages one plaintext and one encrypted copy of the current track
        // before atomically moving the encrypted copy into audio/. Reserve the largest track as
        // additional temporary headroom so low-space restores fail before copying any songs.
        long requiredBytes = estimatedBytes + largestMissingTrack;
        long usableBytes = root.getUsableSpace();
        if (usableBytes > 0L && requiredBytes > usableBytes) {
            throw new IOException("Not enough free space to restore the export archive. Need about "
                    + android.text.format.Formatter.formatFileSize(app, requiredBytes) + " including temporary restore space, but only "
                    + android.text.format.Formatter.formatFileSize(app, usableBytes) + " is available.");
        }
        for (JSONObject portable : portableTracks) {
            String trackId = portable.optString("trackId", "");
            if (trackId.isEmpty()) { result.failed++; continue; }
            if (availableIds.contains(trackId)) { result.skipped++; continue; }

            String extension = safeAudioExtension(portable.optString("extension", ""),
                    portable.optString("fileName", ""));
            if (extension.isEmpty()) {
                result.failed++;
                result.lastError = "Unsupported audio format for " + portable.optString("title", trackId);
                continue;
            }

            String token = stableToken(trackId);
            String nativeFilename = "restored_" + token + "." + extension;
            File plain = new File(tmpDir, nativeFilename + ".plain");
            File encrypted = new File(tmpDir, nativeFilename + ".enc");
            File target = new File(audioDir, nativeFilename);
            String coverName = "";
            try {
                try (InputStream input = archive.openTrackInput(trackId);
                     FileOutputStream output = new FileOutputStream(plain)) {
                    copyStream(input, output);
                    output.getFD().sync();
                }
                if (!plain.isFile() || plain.length() <= 0L) throw new IOException("The exported audio file is empty.");

                coverName = extractEmbeddedCover(plain, coverDir, token);
                encryptWithCurrentInstallationKey(app, plain, encrypted);
                if (!encrypted.isFile() || encrypted.length() <= 20L) throw new IOException("MySpoti could not encrypt the restored audio.");
                if (target.exists() && !target.delete()) throw new IOException("Could not replace a leftover restore file.");
                if (!encrypted.renameTo(target)) throw new IOException("Could not place the restored audio in MySpoti's offline folder.");

                JSONObject nativeTrack = new JSONObject();
                nativeTrack.put("id", trackId);
                nativeTrack.put("title", portable.optString("title", ""));
                nativeTrack.put("artist", portable.optString("artist", ""));
                nativeTrack.put("album", portable.optString("album", ""));
                nativeTrack.put("albumId", portable.optString("albumId", ""));
                nativeTrack.put("duration", portable.optLong("durationMs", 0L));
                nativeTrack.put("coverUrl", portable.optString("coverUrl", ""));
                nativeTrack.put("file", nativeFilename);
                nativeTrack.put("cover", coverName);
                nativeTrack.put("source", portable.optString("source", "restored-export"));
                nativeTrack.put("verified", portable.optBoolean("verified", false));
                nativeTrack.put("bytes", target.length());
                nativeTrack.put("added", portable.optLong("exportedAt", System.currentTimeMillis()));
                nativeTrack.put("kind", portable.optString("kind", "MUSIC"));
                String providerId = portable.optString("providerId", "");
                if (!providerId.isEmpty()) nativeTrack.put("providerId", providerId);
                mergedIndex.put(nativeTrack);
                availableIds.add(trackId);
                result.restored++;
            } catch (Throwable t) {
                result.failed++;
                result.lastError = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
                if (target.exists()) target.delete();
                if (!coverName.isEmpty()) new File(coverDir, coverName).delete();
            } finally {
                if (plain.exists()) plain.delete();
                if (encrypted.exists()) encrypted.delete();
            }
        }

        // Restore the exact LyricsApi cache files before the user opens the offline player.
        // JSON preserves synced/word timings and Spotify colours; old archives can fall back to LRC.
        for (JSONObject portable : portableTracks) {
            String id = portable.optString("trackId", "");
            if (id.isEmpty() || !availableIds.contains(id)) continue;
            try {
                JSONObject lyrics = archive.readLyricsJson(id);
                if (lyrics == null) {
                    String lrc = archive.readLyricsLrc(id);
                    lyrics = LyricsStore.fromLrc(id, lrc, "Portable LRC backup");
                }
                if (lyrics != null && LyricsStore.restoreNativeCache(app, id, lyrics)) result.lyricsRestored++;
            } catch (Throwable t) {
                result.lyricsFailed++;
                result.lastError = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
                Log.w(TAG, "Could not restore offline lyrics for " + id, t);
            }
        }

        // Write the native OfflineStore index in its source-defined JSONArray format.
        writeAtomicIndex(nativeIndexFile, mergedIndex.toString());

        // Rebuild OfflineCollections' native JSON format. Only mark a collection downloaded
        // when every member has a restored/native audio record; incomplete lists remain in the
        // portable archive and are not falsely presented as fully available offline.
        JSONObject portableCollections = archive.collectionEntries();
        JSONObject oldCollections = readJsonObject(new File(root, "collections.json"));
        JSONArray oldLists = oldCollections.optJSONArray("lists");
        java.util.LinkedHashMap<String, JSONObject> listsByUri = new java.util.LinkedHashMap<>();
        LinkedHashSet<String> allCollectionMembers = new LinkedHashSet<>();
        if (oldLists != null) for (int i = 0; i < oldLists.length(); i++) {
            JSONObject list = oldLists.optJSONObject(i);
            if (list == null) continue;
            String oldUri = list.optString("uri", "");
            JSONArray oldMembers = list.optJSONArray("tracks");
            if (oldUri.isEmpty() || oldMembers == null || oldMembers.length() == 0) continue;
            boolean complete = true;
            LinkedHashSet<String> oldMemberIds = new LinkedHashSet<>();
            for (int j = 0; j < oldMembers.length(); j++) {
                String id = oldMembers.optString(j, "");
                if (!id.isEmpty()) oldMemberIds.add(id);
                if (id.isEmpty() || !availableIds.contains(id)) complete = false;
            }
            if (complete) {
                listsByUri.put(oldUri, list);
                allCollectionMembers.addAll(oldMemberIds);
            }
        }

        int addedCollections = 0;
        java.util.Iterator<String> collectionKeys = portableCollections.keys();
        while (collectionKeys.hasNext()) {
            JSONObject collection = portableCollections.optJSONObject(collectionKeys.next());
            if (collection == null) continue;
            JSONArray members = collection.optJSONArray("trackIds");
            if (members == null) continue;
            boolean complete = members.length() > 0;
            LinkedHashSet<String> memberIds = new LinkedHashSet<>();
            for (int i = 0; i < members.length(); i++) {
                String id = members.optString(i, "");
                if (!id.isEmpty()) memberIds.add(id);
                if (id.isEmpty() || !availableIds.contains(id)) complete = false;
            }
            String uri = collection.optString("collectionUri", "");
            if (!complete || uri.isEmpty()) continue;
            allCollectionMembers.addAll(memberIds);
            JSONArray memberCopy = new JSONArray();
            for (int i = 0; i < members.length(); i++) memberCopy.put(members.optString(i));
            JSONObject restoredCollection = new JSONObject();
            restoredCollection.put("uri", uri);
            restoredCollection.put("type", collection.optString("type", ""));
            restoredCollection.put("name", ExportIndex.cleanCollectionName(collection.optString("name", "")));
            restoredCollection.put("tracks", memberCopy);
            restoredCollection.put("synced", collection.optLong("updatedAt", System.currentTimeMillis()));
            restoredCollection.put("quality", "");
            if (!listsByUri.containsKey(uri)) addedCollections++;
            listsByUri.put(uri, restoredCollection);
        }

        JSONArray restoredLists = new JSONArray();
        for (JSONObject list : listsByUri.values()) restoredLists.put(list);
        LinkedHashSet<String> singles = new LinkedHashSet<>();
        JSONArray oldSingles = oldCollections.optJSONArray("singles");
        if (oldSingles != null) for (int i = 0; i < oldSingles.length(); i++) {
            String id = oldSingles.optString(i, "");
            if (!id.isEmpty() && availableIds.contains(id)) singles.add(id);
        }
        JSONArray portableSingles = archive.singleTrackIds();
        if (portableSingles.length() > 0) {
            for (int i = 0; i < portableSingles.length(); i++) {
                String id = portableSingles.optString(i, "");
                if (!id.isEmpty() && availableIds.contains(id)) singles.add(id);
            }
        } else {
            // Older portable indexes may not contain the individually-downloaded set. Infer
            // singles as restored tracks that are not members of any recorded collection. This
            // preserves the OfflineCollections rule (a track remains while a list or single
            // owns it) without incorrectly marking every playlist track as individually saved.
            for (String id : availableIds) {
                if (!allCollectionMembers.contains(id)) singles.add(id);
            }
        }
        JSONArray singleArray = new JSONArray();
        for (String id : singles) singleArray.put(id);
        JSONObject collectionsRoot = new JSONObject();
        collectionsRoot.put("version", 1);
        collectionsRoot.put("lists", restoredLists);
        collectionsRoot.put("singles", singleArray);
        writeAtomicIndex(new File(root, "collections.json"), collectionsRoot.toString());
        result.collectionsRestored = addedCollections;

        // Reload both Compose snapshot maps on Android's main thread so the native Downloads
        // screen immediately sees the reconstructed records.
        if (!reloadOnMainThread(app)) throw new IOException("Files were restored, but MySpoti could not reload its native Downloads index. Restart MySpoti and check Downloads again.");
        Log.i(TAG, "Native Downloads restore complete: restored=" + result.restored
                + ", skipped=" + result.skipped + ", failed=" + result.failed
                + ", collections=" + result.collectionsRestored + ", lyrics=" + result.lyricsRestored
                + ", lyricsFailed=" + result.lyricsFailed);
        return result;
    }

    public static final class RestoreResult {
        public int restored;
        public int skipped;
        public int failed;
        public int collectionsRestored;
        public int lyricsRestored;
        public int lyricsFailed;
        public String lastError;
    }

    private static JSONArray readNativeIndex(File primary, File backup) throws IOException {
        if (primary.isFile()) {
            try { return new JSONArray(readFileText(primary, 64L * 1024L * 1024L)); }
            catch (Throwable primaryError) {
                if (backup.isFile()) {
                    try { return new JSONArray(readFileText(backup, 64L * 1024L * 1024L)); }
                    catch (Throwable backupError) { throw new IOException("MySpoti's existing Downloads index and its backup are unreadable; restore was stopped to protect existing data.", backupError); }
                }
                throw new IOException("MySpoti's existing Downloads index is unreadable; restore was stopped to protect existing data.", primaryError);
            }
        }
        if (backup.isFile()) {
            try { return new JSONArray(readFileText(backup, 64L * 1024L * 1024L)); }
            catch (Throwable t) { throw new IOException("MySpoti's Downloads backup is unreadable; restore was stopped.", t); }
        }
        return new JSONArray();
    }

    private static String readFileText(File file, long maximumBytes) throws IOException {
        long length = file.length();
        if (length < 0L || length > maximumBytes) throw new IOException("Offline index is unexpectedly large.");
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) length];
            int offset = 0;
            while (offset < bytes.length) {
                int n = input.read(bytes, offset, bytes.length - offset);
                if (n < 0) throw new IOException("Offline index ended unexpectedly.");
                offset += n;
            }
            return new String(bytes, StandardCharsets.UTF_8);
        }
    }

    private static JSONObject readJsonObject(File file) {
        if (!file.isFile()) return new JSONObject();
        try { return new JSONObject(readText(file)); }
        catch (Throwable t) { Log.w(TAG, "Existing collections index could not be read; preserving songs and rebuilding collection metadata", t); return new JSONObject(); }
    }

    private static String safeAudioExtension(String extension, String fileName) {
        String value = extension == null ? "" : extension.trim().toLowerCase(java.util.Locale.ROOT);
        if (value.isEmpty() && fileName != null) {
            int dot = fileName.lastIndexOf('.');
            if (dot >= 0) value = fileName.substring(dot + 1).toLowerCase(java.util.Locale.ROOT);
        }
        return ("mp3".equals(value) || "m4a".equals(value) || "flac".equals(value)) ? value : "";
    }

    private static String stableToken(String value) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder token = new StringBuilder();
        for (int i = 0; i < 12; i++) token.append(String.format(java.util.Locale.ROOT, "%02x", digest[i] & 0xff));
        return token.toString();
    }

    private static String extractEmbeddedCover(File audio, File coverDir, String token) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(audio.getAbsolutePath());
            byte[] picture = retriever.getEmbeddedPicture();
            if (picture == null || picture.length == 0 || picture.length > 16 * 1024 * 1024) return "";
            boolean png = picture.length >= 8 && picture[0] == (byte) 0x89 && picture[1] == 0x50
                    && picture[2] == 0x4e && picture[3] == 0x47;
            String filename = "restored_" + token + (png ? ".png" : ".jpg");
            File target = new File(coverDir, filename);
            try (FileOutputStream output = new FileOutputStream(target)) {
                output.write(picture);
                output.getFD().sync();
            }
            return filename;
        } catch (Throwable t) {
            Log.w(TAG, "Could not extract embedded artwork from restored audio " + audio.getName(), t);
            return "";
        } finally {
            try { retriever.release(); } catch (Throwable ignored) {}
        }
    }

    private static void encryptWithCurrentInstallationKey(Context context, File plain, File encrypted) throws Exception {
        Class<?> crypto = Class.forName(CRYPTO);
        Object singleton = staticSingleton(crypto, "a");
        Method encrypt = null;
        for (Method method : crypto.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (parameters.length == 3 && parameters[0] == Context.class
                    && parameters[1] == File.class && parameters[2] == File.class
                    && method.getReturnType() == Void.TYPE) {
                encrypt = method;
                break;
            }
        }
        if (encrypt == null) throw new NoSuchMethodException("MySpoti OfflineCrypto.encrypt(Context, File, File) was not found in this APK.");
        encrypt.setAccessible(true);
        encrypt.invoke(singleton, context.getApplicationContext(), plain, encrypted);
    }

    private static void writeAtomicIndex(File destination, String text) throws IOException {
        File parent = destination.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) throw new IOException("Could not create index folder " + parent);
        File temporary = new File(parent, destination.getName() + ".morphe-restore.tmp");
        File backup = new File(parent, "index.json".equals(destination.getName())
                ? "index.json.bak" : destination.getName() + ".morphe-restore.bak");
        if (destination.isFile()) {
            boolean safeToBackUp = true;
            if ("index.json".equals(destination.getName())) {
                try {
                    new JSONArray(readFileText(destination, 64L * 1024L * 1024L));
                } catch (Throwable invalidPrimary) {
                    // readNativeIndex may already have fallen back to a good .bak file. Never
                    // overwrite that last-known-good backup with an unreadable primary index.
                    safeToBackUp = false;
                }
            }
            if (safeToBackUp && !copyTree(destination, backup)) {
                throw new IOException("Could not back up " + destination.getName() + " before restore.");
            }
        }
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(text.getBytes(StandardCharsets.UTF_8));
            output.flush();
            output.getFD().sync();
        }
        if (destination.exists() && !destination.delete()) {
            temporary.delete();
            throw new IOException("Could not replace MySpoti's " + destination.getName() + ".");
        }
        if (!temporary.renameTo(destination)) {
            if (backup.isFile()) copyTree(backup, destination);
            temporary.delete();
            throw new IOException("Could not activate the restored " + destination.getName() + ".");
        }
    }

    /**
     * Stable identity for the portable export ledger. It deliberately excludes local paths,
     * timestamps and encryption IVs, so the same song is recognised after reinstall/re-download.
     */
    public static String exportFingerprint(Object track, File source) throws Exception {
        String extension = "";
        String filename = source == null ? "" : source.getName();
        int dot = filename.lastIndexOf('.');
        if (dot >= 0) extension = filename.substring(dot + 1).toLowerCase(java.util.Locale.ROOT);
        String material = trackId(track) + "\n" + trackTitle(track) + "\n" + trackArtist(track)
                + "\n" + trackAlbum(track) + "\n" + trackDurationMs(track) + "\n" + extension
                + "\n" + (source != null && source.isFile() ? source.length() : 0L);
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(material.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(digest.length * 2);
        for (byte value : digest) hex.append(String.format(java.util.Locale.ROOT, "%02x", value & 0xff));
        return hex.toString();
    }

    /** The cover image is stored beside the offline index, not inside the encrypted audio file. */
    public static File trackCoverFile(Context context, Object track) {
        String filename = trackCover(track);
        if (filename.isEmpty()) return null;
        File cover = new File(new File(storageRoot(context), "covers"), filename);
        return cover.isFile() ? cover : null;
    }

    /**
     * Decrypts to a private temporary file, writes the track's stored metadata into the audio
     * container (ID3 for MP3, Vorbis comments/Picture for FLAC, iTunes atoms for M4A), and streams
     * the tagged result to the caller's selected SAF destination. Returns false for an audio
     * extension whose tag container is not supported; the playable audio is still exported.
     */
    public static boolean exportTagged(Context context, File source, Object track, OutputStream destination) throws Exception {
        return exportTagged(context, source, track, destination, null);
    }

    public static boolean exportTagged(Context context, File source, Object track, OutputStream destination,
                                       String lyricsText) throws Exception {
        String filename = source.getName();
        int dot = filename.lastIndexOf('.');
        String suffix = dot >= 0 ? filename.substring(dot) : ".bin";
        File plain = File.createTempFile("myspoti-export-plain-", suffix, context.getCacheDir());
        File tagged = File.createTempFile("myspoti-export-tagged-", suffix, context.getCacheDir());
        try {
            try (FileOutputStream decrypted = new FileOutputStream(plain)) {
                copyDecrypted(context, source, decrypted);
                decrypted.flush();
            }
            boolean metadataWritten = AudioMetadataWriter.writeTagged(
                    plain, tagged,
                    trackTitle(track), trackArtist(track), trackAlbum(track),
                    trackDurationMs(track), trackCoverFile(context, track), lyricsText
            );
            try (InputStream input = new FileInputStream(tagged)) {
                copyStream(input, destination);
                destination.flush();
            }
            Log.i(TAG, "Exported " + filename + " with embedded metadata=" + metadataWritten
                    + ", lyrics=" + (lyricsText != null && !lyricsText.isEmpty()));
            return metadataWritten;
        } finally {
            if (plain.exists() && !plain.delete()) Log.w(TAG, "Could not delete export temp file " + plain.getName());
            if (tagged.exists() && !tagged.delete()) Log.w(TAG, "Could not delete tagged temp file " + tagged.getName());
        }
    }

    private static String safeTrackString(Object track, String field) {
        try { return trackString(track, field); }
        catch (Throwable ignored) { return ""; }
    }

    private static String trackString(Object track, String fieldName) throws Exception {
        Object value = declaredField(track.getClass(), fieldName).get(track);
        return value == null ? "" : String.valueOf(value);
    }

    private static long trackLong(Object track, String fieldName) {
        try {
            Object value = declaredField(track.getClass(), fieldName).get(track);
            return value instanceof Number ? ((Number) value).longValue() : 0L;
        } catch (Throwable ignored) { return 0L; }
    }

    private static Field declaredField(Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /** Decrypts Myspoti's MSE1/AES-CTR wrapper while streaming to the selected SAF folder. */
    public static void copyDecrypted(Context context, File source, OutputStream destination) throws Exception {
        Class<?> cryptoClass = Class.forName(CRYPTO);
        Method isEncrypted = cryptoClass.getDeclaredMethod("d", File.class);
        isEncrypted.setAccessible(true);
        boolean encrypted = Boolean.TRUE.equals(isEncrypted.invoke(null, source));

        try (InputStream input = new FileInputStream(source)) {
            if (!encrypted) {
                copyStream(input, destination);
                return;
            }

            byte[] header = new byte[20];
            int offset = 0;
            while (offset < header.length) {
                int n = input.read(header, offset, header.length - offset);
                if (n < 0) throw new java.io.EOFException("Truncated encrypted download");
                offset += n;
            }
            byte[] magic = new byte[] { 'M', 'S', 'E', '1' };
            for (int i = 0; i < 4; i++) {
                if (header[i] != magic[i]) throw new IOException("Unknown Myspoti encrypted-file format");
            }
            byte[] iv = new byte[16];
            System.arraycopy(header, 4, iv, 0, 16);

            Object crypto = staticSingleton(cryptoClass, "a");
            Method keyMethod = cryptoClass.getDeclaredMethod("e", Context.class);
            keyMethod.setAccessible(true);
            SecretKey key = (SecretKey) keyMethod.invoke(crypto, context.getApplicationContext());
            Cipher cipher = Cipher.getInstance("AES/CTR/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(iv));

            byte[] buffer = new byte[256 * 1024];
            int n;
            while ((n = input.read(buffer)) >= 0) {
                if (n == 0) continue;
                byte[] plain = cipher.update(buffer, 0, n);
                if (plain != null && plain.length > 0) destination.write(plain);
            }
            byte[] tail = cipher.doFinal();
            if (tail.length > 0) destination.write(tail);
        }
    }

    private static void copyStream(InputStream input, OutputStream output) throws IOException {
        byte[] buffer = new byte[256 * 1024];
        int n;
        while ((n = input.read(buffer)) >= 0) if (n > 0) output.write(buffer, 0, n);
    }

    /** Refuse to relocate the library while a queue is persisted or a track is being downloaded. */
    public static boolean hasPendingDownloads(Context context) {
        File root = storageRoot(context);
        for (String name : new String[] { "pending.json", "podcasts-pending.json" }) {
            File pending = new File(root, name);
            if (pending.isFile() && pending.length() > 2) return true;
        }
        try {
            Object statuses = declaredField(Class.forName(STORE), "e").get(null);
            if (statuses instanceof Map) {
                for (Object status : ((Map<?, ?>) statuses).values()) {
                    String text = String.valueOf(status);
                    String type = status == null ? "" : status.getClass().getName();
                    if (text.startsWith("Queued") || text.startsWith("Downloading")
                            || type.endsWith("$Queued") || type.endsWith("$Downloading")) return true;
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    /**
     * Moves the complete active offline folder. Destination collisions are refused rather than
     * merging two account indexes or overwriting audio. The source remains until reload succeeds.
     */
    public static String moveTo(Context context, String targetId) {
        Context app = context.getApplicationContext();
        if (hasPendingDownloads(app)) return "Finish or cancel queued downloads before changing storage.";
        File targetBase = baseForId(app, targetId);
        if (targetBase == null) return "That storage volume is no longer available or writable.";

        String previousId = selectedStorageId(app);
        File source = storageRoot(app);
        File target = new File(targetBase, "offline");
        File temp = new File(targetBase, "offline.morphe-moving");
        boolean copiedToTarget = false;

        try {
            if (source.getCanonicalPath().equals(target.getCanonicalPath())) {
                if (previousId.equals(targetId)) return "Downloads are already stored there.";
                if (!app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                        .putString(PREF_LOCATION, targetId).commit()) {
                    return "Could not save the new download location.";
                }
                if (!reloadOnMainThread(app)) {
                    app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putString(PREF_LOCATION, previousId).commit();
                    try { reloadOnMainThread(app); } catch (Throwable ignored) {}
                    return "The selected folder could not be reopened. The previous setting was restored.";
                }
                return "Download location changed to " + storageLabelForId(app, targetId) + ".";
            }
            if (!targetBase.exists() && !targetBase.mkdirs()) return "Could not create the selected storage folder.";
            if (target.exists()) {
                String[] existing = target.list();
                if (existing == null) return "Could not inspect the destination folder. Your downloads were left in place.";
                if (existing.length > 0) {
                    return "The selected location already has an offline folder. Choose an empty location to avoid overwriting another library.";
                }
            }

            deleteTree(temp);
            if (source.exists()) {
                if (!copyTree(source, temp)) {
                    deleteTree(temp);
                    return "Copy failed. Your original downloads were left in place.";
                }
                if (target.exists() && !deleteTree(target)) {
                    deleteTree(temp);
                    return "Could not prepare the destination. Your original downloads were left in place.";
                }
                if (!temp.renameTo(target)) {
                    deleteTree(temp);
                    return "Could not activate the new folder. Your original downloads were left in place.";
                }
                copiedToTarget = true;
            } else {
                if (!target.exists() && !target.mkdirs()) return "Could not create the selected storage folder.";
                copiedToTarget = true;
            }

            if (!app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .putString(PREF_LOCATION, targetId).commit()) {
                if (copiedToTarget) deleteTree(target);
                return "Could not save the new download location. Your original downloads were left in place.";
            }

            boolean loaded = reloadOnMainThread(app);
            if (!loaded) {
                app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putString(PREF_LOCATION, previousId).commit();
                try { reloadOnMainThread(app); } catch (Throwable ignored) {}
                if (copiedToTarget) deleteTree(target);
                return "The new folder could not be opened. Your original downloads were kept.";
            }

            // Resolve the label before deleting the old copy, so a display-only failure can
            // never trigger rollback that removes the now-active destination.
            String targetLabel;
            try { targetLabel = storageLabelForId(app, targetId); }
            catch (Throwable ignored) { targetLabel = "selected app storage"; }

            // Delete old data only after both the audio and downloaded-list indexes reopened.
            if (source.exists() && !source.getCanonicalPath().equals(target.getCanonicalPath())) {
                if (!deleteTree(source)) Log.w(TAG, "New location is active, but some old files could not be removed");
            }
            return "Download location changed to " + targetLabel + ".";
        } catch (Throwable t) {
            Log.e(TAG, "Storage move failed", t);
            // Never delete the destination once the source has been removed.
            if (copiedToTarget && source.exists()) deleteTree(target);
            return "Storage move failed. The original folder has been kept.";
        }
    }

    /** Reopen both Compose-backed indexes on the main thread, matching Myspoti's own contract. */
    private static boolean reloadOnMainThread(Context context) throws Exception {
        boolean loaded;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            loaded = loadStore(context) && setCollectionsFileAndRead(context);
        } else {
            FutureTask<Boolean> task = new FutureTask<>(() -> loadStore(context) && setCollectionsFileAndRead(context));
            new Handler(Looper.getMainLooper()).post(task);
            loaded = task.get();
        }
        if (loaded) startAutoSyncObserver(context);
        return loaded;
    }

    private static boolean loadStore(Context context) {
        try {
            Class<?> store = Class.forName(STORE);
            Object statuses = declaredField(store, "e").get(null);
            if (statuses instanceof Map) ((Map<?, ?>) statuses).clear();
            Method load = store.getDeclaredMethod("k", File.class);
            load.setAccessible(true);
            Object result = load.invoke(null, storageRoot(context));
            return result instanceof List;
        } catch (Throwable t) {
            Log.e(TAG, "Could not reload the selected offline folder", t);
            return false;
        }
    }

    /** The R8-mapped OfflineCollections.file field is ic5.b; collections are ic5.e; singles are ic5.f. */
    private static boolean setCollectionsFileAndRead(Context context) {
        try {
            Class<?> collections = Class.forName(COLLECTIONS);
            File index = new File(storageRoot(context), "collections.json");
            declaredField(collections, "b").set(null, index);

            Object collectionMap = declaredField(collections, "e").get(null);
            if (collectionMap instanceof Map) ((Map<?, ?>) collectionMap).clear();
            Object singles = declaredField(collections, "f").get(null);
            if (singles instanceof Set) ((Set<?>) singles).clear();

            if (index.isFile()) {
                Method read = collections.getDeclaredMethod("f", String.class);
                read.setAccessible(true);
                read.invoke(null, readText(index));
            }
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Could not reopen downloaded-list index", t);
            return false;
        }
    }

    private static String readText(File file) throws IOException {
        try (FileInputStream input = new FileInputStream(file)) {
            long length = file.length();
            if (length > 4L * 1024L * 1024L) throw new IOException("Downloaded-list index is unexpectedly large");
            byte[] bytes = new byte[(int) length];
            int offset = 0;
            while (offset < bytes.length) {
                int n = input.read(bytes, offset, bytes.length - offset);
                if (n < 0) break;
                offset += n;
            }
            return new String(bytes, 0, offset, java.nio.charset.StandardCharsets.UTF_8);
        }
    }

    private static String storageLabelForId(Context context, String id) {
        for (StorageOption option : storageOptions(context)) if (option.id.equals(id)) return option.label;
        return "external app storage";
    }

    private static Object staticSingleton(Class<?> type, String fieldName) throws Exception {
        return declaredField(type, fieldName).get(null);
    }

    private static boolean copyTree(File source, File target) throws IOException {
        if (source.isDirectory()) {
            if (!target.exists() && !target.mkdirs()) return false;
            File[] children = source.listFiles();
            if (children == null) return false;
            for (File child : children) if (!copyTree(child, new File(target, child.getName()))) return false;
            return true;
        }
        File parent = target.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) return false;
        try (FileInputStream input = new FileInputStream(source);
             FileOutputStream output = new FileOutputStream(target)) {
            byte[] buffer = new byte[256 * 1024];
            int n;
            while ((n = input.read(buffer)) >= 0) if (n > 0) output.write(buffer, 0, n);
            output.getFD().sync();
        }
        return target.length() == source.length();
    }

    private static boolean deleteTree(File file) {
        if (file == null || !file.exists()) return true;
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children != null) for (File child : children) if (!deleteTree(child)) return false;
        }
        return file.delete();
    }
}
