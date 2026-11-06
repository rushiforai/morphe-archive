/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package app.mrcool.patches.smartlauncher.shared.signature

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableSignatureCheckPatch = bytecodePatch {
    execute {
        // Already-patched APKs no longer contain this exit call.
        SignatureCheckFingerprint.matchOrNull()?.apply {
            val exitIndex = this.instructionMatches.first().index
            this.method.removeInstruction(exitIndex)
        }
    }
}
