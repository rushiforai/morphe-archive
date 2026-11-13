# Google Voice patches for Morphe

Use Google Voice without Google Play Services sign-in problems, and as the default phone app.

## Add to Morphe Manager

Add this patch source: `https://github.com/abegumbo-ui/gvoice-patches`

## Patches

| Patch | What it does |
| --- | --- |
| **GmsCore support** | Uses MicroG RE (install it from Morphe Manager) instead of Google Play Services, so the re-signed app can sign in and get push messages. Installs as `app.flip.googlevoice`, next to the original. |
| **Incoming call fix** | Makes incoming calls ring. MicroG can't wake the app for calls like Play Services does, so the app briefly shows an invisible overlay when a call arrives. Asks once for "Appear on top". |
| **Default phone app** | Lets Voice be picked in Settings > Apps > Default apps > Phone app. Tapping a phone number opens Voice; carrier calls get a basic in-call screen. |
| **Call recording** | Records every incoming and outgoing call, both sides, to `Recordings/Voice calls/` as .m4a, named with the contact/number, time and direction. Works for calls over Wi-Fi or mobile data (Voice settings > Calls > Making and receiving calls > Prefer Wi-Fi and mobile data); calls Voice sends through the carrier can't be recorded. |
| **Debug log** (off by default) | Saves the app's log and every push it receives to `Downloads/voice-logcat-<time>.txt`. |

Tested with Google Voice `2026.11.01.1014278023` (APKM from APKMirror) on a Galaxy S25, Android 17.

## After installing

1. In MicroG settings, turn on Cloud Messaging.
2. Open Voice, sign in, and allow "Appear on top" when asked.
3. Set battery to Unrestricted for Voice and for MicroG.
