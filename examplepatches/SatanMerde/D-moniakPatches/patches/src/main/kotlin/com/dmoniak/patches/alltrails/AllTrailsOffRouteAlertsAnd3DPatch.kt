package com.dmoniak.patches.alltrails

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ALLTRAILS
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val allTrailsOffRouteAlertsAnd3DPatch = bytecodePatch(
    name = "Unlock 3D Maps & Off-Route Alerts - AllTrails (Experimental)",
    description = "Unlocks 3D trail maps, real-time off-route audio and wrong-turn notifications, and environmental weather overlays in AllTrails.",
) {
    compatibleWith(COMPATIBILITY_ALLTRAILS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAllTrailsOffRouteAlertsAnd3DLogic(logger)
    }
}

fun BytecodePatchContext.executeAllTrailsOffRouteAlertsAnd3DLogic(logger: Logger) {
    logger.info("Executing Unlock 3D Maps & Off-Route Alerts patch for AllTrails...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook 3D maps and off-route navigation features
            if (!isStatic && (
                mName == "iswrongturnalertenabled" ||
                mName == "isoffrouteaudioallowed" ||
                mName == "isoffroutealertsenabled" ||
                mName == "is3dmapavailable" ||
                mName == "canview3dtrail" ||
                mName == "isweatheroverlayallowed" ||
                mName == "isairqualitylayerallowed" ||
                mName == "canviewtopo3d"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[AllTrails 3D & Alerts] Enabled feature: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[AllTrails 3D & Alerts] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[AllTrails 3D & Alerts] Total navigation & 3D hooks applied: $hookedPoints")
}
