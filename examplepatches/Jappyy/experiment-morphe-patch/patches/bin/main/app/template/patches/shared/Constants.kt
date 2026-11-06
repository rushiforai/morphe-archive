package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val BUS_FINDER = Compatibility(
        name = "BusFinder", // App name as it appears in the Android launcher.
        packageName = "biz.zetesis.busfinderdroid",
        //
        // IMPORTANT: This declaration must match the file type on APKMirror/UpToDown.
        //
        // If this is declared as one type such as APK, but the file type on APKMirror/UpToDown
        // is different such as APKM or XAPK, then Morphe Manager will _not_ send the user
        // to APKMirror/UpToDown.
        apkFileType = ApkFileType.XAPK,
        // Icon color in Morphe Manager. Should be the background or primary color of the app icon.
        appIconColor = 0xF57C14,
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version you used to develop
            // your patches so users have a version 100% confirmed as working.
            //
            // It is highly preferred to use app versions that are
            // available on apkmirror.com or uptodown.com, as Morphe web-search will
            // redirect users to these sites. If an app version is not available
            // on ApkMirror or UpToDown, then the user is sent to Google search.
                        
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "4.16.0",
            )
        )
    )
}
