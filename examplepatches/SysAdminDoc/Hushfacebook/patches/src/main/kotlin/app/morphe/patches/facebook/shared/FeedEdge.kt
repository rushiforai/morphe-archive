/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/shared/FeedEdge.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: the category is handed to the extension, which reads
 * the constant's name, so the SPONSORED field lookup in <clinit> is gone. The funnel's whole shape
 * is pinned and has to match exactly once, and each getter names what it could not find.
 */
package app.morphe.patches.facebook.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.extension.requireParameterIntact
import app.morphe.patches.facebook.misc.extension.requireThisIntact
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Kept GraphQL model class — Redex never renames it. */
internal const val FEED_UNIT_EDGE = "Lcom/facebook/graphql/model/GraphQLFeedUnitEdge;"

/** Kept enum class. Its fields are renamed; its constant names survive in `<clinit>`. */
internal const val FEED_STORY_CATEGORY =
    "Lcom/crossapp/graphql/facebook/enums/GraphQLFeedStoryCategory;"

/** Kept Guava class: the builder the feed collects its edges into. */
private const val IMMUTABLE_LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"

/** The funnel as a refusal names it. */
private const val FEED_FUNNEL = "addNewEdgeToCollection(ImmutableList\$Builder, GraphQLFeedUnitEdge, object)Z"

/**
 * `FeedUnitCollectionManager.addNewEdgeToCollection` — the single funnel every news-feed edge
 * passes through into the `FeedUnitCollection`. Redex keeps the method name, and on both builds one
 * method in all the dex files carries it.
 *
 * The whole shape is pinned, not the name alone: the builder the feed collects into, the edge, and
 * one more object whose class Redex renames every build (`"L"` takes any object type). A name and a
 * return type would also take an overload, or another collection's method of the same name, and
 * the patcher's lookup hands back the first method that fits without looking for a second. So the
 * guard asks [addNewEdgeToCollection] for it, which takes every match and wants exactly one.
 *
 * Returning false is an outcome the app already handles: it logs "Edge not added to FUC" and the
 * caller carries on.
 */
internal object AddNewEdgeToCollectionFingerprint : Fingerprint(
    name = "addNewEdgeToCollection",
    returnType = "Z",
    parameters = listOf(IMMUTABLE_LIST_BUILDER, FEED_UNIT_EDGE, "L"),
)

/**
 * The one method [AddNewEdgeToCollectionFingerprint] matches.
 *
 * With two, the guard would go on whichever the class walk met first, and every edge through the
 * other would pass unchecked with nothing to say so. A build with none or several stops the patch.
 */
internal fun BytecodePatchContext.addNewEdgeToCollection(): MutableMethod =
    AddNewEdgeToCollectionFingerprint.matchAllOrNull().orEmpty().oneFeedFunnel { it.originalMethod }.method

/**
 * The method that does the funnel's work, where the feed guard goes. Through 582 that's
 * [addNewEdgeToCollection] itself. 583 made it a wrapper that hands the edge to a static method of
 * its own class, and the feed's batch add (`addNewEdgesToCollectionPreferPending`) calls that method
 * directly, so a guard on the wrapper would see none of the batch's edges. 585 keeps the split with
 * a private instance method of the class (`LX/020h;->A0D` on arm64), reached by invoke-direct.
 */
internal fun BytecodePatchContext.feedFunnelBody(): MutableMethod {
    val funnel = addNewEdgeToCollection()
    val body = outlinedFunnelBody(funnel) ?: return funnel
    return mutableClassDefBy(body.definingClass).methods.singleOrNull {
        it.name == body.name && it.returnType == body.returnType &&
            it.parameterTypes.map(CharSequence::toString) == body.parameterTypes.map(CharSequence::toString)
    } ?: throw PatchException("Feed filter: $FEED_FUNNEL hands its edge to $body, which isn't in its class")
}

/**
 * The method of [funnel]'s own class that [funnel] only wraps, or null when [funnel] does the work
 * itself: [funnel] has no branch, makes one call of its class that takes an edge and answers a
 * boolean, passes it its own edge, and returns that answer straight away. 583 outlines a static
 * method. 585 outlines a private instance method instead, called on `this` (invoke-direct), which
 * the feed's batch add calls as well, so a guard on the wrapper would miss that path.
 */
internal fun outlinedFunnelBody(funnel: Method): MethodReference? {
    val code = funnel.implementation?.instructions?.toList() ?: return null
    if (code.any { it is OffsetInstruction || it.opcode == Opcode.THROW }) return null
    val instance = !AccessFlags.STATIC.isSet(funnel.accessFlags)
    val delegates = code.withIndex().mapNotNull { (index, instruction) ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        val static = instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        val direct = instance && (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE)
        if ((static || direct) && call != null && call.definingClass == funnel.definingClass && call.returnType == "Z" &&
            call.parameterTypes.any { it.toString() == FEED_UNIT_EDGE }
        ) index to call else null
    }
    val (at, call) = delegates.singleOrNull() ?: return null
    val result = code.getOrNull(at + 1)
    val returned = code.getOrNull(at + 2)
    if (result?.opcode != Opcode.MOVE_RESULT || returned?.opcode != Opcode.RETURN || at + 2 != code.lastIndex ||
        (result as OneRegisterInstruction).registerA != (returned as OneRegisterInstruction).registerA
    ) return null
    val passedRegisters = argumentRegisters(code[at])
    // An instance body is called on the funnel's own object, which comes first among the arguments.
    val receiver = if (code[at].opcode == Opcode.INVOKE_STATIC || code[at].opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1
    if (receiver == 1 && passedRegisters.firstOrNull() != funnel.localRegisterCount()) return null
    val edge = call.parameterTypes.indexOfFirst { it.toString() == FEED_UNIT_EDGE }
    val passed = passedRegisters.getOrNull(receiver + call.parameterTypes.take(edge).sumOf { it.width() })
    val own = funnel.parameterTypes.indexOfFirst { it.toString() == FEED_UNIT_EDGE }
    if (own < 0 || passed != funnel.parameterRegisterNumber(own)) return null
    // Nothing before the call may write the edge's register (or this), or the body gets something else.
    funnel.requireParameterIntact("Feed filter", own, listOf(at))
    if (receiver == 1) funnel.requireThisIntact("Feed filter", listOf(at))
    return call
}

/** The registers an invoke passes, in order. */
private fun argumentRegisters(invoke: Instruction): List<Int> = when (invoke) {
    is RegisterRangeInstruction -> (invoke.startRegister until invoke.startRegister + invoke.registerCount).toList()
    is FiveRegisterInstruction -> listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF,
        invoke.registerG).take(invoke.registerCount)
    else -> emptyList()
}

private fun CharSequence.width() = if (toString() == "J" || toString() == "D") 2 else 1

/** The only entry of this list, or a refusal naming the method [method] reads out of each entry. */
internal fun <T> List<T>.oneFeedFunnel(method: (T) -> Method): T =
    singleOrNull() ?: throw PatchException(
        "Feed filter: expected exactly one $FEED_FUNNEL, found $size" +
            if (isEmpty()) {
                "."
            } else {
                joinToString(prefix = ": ", postfix = ".") { entry ->
                    method(entry).run { "$definingClass->$name(${parameterTypes.joinToString("")})$returnType" }
                }
            },
    )

/**
 * The only zero-argument accessor on [FEED_UNIT_EDGE] returning the story-category enum (`B8f()`
 * here), selected by return type. It resolves through `getCachedEnum` with a default, so it never
 * returns null.
 */
internal fun BytecodePatchContext.storyCategoryGetter(): String =
    storyCategoryGetterOf(mutableClassDefBy(FEED_UNIT_EDGE).methods).name

/** The [storyCategoryGetter] among [methods], or a refusal saying which accessor is missing or doubled. */
internal fun storyCategoryGetterOf(methods: Iterable<Method>): Method =
    methods.filter { it.returnType == FEED_STORY_CATEGORY && it.parameterTypes.isEmpty() }
        .singleOrPatchException("Feed filter: GraphQLFeedUnitEdge's zero-argument getter returning GraphQLFeedStoryCategory")

/**
 * The [FEED_UNIT_EDGE] accessor returning the edge's feed unit, inflating it if the tree has not
 * materialised it yet (`BQd()` here).
 *
 * Two zero-argument methods return the feed-unit interface — the plain cached getter and this
 * wrapper, which calls it. Pick the wrapper by its `"inflateFeedUnit"` literal; it is what the
 * surrounding code calls anyway, so its cost is already paid.
 */
internal fun BytecodePatchContext.feedUnitGetter(): Method =
    feedUnitGetterOf(mutableClassDefBy(FEED_UNIT_EDGE).methods)

/** The [feedUnitGetter] among [methods], or a refusal saying which accessor is missing or doubled. */
internal fun feedUnitGetterOf(methods: Iterable<Method>): Method =
    methods.filter { method ->
        method.parameterTypes.isEmpty() &&
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "inflateFeedUnit"
            } == true
    }.singleOrPatchException("Feed filter: GraphQLFeedUnitEdge's zero-argument getter holding \"inflateFeedUnit\"")
