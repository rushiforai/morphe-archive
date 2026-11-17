package app.template.patches.guardian.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_GUARDIAN
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The Play Store signing certificate (CN=Android, OU=Android, O=Guardian News and Media, L=London,
// C=GB, SHA-1 caeb0b8799edba54d60cc7bcf2c15d1a98560058, SHA-256 4965429e...a9e7d), DER as base64,
// read from the apksigner v3 signer of the 6.241.23504 Play base split. Firebase Installations
// sends this certificate's SHA-1 as X-Android-Cert; re-signed, the request most likely fails with
// 403 API_KEY_ANDROID_APP_BLOCKED, so no FCM token is issued for the Pushy registration
// (issue #164). On by default because notifications are broken without it.
internal const val GUARDIAN_CERTIFICATE =
    "MIICQTCCAaqgAwIBAgIETjLfATANBgkqhkiG9w0BAQUFADBkMQswCQYDVQQGEwJHQjEPMA0GA1UEBxMGTG9uZG9uMSAwHgYDVQQKExdHdWFyZGlhbiBOZXdzIGFuZCBNZWRpYTEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDAgFw0xMTA3MjkxNjI1MzdaGA8yMTExMDcwNTE2MjUzN1owZDELMAkGA1UEBhMCR0IxDzANBgNVBAcTBkxvbmRvbjEgMB4GA1UEChMXR3VhcmRpYW4gTmV3cyBhbmQgTWVkaWExEDAOBgNVBAsTB0FuZHJvaWQxEDAOBgNVBAMTB0FuZHJvaWQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJpeS6/b3jVWGWDOlkwBO7eaxyOxlpCgo8LqdjCykcnsYiol7BOW0r1N5gUvp6uZF8+If+sHNf2DP4uD89VJwGC1cKJjwK/PMS31q4BnCn0fa8Vd9hpJODrWXtPxga6H70qucLhcI7GfsQPcRMI7Au/RdUcrUQkwptJoX4RCcQ5BAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEASzEtd2xyFpaIH7blKveDJv9uOTi/s1Pf2leshbpJpLOyHPuW2LGz3qVQK27jswiXtv6YKh5Ldr6MnyJN/g09HGYDMipAKdJfiguo+uGa47fmDPfhzP2x9A8eT5e8AvHi3aXtw49xHlcHln7sEtuiHYS1WxvkfJIrkYTo8qrOweQ="

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "com.guardian",
    certificateBase64 = GUARDIAN_CERTIFICATE,
    compatibility = COMPATIBILITY_GUARDIAN,
    default = true,
    description = "Fixes push notifications.",
)
