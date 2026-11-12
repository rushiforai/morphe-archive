package app.template.patches.shohay

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHOHAY
import org.w3c.dom.Element

/**
 * The original Shohay APK is signed by Google Play (signer SHA-1
 * 0705edb5925e02d8a4dd1bfbaad25cc33d622876). MicroG RE sends the calling
 * app's package name + signature digest to Google when minting the OAuth
 * token for Google Sign-In; a re-signed (patched) app has a different
 * signature, so Google rejects the token and sign-in fails with error 8
 * (INTERNAL_ERROR).
 *
 * MicroG RE has a built-in signature-spoof mechanism: it reads the
 * calling app's own manifest
 * `<meta-data android:name="app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE">`
 * and sends that value to Google instead of the installed signature.
 * This resource patch adds that meta-data (the original Play SHA-1) to
 * the manifest, so the re-signed app passes Google's OAuth signature
 * check. Pair with the 'MicroG RE Google Sign-In' bytecode patch.
 */
@Suppress("unused")
val shohayManifestPatch = resourcePatch(
    name = "MicroG signature spoof",
    description = "Adds the original Play signature (SHA-1) as the app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE manifest meta-data, so MicroG RE sends the original signature to Google during sign-in and the re-signed app is accepted. Required for the 'MicroG RE Google Sign-In' patch. Verified on Shohay 2.1.1.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SHOHAY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val metaData = document.createElement("meta-data")
            metaData.setAttributeNS(
                "http://schemas.android.com/apk/res/android",
                "android:name",
                "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"
            )
            metaData.setAttributeNS(
                "http://schemas.android.com/apk/res/android",
                "android:value",
                "0705edb5925e02d8a4dd1bfbaad25cc33d622876"
            )
            application.appendChild(metaData)
        }
    }
}
