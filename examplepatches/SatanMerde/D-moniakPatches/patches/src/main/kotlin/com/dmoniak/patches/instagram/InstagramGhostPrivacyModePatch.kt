package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramGhostPrivacyModePatch = bytecodePatch(
    name = "Ghost Privacy Mode: Anonymous DMs & Stories - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables 'Seen' receipts in Direct Messages, hides story viewed tracking, silences live stream join broadcasts, and hides DM typing indicator.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramGhostModeLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramGhostModeLogic(logger: Logger) {
    logger.info("Executing Ghost Privacy Mode patch for Instagram...")
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

            // 1. Suppress DM Seen receipts and Story view tracking (void methods)
            if (!isStatic && (
                mName == "sendseenreceipt" ||
                mName == "markdirectmessageasseen" ||
                mName == "sendstoryviewreceipt" ||
                mName == "markstoryasseen" ||
                mName == "sendtypingindicator" ||
                mName == "broadcastlivejoined"
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
                    logger.info("[Instagram Ghost Mode] Suppressed tracking signal in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Ghost Mode] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Ghost mode boolean feature toggles
            if (!isStatic && (
                mName == "isghostmodeenabled" ||
                mName == "shouldhidedmseenreceipt" ||
                mName == "shouldhidestoryview" ||
                mName == "shouldhidetypingstatus"
            ) && retType == "Z") {
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
                    logger.info("[Instagram Ghost Mode] Enabled ghost toggle in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Ghost Mode] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Ghost Mode] Finished: $hookedPoints ghost privacy hooks injected.")
}
