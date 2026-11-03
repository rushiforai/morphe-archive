package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

@Suppress("unused")
val homeShortcutPatch = consumerBytecodePatch(
    "Home settings shortcut",
    "Adds a draggable Clarity button to Talabat's home screen for direct access to the patch control center.",
    "Control center",
    "home_shortcut",
    default = true,
) {
    execute {
        mutableClassDefBy("Lcom/talabat/FlutterLandingScreen;").methods.single { it.name == "<init>" }.addInstructions(
            1,
            "invoke-static {p0}, Lapp/consumerclarity/ConsumerClarityShortcut;->install(Landroid/app/Activity;)V",
        )
    }
}
