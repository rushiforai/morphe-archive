package patches.videolandatv

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val hideUnavailableContentPatch = bytecodePatch(
    name = "Hide unavailable content",
    description = "Hides subscription-required catalogue entries and action buttons, and removes empty seasons. Preserves content available to the current account and other access checks.",
    default = true,
) {
    compatibleWith(videolandTv)
    dependsOn(originalInput)
    extendWith("extensions/videoland.mpe")
    execute {
        val targets = unavailableTargets()
        val (legacy, compose, factory, row) = targets
        val block = "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;"
        val helper = "Lpatches/videoland/Availability;"
        // Keep raw block/index until both pager and selection have been projected.
        legacy.addInstructions(3, """
            invoke-static {p1, p2}, $helper->visiblePager(${block}Lw4/A1;)Lw4/A1;
            move-result-object p2
            invoke-static {p1, p3}, $helper->visibleIndex(${block}I)I
            move-result p3
            invoke-static {p1}, $helper->visibleBlock($block)$block
            move-result-object p1
        """.trimIndent())
        compose.addInstructions(5, """
            invoke-static {p1, p3}, $helper->visibleIndex(${block}I)I
            move-result p3
            invoke-static {p1}, $helper->visibleBlock($block)$block
            move-result-object p1
        """.trimIndent())
        // This caller still has the block template. The generic LV/s source
        // factory itself lacks that context and also serves non-collections.
        factory.addInstructions(42, """
            invoke-static {v2, v6}, $helper->visibleFactory(${block}Ljv/a;)Ljv/a;
            move-result-object v6
        """.trimIndent())
        row.addInstructions(0, """
            invoke-static {p0}, $helper->rowCount(LQk/t;)I
            move-result v0
            return v0
        """.trimIndent())
        // Native consumers already treat a null action description as absent,
        // including hiding its button and removing it from focus/layout.
        targets[4 + unavailableRenderHooks.size].addInstructionsWithLabels(0, """
            invoke-static {p0}, $helper->hideAction(Lcom/bedrockstreaming/component/layout/domain/core/model/Action;)Z
            move-result v0
            if-eqz v0, :originalAction
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(), ExternalLabel("originalAction", targets[4 + unavailableRenderHooks.size].getInstruction(0)))
        // Cover's secondary-action binder does not reset absent descriptions.
        // Clear recycled text/listener and restore visibility on the next bind.
        targets[5 + unavailableRenderHooks.size].addInstructionsWithLabels(0, """
            if-eqz p1, :hideCover
            invoke-static {p1}, LWu/I;->G(Ljava/util/List;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :hideCover
            instance-of v1, v0, Lkn/f${'$'}e;
            if-eqz v1, :originalCover
            iget-object v0, p0, LEo/a;->b:Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;
            invoke-virtual {v0}, Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;->getButtonView()Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            goto :originalCover
            :hideCover
            iget-object v0, p0, LEo/a;->b:Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;->setButtonText(Ljava/lang/String;)V
            invoke-virtual {v0}, Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;->getButtonView()Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;
            move-result-object v0
            const/16 v1, 0x8
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
            return-void
        """.trimIndent(), ExternalLabel("originalCover", targets[5 + unavailableRenderHooks.size].getInstruction(0)))
        // A shrinking section needs aggregate offsets/counts rebuilt; the
        // shipped onChanged observer otherwise forwards a fixed-size redraw.
        val observer = "LNk/a\$b;"
        targets.last().addInstructionsWithLabels(0, """
            invoke-static {p0}, $helper->sectionsChanged($observer)Z
            move-result v0
            if-eqz v0, :originalNotification
            return-void
        """.trimIndent(), ExternalLabel("originalNotification", targets.last().getInstruction(0)))
        unavailableRenderHooks.zip(targets.drop(4)).forEach { (hook, method) ->
            // Collect paging first; jump through the native group cleanup when
            // successful refresh and both directions prove an empty collection.
            method.addInstructionsWithLabels(hook.insertion, """
                invoke-static {v${hook.block}, v${hook.paging}}, $helper->hideEmpty(${block}Lx4/c;)Z
                move-result v${hook.scratch}
                if-nez v${hook.scratch}, :emptyCollection
            """.trimIndent(), ExternalLabel("emptyCollection", method.getInstruction(hook.exit)))
        }
    }
}
