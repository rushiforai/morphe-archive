/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.appClassesWithString
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "App font"
internal const val APP_FONT = "$EXTENSION_PACKAGE/ui/AppFont;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val CONTEXT = "Landroid/content/Context;"
private const val HANDLER = "Landroid/os/Handler;"
private const val VIEW = "Landroid/view/View;"
internal const val FONT_REPLACEMENT_HOOK = "$APP_FONT->replacement($CONTEXT" + "I)$TYPEFACE"
internal const val FONT_PROVIDED_HOOK = "$APP_FONT->provided($TYPEFACE)$TYPEFACE"
internal const val FONT_PREINFLATED_HOOK = "$APP_FONT->preinflated($VIEW)V"

/** The loader's failure message, the medium Roboto's family name and the provider's log line, each held by one method of the right shape. */
internal const val FONT_LOAD_FAILURE = "Font resource ID #0x"
internal const val MEDIUM_ROBOTO = "sans-serif-medium"
internal const val PREINFLATED_ROW = "Returning pre-inflated View for resId: "

/** Where Tumblr's list of fonts lives. R8 renames the list, not its package. */
private const val FONT_PACKAGE = "Lcom/tumblr/font/"

/** The eight parameters of AndroidX's font loader, the callback being the only obfuscated one. */
private const val LOADER_PARAMETERS = 8
private const val CALLBACK_PARAMETER = 4

internal class FontPlan(
    val load: MutableMethod,
    val deliver: String,
    val picker: MutableMethod,
    /** Where each of the picker's Roboto answers returns, and the register it returns. */
    val answers: List<Pair<Int, Int>>,
    val provider: MutableMethod,
    /** Where the provider returns a row it inflated ahead of time, and the register holding the row. */
    val row: Pair<Int, Int>,
)

/**
 * AndroidX's ResourcesCompat (`lih` in 46.9.1.100) loads every font resource through one method, View
 * and Compose text alike. Its start asks the extension first: a face comes back through the caller's
 * callback and as the answer, the way a font found in its cache does, and null goes on to Tumblr's
 * font. Tumblr's font picker (`s59` in 46.9.1.100) answers two fonts with Roboto by family name and
 * never reaches the loader, so those two answers go through the extension as well.
 *
 * The dashboard's view provider (`eq0` in 46.9.1.100) inflates its first rows on a background thread
 * with an inflater that has no AppCompat. Those are plain TextViews, and a plain TextView reads
 * `android:fontFamily` inside Android, past the loader, so each such row goes through the extension
 * as it's handed over.
 */
@Suppress("unused")
val appFontPatch = bytecodePatch(
    name = PATCH,
    description = "Replaces Tumblr's own font with your phone's font, or a font file you choose in settings." +
        " Fonts a post's author picked stay as they are. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("appFont")
        requireStatusMethod("fontChoice")
        val plan = resolveFontPlan()
        // The later answer first, so the earlier index still names its instruction.
        for ((at, register) in plan.answers.sortedByDescending { it.first }) {
            plan.picker.addInstructions(
                at,
                "invoke-static/range { v$register .. v$register }, $FONT_PROVIDED_HOOK\n" +
                    "move-result-object v$register",
            )
        }
        val first = plan.load.getInstruction(0)
        plan.load.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $FONT_REPLACEMENT_HOOK
                move-result-object v0
                if-eqz v0, :hush_keep
                if-eqz p4, :hush_give
                invoke-virtual { p4, v0, p5 }, ${plan.deliver}
                :hush_give
                return-object v0
            """,
            ExternalLabel("hush_keep", first),
        )
        val (handover, row) = plan.row
        plan.provider.addInstructionsAtControlFlowLabel(handover, "invoke-static/range { v$row .. v$row }, $FONT_PREINFLATED_HOOK")
        enableCapability("fontChoice")
        enableStatus("appFont")
    }
}

internal fun BytecodePatchContext.resolveFontPlan(): FontPlan {
    requireExtensionHook(PATCH, FONT_REPLACEMENT_HOOK)
    requireExtensionHook(PATCH, FONT_PROVIDED_HOOK)
    requireExtensionHook(PATCH, FONT_PREINFLATED_HOOK)
    val load = appClassesWithString(FONT_LOAD_FAILURE).flatMap { it.methods }.filter { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        method.isStatic() && method.returnType == TYPEFACE && types.size == LOADER_PARAMETERS &&
            types[0] == CONTEXT && types[1] == "I" && types[2] == "Landroid/util/TypedValue;" && types[3] == "I" &&
            types[5] == HANDLER && types[6] == "Z" && types[7] == "Z" && FONT_LOAD_FAILURE in method.strings()
    }.only(PATCH, "AndroidX's font loader")
    // p4 and p5 go in a plain call, and v0 has to be a spare local at the start.
    val registers = load.implementation?.registerCount ?: 0
    requireShape(PATCH, registers in (LOADER_PARAMETERS + 1)..18, "the font loader's registers don't leave room for its hook")
    val callback = load.parameterTypes[CALLBACK_PARAMETER].toString()
    val deliver = (classDefByOrNull(callback) ?: throw PatchException("$PATCH: the font callback $callback isn't in this build"))
        .methods.filter { !it.isStatic() && it.hasShape(listOf(TYPEFACE, HANDLER), "V") }
        .only(PATCH, "the font callback's delivery")

    val picker = appClassesWithString(MEDIUM_ROBOTO).flatMap { it.methods }.filter { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        method.isStatic() && method.returnType == TYPEFACE && types.size == 2 && types[0] == CONTEXT &&
            types[1].startsWith(FONT_PACKAGE) && MEDIUM_ROBOTO in method.strings()
    }.only(PATCH, "Tumblr's font picker")
    val steps = picker.instructionList()
    val regular = steps.indices.filter { at ->
        steps[at].opcode == Opcode.SGET_OBJECT &&
            steps[at].fieldRef()?.let { it.definingClass == TYPEFACE && it.name == "SANS_SERIF" } == true
    }.only(PATCH, "the font picker's regular Roboto")
    val medium = steps.indices.filter { steps[it].stringRef() == MEDIUM_ROBOTO }.only(PATCH, "the font picker's medium Roboto")
    val made = (medium until steps.size).firstOrNull { step ->
        steps[step].methodRef()?.let { it.definingClass == TYPEFACE && it.name == "create" } == true
    }
    requireShape(PATCH, made != null, "the font picker doesn't make its medium Roboto")
    val answers = listOf(regular + 1, made!! + 2).map { at ->
        val given = steps.getOrNull(at)?.takeIf { it.opcode == Opcode.RETURN_OBJECT } as? OneRegisterInstruction
        requireShape(PATCH, given != null, "the font picker doesn't answer right after choosing Roboto")
        at to given!!.registerA
    }

    val provider = appClassesWithString(PREINFLATED_ROW).flatMap { it.methods }.filter { method ->
        !method.isStatic() && method.hasShape(listOf("I", "Landroid/view/ViewGroup;"), VIEW) && PREINFLATED_ROW in method.strings()
    }.only(PATCH, "the view provider's handover")
    val handing = provider.instructionList()
    val logged = handing.indices.filter { handing[it].stringRef() == PREINFLATED_ROW }.only(PATCH, "the view provider's log line")
    val handover = (logged until handing.size).firstOrNull { handing[it].opcode == Opcode.RETURN_OBJECT }
    requireShape(PATCH, handover != null, "the view provider doesn't return the row it logged")
    return FontPlan(
        mutableOf(load),
        "$callback->${deliver.name}($TYPEFACE$HANDLER)V",
        mutableOf(picker),
        answers,
        mutableOf(provider),
        handover!! to (handing[handover] as OneRegisterInstruction).registerA,
    )
}
