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
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val PATCH = "Hide blue highlight ring"

/** The view that draws the pulsing blue ring over a button Pinterest is pointing out. It keeps its name. */
internal const val EDUCATION_PULSAR = "Lcom/pinterest/education/view/EducationPulsarView;"

internal const val HIGHLIGHT_RING_HOOK = "$UI_HOOKS->hideHighlightRing()Z"

/**
 * The ring starts invisible. Its one method taking a width, a height and a screen position moves it
 * over the button it points at, then makes it visible and starts the pulse, so stopping there is
 * what keeps it off the screen wherever Pinterest aims it.
 */
internal fun BytecodePatchContext.highlightRingPlacement(): Method {
    val owner = classDefByOrNull(EDUCATION_PULSAR) ?: throw PatchException("$PATCH: $EDUCATION_PULSAR is missing")
    return owner.methods.filter {
        it.returnType == "V" && it.parameters() == listOf("I", "I", "[I") && it.implementation != null &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.one("$PATCH: the method that places the ring")
}

@Suppress("unused")
val hideHighlightRingPatch = bytecodePatch(
    name = PATCH,
    description = "Stops the thick blue ring Pinterest draws over buttons such as Save to point out a feature. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideHighlightRing")
        requireStatusMethod("highlightRing")
        val place = mutable(highlightRingPlacement())
        val answer = place.freeLocalsAt("$PATCH: the ring's placement", 0, 1, listOf(0)).single()
        place.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $HIGHLIGHT_RING_HOOK
                move-result v$answer
                if-eqz v$answer, :hush_place
                return-void
            """,
            ExternalLabel("hush_place", place.getInstruction(0)),
        )
        enableCapability("highlightRing")
        enableStatus("hideHighlightRing")
    }
}
