package com.dmoniak.patches.brave

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BRAVE
import java.util.logging.Logger

@Suppress("unused")
val braveCleanNewTabPatch = bytecodePatch(
    name = "Clean New Tab & Disable Brave News - Brave (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes Brave News feed, sponsored background wallpaper images, sponsored top tiles, and trending widgets on the New Tab page.",
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBraveCleanNewTabLogic(logger)
    }
}

fun BytecodePatchContext.executeBraveCleanNewTabLogic(logger: Logger) {
    logger.info("Executing Clean New Tab & Disable Brave News patch for Brave...")
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

            // Disable Brave News and sponsored new tab content
            if (!isStatic && (
                mName == "isbravenewsenabled" ||
                mName == "shouldshowbravenews" ||
                mName == "issponsoredimagesenabled" ||
                mName == "issponsoredbackgroundallowed" ||
                mName == "issponsoredcontentenabled" ||
                mName == "istoptilesponsoringenabled"
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
                    logger.info("[Brave New Tab] Disabled sponsored / news feed in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Brave New Tab] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Neutralize fetch of sponsored backgrounds
            if (!isStatic && (
                mName == "fetchsponsoredbackgrounds" ||
                mName == "loadbravenewsfeed" ||
                mName == "syncsponsoredimages"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Brave New Tab] Bypassed feed/background sync in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Brave New Tab] Failed to hook sync method: ${e.message}")
                }
            }
        }
    }

    logger.info("Clean New Tab & Disable Brave News executed: $hookedPoints points hooked.")
}
