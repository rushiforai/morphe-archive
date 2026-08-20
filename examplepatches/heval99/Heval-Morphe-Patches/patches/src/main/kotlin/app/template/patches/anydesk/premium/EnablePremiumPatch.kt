package app.template.patches.anydesk.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ANYDESK
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features by patching the Java license wrapper " +
        "methods in JniAdExt: isFreeLicense returns false (app treats the license " +
        "as paid), account registration and address book are allowed, and the " +
        "remove-license option is available in settings. Note: the underlying " +
        "license validation is native (libanydesk.so) and cannot be patched via " +
        "bytecode — this patch only affects the Java-layer feature gates.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANYDESK)

    execute {
        // Make the app think the current license is not free (i.e. is a paid license).
        IsFreeLicenseFingerprint.methodOrNull?.returnEarly(false)

        // Allow account registration (disallowed on free licenses).
        LicenseAllowsAccountRegistrationFingerprint.methodOrNull?.returnEarly(true)

        // Allow address book / roster usage (disallowed on free licenses).
        LicenseAllowsAddressBookFingerprint.methodOrNull?.returnEarly(true)

        // Make the remove-license option available in settings.
        CanRemoveLicenseFingerprint.methodOrNull?.returnEarly(true)
    }
}