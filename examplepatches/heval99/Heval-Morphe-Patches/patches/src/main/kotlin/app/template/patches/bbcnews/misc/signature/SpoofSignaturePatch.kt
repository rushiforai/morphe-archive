package app.template.patches.bbcnews.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_BBCNEWS
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The Play Store signing certificate (O=BBC Worldwide Limited, L=London, C=GB, RSA-1024, SHA-1
// 25a95fddc952150c80b9c33ab8d17d8e8e139f40, SHA-256 fd76b3b8...065dc7), DER as base64, read from
// META-INF/BNDLTOOL.RSA of the 2026.10.0 base APK. Firebase Installations and Remote Config send
// this certificate's SHA-1 as X-Android-Cert; re-signed, the request most likely fails with 403
// API_KEY_ANDROID_APP_BLOCKED, so no FCM token is issued and Urban Airship push never arrives
// (issue #164). On by default because notifications are broken without it.
internal const val BBCNEWS_CERTIFICATE =
    "MIICXzCCAcigAwIBAgIETdJ/GzANBgkqhkiG9w0BAQUFADB0MQswCQYDVQQGEwJHQjEQMA4GA1UECBMHVW5rbm93bjEPMA0GA1UEBxMGTG9uZG9uMR4wHAYDVQQKExVCQkMgV29ybGR3aWRlIExpbWl0ZWQxEDAOBgNVBAsTB1Vua25vd24xEDAOBgNVBAMTB1Vua25vd24wHhcNMTEwNTE3MTM1ODUxWhcNMzgxMDAyMTM1ODUxWjB0MQswCQYDVQQGEwJHQjEQMA4GA1UECBMHVW5rbm93bjEPMA0GA1UEBxMGTG9uZG9uMR4wHAYDVQQKExVCQkMgV29ybGR3aWRlIExpbWl0ZWQxEDAOBgNVBAsTB1Vua25vd24xEDAOBgNVBAMTB1Vua25vd24wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAOTQ2V7djxZjjA//Bv1Y6jI+cdG0ZCDlFhVH/odLST3nEZjSW52IEi4MqRXuRYWn2FHMRjNDm1Uvz/17MnN3eCpMX0GcDJpQwH4DtwIDK76R6N2kvWvG/HiuBUmmwmBCc3KQ9hVKPMkXckkBdjYxnGKVWitvTtXdTTzCvDANjphFAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEAGg9o/tKfE6JHNV5Et3NkfQ/GnKAxnoxKmL9XEexrNs8PpJ+jFfTovGIsBpylCUutHZ1rduabOZu5MVTDVh8CnLaOFPOKk7MHNvtNjCDoiYKEr8OXbiWyyxZua0h5C0xXFQDfMdSNp+I63hccfWmIqKFenPsQYvtzb9pyoF8/1+4="

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "bbc.mobile.news.ww",
    certificateBase64 = BBCNEWS_CERTIFICATE,
    compatibility = COMPATIBILITY_BBCNEWS,
    default = true,
    description = "Fixes push notifications.",
)
