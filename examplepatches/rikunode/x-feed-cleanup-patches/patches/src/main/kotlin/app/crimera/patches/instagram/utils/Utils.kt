/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.utils

import app.crimera.patches.instagram.misc.settings.HookFlagsClinitFingerprint
import app.crimera.patches.instagram.misc.settings.SettingsStatusClinitFingerprint
import app.crimera.patches.instagram.utils.Constants.LOAD_FLAGS_DESCRIPTOR
import app.crimera.patches.instagram.utils.Constants.SSTS_DESCRIPTOR
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext

/**
 * Records that a patch was applied, by having SettingsStatus turn its own flag on.
 *
 * piko puts this call in SettingsStatus.load(), which nothing but its settings screen invokes.
 * This bundle does not ship that screen, so the call goes at the end of the class initialiser
 * instead — always run, and late enough not to be undone by the field initialisers.
 */
context(patchContext: BytecodePatchContext)
fun enableSettings(functionName: String) {
    SettingsStatusClinitFingerprint.method.apply {
        addInstruction(instructions.count() - 1, SSTS_DESCRIPTOR.format(functionName))
    }
}

/**
 * Adds a set of app flag overrides, for the same reason and in the same place as [enableSettings]:
 * HookFlags.load() is another entry point only the settings screen calls.
 */
context(patchContext: BytecodePatchContext)
fun addFlags(functionName: String) {
    HookFlagsClinitFingerprint.method.apply {
        addInstruction(instructions.count() - 1, LOAD_FLAGS_DESCRIPTOR.format(functionName))
    }
}
