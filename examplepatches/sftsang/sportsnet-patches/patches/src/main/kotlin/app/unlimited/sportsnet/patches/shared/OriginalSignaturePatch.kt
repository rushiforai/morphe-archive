package app.unlimited.sportsnet.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The public certificate Sportsnet is signed with, as the app reads it: Base64 of its DER encoding.
 * Rogers Digital Media, SHA-256 88badf15d742c4e290b25ccb05345e0b1cdbf4385d29235e43802c4be02c4c99.
 */
private const val ORIGINAL_CERTIFICATE =
    "MIIDvzCCAqegAwIBAgIENHt1GjANBgkqhkiG9w0BAQsFADCBjjELMAkGA1UEBhMCQ0ExEDAOBgNVBAgTB09udGFyaW8xEDAOBgNVBAcTB1Rvcm9udG8xHTAbBgNVBAoTFFJvZ2VycyBEaWdpdGFsIE1lZGlhMR0wGwYDVQQLExRSb2dlcnMgRGlnaXRhbCBNZWRpYTEdMBsGA1UEAxMUUm9nZXJzIERpZ2l0YWwgTWVkaWEwIBcNMTIxMTI5MjA1MjAzWhgPMjE0OTEwMjIyMDUyMDNaMIGOMQswCQYDVQQGEwJDQTEQMA4GA1UECBMHT250YXJpbzEQMA4GA1UEBxMHVG9yb250bzEdMBsGA1UEChMUUm9nZXJzIERpZ2l0YWwgTWVkaWExHTAbBgNVBAsTFFJvZ2VycyBEaWdpdGFsIE1lZGlhMR0wGwYDVQQDExRSb2dlcnMgRGlnaXRhbCBNZWRpYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIrJEPp9Eqq5YhWpDbxSlD0m2RxFKzoo7mO4vad1N0bXiVIgwaNrrkJ8b8wuLOV0Yv71YeP1mG1rHTgk5FI4muF+cgvo+cE7ECE4oSRwlIJmxrfnC1DPC5hRLKaqjvwUpDj5g4lUB9RMI0AiMqtMPhL/0xejuUFixqmUdYnljbWJLlDIYdyLQmEfpKdd3Ogdr4iiFgcVt0ScQa4jUAyBVXML+1nuirjvkcY3DZwb/2rHlzpis9zWPpb0O7cJ4iCtBnPQPX0024gVgqJ/nRzzI8+fi3fecT1dj4RCVPj7naZn+V7BTKJZnmaaJNOsB6rbz02y6i2/Dmgh7hhFi4hJiOUCAwEAAaMhMB8wHQYDVR0OBBYEFE3vbl0Q6l8wk6j5Tx/kB/N2om2WMA0GCSqGSIb3DQEBCwUAA4IBAQAQa8CxkWVK83I3bkCL7b1GcydbgAiDx/NzK7Tr9XUhbOEvTCpU0p+oSj3AmoxSxHBXi/3FPKqbou/Wvshc9UgQ05MO6QQ7HxS8os6/n0390cApwhx/mvB3gTP60l3qvj6HBx00EkTXjnUA7itNI8PqsocuPBo13KivLtldMC1AloPxtE2FQteKKd3w1PCPbCyHiyEijMVP/L1cIEPtcqQSeYdk7CDEcXJ4blTWptiK+89saMB29qtyxjVA3l8ELz+ZoGTls53i4cf2bWVsmUrulu99xKeonzwlW80gCiv5INOcuYCs29DLA0tNKHhkiBrX5uq+f3ApuX0ZjcoX+qzQ"

/** The app decrypts its built-in service keys with a key derived from its signing certificate. */
private object SignatureKeyFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/service/security/CryptoManager;",
    name = "getSignatureKey",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

/**
 * A patched app is signed with another certificate, so without this the app cannot decrypt its
 * keys and closes at once. Every patch depends on this one.
 */
internal val originalSignaturePatch = bytecodePatch {
    execute {
        SignatureKeyFingerprint.method.returnEarly(ORIGINAL_CERTIFICATE)
    }
}
