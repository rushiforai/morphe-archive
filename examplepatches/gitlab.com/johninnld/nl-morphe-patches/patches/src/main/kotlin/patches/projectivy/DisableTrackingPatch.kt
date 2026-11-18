/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Additional terms under GPLv3 section 7:
 * - You must preserve reasonable legal notices and author attributions in this file.
 * - Modified versions must not misrepresent the origin of this file.
 *
 * Ported from hxreborn/revanced-patches:
 * https://gitlab.com/hxreborn/revanced-patches/-/commit/ea27afb265862656079dea62697b42032a4704a3
 * Adapted for this bundle and verified against Projectivy 4.73 (98).
 * Commit ea27afb265862656079dea62697b42032a4704a3 (2026-05-17),
 * patches/src/main/kotlin/app/revanced/patches/projectivy/misc/tracking/DisableTrackingPatch.kt
 */
package patches.projectivy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import patches.shared.uniqueMatch
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val redirectedHosts = mapOf(
    FirebaseInstallationsUrlFingerprint to "firebaseinstallations.googleapis.com",
    CrashlyticsSettingsUrlFingerprint to "firebase-settings.crashlytics.com",
)

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Disables analytics and crash reporting.",
) {
    dependsOn(patches.shared.originalInput(projectivy))
    compatibleWith(projectivy)

    execute {
        AnalyticsEventFingerprint.uniqueMatch().method.returnEarly()

        FirebaseConfigFingerprint.uniqueMatch().method.returnEarly()

        AdvertisingIdClientConnectFingerprint.uniqueMatch().method.returnEarly()

        redirectedHosts.forEach { (fingerprint: Fingerprint, host: String) ->
            fingerprint.uniqueMatch().method.apply {
                instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.CONST_STRING &&
                        instruction.getReference<StringReference>()?.string?.contains(host) == true
                }.map { it.index }.reversed().also {
                    check(it.isNotEmpty()) { "Missing Projectivy tracking URL: $host" }
                }.forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    replaceInstruction(index, "const-string v$register, \"localhost\"")
                }
            }
        }
    }
}
