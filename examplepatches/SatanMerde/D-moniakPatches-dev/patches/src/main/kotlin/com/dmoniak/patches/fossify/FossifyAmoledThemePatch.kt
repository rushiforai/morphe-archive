package com.dmoniak.patches.fossify

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FOSSIFY_PHONE
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val fossifyAmoledThemePatch = bytecodePatch(
    name = "Pure AMOLED Black Theme - Fossify Phone (Experimental)",
    description = "Applies a pure #000000 AMOLED dark theme across dialpad, in-call screen, contacts list, and call history for optimal OLED battery savings.",
) {
    compatibleWith(COMPATIBILITY_FOSSIFY_PHONE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFossifyAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeFossifyAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Black Theme patch for Fossify Phone...")
    var hooked = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (
            tl.startsWith("landroid/") ||
            tl.startsWith("landroidx/") ||
            tl.startsWith("lkotlin/") ||
            tl.startsWith("ljava/") ||
            tl.startsWith("lcom/google/")
        ) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Force AMOLED / Black theme flags to true
            if (!isStatic && pTypes.isEmpty() && retType == "Z") {
                if (
                    mName == "isamoledtheme" ||
                    mName == "isblacktheme" ||
                    mName == "ispureblacktheme" ||
                    mName == "isamoled" ||
                    mName == "isblack" ||
                    mName == "isdarktheme" ||
                    mName == "useblackbackground"
                ) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Fossify AMOLED] Forced theme flag to true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Fossify AMOLED] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // 2. Force dark background color getters to pure black (#000000, 0xFF000000 / -0x1000000)
            if (!isStatic && pTypes.isEmpty() && retType == "I") {
                if (
                    mName == "getbackgroundcolor" ||
                    mName == "getdarkbackgroundcolor" ||
                    mName == "getprimarydarkcolor" ||
                    mName == "getincallbackgroundcolor" ||
                    mName == "getdialpadbackgroundcolor" ||
                    mName == "getappbackgroundcolor"
                ) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/high16 v0, -0x1000000
                            return v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Fossify AMOLED] Forced background color to #000000: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Fossify AMOLED] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Fossify AMOLED] Finished: $hooked AMOLED theme hooks applied.")
}
