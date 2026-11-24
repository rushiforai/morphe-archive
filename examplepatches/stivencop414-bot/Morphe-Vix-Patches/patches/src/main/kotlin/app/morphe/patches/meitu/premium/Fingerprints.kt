package app.morphe.patches.meitu.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val XX_VIP_UTIL = "Lcom/meitu/vip/util/XXVipUtil;"

/**
 * `isVip()` — the central VIP decision. Every other isVip() in the app delegates here,
 * so patching this one covers the majority of the premium checks.
 */
internal object IsVipFingerprint : Fingerprint(
    definingClass = XX_VIP_UTIL,
    name = "x0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `isValidUser()` — reads `sp_key_google_is_valid_user` and returns -1 before VIP init.
 * Forcing it to 1 keeps callers from treating the account as uninitialized.
 */
internal object ValidUserFingerprint : Fingerprint(
    definingClass = XX_VIP_UTIL,
    name = "w0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = emptyList(),
)

/**
 * `getVipType()` — instance method reading the cached field or `sp_key_subscribe_type`.
 * 1 reports a regular subscription.
 */
internal object VipTypeFingerprint : Fingerprint(
    definingClass = XX_VIP_UTIL,
    name = "m0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = emptyList(),
)

/** `isVipTrialMaterial(J)` — VIP or a free-trial right for the given material id. */
internal object TrialMaterialFingerprint : Fingerprint(
    definingClass = XX_VIP_UTIL,
    name = "y0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("J"),
)
