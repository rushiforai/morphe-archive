package app.template.patches.shazam.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_SHAZAM
import app.template.patches.shared.misc.signature.spoofSignaturePatch
import app.template.patches.shazam.misc.spotify.spotifyLoginPatch

// The original signing certificate (CN=Tony Miller, OU=Operations, O=Shazam Entertainment Ltd.,
// SHA-1 b804e188301813b5d8d47d0bb2280607c16fd8b6), DER as base64, read from the v3 signing block of
// the APKMirror 16.63.0-261008 bundle's base APK (the merged APK's block no longer verifies).
// Firebase (Installations, Auth, which Google and email sign-in end in, and Remote Config) sends
// this certificate's SHA-1 as X-Android-Cert (issue #62).
internal const val SHAZAM_CERTIFICATE =
    "MIICczCCAdygAwIBAgIESPSWqjANBgkqhkiG9w0BAQUFADB+MQswCQYDVQQGEwJVSzEPMA0GA1UECBMGTG9uZG9uMQ8wDQYDVQQHEwZMb25kb24xIjAgBgNVBAoTGVNoYXphbSBFbnRlcnRhaW5tZW50IEx0ZC4xEzARBgNVBAsTCk9wZXJhdGlvbnMxFDASBgNVBAMTC1RvbnkgTWlsbGVyMB4XDTA4MTAxNDEyNTUwNloXDTM2MDMwMTEyNTUwNlowfjELMAkGA1UEBhMCVUsxDzANBgNVBAgTBkxvbmRvbjEPMA0GA1UEBxMGTG9uZG9uMSIwIAYDVQQKExlTaGF6YW0gRW50ZXJ0YWlubWVudCBMdGQuMRMwEQYDVQQLEwpPcGVyYXRpb25zMRQwEgYDVQQDEwtUb255IE1pbGxlcjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAmB7HrGP65NnPontD+s5X90B5TyYpDqxDwtlaobbQEr957g1JzQpxeLRDuFBQF8yrU6XI97EajQ1a4W8zW2WSDdCFqN0wwyV95rCz9BmyoN4O+1uglU1rDdmeStAfrCBKFzOyRLlUnvsgtkPjsenZiiQSXdJyDKw2S7JfarJ3kh0CAwEAATANBgkqhkiG9w0BAQUFAAOBgQBNyrDfdCxLpUnK6FbPMYw7HlPnE976DTeK24OajmkzkJTaDS9EOKsDkospL7ybISZlX8f36k5bACcJoDPgGyK4G8vUTLJ8W/EQUB/bgPAIXIklH25QVD9vMqa1fA0QIGfxPJUPFNx9yocynCfMTU/UsCDCVRIP4PNln99M5BLq5Q=="

// On by default: it fixed the Google and email sign-in of issue #62. It also carries the Spotify
// login fix (spotifyLoginPatch: login in a browser tab), the other part of the fix for #62.
@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "com.shazam.android",
    certificateBase64 = SHAZAM_CERTIFICATE,
    compatibility = COMPATIBILITY_SHAZAM,
    default = true,
    description = "Fixes Google features and the Spotify connection.",
    dependencies = setOf(spotifyLoginPatch),
)
