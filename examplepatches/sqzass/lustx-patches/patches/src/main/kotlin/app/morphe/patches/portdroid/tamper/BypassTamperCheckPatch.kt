/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.portdroid.tamper

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patches.all.shared.forceBooleanOnce

private const val TAMPER_CHECK = "Lcom/stealthcopter/portdroid/core/utils/TamperCheck;"

@Suppress("unused")
val bypassTamperCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Bypasses PortDroid's signature check so the re-signed app passes validation.",
) {
    compatibleWith(
        Compatibility(
            name = "PortDroid - Network Analysis",
            packageName = "com.stealthcopter.portdroid",
            targets = listOf(
                AppTarget(version = "1.0.7", versionCode = 113),
                AppTarget(version = "1.3.0", versionCode = 140),
            ),
        ),
    )

    execute {
        val m = mutableClassDefByOrNull(TAMPER_CHECK)
            ?.methods?.firstOrNull {
                it.name == "validateAppSignature" && it.returnType == "Z" && it.parameterTypes.size == 1
            } ?: throw PatchException("PortDroid: TamperCheck.validateAppSignature not found (version drift?)")
        m.forceBooleanOnce(true, "TamperCheck.validateAppSignature")
    }
}
