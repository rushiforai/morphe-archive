/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.clone

import app.docscanner.patches.shared.Constants.COMPATIBILITY_DOCSCANNER
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * The app's case-insensitive "a contains b" helper (`hb3.k` in 6.9.9, `jm3.l` in 6.9.14). It calls
 * `k("com.cv.docscanner", packageName)` at start-up and exits when that is false, which a renamed copy always is.
 * The same helper serves ordinary string checks elsewhere, so only the one pairing (the original name against a name
 * that extends it) is let through. Found by its body - lower-case both arguments, then `contains` - because the class
 * is renamed every release.
 */
private val containsHelper = Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    custom = { method, _ ->
        val calls = method.implementation?.instructions
            ?.mapNotNull { ((it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference) }
            ?.map { "${it.definingClass}->${it.name}" }
            .orEmpty()
        "Ljava/lang/String;->toLowerCase" in calls && "Ljava/lang/String;->contains" in calls
    },
)

private val cloneFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.allowclone") }
    }
}

@Suppress("unused")
val allowClonePatch = bytecodePatch(
    name = "Allow clone",
    description = "Lets the app run under a package name made by the Change package name patch: the app compares its own package " +
        "name with the original at start-up and shuts itself down when they differ.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOCSCANNER)
    dependsOn(cloneFlag)
    dependsOn(menuPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The helper has two registers, both holding its arguments, so its body becomes one call that returns.
        containsHelper.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, Lapp/loki/extension/CloneSupport;->containsOrIsClone(Ljava/lang/String;Ljava/lang/String;)Z
                move-result p0
                return p0
            """
        )
    }
}
