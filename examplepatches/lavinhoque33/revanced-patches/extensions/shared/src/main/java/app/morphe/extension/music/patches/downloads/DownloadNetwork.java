/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-19.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.function.BooleanSupplier;

import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Waits off the main thread, and pins each automatic attempt to the eligible Wi-Fi it started on. */
final class DownloadNetwork {
    private static final Object CHANGED = new Object();
    private static final long LOSS_DETECTION_TIMEOUT = 2_000;
    private static volatile long defaultChanges;
    private static volatile long wifiChanges;
    private static Network lastInternet;
    private static Network lastWifi;
    private static boolean callbackReported;

    private final boolean wifiOnly;
    private final BooleanSupplier stopped;
    private final DownloadKeepAlive.Hold hold;
    private final DownloadRetryPlan.OutageBudget budget = new DownloadRetryPlan.OutageBudget();
    private boolean expired;
    private boolean failedDuringOutage;

    DownloadNetwork(boolean wifiOnly, BooleanSupplier stopped, DownloadKeepAlive.Hold hold) {
        this.wifiOnly = wifiOnly;
        this.stopped = stopped;
        this.hold = hold;
    }

    static boolean eligible(@Nullable NetworkCapabilities caps) {
        return caps != null && PlaylistSyncPlan.wifiEligible(caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI),
                caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET),
                caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED),
                caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED));
    }

    @Nullable
    @SuppressLint("MissingPermission")
    static Network eligibleWifi() {
        try {
            ConnectivityManager manager = Utils.getContext().getSystemService(ConnectivityManager.class);
            if (manager == null) return null;

            Network network = manager.getActiveNetwork();
            return network != null && eligible(manager.getNetworkCapabilities(network)) ? network : null;
        } catch (RuntimeException failure) {
            return null;
        }
    }

    static void changed(@Nullable Network internet, @Nullable Network wifi) {
        synchronized (CHANGED) {
            if (lastInternet != null && !Objects.equals(lastInternet, internet)) defaultChanges++;
            if (lastWifi != null && !Objects.equals(lastWifi, wifi)) wifiChanges++;
            lastInternet = internet;
            lastWifi = wifi;
            callbackReported = true;
            CHANGED.notifyAll();
        }
    }

    static void wakeWaiters() {
        synchronized (CHANGED) {
            CHANGED.notifyAll();
        }
    }

    boolean stopped() {
        return expired || stopped.getAsBoolean() || Thread.currentThread().isInterrupted();
    }

    boolean connectionInterrupted() {
        return expired || failedDuringOutage || !connectionUsable();
    }

    private boolean connectionUsable() {
        return wifiOnly ? eligibleWifi() != null : Utils.isInternetReachable();
    }

    boolean attemptUsable() {
        if (stopped()) return false;

        return Requester.scopedConnection() instanceof Route route ? !route.lost() : connectionUsable();
    }

    boolean awaitTransferConnection() throws InterruptedException {
        try {
            awaitConnection(false);
            return true;
        } catch (IOException cancelled) {
            return false;
        }
    }

    /** Null is the normal unpinned path for a manual transfer, including any existing proxy. */
    @Nullable
    private Network awaitConnection(boolean retry) throws IOException, InterruptedException {
        long waitingSince = -1;
        try {
            synchronized (CHANGED) {
                long settle = DownloadRetryPlan.settleBeforeAttempt(retry, stopped());
                if (settle < 0) throw new IOException("Download stopped before checking connection");

                if (settle > 0) {
                    waitingSince = SystemClock.elapsedRealtime();
                    showConnectionWait();
                }

                while (!stopped()) {
                    long now = SystemClock.elapsedRealtime();
                    long elapsed = waitingSince < 0 ? 0 : now - waitingSince;
                    long remaining = budget.remaining() - elapsed;
                    if (waitingSince >= 0 && remaining <= 0) {
                        expired = true;
                        Logger.printInfo(() -> "DownloadNetwork: connection wait expired");
                        break;
                    }
                    if (elapsed >= settle && callbackAllowsConnection()) {
                        Network wifi = wifiOnly ? eligibleWifi() : null;
                        if (wifiOnly ? wifi != null : Utils.isInternetReachable()) return wifi;
                    }
                    if (remaining <= 0) {
                        expired = true;
                        break;
                    }
                    if (waitingSince < 0) {
                        waitingSince = now;
                        showConnectionWait();
                    }
                    // Also check the live network on platforms where the default callback is unavailable.
                    long nextCheck = elapsed < settle ? settle - elapsed : 1_000;
                    CHANGED.wait(Math.min(nextCheck, remaining));
                }
            }
            throw new IOException("Download stopped while waiting for connection");
        } finally {
            if (waitingSince >= 0) {
                budget.waited(SystemClock.elapsedRealtime() - waitingSince);
                hold.waiting(null);
                if (!stopped()) Logger.printInfo(() -> "DownloadNetwork: connection restored");
            }
        }
    }

    // Read under CHANGED. A known loss overrides a stale live query, but an absent callback never blocks.
    private boolean callbackAllowsConnection() {
        return !callbackReported || (wifiOnly ? lastWifi : lastInternet) != null;
    }

    private void showConnectionWait() {
        hold.waiting(str("morphe_music_downloads_waiting_for_connection"));
        Logger.printInfo(() -> "DownloadNetwork: waiting for " + (wifiOnly ? "unmetered Wi-Fi" : "internet"));
    }

    <T> T transfer(Callable<T> work) throws Exception {
        for (boolean retried = false; ; retried = true) {
            Network wifi = awaitConnection(retried);
            long before = wifiOnly ? wifiChanges : defaultChanges;
            Route route = wifi == null ? null : new Route(wifi, before);
            try {
                return Requester.withConnection(route, work);
            } catch (InterruptedException failure) {
                throw failure;
            } catch (Exception failure) {
                boolean lost = connectionLost(route, before);
                if (!lost && !stopped()
                        && DownloadRetryPlan.isTransportFailure(failure, Thread.currentThread().isInterrupted())) {
                    lost = awaitConnectionLoss(route, before);
                }
                if (stopped() || !DownloadRetryPlan.retryAfterFailure(lost, retried)) {
                    failedDuringOutage |= lost;
                    throw failure;
                }

                Logger.printInfo(() -> "DownloadNetwork: retrying one operation after connection loss");
            }
        }
    }

    private boolean connectionLost(@Nullable Route route, long before) {
        synchronized (CHANGED) {
            return !callbackAllowsConnection() || (route != null ? route.lost()
                    : before != defaultChanges || !Utils.isInternetReachable());
        }
    }

    private boolean awaitConnectionLoss(@Nullable Route route, long before) throws InterruptedException {
        long started = SystemClock.elapsedRealtime();
        long deadline = started + Math.min(LOSS_DETECTION_TIMEOUT, budget.remaining());
        synchronized (CHANGED) {
            while (!stopped()) {
                if (connectionLost(route, before)) {
                    // Only a confirmed outage spends the budget, including the time taken to detect it.
                    budget.waited(SystemClock.elapsedRealtime() - started);
                    return true;
                }
                long remaining = deadline - SystemClock.elapsedRealtime();
                if (remaining <= 0) return false;

                CHANGED.wait(Math.min(1_000, remaining));
            }
        }
        return false;
    }

    private final class Route implements Requester.ConnectionProvider {
        private final Network network;
        private final long generation;

        Route(Network network, long generation) {
            this.network = network;
            this.generation = generation;
        }

        boolean lost() {
            return generation != wifiChanges || !network.equals(eligibleWifi());
        }

        @Override public boolean cancelled() {
            return stopped.getAsBoolean() || generation != wifiChanges;
        }

        @Override public HttpURLConnection openConnection(URL url) throws IOException {
            if (cancelled() || lost()) throw new IOException("Transfer Wi-Fi is no longer eligible");
            return (HttpURLConnection) network.openConnection(url);
        }
    }
}
