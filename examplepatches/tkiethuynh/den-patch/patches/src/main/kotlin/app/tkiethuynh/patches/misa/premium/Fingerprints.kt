package app.tkiethuynh.patches.misa.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object UserSettingIsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/misa/finance/common/UserSetting;",
    name = "isPremium",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("IsPremium"),
        methodCall(definingClass = "Lcom/misa/finance/common/MISACache;", name = "getBoolean"),
    )
)

object UserSettingIsRemovedAdsFingerprint : Fingerprint(
    definingClass = "Lcom/misa/finance/common/UserSetting;",
    name = "isIsRemovedAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("IsRemovedAds"),
        methodCall(definingClass = "Lcom/misa/finance/common/MISACache;", name = "getBoolean"),
    )
)

object UserSettingIsShowUpgradePremiumFingerprint : Fingerprint(
    definingClass = "Lcom/misa/finance/common/UserSetting;",
    name = "isShowUpgradePremium",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("KeyShowUpgradePremium"),
        methodCall(definingClass = "Lcom/misa/finance/common/MISACache;", name = "getBoolean"),
    )
)

object UserInfoIsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/misa/finance/model/UserInfo;",
    name = "isPremium",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(smali = "Lcom/misa/finance/model/UserInfo;->IsPremium:Z"),
    )
)

object UserInfoIsRemovedAdsFingerprint : Fingerprint(
    definingClass = "Lcom/misa/finance/model/UserInfo;",
    name = "isRemovedAds",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(smali = "Lcom/misa/finance/model/UserInfo;->IsRemovedAds:Z"),
    )
)
