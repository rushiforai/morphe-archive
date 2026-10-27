package app.morphe.patches.word

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// -- Telemetry ----------------------------------------------------------------

// AdMeasurementPlatformData confirmed in Word DEX:
//   surface_sweep_word.tsv compat-bypass/installer-check:
//   classes5.dex Lcom/microsoft/office/adsmobile_admeasurementpartner/admeasurement/AdMeasurementPlatformData;->getInstallSource()
// getAIFA and getAppSetId share the same definingClass; exact name+signature anchors the index walk.
internal val wordGetAIFAFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/adsmobile_admeasurementpartner/admeasurement/AdMeasurementPlatformData;",
    name = "getAIFA",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

internal val wordGetAppSetIdFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/adsmobile_admeasurementpartner/admeasurement/AdMeasurementPlatformData;",
    name = "getAppSetId",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

// -- Integrity ----------------------------------------------------------------

internal val codeTransparencyCheckFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/microsoft/office/android/transparencyverification/CodeTransparencyVerificationCallback;",
        "Z",
    ),
)

// -- Login --------------------------------------------------------------------

internal val firstRunN0Fingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    strings = listOf(string("FRE Completed", StringComparisonType.EQUALS)),
)

internal val firstRunM0Fingerprint = Fingerprint(
    classFingerprint = firstRunN0Fingerprint,
    returnType = "V",
    parameters = listOf("Z", "Lcom/microsoft/office/officehub/objectmodel/IOnTaskCompleteListener;"),
)

internal val ftuxPaywallLauncherFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/microsoft/office/docsui/common/DrillInDialog;",
        "Lcom/microsoft/office/officehub/objectmodel/IOnTaskCompleteListener;",
    ),
)

internal val checkAndStartSSOIfRequiredFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/docsui/common/FileActivationSSOManager;",
    name = "checkAndStartSSOIfRequired",
    returnType = "Z",
    parameters = listOf("Z"),
)

internal val getIdentityForSignInNameFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/identity/IdentityLiblet;",
    name = "GetIdentityForSignInName",
    returnType = "Lcom/microsoft/office/identity/Identity;",
    parameters = listOf("Ljava/lang/String;", "Z", "Z"),
)

// -- Premium ------------------------------------------------------------------

internal val isPremiumPlanUpsellEnabledFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/plat/PlatFeatureGateHelper;",
    name = "isPremiumPlanUpsellEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

internal val isEnterpriseViewOLSCheckEnabledFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/plat/PlatFeatureGateHelper;",
    name = "IsEnterpriseViewOLSCheckEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

internal val hasFamilyPlanFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/licensing/LicenseInfo;",
    name = "HasFamilyPlan",
    returnType = "Z",
    parameters = emptyList(),
)

internal val hasPersonalPlanFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/licensing/LicenseInfo;",
    name = "HasPersonalPlan",
    returnType = "Z",
    parameters = emptyList(),
)

internal val hasPremiumPlanFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/licensing/LicenseInfo;",
    name = "HasPremiumPlan",
    returnType = "Z",
    parameters = emptyList(),
)

internal val getLicensingStateFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/officehub/util/OHubUtil;",
    name = "GetLicensingState",
    returnType = "Lcom/microsoft/office/licensing/LicensingState;",
    parameters = emptyList(),
)

internal val subscriptionDataIsTrialFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/mobile/paywallsdk/publics/SubscriptionData;",
    name = "isTrial",
    returnType = "Z",
    parameters = emptyList(),
)

internal val licenseStatusIsPremiumFingerprint = Fingerprint(
    name = "isPremium",
    returnType = "Z",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/microsoft/office/growth/upsellplugin/models/")
    },
)

internal val licenseSessionStateFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("I", "I", "I"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/microsoft/office/licensing/LicensingState;",
            name = "FromInt",
        ),
    ),
)

internal val licensingFGFingerprint = Fingerprint(
    returnType = "Lcom/microsoft/office/licensing/LicenseInfo;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/microsoft/office/licensing/UserAccountType;",
        "Ljava/lang/String;",
        "Z",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/microsoft/office/jni/NativeProxy;",
            name = "Glifu",
        ),
    ),
)

internal val subscriptionStatusYFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lcom/microsoft/office/inapppurchase/SubscriptionPurchaseController\$EntryPoint;",
            name = "SaveFlowUpsell",
        ),
    ),
)

internal val accountProfileInfoHasProfileFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/office/docsui/common/AccountProfileInfo;",
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        val flags = method.accessFlags
        val isCandidate = method.returnType == "Z" &&
            method.parameters.isEmpty() &&
            flags and AccessFlags.FINAL.value == 0 &&
            flags and AccessFlags.STATIC.value == 0 &&
            method.implementation?.instructions?.none {
                it.opcode.name.startsWith("INVOKE")
            } == true
        if (!isCandidate) return@Fingerprint false

        val readField = method.implementation?.instructions
            ?.filterIsInstance<Instruction22c>()
            ?.firstOrNull { it.opcode == Opcode.IGET_BOOLEAN }
            ?.reference as? FieldReference
            ?: return@Fingerprint false

        val bridges = classDef.methods.filter { m ->
            m.accessFlags and AccessFlags.BRIDGE.value != 0 &&
            m.accessFlags and AccessFlags.STATIC.value != 0 &&
            m.parameters.size == 2 &&
            m.parameters[0].type == "Lcom/microsoft/office/docsui/common/AccountProfileInfo;" &&
            m.parameters[1].type == "Z" &&
            m.returnType == "V"
        }
        val hasProfileWriter = bridges.getOrNull(1) ?: return@Fingerprint false

        val writtenField = hasProfileWriter.implementation?.instructions
            ?.filterIsInstance<Instruction22c>()
            ?.firstOrNull { it.opcode == Opcode.IPUT_BOOLEAN }
            ?.reference as? FieldReference
            ?: return@Fingerprint false

        readField.name == writtenField.name
    },
)

internal val accountSwitcherRunnableFingerprint = Fingerprint(
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/microsoft/office/docsui/common/AccountActionsController;",
            name = "setAccountInfoDialog",
        ),
        methodCall(
            definingClass = "Lcom/microsoft/office/identity/IdentityLiblet;",
            name = "GetActiveIdentity",
        ),
    ),
)

internal val storageQuotaCheckFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/microsoft/office/identity/Identity;"),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/microsoft/office/docsui/controls/unifiedStorageQuota/")
    },
)
