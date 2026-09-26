package app.template.patches.privacykit.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object IsProFingerprint : Fingerprint(
    definingClass = "Lcom/sal/privacykit/data/license/LicenseStatus;",
    name = "isPro",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object IsBlockedFingerprint : Fingerprint(
    definingClass = "Lcom/sal/privacykit/data/license/LicenseStatus;",
    name = "isBlocked",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object GetPlanFingerprint : Fingerprint(
    definingClass = "Lcom/sal/privacykit/data/license/LicenseStatus;",
    name = "getPlan",
    returnType = "Lcom/sal/privacykit/data/license/LicensePlan;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object GetStateFingerprint : Fingerprint(
    definingClass = "Lcom/sal/privacykit/data/license/LicenseStatus;",
    name = "getState",
    returnType = "Lcom/sal/privacykit/data/license/LicenseState;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object LicenseRemotePostFingerprint : Fingerprint(
    definingClass = "Lcom/sal/privacykit/data/license/LicenseRemoteClient;",
    name = "post",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;", "Z", "Lkotlin/coroutines/Continuation;"),
)

object HookEventReportFingerprint : Fingerprint(
    definingClass = "Lcom/sal/privacykit/xposed/HookEventClient;",
    name = "report",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Landroid/os/Bundle;", "Z", "Ljava/lang/String;"),
)