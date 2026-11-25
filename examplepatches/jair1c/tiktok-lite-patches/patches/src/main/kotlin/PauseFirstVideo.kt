package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val pauseFirstVideo = bytecodePatch(
    name = "Pause first video on launch",
    description = "Adds an off-by-default switch to pause the first For You video on a fresh app launch.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(modSettingsSupport)
    execute {
        enableModSetting("startupPauseAvailable")

        val firstFrame = Fingerprint(
            definingClass = "LX/FEV;",
            name = "onRenderFirstFrame",
            parameters = listOf("Ljava/lang/String;", "LX/1ON;"),
            returnType = "V",
        ).method
        val end = firstFrame.instructions.indices.single { firstFrame.instructions[it].opcode == Opcode.RETURN_VOID }
        // Use the same native pause action as a single tap and keep the play affordance.
        firstFrame.addInstructionsWithLabels(end, """
            invoke-virtual/range {p0 .. p0}, LX/F2a;->LIILZZL()LX/DDG;
            move-result-object v0
            sget-object v1, LX/DDG;->RECOMMEND_FEED:LX/DDG;
            if-ne v0, v1, :return_frame
            invoke-static/range {p0 .. p0}, LX/FEV;->LILZZLLZL(LX/FEV;)LX/IQW;
            move-result-object v0
            if-eqz v0, :return_frame
            invoke-interface {v0}, LX/IQW;->isPlaying()Z
            move-result v0
            if-eqz v0, :return_frame
            invoke-virtual/range {p0 .. p0}, LX/FEV;->getPlayViewContainer()Landroid/widget/FrameLayout;
            move-result-object v0
            invoke-static {v0}, Lapp/tiktoklitepatches/extension/ModSettings;->takeStartupPause(Landroid/view/View;)Z
            move-result v0
            if-eqz v0, :return_frame
            invoke-virtual/range {p0 .. p0}, LX/FEV;->LJLJL()V
            :return_frame
            nop
        """.trimIndent())
    }
}
