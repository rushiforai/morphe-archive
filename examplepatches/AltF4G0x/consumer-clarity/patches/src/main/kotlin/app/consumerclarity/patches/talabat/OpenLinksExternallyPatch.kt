package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

@Suppress("unused")
val openLinksExternallyPatch = consumerBytecodePatch(
    name = "Open links in default browser",
    description = "Routes links that would open in Talabat's in-app WebView to the default browser. " +
        "Can be toggled in Consumer Clarity settings.",
    category = "Navigation",
    key = "open_links_externally",
    default = true,
    defaultSetting = false,
) {

    execute {
        mutableClassDefBy("LAc/w;").methods.single { it.name == "F" }.addInstructions(
            0,
            """
                iget-object v0, p0, LAc/w;->c:Ljava/lang/Object;
                check-cast v0, Landroid/app/Activity;
                invoke-static {v0, p1}, Lapp/consumerclarity/ConsumerClarityLinks;->route(Landroid/app/Activity;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :cc_original
                const/4 v0, 0x1
                return v0
                :cc_original
                nop
            """,
        )
    }
}
