/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.quality

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PATCH = "Default playback quality"

/**
 * Videos, reels and video stories start at the quality picked in Hushfacebook's settings. See
 * QualityAnchors.kt for how Facebook's player applies a quality, and the extension's QualityChoice
 * for when it keeps Facebook's own.
 *
 * Off in the default selection. Picked, its switch starts on and the quality starts as Facebook's
 * own, so nothing changes until a quality is chosen.
 */
@Suppress("unused")
val defaultPlaybackQualityPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Default playback quality",
    description = "Plays videos, reels and video stories at the quality you choose in Hushfacebook's settings, " +
        "such as Data saver or up to 720p, instead of the one Facebook picks as it plays. A quality you pick in a " +
        "video's own menu still wins for that video.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        applyQualityAnchors(findQualityAnchors())
        enableStatus("defaultPlaybackQuality")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** What [findQualityAnchors] found, for [applyQualityAnchors] to change. */
internal class QualityAnchors(
    val evaluator: ClassDef,
    val constructor: Method,
    val setter: Method,
    val preselected: FieldReference,
    val formats: FieldReference,
    val labelOf: MethodReference,
    val label: FieldReference,
)

/**
 * The DASH format evaluator, its constructor, its custom-quality setter, the preselected label its
 * first choice hands that setter, its tracks and how the setter reads a track's label. Changes
 * nothing.
 */
internal fun BytecodePatchContext.findQualityAnchors(): QualityAnchors {
    val calls = classDefByStrings(SET_CUSTOM_QUALITY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { holder -> holder.methods.filter { holdsString(it, SET_CUSTOM_QUALITY) } }
        .flatMap(::customQualityCalls)
    val call = calls.singleOrNull()
        ?: refuse("expected one (String)V call in the method holding \"$SET_CUSTOM_QUALITY\", found ${calls.size}")
    val evaluator = classDefByOrNull(call.definingClass) ?: refuse("this build has no ${call.definingClass}")
    if (!takesAbrConfiguration(evaluator)) refuse("${evaluator.type}'s constructor takes no $ABR_CONFIGURATION")

    val setter = evaluator.methods.singleOrNull {
        it.name == call.name && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == call.parameterTypes.map(CharSequence::toString)
    } ?: refuse("${evaluator.type} has no ${call.name}(String)V")
    val constructors = evaluator.methods.filter { it.name == "<init>" }
    val constructor = constructors.singleOrNull() ?: refuse("expected one constructor of ${evaluator.type}, found ${constructors.size}")

    val formatsFields = formatsFields(setter)
    val formats = formatsFields.singleOrNull()
        ?: refuse("expected ${evaluator.type}->${setter.name} to read one array of tracks, found ${formatsFields.size}")
    val format = formats.type.removePrefix("[")
    val reads = labelReads(setter, format).distinctBy { it.toString() }
    val (labelOf, label) = reads.singleOrNull()
        ?: refuse("expected ${evaluator.type}->${setter.name} to read a track's label one way, found ${reads.size}")

    val preselects = preselectedReads(evaluator, setter)
    val preselected = preselects.singleOrNull()
        ?: refuse("expected one label ${evaluator.type} hands its own ${setter.name}, found ${preselects.size}")
    val stores = constructor.implementation?.instructions?.count {
        (it as? ReferenceInstruction)?.reference?.toString() == preselected.toString()
    } ?: 0
    if (stores == 0) refuse("${evaluator.type}'s constructor doesn't fill in ${preselected.name}")

    // The extension's stubs cast to these types and read these members from outside Facebook's package.
    val formatClass = classDefByOrNull(format) ?: refuse("this build has no $format")
    val labelClass = classDefByOrNull(labelOf.definingClass) ?: refuse("this build has no ${labelOf.definingClass}")
    val infoClass = classDefByOrNull(label.definingClass) ?: refuse("this build has no ${label.definingClass}")
    listOf(evaluator, formatClass, labelClass, infoClass).forEach {
        if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) refuse("${it.type} isn't public, so the extension can't reach it")
    }
    val members = listOf(
        evaluator.fields.singleOrNull { it.name == preselected.name && it.type == preselected.type }?.accessFlags,
        evaluator.fields.singleOrNull { it.name == formats.name && it.type == formats.type }?.accessFlags,
        infoClass.fields.singleOrNull { it.name == label.name && it.type == label.type }?.accessFlags,
        labelClass.methods.singleOrNull {
            it.name == labelOf.name && it.returnType == labelOf.returnType &&
                it.parameterTypes.map(CharSequence::toString) == listOf(format)
        }?.accessFlags,
    )
    listOf(preselected.toString(), formats.toString(), label.toString(), labelOf.toString()).zip(members).forEach { (name, flags) ->
        if (flags == null || !AccessFlags.PUBLIC.isSet(flags)) refuse("$name isn't public, so the extension can't reach it")
    }
    return QualityAnchors(evaluator, constructor, setter, preselected, formats, labelOf, label)
}

/**
 * The setter asks the extension first, through the range form, which names the evaluator and the
 * label where they are and borrows no register, and the answer takes the label's place. The
 * constructor tells the extension about its evaluator before each return, at the return's own
 * label, so a branch that went straight to the return runs the hook too.
 */
internal fun BytecodePatchContext.applyQualityAnchors(anchors: QualityAnchors) {
    val owner = mutableClassDefBy(anchors.evaluator.type)
    owner.findMutableMethodOf(anchors.setter).addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $CUSTOM_QUALITY
            move-result-object p1
        """,
    )
    val constructor = owner.findMutableMethodOf(anchors.constructor)
    val returns = constructor.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    if (returns.isEmpty()) refuse("${anchors.evaluator.type}'s constructor never returns")
    returns.asReversed().forEach { index ->
        constructor.addInstructionsAtControlFlowLabel(index, "invoke-static/range { p0 .. p0 }, $EVALUATOR_BUILT")
    }
    fillStubs(anchors)
}

/** Fills the extension's stubs. Each reads only its parameter registers, cast to Facebook's own type. */
private fun BytecodePatchContext.fillStubs(anchors: QualityAnchors) {
    val extension = mutableClassDefBy(QUALITY_CHOICE)
    fun stub(name: String, parameters: List<String>, answer: String): MutableMethod = extension.methods.singleOrNull {
        it.name == name && it.returnType == answer && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    } ?: refuse("$QUALITY_CHOICE has no static $answer $name(${parameters.joinToString("")})")

    val evaluator = anchors.evaluator.type
    val objectType = "Ljava/lang/Object;"
    val string = "Ljava/lang/String;"
    stub(PRESELECTED_STUB, listOf(objectType), string).addInstructions(
        0,
        """
            check-cast p0, $evaluator
            iget-object p0, p0, ${anchors.preselected}
            return-object p0
        """,
    )
    stub(PRESELECT_STUB, listOf(objectType, string), "V").addInstructions(
        0,
        """
            check-cast p0, $evaluator
            iput-object p1, p0, ${anchors.preselected}
            return-void
        """,
    )
    stub(FORMATS_STUB, listOf(objectType), "[$objectType").addInstructions(
        0,
        """
            check-cast p0, $evaluator
            iget-object p0, p0, ${anchors.formats}
            return-object p0
        """,
    )
    stub(LABEL_STUB, listOf(objectType), string).addInstructions(
        0,
        """
            check-cast p0, ${anchors.formats.type.removePrefix("[")}
            invoke-static { p0 }, ${anchors.labelOf}
            move-result-object p0
            iget-object p0, p0, ${anchors.label}
            return-object p0
        """,
    )
}
