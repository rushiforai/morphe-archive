package com.dmoniak.patches.bitwarden

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BITWARDEN
import java.util.logging.Logger

@Suppress("unused")
val bitwardenBypassAutofillRestrictionsPatch = bytecodePatch(
    name = "Bypass Local IP & HTTP Autofill Restrictions - Bitwarden (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables insecure HTTP warnings and local IP address autofill blocks, allowing seamless password autofilling on routers, NAS devices, and local development environments.",
) {
    compatibleWith(COMPATIBILITY_BITWARDEN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBitwardenBypassAutofillRestrictionsLogic(logger)
    }
}

fun BytecodePatchContext.executeBitwardenBypassAutofillRestrictionsLogic(logger: Logger) {
    logger.info("Executing Bypass Autofill Restrictions patch for Bitwarden...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Insecure HTTP warning check -> false
            if (!isStatic && (
                mName == "shouldshowinsecurehttpwarning" ||
                mName == "isinsecureautofillblocked" ||
                mName == "isuntrusteddomain" ||
                mName == "blockinsecurehttpautofill"
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
                    logger.info("[Bitwarden Autofill] Disabled insecure warning check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Bitwarden Autofill] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Allow autofill on any URI / local IP -> true
            if (!isStatic && (
                mName == "canautofillonuri" ||
                mName == "canautofillhost" ||
                mName == "isautofillpermitted" ||
                mName == "allowautofillforuri"
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
                    logger.info("[Bitwarden Autofill] Allowed autofill on URI in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Bitwarden Autofill] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Bitwarden Autofill] Total autofill hooks applied: $hookedPoints")
}
