/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.cleanup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.markers
import app.morphe.patches.instagram.misc.extension.parameterRegister
import app.morphe.patches.instagram.misc.extension.parameterRegisterNumber
import app.morphe.patches.instagram.misc.extension.requireLocals
import app.morphe.patches.instagram.misc.extension.requireParameterIntact
import app.morphe.patches.instagram.misc.extension.typesMarked
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Clean up Reels"

/**
 * Takes three things off the Reels viewer, each behind its own switch, all on once the patch is in:
 * the Follow button beside a reel's author, the pills that prompt you to make something or promote
 * something, and friends' activity with the comment preview. Friends' activity covers the floating
 * bubbles and the Liked by or Followed by line with its faces. See ReelParts.kt for each part.
 *
 * Every part is required: a build where one can't be found once, in the shape its kind has, stops
 * the patch with what's wrong, rather than shipping a switch that quietly does nothing.
 */
@Suppress("unused")
val cleanUpReelsPatch = bytecodePatch(
    name = "Clean up Reels",
    description = "Hides the Follow button on reels, the pills that push Edits, templates, Meta AI and " +
        "Ray-Ban Meta glasses, and friends' activity with the comment preview. Each part has its own switch.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        hideReelParts()
        enableStatus("reelDeclutter")
    }
}

/**
 * Finds the method behind each of [REEL_PARTS] by its marker and asks the part's hook first thing
 * in it. A render returns null when the hook says to hide, which Instagram's own renders answer
 * whenever they have nothing to draw. The check returns false. The floating bubbles and the social
 * context line are then taken out where Instagram decides on them, see [hideFloatingBubbles] and
 * [hideFriendsSocialContext].
 */
internal fun BytecodePatchContext.hideReelParts() {
    val wanted = CLEANUP_MARKERS.toSet()
    val found = mutableMapOf<String, MutableList<Method>>()
    val marked = typesMarked(*CLEANUP_MARKERS.toTypedArray())
    classDefForEach { classDef ->
        if (classDef.type !in marked) return@classDefForEach
        classDef.methods.forEach { method ->
            method.markers().filter { it in wanted }.distinct().forEach { found.getOrPut(it) { mutableListOf() } += method }
        }
    }
    fun holding(marker: String): Method {
        val holders = found[marker].orEmpty()
        return holders.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one method holding the $marker marker, found " +
                if (holders.isEmpty()) "none" else holders.joinToString { "${it.definingClass}->${it.name}" },
        )
    }

    val methods = REEL_PARTS.associateWith { holding(it.marker) }
    val bubbles = holding(FLOATING_BUBBLES)
    val socialContext = holding(SOCIAL_CONTEXT_CHECK)
    methods.forEach { (part, method) -> requireShape(part, method) }
    val renders = methods.filterKeys { !it.check }.values
    val shapes = renders.map { it.parameterTypes.single().toString() to it.returnType }.toSet()
    if (shapes.size != 1) throw PatchException("$PATCH: the renders don't share one shape: $shapes")
    val none = noBubbles(bubbles)
    val line = socialContextType(socialContext)

    methods.forEach { (part, found) ->
        val method = mutable(found)
        method.requireLocals(PATCH, 1)
        val answer = if (part.check) "return v0" else "return-object v0"
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, ${part.hook}
                move-result v0
                if-eqz v0, :draw
                const/4 v0, 0x0
                $answer
            """,
            ExternalLabel("draw", method.getInstruction(0)),
        )
    }
    hideFloatingBubbles(bubbles, none)
    hideFriendsSocialContext(socialContext, line)
}

private fun BytecodePatchContext.mutable(found: Method) = mutableClassDefBy(found.definingClass).methods.single {
    it.name == found.name && it.parameterTypes.map(Any::toString) == found.parameterTypes.map(Any::toString) &&
        it.returnType == found.returnType
}

/**
 * The state the floating bubbles use case answers when there are no bubbles: the one field it reads
 * and answers straight away, a single instance of its own class.
 */
private fun noBubbles(method: Method): String {
    val code = method.implementation?.instructions?.toList().orEmpty()
    val nones = code.zipWithNext().mapNotNull { (read, answer) ->
        val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return@mapNotNull null
        val returned = read.opcode == Opcode.SGET_OBJECT && answer.opcode == Opcode.RETURN_OBJECT &&
            (read as OneRegisterInstruction).registerA == (answer as OneRegisterInstruction).registerA
        if (returned && field.type == field.definingClass) "${field.definingClass}->${field.name}:${field.type}" else null
    }.distinct()
    return nones.singleOrNull() ?: throw PatchException(
        "$PATCH: expected ${method.definingClass}->${method.name}, holding the $FLOATING_BUBBLES marker, to answer " +
            "one state of its own as it is, found ${nones.ifEmpty { listOf("none") }.joinToString()}",
    )
}

/** Has the floating bubbles use case answer its no-bubbles state when friends' activity is hidden. */
private fun BytecodePatchContext.hideFloatingBubbles(found: Method, none: String) {
    val method = mutable(found)
    method.requireLocals(PATCH, 1)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HIDE_SOCIAL_FOOTER
            move-result v0
            if-eqz v0, :build
            sget-object v0, $none
            return-object v0
        """,
        ExternalLabel("build", method.getInstruction(0)),
    )
}

/** Where the social context check reads its line's type: the parameter holding the line, and the field holding the type. */
internal data class SocialContextType(val parameter: Int, val field: String)

/**
 * The line the social context check is handed, and its type: the field the check reads off a
 * parameter and asks for its ordinal, on an enum naming [SOCIAL_CONTEXT_TYPES].
 */
private fun BytecodePatchContext.socialContextType(method: Method): SocialContextType {
    val what = "$PATCH: ${method.definingClass}->${method.name}, holding the $SOCIAL_CONTEXT_CHECK marker,"
    if (method.implementation == null || method.returnType != "Z") throw PatchException("$what is not a check answering a boolean")
    val code = method.implementation!!.instructions.toList()
    val parameters = method.parameterTypes.indices.associateBy { method.parameterRegisterNumber(it) }
    val reads = code.zipWithNext().withIndex().mapNotNull { (at, pair) ->
        val (read, asked) = pair
        val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return@mapNotNull null
        val call = (asked as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        if (read.opcode != Opcode.IGET_OBJECT || asked.opcode != Opcode.INVOKE_VIRTUAL) return@mapNotNull null
        if (call.definingClass != "Ljava/lang/Enum;" || call.name != "ordinal") return@mapNotNull null
        val registers = read as TwoRegisterInstruction
        if ((asked as FiveRegisterInstruction).registerC != registers.registerA) return@mapNotNull null
        val parameter = parameters[registers.registerB] ?: return@mapNotNull null
        Triple(at, parameter, field)
    }
    val (at, parameter, field) = reads.singleOrNull()
        ?: throw PatchException("$what reads its line's type off a parameter ${reads.size} time(s), not once")
    if (method.parameterTypes[parameter].toString() != field.definingClass) {
        throw PatchException("$what reads ${field.definingClass}->${field.name} off a parameter of another type")
    }
    method.requireParameterIntact(what, parameter, listOf(at))
    val named = classDefBy(field.type).methods.filter { it.name == "<clinit>" }.flatMap { initializer ->
        initializer.implementation?.instructions?.toList().orEmpty().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    }.toSet()
    val missing = SOCIAL_CONTEXT_TYPES.filter { it !in named }
    if (missing.isNotEmpty()) throw PatchException("$what reads a type, ${field.type}, that doesn't name $missing")
    return SocialContextType(parameter, "${field.definingClass}->${field.name}:${field.type}")
}

/**
 * Has the social context check answer yes, leave it out, for a line about friends' activity. On 449
 * the check reads the line on every way through, and the line comes from a factory that never
 * answers null, so reading it first adds no failure of its own.
 */
private fun BytecodePatchContext.hideFriendsSocialContext(found: Method, line: SocialContextType) {
    val method = mutable(found)
    method.requireLocals(PATCH, 1)
    method.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, ${method.parameterRegister(line.parameter)}
            iget-object v0, v0, ${line.field}
            invoke-static { v0 }, $HIDE_SOCIAL_CONTEXT
            move-result v0
            if-eqz v0, :check
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("check", method.getInstruction(0)),
    )
}

/** A render takes one component scope and answers an object; the check is static and answers a boolean. */
private fun requireShape(part: ReelPart, method: Method) {
    val static = AccessFlags.STATIC.isSet(method.accessFlags)
    val problem = when {
        method.implementation == null -> "has no body"
        part.check && (!static || method.returnType != "Z") -> "is not a static check answering a boolean"
        !part.check && (static || method.parameterTypes.size != 1 || !method.returnType.startsWith("L")) ->
            "is not a render taking one scope and answering a component"
        else -> null
    } ?: return
    throw PatchException("$PATCH: ${method.definingClass}->${method.name}, holding the ${part.marker} marker, $problem")
}
