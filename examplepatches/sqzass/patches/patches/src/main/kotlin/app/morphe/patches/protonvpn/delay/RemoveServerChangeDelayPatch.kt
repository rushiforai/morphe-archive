/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.delay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.protonvpn.shared.PROTON_VPN
import app.morphe.patches.protonvpn.shared.PROTON_VPN_FOSS

private const val APP_CONFIG_RESPONSE = "Lcom/protonvpn/android/appconfig/AppConfigResponse;"

private val delayGetters = listOf(
    "getChangeServerLongDelayInSeconds",
    "getChangeServerShortDelayInSeconds",
)

@Suppress("unused")
val removeServerChangeDelayPatch = bytecodePatch(
    name = "Remove Server Change Delay",
    description = "Removes the cooldown timer when switching between free servers.",
) {
    compatibleWith(PROTON_VPN, PROTON_VPN_FOSS)

    execute {
        var patched = 0

        delayGetters.forEach { getterName ->
            val fp = Fingerprint(
                definingClass = APP_CONFIG_RESPONSE,
                name = getterName,
                returnType = "I",
                parameters = emptyList(),
            )

            val match = fp.matchOrNull() ?: throw PatchException(
                "ProtonVPN: $APP_CONFIG_RESPONSE->$getterName() not found (version drift?)",
            )

            match.method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent(),
            )
            patched++
        }

        println("[protonvpn] delay: removed $patched server change delays")
    }
}
