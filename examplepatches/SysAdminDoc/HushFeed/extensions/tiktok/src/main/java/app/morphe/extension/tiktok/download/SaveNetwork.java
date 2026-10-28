/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Save only on Wi-Fi: whether a save may fetch from the network right now. It reads what the
 * phone says the active network is, unmetered or not, never a Wi-Fi name, and an answer it
 * can't get (no network, no permission, no service) counts as metered. Playback's metered check
 * reads a failure as unmetered, which suits a quality cap and not a promise to stay off data.
 *
 * <p>A callback keeps the answer fresh, so the check on every read of a transfer costs nothing,
 * and when the network turns unmetered the saves that waited for it start.
 */
final class SaveNetwork {
    /** For the tests: the network's answer in place of the phone's. Null asks the phone. */
    static volatile Boolean unmeteredForTests;

    /** The phone's last answer, kept fresh by {@link #CALLBACK}; null before the first one. */
    private static volatile Boolean unmetered;
    private static volatile boolean listening;

    private static final ConnectivityManager.NetworkCallback CALLBACK = new ConnectivityManager.NetworkCallback() {
        @Override public void onAvailable(Network network) {
            refresh();
        }

        @Override public void onLost(Network network) {
            refresh();
        }

        @Override public void onCapabilitiesChanged(Network network, NetworkCapabilities capabilities) {
            refresh();
        }
    };

    private SaveNetwork() {}

    /** Save only on Wi-Fi is on. */
    static boolean strict() {
        // The settings are read from the app's preferences, which need its context to open.
        return Utils.getContext() != null && Settings.DOWNLOAD_UNMETERED_ONLY.get();
    }

    /** A save may fetch now: the setting is off, or the active network is unmetered. */
    static boolean allowed() {
        return !strict() || unmetered();
    }

    /** The active network is unmetered, as the phone last said. Asks it once if nothing has yet. */
    static boolean unmetered() {
        Boolean forTests = unmeteredForTests;
        if (forTests != null) return forTests;
        listen();
        Boolean known = unmetered;
        return known != null ? known : refresh();
    }

    /**
     * As {@link #unmetered}, asking the phone now rather than trusting the last callback, for a
     * connection about to open: one that went down a moment ago may not have said so yet.
     */
    static boolean unmeteredNow() {
        Boolean forTests = unmeteredForTests;
        if (forTests != null) return forTests;
        listen();
        return refresh();
    }

    /** Asks the phone again, keeps the answer, and lets the waiting saves go when it allows them. */
    static boolean refresh() {
        Boolean forTests = unmeteredForTests;
        boolean now = forTests != null ? forTests : askPhone();
        Boolean before = unmetered;
        unmetered = now;
        if (now && !Boolean.TRUE.equals(before)) MediaJobScheduler.releaseParked();
        return now;
    }

    /** Save only on Wi-Fi was switched: a save that waited for it may go now that it's off. */
    static void changed() {
        if (allowed()) MediaJobScheduler.releaseParked();
    }

    private static boolean askPhone() {
        try {
            Context context = Utils.getContext();
            ConnectivityManager manager = context == null ? null
                    : (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return false;
            Network active = manager.getActiveNetwork();
            NetworkCapabilities capabilities = active == null ? null : manager.getNetworkCapabilities(active);
            return capabilities != null
                    && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
        } catch (RuntimeException unreadable) {
            // No permission or no service: no answer, which is not an unmetered network.
            Logger.printInfo(() -> "Save network check failed: " + unreadable.getClass().getSimpleName());
            return false;
        }
    }

    /** Starts following the network the first time a save asks, and only once. */
    private static synchronized void listen() {
        if (listening) return;
        try {
            Context context = Utils.getContext();
            ConnectivityManager manager = context == null ? null
                    : (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return;
            // Every network with internet, not only the default one (that callback is API 24
            // and up, and TikTok runs from 23): each change asks again which one is active.
            NetworkRequest request = new NetworkRequest.Builder()
                    .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    .build();
            manager.registerNetworkCallback(request, CALLBACK);
            listening = true;
        } catch (RuntimeException refused) {
            // Each check still asks the phone directly when there's no callback.
            Logger.printInfo(() -> "Save network callback refused: " + refused.getClass().getSimpleName());
        }
    }

    static void resetForTests() {
        unmeteredForTests = null;
        unmetered = null;
    }
}
