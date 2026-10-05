package app.tkiethuynh.patches.misa.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal val userSettingIsPremiumFingerprint = Fingerprint(
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

internal val userSettingIsRemovedAdsFingerprint = Fingerprint(
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

internal val userSettingIsShowUpgradePremiumFingerprint = Fingerprint(
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

internal val userInfoIsPremiumFingerprint = Fingerprint(
    definingClass = "Lcom/misa/finance/model/UserInfo;",
    name = "isPremium",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(smali = "Lcom/misa/finance/model/UserInfo;->IsPremium:Z"),
    )
)

internal val userInfoIsRemovedAdsFingerprint = Fingerprint(
    definingClass = "Lcom/misa/finance/model/UserInfo;",
    name = "isRemovedAds",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(smali = "Lcom/misa/finance/model/UserInfo;->IsRemovedAds:Z"),
    )
)
