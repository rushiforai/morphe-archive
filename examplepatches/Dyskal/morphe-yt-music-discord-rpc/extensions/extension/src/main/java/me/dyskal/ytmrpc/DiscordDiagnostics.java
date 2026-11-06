package me.dyskal.ytmrpc;

import android.util.Log;

final class DiscordDiagnostics {
    private static volatile boolean androidLogging;
    private DiscordDiagnostics() { }
    static void enableAndroidLogging() { androidLogging = true; }
    static void info(String message) {
        if (androidLogging) Log.i("DyskalDiscordRPC", message);
        else System.err.println("DyskalDiscordRPC: " + message);
    }
    static void failure(String operation, Throwable error) {
        // Do not log exception objects, URLs, frames, server bodies, codes, or token contents.
        String message = operation + ": " + DiscordFailure.describe(error);
        if (androidLogging) Log.w("DyskalDiscordRPC", message);
        else System.err.println("DyskalDiscordRPC: " + message);
    }
}
