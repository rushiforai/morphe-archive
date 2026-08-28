package app.morphe.extension.discord.bunny.recovery;

import android.app.Activity;
import android.content.Context;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import app.morphe.extension.discord.bunny.launcher.BunnyShortcutActivity;
import app.morphe.extension.discord.bunny.launcher.BunnyShortcutContract;
import app.morphe.extension.discord.bunny.launcher.BunnyShortcutPublisher;
import app.morphe.extension.discord.bunny.launcher.LauncherNavigationState;


import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Collections;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Native coordinator that remains available when every third-party plugin is bypassed. */
public final class RecoveryManager {
    private static final String TAG = "BunnyRecovery";
    private static final int CREATE_BACKUP = 0xB151;
    private static final int RESTORE_BACKUP = 0xB152;
    private static final long RESTORE_CONFIRMATION_TTL_MS = 10L * 60L * 1000L;
    private static final Object LOCK = new Object();
    private static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "Bunny-Recovery");
        thread.setDaemon(true);
        return thread;
    });

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static Context context;
    private static RecoveryStore store;
    private static BackupRestoreManager backups;
    private static PluginRollbackManager rollbacks;
    private static RecoveryState state;
    private static boolean sessionInitialized;
    private static boolean sessionSafeMode;
    /* BUNNY_PERSISTENT_SAFE_MODE_STATUS_V1 */
    private static boolean persistentSafeModeEnabled;
    private static Object pendingPromise;
    private static PendingRestore pendingRestore;
    private static Set<String> pendingBackupCategories;
    private static boolean crashHandlerInstalled;

    private RecoveryManager() {}

    public static void onActivityCreate(
            Activity activity,
            Bundle savedInstanceState
    ) {
        if (activity == null) return;

        boolean shortcutHandled =
                BunnyShortcutActivity.dispatch(
                        activity,
                        activity.getIntent()
                );

        /*
         * BUNNY_TEMP_SAFE_MODE_ONE_LAUNCH_V1
         */
        if (
                !shortcutHandled
                        && savedInstanceState == null
                        && restartNormalAfterTemporarySafeMode(activity)
        ) {
            return;
        }

        activityRef =
                new WeakReference<>(activity);

        Context app =
                activity.getApplicationContext();

        /*
         * BUNNY_RESTORE_BEFORE_RECOVERY_INIT_V5
         */
        Context bunnyRestoreContext =
                activity.getApplicationContext();

        if (bunnyRestoreContext == null) {
            bunnyRestoreContext = activity;
        }

        try {
            if (
                    BackupRestoreManager
                            .applyPendingRestoreBeforeRecoveryInit(
                                    bunnyRestoreContext
                            )
            ) {
                Log.i(
                        TAG,
                        "PENDING_RESTORE_APPLIED_BEFORE_RECOVERY_INIT"
                );
            }
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "Pending Bunny restore failed before Recovery initialization",
                    failure
            );

            BackupRestoreManager
                    .discardPendingRestoreBeforeRecoveryInit(
                            bunnyRestoreContext
                    );
        }

        ensure(
                app != null
                        ? app
                        : activity
        );

        /*
         * BUNNY_COLD_RESTORE_BEFORE_JS_V1
         *
         * BunnyBootstrap calls RecoveryManager.onActivityCreate before it
         * starts Bunny's JS bundle. Apply the staged archive here so the new
         * vd_mmkv/theme/font/plugin proxies initialize from restored disk state.
         */
        applyPendingRestoreBeforeBunnyBootstrap();

        synchronized (LOCK) {
            if (!sessionInitialized) {
                beginSessionLocked();
            }
        }

        BunnyShortcutPublisher.publish(activity);
    }

    /*
     * BUNNY_PENDING_RESTORE_STARTUP_HELPER_V1
     */
    private static void applyPendingRestoreBeforeBunnyBootstrap() {
        try {
            if (backups != null && backups.applyPendingRestoreIfPresent()) {
                Log.i(
                        TAG,
                        "PENDING_RESTORE_APPLIED_BEFORE_BUNNY_BOOTSTRAP"
                );

                appendEvent(
                        "backup-restored-cold-start",
                        new JSONObject()
                );
            }
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "Pending Bunny restore failed before bootstrap",
                    failure
            );

            if (backups != null) {
                backups.discardPendingRestore();
            }
        }
    }

    private static boolean restartNormalAfterTemporarySafeMode(
            Activity activity
    ) {
        synchronized (LOCK) {
            if (
                    !sessionInitialized
                            || !sessionSafeMode
                            || state == null
            ) {
                return false;
            }

            state.temporarySafeModeNextLaunch = false;
            state.recoveryLatch = false;
            state.tryNormalOnce = false;
            state.startupInProgress = false;
            state.startupHealthy = true;
            state.currentPlugin = null;
            state.initializingPlugins.clear();
            store.write(state);
        }

        appendEvent(
                "temporary-safe-mode-exit",
                eventDetails("reason", "fresh-normal-launch")
        );

        return BunnyShortcutActivity.restartAtFreshBootstrap(activity);
    }

    public static JSONObject loaderState(Context candidate) {
        ensure(candidate);
        synchronized (LOCK) {
            if (!sessionInitialized) beginSessionLocked();
            return statusLocked();
        }
    }

    public static boolean handleUrl(String raw, Object promise) {
        if (raw == null) return false;
        Uri uri;
        try {
            uri = Uri.parse(raw);
        } catch (Throwable ignored) {
            return false;
        }
        if (!"bunny-morphe".equals(uri.getScheme())) return false;

        if ("launcher".equals(uri.getHost())) {
            ensure(context);

            String launcherAction =
                    uri.getPathSegments().isEmpty()
                            ? ""
                            : uri.getPathSegments().get(0);

            try {
                if ("branding-status".equals(launcherAction)) {
                    resolve(
                            promise,
                            app.morphe.extension.discord.bunny.branding.BunnyBrandingManager.status(
                                    activityRef.get()
                            )
                    );
                    return true;
                }

                if ("branding-apply".equals(launcherAction)) {
                    resolve(
                            promise,
                            app.morphe.extension.discord.bunny.branding.BunnyBrandingManager.apply(
                                    activityRef.get(),
                                    uri.getQueryParameter("icon"),
                                    uri.getQueryParameter("name")
                            )
                    );
                    return true;
                }
                if ("request-navigation".equals(launcherAction)) {
                    String target =
                            uri.getQueryParameter("target");

                    if (
                            !BunnyShortcutContract.TARGET_SETTINGS.equals(target)
                                    && !BunnyShortcutContract.TARGET_RECOVERY.equals(target)
                    ) {
                        resolve(
                                promise,
                                error("Unknown Bunny launcher destination")
                        );
                        return true;
                    }

                    LauncherNavigationState.request(
                            context,
                            target
                    );

                    resolve(
                            promise,
                            ok()
                    );

                    return true;
                }

                if ("request-safe-mode".equals(launcherAction)) {
                    Activity activity =
                            activityRef.get();

                    if (activity == null) {
                        resolve(
                                promise,
                                error("No active Discord window")
                        );
                        return true;
                    }

                    BunnyShortcutActivity.requestSafeMode(
                            activity
                    );

                    resolve(
                            promise,
                            ok()
                    );

                    return true;
                }
            } catch (Throwable failure) {
                Log.e(
                        TAG,
                        "Bunny launcher request failed",
                        failure
                );

                resolve(
                        promise,
                        error(failure.getMessage())
                );

                return true;
            }

            return false;
        }

        if (!"recovery".equals(uri.getHost())) return false;

        ensure(context);

        String action =
                uri.getPathSegments().isEmpty()
                        ? ""
                        : uri.getPathSegments().get(0);
        try {
            switch (action) {
                case "startup-in-progress":
                    synchronized (LOCK) {
                        StartupRecoveryPolicy.pluginStageStarted(state);
                        store.write(state);
                    }
                    resolve(promise, ok());
                    break;
                case "plugin-load-begin":
                    pluginLoadBegin(uri, promise);
                    break;
                case "plugin-load-ok":
                    pluginLoadOk(uri, promise);
                    break;
                case "plugin-update-begin":
                    pluginUpdateBegin(uri, promise);
                    break;
                case "plugin-change":
                    pluginChanged(uri, promise);
                    break;
                case "js-crash":
                    recordJsCrash(uri, promise);
                    break;
                case "startup-healthy":
                    markHealthy(promise);
                    break;
                case "status":
                    synchronized (LOCK) {
                        resolve(promise, statusLocked().toString());
                    }
                    break;
                case "safe-mode":
                    setSafeMode(parseBoolean(uri.getQueryParameter("enabled")), promise);
                    break;
                case "restore-known-good":
                    stageKnownGoodRestoreAndRestart(promise);
                    break;
                case "rollback-plugin":
                    rollbackPlugin(promise);
                    break;
                case "clear-history":
                    clearHistory(promise);
                    break;
                case "delete-record":
                    deleteRecord(uri.getQueryParameter("kind"), uri.getQueryParameter("id"), promise);
                    break;
                case "clear-records":
                    clearRecords(uri.getQueryParameter("kind"), promise);
                    break;
                case "create-backup":
                    launchCreate(BunnyBackup.parseCategories(uri.getQueryParameter("categories")), promise);
                    break;
                case "restore-backup":
                    launchRestore(promise);
                    break;
                case "restore-apply":
                    applyPendingRestore(uri.getQueryParameter("token"), promise);
                    break;
                case "restore-apply-reload":
                    applyPendingRestoreForBundleReload(
                            uri.getQueryParameter("token"),
                            promise
                    );
                    break;
                case "restore-cancel":
                    cancelPendingRestore(uri.getQueryParameter("token"), promise);
                    break;
                case "transfer-backup":
                    transferBackup(BunnyBackup.parseCategories(uri.getQueryParameter("categories")), promise);
                    break;
                case "export-logs":
                    exportLogs(
                            normalizeHistoryKind(uri.getQueryParameter("kind")),
                            parseRecordIds(uri.getQueryParameter("ids")),
                            promise
                    );
                    break;
                default:
                    resolve(promise, error("Unknown Recovery action"));
                    break;
            }
        } catch (Throwable failure) {
            Log.e(TAG, "Recovery URL failed", failure);
            resolve(promise, error(failure.getMessage()));
        }
        return true;
    }

    public static boolean handleActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != CREATE_BACKUP && requestCode != RESTORE_BACKUP) return false;
        final Object promise;
        final Set<String> categories;
        synchronized (LOCK) {
            promise = pendingPromise;
            pendingPromise = null;
            categories = pendingBackupCategories;
            pendingBackupCategories = null;
        }
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            resolve(promise, cancelled());
            return true;
        }
        Uri uri = data.getData();
        if (requestCode == RESTORE_BACKUP) previewRestore(uri, promise);
        else createAt(uri, categories, promise);
        return true;
    }

    private static JSONObject statusLocked() {
        JSONObject recovery = new JSONObject();
        try {
            String rollbackPlugin = state.mostRecentlyChangedPlugin;
            recovery.put("status", "success");
            boolean effectiveSafeMode =
                    sessionSafeMode
                            || persistentSafeModeEnabled;
            recovery.put("safeMode", effectiveSafeMode);
            recovery.put("persistentSafeMode", persistentSafeModeEnabled);
            recovery.put("temporarySafeModeCurrentSession", sessionSafeMode && !state.recoveryLatch);
            recovery.put("recoveryImposedBypass", sessionSafeMode && state.recoveryLatch);
            recovery.put("temporarySafeModeNextLaunch", state.temporarySafeModeNextLaunch);
            recovery.put("safeModeNextLaunch", state.temporarySafeModeNextLaunch || state.recoveryLatch);
            recovery.put("previousStartupFailed", state.consecutiveFailures > 0);
            recovery.put("failureCount", state.consecutiveFailures);
            recovery.put("failedStartCount", state.failedStarts.size());
            JSONArray failedStarts = new JSONArray();
            for (RecoveryState.FailedStartRecord failure : state.failedStarts) failedStarts.put(failure.toJson());
            recovery.put("failedStarts", failedStarts);
            recovery.put("suspectedPlugin", state.currentPlugin == null ? JSONObject.NULL : state.currentPlugin);
            recovery.put("hasLastKnownGood", backups.hasKnownGood());
            recovery.put("rollbackPlugin", rollbackPlugin == null ? JSONObject.NULL : rollbackPlugin);
            recovery.put("rollbackAvailable", rollbacks.has(rollbackPlugin));
            recovery.put("lastHealthyAt", state.lastHealthyAt);
            recovery.put("totalCrashes", state.totalCrashes);
            recovery.put("crashCount", state.recentCrashes.size());
            JSONArray recentCrashes = new JSONArray();
            for (RecoveryState.CrashRecord crash : state.recentCrashes) recentCrashes.put(crash.toJson());
            recovery.put("recentCrashes", recentCrashes);
            recovery.put("schemaVersion", BunnyBackup.SCHEMA_VERSION);
        } catch (Throwable ignored) {}
        return recovery;
    }

    private static void pluginLoadBegin(Uri uri, Object promise) {
        String id = stableIdentity(uri.getQueryParameter("id"));
        synchronized (LOCK) {
            state.initializingPlugins.add(id);
            state.currentPlugin = state.initializingPlugins.size() == 1 ? id : null;
            store.write(state);
        }
        appendEvent("plugin-load-begin", eventDetails("plugin", id));
        resolve(promise, ok());
    }

    private static void pluginLoadOk(Uri uri, Object promise) {
        String id = stableIdentity(uri.getQueryParameter("id"));
        synchronized (LOCK) {
            state.initializingPlugins.remove(id);
            state.currentPlugin = state.initializingPlugins.size() == 1
                    ? state.initializingPlugins.iterator().next()
                    : null;
            store.write(state);
        }
        appendEvent("plugin-load-ok", eventDetails("plugin", id));
        resolve(promise, ok());
    }

    private static void pluginUpdateBegin(Uri uri, Object promise) {
        String id = stableIdentity(uri.getQueryParameter("id"));
        String kind = "vendetta".equals(uri.getQueryParameter("kind")) ? "vendetta" : "modern";
        synchronized (LOCK) {
            if (rollbacks.preserve(id, kind)) state.mostRecentlyChangedPlugin = id;
            store.write(state);
        }
        appendEvent("plugin-update", eventDetails("plugin", id, "kind", kind));
        resolve(promise, ok());
    }

    private static void pluginChanged(Uri uri, Object promise) {
        String id = stableIdentity(uri.getQueryParameter("id"));
        synchronized (LOCK) {
            state.mostRecentlyChangedPlugin = id;
            store.write(state);
        }
        appendEvent("plugin-change", eventDetails(
                "plugin", id,
                "kind", stableIdentity(uri.getQueryParameter("kind"))
        ));
        resolve(promise, ok());
    }

    private static void recordJsCrash(Uri uri, Object promise) {
        recordCrash(
                "render",
                cleanText(uri.getQueryParameter("message"), 512),
                cleanText(uri.getQueryParameter("stack"), 4096),
                null
        );
        resolve(promise, ok());
    }

    private static void beginSessionLocked() {
        state = store.read();
        if (state.startupInProgress && !state.startupHealthy) {
            Log.w(TAG, "PREVIOUS_STARTUP_FAILED");
            RecoveryState.FailedStartRecord failure = new RecoveryState.FailedStartRecord(
                    null,
                    System.currentTimeMillis(),
                    state.session,
                    state.currentPlugin,
                    "Bunny did not reach its healthy startup checkpoint."
            );
            state.addFailedStart(failure);
            appendEvent("startup-failed", eventDetails(
                    "id", failure.id,
                    "session", failure.session,
                    "plugin", failure.plugin == null ? JSONObject.NULL : failure.plugin
            ));
        }
        sessionSafeMode = StartupRecoveryPolicy.begin(state);
        sessionInitialized = true;
        store.write(state);
        appendEvent("session-start", eventDetails(
                "session", state.session,
                "safeMode", sessionSafeMode
        ));
        if (sessionSafeMode) Log.i(TAG, "SAFE_MODE_ENTERED");
    }

    private static void markHealthy(Object promise) {
        synchronized (LOCK) {
            StartupRecoveryPolicy.healthy(state, sessionSafeMode);
            store.write(state);
        }
        if (!sessionSafeMode) {
            IO.execute(() -> {
                try {
                    backups.saveKnownGood("runtime");
                } catch (Throwable error) {
                    Log.e(TAG, "Could not update last-known-good snapshot", error);
                }
            });
        }
        appendEvent("startup-healthy", eventDetails("safeMode", sessionSafeMode));
        resolve(promise, ok());
    }

    private static void setSafeMode(boolean enabled, Object promise) {
        /*
         * The durable preference still belongs exclusively to Bunny's JS
         * settings store. Recovery only mirrors its current value so status
         * can represent every Safe Mode source without making the temporary
         * launcher/quick path persistent.
         */
        synchronized (LOCK) {
            persistentSafeModeEnabled = enabled;
        }
        appendEvent("persistent-safe-mode", eventDetails("enabled", enabled));
        resolve(promise, ok());
    }

    /*
     * BUNNY_KNOWN_GOOD_COLD_RESTORE_V1
     */
    private static void stageKnownGoodRestoreAndRestart(
            Object promise
    ) {
        final Activity activity =
                activityRef.get();

        if (activity == null) {
            resolve(
                    promise,
                    error("No active Discord window")
            );
            return;
        }

        IO.execute(() -> {
            try {
                backups.stageKnownGoodRestore();

                appendEvent(
                        "known-good-restore-staged",
                        new JSONObject()
                );

                resolve(
                        promise,
                        new JSONObject()
                                .put("status", "restarting")
                                .put(
                                        "message",
                                        "Last working state staged; restarting Bunny"
                                )
                                .toString()
                );

                activity.runOnUiThread(
                        () -> {
                            if (
                                    !BunnyShortcutActivity
                                            .restartAtFreshBootstrap(
                                                    activity
                                            )
                            ) {
                                Log.e(
                                        TAG,
                                        "Could not perform controlled restart after staging known-good restore"
                                );
                            }
                        }
                );
            } catch (Throwable failure) {
                Log.e(
                        TAG,
                        "Could not stage last working Bunny state",
                        failure
                );

                resolve(
                        promise,
                        error(failure.getMessage())
                );
            }
        });
    }

    private static void rollbackPlugin(Object promise) {
        final String id;
        synchronized (LOCK) {
            id = state.mostRecentlyChangedPlugin;
        }
        if (!rollbacks.has(id)) {
            resolve(promise, error("No previous plugin version is available"));
            return;
        }
        runAsync(promise, () -> rollbacks.restore(id));
    }

    private static void clearHistory(Object promise) {
        synchronized (LOCK) {
            state.consecutiveFailures = 0;
            state.currentPlugin = null;
            state.initializingPlugins.clear();
            state.recoveryLatch = false;
            state.totalCrashes = 0L;
            state.recentCrashes.clear();
            store.write(state);
        }
        appendEvent("history-cleared", new JSONObject());
        resolve(promise, ok());
    }

    private static void deleteRecord(String kindRaw, String id, Object promise) {
        String kind = normalizeHistoryKind(kindRaw);
        if (id == null || id.isEmpty()) {
            resolve(promise, error("The history record is missing"));
            return;
        }
        boolean removed;
        synchronized (LOCK) {
            if ("crashes".equals(kind)) {
                removed = state.recentCrashes.removeIf(record -> record.id.equals(id));
            } else {
                removed = state.failedStarts.removeIf(record -> record.id.equals(id));
            }
            if (removed) store.write(state);
        }
        if (!removed) {
            resolve(promise, error("The history record no longer exists"));
            return;
        }
        appendEvent("history-record-deleted", eventDetails("kind", kind, "id", id));
        resolve(promise, ok());
    }

    private static void clearRecords(String kindRaw, Object promise) {
        String kind = normalizeHistoryKind(kindRaw);
        synchronized (LOCK) {
            if ("crashes".equals(kind)) state.recentCrashes.clear();
            else state.failedStarts.clear();
            store.write(state);
        }
        appendEvent("history-records-cleared", eventDetails("kind", kind));
        resolve(promise, ok());
    }

    private static void launchCreate(Set<String> categories, Object promise) {
        Activity activity = activityRef.get();
        if (activity == null) {
            resolve(promise, error("No active Discord window"));
            return;
        }
        synchronized (LOCK) {
            if (pendingPromise != null) {
                resolve(promise, error("A Recovery picker is already open"));
                return;
            }
            pendingPromise = promise;
            pendingBackupCategories = categories;
        }
        Intent picker = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("application/json");
        picker.putExtra(
                Intent.EXTRA_TITLE,
                "bunny-backup-" + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date())
                        + ".bunnybackup"
        );
        activity.startActivityForResult(picker, CREATE_BACKUP);
    }

    private static void launchRestore(Object promise) {
        Activity activity = activityRef.get();
        if (activity == null) {
            resolve(promise, error("No active Discord window"));
            return;
        }
        synchronized (LOCK) {
            if (pendingPromise != null) {
                resolve(promise, error("A Recovery picker is already open"));
                return;
            }
            pendingPromise = promise;
            pendingRestore = null;
        }
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*");
        activity.startActivityForResult(picker, RESTORE_BACKUP);
    }

    private static void createAt(Uri uri, Set<String> categories, Object promise) {
        IO.execute(() -> {
            try {
                backups.writeBackup(uri, "runtime", categories == null ? BunnyBackup.allCategories() : categories);
                appendEvent("backup-created", categoryDetails(categories));
                resolve(promise, ok());
            } catch (Throwable failure) {
                Log.e(TAG, "Backup creation failed", failure);
                resolve(promise, error(failure.getMessage()));
            }
        });
    }

    private static void transferBackup(Set<String> categories, Object promise) {
        Activity activity = activityRef.get();
        if (activity == null) {
            resolve(promise, error("No active Discord window"));
            return;
        }
        IO.execute(() -> {
            try {
                byte[] bytes = backups.createBytes("runtime", categories);
                String name = "bunny-transfer-"
                        + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date())
                        + ".bunnybackup";
                shareBytes(bytes, name, "application/json", "Transfer Bunny Backup");
                appendEvent("backup-transferred", categoryDetails(categories));
                resolve(promise, ok());
            } catch (Throwable failure) {
                Log.e(TAG, "Backup transfer failed", failure);
                resolve(promise, error(failure.getMessage()));
            }
        });
    }

    private static void exportLogs(String kind, Set<String> ids, Object promise) {
        Activity activity = activityRef.get();
        if (activity == null) {
            resolve(promise, error("No active Discord window"));
            return;
        }
        if (ids.isEmpty()) {
            resolve(promise, error("Select at least one Recovery log"));
            return;
        }
        IO.execute(() -> {
            try {
                final JSONObject diagnostics;
                synchronized (LOCK) {
                    diagnostics = store.diagnostics(state, kind, ids);
                }
                byte[] bytes = diagnostics.toString(2).getBytes(StandardCharsets.UTF_8);
                String name = "bunny-" + kind + "-logs-"
                        + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date())
                        + ".json";
                shareBytes(bytes, name, "application/json", "Export Bunny "
                        + ("crashes".equals(kind) ? "Crash" : "Failed Start") + " Logs");
                resolve(promise, ok());
            } catch (Throwable failure) {
                Log.e(TAG, "Recovery log export failed", failure);
                resolve(promise, error(failure.getMessage()));
            }
        });
    }

    private static Set<String> parseRecordIds(String raw) {
        if (raw == null || raw.trim().isEmpty()) return Collections.emptySet();
        LinkedHashSet<String> ids = new LinkedHashSet<>();
        for (String part : raw.split(",")) {
            String id = part.trim();
            if (!id.isEmpty()) ids.add(id);
            if (ids.size() >= RecoveryState.MAX_HISTORY_RECORDS) break;
        }
        return Collections.unmodifiableSet(ids);
    }

    private static void previewRestore(Uri uri, Object promise) {
        IO.execute(() -> {
            try {
                BunnyBackup.Validated validated = backups.inspect(uri);
                String token = UUID.randomUUID().toString();
                JSONObject categories = validated.categories();
                PendingRestore candidate = new PendingRestore(
                        token,
                        validated,
                        System.currentTimeMillis()
                );
                synchronized (LOCK) {
                    pendingRestore = candidate;
                }
                JSONObject ready = new JSONObject();
                ready.put("status", "ready");
                ready.put("token", token);
                ready.put("schemaVersion", BunnyBackup.SCHEMA_VERSION);
                JSONObject changes = restoreChangeCategories(validated);
                ready.put("summary", restoreSummary(changes));
                ready.put("changes", changes);
                ready.put("categories", categories == null ? new JSONObject() : categories);
                resolve(promise, ready.toString());
            } catch (Throwable failure) {
                Log.e(TAG, "Backup validation failed", failure);
                resolve(promise, error(failure.getMessage()));
            }
        });
    }

    private static void applyPendingRestore(String token, Object promise) {
        final PendingRestore restore;

        synchronized (LOCK) {
            restore = pendingRestore;

            if (
                    restore == null
                            || token == null
                            || !restore.token.equals(token)
                            || System.currentTimeMillis()
                            - restore.createdAt
                            > RESTORE_CONFIRMATION_TTL_MS
            ) {
                pendingRestore = null;

                resolve(
                        promise,
                        error(
                                "The validated restore plan expired; select the backup again"
                        )
                );

                return;
            }

            pendingRestore = null;
        }

        final Activity activity =
                activityRef.get();

        if (activity == null) {
            resolve(
                    promise,
                    error("No active Discord window")
            );
            return;
        }

        IO.execute(() -> {
            try {
                /*
                 * BUNNY_STAGE_RESTORE_THEN_PROCESS_RESTART_V1
                 *
                 * Do not overwrite live pyoncord files while the old Bunny JS
                 * storage proxies still exist.
                 */
                backups.stageRestore(
                        restore.backup
                );

                appendEvent(
                        "backup-restore-staged",
                        eventDetails(
                                "entries",
                                restore.backup.entries.size()
                        )
                );

                resolve(
                        promise,
                        new JSONObject()
                                .put("status", "restarting")
                                .put(
                                        "message",
                                        "Restore staged; restarting Bunny"
                                )
                                .toString()
                );

                activity.runOnUiThread(
                        () -> {
                            if (
                                    !BunnyShortcutActivity
                                            .restartAtFreshBootstrap(
                                                    activity
                                            )
                            ) {
                                Log.e(
                                        TAG,
                                        "Could not perform controlled restart after staging Bunny restore"
                                );
                            }
                        }
                );
            } catch (Throwable failure) {
                Log.e(
                        TAG,
                        "Could not stage Bunny restore",
                        failure
                );

                resolve(
                        promise,
                        error(failure.getMessage())
                );
            }
        });
    }

    /*
     * BUNNY_LIVE_RESTORE_FOR_BUNDLE_RELOAD_V1
     *
     * A React Native bundle reload does not recreate Activity.onCreate(), so
     * the external pending/cold-start restore path cannot be used here.
     * Apply the already validated backup transactionally to the live files,
     * then let the Bunny UI request BundleUpdaterManager.reload().
     */
    private static void applyPendingRestoreForBundleReload(
            String token,
            Object promise
    ) {
        final PendingRestore restore;

        synchronized (LOCK) {
            restore = pendingRestore;

            if (
                    restore == null
                            || token == null
                            || !restore.token.equals(token)
                            || System.currentTimeMillis()
                                    - restore.createdAt
                                    > RESTORE_CONFIRMATION_TTL_MS
            ) {
                pendingRestore = null;

                resolve(
                        promise,
                        error(
                                "The validated restore plan expired; select the backup again"
                        )
                );

                return;
            }

            pendingRestore = null;
        }

        runAsync(
                promise,
                () -> {
                    BackupRestoreManager.discardPendingRestoreBeforeRecoveryInit(
                            context
                    );

                    backups.restore(
                            restore.backup
                    );

                    Log.i(
                            TAG,
                            "LIVE_RESTORE_APPLIED_FOR_BUNDLE_RELOAD"
                    );
                }
        );
    }

    private static void cancelPendingRestore(String token, Object promise) {
        synchronized (LOCK) {
            if (pendingRestore != null && pendingRestore.token.equals(token)) {
                pendingRestore = null;
            }
        }
        resolve(promise, cancelled());
    }

    /*
     * BUNNY_SEMANTIC_RESTORE_PREVIEW_COUNTS_V1
     *
     * Restore previews describe what will actually change on this device,
     * not how many files happen to exist inside the backup.
     *
     * For Bunny's primary MMKV stores, compare top-level keys so a single
     * changed Bunny setting reports as one setting change. Other changed
     * files count as one change each.
     */
    private static JSONObject restoreChangeCategories(
            BunnyBackup.Validated backup
    ) throws Exception {
        Set<String> selected =
                restoreSelectedCategories(
                        backup
                );

        BunnyBackup.Validated current =
                BunnyBackup.validateAndMigrate(
                        backups.createBytes(
                                "restore-preview",
                                selected
                        )
                );

        java.util.HashMap<String, BunnyBackup.Entry> wanted =
                new java.util.HashMap<>();

        java.util.HashMap<String, BunnyBackup.Entry> live =
                new java.util.HashMap<>();

        for (BunnyBackup.Entry entry : backup.entries) {
            wanted.put(
                    entry.path,
                    entry
            );
        }

        for (BunnyBackup.Entry entry : current.entries) {
            live.put(
                    entry.path,
                    entry
            );
        }

        java.util.LinkedHashSet<String> paths =
                new java.util.LinkedHashSet<>();

        paths.addAll(
                wanted.keySet()
        );

        paths.addAll(
                live.keySet()
        );

        java.util.ArrayList<String> orderedPaths =
                new java.util.ArrayList<>(
                        paths
                );

        java.util.Collections.sort(
                orderedPaths
        );

        JSONObject changes =
                new JSONObject();

        for (String path : orderedPaths) {
            BunnyBackup.Entry wantedEntry =
                    wanted.get(
                            path
                    );

            BunnyBackup.Entry liveEntry =
                    live.get(
                            path
                    );

            if (
                    wantedEntry != null
                            && liveEntry != null
                            && java.util.Arrays.equals(
                                    wantedEntry.data,
                                    liveEntry.data
                            )
            ) {
                continue;
            }

            String category =
                    restoreCategoryForPath(
                            path
                    );

            int delta =
                    semanticEntryDifferenceCount(
                            path,
                            wantedEntry,
                            liveEntry
                    );

            if (delta <= 0) {
                continue;
            }

            changes.put(
                    category,
                    changes.optInt(
                            category,
                            0
                    )
                            + delta
            );
        }

        return changes;
    }

    private static Set<String> restoreSelectedCategories(
            BunnyBackup.Validated backup
    ) throws Exception {
        java.util.LinkedHashSet<String> selected =
                new java.util.LinkedHashSet<>();

        JSONObject contents =
                backup.root.optJSONObject(
                        "contents"
                );

        JSONArray explicit =
                contents == null
                        ? null
                        : contents.optJSONArray(
                                "selectedCategories"
                        );

        if (explicit != null) {
            for (int i = 0; i < explicit.length(); i++) {
                String category =
                        explicit.optString(
                                i,
                                ""
                        )
                                .trim()
                                .toLowerCase(
                                        Locale.ROOT
                                );

                if (!category.isEmpty()) {
                    selected.add(
                            category
                    );
                }
            }
        }

        if (selected.isEmpty()) {
            for (BunnyBackup.Entry entry : backup.entries) {
                selected.add(
                        restoreCategoryForPath(
                                entry.path
                        )
                );
            }
        }

        if (selected.isEmpty()) {
            selected.addAll(
                    BunnyBackup.allCategories()
            );
        }

        return java.util.Collections.unmodifiableSet(
                selected
        );
    }

    private static int semanticEntryDifferenceCount(
            String path,
            BunnyBackup.Entry wanted,
            BunnyBackup.Entry live
    ) {
        if (
                isSemanticMmkvStore(
                        path
                )
        ) {
            try {
                JSONObject wantedObject =
                        wanted == null
                                ? new JSONObject()
                                : new JSONObject(
                                        new String(
                                                wanted.data,
                                                StandardCharsets.UTF_8
                                        )
                                );

                JSONObject liveObject =
                        live == null
                                ? new JSONObject()
                                : new JSONObject(
                                        new String(
                                                live.data,
                                                StandardCharsets.UTF_8
                                        )
                                );

                java.util.LinkedHashSet<String> keys =
                        new java.util.LinkedHashSet<>();

                Iterator<String> wantedKeys =
                        wantedObject.keys();

                while (wantedKeys.hasNext()) {
                    keys.add(
                            wantedKeys.next()
                    );
                }

                Iterator<String> liveKeys =
                        liveObject.keys();

                while (liveKeys.hasNext()) {
                    keys.add(
                            liveKeys.next()
                    );
                }

                int changed =
                        0;

                for (String key : keys) {
                    Object wantedValue =
                            wantedObject.has(
                                    key
                            )
                                    ? wantedObject.opt(
                                            key
                                    )
                                    : null;

                    Object liveValue =
                            liveObject.has(
                                    key
                            )
                                    ? liveObject.opt(
                                            key
                                    )
                                    : null;

                    if (
                            !jsonValuesEqual(
                                    wantedValue,
                                    liveValue
                            )
                    ) {
                        changed++;
                    }
                }

                return changed;
            } catch (Throwable ignored) {
                /*
                 * If a future MMKV format stops being a JSON object, fall
                 * back to treating the changed store as one changed item.
                 */
                return 1;
            }
        }

        return 1;
    }

    private static boolean isSemanticMmkvStore(
            String path
    ) {
        return "vd_mmkv/VENDETTA_SETTINGS".equals(path)
                || "vd_mmkv/VENDETTA_PLUGINS".equals(path)
                || "vd_mmkv/VENDETTA_THEMES".equals(path)
                || "vd_mmkv/BUNNY_FONTS".equals(path);
    }

    /*
     * BUNNY_ANDROID_JSON_DEEP_EQUALITY_V1
     *
     * Android's bundled org.json does not expose JSONObject.similar() or
     * JSONArray.similar(). Compare recursively using supported APIs only.
     */
    private static boolean jsonValuesEqual(
            Object left,
            Object right
    ) {
        if (left == right) {
            return true;
        }

        if (left == null || right == null) {
            return false;
        }

        if (
                left == JSONObject.NULL
                        || right == JSONObject.NULL
        ) {
            return left == JSONObject.NULL
                    && right == JSONObject.NULL;
        }

        if (
                left instanceof JSONObject
                        && right instanceof JSONObject
        ) {
            JSONObject leftObject =
                    (JSONObject) left;

            JSONObject rightObject =
                    (JSONObject) right;

            if (
                    leftObject.length()
                            != rightObject.length()
            ) {
                return false;
            }

            Iterator<String> keys =
                    leftObject.keys();

            while (keys.hasNext()) {
                String key =
                        keys.next();

                if (!rightObject.has(key)) {
                    return false;
                }

                if (
                        !jsonValuesEqual(
                                leftObject.opt(key),
                                rightObject.opt(key)
                        )
                ) {
                    return false;
                }
            }

            return true;
        }

        if (
                left instanceof JSONArray
                        && right instanceof JSONArray
        ) {
            JSONArray leftArray =
                    (JSONArray) left;

            JSONArray rightArray =
                    (JSONArray) right;

            if (
                    leftArray.length()
                            != rightArray.length()
            ) {
                return false;
            }

            for (
                    int index = 0;
                    index < leftArray.length();
                    index++
            ) {
                if (
                        !jsonValuesEqual(
                                leftArray.opt(index),
                                rightArray.opt(index)
                        )
                ) {
                    return false;
                }
            }

            return true;
        }

        if (
                left instanceof Number
                        && right instanceof Number
        ) {
            return String.valueOf(left)
                    .equals(
                            String.valueOf(right)
                    );
        }

        return left.equals(right);
    }

    private static String restoreCategoryForPath(
            String path
    ) {
        String upper =
                path.toUpperCase(
                        Locale.ROOT
                );

        if (
                path.startsWith(
                        "plugins/"
                )
                        || upper.contains(
                                "VENDETTA_PLUGIN"
                        )
        ) {
            return "plugins";
        }

        if (
                path.equals(
                        "fonts.json"
                )
                        || path.startsWith(
                                "downloads/fonts/"
                        )
                        || upper.contains(
                                "FONT"
                        )
        ) {
            return "fonts";
        }

        if (
                path.equals(
                        "current-theme.json"
                )
                        || path.equals(
                                "bunny-theme-creator-colors.json"
                        )
                        || path.startsWith(
                                "themes/"
                        )
                        || path.startsWith(
                                "downloads/backgrounds/"
                        )
                        || upper.contains(
                                "THEME"
                        )
        ) {
            return "themes";
        }

        return "settings";
    }

    /*
     * BUNNY_RESTORE_PREVIEW_STATIC_CATEGORIES_V2
     *
     * Keep one compact Validated Backup row. The four Bunny backup
     * categories are permanent, ordered, and always visible. Only their
     * semantic change counts vary.
     */
    private static String restoreSummary(
            JSONObject changes
    ) {
        int settings =
                changes == null
                        ? 0
                        : changes.optInt(
                                "settings",
                                0
                        );

        int plugins =
                changes == null
                        ? 0
                        : changes.optInt(
                                "plugins",
                                0
                        );

        int themes =
                changes == null
                        ? 0
                        : changes.optInt(
                                "themes",
                                0
                        );

        int fonts =
                changes == null
                        ? 0
                        : changes.optInt(
                                "fonts",
                                0
                        );

        return "Bunny Settings: "
                + settings
                + "\nPlugins: "
                + plugins
                + "\nThemes: "
                + themes
                + "\nFonts: "
                + fonts;
    }

    private static String categoryLabel(String key) {
        if ("settings".equals(key)) return "Bunny settings";
        if ("plugins".equals(key)) return "Plugins";
        if ("themes".equals(key)) return "Themes";
        if ("fonts".equals(key)) return "Fonts";
        return key;
    }

    private static void shareBytes(byte[] bytes, String name, String mimeType, String chooserTitle) throws Exception {
        Activity activity = activityRef.get();
        if (activity == null) throw new java.io.IOException("No active Discord window");
        File directory = new File(context.getCacheDir(), "share-media");
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new java.io.IOException("Could not create temporary share directory");
        }
        File[] old = directory.listFiles((dir, fileName) -> fileName.startsWith("bunny-transfer-")
                || fileName.startsWith("bunny-recovery-logs-")
                || fileName.startsWith("bunny-crashes-logs-")
                || fileName.startsWith("bunny-failed-starts-logs-"));
        if (old != null) {
            long cutoff = System.currentTimeMillis() - 24L * 60L * 60L * 1000L;
            for (File file : old) {
                if (file.lastModified() < cutoff && !file.delete()) {
                    Log.w(TAG, "Could not remove old temporary share file " + file.getName());
                }
            }
        }
        File shared = new File(directory, name);
        try (FileOutputStream output = new FileOutputStream(shared)) {
            output.write(bytes);
            output.getFD().sync();
        }
        Class<?> provider = Class.forName("androidx.core.content.FileProvider");
        Uri uri = (Uri) provider.getMethod(
                "getUriForFile",
                Context.class,
                String.class,
                File.class
        ).invoke(null, context, context.getPackageName() + ".file-provider", shared);
        Intent share = new Intent(Intent.ACTION_SEND)
                .setType(mimeType)
                .putExtra(Intent.EXTRA_STREAM, uri);
        share.setClipData(ClipData.newRawUri(name, uri));
        share.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        activity.runOnUiThread(
                () -> activity.startActivity(Intent.createChooser(share, chooserTitle))
        );
    }

    private static void disablePlugins(String onlyId) {
        try {
            mutateEnabled(
                    new File(new File(context.getFilesDir(), "pyoncord"), "plugins/settings.json"),
                    onlyId
            );
            mutateEnabled(
                    new File(new File(new File(context.getFilesDir(), "pyoncord"), "vd_mmkv"), "VENDETTA_PLUGINS"),
                    onlyId
            );
        } catch (Throwable error) {
            Log.e(TAG, "Could not disable plugin state", error);
        }
    }

    private static void mutateEnabled(File file, String onlyId) throws Exception {
        if (!file.isFile()) return;
        if (file.length() > 32L * 1024L * 1024L) {
            throw new java.io.IOException("Plugin state is unexpectedly large");
        }
        byte[] bytes = new byte[(int) file.length()];
        try (FileInputStream input = new FileInputStream(file)) {
            int offset = 0;
            while (offset < bytes.length) {
                int count = input.read(bytes, offset, bytes.length - offset);
                if (count < 0) break;
                offset += count;
            }
            if (offset != bytes.length) throw new java.io.IOException("Short read");
        }
        JSONObject root = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
        Iterator<String> keys = root.keys();
        boolean changed = false;
        while (keys.hasNext()) {
            String id = keys.next();
            JSONObject plugin = root.optJSONObject(id);
            if (plugin != null
                    && (onlyId == null
                    || id.equals(onlyId)
                    || id.replaceAll("/+$", "").equals(onlyId.replaceAll("/+$", "")))) {
                plugin.put("enabled", false);
                changed = true;
            }
        }
        if (changed) {
            File temp = new File(file.getParentFile(), file.getName() + ".recovery-tmp");
            try (FileOutputStream output = new FileOutputStream(temp)) {
                output.write(root.toString().getBytes(StandardCharsets.UTF_8));
                output.getFD().sync();
            }
            RecoveryStore.atomicReplace(temp, file);
        }
    }

    public static void requestTemporarySafeModeNextLaunch(Context candidate) {
        ensure(candidate);
        synchronized (LOCK) {
            /*
             * BUNNY_TEMP_SAFE_MODE_ONE_SHOT_V2
             *
             * Launcher Safe Mode is a one-shot request. It must never promote
             * crash history into persistent Safe Mode and must never mutate
             * Bunny's durable Safe Mode preference.
             */
            state.startupInProgress = false;
            state.startupHealthy = true;
            state.currentPlugin = null;
            state.initializingPlugins.clear();
            state.recoveryLatch = false;
            state.tryNormalOnce = false;
            state.temporarySafeModeNextLaunch = true;
            store.write(state);
        }
        Log.i(TAG, "TEMPORARY_SAFE_MODE_NEXT_LAUNCH_REQUESTED");
    }

    public static boolean isSessionInitialized() {
        synchronized (LOCK) {
            return sessionInitialized;
        }
    }

    private static void ensure(Context candidate) {
        synchronized (LOCK) {
            if (context != null) {
                installCrashHandlerLocked();
                return;
            }
            if (candidate == null) return;
            Context app = candidate.getApplicationContext();
            context = app != null ? app : candidate;
            store = new RecoveryStore(context);
            backups = new BackupRestoreManager(context, store);
            rollbacks = new PluginRollbackManager(new File(context.getFilesDir(), "pyoncord"), store);
            state = store.read();
            installCrashHandlerLocked();
        }
    }

    private static void installCrashHandlerLocked() {
        if (crashHandlerInstalled || store == null || state == null) return;
        Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, failure) -> {
            try {
                recordCrash(
                        "native",
                        cleanText(failure == null ? "Unknown native crash" : failure.toString(), 512),
                        cleanStack(failure),
                        thread == null ? null : thread.getName()
                );
            } catch (Throwable ignored) {}
            if (previous != null) previous.uncaughtException(thread, failure);
        });
        crashHandlerInstalled = true;
    }

    private static void recordCrash(String kind, String message, String stack, String threadName) {
        RecoveryState.CrashRecord crash;
        synchronized (LOCK) {
            if (state == null || store == null) return;
            String plugin = state.currentPlugin;
            crash = new RecoveryState.CrashRecord(
                    System.currentTimeMillis() + "-" + kind + "-" + (state.totalCrashes + 1),
                    System.currentTimeMillis(),
                    kind,
                    cleanText(message, 512),
                    cleanText(stack, 4096),
                    plugin,
                    state.startupInProgress && !state.startupHealthy
            );
            state.addCrash(crash);
            store.write(state);
        }
        JSONObject details = eventDetails(
                "kind", crash.kind,
                "message", crash.message,
                "plugin", crash.plugin == null ? JSONObject.NULL : crash.plugin,
                "duringStartup", crash.duringStartup,
                "thread", threadName == null ? JSONObject.NULL : cleanText(threadName, 128)
        );
        appendEvent("crash", details);
        Log.e(TAG, "RECENT_CRASH_RECORDED kind=" + crash.kind);
    }

    private static String cleanStack(Throwable failure) {
        if (failure == null) return "";
        StringBuilder output = new StringBuilder();
        output.append(failure).append('\n');
        StackTraceElement[] stack = failure.getStackTrace();
        for (int index = 0; index < stack.length && index < 24; index++) {
            output.append("at ").append(stack[index]).append('\n');
        }
        return cleanText(output.toString(), 4096);
    }

    private static String cleanText(String value, int limit) {
        String cleaned = value == null ? "" : value;
        cleaned = cleaned.replaceAll(
                "(?i)([?&](?:token|auth|authorization|session|password|cookie)=)[^&#\\s]*",
                "$1[redacted]"
        );
        cleaned = cleaned.replaceAll(
                "[A-Za-z0-9_-]{20,}\\.[A-Za-z0-9_-]{5,}\\.[A-Za-z0-9_-]{20,}",
                "[redacted-token]"
        );
        return cleaned.length() > limit ? cleaned.substring(0, limit) : cleaned;
    }

    private static JSONObject categoryDetails(Set<String> categories) {
        Set<String> selected = categories == null ? BunnyBackup.allCategories() : categories;
        return eventDetails("categories", new JSONArray(selected));
    }

    private static JSONObject eventDetails(Object... values) {
        JSONObject details = new JSONObject();
        try {
            for (int index = 0; index + 1 < values.length; index += 2) {
                details.put(String.valueOf(values[index]), values[index + 1]);
            }
        } catch (Throwable ignored) {}
        return details;
    }

    private static void appendEvent(String type, JSONObject details) {
        RecoveryStore currentStore = store;
        if (currentStore != null) currentStore.appendEvent(type, details);
    }

    private static String stableIdentity(String id) {
        String value = cleanText(id == null ? "unknown" : id.trim(), 512);
        return value.isEmpty() ? "unknown" : value;
    }

    private static boolean parseBoolean(String value) {
        return "true".equalsIgnoreCase(value) || "1".equals(value);
    }

    private static String normalizeHistoryKind(String value) {
        return "failed-starts".equals(value) ? "failed-starts" : "crashes";
    }

    private static String ok() {
        return "{\"status\":\"success\"}";
    }

    private static String cancelled() {
        return "{\"status\":\"cancelled\"}";
    }

    private static String error(String message) {
        try {
            return new JSONObject()
                    .put("status", "error")
                    .put("message", message == null ? "Recovery operation failed" : message)
                    .toString();
        } catch (Throwable ignored) {
            return "{\"status\":\"error\"}";
        }
    }

    private static void runAsync(Object promise, ThrowingRunnable action) {
        IO.execute(() -> {
            try {
                action.run();
                resolve(promise, ok());
            } catch (Throwable failure) {
                Log.e(TAG, "Recovery operation failed", failure);
                resolve(promise, error(failure.getMessage()));
            }
        });
    }

    private static void resolve(Object promise, String value) {
        if (promise == null) return;
        try {
            Method method = null;
            for (Method candidate : promise.getClass().getMethods()) {
                if (candidate.getName().equals("resolve")
                        && candidate.getParameterTypes().length == 1) {
                    method = candidate;
                    break;
                }
            }
            if (method == null) {
                for (Method candidate : promise.getClass().getDeclaredMethods()) {
                    if (candidate.getName().equals("resolve")
                            && candidate.getParameterTypes().length == 1) {
                        method = candidate;
                        break;
                    }
                }
            }
            if (method != null) {
                method.setAccessible(true);
                method.invoke(promise, value);
            }
        } catch (Throwable error) {
            Log.e(TAG, "Could not resolve Recovery promise", error);
        }
    }

    private interface ThrowingRunnable {
        void run() throws Exception;
    }

    private static final class PendingRestore {
        final String token;
        final BunnyBackup.Validated backup;
        final long createdAt;

        PendingRestore(String token, BunnyBackup.Validated backup, long createdAt) {
            this.token = token;
            this.backup = backup;
            this.createdAt = createdAt;
        }
    }
}
