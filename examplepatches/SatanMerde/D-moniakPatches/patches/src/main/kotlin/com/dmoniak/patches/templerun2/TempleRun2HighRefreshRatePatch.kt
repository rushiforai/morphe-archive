package com.dmoniak.patches.templerun2

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TEMPLE_RUN_2
import java.util.logging.Logger

@Suppress("unused")
val templeRun2HighRefreshRatePatch = bytecodePatch(
    name = "120 FPS High Refresh Rate & Low Latency - Temple Run 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces 120Hz display refresh rate in Temple Run 2 by configuring WindowManager.LayoutParams.preferredRefreshRate on the game activity.",
) {
    compatibleWith(COMPATIBILITY_TEMPLE_RUN_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTempleRun2HighRefreshRateLogic(logger)
    }
}

fun BytecodePatchContext.executeTempleRun2HighRefreshRateLogic(logger: Logger) {
    logger.info("Executing 120 FPS High Refresh Rate patch for Temple Run 2...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        val isActivity = tl.contains("activity") || tl.contains("unityplayer")
        if (!isActivity) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val mName = method.name
            if (mName == "onCreate" || mName == "onResume") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                        move-result-object v0
                        if-nez v0, :morphe_fps_skip
                        invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager${'$'}LayoutParams;
                        move-result-object v1
                        if-nez v1, :morphe_fps_skip
                        const/high16 v2, 0x42f00000
                        iput v2, v1, Landroid/view/WindowManager${'$'}LayoutParams;->preferredRefreshRate:F
                        invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager${'$'}LayoutParams;)V
                        :morphe_fps_skip
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[TempleRun2 FPS] Injected 120Hz window configuration into ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[TempleRun2 FPS] Skip ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[TempleRun2 FPS] Total refresh rate hooks applied: $hookedPoints")
}
