package app.template.patches.viddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private val COMPATIBILITY_VIDDIT = Compatibility(
    packageName = "aculix.viddit.downloader",
    name = "Viddit",
    description = "Reddit video downloader",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x6200EE,
    targets = listOf(AppTarget(version = "4.3"))
)

object PremiumCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lzh6;",
    parameters = listOf("Lha2;", "Lcom/revenuecat/purchases/CustomerInfo;"),
    custom = { method, _ ->
        method.name.contains("getPurchaseStatus\$lambda\$1") ||
                method.implementation?.instructions?.any {
                    it.toString().contains("getEntitlements")
                } == true
    }
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces the app to always consider the user as premium.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIDDIT)

    execute {
        // Method is static, so p0 = the `ha2` lambda param, p1 = CustomerInfo param.
        // Use v1 (aliases p1 if .locals 0) as scratch so we don't clobber p0
        // before calling invoke-interface on it.
        PremiumCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x1
                invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                invoke-interface {p0, v1}, Lha2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                sget-object v1, Lzh6;->a:Lzh6;
                return-object v1
            """
        )
    }
}