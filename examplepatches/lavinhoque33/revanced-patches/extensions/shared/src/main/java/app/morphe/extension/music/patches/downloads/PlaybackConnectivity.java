/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.os.Build;

import java.util.function.BooleanSupplier;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** One process callback, with only pending request identities retained; no offline-session state. */
final class PlaybackConnectivity {
    private static final PendingPlaybackRequests PENDING = new PendingPlaybackRequests();
    private static ConnectivityManager.NetworkCallback callback;

    private PlaybackConnectivity() { }

    static void watch(Object request, PlayerFallbackFuture future, boolean next) {
        Object ownership = PlayerFallback.ownership(request);
        if (ownership == null || !future.pending()) return;
        future.watch(request, ownership, PENDING, next);
        if (register()) checkCurrentNetwork();
        else PENDING.remove(future);
    }

    static void watch(PendingPlaybackRequests.Entry entry) {
        if (entry.ownership() == null || !entry.pending()) return;
        PENDING.add(entry);
        if (register()) checkCurrentNetwork();
        else PENDING.remove(entry);
    }

    static void finished(PendingPlaybackRequests.Entry entry) {
        PENDING.remove(entry);
    }

    private static void checkCurrentNetwork() {
        if (!Utils.isInternetReachable()) disconnected(() -> !Utils.isInternetReachable());
    }

    private static void disconnected(BooleanSupplier offline) {
        Utils.runOnMainThreadNowOrLater(() -> {
            if (!OfflineReplay.enabled()) return;
            PENDING.disconnected(PlayerFallback::owns, request -> request instanceof PlayerFallback.Request replay
                    && OfflineReplay.holds(replay.rvxVideoId()), offline,
                    PlayerFallback::finishUncached);
        });
    }

    @SuppressLint("MissingPermission")
    private static synchronized boolean register() {
        if (callback != null) return true;
        Context context = Utils.getContext();
        if (context == null || Build.VERSION.SDK_INT < 23
                || !(context.getSystemService(Context.CONNECTIVITY_SERVICE) instanceof ConnectivityManager manager)) {
            return false;
        }
        ConnectivityManager.NetworkCallback listener = new ConnectivityManager.NetworkCallback() {
            @Override
            public void onLost(Network network) {
                // The lost network can still be returned briefly by the synchronous binder query.
                if (!otherValidatedNetwork(manager, network)) {
                    disconnected(() -> !otherValidatedNetwork(manager, network));
                }
            }

            @Override
            public void onCapabilitiesChanged(Network network, NetworkCapabilities capabilities) {
                if (validated(capabilities)) {
                    PlayerFallback.reconnected();
                } else if (!otherValidatedNetwork(manager, network)) {
                    disconnected(() -> !Utils.isInternetReachable());
                }
            }
        };
        try {
            if (Build.VERSION.SDK_INT >= 24) manager.registerDefaultNetworkCallback(listener);
            else manager.registerNetworkCallback(new NetworkRequest.Builder()
                    .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET).build(), listener);
            callback = listener;
            return true;
        } catch (Exception failure) {
            Logger.printException(() -> "PlayerFallback: connectivity callback could not be registered", failure);
            return false;
        }
    }

    @SuppressLint("MissingPermission")
    private static boolean otherValidatedNetwork(ConnectivityManager manager, Network changed) {
        try {
            Network active = manager.getActiveNetwork();
            return active != null && !active.equals(changed) && validated(manager.getNetworkCapabilities(active));
        } catch (Exception unknown) {
            // Unknown state preserves stock handling rather than treating a handover as an outage.
            return true;
        }
    }

    private static boolean validated(NetworkCapabilities capabilities) {
        return capabilities != null && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
    }
}
