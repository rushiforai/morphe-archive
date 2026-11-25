package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val aweme = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val video = "Lcom/ss/android/ugc/aweme/feed/model/Video;"

@Suppress("unused")
val showSeekbar = bytecodePatch(
    name = "Show video seekbar",
    description = "Adds an off-by-default switch in Mod settings to show the video timeline and seek in the feed.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(tikTokLiteExtension)
    execute {
        val settings = "Lapp/tiktoklitepatches/extension/ModSettings;"
        Fingerprint(
            definingClass = settings,
            name = "seekbarAvailable",
            parameters = emptyList(),
            returnType = "Z",
        ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // This version binds the interactive scrubber with a visibility flag.
        val bindSeekbar = Fingerprint(
            definingClass = "LX/EeX;",
            name = "LF",
            parameters = listOf(aweme, "Ljava/lang/String;", "Z", "Z"),
            returnType = "V",
            strings = listOf("progress_bar_show"),
        ).method
        bindSeekbar.addInstructionsWithLabels(0, """
            invoke-static {}, $settings->seekbarEnabled()Z
            move-result v0
            if-eqz v0, :keep_visibility
            if-eqz p1, :keep_visibility
            iget-object v0, p1, $aweme->video:$video
            if-eqz v0, :keep_visibility
            const/4 p3, 0x1
            :keep_visibility
            nop
        """.trimIndent())

        val dispatchTouch = Fingerprint(
            definingClass = "LX/DVo;",
            name = "dispatchTouchEvent",
            parameters = listOf("Landroid/view/MotionEvent;"),
            returnType = "Z",
        ).method
        // Skip the experiment gate and let the native SeekBar handle the gesture.
        dispatchTouch.addInstructionsWithLabels(0, """
            invoke-static {}, $settings->seekbarEnabled()Z
            move-result v0
            if-eqz v0, :original_dispatch
            invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
            move-result v0
            return v0
            :original_dispatch
            nop
        """.trimIndent())

        val maskTouch = Fingerprint(
            definingClass = "Lcom/ss/android/ugc/aweme/main/homepage/seekbar/view/VideoSeekBarMaskView;",
            name = "onTouchEvent",
            parameters = listOf("Landroid/view/MotionEvent;"),
            returnType = "Z",
        ).method
        val skipGesture = maskTouch.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.IF_NEZ }
        check(skipGesture >= 0)
        maskTouch.addInstructions(skipGesture, """
            invoke-static {}, $settings->seekbarEnabled()Z
            move-result v0
            xor-int/lit8 v0, v0, 0x1
        """.trimIndent())

        for (owner in listOf("LX/DVo;", "LX/Elv;")) {
            Fingerprint(
                definingClass = owner,
                name = "setDraftProgressBar",
                parameters = listOf("Z"),
                returnType = "V",
            ).method.addInstructions(0, """
                invoke-static {p1}, $settings->seekbarDraftEnabled(Z)Z
                move-result p1
            """.trimIndent())
        }
    }
}
