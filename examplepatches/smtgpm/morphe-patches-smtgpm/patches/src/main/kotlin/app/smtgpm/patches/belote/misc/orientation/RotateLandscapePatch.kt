/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.misc.orientation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.resignFixPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val GAME_ACTIVITY = "Lcom/gameduell/mobile/belote/plugin/BeloteActivity;"

/** android.content.pm.ActivityInfo screen orientations. */
private const val SCREEN_ORIENTATION_LANDSCAPE = 0
private const val SCREEN_ORIENTATION_SENSOR_LANDSCAPE = 6
private const val SCREEN_ORIENTATION_REVERSE_LANDSCAPE = 8

/**
 * The manifest allows both landscape directions, but the Unity engine requests one fixed
 * landscape at startup through Activity.setRequestedOrientation (from native code, over JNI).
 * Overriding that method in the game's activity turns any fixed landscape request into
 * SENSOR_LANDSCAPE, so the game follows the phone in both landscape directions.
 */
@Suppress("unused")
val rotateLandscapePatch = bytecodePatch(
    name = "Rotate in both landscape directions",
    description = "The game turns with the phone when it is held upside down in landscape.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch)

    execute {
        val activity = mutableClassDefBy(GAME_ACTIVITY)
        if (activity.methods.any { it.name == "setRequestedOrientation" }) {
            throw PatchException("BeloteActivity already overrides setRequestedOrientation")
        }

        activity.methods.add(
            ImmutableMethod(
                activity.type,
                "setRequestedOrientation",
                listOf(ImmutableMethodParameter("I", emptySet(), "requestedOrientation")),
                "V",
                AccessFlags.PUBLIC.value,
                emptySet(),
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        const/4 v0, $SCREEN_ORIENTATION_LANDSCAPE
                        if-eq p1, v0, :landscape
                        const/16 v0, $SCREEN_ORIENTATION_REVERSE_LANDSCAPE
                        if-ne p1, v0, :request
                        :landscape
                        const/4 p1, $SCREEN_ORIENTATION_SENSOR_LANDSCAPE
                        :request
                        invoke-super { p0, p1 }, ${activity.superclass}->setRequestedOrientation(I)V
                        return-void
                    """,
                )
            },
        )
    }
}
