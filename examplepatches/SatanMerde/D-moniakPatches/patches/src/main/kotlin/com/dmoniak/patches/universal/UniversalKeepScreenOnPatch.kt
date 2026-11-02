package com.dmoniak.patches.universal

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val universalKeepScreenOnPatch = bytecodePatch(
    name = "Keep Screen Awake (Universal)",
    description = "Forces the screen to stay illuminated and prevents the device display from dimming or going to sleep while running games, navigation apps, video tools, or readers.",
    default = false,
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalKeepScreenOnLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalKeepScreenOnLogic(logger: Logger) {
    logger.info("Executing Keep Screen Awake universal patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Force keep-screen-on getters to true
            if (!isStatic && (
                mName == "getkeepscreenon" ||
                mName == "iskeepscreenon" ||
                mName == "shouldkeepscreenawake" ||
                mName == "iswakelockpreferred"
            ) && retType == "Z") {
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
                    logger.info("[Universal KeepScreen] Enabled keep-screen-on in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal KeepScreen] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Disable screen timeout / sleep triggers
            if (!isStatic && (
                mName == "cannaturalsleep" ||
                mName == "shouldallowscreentimeout"
            ) && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Universal KeepScreen] Blocked screen timeout in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal KeepScreen] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal KeepScreen] Total keep-screen-on hooks applied: $hookedPoints")
}
