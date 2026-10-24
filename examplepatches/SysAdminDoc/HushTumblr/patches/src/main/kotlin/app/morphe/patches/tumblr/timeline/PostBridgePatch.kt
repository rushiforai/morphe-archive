/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

// Shared by every post patch, so its messages name the bridge rather than one of them.
private const val PATCH = "Post bridge"

/** Tumblr's post, the trail entry of a reblog and a text block. Model classes, so R8 keeps their names. */
internal const val POST = "Lcom/tumblr/rumblr/model/post/Post;"
internal const val REBLOG_TRAIL = "Lcom/tumblr/rumblr/model/post/ReblogTrail;"
internal const val TEXT_BLOCK = "Lcom/tumblr/rumblr/model/post/blocks/TextBlock;"
internal const val POST_HEADER_CONTEXT = "Lcom/tumblr/rumblr/model/post/PostHeaderContext;"
/** What of your own filters a post matched, the note behind "This post contains filtered content". */
internal const val FILTERED = "Lcom/tumblr/rumblr/model/post/asset/Filtered;"

/** The extension's interfaces the bridge makes them implement. */
internal const val HUSH_POST = "$EXTENSION_PACKAGE/timeline/HushPost;"
internal const val HUSH_TRAIL = "$EXTENSION_PACKAGE/timeline/HushTrail;"
internal const val HUSH_TEXT = "$EXTENSION_PACKAGE/timeline/HushText;"
internal const val HUSH_PAID_POST = "$EXTENSION_PACKAGE/timeline/HushPaidPost;"
internal const val HUSH_FILTERED_POST = "$EXTENSION_PACKAGE/timeline/HushFilteredPost;"
internal const val HUSH_FILTERED = "$EXTENSION_PACKAGE/timeline/HushFiltered;"

private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"

/** Methods every class has. A getter that turns out to be one of them is a wrong match. */
private val OBJECT_METHODS = setOf("hashCode", "equals", "toString", "getClass")

/**
 * One interface method: its name, the JSON key its getter is written under, and what it returns.
 * The getter itself returns [nativeType], which is [returnType] unless the interface hands back
 * one of Tumblr's own models as an object.
 */
internal class BridgeGetter(val name: String, val key: String, val returnType: String, val nativeType: String = returnType)

/** A model class and the extension interface the bridge adds to it. */
internal class ModelBridge(val model: String, val bridge: String, val getters: List<BridgeGetter>) {
    /** Moshi's generated adapter, which Moshi finds by this name, so R8 keeps it. */
    val adapter: String get() = model.removeSuffix(";") + "JsonAdapter;"
}

internal val POST_BRIDGES = listOf(
    ModelBridge(
        POST, HUSH_POST,
        listOf(
            BridgeGetter("hushContent", "content", LIST),
            BridgeGetter("hushTrail", "trail", LIST),
            BridgeGetter("hushTags", "tags", LIST),
            BridgeGetter("hushSummary", "summary", STRING),
            BridgeGetter("hushRebloggedFrom", "reblogged_from_id", STRING),
        ),
    ),
    ModelBridge(REBLOG_TRAIL, HUSH_TRAIL, listOf(BridgeGetter("hushContent", "content", LIST))),
    ModelBridge(TEXT_BLOCK, HUSH_TEXT, listOf(BridgeGetter("hushText", "text", STRING))),
)

internal val PAID_POST_BRIDGE = ModelBridge(
    POST, HUSH_PAID_POST,
    listOf(
        BridgeGetter("hushHeaderIcon", "header_context", STRING),
        BridgeGetter("hushFollowed", "followed", "Z"),
        BridgeGetter("hushCanEdit", "can_edit", "Z"),
        BridgeGetter("hushPaidContextKnown", "", "Z"),
    ),
)

/** Post's note on what of your filters it matched, and that note's two lists. */
internal val FILTERED_POST_BRIDGES = listOf(
    ModelBridge(POST, HUSH_FILTERED_POST, listOf(BridgeGetter("hushFiltered", "filtered", OBJECT, FILTERED))),
    ModelBridge(
        FILTERED, HUSH_FILTERED,
        listOf(BridgeGetter("hushFilteredTags", "tags", LIST), BridgeGetter("hushFilteredContent", "content", LIST)),
    ),
)

/** A bridge found in this build: each interface method with the getter it calls, `Lclass;->name()type`. */
internal class ResolvedBridge(val bridge: ModelBridge, val calls: Map<BridgeGetter, String>)

/**
 * Makes Tumblr's `Post`, `ReblogTrail` and `TextBlock` implement the extension's `HushPost`,
 * `HushTrail` and `HushText`, each added method calling the model's own getter, so the post rules
 * in `PostRules` can read a post's blocks, trail, tags, summary and where it was reblogged from.
 * It has no switch or name of its own: each post patch depends on it.
 *
 * The getters' names change with every build, so each is read from the model's Moshi adapter,
 * whose `toJson` writes every field the same way: `const-string` with the key, then the getter's
 * call on the model. Found by reading Tumblr 46.5.0.109 (2026-10-11): Post's content is `K()`,
 * trail `B0()`, tags `j1()`, summary `f1()` and reblogged_from_id `G0()`; ReblogTrail's content is
 * `e()`; TextBlock's text is `q()`.
 */
internal val postBridgePatch = bytecodePatch {
    dependsOn(tumblrExtensionPatch)

    execute {
        // Every getter is found before the first class changes, so a refusal leaves the APK as it was.
        val resolved = resolvePostBridges()
        resolved.forEach { addBridge(it) }
    }
}

/**
 * Hide ads reads the server's structured header icon without inspecting its localized label.
 * The post's followed and can_edit fields protect followed-blog and own-blog Blaze posts. The
 * generic is_blazed flag says nothing about placement and is deliberately not bridged.
 */
internal val paidPostBridgePatch = bytecodePatch {
    dependsOn(tumblrExtensionPatch, postJsonPresencePatch)

    execute {
        requireBridgeInterface(PAID_POST_BRIDGE)
        val direct = PAID_POST_BRIDGE.getters.filter { it.name in setOf("hushFollowed", "hushCanEdit") }
            .associateWith { resolveGetter(POST, it) }
        val header = resolveGetter(POST, BridgeGetter("hushHeaderIcon", "header_context", POST_HEADER_CONTEXT))
        val icon = resolveGetter(POST_HEADER_CONTEXT, BridgeGetter("hushHeaderIcon", "icon", STRING))
        addBridge(ResolvedBridge(PAID_POST_BRIDGE, direct))
        mutableClassDefBy(POST).methods.add(ImmutableMethod(
            POST, "hushPaidContextKnown", emptyList(), "Z", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(2),
        ).toMutable().apply { addInstructions(0, """
            iget-boolean v0, p0, $POST_PAID_KNOWN
            return v0
        """) })
        mutableClassDefBy(POST).methods.add(
            ImmutableMethod(
                POST, "hushHeaderIcon", emptyList(), STRING, AccessFlags.PUBLIC.value,
                null, null, MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-virtual { p0 }, $header
                        move-result-object v0
                        if-eqz v0, :absent
                        invoke-virtual { v0 }, $icon
                        move-result-object v0
                        return-object v0
                        :absent
                        const/4 v0, 0x0
                        return-object v0
                    """,
                )
            },
        )
    }
}

/**
 * Makes Tumblr's `Post` implement the extension's `HushFilteredPost` and its `Filtered` note
 * `HushFiltered`, so Hide filtered posts can tell which posts Tumblr would cover for your
 * filtered tags and words. Found by reading Tumblr 46.8.1.100 (2026-10-23): Post's filtered is
 * `c0()`, and Filtered's tags are `b()` and its content `a()`.
 */
internal val filteredPostBridgePatch = bytecodePatch {
    dependsOn(tumblrExtensionPatch)

    execute {
        resolveBridges(FILTERED_POST_BRIDGES).forEach { addBridge(it) }
    }
}

/** Each of [POST_BRIDGES] resolved, throwing for the first model, adapter or getter this build lacks. */
internal fun BytecodePatchContext.resolvePostBridges(): List<ResolvedBridge> = resolveBridges(POST_BRIDGES)

/** Each of [bridges] resolved before any class changes, throwing for the first piece this build lacks. */
internal fun BytecodePatchContext.resolveBridges(bridges: List<ModelBridge>): List<ResolvedBridge> = bridges.map { bridge ->
    requireBridgeInterface(bridge)
    ResolvedBridge(bridge, bridge.getters.associateWith { resolveGetter(bridge.model, it) })
}

/** A model's public getter, located by the JSON key in its generated adapter. */
private fun BytecodePatchContext.resolveGetter(type: String, getter: BridgeGetter): String {
    val model = classDefByOrNull(type) ?: throw PatchException("$PATCH: Tumblr's $type wasn't found")
    val adapterType = type.removeSuffix(";") + "JsonAdapter;"
    val adapter = classDefByOrNull(adapterType) ?: throw PatchException("$PATCH: Tumblr's $adapterType wasn't found")
    val toJson = adapter.methods.singleOrNull { it.name == "toJson" && it.parameterTypes.size == 2 && it.returnType == "V" }
        ?: throw PatchException("$PATCH: $adapterType has no single toJson")
    val body = toJson.instructionList()
    if (model.methods.any { it.name == getter.name && it.parameterTypes.isEmpty() }) {
        throw PatchException("$PATCH: $type already has a method named ${getter.name}")
    }
    val key = body.indexOfFirst { it.stringRef() == getter.key }
    if (key < 0) throw PatchException("$PATCH: $adapterType doesn't write \"${getter.key}\"")
    val call = body.drop(key + 1).takeWhile { it.stringRef() == null }.firstNotNullOfOrNull { instruction ->
        instruction.methodRef()?.takeIf { instruction.opcode == Opcode.INVOKE_VIRTUAL && it.definingClass == type }
    } ?: throw PatchException("$PATCH: no call on $type follows \"${getter.key}\"")
    val declared = model.methods.any {
        it.name == call.name && it.parameterTypes.isEmpty() && it.returnType == getter.nativeType && !it.isStatic() &&
            AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    if (call.name in OBJECT_METHODS || call.parameterTypes.isNotEmpty() || call.returnType != getter.nativeType || !declared) {
        throw PatchException("$PATCH: $type->${call.name} isn't a public getter of ${getter.nativeType}")
    }
    return "$type->${call.name}()${getter.nativeType}"
}

/** Throws unless the extension has [bridge]'s interface declaring exactly its getters. */
private fun BytecodePatchContext.requireBridgeInterface(bridge: ModelBridge) {
    val type = classDefByOrNull(bridge.bridge)
    val declares = type != null && AccessFlags.INTERFACE.isSet(type.accessFlags) &&
        type.methods.count { AccessFlags.ABSTRACT.isSet(it.accessFlags) } == bridge.getters.size &&
        bridge.getters.all { getter ->
            type.methods.any { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == getter.returnType }
        }
    if (!declares) {
        throw PatchException("$PATCH: the extension has no ${bridge.bridge} declaring ${bridge.getters.joinToString { it.name }}")
    }
}

/** Adds [resolved]'s interface to its model, and one method per getter that calls it. */
private fun BytecodePatchContext.addBridge(resolved: ResolvedBridge) {
    val bridge = resolved.bridge
    val model = mutableClassDefBy(bridge.model)
    if (bridge.bridge !in model.interfaces) model.interfaces.add(bridge.bridge)
    resolved.calls.forEach { (getter, call) ->
        val objectResult = getter.returnType.startsWith("L") || getter.returnType.startsWith("[")
        val move = if (objectResult) "move-result-object" else "move-result"
        val result = if (objectResult) "return-object" else "return"
        model.methods.add(
            ImmutableMethod(
                bridge.model, getter.name, emptyList(), getter.returnType, AccessFlags.PUBLIC.value,
                null, null, MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-virtual { p0 }, $call
                        $move v0
                        $result v0
                    """,
                )
            },
        )
    }
}
