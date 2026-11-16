/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.portdroid.tamper

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.returnEarly

private const val TAMPER_CHECK = "Lcom/stealthcopter/portdroid/core/utils/TamperCheck;"

@Suppress("unused")
val bypassTamperCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Forces TamperCheck.validateAppSignature to true. Patched builds are " +
        "re-signed, so the app's three hardcoded certificate SHA-1 hashes no longer match.",
) {
    compatibleWith(
        Compatibility(
            name = "PortDroid - Network Analysis",
            packageName = "com.stealthcopter.portdroid",
            targets = listOf(
                AppTarget(version = "1.0.7", versionCode = 113),
            ),
        ),
    )

    execute {
        mutableClassDefByOrNull(TAMPER_CHECK)
            ?.methods
            ?.firstOrNull {
                it.name == "validateAppSignature" &&
                    it.returnType == "Z" &&
                    it.parameterTypes.size == 1
            }
            ?.returnEarly(true)
    }
}
