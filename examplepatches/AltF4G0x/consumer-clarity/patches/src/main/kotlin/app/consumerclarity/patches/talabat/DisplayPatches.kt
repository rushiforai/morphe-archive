package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private fun screenFlagPatch(
    name: String,
    description: String,
    key: String,
    label: String,
    flag: String,
    operation: String,
) = consumerBytecodePatch(name, description, "Display", key) {
    execute {
        val method = mutableClassDefBy("LEf/m;").methods.single { it.name == "onCreate" }
        val insertIndex = method.implementation!!.instructions.lastIndex
        method.addInstructions(
            insertIndex,
            """
                const-string v0, "$key"
                invoke-static {v0}, Lapp/consumerclarity/ConsumerClaritySettings;->enabled(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :cc_screen_$label
                invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0
                const/16 v1, $flag
                invoke-virtual {v0, v1}, Landroid/view/Window;->$operation(I)V
                :cc_screen_$label
                nop
            """,
        )
    }
}

@Suppress("unused")
val allowScreenshotsPatch = screenFlagPatch(
    "Allow screenshots",
    "Clears Android's secure-window flag so screenshots and screen recording are allowed.",
    "allow_screenshots",
    "allow_screenshots",
    "0x2000",
    "clearFlags",
)

@Suppress("unused")
val keepScreenOnPatch = screenFlagPatch(
    "Keep screen on",
    "Keeps the screen awake while Talabat's main activity is visible.",
    "keep_screen_on",
    "keep_screen_on",
    "0x80",
    "addFlags",
)
