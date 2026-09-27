package com.dmoniak.patches.googlemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS
import java.util.logging.Logger

@Suppress("unused")
val googleMapsAmoledPatch = bytecodePatch(
    name = "AMOLED Black Navigation - Google Maps (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into navigation mode and map exploration screens to minimize battery consumption and glare.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleMapsAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleMapsAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Black Navigation patch for Google Maps...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook night mode background color getters
            if (!isStatic && (
                mName == "getnavigationbackgroundcolor" ||
                mName == "getnightmodebackgroundcolor" ||
                mName == "getdarkthemecolor"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Google Maps AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Maps AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Maps AMOLED] Total AMOLED hooks applied: $hookedPoints")
}
