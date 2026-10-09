package app.aphelion.patches.installer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

private const val GET_INSTALLER_PACKAGE_NAME =
    "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;"
private const val GET_INSTALLING_PACKAGE_NAME =
    "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;"
private const val GET_INITIATING_PACKAGE_NAME =
    "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;"

object AdSdkInstallerFingerprint : Fingerprint(
    definingClass = "Lads_mobile_sdk/ja2;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lhp0;"),
    filters = listOf(methodCall(smali = GET_INSTALLER_PACKAGE_NAME)),
)

object LicenseInstallerFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(methodCall(smali = GET_INSTALLING_PACKAGE_NAME)),
)

object D32InstallerFingerprint : Fingerprint(
    definingClass = "Ld32;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(methodCall(smali = GET_INSTALLER_PACKAGE_NAME)),
)

object Xu2InstallerFingerprint : Fingerprint(
    definingClass = "Lxu2;",
    name = "e",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(smali = GET_INSTALLER_PACKAGE_NAME)),
)

object Bw5InstallerFingerprint : Fingerprint(
    definingClass = "Lbw5;",
    name = "k",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("La7;"),
    filters = listOf(methodCall(smali = GET_INSTALLER_PACKAGE_NAME)),
)

object Fp5InstallingInstallerFingerprint : Fingerprint(
    definingClass = "Lfp5;",
    name = "i",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.BRIDGE, AccessFlags.SYNTHETIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/pm/InstallSourceInfo;"),
    filters = listOf(methodCall(smali = GET_INSTALLING_PACKAGE_NAME)),
)

object Fp5InitiatingInstallerFingerprint : Fingerprint(
    definingClass = "Lfp5;",
    name = "p",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.BRIDGE, AccessFlags.SYNTHETIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/pm/InstallSourceInfo;"),
    filters = listOf(methodCall(smali = GET_INITIATING_PACKAGE_NAME)),
)
