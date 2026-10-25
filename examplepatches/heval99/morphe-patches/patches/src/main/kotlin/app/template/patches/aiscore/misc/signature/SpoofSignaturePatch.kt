package app.template.patches.aiscore.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_AISCORE
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The Play Store signing certificate (CN=onescore, OU=onescore, O=onescore, L=shanghai, RSA-2048,
// SHA-1 d34738b4cf2d39aad6e63e032323d78b0af5a84c), DER as base64, read from the v2/v3 signing
// block of the 4.3.2 bundle's base APK. AiScore's Firebase API key only accepts this certificate:
// re-signed, Firebase Installations fails with 403 API_KEY_ANDROID_APP_BLOCKED, so FCM never gets
// a token and goal alerts never arrive. On by default because it is a fix users should not have
// to discover.
internal const val AISCORE_CERTIFICATE =
    "MIIDdzCCAl+gAwIBAgIEQEd64DANBgkqhkiG9w0BAQsFADBsMQswCQYDVQQGEwI4NjERMA8GA1UECBMIc2hhbmdoYWkxETAPBgNVBAcTCHNoYW5naGFpMREwDwYDVQQKEwhvbmVzY29yZTERMA8GA1UECxMIb25lc2NvcmUxETAPBgNVBAMTCG9uZXNjb3JlMB4XDTE5MDczMDA3MjUyM1oXDTQ0MDcyMzA3MjUyM1owbDELMAkGA1UEBhMCODYxETAPBgNVBAgTCHNoYW5naGFpMREwDwYDVQQHEwhzaGFuZ2hhaTERMA8GA1UEChMIb25lc2NvcmUxETAPBgNVBAsTCG9uZXNjb3JlMREwDwYDVQQDEwhvbmVzY29yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJsWnqxykkzRzvRHJqRap35bXbN8ErIoIfcjaAGgQJvMhHt9WNQL8LfboZU4lb7cK/gxsRiA70tFy1ZdPduBL9aw36bsMzPNlvGNTjpQlKtblvzepvPpI6hsvYYoLxZ+wuarAq+DRSKd51Jif9cUwNdsLawhRB6d+BvyLBo/oWqPMSgaxlMJ10O/oUGQqdQz6juEDFibPX3AOMoGhiBHMoE0YeShmGpXfK4LhyEzA/Q0DuP0Qzrpc+gylBRfj+YHo9Uk9k+/Yn0FYxHI16evTgpbO+53Wj0oDgiVoZ9EzsKbzinFmzBM4x4sa47sI3e9wdJ6NhvJwYaGcLOY+OoXYu0CAwEAAaMhMB8wHQYDVR0OBBYEFDxH5iXACSj8RrVw0cT/Ak+W/njoMA0GCSqGSIb3DQEBCwUAA4IBAQCJWqo0eLY9/oZRMH83yU6ooiC2QknO8ogOCorWSUCgatAZwMuniSz27Y63oaZckanEU2Tm5xdwNMlsrbNkSINql/DJKEN35MgFMIvTmQlOn0i268/mVPOK1gvbLVF0xxiUiFQQIn8v6lUHj8/mO5+rQlJyz3XVi544P9yjpvadP3wbj4bTHO3V9l0zKkuq+Q9jK3+s2zAdA0Vp/vVBTJoau8KnUix+pdDSFYZ0nMxM0JJi6UjJTRpIQBz1o1wyhTSdl/HTZfo+p4GyQ8CkZSgeAbUPTaZ0yIiHkiVrHemRgnGERTOzEzmHH9nFYqKe7MdK9sy4pNkUvkVxV9cHys0t"

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "com.onesports.score",
    certificateBase64 = AISCORE_CERTIFICATE,
    compatibility = COMPATIBILITY_AISCORE,
    default = true,
    description = "Fixes push notifications (goal alerts).",
)
