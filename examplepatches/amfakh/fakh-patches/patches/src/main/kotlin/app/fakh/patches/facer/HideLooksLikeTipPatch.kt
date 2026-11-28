/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Lambda that builds the Looks like onboarding banner state from `"looks_like_onboarding_message"`. */
private val looksLikeOnboardingFingerprint = Fingerprint(
    strings = listOf("looks_like_onboarding_message", "didUserLikeLook"),
)

@Suppress("unused")
val hideLooksLikeTipPatch = patch(
    name = "Hide Looks like tip",
    description = "Removes the \"See a Look you like?\" onboarding banner from the Looks tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Layout")

    execute {
        // Locate the Visible banner subclass (`At1$b`) instantiated right after `"looks_like_onboarding_message"`.
        val method = looksLikeOnboardingFingerprint.method
        val visibleCtor = method.instructions
            .filter { it.opcode == Opcode.INVOKE_DIRECT }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .firstOrNull { ref ->
                ref.name == "<init>" &&
                    ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z")
            } ?: throw PatchException("Looks like onboarding banner state constructor not found")

        var baseType: String? = null
        classDefForEach { classDef ->
            if (classDef.type == visibleCtor.definingClass) {
                baseType = classDef.superclass
            }
        }
        val stateBaseType = baseType ?: throw PatchException("Looks like onboarding base state class not found")

        // Locate the Hidden singleton (`At1$a.b`) extending the same base class.
        var hiddenType: String? = null
        var hiddenField: String? = null
        classDefForEach { classDef ->
            if (classDef.superclass != stateBaseType || classDef.type == visibleCtor.definingClass) return@classDefForEach
            val singleton = classDef.staticFields.singleOrNull { it.type == classDef.type } ?: return@classDefForEach
            hiddenType = classDef.type
            hiddenField = singleton.name
        }
        val hType = hiddenType ?: throw PatchException("Looks like onboarding hidden state singleton not found")
        val hField = hiddenField!!

        // Force LooksMainFeedUiState's onboarding state parameter to the Hidden singleton.
        var patched = 0
        classDefForEach { classDef ->
            val init = classDef.methods.singleOrNull { m ->
                val params = m.parameterTypes.map(CharSequence::toString)
                m.name == "<init>" &&
                    params.size == 5 &&
                    params[3] == stateBaseType &&
                    params[4] == "Z" &&
                    m.implementation != null
            } ?: return@classDefForEach
            val m = mutableClassDefBy(classDef).methods.single {
                it.name == "<init>" && it.parameterTypes == init.parameterTypes
            }
            // Instance <init>: p0=this, p1..p3=other state, p4=looksOnboardingNotificationState, p5=boolean.
            m.addInstructions(0, "sget-object p4, $hType->$hField:$hType")
            patched++
        }
        if (patched != 1) throw PatchException("Expected 1 LooksMainFeedUiState constructor, found $patched")
    }
}
