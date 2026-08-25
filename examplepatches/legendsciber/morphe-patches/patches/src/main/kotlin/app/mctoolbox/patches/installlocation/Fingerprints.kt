package app.mctoolbox.patches.installlocation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * MinecraftActivity.onCreate(Landroid/os/Bundle;)V — the launcher gate.
 *
 * Confirmed smali (5.4.58, MinecraftActivity.smali:336): the very first
 * instruction is `const-string v0, "com.mojang.minecraftpe"`, used for
 * PackageManager.getPackageInfo + getInstallerPackageName. If MCPE is not
 * resolvable the NameNotFoundException handler (:catch_2) shows ErrorActivity
 * with "not_installed" and cancels onCreate.
 *
 * The single string filter is unambiguous — the literal appears exactly once
 * in this method.
 */
object McPackageLookupFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/mctoolbox/MinecraftActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("com.mojang.minecraftpe")
    )
)

/**
 * MinecraftActivity.onCreate — supported-version gate.
 *
 * Confirmed smali (:533): first call of Li60;->c(Ljava/lang/String;Z)I with
 * PackageInfo.versionName; a zero result falls through to a second c() call
 * and then to ErrorActivity "not_supported". Forcing the result of the FIRST
 * call to 1 makes every version count as supported.
 */
object McSupportedVersionFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/mctoolbox/MinecraftActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = "Li60;", name = "c")
    )
)

/**
 * MinecraftActivity.onCreate — the two ABI-aware version gates (smali :801
 * and :875), each shaped exactly as:
 *
 *   invoke-static {}, La0;->a()Z              (toolbox process is 64-bit?)
 *   iget-object ... ->V:Landroid/content/pm/PackageInfo;
 *   iget-object ... ->versionName:Ljava/lang/String;
 *   invoke-virtual ..., Li60;->c(...)Z        ← zero leads to
 *                                               "not_supported_64bit" / "_32bit"
 *
 * The earlier version gates (:533, :655) do NOT have the La0.a() call
 * immediately before them, so this 4-filter chain resolves to exactly these
 * two sites. Note :655 has inverted semantics (c()==TRUE raises an error),
 * which is why it must stay untouched.
 */
object McAbiVersionGateFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/mctoolbox/MinecraftActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = "La0;", name = "a"),
        fieldAccess(smali = "Lio/mrarm/mctoolbox/MinecraftActivity;->V:Landroid/content/pm/PackageInfo;"),
        fieldAccess(smali = "Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;"),
        methodCall(definingClass = "Li60;", name = "c")
    )
)

/**
 * RelaunchActivity.onCreate(Landroid/os/Bundle;)V — relaunch path gate with
 * the identical pattern (RelaunchActivity.smali:233):
 * `const-string v3, "com.mojang.minecraftpe"` → getPackageInfo →
 * NameNotFoundException → :catch_2 → ErrorActivity "not_installed".
 */
object RelaunchPackageLookupFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/mctoolbox/RelaunchActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("com.mojang.minecraftpe")
    )
)

/**
 * RelaunchActivity.onCreate — supported-version gate, same Li60;->c shape as
 * the main activity (first call decides).
 */
object RelaunchSupportedVersionFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/mctoolbox/RelaunchActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = "Li60;", name = "c")
    )
)
