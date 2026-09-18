/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.shared.misc.initialization

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

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
                val alreadyHooked = implementation?.instructions?.any { inst ->
                    (inst as? ReferenceInstruction)?.reference?.toString()?.contains("onGlobalConfigUpdated") == true
                } == true
                if (!alreadyHooked) {
                    val index = it.instructionMatches.last().index

                    addInstruction(
                        index,
                        "invoke-static { }, $EXTENSION_CLASS->onGlobalConfigUpdated()V"
                    )
                }
            }
        }
    }
}
