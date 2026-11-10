package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import java.util.logging.Logger

@Suppress("unused")
val hotstarUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium, Screenshots & Enhanced Playback - JioHotstar",
    description = "Unlocks premium UI features, downloads, AV1/HEVC/VP9 codecs, 4K/HDR10/Dolby Vision, removes screenshot & screen recording blocks, and allows HDMI/screen mirroring in JioHotstar.",
) {
    compatibleWith(COMPATIBILITY_HOTSTAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHotstarUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeHotstarUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium, Screenshots & Enhanced Playback patch for JioHotstar (in.startv.hotstar)...")

    // 1. Google Play Billing Client bypass
    executeGooglePlayBillingBypass(logger, "JioHotstar")

    // 2. Compose FLAG_SECURE window flag setter neutralization
    try {
        ComposeFlagSecureFingerprint.method.addInstructions(
            0,
            """
            return-void
            """.trimIndent()
        )
        logger.info("[Hotstar Screenshots] Neutered Compose FLAG_SECURE window setter")
    } catch (e: Exception) {
        logger.warning("[Hotstar Screenshots] ComposeFlagSecureFingerprint failed: ${e.message}")
    }

    // 3. ABConfig.getUseSecureView() forced to false (prevents video player SurfaceView.setSecure(true))
    try {
        UseSecureViewFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """.trimIndent()
        )
        logger.info("[Hotstar Screenshots] ABConfig.getUseSecureView() forced to false")
    } catch (e: Exception) {
        logger.fine("[Hotstar Screenshots] UseSecureViewFingerprint not matched: ${e.message}")
    }

    // 4. Multiple display check & HDMI broadcast listener neutralization
    try {
        MultipleDisplayCheckFingerprint.method.addInstructions(
            0,
            """
            return-void
            """.trimIndent()
        )
        logger.info("[Hotstar ScreenMirroring] Neutered MultipleDisplayCheck")
    } catch (e: Exception) {
        logger.warning("[Hotstar ScreenMirroring] MultipleDisplayCheckFingerprint failed: ${e.message}")
    }

    try {
        PlayerConfigHdmiBroadcastFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """.trimIndent()
        )
        logger.info("[Hotstar ScreenMirroring] PlayerConfig.getEnableHdmiBroadcastListener() forced to false")
    } catch (e: Exception) {
        logger.fine("[Hotstar ScreenMirroring] PlayerConfigHdmiBroadcastFingerprint: ${e.message}")
    }

    // 5. Protobuf subscribed state (MyPageData.getIsSubscribed() -> true)
    try {
        IsSubscribedFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )
        logger.info("[Hotstar Premium] MyPageData.getIsSubscribed() forced to true")
    } catch (e: Exception) {
        logger.fine("[Hotstar Premium] IsSubscribedFingerprint failed: ${e.message}")
    }

    // 6. Download button unlock (DownloadInfo.getIsPremium() -> false)
    try {
        IsPremiumFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """.trimIndent()
        )
        logger.info("[Hotstar Premium] DownloadInfo.getIsPremium() forced to false (enables downloads)")
    } catch (e: Exception) {
        logger.fine("[Hotstar Premium] IsPremiumFingerprint failed: ${e.message}")
    }

    // 7. Subscription nudge widget suppression during playback
    try {
        SubscriptionNudgeFingerprint.method.addInstructions(
            0,
            """
            return-void
            """.trimIndent()
        )
        logger.info("[Hotstar Premium] Neutered SubscriptionNudgeWidget")
    } catch (e: Exception) {
        logger.fine("[Hotstar Premium] SubscriptionNudgeFingerprint failed: ${e.message}")
    }

    // 8. Activity window lifecycle injection & SurfaceView.setSecure interception
    var hookedActivities = 0
    var hookedSurfaceCalls = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val superType = classDef.superclass ?: ""
        val isConcreteHotstarActivity = !type.contains("$") &&
                (type.endsWith("Activity;") || superType.endsWith("Activity;") || superType.contains("Activity")) &&
                (tl.contains("hotstar") || tl.contains("startv") || !tl.startsWith("lcom/google/"))

        // Clear FLAG_SECURE on all Activity lifecycles using Dalvik format 3rc
        if (isConcreteHotstarActivity) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                val isLifecycle = !isStatic && (
                    (mName == "onResume" && pTypes.isEmpty()) ||
                    (mName == "onAttachedToWindow" && pTypes.isEmpty()) ||
                    (mName == "onCreate" && pTypes.size == 1 && pTypes[0] == "Landroid/os/Bundle;")
                )

                if (isLifecycle) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 2)
                        cloned.addInstructions(
                            0,
                            """
                            invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                            move-result-object v0
                            if-eqz v0, :cond_clear_flag_secure
                            const/16 v1, 0x2000
                            invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
                            :cond_clear_flag_secure
                            """.trimIndent()
                        )
                        hookedActivities++
                    } catch (_: Exception) {}
                }
            }
        }

        // Intercept any SurfaceView.setSecure(Z) call to force parameter to false
        for (method in classDef.methods.toList()) {
            val impl = method.implementation ?: continue
            val indicesToHook = mutableListOf<Pair<Int, Int>>()

            for ((index, instruction) in impl.instructions.withIndex()) {
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (ref.definingClass == "Landroid/view/SurfaceView;" && ref.name == "setSecure") {
                    if (instruction is FiveRegisterInstruction) {
                        indicesToHook.add(index to instruction.registerD)
                    }
                }
            }

            if (indicesToHook.isNotEmpty()) {
                try {
                    val mutMethod = mutableClassDefBy(classDef).methods.first {
                        it.name == method.name && it.parameterTypes == method.parameterTypes
                    }
                    for ((index, reg) in indicesToHook.reversed()) {
                        mutMethod.addInstructions(
                            index,
                            """
                            const/4 v$reg, 0x0
                            """.trimIndent()
                        )
                        hookedSurfaceCalls++
                    }
                } catch (_: Exception) {}
            }
        }
    }

    logger.info("[Hotstar Unlock & Screenshots] Hooked: Activities=$hookedActivities, SurfaceView.setSecure calls=$hookedSurfaceCalls")
}
