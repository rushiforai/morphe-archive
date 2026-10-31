// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

internal const val EXTENSION_PACKAGE = "Lio/github/joancomasfdz/extension/baconreader"

private const val ERROR_DIALOG_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/errors/ErrorDialog;"
private const val LOGGER_CLASS_DESCRIPTOR = "Lapp/morphe/extension/shared/Logger;"

/** The app's Application.onCreate. */
internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/BaconReader;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Loads the shared and BaconReader extensions, passes the application context to them, adds the strings of the
 * patches, and shows the errors of the patches in a dialog. Every patch with extension code depends on it.
 */
internal val sharedExtensionPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch(
            "baconreader",
            activityOnCreateExtensionHook("Lcom/onelouder/baconreader/BaconReader;"),
        ),
        stringsResourcePatch,
    )

    execute {
        // Errors of the patches are shown in a dialog on the screen on top, which the extension follows.
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $ERROR_DIALOG_CLASS_DESCRIPTOR->init(Landroid/app/Application;)V",
        )

        // Also the errors of the shared Morphe code: the dialog instead of a toast.
        mutableClassDefBy(LOGGER_CLASS_DESCRIPTOR).methods.first { method ->
            method.name == "printException" && method.parameterTypes.size == 2
        }.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $ERROR_DIALOG_CLASS_DESCRIPTOR->printException(${LOGGER_CLASS_DESCRIPTOR.dropLast(1)}${'$'}LogMessage;Ljava/lang/Throwable;)V
                return-void
            """,
        )
    }
}
