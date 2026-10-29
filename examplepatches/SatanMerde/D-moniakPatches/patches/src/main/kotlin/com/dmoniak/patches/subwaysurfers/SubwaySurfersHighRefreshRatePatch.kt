package com.dmoniak.patches.subwaysurfers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SUBWAY_SURFERS
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import java.util.logging.Logger

@Suppress("unused")
val subwaySurfersHighRefreshRatePatch = bytecodePatch(
    name = "120 FPS High Refresh Rate & Low Latency - Subway Surfers (Experimental)",
    description = "⚠️ [Experimental / Untested] Forces 120Hz display refresh rate in Subway Surfers by configuring WindowManager.LayoutParams.preferredRefreshRate on the game activity.",
) {
    compatibleWith(COMPATIBILITY_SUBWAY_SURFERS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSubwaySurfersHighRefreshRateLogic(logger)
    }
}

fun BytecodePatchContext.executeSubwaySurfersHighRefreshRateLogic(logger: Logger) {
    logger.info("Executing 120 FPS High Refresh Rate patch for Subway Surfers...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        val isActivity = tl.contains("activity") || tl.contains("unityplayer")
        if (!isActivity) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val mName = method.name
            if (mName == "onCreate" || mName == "onResume") {
                try {
                    // Safely expand register headroom by 3 to prevent register collisions with parameters
                    val mutableMethod = cloneMethodWithAdditionalRegisters(method, 3)
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
                    logger.info("[SubwaySurfers FPS] Injected 120Hz window configuration into ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[SubwaySurfers FPS] Skip ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SubwaySurfers FPS] Total refresh rate hooks applied: $hookedPoints")
}
