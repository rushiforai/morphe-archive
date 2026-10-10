/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.shared.misc.initialization

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/InitializationPatch;"

internal fun initializationPatch(
    extensionPatch: Patch<*>
) = bytecodePatch(
    description = "Prompts to restart the app on first load of a clean install",
) {
    dependsOn(extensionPatch)

    execute {
        GlobalConfigGroupFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.last().index

                addInstruction(
                    index,
                    "invoke-static { }, $EXTENSION_CLASS->onGlobalConfigUpdated()V"
                )
            }
        }
    }
}
