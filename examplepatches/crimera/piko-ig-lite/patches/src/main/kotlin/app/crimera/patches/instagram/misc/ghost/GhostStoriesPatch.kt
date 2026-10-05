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
import app.crimera.patches.instagram.misc.downloads.USER_SESSION_DESCRIPTOR
import app.crimera.patches.instagram.misc.downloads.methodRef
import app.crimera.patches.instagram.misc.downloads.parameterBlock
import app.crimera.patches.instagram.misc.downloads.parameterRegisterStart
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.instagram.utils.Constants.GHOST_DESCRIPTOR
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val HIDE_STORY_VIEWS = "$GHOST_DESCRIPTOR/GhostStories;->hideStoryViews()Z"

/** The path of the request that tells Instagram which stories were watched. */
private const val STORY_SEEN_ENDPOINT = "media/seen/"

/**
 * Stops Instagram from telling the author that their story was watched.
 *
 * Watching a story only records it locally: the viewer queues each story it showed in a pending seen
 * state, and one builder turns that state into the `media/seen/` request. Every recorder (the release
 * has one or two) writes into the state that builder reads, so the builder is the single place that
 * covers all of them, including states restored from disk. The hook empties the queued seen state
 * through the state's own clear method before the request body is assembled, so the request goes out
 * without any watched story. The local seen ring is updated by the viewer itself and is untouched.
 *
 * Every obfuscated member is resolved by behavior:
 *  - the builder is the only method taking a `UserSession` that holds the `media/seen/` endpoint,
 *  - the clear method is the state's only non-constructor instance method that takes nothing, returns
 *    nothing and clears three collections.
 */
@Suppress("unused")
val ghostStoriesPatch =
    bytecodePatch(
        description = "Stops Instagram from marking stories you watch as seen.",
    ) {
        dependsOn(sharedExtensionPatch)

        instagramToggle(
            id = "instagram.ghost.stories",
            category = Categories.GHOST,
            strings = settingStrings("piko_ig_ghost_stories"),
            order = 100,
            defaultValue = false,
        )

        execute {
            hideStorySeenRequest()
        }
    }

context(patchContext: BytecodePatchContext)
private fun hideStorySeenRequest() {
    val builder =
        requireExactlyOne(
            "story seen request builder",
            Fingerprint(
                parameters = listOf(USER_SESSION_DESCRIPTOR),
                filters = listOf(string(STORY_SEEN_ENDPOINT, StringComparisonType.CONTAINS)),
            ).matchAll(),
            describe = { match -> match.originalMethod.toString() },
        )
    val stateType = builder.classDef.type
    val clearState = pendingStateClearMethod(builder.classDef.methods, stateType)

    val stateRegister = builder.method.parameterRegisterStart()
    builder.method.insertHook(
        index = 0,
        excludedRegisters = builder.method.parameterBlock(),
        relocateBranchTargets = true,
    ) {
        val enabled = scratchRegister()
        invokeStatic(methodReference(HIDE_STORY_VIEWS))
        moveResult(enabled, "Z")
        ifEqz(enabled, Target.Original)

        // The builder keeps `this` in a high register, which 4-bit `invoke` cannot address.
        val state = scratchRegister()
        move(state, stateRegister, stateType)
        invokeVirtual(methodReference("$stateType->${clearState.name}()V"), state)
    }
}

/**
 * The method that empties the pending seen state: the reels, the nuxes and the forced story ids live in
 * three collections, so it is the only parameterless instance method that clears three of them.
 */
private fun pendingStateClearMethod(
    methods: Iterable<Method>,
    stateType: String,
): Method =
    requireExactlyOne(
        "pending seen state clear method on $stateType",
        methods.filter { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                !AccessFlags.CONSTRUCTOR.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypes.isEmpty() &&
                method.implementation
                    ?.instructions
                    ?.toList()
                    .orEmpty()
                    .count { instruction ->
                        instruction.methodRef()?.let { it.name == "clear" && it.parameterTypes.isEmpty() } == true
                    } == 3
        },
        describe = { method -> method.toString() },
    )
