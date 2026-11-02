package mightymich.morphe.patches.com.newleaf.app.android.victor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Forces local VIP membership (status, type, expire) and unlocks " +
        "ad/paywall episode flags. Server-side purchases are not forged.",
    default = true,
) {
    compatibleWith(ReelShortCompatibility.REELSHORT)

    execute {
        val returnOne = """
            const/4 v0, 0x1
            return v0
        """
        val returnUnlimitedExpire = """
            const/4 v0, -0x1
            return v0
        """
        val returnLongRemainingSec = """
            const v0, 0x3B9ACA00
            return v0
        """
        val returnZero = """
            const/4 v0, 0x0
            return v0
        """

        fun forceInt(definingClass: String, methodName: String, smali: String = returnOne): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = methodName,
                    returnType = "I",
                    parameters = emptyList(),
                )
                fp.method.addInstructions(0, smali)
                true
            } catch (_: Exception) {
                false
            }
        }

        fun forceBool(definingClass: String, methodName: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = methodName,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                fp.method.addInstructions(0, returnOne)
                true
            } catch (_: Exception) {
                false
            }
        }

        var hits = 0

        val account = "Lcom/newleaf/app/android/victor/bean/Account;"
        if (forceInt(account, "getVip_status")) hits++
        if (forceInt(account, "getVip_type")) hits++
        if (forceInt(account, "getVip_expire", returnUnlimitedExpire)) hits++
        if (forceInt(account, "getVip_sec", returnLongRemainingSec)) hits++
        if (forceInt(account, "is_vip_renew")) hits++
        if (forceInt(account, "getOtpVip")) hits++
        if (forceInt(account, "getVipCategory")) hits++
        forceInt(account, "getVipStatus")

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

        if (hits == 0) {
            throw PatchException(
                "ReelShort: no VIP getters could be patched. " +
                    "Expected Account.getVip_status()I on 4.2.20.",
            )
        }
    }
}
