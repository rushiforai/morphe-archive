package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MOVISTAR

// Full Dalvik descriptor for the extension class.
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
        // Debug/compatibility tweak: avoid primitive return descriptor in inline smali.
        // If this works, the lexer was rejecting the primitive return 'Z'.
        InitializePlayerFingerprint.method.addInstructions(
            0,
            "invoke-static {p5}, $EXTENSION_CLASS;->shouldBlockAndSkip(Ljava/lang/Object;)Ljava/lang/Object;"
        )
    }
}

