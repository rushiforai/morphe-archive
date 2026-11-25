/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress.signin

import patches.aliexpress.ALIEXPRESS

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import patches.aliexpress.settings.markPatchApplied
import patches.aliexpress.settings.patchesSettingsPatch
import patches.aliexpress.spoofSignature

private const val DESCRIPTION = "Restores product loading on patched installs."

@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature",
    description = DESCRIPTION,
) {
    compatibleWith(ALIEXPRESS)

    dependsOn(signingDataPatch, patchesSettingsPatch)

    extendWith("extensions/aliexpress.mpe")

    execute {
        markPatchApplied("spoofSignature", DESCRIPTION)
        spoofSignature("Lcom/aliexpress/app/AliExpressApp;")
        SecurityContextInitializerFingerprint.matchSingle().method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, Lnl/johninnl/aliexpress/SecurityContext;->wrap(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
