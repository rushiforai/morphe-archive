/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

private const val PATCH = "Hide related pins"

/** The method a pin page's presenter hands each of its sections to the page in. It keeps its name. */
internal const val CLOSEUP_ADD_SECTIONS = "addDataSources"

/** The presenter getters for the related pins grid under a pin, and its filtered variant. They keep their names. */
internal val RELATED_PIN_GETTERS = setOf("getRelatedPinsPagedList", "getFilteredRelatedPinsPagedList")

/** The presenter getter whose delegate builds the refined related pins list. It keeps its name. */
internal const val RELATED_REFINEMENT_GETTER = "getCloseupRefinementPresenterDelegate"

internal const val RELATED_PINS_HOOK = "$UI_HOOKS->hideRelatedPins()Z"

/** One call in a presenter's [CLOSEUP_ADD_SECTIONS] that adds a related pins list, and a local free in front of it. */
internal class RelatedPinsAdd(val presenter: Method, val addAt: Int, val scratch: Int)

/**
 * Every call that adds a related pins list to a pin page. The presenters that build pin pages are
 * the classes with a [RELATED_PIN_GETTERS] getter of their own and an [CLOSEUP_ADD_SECTIONS]
 * method. In that method each section is one call that takes the section alone, and a related one
 * is the list a related getter just returned, or the one its refinement delegate just built.
 * Skipping those calls leaves the grid out of the page, so it never loads.
 */
internal fun BytecodePatchContext.relatedPinsAdds(): List<RelatedPinsAdd> {
    val presenters = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.methods.none { it.name in RELATED_PIN_GETTERS && it.implementation != null }) return@classDefForEach
        owner.methods.filterTo(presenters) {
            it.name == CLOSEUP_ADD_SECTIONS && it.returnType == "V" && it.parameterTypes.size == 1 &&
                it.implementation != null && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
    }
    if (presenters.isEmpty()) throw PatchException("$PATCH: no pin page presenter with $CLOSEUP_ADD_SECTIONS")
    return presenters.flatMap { presenter ->
        val body = presenter.instructions()
        val adds = body.indices.filter { at -> relatedAdd(body, at) }
        if (adds.isEmpty()) throw PatchException("$PATCH: ${presenter.definingClass} adds no related pins list")
        adds.map { addAt ->
            if (addAt + 1 >= body.size) throw PatchException("$PATCH: nothing follows the call that adds related pins")
            val scratch = presenter.freeLocalsAt("$PATCH: the call that adds related pins", addAt, 1, listOf(addAt + 1), highest = 255).single()
            RelatedPinsAdd(presenter, addAt, scratch)
        }
    }
}

/** The call that adds one section: a virtual call taking the section alone and returning nothing. */
private fun addsSection(instruction: Instruction): Boolean {
    val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return instruction.opcode == Opcode.INVOKE_VIRTUAL && called.returnType == "V" && called.parameterTypes.size == 1 &&
        (instruction as FiveRegisterInstruction).registerCount == 2
}

private fun name(instruction: Instruction?) = ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name

/** The register [instruction] moves a call's result into, when it's a move-result-object. */
private fun result(instruction: Instruction?) =
    (instruction as? OneRegisterInstruction)?.takeIf { instruction.opcode == Opcode.MOVE_RESULT_OBJECT }?.registerA

/** True when [at] adds the list a related getter, or its refinement delegate, returned right before it. */
private fun relatedAdd(body: List<Instruction>, at: Int): Boolean {
    if (at < 2 || !addsSection(body[at])) return false
    val section = (body[at] as FiveRegisterInstruction).registerD
    if (result(body[at - 1]) != section) return false
    if (name(body[at - 2]) in RELATED_PIN_GETTERS) return true
    // The refinement delegate is fetched first, and the list comes from one call on it.
    if (at < 4 || name(body[at - 4]) != RELATED_REFINEMENT_GETTER) return false
    val delegate = result(body[at - 3]) ?: return false
    val build = body[at - 2] as? FiveRegisterInstruction ?: return false
    return body[at - 2].opcode == Opcode.INVOKE_VIRTUAL && build.registerCount == 1 && build.registerC == delegate
}

/** What the pin page's loading indicator logs when it's bound before its sections are set. It keeps its wording. */
internal const val LOADING_INDICATOR_CHECK = "PinCloseupLoadingIndicatorManager must have moduleList set before onPresenterBound()"

internal const val RELATED_LOADING_HOOK = "$UI_HOOKS->relatedPinsLoading()Z"

/**
 * The pin page's loading indicator. [watch] takes the page's view and starts following the related
 * grid's loading, turning on gray placeholder tiles until it ends. [states] are its two wait states:
 * the page's loading section hides once both read COMPLETE. [refresh] redraws that section from the
 * page's section list, [sections], the field [watch] checks before anything else.
 */
internal class RelatedPinsLoading(val watch: Method, val states: List<FieldReference>, val refresh: Method, val sections: FieldReference)

internal fun BytecodePatchContext.relatedPinsLoading(): RelatedPinsLoading {
    val owner = classDefByStrings(LOADING_INDICATOR_CHECK).singleOrNull()
        ?: throw PatchException("$PATCH: no single pin page loading indicator")
    val watch = owner.methods.filter {
        LOADING_INDICATOR_CHECK in it.strings() && !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.isNotEmpty()
    }.one("$PATCH: the loading indicator's start")
    val view = watch.parameterTypes.first().toString()
    val states = owner.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && classDefByOrNull(field.type)?.fields?.any {
            it.name == "COMPLETE" && it.type == field.type && AccessFlags.STATIC.isSet(it.accessFlags)
        } == true
    }.map { ImmutableFieldReference(owner.type, it.name, it.type) }
    if (states.size != 2) throw PatchException("$PATCH: the loading indicator has ${states.size} wait states, not 2")
    val refresh = owner.methods.filter {
        it.name != watch.name && !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameters() == listOf(view) && it.implementation != null
    }.one("$PATCH: the loading indicator's redraw")
    val body = watch.instructions()
    val check = body.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == LOADING_INDICATOR_CHECK }
    val sections = body.take(check).filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == owner.type }.distinctBy { it.toString() }
        .one("$PATCH: the loading indicator's section list")
    // The injected iput and invoke address this and the view in four bits.
    val self = watch.implementation!!.registerCount - 1 - watch.parameterTypes.sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt()
    if (self + 1 > 15) throw PatchException("$PATCH: the loading indicator's start keeps the view in v${self + 1}")
    return RelatedPinsLoading(watch, states, refresh, sections)
}

@Suppress("unused")
val hideRelatedPinsPatch = bytecodePatch(
    name = PATCH,
    description = "Leaves the grid of related pins out from under a pin you open, so it doesn't load. " +
        "The pin, its comments and its buttons stay. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideRelatedPins")
        requireStatusMethod("relatedPins")
        val adds = relatedPinsAdds()
        val loading = relatedPinsLoading()
        // A grid that's never added never finishes loading, so the page would show placeholder tiles
        // forever. With the switch on, the indicator ends both waits the way the page's own module
        // event does, redraws its loading section and never starts following the grid.
        val watch = mutable(loading.watch)
        // Four bits, since the iget and iput carry it.
        val scratch = watch.freeLocalsAt("$PATCH: the loading indicator's start", 0, 1, listOf(0)).single()
        watch.addInstructionsWithLabels(
            0,
            loading.states.joinToString("\n", prefix = """
                invoke-static {}, $RELATED_LOADING_HOOK
                move-result v$scratch
                if-eqz v$scratch, :hush_wait
            """.trimIndent() + "\n", postfix = "\n" + """
                iget-object v$scratch, p0, ${loading.sections}
                if-eqz v$scratch, :hush_done
                invoke-virtual {p0, p1}, ${loading.refresh}
                :hush_done
                return-void
            """.trimIndent()) { state ->
                "sget-object v$scratch, ${state.type}->COMPLETE:${state.type}\niput-object v$scratch, p0, $state"
            },
            ExternalLabel("hush_wait", watch.getInstruction(0)),
        )
        // Later calls first, so the indexes of the earlier ones still hold.
        for (add in adds.sortedByDescending { it.addAt }) {
            val method = mutable(add.presenter)
            val after = method.getInstruction(add.addAt + 1)
            method.addInstructionsWithLabels(
                add.addAt,
                """
                    invoke-static {}, $RELATED_PINS_HOOK
                    move-result v${add.scratch}
                    if-nez v${add.scratch}, :hush_skip
                """,
                ExternalLabel("hush_skip", after),
            )
        }
        enableCapability("relatedPins")
        enableStatus("hideRelatedPins")
    }
}
