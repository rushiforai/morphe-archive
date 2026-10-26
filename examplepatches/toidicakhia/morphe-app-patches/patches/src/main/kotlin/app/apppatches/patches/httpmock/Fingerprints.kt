package app.apppatches.patches.httpmock

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val VIP_CONFIG_CLASS = "Lcom/mock/sample/respository/model/VipConfigModel;"
private const val LICENSE_CLIENT_CLASS = "Lcom/pairip/licensecheck/LicenseClient;"

private fun fieldNames(method: com.android.tools.smali.dexlib2.iface.Method): List<String> =
    method.implementation?.instructions
        ?.filterIsInstance<ReferenceInstruction>()
        ?.mapNotNull { (it.reference as? FieldReference)?.name }
        .orEmpty()

private fun hasMethodCall(method: com.android.tools.smali.dexlib2.iface.Method): Boolean =
    method.implementation?.instructions
        ?.filterIsInstance<ReferenceInstruction>()
        ?.any { it.reference is MethodReference } == true

val IsVipUserFingerprint = Fingerprint(
    definingClass = VIP_CONFIG_CLASS,
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        fieldNames(method) == listOf("isVipUser") && !hasMethodCall(method)
    }
)

val IsPermanentVipValidFingerprint = Fingerprint(
    definingClass = VIP_CONFIG_CLASS,
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        val fields = fieldNames(method)
        "isVipUser" in fields &&
            "vipType" in fields &&
            "PERMANENT" in fields &&
            "vipExpireTime" !in fields &&
            !hasMethodCall(method)
    }
)

val IsVipValidFingerprint = Fingerprint(
    definingClass = VIP_CONFIG_CLASS,
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        val fields = fieldNames(method)
        "isVipUser" in fields && "vipType" in fields && "vipExpireTime" in fields
    }
)

val GetVipTypeFingerprint = Fingerprint(
    definingClass = VIP_CONFIG_CLASS,
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        val vipType = classDef.fields.firstOrNull { it.name == "vipType" }?.type
        vipType != null && method.returnType == vipType && "vipType" in fieldNames(method)
    }
)

val CheckLicenseFingerprint = Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

val SecurityCheckFingerprint = Fingerprint(
    definingClass = "Lo/jh6;",
    name = "h",
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;", "Lo/pm4;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)
