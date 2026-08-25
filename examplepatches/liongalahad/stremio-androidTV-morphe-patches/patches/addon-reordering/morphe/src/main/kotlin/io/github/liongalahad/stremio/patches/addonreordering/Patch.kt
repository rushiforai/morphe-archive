package io.github.liongalahad.stremio.patches.addonreordering

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.liongalahad.stremio.patches.shared.Constants.STREMIO_COMPATIBILITY

private const val BRIDGE = "Lcom/stremio/morphe/AddonReorderBridge;"

@Suppress("unused")
val addonReorderingPatch = bytecodePatch(
    name = "Addon reordering",
    description = "Adds remote-friendly hold-OK reordering to Stremio's installed-addon list.",
    default = true
) {
    compatibleWith(STREMIO_COMPATIBILITY)
    extendWith("extensions/stremio.mpe")

    execute {
        listOf(
            AddonItemSelectedFingerprint,
            AddonItemClickedFingerprint,
            AddonBackPressedFingerprint
        ).forEach { it.matchAll(1..1) }

        AddonItemSelectedFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1, p2 }, $BRIDGE->onItemSelected(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        AddonItemClickedFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $BRIDGE->consumeClick(Ljava/lang/Object;)Z
                move-result p1
                if-eqz p1, :morphe_normal_click
                return-void
                :morphe_normal_click
            """
        )

        AddonBackPressedFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/stremio/tv/views/addons/AddonsFragment${'$'}backPressedCallback${'$'}1;->this${'$'}0:Lcom/stremio/tv/views/addons/AddonsFragment;
                invoke-static { v0 }, $BRIDGE->cancelIfActive(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_normal_back
                return-void
                :morphe_normal_back
            """
        )
    }
}
