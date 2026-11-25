package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private object LoopingDispatcher4782 : Fingerprint(
    definingClass = "Lcom/ss/ttvideoengine/TTVideoEngine;",
    name = "LILLZLZ",
    parameters = listOf("Z"),
    returnType = "V",
    strings = listOf("set looping value:"),
)

private object MediaPlayerLooping4782 : Fingerprint(
    definingClass = "Lcom/ss/ttvideoengine/TTVideoEngineImpl;",
    name = "LILJ",
    parameters = listOf("Z"),
    returnType = "V",
    strings = listOf("setLooping:"),
)

@Suppress("unused")
val stopVideoLooping = bytecodePatch(
    name = "Stop video looping",
    description = "Adds an off-by-default switch in Mod settings to stop automatically repeating videos.",
    default = true,
) {
    // Adapted to KyVexo's target after reviewing Kveld's Stop Video Looping patch.
    compatibleWith(Compatibility(
        name = "TikTok Lite",
        packageName = "com.zhiliaoapp.musically.go",
        targets = listOf(tikTokLite4782Target),
    ))
    dependsOn(tikTokLiteExtension)
    execute {
        val settings = "Lapp/tiktoklitepatches/extension/ModSettings;"
        Fingerprint(
            definingClass = settings,
            name = "stopVideoLoopingAvailable",
            parameters = emptyList(),
            returnType = "Z",
        ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        for (fingerprint in listOf(LoopingDispatcher4782, MediaPlayerLooping4782)) {
            fingerprint.method.addInstructions(0, """
                invoke-static/range {p1 .. p1}, $settings->videoLooping(Z)Z
                move-result p1
            """.trimIndent())
        }
    }
}
