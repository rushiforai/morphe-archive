// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.update

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The stored answer to "does this build have to be updated before use?".
 *
 * The value is a preference written from the server's configuration and from the
 * sign-in response. It is read in two places: the main screen, where it decides
 * whether to show the blocking update dialog, and the sign-in bookkeeping, where
 * it influences the session timestamp. The preference itself is left as the
 * server set it; only the answer is changed.
 */
private object ForcedUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "shouldForceUpdate",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("forceUpdate"),
)

/**
 * Keeps a patched build usable after the server starts requiring an update.
 *
 * The application targets one stock version. When the store publishes a newer
 * one, the server can mark the installed build as outdated and the client shows a
 * blocking dialog whose only action is to open the store. For a patched build
 * that dialog is a dead end: installing the store update replaces the patched
 * application.
 *
 * Answering the stored question false takes the same path the client takes when
 * the server does not require an update, so the main screen proceeds normally.
 * The server's configuration is still stored and the store entry points are
 * untouched; the patch only stops the client from refusing to continue.
 *
 * This is a trade-off, not a free improvement: the patched build stays on the
 * version it was built for and does not receive the fixes published afterwards.
 * Features the server decides to refuse for an outdated client are still refused.
 */
@Suppress("unused")
val ignoreForcedUpdatePatch = bytecodePatch(
    name = "Ignore the forced update requirement",
    description = "Stops the client from showing the blocking update dialog when the server marks this build as outdated.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.STORE.label)

    execute {
        ForcedUpdateFingerprint.method.returnEarly(false)
    }
}
