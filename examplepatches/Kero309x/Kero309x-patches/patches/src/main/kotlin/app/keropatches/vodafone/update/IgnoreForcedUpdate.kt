// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.update

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnBoxedBooleanEarly
import app.morphe.patcher.util.returnEarly

/**
 * The per-app answer to "must the user update before continuing?".
 *
 * It is a suspend function, so its declared return type is `Object` and the
 * answer is a boxed `Boolean`. It shows the blocking update dialog when the
 * server marks the installed version as forced, and answers `false` otherwise.
 * The caller uses that answer to decide between blocking and proceeding.
 */
private object AppForceUpdateFingerprint : Fingerprint(
    definingClass = "Lvodafone/vis/engezly/main/prenavigation/UpdateChecker;",
    name = "AnimatedBarChartKtAnimatedBarChart1111",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lvodafone/vis/engezly/config/domain/utils/UpdateType;",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/**
 * The per-feature answer to the same question.
 *
 * A module can carry its own update type. When that type is forced, this method
 * opens the store and answers `true`, which makes the caller treat the feature
 * as blocked. For every other type it answers `false` and the caller continues.
 */
private object ModuleForceUpdateFingerprint : Fingerprint(
    definingClass = "Lvodafone/vis/engezly/main/prenavigation/UpdateChecker;",
    name = "AnimatedBarChartKtAnimatedBarChart1",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(
        "Lvodafone/vis/engezly/config/domain/utils/UpdateType;",
        "Ljava/lang/String;",
    ),
)

/**
 * Keeps a patched build usable after the server starts requiring an update.
 *
 * The application targets one stock version. When the store publishes a newer
 * one, the server can mark the installed build as outdated and the client shows
 * a blocking dialog or opens the store. For a patched build both are dead ends:
 * installing the store update replaces the patched application.
 *
 * Both answers are forced to "not required", which is the path the client takes
 * when the server does not ask for an update. The update type computed from the
 * server configuration is left as it is, so the voluntary soft-update prompt,
 * the stored configuration and the store entry points are untouched. The patch
 * only stops the client from refusing to continue.
 *
 * This is a trade-off, not a free improvement: the patched build stays on the
 * version it was built for and does not receive the fixes published afterwards.
 * Features the server decides to refuse for an outdated client are still
 * refused.
 */
@Suppress("unused")
val disableForcedUpdatePatch = bytecodePatch(
    name = "Disable the forced update requirement",
    description = "Stops the client from blocking the app, or opening the store, when the server marks this build as outdated.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.STORE.label)

    execute {
        AppForceUpdateFingerprint.method.returnBoxedBooleanEarly(false)
        ModuleForceUpdateFingerprint.method.returnEarly(false)
    }
}
