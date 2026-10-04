package com.dmoniak.patches.googlemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS
import java.util.logging.Logger

@Suppress("unused")
val googleMapsNavigationEnhancerPatch = bytecodePatch(
    name = "Navigation Supercharged: Speed Cameras & Auto-Zoom Lock - Google Maps (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces persistent speed camera & radar audio alerts, prevents high-speed auto-zoom out to keep your chosen map view, and keeps the screen awake during route guidance.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleMapsNavigationEnhancerLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleMapsNavigationEnhancerLogic(logger: Logger) {
    logger.info("Executing Navigation Supercharged patch for Google Maps...")
    var cameraHooks = 0
    var zoomHooks = 0
    var screenHooks = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook Speed Camera / Radar Warning audio triggers -> force enabled
            if (!isStatic && (
                mName == "isspeedcamerawarningenabled" ||
                mName == "isspeedcameraalertsenabled" ||
                mName == "shouldplayspeedcamerawarning" ||
                mName == "isfixedradaralertenabled" ||
                mName == "isspeedtraparoundenabled" ||
                mName == "cancamerawarningbeaudible"
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
                    cameraHooks++
                    logger.fine("[Google Maps Nav] Enabled radar alert in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Maps Nav] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Lock Zoom Level / Disable Auto-Zoom out during highway navigation
            if (!isStatic && (
                mName == "isautozoomenabled" ||
                mName == "shouldautozoomduringroute" ||
                mName == "isadaptiveautozoomallowed"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    zoomHooks++
                    logger.fine("[Google Maps Nav] Locked custom zoom in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Maps Nav] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Keep screen permanently on in navigation Activity
            if (!isStatic && (mName == "oncreate" || mName == "onresume") &&
                (tl.contains("nav") || tl.contains("guidance") || tl.contains("mapsactivity"))
            ) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                        move-result-object v0
                        if-nez v0, :morphe_nav_screen_skip
                        const/16 v1, 0x80
                        invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V
                        :morphe_nav_screen_skip
                        """.trimIndent()
                    )
                    screenHooks++
                    logger.fine("[Google Maps Nav] Kept screen on in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Maps Nav] Skip screen on: ${e.message}")
                }
            }
        }
    }

    logger.info("[Google Maps Nav] Finished: $cameraHooks camera hooks, $zoomHooks zoom locks, $screenHooks keep-screen-on hooks applied.")
}
