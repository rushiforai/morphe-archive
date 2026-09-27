package com.dmoniak.patches.session

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SESSION
import java.util.logging.Logger

@Suppress("unused")
val sessionAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme - Session (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects true OLED pitch black (#000000) into Session chat threads, community rooms, and message views to maximize battery savings.",
) {
    compatibleWith(COMPATIBILITY_SESSION)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSessionAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeSessionAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme patch for Session Messenger...")
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
                mName == "getsessionsurfacecolor" ||
                mName == "getdarkmodebackground" ||
                mName == "getconversationbackgroundcolor"
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
                    logger.info("[Session AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Session AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Session AMOLED] Total hooks applied: $hookedPoints")
}
