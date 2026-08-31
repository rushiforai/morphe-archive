package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces the VIP flag to true so premium features are unlocked " +
        "client-side. Server-validated assets (cloud effects/templates) are not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // SubscribeImpl.isVip() -> always true
        SubscribeImplIsVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // PayVipImpl.isVip() -> always true
        PayVipImplIsVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // LemonSubscribeImpl.isVip() -> always true (strip native flag and inject implementation)
        try {
            val method = LemonSubscribeImplIsVipFingerprint.method
            if (method != null) {
                // 1. Remove NATIVE flag from access flags
                val currentFlags = method.accessFlags
                val newFlags = currentFlags and com.android.tools.smali.dexlib2.AccessFlags.NATIVE.value.inv()
                method.setAccessFlags(newFlags)

                // 2. Set the implementation lazy delegate using reflection
                val field = method.javaClass.getDeclaredField("_implementation\$delegate")
                field.isAccessible = true
                val mutableImpl = com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(2)
                field.set(method, lazyOf(mutableImpl))

                // 3. Inject instructions
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }

        // UserVipInfo.isVipUser() -> always true
        UserVipInfoIsVipUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Retouch UserVipInfo.f() -> always true
        RetouchUserVipInfoFFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Retouch UserVipInfo.o() -> always true
        RetouchUserVipInfoOFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // SubscribeImpl.isVipSuspendForce() (x) -> always return true (Boolean.TRUE)
        SubscribeImplIsVipSuspendForceFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )

        // Retouch SubscribeApiImpl.c() -> always true
        RetouchSubscribeApiImplCFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Retouch SubscribeApiImpl.i() -> always true
        RetouchSubscribeApiImplIFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Retouch SubscribeApiImpl.o() -> always true
        RetouchSubscribeApiImplOFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // BusinessManager.A() -> always true
        BusinessManagerAFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // BusinessManager.v() -> always true
        BusinessManagerVFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // BusinessManager.w() -> always true
        BusinessManagerWFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // BusinessManager.x() -> always true
        BusinessManagerXFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // BusinessManager.t() -> always VipState.VIP4
        BusinessManagerTFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/lemon/lv/clipmonetize/data/VipState;->VIP4:Lcom/lemon/lv/clipmonetize/data/VipState;
                return-object v0
            """
        )

        // VipState.isAnyVIP() -> always true
        VipStateIsAnyVIPFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // VegaSubscribeImpl.isVip() -> always true
        VegaSubscribeImplIsVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // VegaSubscribeImpl.g() -> always true
        VegaSubscribeImplGFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // VegaSubscribeImpl.l() -> always true
        VegaSubscribeImplLFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // VegaSubscribeImpl.m() -> always true
        VegaSubscribeImplMFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // VegaSubscribeImpl.p() -> always true
        VegaSubscribeImplPFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // VegaSubscribeImpl.q() -> always true
        VegaSubscribeImplQFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Clipmonetize benefit checks (effects, export paywalls).
        UserInfoServiceVipStateFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/lemon/lv/clipmonetize/data/VipState;->SSVIP:Lcom/lemon/lv/clipmonetize/data/VipState;
                return-object v0
            """
        )

        // Retouch / photo editor module bundled in CapCut.
        SubscribeFacadeIsSubscribedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // WatermarkTrailerConfig(boolean enableWatermark, boolean enableTrailer)
        WatermarkTrailerConfigInitFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
            """
        )

        // Task 1: Cosmetic VIP Status Label ("Pro" / "SSVIP" in profile)
        UserSubscribeInfoGetFlagFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        UserSubscribeInfoGetLevelFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "ssvip"
                return-object v0
            """
        )
    }
}

