package app.hungryshark.patches.installer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

private const val GET_INSTALLER_PACKAGE_NAME =
    "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;"
private const val GET_INSTALLING_PACKAGE_NAME =
    "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;"
private const val GET_INITIATING_PACKAGE_NAME =
    "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;"

object InstallerPackageNameFingerprint : Fingerprint(
    filters = listOf(methodCall(smali = GET_INSTALLER_PACKAGE_NAME)),
)

object InstallingPackageNameFingerprint : Fingerprint(
    filters = listOf(methodCall(smali = GET_INSTALLING_PACKAGE_NAME)),
)

object InitiatingPackageNameFingerprint : Fingerprint(
    filters = listOf(methodCall(smali = GET_INITIATING_PACKAGE_NAME)),
)
