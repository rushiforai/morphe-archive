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
import app.crimera.patches.instagram.misc.downloads.OBJECT_DESCRIPTOR
import app.crimera.patches.instagram.misc.downloads.parameterBlock
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.instagram.utils.Constants.GHOST_DESCRIPTOR
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

private const val HIDE_INSTANT_VIEWS = "$GHOST_DESCRIPTOR/GhostInstants;->hideInstantViews()Z"

/** The GraphQL mutation that tells the server which Instants were watched. */
private const val INSTANT_SEEN_MUTATION = "IGQuickSnapUpdateSeenStateMutation"

/**
 * Stops Instagram from telling the author that their Instant was watched.
 *
 * Instants have their own API client, and the seen state is one suspend function of it that sends the
 * `IGQuickSnapUpdateSeenStateMutation` with the watched media ids. It is the only place that writes the
 * seen state, so returning `null` from it at the top sends nothing. Its callers already handle a missing
 * response as a failed update (they skip applying the server state), so the viewer keeps working and the
 * Instant just stays unseen on this device until the toggle is turned off.
 *
 * The method is matched by the mutation name, which is the schema contract; its owner (the API client) and
 * continuation type move between releases.
 */
@Suppress("unused")
val ghostInstantsPatch =
    bytecodePatch(
        description = "Stops Instagram from marking Instants you watch as seen.",
    ) {
        dependsOn(sharedExtensionPatch)

        instagramToggle(
            id = "instagram.ghost.instants",
            category = Categories.GHOST,
            strings = settingStrings("piko_ig_ghost_instants"),
            order = 200,
            defaultValue = false,
        )

        execute {
            blockInstantSeenUpdate()
        }
    }

context(patchContext: BytecodePatchContext)
private fun blockInstantSeenUpdate() {
    val update =
        requireExactlyOne(
            "Instants seen update method",
            Fingerprint(
                returnType = OBJECT_DESCRIPTOR,
                filters = listOf(string(INSTANT_SEEN_MUTATION)),
            ).matchAll(),
            describe = { match -> match.originalMethod.toString() },
        )

    // Read on every update, so the toggle applies to the next batch.
    update.method.insertHook(
        index = 0,
        excludedRegisters = update.method.parameterBlock(),
        relocateBranchTargets = true,
    ) {
        val value = scratchRegister()
        invokeStatic(methodReference(HIDE_INSTANT_VIEWS))
        moveResult(value, "Z")
        ifEqz(value, Target.Original)
        constInt(value, 0)
        returnObject(value)
    }
}
