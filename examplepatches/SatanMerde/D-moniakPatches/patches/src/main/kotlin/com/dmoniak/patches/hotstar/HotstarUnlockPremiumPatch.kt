package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val hotstarUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Enhanced Playback - JioHotstar",
    description = "Unlocks premium UI features, bypasses subscription gates for higher video resolution selections, allows screenshots/screen recording, and enables playback over HDMI and screen mirroring in JioHotstar.",
) {
    compatibleWith(COMPATIBILITY_HOTSTAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHotstarUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeHotstarUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & Enhanced Playback patch for JioHotstar (in.startv.hotstar)...")
    var hookedActivities = 0
    var hookedMethods = 0

    // 1. Google Play Billing Client SDK bypass
    hookedMethods += executeGooglePlayBillingBypass(logger, "JioHotstar")

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val superType = classDef.superclass ?: ""
        val isConcreteHotstarActivity = type == "Lcom/hotstar/MainActivity;" ||
                type == "Lcom/hotstar/MainActivityJv;" ||
                type == "Lcom/hotstar/payment_lib_webview/main/HSWebPaymentActivity;" ||
                (tl.startsWith("lcom/hotstar/") && !type.contains("$") &&
                        (superType.endsWith("Activity;") || superType.contains("Activity")))

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 2. Inject Window.clearFlags(0x2000) into every Activity to allow screenshots & screen mirroring
        if (isConcreteHotstarActivity) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                val isLifecycle = !isStatic && (
                    (mName == "onResume" && pTypes.isEmpty()) ||
                    (mName == "onCreate" && pTypes.size == 1 && pTypes[0] == "Landroid/os/Bundle;")
                )

                if (isLifecycle) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 2)
                        cloned.addInstructions(
                            0,
                            """
                            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                            move-result-object v0
                            if-eqz v0, :cond_clear_flag_secure
                            const/16 v1, 0x2000
                            invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
                            :cond_clear_flag_secure
                            """.trimIndent()
                        )
                        hookedActivities++
                        logger.fine("[Hotstar Premium] Injected Window.clearFlags(0x2000) in ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.fine("[Hotstar Premium] Skip activity lifecycle injection: ${e.message}")
                    }
                }
            }
        }

        // 3. Subscription & VIP entitlement checks
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            val isSubscriptionCheck = !isStatic && (
                mName == "issubscribed" ||
                mName == "hassubscription" ||
                mName == "isvipuser" ||
                mName == "issuperuser" ||
                mName == "ispremium" ||
                mName == "ispremiumuser" ||
                mName == "isactivemembership" ||
                mName == "iscontentunlocked" ||
                mName == "canplaypremiumvideo" ||
                mName == "ishdrenabled" ||
                mName == "is4kenabled" ||
                mName == "isscreenmirroringallowed" ||
                mName == "ishdmiallowed"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isSubscriptionCheck) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.fine("[Hotstar Premium] Hooked entitlement: ${type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[Hotstar Premium] Skip entitlement hook: ${e.message}")
                }
            }

            // Suppress paywall nudges & subscription dialogs
            val isPaywallCheck = !isStatic && (
                mName == "shouldshowpaywall" ||
                mName == "shouldshownudge" ||
                mName == "iscontentlocked" ||
                mName == "isvideolocked" ||
                mName == "isrestrictedbyhdmi"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isPaywallCheck) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.fine("[Hotstar Premium] Hooked paywall check: ${type}->${method.name} -> false")
                } catch (e: Exception) {
                    logger.fine("[Hotstar Premium] Skip paywall hook: ${e.message}")
                }
            }
        }
    }

    logger.info("[JioHotstar Premium] Total hooks applied: Activities=$hookedActivities, Methods=$hookedMethods")
}

