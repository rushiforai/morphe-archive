package app.template.extension.stayfree;

import android.content.Context;
import android.util.Log;

/**
 * Entry points for the StayFree "Local device sync" patch.
 * <p>
 * StayFree's cross-device sync normally goes through {@code api.stayfreeapps.com}, which only
 * knows a device's usage because the SensorTower usage SDK uploaded it. This replaces that server
 * with {@link LocalSyncServer}, running inside the patched app on the phone:
 * <ul>
 *   <li>every Retrofit service whose base URL is {@code https://api.stayfreeapps.com/} is pointed
 *   at {@code http://127.0.0.1:8787/}, where the server answers the sync API itself, proxies a
 *   short allowlist of read-only lookups (app categories/icons, averages) and drops everything
 *   else (all data-collection uploads);</li>
 *   <li>the StayFree browser extension, patched to talk to the phone's LAN address, pairs and
 *   uploads its website sessions to the same server;</li>
 *   <li>the phone's own app sessions are never uploaded anywhere: they are read on demand from
 *   {@code UsageStatsManager} when a paired browser asks for them.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class LocalSync {
    static final String TAG = "StayFreeLocalSync";

    public static final int PORT = 8787;

    static final String UPSTREAM_ORIGIN = "https://api.stayfreeapps.com";
    private static final String UPSTREAM_PREFIX = UPSTREAM_ORIGIN + "/";
    private static final String LOCAL_PREFIX = "http://127.0.0.1:" + PORT + "/";

    private static LocalSyncServer server;
    private static SyncDebugLog debugLog;

    private LocalSync() {
    }

    /**
     * Called at the start of {@code Application.onCreate()}.
     */
    public static synchronized void start(Context context) {
        if (server != null) return;
        try {
            debugLog = new SyncDebugLog(context.getApplicationContext());
        } catch (Throwable ignored) {
        }
        try {
            LocalSyncServer created = new LocalSyncServer(context.getApplicationContext(), PORT);
            created.start();
            server = created;
            Log.i(TAG, "Local sync server listening on port " + PORT);
        } catch (Throwable t) {
            Log.e(TAG, "Could not start local sync server", t);
        }
    }

    static synchronized boolean isRunning() {
        return server != null;
    }

    /**
     * Called at the start of {@code Retrofit.Builder.baseUrl(String)}. Rewrites unconditionally,
     * even if the server failed to start: a failed lookup is preferable to sending pairing keys
     * and usage to the vendor server behind the user's back.
     */
    public static String rewriteBaseUrl(String url) {
        String result = url;
        if (url != null && url.startsWith(UPSTREAM_PREFIX)) {
            result = LOCAL_PREFIX + url.substring(UPSTREAM_PREFIX.length());
        }
        SyncDebugLog log = debugLog;
        if (log != null) log.baseUrl(url, result);
        return result;
    }

    /**
     * Diagnostic probe for the QR pairing path. Records a named checkpoint and the two values
     * that decide whether StayFree issues the pairing call at all.
     * <p>
     * The pairing chain on 20.16.1 is: {@code MainActivity.onCreate} stashes the code in a static
     * field, a composable later reads it behind a guard equivalent to
     * {@code if (stashedCode != null && sheetIsQrPairing)}, and only then launches the suspend
     * function that builds the Retrofit client. On this device nothing downstream ever runs, and
     * the two conditions fail for completely different reasons — a lost stash versus a sheet that
     * composed with the wrong type — so the log has to tell them apart.
     *
     * Takes no checkpoint name on purpose: the lambda it is injected into is register-tight, the
     * patcher cannot widen a method's frame, and loading a tag string would mean clobbering one
     * of the two live registers the guards are about to test. The checkpoint is implied by the
     * method instead.
     *
     * @param code the stashed pairing code, or null if the stash was lost
     * @param flag the captured "this is the QR pairing sheet" boolean
     */
    public static void probePairingGuard(String code, boolean flag) {
        SyncDebugLog log = debugLog;
        if (log != null) log.probe("pairing.guard", code, flag);
    }

    /**
     * The device-group status the pairing coroutine reads on its very first instruction.
     * <p>
     * {@code u83.invokeSuspend} opens with
     * {@code if (statusFlow.value == NETWORK_CONNECTION_LOST) return} — a plain field read with no
     * suspension, which is why the failure is instant and leaves no trace: the coroutine launches,
     * returns before building any Retrofit client, and never touches the status again, so whatever
     * error the UI is already showing simply stays on screen.
     * <p>
     * Both guards before this point are known to pass, and the log shows no request afterwards, so
     * this read is the last unobserved branch between them. Recording the value distinguishes a
     * stale {@code NETWORK_CONNECTION_LOST} left over from an earlier failed attempt from the
     * coroutine getting past here and dying further down.
     *
     * @param status the current {@code DeviceGroupStatusType}, or null before the first check runs
     */
    public static void probePairingStatus(Object status) {
        SyncDebugLog log = debugLog;
        if (log != null) log.checkpoint("pairing.status", status);
    }
}
