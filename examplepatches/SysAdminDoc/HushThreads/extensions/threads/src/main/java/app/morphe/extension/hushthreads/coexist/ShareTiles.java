/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.coexist;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;

/**
 * Opens a share sheet tile Threads' launcher refused.
 *
 * <p>Threads starts each app tile through a launcher that only reaches an app carrying Meta's own
 * signature. A Messenger or Facebook patched under the user's key gets nothing, and the launcher
 * answers false without a word, so the tap looks dead (#16). The system share sheet has no such
 * check, which is why More then Messenger always worked.
 *
 * <p>The launcher answers false only when it started nothing, the user picked this app by tapping
 * its tile, and every tile's intent already names its one app. An intent naming no app is left alone,
 * so nothing here can open an app the user didn't pick.
 */
@SuppressWarnings("unused")
public final class ShareTiles {
    private ShareTiles() {
    }

    /** Called with what Threads' launcher answered for a tile's intent. */
    public static void openRefused(boolean launched, @Nullable Context context, @Nullable Intent intent) {
        if (launched || context == null || intent == null) return;
        if (intent.getPackage() == null && intent.getComponent() == null) return;
        try {
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (RuntimeException failed) {
            // ActivityNotFoundException or SecurityException: the app is gone or closed to us, which
            // leaves the tile doing what it did before.
            Logger.printException(() -> "Couldn't open the share tile for " + intent.getPackage(), failed);
        }
    }
}
