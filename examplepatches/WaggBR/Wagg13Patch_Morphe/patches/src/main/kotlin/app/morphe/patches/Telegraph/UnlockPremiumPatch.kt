/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * graphmessenger/misc/premium/UnlockPremiumPatch.kt):
 * https://github.com/hxreborn/morphe-patches
 *
 * Premium LOCAL: afeta só o cliente (isPremium() do Telegram + o sistema de
 * licença próprio do Graph). Recursos que dependem dos servidores do Telegram
 * continuam exigindo uma conta Premium de verdade.
 *
 * Importante: anúncios dentro do app não dependem só do isPremium() do
 * Telegram — o Graph tem um sistema de licença PRÓPRIO (ver
 * app.morphe.patches.telegraph.shared.NativeLicense) que também precisa ser
 * zerado, senão o app continua se achando "expirado" e os anúncios continuam
 * aparecendo mesmo com o isPremium forçado.
 */
package app.morphe.patches.telegraph.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.telegraph.TelegraphCompatibility
import app.morphe.patches.telegraph.shared.LICENSE_DAYS_LEFT_METHOD
import app.morphe.patches.telegraph.shared.LICENSE_EXPIRED_METHOD
import app.morphe.patches.telegraph.shared.overrideNativeLicenseCallResults
import app.morphe.patches.telegraph.signature.spoofSignaturePatch

private const val LICENSE_DAYS_LEFT = 999

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Telegraph Premium",
    description = "Makes Telegraph treat the current account as Premium and disables the app's own " +
        "license/trial system (which also controls ad display). Client-side only; features that " +
        "depend on the Telegram server still require a real Premium account.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)
    dependsOn(spoofSignaturePatch)

    execute {
        UserIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        LicenseDaysLeftFingerprint.matchAll().forEach {
            it.method.overrideNativeLicenseCallResults(LICENSE_DAYS_LEFT_METHOD, LICENSE_DAYS_LEFT)
        }
        LicenseExpiredFingerprint.matchAll().forEach {
            it.method.overrideNativeLicenseCallResults(LICENSE_EXPIRED_METHOD, 0)
        }
    }
}
