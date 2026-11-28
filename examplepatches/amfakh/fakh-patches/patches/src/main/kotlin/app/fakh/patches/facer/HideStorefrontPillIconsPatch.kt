/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** `StorefrontSelectorView` row composable (`RH2.b`), used to locate the pill composable (`RH2.a`) on the same class. */
private val storefrontSelectorFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("selectedStorefront", "onStorefrontSelected", "analyticsReporter"),
)

@Suppress("unused")
val hideStorefrontPillIconsPatch = patch(
    name = "Hide storefront pill icons",
    description = "Removes icons from the storefront filter pills at the top of the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Home")

    execute {
        val selectorClass = mutableClassDefBy(storefrontSelectorFingerprint.classDef)
        val pillMethod = selectorClass.methods.singleOrNull { m ->
            val p = m.parameterTypes.map(CharSequence::toString)
            m.returnType == "V" && p.size == 7 && p[1] == "Z" && p[2] == "Z" && m.implementation != null
        } ?: throw PatchException("Storefront pill composable not found in ${selectorClass.type}")

        // Remove both Compose `Icon(ImageVector|Painter, String, Modifier, long, Composer, int, int)` calls.
        var removed = 0
        pillMethod.instructions.toList().forEachIndexed { idx, insn ->
            if (insn.opcode == Opcode.INVOKE_STATIC_RANGE || insn.opcode == Opcode.INVOKE_STATIC) {
                val ref = (insn as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
                val p = ref.parameterTypes.map(CharSequence::toString)
                if (ref.returnType == "V" &&
                    p.size == 7 &&
                    p[1] == "Ljava/lang/String;" &&
                    p[3] == "J" &&
                    p[5] == "I" &&
                    p[6] == "I"
                ) {
                    pillMethod.replaceInstruction(idx, "nop")
                    removed++
                }
            }
        }
        if (removed != 2) throw PatchException("Expected 2 storefront pill Icon calls, found $removed")
    }
}
