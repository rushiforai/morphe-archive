package mightymich.morphe.patches.com.newleaf.app.android.victor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * ReelShort Unlock Premium + episode unlock.
 *
 * Users reported: VIP UI looks active but locked episodes freeze forever and never
 * start. Root cause: Account VIP getters were forced, but chapter/episode lock
 * flags (is_lock / needUnlock / lockStatus / show_unlock_btn) still blocked the
 * player, which waited for an unlock callback that never arrived.
 *
 * This revision also forces those local lock/paywall gates so playback can start.
 * Server DRM / paid stream tokens may still apply on some titles.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Forces local VIP membership and unlocks episode lock / paywall flags " +
        "so locked chapters do not freeze the player. Does not forge server purchases.",
    default = true,
) {
    compatibleWith(ReelShortCompatibility.REELSHORT)

    execute {
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """
        val returnFarExpire = """
            const v0, 0x7fffffff
            return v0
        """
        val returnLongRemaining = """
            const v0, 0x3b9aca00
            return v0
        """
        val returnZero = """
            const/4 v0, 0x0
            return v0
        """
        val returnMany = """
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
                Fingerprint(
                    definingClass = definingClass,
                    name = methodName,
                    returnType = returnType,
                    parameters = emptyList(),
                ).method.addInstructions(0, smali)
                true
            } catch (_: Exception) {
                false
            }
        }

        var hits = 0

        val account = "Lcom/newleaf/app/android/victor/bean/Account;"
        for (name in listOf(
            "getVip_status", "getVipStatus", "getVip_type", "getVipType",
            "getOtpVip", "getVipCategory", "is_vip_renew",
        )) {
            if (force(account, name, "I", returnTrue)) hits++
        }
        if (force(account, "is_vip", "Z", returnTrue)) hits++
        if (force(account, "getVip_expire", "I", returnFarExpire)) hits++
        if (force(account, "getVipExpire", "I", returnFarExpire)) hits++
        if (force(account, "getVip_sec", "I", returnLongRemaining)) hits++
        if (force(account, "getVipSec", "I", returnLongRemaining)) hits++
        force(
            account, "getVipExpireTime", "J",
            """
                const-wide v0, 0x1eaf039b000L
                return-wide v0
            """,
        )
        force(account, "getCoins", "I", returnMany)
        force(account, "getBonus", "I", returnMany)

        val episode = "Lcom/newleaf/app/android/victor/player/bean/EpisodeEntity;"
        for (name in listOf(
            "getVip_status", "isVipFreeAdvUnlock", "is_adv_unlock",
            "is_wait_free_unlock", "getLimit_free_status",
            "getTodayFirstVipFreeAdvUnlock",
        )) {
            if (force(episode, name, "I", returnTrue)) hits++
        }
        for (name in listOf("getUnlock_cost", "getOriginal_unlock_cost", "getShow_unlock_btn")) {
            if (force(episode, name, "I", returnZero)) hits++
        }
        for (name in listOf("isHandWaitFreeUnlock", "isVipFreeAdvUnlock")) {
            force(episode, name, "Z", returnTrue)
        }
        for (name in listOf("getIsLock", "isLock", "isLocked", "needUnlock")) {
            if (force(episode, name, "Z", returnFalse)) hits++
            if (force(episode, name, "I", returnZero)) hits++
        }
        for (name in listOf("getLockStatus", "lockStatus", "getLock_status")) {
            if (force(episode, name, "I", returnZero)) hits++
            if (force(episode, name, "Z", returnFalse)) hits++
        }

        val lockFalseNames = setOf(
            "getIsLock", "isLock", "isLocked", "needUnlock", "getNeedUnlock",
            "is_lock", "getIs_lock",
        )
        val lockZeroNames = setOf(
            "getLockStatus", "lockStatus", "getLock_status", "getShow_unlock_btn",
            "getUnlock_cost", "getOriginal_unlock_cost", "getUnlockCost",
        )
        val unlockTrueNames = setOf(
            "isVipFreeAdvUnlock", "isHandWaitFreeUnlock", "is_adv_unlock",
            "is_wait_free_unlock", "canPlay", "isUnlock", "getIsUnlock",
        )

        val seen = mutableSetOf<String>()
        for (marker in listOf(
            "is_lock=", ",isLock=", "needUnlock", "lockStatus=",
            "show_unlock_btn", "isVipFreeAdvUnlock", "EpisodeEntity",
        )) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                val t = def.type
                if (!t.contains("newleaf") && !t.contains("victor") && !t.contains("crazymaple")) {
                    continue
                }
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    val name = method.name
                    try {
                        when {
                            name in lockFalseNames && method.returnType == "Z" -> {
                                method.addInstructions(0, returnFalse)
                                hits++
                            }
                            name in lockFalseNames && method.returnType == "I" -> {
                                method.addInstructions(0, returnZero)
                                hits++
                            }
                            name in lockZeroNames && method.returnType == "I" -> {
                                method.addInstructions(0, returnZero)
                                hits++
                            }
                            name in lockZeroNames && method.returnType == "Z" -> {
                                method.addInstructions(0, returnFalse)
                                hits++
                            }
                            name in unlockTrueNames && method.returnType == "Z" -> {
                                method.addInstructions(0, returnTrue)
                                hits++
                            }
                            name in unlockTrueNames && method.returnType == "I" -> {
                                method.addInstructions(0, returnTrue)
                                hits++
                            }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
