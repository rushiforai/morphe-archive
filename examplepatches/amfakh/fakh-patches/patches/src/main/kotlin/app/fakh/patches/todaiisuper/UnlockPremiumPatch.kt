/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiisuper

import app.fakh.patches.shared.returnBoxedTrue
import app.fakh.patches.todaiisuper.shared.Constants.COMPATIBILITY_TODAII_SUPER
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch

/** ConfigPreferences.isPremiumForLanguage: suspend function the app awaits for the premium state of a language. */
private object PremiumForLanguageFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/data/local/ConfigPreferences;",
    name = "isPremiumForLanguage",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lol0;"),
)

/** ConfigPreferences.isPremiumFlow combines the user and the learning language through this lambda. */
private object PremiumFlowFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/data/local/ConfigPreferences\$isPremiumFlow\$1;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Premium unlock",
    description = "Unlocks the client-side Premium checks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII_SUPER)
    category("Premium")

    execute {
        PremiumForLanguageFingerprint.method.returnBoxedTrue()
        PremiumFlowFingerprint.method.returnBoxedTrue()
    }
}
