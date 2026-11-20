package mightymich.morphe.patches.com.storymatrix.drama

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * DramaBox Unlock Premium + section/chapter unlock.
 *
 * VIP-only forcing left locked episodes spinning: player waited on unlock status
 * (needPay / isLocked / UnlockStatus) that never flipped. This also clears those
 * local gates on Section / Chapter / UnlockStatus models.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces DramaBox VIP checks and unlocks section/chapter lock flags " +
        "so premium episodes do not freeze. Server-side DRM may still apply.",
    default = true,
) {
    compatibleWith(DramaBoxCompatibility.DRAMABOX)

    execute {
        var hits = 0
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """
        val returnZero = """
            const/4 v0, 0x0
            return v0
        """

        fun forceZ(cls: String, name: String, smali: String): Boolean {
            return try {
                Fingerprint(
                    definingClass = cls,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                ).method.addInstructions(0, smali)
                true
            } catch (_: Exception) {
                false
            }
        }

        fun forceI(cls: String, name: String, smali: String): Boolean {
            return try {
                Fingerprint(
                    definingClass = cls,
                    name = name,
                    returnType = "I",
                    parameters = emptyList(),
                ).method.addInstructions(0, smali)
                true
            } catch (_: Exception) {
                false
            }
        }

        val vipTrue = listOf(
            "Lcom/storymatrix/drama/api/login/UserInfo;" to "isVip",
            "Lcom/storymatrix/drama/api/login/LoginResult;" to "isVip",
            "Lcom/lib/data/Record;" to "isVipType",
            "Lcom/lib/data/SubInfoList;" to "isVip",
            "Lcom/storymatrix/drama/api/ad/config/SplashAdShowConfig;" to "isVIP",
        )
        for ((cls, name) in vipTrue) {
            if (forceZ(cls, name, returnTrue)) hits++
        }

        for (cls in listOf(
            "Lcom/lib/data/Section;",
            "Lcom/lib/data/Chapter;",
            "Lcom/lib/data/ChapterVo;",
            "Lcom/lib/data/ChapterInfo;",
            "Lcom/lib/data/ChapterBean;",
            "Lcom/lib/data/UnlockStatus;",
            "Lcom/lib/data/SectionUnlockStatus;",
            "Lcom/lib/data/UnlockData;",
        )) {
            for (name in listOf("needPay", "isLocked", "isLock", "getIsLock", "isVipTheater")) {
                if (forceZ(cls, name, returnFalse)) hits++
            }
            for (name in listOf("isFree", "isVip", "isVIP", "getIsVip", "canPlay", "isUnlock")) {
                if (forceZ(cls, name, returnTrue)) hits++
            }
            for (name in listOf("getUnlockStatus", "unlockStatus", "getLockStatus", "lockStatus")) {
                if (forceI(cls, name, returnZero)) hits++
                if (forceZ(cls, name, returnFalse)) hits++
            }
        }

        val forceTrueNames = setOf(
            "isVip", "isVIP", "isVipType", "getIsVip", "isVipEquity",
            "isVipTheater", "isMemberShip", "isSubCoinVip", "isFree",
            "canPlay", "isUnlock", "getIsUnlock",
        )
        val forceFalseNames = setOf(
            "needPay", "isLocked", "isLock", "getIsLock", "getNeedPay",
        )
        val forceZeroNames = setOf(
            "getUnlockStatus", "unlockStatus", "getLockStatus", "lockStatus",
        )

        val markers = listOf(
            ", isVip=", "SubInfoList(isVip=", "isVip()Z", "needPay",
            "UnlockStatus", "SectionUnlockStatus", ", isFree=", "isLocked",
        )
        val seen = mutableSetOf<String>()
        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Lcom/google") || t.startsWith("Lcom/facebook") ||
                    t.startsWith("Lkotlin") || t.startsWith("Ljava") ||
                    t.startsWith("Lcom/sobot") || t.startsWith("Lcom/bytedance")
                ) {
                    continue
                }
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue

                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    val name = method.name
                    try {
                        when {
                            name in forceTrueNames && method.returnType == "Z" -> {
                                method.addInstructions(0, returnTrue)
                                hits++
                            }
                            name in forceTrueNames && method.returnType == "Ljava/lang/Boolean;" -> {
                                method.addInstructions(
                                    0,
                                    """
                                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                        return-object v0
                                    """,
                                )
                                hits++
                            }
                            name in forceFalseNames && method.returnType == "Z" -> {
                                method.addInstructions(0, returnFalse)
                                hits++
                            }
                            name in forceZeroNames && method.returnType == "I" -> {
                                method.addInstructions(0, returnZero)
                                hits++
                            }
                            name in forceZeroNames && method.returnType == "Z" -> {
                                method.addInstructions(0, returnFalse)
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
