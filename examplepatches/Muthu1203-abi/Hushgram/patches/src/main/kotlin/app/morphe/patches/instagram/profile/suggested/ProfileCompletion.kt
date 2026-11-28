/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.profile.suggested

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.extension.classesLoading
import app.morphe.patches.instagram.misc.extension.jumpTargets
import app.morphe.patches.instagram.misc.extension.requireLocals
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide suggested people on profiles"

internal const val COMPLETION_CARDS = "$PROFILE_SUGGESTIONS->hideCompletionCards()Z"

/**
 * The numbers the check behind your own profile's Complete your profile cards loads, which stay the
 * same from one 450 build to the next where Redex renames its class: the id it reads your account's
 * counts under, the ids of two of those counts, and 3500, the most of the first it shows the cards at.
 */
internal const val COUNTS_ID = 0x3e940ede
internal val FIRST_COUNT = 0x8263c5ae.toInt()
internal val SECOND_COUNT = 0xff70a8f4.toInt()
internal const val MOST_OF_THE_FIRST = 3500

/** The calls a binder of rows makes the cards' views and fills them with, names Instagram keeps. */
private const val CREATE_VIEW = "createView(ILandroid/view/ViewGroup;)Landroid/view/View;"
private const val BIND_VIEW = "bindView(ILandroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V"

/** The check: its class, name and parameters. */
internal class CompletionGate(val type: String, val name: String, val parameters: List<String>)

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/**
 * Finds the check your own profile's posts make before adding the Complete your profile cards
 * (`LX/0806;->A02(LX/0Ha3;)Z` on 385611438): the one instance method answering a boolean for one
 * object that loads all four of [COUNTS_ID], [FIRST_COUNT], [SECOND_COUNT] and [MOST_OF_THE_FIRST],
 * in a class whose constructor makes the cards' binder, a class of [CREATE_VIEW] and [BIND_VIEW].
 * Fails before anything changes when there isn't exactly one, since that's an update this patch
 * hasn't seen.
 */
internal fun BytecodePatchContext.findCompletionGate(): CompletionGate {
    val wanted = setOf(COUNTS_ID, FIRST_COUNT, SECOND_COUNT, MOST_OF_THE_FIRST)
    val gates = classesLoading(FIRST_COUNT.toLong()).flatMap { classDef ->
        classDef.methods.filter { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
                method.parameterTypes.size == 1 && method.parameterTypes[0].startsWith("L") &&
                method.literals().containsAll(wanted)
        }.map { classDef to it }
    }
    val (holder, gate) = gates.singleOrNull()
        ?: refuse("expected one check deciding the Complete your profile cards, found ${gates.size}")
    if (!makesCardBinder(holder)) refuse("${holder.type} doesn't make the Complete your profile cards' binder")
    return CompletionGate(holder.type, gate.name, gate.parameterTypes.map(CharSequence::toString))
}

/**
 * Puts [COMPLETION_CARDS] first in the check: a yes answers it false, so the profile never adds
 * the cards, and a no runs Instagram's own check. The switch is read on every call, so off and
 * Pause take Instagram's path. The check's first local is free at its start, and nothing jumps back
 * there.
 */
internal fun BytecodePatchContext.hideCompletionCards(gate: CompletionGate) {
    val method = mutableClassDefBy(gate.type).methods.single {
        it.name == gate.name && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == gate.parameters
    }
    method.requireLocals(PATCH, 1)
    if (0 in method.jumpTargets()) refuse("something jumps back to the first instruction of ${gate.type}->${gate.name}")
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $COMPLETION_CARDS
            move-result v0
            if-eqz v0, :check
            const/4 v0, 0x0
            return v0
        """,
        ExternalLabel("check", method.getInstruction(0)),
    )
}

/** Whether [holder]'s constructor makes an object of a class that makes and binds rows' views. */
private fun BytecodePatchContext.makesCardBinder(holder: ClassDef): Boolean =
    holder.methods.filter { it.name == "<init>" }.any { constructor ->
        constructor.implementation?.instructions?.any { instruction ->
            if (instruction.opcode != Opcode.NEW_INSTANCE) return@any false
            val made = ((instruction as ReferenceInstruction).reference as TypeReference).type
            val methods = classDefByOrNull(made)?.methods?.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
            methods != null && CREATE_VIEW in methods && BIND_VIEW in methods
        } == true
    }

private fun Method.literals(): Set<Int> =
    implementation?.instructions?.mapNotNullTo(HashSet()) { (it as? NarrowLiteralInstruction)?.narrowLiteral }.orEmpty()
