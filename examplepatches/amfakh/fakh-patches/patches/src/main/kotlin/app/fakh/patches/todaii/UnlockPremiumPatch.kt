/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaii

import app.fakh.patches.todaii.shared.Constants.COMPATIBILITY_TODAII
import app.fakh.patches.shared.returnTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch

/** PrefHelper.isUserPremiumStandard: false when signed out, so the SignInResult getter alone is not enough. */
private object PrefStandardPremiumFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/util/iap/b;",
    name = "m2",
    returnType = "Z",
    parameters = listOf(),
)

/** PrefHelper.isUserPremiumAi. */
private object PrefAiPremiumFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/util/iap/b;",
    name = "i2",
    returnType = "Z",
    parameters = listOf(),
)

/** SignInResult.Result.isUserPremiumStandard: also read directly by MainActivity. */
private object ResultStandardPremiumFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/model/userprofile/SignInResult\$Result;",
    name = "isUserPremiumStandard",
    returnType = "Z",
    parameters = listOf(),
)

/** SignInResult.Result.isUserPremiumAi. */
private object ResultAiPremiumFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/model/userprofile/SignInResult\$Result;",
    name = "isUserPremiumAi",
    returnType = "Z",
    parameters = listOf(),
)

/**
 * MainActivity.checkAccount: called on every bottom tab switch; if PrefHelper.isUserPremiumStandard is true while
 * signed out (SignInResult$Result is null), it throws "This is a crash" and calls finishAffinity().
 */
private object MainActivityCheckAccountFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/activity/MainActivity;",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("This is a crash"),
)

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Premium unlock",
    description = "Unlocks the client-side Premium and Premium AI checks and removes ads, the Premium upsell sheet and the marketing popup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII)
    category("Premium")
    dependsOn(hideAdsPatch)

    execute {
        listOf(
            PrefStandardPremiumFingerprint,
            PrefAiPremiumFingerprint,
            ResultStandardPremiumFingerprint,
            ResultAiPremiumFingerprint,
        ).forEach { it.method.returnTrue() }
        MainActivityCheckAccountFingerprint.method.addInstruction(0, "return-void")
    }
}
