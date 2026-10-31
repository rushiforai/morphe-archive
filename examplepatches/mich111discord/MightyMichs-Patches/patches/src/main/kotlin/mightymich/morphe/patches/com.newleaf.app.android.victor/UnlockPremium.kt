package mightymich.morphe.patches.reelshort

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

/**
 * ReelShort VIP unlock for com.newleaf.app.android.victor (4.2.20).
 *
 * Client stores membership on Account / episode beans:
 *  - getVip_status()I == 1 → treated as VIP
 *  - getVip_expire()I / getVip_sec() → remaining time window
 *  - getVip_type()I → plan type
 *  - EpisodeEntity isVipFreeAdvUnlock / is_adv_unlock → skip ad / paywall gates
 *
 * Previous builds only forced vip_status; UI and player still read expire/type
 * and episode flags, so membership looked unchanged. This version forces the
 * full local gate set.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Forces local VIP membership (status, type, expire) and unlocks " +
        "ad/paywall episode flags. Server-side purchases are not forged.",
    default = true
) {
    compatibleWith(ReelShortCompatibility.REELSHORT)

    val returnOne = """
        const/4 v0, 0x1
        return v0
    """

    // Unlimited / non-epoch sentinels (avoid 0 → UI shows 1970).
    // getVip_expire: -1 = no end date / lifetime in many clients
    // getVip_sec: remaining seconds (~31 years), not an absolute epoch
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

    fun forceInt(definingClass: String, name: String, smali: String = returnOne): Boolean {
        return try {
            val fp = Fingerprint(
                definingClass = definingClass,
                name = name,
                returnType = "I",
                parameters = emptyList()
            )
            fp.method.addInstructions(0, smali)
            true
        } catch (_: Exception) {
            false
        }
    }

    fun forceBool(definingClass: String, name: String): Boolean {
        return try {
            val fp = Fingerprint(
                definingClass = definingClass,
                name = name,
                returnType = "Z",
                parameters = emptyList()
            )
            fp.method.addInstructions(0, returnOne)
            true
        } catch (_: Exception) {
            false
        }
    }

    execute {
        var hits = 0

        // ----- Account (profile VIP badge / membership) -----
        val account = "Lcom/newleaf/app/android/victor/bean/Account;"
        if (forceInt(account, "getVip_status")) hits++
        if (forceInt(account, "getVip_type")) hits++
        if (forceInt(account, "getVip_expire", returnUnlimitedExpire)) hits++
        if (forceInt(account, "getVip_sec", returnLongRemainingSec)) hits++
        if (forceInt(account, "is_vip_renew")) hits++
        if (forceInt(account, "getOtpVip")) hits++
        if (forceInt(account, "getVipCategory")) hits++

        // CamelCase variant seen in some dexes
        forceInt(account, "getVipStatus")

        // ----- Episode / playlet paywall -----
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

        // Interactive player beans
        val interact = "Lcom/newleaf/app/android/victor/interackPlayer/bean/InteractEntity;"
        forceInt(interact, "getVip_status")
        forceInt(interact, "isVipFreeAdvUnlock")
        forceInt(interact, "is_adv_unlock")

        val interactPlaylet =
            "Lcom/newleaf/app/android/victor/interackPlayer/bean/InteractPlayletEntity;"
        forceInt(interactPlaylet, "getVip_status")

        // ----- String-anchored fallback: any ()I named getVip_status / getVipStatus -----
        for (marker in listOf("vip_status", "Vip_status", "vipStatus")) {
            try {
                val fp = Fingerprint(
                    name = "getVip_status",
                    returnType = "I",
                    parameters = emptyList(),
                    filters = listOf(string(marker))
                )
                fp.method.addInstructions(0, returnOne)
                hits++
            } catch (_: Exception) {
            }
            try {
                val fp = Fingerprint(
                    name = "getVipStatus",
                    returnType = "I",
                    parameters = emptyList(),
                    filters = listOf(string(marker))
                )
                fp.method.addInstructions(0, returnOne)
                hits++
            } catch (_: Exception) {
            }
        }

        if (hits == 0) {
            throw PatchException(
                "ReelShort: no VIP getters could be patched. " +
                    "Expected Account.getVip_status()I on 4.2.20."
            )
        }
    }
}
