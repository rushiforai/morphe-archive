package app.template.patches.forzafootball.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_FORZA_FOOTBALL
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The Play Store signing certificate (O=FootballAddicts, L=Göteborg, ST=Västra Götalands Län, C=SE,
// SHA-1 6e1189e8e56ef029d11b8b16f584330cf3226529), DER as base64, read from the v2/v3 signing block
// of the owner-supplied 6.15.10 split bundle's base APK (SHA-256 57c298f0...6c2c; the merged APK's
// block no longer verifies, the certificates are intact).
// Forza's Firebase API key only accepts this certificate: re-signed, Firebase Installations fails
// with 403 API_KEY_ANDROID_APP_BLOCKED (the re-signed stock build fails the same way), so FCM never
// gets a token and match notifications never arrive. On by default because it is a fix users
// should not have to discover.
internal const val FORZA_FOOTBALL_CERTIFICATE =
    "MIICMzCCAZygAwIBAgIET9G1ATANBgkqhkiG9w0BAQUFADBdMQswCQYDVQQGEwJTRTEgMB4GA1UECAwXVsOkc3RyYSBHw7Z0YWxhbmRzIEzDpG4xEjAQBgNVBAcMCUfDtnRlYm9yZzEYMBYGA1UEChMPRm9vdGJhbGxBZGRpY3RzMCAXDTEyMDYwODA4MTcwNVoYDzIwNjIwNTI3MDgxNzA1WjBdMQswCQYDVQQGEwJTRTEgMB4GA1UECAwXVsOkc3RyYSBHw7Z0YWxhbmRzIEzDpG4xEjAQBgNVBAcMCUfDtnRlYm9yZzEYMBYGA1UEChMPRm9vdGJhbGxBZGRpY3RzMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCoOKSaagczyKvvWP+weQXT0KKT888zovLUj3QU0ePqTfvbcrM/0Ur0Kn9nau8zWQV/4KgIv4vPs5cfX0zok8KnoatPN0Ig6OKTTqoLvMYvmv27dmyftjDs+eQlqkVcor5OHj3pXk2TiIrLtqO+oTvujU2dbXXEUbpYrrOdXNtDQwIDAQABMA0GCSqGSIb3DQEBBQUAA4GBAAYaMOyFe74oDJUqNkfNh8i3JKUb6Hs2VM+avgjqNkjfSlAFtqhhhc2p0Y2rypijODqvshCuEOJ01yPf0IC+LHMvtfapH8HI7IsqBvSn7UQZnH2UcRP22xF76y9rI+R3iPPBwcphe0KHKO2UinVg58gSXrEulY86tGxcd7FikWAi"

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "se.footballaddicts.livescore",
    certificateBase64 = FORZA_FOOTBALL_CERTIFICATE,
    compatibility = COMPATIBILITY_FORZA_FOOTBALL,
    default = true,
    description = "Fixes push notifications.",
)
