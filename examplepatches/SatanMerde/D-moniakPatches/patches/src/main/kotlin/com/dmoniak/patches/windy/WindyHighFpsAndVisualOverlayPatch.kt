package com.dmoniak.patches.windy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WINDY
import java.util.logging.Logger

@Suppress("unused")
val windyHighFpsAndVisualOverlayPatch = bytecodePatch(
    name = "120 FPS Smooth Radar Animations - Windy.com (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces 120Hz display refresh rate and unlocks high-framerate wind particle simulations and smooth satellite weather animation layers in Windy.",
) {
    compatibleWith(COMPATIBILITY_WINDY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWindyHighFpsAndVisualOverlayLogic(logger)
    }
}

fun BytecodePatchContext.executeWindyHighFpsAndVisualOverlayLogic(logger: Logger) {
    logger.info("Executing 120 FPS Smooth Radar Animations patch for Windy.com...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook Activity onCreate to set 120Hz window refresh rate
            if (!isStatic && (method.name == "onCreate" || method.name == "onResume") && tl.contains("activity")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                        move-result-object v0
                        if-nez v0, :morphe_windy_fps_skip
                        invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager${'$'}LayoutParams;
                        move-result-object v1
                        if-nez v1, :morphe_windy_fps_skip
                        const/high16 v2, 0x42f00000
                        iput v2, v1, Landroid/view/WindowManager${'$'}LayoutParams;->preferredRefreshRate:F
                        invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager${'$'}LayoutParams;)V
                        :morphe_windy_fps_skip
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[Windy 120FPS] Injected 120Hz refresh rate in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Windy 120FPS] Skip window hook: ${e.message}")
                }
            }

            // 2. Hook particle & animation fps getters -> return 120
            if (!isStatic && (
                mName == "gettargetfps" ||
                mName == "getparticlefps" ||
                mName == "getanimationframerate" ||
                mName == "getmaxparticlespeed"
            ) && retType == "I" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0x78
                        return v0
                        """.trimIndent() // 120
                    )
                    hookedPoints++
                    logger.fine("[Windy 120FPS] Hooked animation fps getter in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Windy 120FPS] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Enable high quality particle smoothing
            if (!isStatic && (
                mName == "isparticlesmoothingenabled" ||
                mName == "ishighqualityanimationallowed"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[Windy 120FPS] Enabled particle smoothing in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Windy 120FPS] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Windy 120FPS] Total 120Hz/animation hooks applied: $hookedPoints")
}
