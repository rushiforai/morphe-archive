package app.bigyank.patches.shealth

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Knox / integrity ─────────────────────────────────────────────────────────
// Stable Samsung SDK types — not R8-renamed app code.

object KnoxAdapterCheckKnoxCompromisedExternalFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "checkKnoxCompromisedExternal",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
)

object KnoxAdapterCheckKnoxCompromisedInternalFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "checkKnoxCompromisedInternal",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;"),
)

object KnoxAdapterIsKnoxAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "isKnoxAvailable",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

object KnoxAdapterIsKnoxAvailableCoreFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "isKnoxAvailableCore",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

object KnoxAdapterIsAksSakMandatoryFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "isAksSakMandatory",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

object KnoxAdapterShouldUseKnoxFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "shouldUseKnox",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

object KnoxAdapterIsSupportedTimaVersionFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "isSupportedTimaVersion",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

object IcccAdapterCheckKnoxCompromisedFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/IcccAdapter;",
    name = "checkKnoxCompromised",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "Z"),
)

object KnoxControlIsKnoxAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/KnoxControl;",
    name = "isKnoxAvailable",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
)

object KnoxControlCheckKnoxCompromisedFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/KnoxControl;",
    name = "checkKnoxCompromised",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

object KnoxControlCheckWarrantyBitFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/KnoxControl;",
    name = "checkWarrantyBit",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Ljava/lang/String;"),
)

object IKnoxControlProxyIsKnoxAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/IKnoxControl\$Stub\$Proxy;",
    name = "isKnoxAvailable",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
)

object SakCheckerIsSupportedFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/sak/SakChecker;",
    name = "isSupported",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

object SamsungSakCheckerC6rFingerprint : Fingerprint(
    definingClass = "Lc6r;",
    name = "isSakSupported",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

object KnoxAdapterCheckKnoxInitMigConditionFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "checkKnoxInitMigCondition",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;"),
)

object KnoxAdapterIsLicenseActivatedFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/service/health/security/KnoxAdapter;",
    name = "isLicenseActivated",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

object IKnoxControlProxyRequestKeyInitForKnoxFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/IKnoxControl\$Stub\$Proxy;",
    name = "requestKeyInitForKnox",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(
        "Lcom/samsung/android/sdk/healthdata/privileged/IResultObserver;",
        "Z",
    ),
)

// ── Samsung Account provider bypass ──────────────────────────────────────────

object SamsungAccountUtilsIsAccountProviderSupportedFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/samsungaccount/SamsungAccountUtils;",
    name = "isAccountProviderSupported",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

object SamsungAccountUtilsGetSamsungAccountIdFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/sdk/healthdata/privileged/samsungaccount/SamsungAccountUtils;",
    name = "getSamsungAccountId",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
)

object UtilGetSupportAccountManagerProviderFingerprint : Fingerprint(
    definingClass = "Lcom/osp/app/signin/sasdk/common/Util;",
    name = "getSupportAccountManagerProvider",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

object UtilIsAccountSignedInFromAccountManagerProviderFingerprint : Fingerprint(
    definingClass = "Lcom/osp/app/signin/sasdk/common/Util;",
    name = "isAccountSignedInFromAccountManagerProvider",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)
