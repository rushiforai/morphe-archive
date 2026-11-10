package app.fbpatches.extension.facebook.ads;

import android.util.Log;

/**
 * Stand-ins for Hushfacebook's diagnostics (HookStatus, FeedFilterCounters, Logger), so code ported
 * from it keeps its call sites. Counters do nothing; failures go to logcat under "FbPatches".
 */
final class Diag {
    static final String TAG = "FbPatches";
    static final String FEED_AND_NAVIGATION = "feed";
    static final String SPONSORED_MARKETPLACE = "Hide sponsored Marketplace listings";

    interface Msg {
        String get();
    }

    private Diag() {
    }

    static void invoked(Object family) {
    }

    static void bound(Object family, Object what) {
    }

    static void counted(Object family, Object what) {
    }

    static void missingMember(Object... what) {
    }

    static void sawList(Object route, int count) {
    }

    static void sawKind(Object route, Object kind) {
    }

    static void removed(Object route, int count, Object reason) {
    }

    static void threw(Object family, Object what, Throwable failure) {
        Log.w(TAG, family + ": " + what + " failed", failure);
    }

    static void printDebug(Msg message) {
    }

    static void diagnosticDebug(Object category, Object source, Msg message) {
    }
}
