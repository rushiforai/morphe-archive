package app.fakh.patches.coverscreen

import app.fakh.patches.coverscreen.shared.Constants.COMPATIBILITY_COVERSCREEN
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Builds the `ad-*` query parameters of the GIF keyboard's ad request: advertising ID, device
 * make and model, OS version, screen size, language and carrier name with MCC-MNC.
 */
private val adParamsFingerprint = Fingerprint(
    returnType = "Ljava/util/Map;",
    custom = { method, classDef ->
        classDef.type == "Lapps/ijp/tenor/api/KlipyGifRepository;" &&
            method.name == "adParams" &&
            method.implementation != null
    },
)

/**
 * Only ad SDKs ask for these. Without them the advertising ID reads as zeros and the Privacy
 * Sandbox ad APIs are off limits. READ_PHONE_STATE stays: the cover engine uses it for call state.
 */
private val adPermissionsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val permissions = manifest.getElementsByTagName("uses-permission")
            (0 until permissions.length).map { permissions.item(it) as Element }
                .filter {
                    it.getAttribute("android:name").let { name ->
                        name == "com.google.android.gms.permission.AD_ID" ||
                            name.startsWith("android.permission.ACCESS_ADSERVICES_")
                    }
                }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Turns off Firebase Analytics, Crashlytics, Performance and Sessions, and stops the GIF " +
        "keyboard from sending your advertising ID, device model, carrier and screen size with its ad requests. " +
        "Also removes the ad ID and ad services permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_COVERSCREEN)
    category("Privacy")
    dependsOn(firebaseManifestPatch(), adPermissionsPatch)

    execute {
        adParamsFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
                move-result-object v0
                return-object v0
            """,
        )
    }
}
