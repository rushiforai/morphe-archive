/*
 * Copyright (C) 2026 hxreborn
 * Adaptations Copyright (C) 2026 RaFaeLL0
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * A missing token-invalid toast sequence is not a fatal error. In realme Link
 * 5.8.811.2814 the toast fingerprint can disappear after another patch or a
 * vendor build change, even when the session-expiry prompt remains patchable.
 *
 * Do not silently skip the required login-prompt patch: on unsupported inputs
 * it still fails closed. Patch only an ORIGINAL, previously unmodified APK.
 */
package app.morphe.patches.realmelink.session

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val bypassSessionExpiryPatch = bytecodePatch(
    name = "Bypass session expiry",
    description = "Stops the session-expired prompt and, when present, the token-invalid toast.",
) {
    compatibleWith(AppCompatibilities.REALME_LINK)

    execute {
        // The prompt suppression is essential, so keep its fingerprint strict.
        ReLoginPromptFingerprint.matchSingle().method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """,
        )

        // The toast is optional. The old .matchSingle() rejected the whole
        // patch when it was missing even though the prompt had been patched.
        // Match all real occurrences, never remove unrelated instructions.
        ReLoginToastFingerprint.matchAllOrNull().orEmpty().forEach { match ->
            val (_, _, toastCall) = match.instructionMatches
            match.method.removeInstruction(toastCall.index)
        }
    }
}
