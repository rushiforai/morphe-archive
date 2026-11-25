package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

internal val inboxRowFilter = bytecodePatch {
    dependsOn(modSettingsSupport)
    execute {
        val item = "Lcom/lynx/tasm/behavior/ui/view/UIComponent;"
        Fingerprint(
            definingClass = "LX/OUK;",
            name = "onMeasure",
            parameters = listOf("I", "I"),
            returnType = "V",
        ).method.addInstructionsWithLabels(0, """
            iget-object v0, p0, LX/OUK;->LIL:$item
            if-eqz v0, :original_measure
            iget-object v0, v0, $item->LIL:Ljava/lang/String;
            invoke-static {p0, v0}, Lapp/tiktoklitepatches/extension/ModSettings;->hideInboxRow(Landroid/view/View;Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :original_measure
            invoke-static {p1}, Landroid/view/View${'$'}MeasureSpec;->getSize(I)I
            move-result v0
            const/4 v1, 0x0
            invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V
            return-void
            :original_measure
            nop
        """.trimIndent())
    }
}

@Suppress("unused")
val hideInboxStoryTray = bytecodePatch(
    name = "Hide inbox story tray",
    description = "Adds an off-by-default Mod settings switch to hide the stories tray in Inbox.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(inboxRowFilter)
    execute {
        enableModSetting("inboxStoryTrayAvailable")
    }
}
