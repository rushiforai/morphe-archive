package app.template.patches.smartlauncher.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_SMARTLAUNCHER
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The Play Store signing certificate (CN=vincenzo colucci, L=Bologna, C=39, RSA-1024, SHA-1
// dfaab993de750d7b5430bbd4217472311d94f9d0, SHA-256 dbc3effb...22de60), DER as base64, read from the
// v3 signing block of the 6.6 build 025 merged APK. App.onCreate compares the SHA-1 of its own
// signature with two embedded values (this one is the second) and calls System.exit(0) on a
// mismatch, so a re-signed build closes at start without it.
internal const val SMARTLAUNCHER_CERTIFICATE =
    "MIICDTCCAXagAwIBAgIETXzk+DANBgkqhkiG9w0BAQUFADBKMQswCQYDVQQGEwIzOTEOMAwGA1UECBMFSXRhbHkxEDAOBgNVBAcTB0JvbG9nbmExGTAXBgNVBAMTEHZpbmNlbnpvIGNvbHVjY2kwIBcNMTEwMzEzMTUzODMyWhgPMjA2MTAyMjgxNTM4MzJaMEoxCzAJBgNVBAYTAjM5MQ4wDAYDVQQIEwVJdGFseTEQMA4GA1UEBxMHQm9sb2duYTEZMBcGA1UEAxMQdmluY2Vuem8gY29sdWNjaTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAqVcg4XWdkLofQiNvGsitqL0yhsvPGGcXYmiTmNtLnna2AdnBo8fq/RMNvmisCQoGxETXSpQJe2IX5lZm3Z5JprYlV7qhjF7qRlADUEXD6ED/xU6wASP01jRhOrMA7yn3QITRd2tIkYapkKBQkCbQaK8pyHslVZqUs02lyN3hppkCAwEAATANBgkqhkiG9w0BAQUFAAOBgQAjWP0tfy+sM7dOdnYU8caFu49vu5mpy/DNzAApE/R6lu+oGLg7CTJqbVq3JawMmT0o0LkIAjyvRjRe/J1gl8yvGaJOQNN7BGmvHnfMhVCJkJ32AAjtLr7EsPMT8axatGTQKS01Cq+4i2oQpSNCFUl0RK+3wj2eQBm6FBuoCC4a0w=="

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "ginlemon.flowerfree",
    certificateBase64 = SMARTLAUNCHER_CERTIFICATE,
    compatibility = COMPATIBILITY_SMARTLAUNCHER,
    default = true,
    description = "Keeps the patched app starting normally.",
)
