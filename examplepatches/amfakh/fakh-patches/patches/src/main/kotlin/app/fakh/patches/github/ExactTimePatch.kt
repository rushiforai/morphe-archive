/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.EXACT_TIME as EXACT_TIME_SWITCH
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

private const val EXACT_TIME = "Lapp/fakh/extension/github/ExactTime;"

private const val CONTEXT = "Landroid/content/Context;"

private const val TIME = "Ljava/time/ZonedDateTime;"

/** The age of a moment as the app words it: `(context, time, with "ago", short form)`. */
private object RelativeTimeFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(CONTEXT, TIME, "Z", "Z"),
)

@Suppress("unused")
val showExactTimePatch = patch(
    name = "Show exact time",
    description = "Shows dates and times instead of ages such as 20d, in lists, issues, pull requests and comments.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(EXACT_TIME_SWITCH)

        val relative = RelativeTimeFingerprint.matchAll().singleOrNull()?.method
            ?: throw PatchException("The app's relative time formatter is not one method")
        // The same class words the age a second way, always with "ago", for a few headers.
        val ago = mutableClassDefBy(relative.definingClass).methods.singleOrNull {
            it.returnType == "Ljava/lang/String;" && it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, TIME)
        } ?: throw PatchException("The app's second relative time formatter not found")

        // The second formatter has no short form.
        listOf(relative to "move/from16 v2, p3", ago to "const/4 v2, 0x0").forEach { (method, brief) ->
            val implementation = method.implementation!!
            // v0 to v2 must be locals: at the start of the method they hold nothing yet.
            if (implementation.registerCount - method.parameterTypes.size < 3) {
                throw PatchException("Too few registers in ${method.definingClass}->${method.name}")
            }
            method.addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p1
                    $brief
                    invoke-static { v0, v1, v2 }, $EXACT_TIME->format($CONTEXT${TIME}Z)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :keep
                    return-object v0
                """,
                ExternalLabel("keep", method.getInstruction(0)),
            )
        }
    }
}
