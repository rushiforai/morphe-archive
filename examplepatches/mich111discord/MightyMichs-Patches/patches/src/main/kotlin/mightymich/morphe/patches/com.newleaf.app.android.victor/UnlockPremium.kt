package mightymich.morphe.patches.com.newleaf.app.android.victor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * ReelShort (com.newleaf.app.android.victor) Unlock Premium.
 *
 * Bug #33: previous getVip_expire → -1 was rendered as "Jan 01, 1970"
 * (Unix epoch) and triggered "duplicate / expired subscription" UI.
 *
 * Fix: expire = INT_MAX (2038-01-19 UTC) as Unix seconds; remaining sec large;
 * VIP status/type forced active; local coin/bonus getters boosted.
 * Server wallet / DRM episodes may still stay at 0.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Forces local VIP membership (status, type, expire far in the future) " +
        "and unlocks ad/paywall episode flags. Does not forge server purchases.",
    default = true,
) {
    compatibleWith(ReelShortCompatibility.REELSHORT)

    execute {
        // Active VIP flag / category
        val returnOne = """
            const/4 v0, 0x1
            return v0
        """
        // Unix seconds ≈ 2038-01-19 (Integer.MAX_VALUE) — valid future, not 1970
        val returnFarExpire = """
            const v0, 0x7fffffff
            return v0
        """
        // ~31 years of remaining seconds
        val returnLongRemainingSec = """
            const v0, 0x3b9aca00
            return v0
        """
        val returnZero = """
            const/4 v0, 0x0
            return v0
        """
        // Local display balance (client-side only)
        val returnManyCoins = """
            const v0, 0xf423f
            return v0
        """

        fun force(
            definingClass: String,
            methodName: String,
            returnType: String,
            smali: String,
        ): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = methodName,
                    returnType = returnType,
                    parameters = emptyList(),
                )
                fp.method.addInstructions(0, smali)
                true
            } catch (_: Exception) {
                false
            }
        }

        fun forceInt(cls: String, name: String, smali: String = returnOne) =
            force(cls, name, "I", smali)

        fun forceBool(cls: String, name: String, smali: String = returnOne) =
            force(cls, name, "Z", smali)

        fun forceLong(cls: String, name: String, smali: String): Boolean =
            force(cls, name, "J", smali)

        var hits = 0

        val account = "Lcom/newleaf/app/android/victor/bean/Account;"

        // VIP status / type
        if (forceInt(account, "getVip_status")) hits++
        if (forceInt(account, "getVip_type")) hits++
        if (forceInt(account, "getVipStatus")) hits++
        if (forceInt(account, "getVipType")) hits++
        if (forceInt(account, "getOtpVip")) hits++
        if (forceInt(account, "getVipCategory")) hits++
        if (forceInt(account, "is_vip_renew")) hits++
        if (forceBool(account, "is_vip")) hits++

        // CRITICAL: expire must be a real future unix timestamp, never -1 / 0
        if (forceInt(account, "getVip_expire", returnFarExpire)) hits++
        if (forceInt(account, "getVipExpire", returnFarExpire)) hits++
        if (forceInt(account, "getVip_sec", returnLongRemainingSec)) hits++
        if (forceInt(account, "getVipSec", returnLongRemainingSec)) hits++
        // Some builds use millis as long
        forceLong(
            account,
            "getVipExpireTime",
            """
                const-wide v0, 0x1eaf039b000L
                return-wide v0
            """,
        )
        forceLong(
            account,
            "getVip_expire_time",
            """
                const-wide v0, 0x1eaf039b000L
                return-wide v0
            """,
        )

        // Local coins / bonus display (does not top-up server wallet)
        forceInt(account, "getCoins", returnManyCoins)
        forceInt(account, "getBonus", returnManyCoins)
        forceInt(account, "getTotalCoins", returnManyCoins)
        forceInt(account, "getTotalBonus", returnManyCoins)

        // Episode / playlet unlock flags
        val episode = "Lcom/newleaf/app/android/victor/player/bean/EpisodeEntity;"
        if (forceInt(episode, "getVip_status")) hits++
        if (forceInt(episode, "isVipFreeAdvUnlock")) hits++
        if (forceInt(episode, "is_adv_unlock")) hits++
        if (forceInt(episode, "is_wait_free_unlock")) hits++
        if (forceInt(episode, "getLimit_free_status")) hits++
        if (forceInt(episode, "getUnlock_cost", returnZero)) hits++
        if (forceInt(episode, "getOriginal_unlock_cost", returnZero)) hits++
        if (forceInt(episode, "getTodayFirstVipFreeAdvUnlock")) hits++
        forceBool(episode, "isHandWaitFreeUnlock")

        val playlet = "Lcom/newleaf/app/android/victor/player/bean/PlayletEntity;"
        forceInt(playlet, "getVip_status")
        forceInt(playlet, "getLimit_free_status")
        forceInt(playlet, "getConvert_free")

        val interact = "Lcom/newleaf/app/android/victor/interackPlayer/bean/InteractEntity;"
        forceInt(interact, "getVip_status")
        forceInt(interact, "isVipFreeAdvUnlock")
        forceInt(interact, "is_adv_unlock")

        val interactPlaylet =
            "Lcom/newleaf/app/android/victor/interackPlayer/bean/InteractPlayletEntity;"
        forceInt(interactPlaylet, "getVip_status")

        // Soft success — partial VIP still better than hard fail
    }
}
