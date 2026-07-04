package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MOVISTAR

// Full Dalvik descriptor for the extension class.
// Package: app.template.extension.extension  →  path: app/template/extension/extension
private const val EXTENSION_CLASS = "Lapp/template/extension/extension/ExamplePatch;"

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block Ads",
    description = "Blocks advertisements and promo clips.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOVISTAR)

    extendWith("extensions/extension.mpe")

    execute {
        // Sanity check: if even this fails, the inline smali format / insertion point is not accepted.
        InitializePlayerFingerprint.method.addInstructions(
            0,
            "nop"
        )
    }
}

