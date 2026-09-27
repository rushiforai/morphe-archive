package com.dmoniak.patches.snapchat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import java.util.logging.Logger

@Suppress("unused")
val snapchatDeclutterAmoledPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - Snapchat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Snapchat chat screens and hides sponsored Discover tiles and intrusive Spotlight ads.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatDeclutterAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatDeclutterAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for Snapchat...")
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

            // Hook dark theme background color getters -> pure OLED pitch black (#000000)
            if (!isStatic && (
                mName == "getchatbackgroundcolor" ||
                mName == "getdarkmodebackground" ||
                mName == "getsnapchatsurfacecolor"
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
                    logger.info("[Snapchat AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Snapchat AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress sponsored Discover tiles and Spotlight ads
            if (!isStatic && (
                mName == "shouldshowsponsoredtile" ||
                mName == "isspotlightadenabled" ||
                mName == "isdiscoveradvisible" ||
                mName == "shouldinsertadstory"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Snapchat Declutter] Suppressed ad/sponsored content in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Snapchat Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Snapchat AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
