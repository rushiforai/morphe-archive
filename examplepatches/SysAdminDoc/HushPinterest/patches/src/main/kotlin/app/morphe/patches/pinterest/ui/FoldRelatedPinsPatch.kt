/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Fold related pins"

/** The presenter getter for the grid under a pin. It keeps its name. */
private const val RELATED_LIST_GETTER = "getRelatedPinsPagedList"

/** What every paged list runs to fetch its next page. It keeps its name. */
private const val LOAD_NEXT_PAGE = "loadData"

private const val RELATED_FOLD = "$EXTENSION_PACKAGE/ui/RelatedPinsFold;"
internal const val RELATED_FOLDED_HOOK = "$RELATED_FOLD->folded()Z"
internal const val RELATED_FOLD_BIND_HOOK = "$RELATED_FOLD->bind(Ljava/lang/Object;)V"
internal const val RELATED_FOLD_MODULE_HOOK = "$RELATED_FOLD->module(Landroid/view/View;I)I"

/** The related list's "is there more to load" answer, and each presenter's section setup. */
internal class RelatedPinsFoldTargets(val gate: Method, val binds: List<Method>)

/**
 * Pin page presenters are the classes with their own [RELATED_LIST_GETTER] and a
 * [CLOSEUP_ADD_SECTIONS]. The getter's return type is the related pins list, which only those
 * presenters create. A paged list's [LOAD_NEXT_PAGE] opens by asking itself whether there is more
 * to load and stops on no, so the list's own answer to that one question is the gate.
 */
internal fun BytecodePatchContext.relatedPinsFoldTargets(): RelatedPinsFoldTargets {
    val binds = mutableListOf<Method>()
    val lists = mutableSetOf<String>()
    classDefForEach { owner ->
        val getters = owner.methods.filter {
            it.name == RELATED_LIST_GETTER && it.parameterTypes.isEmpty() && it.implementation != null &&
                !AccessFlags.SYNTHETIC.isSet(it.accessFlags) && !AccessFlags.BRIDGE.isSet(it.accessFlags)
        }
        val adds = owner.methods.filter {
            it.name == CLOSEUP_ADD_SECTIONS && it.returnType == "V" && it.parameterTypes.size == 1 &&
                it.implementation != null && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        if (getters.isEmpty() || adds.isEmpty()) return@classDefForEach
        getters.mapTo(lists) { it.returnType }
        binds += adds
    }
    if (binds.isEmpty()) throw PatchException("$PATCH: no pin page presenter with $RELATED_LIST_GETTER")
    val list = lists.toList().one("$PATCH: the related pins list")

    var type: String? = list
    var load: Method? = null
    while (type != null && load == null) {
        val owner = classDefByOrNull(type) ?: break
        load = owner.methods.firstOrNull {
            it.name == LOAD_NEXT_PAGE && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        type = owner.superclass
    }
    val first = load?.instructions()?.firstOrNull() ?: throw PatchException("$PATCH: the list has no $LOAD_NEXT_PAGE")
    val ask = (first as? ReferenceInstruction)?.reference as? MethodReference
    if (ask == null || ask.returnType != "Z" || ask.parameterTypes.isNotEmpty()) {
        throw PatchException("$PATCH: $LOAD_NEXT_PAGE doesn't open by asking whether there's more")
    }
    val owner = classDefByOrNull(list) ?: throw PatchException("$PATCH: $list is missing")
    val gate = owner.methods.filter {
        it.name == ask.name && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.one("$PATCH: the list's answer to whether there's more")
    return RelatedPinsFoldTargets(gate, binds)
}

@Suppress("unused")
val foldRelatedPinsPatch = bytecodePatch(
    name = PATCH,
    description = "Puts an arrow under a pin you open. Related pins stay folded and don't load until you tap it, and " +
        "tapping again folds them. Your last choice is kept. Hide related pins wins when both are on. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch, hideRelatedPinsPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("foldRelatedPins")
        requireStatusMethod("relatedPinsFold")
        val targets = relatedPinsFoldTargets()
        val gate = mutable(targets.gate)
        val answer = gate.freeLocalsAt("$PATCH: the list's answer", 0, 1, listOf(0)).single()
        addCloseupGate(PATCH, RELATED_FOLD_MODULE_HOOK)
        gate.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $RELATED_FOLDED_HOOK
                move-result v$answer
                if-eqz v$answer, :hush_load
                const/4 v$answer, 0x0
                return v$answer
            """,
            ExternalLabel("hush_load", gate.getInstruction(0)),
        )
        for (bind in targets.binds) {
            mutable(bind).addInstructions(0, "invoke-static/range { p0 .. p0 }, $RELATED_FOLD_BIND_HOOK")
        }
        enableCapability("relatedPinsFold")
        enableStatus("foldRelatedPins")
    }
}
