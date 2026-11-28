/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val FACER_PACKAGE = "com.jeremysteckling.facerrel"

/** SHA-1 of Facer's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val FACER_SIGNATURE = "6feffd6dfb9592c3a1c0a573ab7c9d43041f710d"

/** `com.google.android.gms.auth.api.signin.internal.zbm.getSignInIntent` (R8-renamed to `a`). */
private val getSignInIntentFingerprint = Fingerprint(
    returnType = "Landroid/content/Intent;",
    strings = listOf("getSignInIntent()"),
)

/**
 * Keeps Google Sign-In working through microG RE (GmsCore) while leaving the Wear OS Wearable
 * Data Layer bound to real Google Play services so watchface syncing to Wear OS watches still works.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes \"Sign in with Google\" work by signing in through microG RE (GmsCore) instead of " +
        "Google Play services, while keeping Wear OS watch sync on Google Play services. Needs microG RE " +
        "installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(FACER_PACKAGE, FACER_SIGNATURE))

    execute {
        redirectToGmsCore(FACER_SIGNATURE)
        getSignInIntentFingerprint.method.addInstructions(
            0,
            "invoke-static { }, Lapp/fakh/extension/facer/GmsCore;->require()V",
        )

        // Restore Wearable Data Layer and its caller-UID verification to real Google Play services
        // so phone-to-watch syncing is not broken by GmsCore lacking Wear OS Data Layer support.
        var restored = 0
        classDefForEach { classDef ->
            val keepRealGms = classDef.type.startsWith("Lcom/google/android/gms/wearable/") ||
                classDef.type == "Lcom/google/android/gms/common/util/UidVerifier;" ||
                classDef.type == "Lcom/google/android/gms/common/GoogleSignatureVerifier;"
            if (!keepRealGms) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.withIndex().forEach { (index, insn) ->
                    if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) return@forEach
                    val value = ((insn as ReferenceInstruction).reference as StringReference).string
                    val fixed = when {
                        value == "app.revanced.android.gms" -> "com.google.android.gms"
                        value.startsWith("app.revanced.android.gms.wearable.") ->
                            value.replaceFirst("app.revanced.", "com.google.")
                        else -> null
                    } ?: return@forEach
                    val reg = (insn as OneRegisterInstruction).registerA
                    val opcode = if (insn.opcode == Opcode.CONST_STRING_JUMBO) "const-string/jumbo" else "const-string"
                    method.replaceInstruction(index, "$opcode v$reg, \"$fixed\"")
                    restored++
                }
            }
        }
        if (restored == 0) throw PatchException("Failed to restore Wearable Data Layer strings to real Play services")
    }
}
