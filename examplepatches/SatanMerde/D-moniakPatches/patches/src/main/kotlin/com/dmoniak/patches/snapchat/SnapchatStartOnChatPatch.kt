package com.dmoniak.patches.snapchat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import java.util.logging.Logger

@Suppress("unused")
val snapchatStartOnChatPatch = bytecodePatch(
    name = "Start on Chat & Battery Saver - Snapchat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Configures Snapchat to launch directly on the Chat conversation feed instead of opening the battery-draining camera viewfinder on startup.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatStartOnChatLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatStartOnChatLogic(logger: Logger) {
    logger.info("Executing Start on Chat & Battery Saver patch for Snapchat...")
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

            // Hook default startup tab index -> return 1 (Chat feed tab)
            if (!isStatic && (
                mName == "getdefaultstartuptab" ||
                mName == "getinitialdestinationtab" ||
                mName == "getlandingpageindex"
            ) && retType == "I") {
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
                    logger.info("[Snapchat Start Tab] Injected Chat start tab in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Snapchat Start Tab] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook camera auto-start on launch boolean
            if (!isStatic && (
                mName == "iscamerastartupenabled" ||
                mName == "shouldopencameraonlaunch"
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
                    logger.info("[Snapchat Start Tab] Disabled camera auto-start in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Snapchat Start Tab] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Snapchat Start on Chat] Total hooks applied: $hookedPoints")
}
