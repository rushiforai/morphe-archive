package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.googlephotos.misc.gms.Constants.MORPHE_PHOTOS_PACKAGE_NAME
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.gms.PackageNameConfig

@Suppress("unused")
val changeToOfficialPackageNamePatch = resourcePatch(
    name = "Change to official package name",
    description = "Retains the official package name (com.google.android.apps.photos) instead of renaming to " +
        "$MORPHE_PHOTOS_PACKAGE_NAME. This is an exceptional option strictly for non-root users whose devices " +
        "do not have Google Photos preinstalled by the OEM (such as custom ROMs or de-Googled devices). " +
        "Root users do not need this (simply deselect GmsCore support instead). " +
        "When selecting this, also enable 'Disable Play Store updates'.",
    default = false,
) {
    category("Official package name")
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.DISABLED
        }
    }

    execute {
        PackageNameConfig.useOfficialPackageName = true
    }
}
