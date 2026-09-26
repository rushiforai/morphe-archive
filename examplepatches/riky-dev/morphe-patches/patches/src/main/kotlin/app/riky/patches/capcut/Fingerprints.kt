package app.riky.patches.capcut

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * CapCut 9.0.0 (R8-renamed VIP layer).
 *
 * Kotlin metadata mapping (jadx):
 * - SubscribeImpl          → Lcom/vega/subscribe/h;
 * - VipSubscribeManager    → Lcom/vega/subscribe/r;
 * - VipStatusGetterImpl    → Lcom/vega/subscribe/p;
 * - BusinessImpl           → Lcom/lemon/editor/c/d;
 * - Benefit                → Lcom/vega/subscriptionapi/b/b;
 * - UserVipInfo            → Lcom/lm/components/subscribe/config/UserVipInfo; (kept)
 */

/** Central VIP status: true when VipSubscribeManager.d == VIP. */
internal object VipSubscribeManagerIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/r;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/** SPI VipStatusGetter → delegates to VipSubscribeManager.f(). */
internal object VipStatusGetterImplFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/p;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** SubscribeImpl.isVip() → login check then VipSubscribeManager.f(). */
internal object SubscribeImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/h;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** SubscribeImpl.isSubscribe(). */
internal object SubscribeImplIsSubscribeFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/h;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** BusinessImpl.isVipUser() → SubscribeApi.isVip(). */
internal object BusinessImplIsVipUserFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/editor/c/d;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** UserVipInfo DTO flag (stable keep-name). */
internal object UserVipInfoIsVipUserFingerprint : Fingerprint(
    definingClass = "Lcom/lm/components/subscribe/config/UserVipInfo;",
    name = "isVipUser",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

internal object UserVipInfoGetFlagFingerprint : Fingerprint(
    definingClass = "Lcom/lm/components/subscribe/config/UserVipInfo;",
    name = "getFlag",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/** Benefit.flag (R8: getFlag → b). */
internal object BenefitGetFlagFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscriptionapi/b/b;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)
