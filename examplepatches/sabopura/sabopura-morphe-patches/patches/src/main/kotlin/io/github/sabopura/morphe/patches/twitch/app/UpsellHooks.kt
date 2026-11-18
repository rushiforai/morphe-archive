package io.github.sabopura.morphe.patches.twitch.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private const val APP = "Lio/github/sabopura/morphe/extension/twitch/app/AppHooks;"
private const val TURBO_PAGE = "Ltv/twitch/android/models/feed/DiscoveryFeedPage\$TurboPage;"

private fun Method.reads(field: (FieldReference) -> Boolean): Boolean =
    implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let(field) == true } == true

/** Methods passing [filter] in the whole app, for surfaces no string anchors. */
internal fun BytecodePatchContext.methodsMatching(filter: (Method) -> Boolean): List<Pair<ClassDef, Method>> =
    classesMatching { type -> type.methods.any(filter) }.flatMap { type -> type.methods.filter(filter).map { type to it } }

internal fun BytecodePatchContext.mutable(owner: ClassDef, found: Method): MutableMethod =
    mutableClassDefBy(owner).methods.first {
        it.name == found.name && it.returnType == found.returnType &&
            it.parameterTypes.map { p -> p.toString() } == found.parameterTypes.map { p -> p.toString() }
    }

private fun MutableMethod.returnIfUpsellsHidden(what: String) {
    requireLocal(what)
    addInstructionsWithLabels(0, """
        invoke-static {}, $APP->hideUpsells()Z
        move-result v0
        if-eqz v0, :show
        return-void
    """, ExternalLabel("show", getInstruction(0)))
}

/** A surface a version does not have is skipped; one that is there but changed fails the patch. */
internal val hideUpsellsHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        methodsMatching { m ->
            m.returnType == "Ljava/util/List;" && m.parameterTypes.singleOrNull()?.toString() == "Z" &&
                m.reads { it.definingClass == TURBO_PAGE && it.name == "INSTANCE" }
        }.takeIf { it.isNotEmpty() }?.uniqueContract("Turbo home tab")?.let { (owner, found) ->
            mutable(owner, found).addInstructions(0, """
                invoke-static/range {p1 .. p1}, $APP->keepTurbo(Z)Z
                move-result p1
            """)
        }

        classesWithStrings("TurboAppStartUpsell").singleOrNull()?.let { model ->
            methodWith("Turbo startup offer", "turboAppStartUpsellHelper") { m -> m.reads { it.type == model.type } }.apply {
                val singleton = instructions.indexOfFirst {
                    it.opcode == Opcode.SGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).type == model.type
                }
                val gate = singleton - 3
                if (gate < 1 || instructions[gate].opcode != Opcode.IF_EQZ || instructions[gate - 1].opcode != Opcode.MOVE_RESULT)
                    throw PatchException("Twitch: Turbo startup offer no longer follows its helper's answer")
                val answer = getInstruction<OneRegisterInstruction>(gate).registerA
                addInstructions(gate, """
                    invoke-static/range {v$answer .. v$answer}, $APP->keepTurbo(Z)Z
                    move-result v$answer
                """)
            }
        }

        if (classesWithStrings("afterSignup", "turboSignupUpsellExperiment").isNotEmpty())
            methodWith("Turbo signup offer", "afterSignup", "turboSignupUpsellExperiment") {
                it.returnType == "V" && it.parameterTypes.isEmpty()
            }.returnIfUpsellsHidden("Turbo signup offer")

        // A Compose function: returning before its first group leaves Compose balanced.
        methodsMatching { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.size >= 3 &&
                m.parameterTypes.last().toString() == "I" &&
                m.reads { it.name == "CREATOR_LED" && it.type == m.parameterTypes[1].toString() }
        }.takeIf { it.isNotEmpty() }?.uniqueContract("subscription discount banner")?.let { (owner, found) ->
            mutable(owner, found).returnIfUpsellsHidden("subscription discount banner")
        }
    }
}
