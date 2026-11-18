package io.github.kirby1997.patches.feeld

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Feeld enforces a hard "Update Feeld to continue connecting / This version of
// Feeld is not supported" wall driven by an app-version check. The app reads its
// own version from react-native-device-info: RNDeviceModule.getConstants() reads
// PackageInfo.versionName and exposes it to the JS layer as the "appVersion"
// constant, which is also sent to Feeld's API as the `x-app-version` request
// header. When that version is below the server's minimum-supported version the
// wall is shown (server-driven), and the same value feeds any client-side
// forceUpdate/semver comparison in the JS bundle.
//
// There is no smali string constant for the version and the check itself lives
// in the (unpatchable) Hermes bundle, so the leverage point is the single native
// source of the version: getPackageInfo(). Overriding versionName on the
// PackageInfo it returns makes every downstream reader — the "appVersion"
// constant, the x-app-version header, and any local semver compare — see a
// version far above any minimum, so the wall never triggers.
//
// buildNumber (PackageInfo.versionCode, an int) is left untouched. The only
// side effect is that analytics/crash tooling that reads the device-info version
// will report the spoofed value; nothing functional depends on it.

object DeviceInfoGetPackageInfoFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Landroid/content/pm/PackageInfo;",
    parameters = listOf(),
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "getPackageInfo",
)

@Suppress("unused")
val spoofAppVersionPatch = bytecodePatch(
    name = "Bypass forced update (spoof app version)",
    description = "Reports a very high app version (99.0.0) from react-native-device-info so Feeld's \"version not supported\" force-update wall never triggers. Overrides versionName at its native source, covering both the appVersion constant and the x-app-version header; buildNumber is unchanged.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        val method = DeviceInfoGetPackageInfoFingerprint.method
        // getPackageInfo() ends with `return-object p0`, where p0 holds the
        // PackageInfo (.locals 2, so v0 is free). Insert just before that return
        // to overwrite versionName on the instance that is about to be returned.
        method.addInstructions(
            method.implementation!!.instructions.size - 1,
            """
                const-string v0, "99.0.0"
                iput-object v0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
            """,
        )
    }
}
