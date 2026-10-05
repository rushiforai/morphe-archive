/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.ghost

import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.misc.downloads.INTEGER_DESCRIPTOR
import app.crimera.patches.instagram.misc.downloads.methodRef
import app.crimera.patches.instagram.misc.downloads.parameterBlock
import app.crimera.patches.instagram.misc.downloads.registerOfParameterIndex
import app.crimera.patches.instagram.misc.downloads.sameSignatureAs
import app.crimera.patches.instagram.misc.downloads.toMutable
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.instagram.utils.Constants.GHOST_DESCRIPTOR
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val HIDE_MESSAGE_VIEWS = "$GHOST_DESCRIPTOR/GhostMessages;->hideMessageViews()Z"

/** Disappearing photos and videos: the batched and the single-item seen requests. */
private const val VISUAL_ITEM_SEEN_BATCH = "direct_v2/visual_threads/%s/item_seen/"
private const val VISUAL_ITEM_SEEN = "direct_v2/visual_threads/%s/visual_items/%s/seen/"

/** Opening a thread tells the sender their message was seen, through this GraphQL mutation. */
private const val DIRECT_ITEM_SEEN_MUTATION = "IGDirectItemSeenMutation"

/**
 * Stops Instagram from telling the sender that a message was seen.
 *
 * Direct sends nothing from the UI. A viewed message becomes a queued mutation, and a mutation handler
 * (one class per mutation type, all sharing the shape `(context, callback, mutation) -> void`) performs
 * the request and then reports the mutation finished by calling a static `(context, Integer)` completer.
 * Skipping the request alone would leave the mutation queued and retried forever, so the hook does what
 * the handler's tail does and nothing else: when the toggle is on it completes the mutation with the
 * handler's own completer and result constant and returns.
 *
 * Three mutation types report a message as seen:
 *  - the batched `item_seen` request for disappearing media,
 *  - the single `visual_items/.../seen/` request for the same media,
 *  - the thread seen marker, which is the `IGDirectItemSeenMutation`.
 *
 * The first two build their request in the handler. Depending on the release the third builds it in the
 * handler or in a static helper the handler calls, so a match that is not handler-shaped is walked to its
 * single handler caller. Typing and read receipts of the inbox list are other mutation types and untouched.
 */
@Suppress("unused")
val ghostMessagesPatch =
    bytecodePatch(
        description = "Stops Instagram from marking messages you read as seen.",
    ) {
        dependsOn(sharedExtensionPatch)

        instagramToggle(
            id = "instagram.ghost.messages",
            category = Categories.GHOST,
            strings = settingStrings("piko_ig_ghost_messages"),
            order = 300,
            defaultValue = false,
        )

        execute {
            val handlers = mutableListOf<MutableMethod>()
            handlers += seenHandlers(VISUAL_ITEM_SEEN_BATCH, 1..3)
            handlers += seenHandlers(VISUAL_ITEM_SEEN, 1..2)
            handlers += seenHandlers(DIRECT_ITEM_SEEN_MUTATION, 1..2)

            handlers.distinctBy { it.toString() }.forEach(::completeInsteadOfSending)
        }
    }

/** `(context, callback, mutation) -> void`, the entry point of a mutation handler. */
private fun Method.isMutationHandler(): Boolean =
    !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes.size == 3

/** The handlers that contain [anchor], resolving a match inside a helper to the handler calling it. */
context(patchContext: BytecodePatchContext)
private fun seenHandlers(
    anchor: String,
    expected: IntRange,
): List<MutableMethod> =
    Fingerprint(filters = listOf(string(anchor))).matchAll(expected).flatMap { match ->
        val method = match.originalMethod
        if (method.isMutationHandler()) {
            listOf(match.method)
        } else {
            listOf(handlerCalling(method, anchor))
        }
    }

context(patchContext: BytecodePatchContext)
private fun handlerCalling(
    helper: Method,
    anchor: String,
): MutableMethod {
    val callers = mutableListOf<Method>()
    patchContext.classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (!method.isMutationHandler()) return@forEach
            val calls =
                method.implementation
                    ?.instructions
                    ?.toList()
                    .orEmpty()
                    .any { instruction ->
                        instruction.methodRef()?.let { reference ->
                            reference.definingClass == helper.definingClass && reference.sameSignatureAs(helper)
                        } == true
                    }
            if (calls) callers.add(method)
        }
    }
    return requireExactlyOne(
        "mutation handler calling the \"$anchor\" helper $helper",
        callers,
        describe = { method -> method.toString() },
    ).toMutable("mutation handler of \"$anchor\"")
}

/** Makes [handler] complete its mutation without sending the request when the toggle is on. */
private fun completeInsteadOfSending(handler: MutableMethod) {
    val contextType = handler.parameterTypes[0].toString()
    val instructions = handler.implementation?.instructions?.toList().orEmpty()

    // The tail of every handler is `completer(context, RESULT)`; both pieces come from the handler itself.
    val completer =
        requireExactlyOne(
            "mutation completer of $handler",
            instructions
                .mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) {
                        return@mapNotNull null
                    }
                    instruction.methodRef()?.takeIf {
                        it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf(contextType, INTEGER_DESCRIPTOR)
                    }
                }.distinctBy { it.toString() },
        )
    val result =
        requireExactlyOne(
            "mutation result constant of $handler",
            instructions
                .mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
                    instruction.getReference<FieldReference>()?.takeIf { it.type == INTEGER_DESCRIPTOR }
                }.distinctBy { it.toString() },
        )

    val contextRegister = handler.registerOfParameterIndex(0)
    handler.insertHook(
        index = 0,
        excludedRegisters = handler.parameterBlock(),
        relocateBranchTargets = true,
    ) {
        val enabled = scratchRegister()
        invokeStatic(methodReference(HIDE_MESSAGE_VIEWS))
        moveResult(enabled, "Z")
        ifEqz(enabled, Target.Original)

        // The handler keeps its arguments in high registers, which 4-bit `invoke` cannot address.
        val context = scratchRegister()
        move(context, contextRegister, contextType)
        val done = scratchRegister()
        sget(done, result)
        invokeStatic(methodReference("${completer.definingClass}->${completer.name}($contextType$INTEGER_DESCRIPTOR)V"), context, done)
        returnVoid()
    }
}
