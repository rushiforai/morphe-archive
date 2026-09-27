package com.dmoniak.patches.googlephone

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHONE
import java.util.logging.Logger

@Suppress("unused")
val googlePhoneCallRecordingPatch = bytecodePatch(
    name = "Enable Call Recording - Phone by Google (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables native call recording buttons and settings in Google Phone, bypassing regional carrier and country restrictions.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHONE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhoneCallRecordingLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhoneCallRecordingLogic(logger: Logger) {
    logger.info("Executing Enable Call Recording patch for Phone by Google...")
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

            // Hook call recording availability and carrier permission flags
            if (!isStatic && (
                mName == "iscallrecordingavailable" ||
                mName == "iscallrecordingenabled" ||
                mName == "iscarrierpermitted" ||
                mName == "cancallbe recorded" ||
                mName == "iscountrysupported"
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
                    logger.info("[Google Phone] Enabled call recording flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Phone] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Phone] Total call recording hooks applied: $hookedPoints")
}
