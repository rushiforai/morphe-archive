package dev.jibon.notes.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

import dev.jibon.notes.patches.shared.filterCallResults

private object IrisDeviceAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/app/biometrics/iris/IrisApi;",
    name = "isDeviceAvailable",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val crashFixesPatch = bytecodePatch(
    name = "Crash fixes",
    description = "Reports no iris scanner, and finds the pen settings layouts and colour palettes after a " +
        "package rename (otherwise the colour picker crashes).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch)

    execute {
        IrisDeviceAvailableFingerprint.method.returnEarly(false)

        // These lookups assume the resources are filed under the running package name; after a rename
        // that depends on the tool (Clone app renames the resource table too, a manifest-only rename doesn't).
        val filter = "Lsamsungcompat/ResourcePackage;->get(Ljava/lang/String;)Ljava/lang/String;"
        val layouts = filterCallResults(
            "Lcom/samsung/android/sdk/pen/util/SpenLayoutUtil;",
            "Lcom/samsung/android/sdk/pen/Spen\$Companion;", "getSpenPackageName", filter,
        )
        val palettes = filterCallResults(
            "Lcom/samsung/android/sdk/pen/setting/color/SpenColorPaletteUtil;",
            "Landroid/content/Context;", "getPackageName", filter,
        )
        if (layouts == 0 || palettes == 0) {
            throw PatchException("Resource package lookups not found (layouts $layouts, palettes $palettes)")
        }
    }
}
