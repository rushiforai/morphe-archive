package com.dmoniak.patches.googlephone

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHONE
import java.util.logging.Logger

@Suppress("unused")
val googlePhoneCallerIdTweaksPatch = bytecodePatch(
    name = "Enhanced Spam & Detailed Caller ID - Phone by Google (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enforces strict spam call blocking and reveals complete telecom carrier and geographical location details for incoming numbers.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHONE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhoneCallerIdTweaksLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhoneCallerIdTweaksLogic(logger: Logger) {
    logger.info("Executing Enhanced Spam & Detailed Caller ID patch for Phone by Google...")
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

            // Hook enhanced caller ID and location/carrier details
            if (!isStatic && (
                mName == "isenhancedspamfilteringactive" ||
                mName == "shouldshowfullcarrierdetails" ||
                mName == "islocationidentificationenabled" ||
                mName == "shouldalwaysdisplaygeoinfo"
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
                    logger.info("[Google Phone Caller ID] Enabled detailed caller ID in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Phone Caller ID] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Phone Caller ID] Total hooks applied: $hookedPoints")
}
