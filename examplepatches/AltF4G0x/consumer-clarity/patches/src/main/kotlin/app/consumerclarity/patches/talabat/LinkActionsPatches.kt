package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private fun linkAction(name: String, description: String, key: String, label: String) = consumerBytecodePatch(
    name,
    description,
    "Navigation",
    key,
) {
    execute {
        mutableClassDefBy("LAc/w;").methods.single { it.name == "F" }.addInstructions(
            0,
            """
                iget-object v0, p0, LAc/w;->c:Ljava/lang/Object;
                check-cast v0, Landroid/app/Activity;
                invoke-static {v0, p1}, Lapp/consumerclarity/ConsumerClarityLinks;->route(Landroid/app/Activity;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :cc_link_$label
                const/4 v0, 0x1
                return v0
                :cc_link_$label
                nop
            """,
        )
    }
}

@Suppress("unused")
val linkPreviewPatch = linkAction(
    "Link safety preview",
    "Shows the destination before opening a link, with Open, Share, Copy, and Cancel actions.",
    "link_preview",
    "preview",
)

@Suppress("unused")
val shareLinksPatch = linkAction(
    "Share links",
    "Opens Android's share sheet for links instead of displaying them in Talabat's WebView.",
    "share_links",
    "share",
)
