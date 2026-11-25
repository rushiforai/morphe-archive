package app.gcontacts.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Google Contacts.
     *
     * Pinned to the verified version: the microG patch rewrites Play services names found
     * by string value rather than by fingerprint, but the manifest shape (which Play
     * services permissions the app declares) is what it asserts on, and that does move
     * between releases.
     */
    val COMPATIBILITY_GOOGLE_CONTACTS = Compatibility(
        name = "Google Contacts",
        packageName = "com.google.android.contacts",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(
                version = "4.90.16.998876676"
            )
        )
    )

    val COMPATIBILITY_GCONTACTS = arrayOf(COMPATIBILITY_GOOGLE_CONTACTS)
}
