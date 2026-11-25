/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

internal const val EXPERIMENT_HOOK = "$EXTENSION_PACKAGE/ui/Experiments;->group(Ljava/lang/String;)Ljava/lang/String;"

/** What Pinterest adds to a group it records this phone saw, named only in its group lookup. */
internal const val EXPERIMENT_ACTIVATED = "_activated"

/** Pulling a pin you opened down closes it (#48). */
internal const val PULL_TO_DISMISS_EXPERIMENT = "android_closeup_pull_to_dismiss"

/** Tapping someone else's profile photo opens it full size (#48). */
internal const val PROFILE_PHOTO_EXPERIMENT = "ce_android_enlarge_other_user_profile_pic"

/** Videos play at the largest size Pinterest has instead of its usual cap (#48). */
internal const val VIDEO_SIZE_EXPERIMENT = "android_video_remove_track_selector_max_video_size"

/**
 * Pinterest's one lookup of an experiment's group, an instance `(String, mode, Z)String` and the
 * only method naming [EXPERIMENT_ACTIVATED]. Every experiment check reaches it with the
 * experiment's name first. Nothing is changed here.
 */
internal fun BytecodePatchContext.experimentGroupLookup(): Method {
    val lookup = methodsWithString(EXPERIMENT_ACTIVATED).toList().one("the experiment group lookup")
    val parameters = lookup.parameters()
    if (AccessFlags.STATIC.isSet(lookup.accessFlags) || lookup.returnType != "Ljava/lang/String;" ||
        parameters.size != 3 || parameters[0] != "Ljava/lang/String;" || parameters[2] != "Z"
    ) {
        throw PatchException("The experiment group lookup is no longer an instance (String, mode, Z)String: $lookup")
    }
    return lookup
}

/** An experiment a HushPinterest switch answers for, still read by Pinterest's own code. */
internal fun BytecodePatchContext.requireExperiment(patch: String, experiment: String) {
    if (methodsWithString(experiment).none { !it.definingClass.startsWith(EXTENSION_ROOT) }) {
        throw PatchException("$patch: Pinterest no longer checks $experiment, so the switch would do nothing")
    }
}

/**
 * Asks the extension first in Pinterest's experiment group lookup. A group it answers goes back
 * as the lookup's own answer; null runs the lookup as usual. Shared by the patches that turn on a
 * feature Pinterest keeps behind an experiment.
 */
internal val experimentHookPatch = bytecodePatch {
    dependsOn(pinterestExtensionPatch)

    execute {
        val lookup = mutable(experimentGroupLookup())
        val answer = lookup.freeLocalsAt("Experiment group lookup", 0, 1, highest = 255).single()
        lookup.addInstructionsWithLabels(0, """
            invoke-static/range { p1 .. p1 }, $EXPERIMENT_HOOK
            move-result-object v$answer
            if-eqz v$answer, :hush_pinterest_group
            return-object v$answer
        """, ExternalLabel("hush_pinterest_group", lookup.getInstruction(0)))
    }
}
