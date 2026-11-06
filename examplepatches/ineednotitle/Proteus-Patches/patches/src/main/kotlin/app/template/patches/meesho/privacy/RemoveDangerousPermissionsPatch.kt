package app.template.patches.meesho.privacy

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import org.w3c.dom.Element

// Strip privacy-invasive permissions from Meesho's manifest.
//
// εxodus report 766078 (Meesho 28.8) lists 39 permissions, many flagged
// "dangerous": READ_SMS, SEND_SMS, READ_CONTACTS, WRITE_CONTACTS,
// READ_PHONE_STATE, READ_PHONE_NUMBERS, RECORD_AUDIO/AUDIO_CAPTURE,
// ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION, READ/WRITE_EXTERNAL_STORAGE,
// DETECT_SCREEN_CAPTURE, AD_ID and the ACCESS_ADSERVICES_* family.
//
// Per request, STORAGE and SMS permissions are KEPT (READ_EXTERNAL_STORAGE,
// WRITE_EXTERNAL_STORAGE, READ_SMS, SEND_SMS) — they are used for media
// download/share and OTP autofill convenience. Everything else dangerous is
// removed:
//
//   • contacts read/write        — contact syncing for share/referral
//   • phone state / numbers      — used by Truecaller SDK and device-id
//                                  collection; Truecaller login may degrade
//   • RECORD_AUDIO / AUDIO_CAPTURE — in-app support voice calls (Verloop)
//   • fine + coarse location     — delivery address auto-detect; the app falls
//                                  back to manual pincode entry
//   • DETECT_SCREEN_CAPTURE      — screenshot detection (anti-leak nag)
//   • AD_ID + ACCESS_ADSERVICES_* — advertising measurement
//
// Kept on purpose: INTERNET, ACCESS_NETWORK_STATE/WIFI_STATE, VIBRATE,
// WAKE_LOCK, POST_NOTIFICATIONS, RECEIVE_BOOT_COMPLETED, FOREGROUND_SERVICE(+),
// BIND_GET_INSTALL_REFERRER_SERVICE, c2dm RECEIVE, and the signature-level
// custom permissions (com.truecaller…, com.meesho.supply.DYNAMIC_RECEIVER…)
// that SDKs declare.
//
// The patch only deletes exact-name <uses-permission>/<uses-permission-sdk-23>
// entries; anything not in the removal set is preserved verbatim, so a future
// manifest simply keeps whatever is not listed here.

private val PERMISSIONS_TO_REMOVE = setOf(
    "android.permission.READ_CONTACTS",
    "android.permission.WRITE_CONTACTS",
    "android.permission.READ_PHONE_STATE",
    "android.permission.READ_BASIC_PHONE_STATE",
    "android.permission.READ_PHONE_NUMBERS",
    "android.permission.RECORD_AUDIO",
    "android.permission.AUDIO_CAPTURE",
    "android.permission.ACCESS_FINE_LOCATION",
    "android.permission.ACCESS_COARSE_LOCATION",
    "android.permission.DETECT_SCREEN_CAPTURE",
    "com.google.android.gms.permission.AD_ID",
)

// Advertising Services permissions (Android 13+ ad measurement), matched by prefix.
private const val ADSERVICES_PREFIX = "android.permission.ACCESS_ADSERVICES_"

@Suppress("unused")
val meeshoRemoveDangerousPermissionsPatch = resourcePatch(
    name = "Remove dangerous permissions (keep storage & SMS)",
    description = "Removes contacts, phone-state, microphone, location, screen-capture " +
        "detection and advertising-ID permissions from Meesho's manifest. Storage and " +
        "SMS permissions are kept. Truecaller login, support voice calls and " +
        "location-based address entry may degrade.",
    default = true,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            listOf("uses-permission", "uses-permission-sdk-23").forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (index in nodes.length - 1 downTo 0) {
                    val node = nodes.item(index) as? Element ?: continue
                    val name = node.getAttribute("android:name")
                    if (name in PERMISSIONS_TO_REMOVE || name.startsWith(ADSERVICES_PREFIX)) {
                        node.parentNode?.removeChild(node)
                    }
                }
            }
        }
    }
}
