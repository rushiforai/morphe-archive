/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.postprompts

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.classDefForEachReferencing
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/*
 * The reaction faces in the corner of a comment bubble (#158). Read from 583, 2026-10-18, arm64 and
 * armv7; the obfuscated names here are for reviewers, the code never writes one down.
 *
 * Comments draw them with the same FDSInlineReactions component a post's button row uses, so one
 * Drawable (arm64 LX/3Ed;) paints both and the post switch alone would hide both. The comment
 * component (arm64 LX/SGh;) is the class whose static initializer loads "FDSComment" and whose
 * render loads "inline_reaction_transition_key". It builds its own FDSInlineReactions. The Drawable
 * is built later, by a lambda (arm64 LX/40q;) that holds that component, so the surface is carried
 * along:
 * - A boolean field is added to the component and to the Drawable.
 * - Right after the comment component's constructor call for the FDSInlineReactions, an added static
 *   method on the component sets its flag.
 * - Right after the lambda gets the Drawable from the factory, an added static method on the Drawable
 *   copies the component's flag onto it (and does nothing for a null Drawable).
 * - The Drawable's draw asks the extension with its flag, so each surface answers to its own switch.
 * The other caller of the factory (arm64 LX/cP4;->A0Q) reads no FDSInlineReactions, so it never gets
 * the flag and stays a post's.
 *
 * Facebook's newer flat comment row ("Reply, faces and count, thumbs up, thumbs down") isn't an
 * FDSComment. Its reactions count button (arm64 LX/4w0;, armv7 LX/4wP;) builds its own
 * FDSInlineReactions and is the one builder of it that a method taking a GraphQLComment returns
 * (arm64 LX/XlN;->A00, armv7 LX/XRt;->A00), so its constructions are marked the same way.
 */

internal const val COMMENT_COMPONENT_NAME = "FDSComment"
internal const val COMMENT_REACTION_KEY = "inline_reaction_transition_key"
internal const val COMMENT_FLAG = "hushCommentFaces"
internal const val COMMENT_MARK = "hushMarkCommentFaces"
internal const val COMMENT_COPY = "hushCopyCommentFaces"
internal const val HIDE_FACEPILE = "$POST_PROMPTS->hideReactionPreview(Z)Z"
internal const val GRAPHQL_COMMENT = "Lcom/facebook/graphql/model/GraphQLComment;"

/** Whether [method] takes a GraphQLComment, which is how the comment row's builder is told apart. */
internal fun takesComment(method: Method): Boolean =
    method.parameterTypes.any { it.toString() == GRAPHQL_COMMENT }

/** The smali that asks the extension about the facepile Drawable's own surface, answering in v0. */
internal fun facepileAsk(facepile: String): String =
    "iget-boolean v0, p0, $facepile->$COMMENT_FLAG:Z\n" +
        "invoke-static { v0 }, $HIDE_FACEPILE"

internal fun isCommentComponent(classDef: ClassDef): Boolean =
    classDef.methods.any { holdsString(it, COMMENT_COMPONENT_NAME) } &&
        classDef.methods.any { holdsString(it, COMMENT_REACTION_KEY) }

/** The comment component: the one class holding both of its kept strings. */
internal fun BytecodePatchContext.findCommentComponent(): ClassDef {
    val found = classDefByStrings(COMMENT_REACTION_KEY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_PACKAGE) }.distinctBy { it.type }
        .filter(::isCommentComponent)
    return found.singleOrNull() ?: throw PatchException(
        "$PATCH: expected one class holding \"$COMMENT_COMPONENT_NAME\" and \"$COMMENT_REACTION_KEY\", found ${found.size}",
    )
}

private fun MethodReference.sameCall(other: MethodReference): Boolean =
    definingClass == other.definingClass && name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

private fun constructedRegister(instruction: Instruction): Int? = when (instruction) {
    is RegisterRangeInstruction -> instruction.startRegister
    is FiveRegisterInstruction -> instruction.registerC
    else -> null
}

/**
 * Where [method] constructs [component]: the index just after each constructor call and the register
 * holding the new object.
 */
internal fun componentConstructions(method: Method, component: String): List<Pair<Int, Int>> {
    val found = mutableListOf<Pair<Int, Int>>()
    method.implementation?.instructions?.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) return@forEachIndexed
        val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
        if (reference.name != "<init>" || reference.definingClass != component) return@forEachIndexed
        constructedRegister(instruction)?.let { found += index + 1 to it }
    }
    return found
}

/** A call of the factory: the index after its move-result-object, the Drawable's register and the component's. */
internal data class FaceCaller(val method: Method, val afterIndex: Int, val drawable: Int, val component: Int)

/**
 * [method]'s call of [factory] if its result is taken with move-result-object and a register that
 * holds an instance of [component] (a field of it is read from that register earlier and the
 * register isn't written in between) is there to pair it with. Null for anything else.
 */
internal fun faceCaller(method: Method, factory: MethodReference, component: String): FaceCaller? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val call = code.indexOfFirst {
        (it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ((it as ReferenceInstruction).reference as? MethodReference)?.sameCall(factory) == true
    }
    if (call < 0 || call + 1 >= code.size || code[call + 1].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val read = code.subList(0, call).indexOfLast {
        it is TwoRegisterInstruction && it is ReferenceInstruction &&
            (it.reference as? FieldReference)?.definingClass == component && it.opcode.name.startsWith("iget")
    }
    if (read < 0) return null
    val register = (code[read] as TwoRegisterInstruction).registerB
    val overwritten = code.subList(read + 1, call).any {
        it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == register
    }
    if (overwritten) return null
    return FaceCaller(method, call + 2, (code[call + 1] as OneRegisterInstruction).registerA, register)
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/**
 * Adds the two flags and their two helpers, and calls them where the comment component and the comment
 * row's button build their FDSInlineReactions and where the lambda turns it into the Drawable. [component] is
 * FDSInlineReactions, [facepile] the Drawable its factory builds, [factory] that factory.
 */
internal fun BytecodePatchContext.tagCommentFaces(component: ClassDef, facepile: ClassDef, factory: MethodReference) {
    val comment = findCommentComponent()
    val constructions = comment.methods.mapNotNull { method ->
        componentConstructions(method, component.type).takeIf { it.isNotEmpty() }?.let { method to it }
    }
    if (constructions.isEmpty()) refuse("${comment.type} doesn't construct ${component.type}")

    val callers = mutableListOf<FaceCaller>()
    val builders = mutableMapOf<String, List<Pair<Method, List<Pair<Int, Int>>>>>()
    val commentReturns = mutableSetOf<String>()
    // A face caller reads a field of the component and a builder constructs it. A method taking a
    // comment names its type.
    classDefForEachReferencing(types = listOf(component.type, GRAPHQL_COMMENT)) { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE) || classDef.type == component.type) return@classDefForEachReferencing
        for (method in classDef.methods) {
            faceCaller(method, factory, component.type)?.let { callers += it }
            if (takesComment(method)) commentReturns += method.returnType
        }
        if (classDef.type == comment.type) return@classDefForEachReferencing
        val sites = classDef.methods.mapNotNull { method ->
            componentConstructions(method, component.type).takeIf { it.isNotEmpty() }?.let { method to it }
        }
        if (sites.isNotEmpty()) builders[classDef.type] = sites
    }
    val caller = callers.singleOrNull() ?: refuse(
        "expected one method that takes ${factory.name}'s Drawable beside a ${component.type}, found ${callers.size}",
    )
    if (caller.drawable > 15 || caller.component > 15) refuse("${caller.method.name}'s registers are past v15")
    val rows = builders.keys.filter { it in commentReturns }
    val row = rows.singleOrNull() ?: refuse(
        "expected one ${component.type} builder that a method taking a GraphQLComment returns, found $rows",
    )

    val componentClass = mutableClassDefBy(component.type)
    val facepileClass = mutableClassDefBy(facepile.type)
    for (target in listOf(componentClass, facepileClass)) {
        if (target.fields.any { it.name == COMMENT_FLAG }) refuse("${target.type} already has $COMMENT_FLAG")
        target.instanceFields.add(
            ImmutableField(target.type, COMMENT_FLAG, "Z", AccessFlags.PUBLIC.value, null, null, null).toMutable(),
        )
    }

    // One local (v0), then the parameters.
    componentClass.methods.add(
        ImmutableMethod(
            component.type, COMMENT_MARK, listOf(ImmutableMethodParameter(component.type, null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    iput-boolean v0, p0, ${component.type}->$COMMENT_FLAG:Z
                    return-void
                """,
            )
        },
    )
    facepileClass.methods.add(
        ImmutableMethod(
            facepile.type, COMMENT_COPY,
            listOf(facepile.type, component.type).map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    if-eqz p0, :facebooks_none
                    iget-boolean v0, p1, ${component.type}->$COMMENT_FLAG:Z
                    iput-boolean v0, p0, ${facepile.type}->$COMMENT_FLAG:Z
                    :facebooks_none
                    return-void
                """,
            )
        },
    )

    for ((type, marked) in listOf(comment.type to constructions, row to builders.getValue(row))) {
        val markedClass = mutableClassDefBy(type)
        for ((method, sites) in marked) {
            val mutable = markedClass.methods.first { it.name == method.name && it.parameterTypes == method.parameterTypes }
            // Later sites first, so the earlier ones stay where they were found.
            for ((index, register) in sites.sortedByDescending { it.first }) {
                mutable.addInstructions(
                    index,
                    "invoke-static/range { v$register .. v$register }, ${component.type}->$COMMENT_MARK(${component.type})V",
                )
            }
        }
    }
    mutableClassDefBy(caller.method.definingClass).methods
        .first { it.name == caller.method.name && it.parameterTypes == caller.method.parameterTypes }
        .addInstructions(
            caller.afterIndex,
            "invoke-static { v${caller.drawable}, v${caller.component} }, " +
                "${facepile.type}->$COMMENT_COPY(${facepile.type}${component.type})V",
        )
}
