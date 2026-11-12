package app.template.patches.flashscore.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The original signing certificate (CN=Pavel Cvetler, OU=FlashScore, O=LiveSport s.r.o., SHA-1
// fd9fbf3b2dac2390355b54c50a1b716076d79bc1, SHA-256 2c8830db...26550), DER as base64, read from the
// v3 signing block of the owner-supplied 26.11.4 base APK (the merged APK's block no longer
// verifies, so the certificate comes from the split). Firebase (Installations, so FCM, plus
// Analytics) sends this certificate's SHA-1 as X-Android-Cert, which Google checks against the
// registered app; re-signed, push registration is rejected.
internal const val FLASHSCORE_CERTIFICATE =
    "MIICQzCCAaygAwIBAgIEUtBgBTANBgkqhkiG9w0BAQUFADBmMQswCQYDVQQGEwJDWjEPMA0GA1UEBxMGUHJhZ3VlMRkwFwYDVQQKExBMaXZlU3BvcnQgcy5yLm8uMRMwEQYDVQQLEwpGbGFzaFNjb3JlMRYwFAYDVQQDEw1QYXZlbCBDdmV0bGVyMB4XDTE0MDExMDIxMDMwMVoXDTM5MDEwNDIxMDMwMVowZjELMAkGA1UEBhMCQ1oxDzANBgNVBAcTBlByYWd1ZTEZMBcGA1UEChMQTGl2ZVNwb3J0IHMuci5vLjETMBEGA1UECxMKRmxhc2hTY29yZTEWMBQGA1UEAxMNUGF2ZWwgQ3ZldGxlcjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAtOsHkiNp0WvlpP5R9XZAIRswbKnW+HM1JwnCMjBhLSBcjlbQuGJwUThXJrXff6pHM0f1O7FXkJU2xW32ENhQqhqBvLE1QCa6cJrv/L8lnBiU0uRENOpBp3Vd9GghEgdZUEkruxkW9DTzcZOHSmQx+Nx+/RUlTtFR3RQF5SS9OLkCAwEAATANBgkqhkiG9w0BAQUFAAOBgQAe0zN8Avksswd3bzdFQcnta+Qwa0RjRe2sKSY1N/JNIgURk31YRhpfbGayiw1VLwThh/dsCfdakVmrm7eHtYCEQ377Y1JttXfcHXaNE16RggVCOIsjvC7foRwOzea8Al6rZs4gdQ1GNUOMfnDgsTpelwCV3GFc3T4+IPGITgzDDw=="

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "eu.livesport.FlashScore_com",
    certificateBase64 = FLASHSCORE_CERTIFICATE,
    compatibility = COMPATIBILITY_FLASHSCORE,
)
