@file:Suppress("unused")
package app.bugsmith.patches.pingo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Pingo uses Superwall SDK for paywall/subscription management.
 * The key check is Entitlement.isActive which gates premium features.
 */
object EntitlementIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/superwall/sdk/models/entitlements/Entitlement;",
    name = "isActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf()
)

/**
 * Pingo uses Pairip license check to verify installation source.
 * performLocalInstallerCheck() verifies the app was installed from Play Store.
 * We bypass this to allow patched APK to work.
 */
object PerformLocalInstallerCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf()
)

/**
 * Superwall checks if user is logged in before allowing access.
 * Bypassing this allows the app to work without Google login.
 */
object IsLoggedInFingerprint : Fingerprint(
    definingClass = "Lcom/superwall/sdk/identity/IdentityManager;",
    name = "isLoggedIn",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf()
)

@Suppress("unused")
val pingoPremiumPatch = bytecodePatch(
    name = "Pingo Premium",
    description = "Unlocks premium features by bypassing Superwall paywall checks."
) {
    compatibleWith(
        Compatibility(
            packageName = "com.picoai.languageapp.android",
            name = "Pingo",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFFFFF,
            targets = listOf(
                AppTarget(version = "5.4.8")
            )
        )
    )

    execute {
        // Bypass Superwall paywall - make Entitlement.isActive() return true
        EntitlementIsActiveFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
        
        // Bypass Pairip license check - make performLocalInstallerCheck() return true
        PerformLocalInstallerCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
        
        // Bypass login requirement - make isLoggedIn() return true
        IsLoggedInFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
