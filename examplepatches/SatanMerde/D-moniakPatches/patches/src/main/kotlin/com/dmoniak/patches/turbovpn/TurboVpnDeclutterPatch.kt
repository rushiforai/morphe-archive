package com.dmoniak.patches.turbovpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TURBO_VPN
import java.util.logging.Logger

@Suppress("unused")
val turboVpnDeclutterPatch = bytecodePatch(
    name = "Declutter UI & Hide VIP Upsells - Turbo VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides aggressive VIP subscription popups, floating gift chests, and promotional banners for a clean connection interface.",
) {
    compatibleWith(COMPATIBILITY_TURBO_VPN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTurboVpnDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeTurboVpnDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter UI patch for Turbo VPN...")
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

            // Hide VIP upsell dialogs and floating promotions
            if (!isStatic && (
                mName == "shouldshowvippopup" ||
                mName == "isvippromotionvisible" ||
                mName == "shouldshowfloatingchest" ||
                mName == "isupsellbannervisible"
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
                    logger.info("[Turbo VPN Declutter] Blocked VIP upsell in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Turbo VPN Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Turbo VPN Declutter] Total declutter hooks applied: $hookedPoints")
}
