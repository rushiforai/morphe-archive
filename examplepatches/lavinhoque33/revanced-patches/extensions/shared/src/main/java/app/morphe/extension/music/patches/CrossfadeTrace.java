/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.extension.music.patches;

import android.os.Process;
import android.os.SystemClock;

import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.utils.Logger;

/** Control-thread diagnostics only. Callers guard captured lambdas with {@link #isEnabled()}. */
public final class CrossfadeTrace {
    private static final Map<Object, Player> players = new WeakHashMap<>();
    private static long sequence;
    private static long generation;
    private static volatile boolean observedTransition;

    private static final class Player {
        final long generation;
        String role = "NATIVE";
        int state = -1;
        Boolean playWhenReady;

        Player(long generation) {
            this.generation = generation;
        }
    }

    private CrossfadeTrace() {}

    public static boolean isEnabled() {
        return BaseSettings.DEBUG.get();
    }

    /** Shared source paths remain silent in YouTube and before a Music transition is observed. */
    public static boolean isTransitionObserved() {
        return observedTransition && isEnabled();
    }

    public static String id(Object object) {
        return object == null ? "none" : "@" + Integer.toHexString(System.identityHashCode(object));
    }

    public static synchronized void begin(Object outgoing, Object coordinator) {
        if (!isEnabled()) return;
        observedTransition = true;
        generation++;
        event("FACTORY_BEGIN", outgoing, () -> "coordinator=" + id(coordinator));
    }

    public static synchronized void role(Object player, String role) {
        if (!isEnabled() || player == null) return;
        Player record = players.get(player);
        if (record == null) {
            record = new Player(generation);
            players.put(player, record);
        }
        String oldRole = record.role;
        record.role = role;
        event("ROLE", player, () -> "old=" + oldRole + " new=" + role);
    }

    public static synchronized void state(CrossfadeManager.ExoPlayerAccess player) {
        if (!isEnabled() || player == null) return;
        try {
            Player record = players.get(player);
            if (record == null) {
                record = new Player(generation);
                players.put(player, record);
            }
            int state = player.patch_getPlaybackState();
            boolean ready = player.patch_getPlayWhenReady();
            if (record.state != state || record.playWhenReady == null || record.playWhenReady != ready) {
                record.state = state;
                record.playWhenReady = ready;
                event("STATE", player, () -> "state=" + state + " playWhenReady=" + ready);
            }
        } catch (Exception ignored) {
            // Tracing must not change the caller's recovery path.
        }
    }

    public static synchronized void event(String event, Object player, Logger.LogMessage fields) {
        if (!isEnabled()) return;
        Player record = players.get(player);
        long playerGeneration = record == null ? generation : record.generation;
        String role = record == null ? "NATIVE" : record.role;
        long number = ++sequence;
        long elapsedMs = SystemClock.elapsedRealtime();
        long uptimeNs = System.nanoTime();
        int tid = Process.myTid();
        Logger.printDebug(() -> "CF45 " + event + " ms=" + elapsedMs + " uptimeNs=" + uptimeNs
                + " seq=" + number + " gen=" + generation + " playerGen=" + playerGeneration
                + " pid=" + Process.myPid() + " tid=" + tid
                + " player=" + id(player) + " role=" + role + " " + fields.buildMessageString());
    }
}
