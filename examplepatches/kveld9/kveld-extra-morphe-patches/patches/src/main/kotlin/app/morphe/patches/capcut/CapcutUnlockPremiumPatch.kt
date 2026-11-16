package app.morphe.patches.capcut

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private object SubscribeImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object PayVipImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/editor/proxy/PayVipImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object UserVipInfoIsVipUserFingerprint : Fingerprint(
    definingClass = "Lcom/lm/components/subscribe/config/UserVipInfo;",
    name = "isVipUser",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object UserVipInfoGetFlagFingerprint : Fingerprint(
    definingClass = "Lcom/lm/components/subscribe/config/UserVipInfo;",
    name = "getFlag",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object UserDetailInfoIsVipUserFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/data/UserDetailInfo;",
    name = "isVipUser",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object UserDetailInfoGetFlagFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/data/UserDetailInfo;",
    name = "getFlag",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object VipUserServiceImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/legacy/service/VipUserServiceImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object SubscribeCloudImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/editor/proxy/SubscribeCloudImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object BusinessManagerBFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "B",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("isAnyVIP")
        } == true
    },
)

private object BusinessManagerYFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "y",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions ?: emptyList()
        instructions.any { (it as? ReferenceInstruction)?.reference.toString().contains("UserViewModel") } &&
            instructions.none { (it as? ReferenceInstruction)?.reference.toString().contains("isAnyVIP") }
    },
)

private object BusinessManagerXFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "x",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("UserViewModel")
        } == true
    },
)

private object BusinessManagerVFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "v",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/lemon/lv/clipmonetize/wrapper/BenefitResource;"),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions ?: emptyList()
        instructions.any { (it as? ReferenceInstruction)?.reference.toString().contains("getQuotaLeft") } &&
            instructions.none { (it as? ReferenceInstruction)?.reference.toString().contains("isLimitCount") }
    },
)

private object BusinessManagerAFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "A",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/lemon/lv/clipmonetize/wrapper/BenefitResource;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("isLimitCount")
        } == true
    },
)

private object BusinessManagerTFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "T",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/lemon/lv/clipmonetize/wrapper/BenefitResource;", "Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("supportTourist")
        } == true
    },
)

@Suppress("unused")
val capcutUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces CapCut VIP gates to return true (SubscribeImpl, PayVipImpl, UserVipInfo, UserDetailInfo, VipUserServiceImpl, SubscribeCloudImpl) plus central account status flags (BusinessManager). Cloud-gated assets may still fail.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_CAPCUT)

    execute {
        var patched = 0

        SubscribeImplIsVipFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        PayVipImplIsVipFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        UserVipInfoIsVipUserFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        UserVipInfoGetFlagFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        UserDetailInfoIsVipUserFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        UserDetailInfoGetFlagFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        VipUserServiceImplIsVipFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        SubscribeCloudImplIsVipFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        BusinessManagerBFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        BusinessManagerYFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        BusinessManagerXFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        BusinessManagerVFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        BusinessManagerAFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        BusinessManagerTFingerprint.method.replaceWithReturnBoolean(true)
        patched++

        println("[Unlock Premium] Applied $patched hooks -> VIP gates forced to true.")
    }
}
