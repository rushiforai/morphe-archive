# SoundCloud

**App version:** 2026.11.02-release · **Build:** 379060 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete publisher-signed APKM archive for this exact build (Android 10+), including its device files.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Home in Android Auto** | On | Fills the car Home tab with regular cover tiles from the phone's Home, using the app's existing account. Tracks, mixes and artists play; playlists and albums open. Publishes the real playback queue for Up next, with queue item selection. Falls back to SoundCloud's original car Home if the phone Home cannot load. |
| **Disable analytics** | On | Stops SoundCloud's event storage and dispatch through its analytics handler, preserving the worker's own shutdown path. Other tracking services remain active. |
| **Disable consent popup** | On | Skips the OneTrust popup using the app's no-op consent controller. Does not grant consent or disable tracking; select Disable analytics separately. |
| **Enable SoundCloud Go** | On | Enables local Go+ plan controls, hides Go upsells and consumer-plan transition screens, disables client ad requests and display placements, and forces the offline_sync, no_audio_ads and hq_audio switches from the /configuration response on. See below for what those switches can and cannot do. |
| **Ignore device limit** | On | SoundCloud signs in on up to ten devices, and only the app enforces it: the /configuration response marks the device authorized or not, an unauthorized sign-in never finishes, and a later refresh signs the device out and revokes its token. The patch skips the registration handshake and ignores that state, so signing in and staying signed in no longer depend on it. |

## Why Home was empty in the car

SoundCloud's car Home tab reads an older discovery feed, while the phone Home uses the newer Home sections. Feed and Library already worked because they use your own stream and collection. The patch asks the phone's GraphQL SDUI Home service for its sections, rather than the separate library-banner endpoint used by the earlier patch, when the car opens Home. It applies to Android Auto, Gearslip, DriveDeck and other media hosts that browse SoundCloud.

Music Home uses an ungrouped cover grid. Tracks inside playlists and albums retain the app's track-list presentation.

## The ten-device limit

SoundCloud lets an account sign in on up to ten devices, and the enforcement is entirely in the app. `/configuration` returns a `device_management` state for the device, read in two places: an unauthorized **new** sign-in never finishes — through the state flags, or because the server refuses the registration request itself with an HTTP error — and an unauthorized **existing** device is signed out on the next configuration refresh, its token revoked. Ignore device limit skips the registration handshake at sign-in entirely and makes the state checks answer *authorized*, so sign-in completes without registering the install and staying signed in no longer depends on the device count. Playback and streaming code never consults the state, so nothing else changes. Two honest limits: the install stays unregistered in SoundCloud's device list, and if the servers ever start rejecting requests beyond these handshakes, no client patch can help.

## The Go switches, honestly

SoundCloud's app decides locally what to show for its subscription features: the `/configuration` response lists switches such as `offline_sync`, `no_audio_ads` and `hq_audio`, and only the app itself reads them. Enable SoundCloud Go stores all three as enabled and overlays Go+ plan values locally — plus the parts other SoundCloud patch sets leave out: no pending downgrade, no Go upsells or plan-transition screens, and the client's ad requests and display placements disabled outright, so the ad side does not depend on the `no_audio_ads` switch alone.

What the switches cannot do:

- **High-quality audio** shows the setting and lets the app ask for HQ. Whether HQ is delivered is SoundCloud's server decision: the higher-bitrate AAC streams are listed and authorised for a paying Go+ login. A free account keeps the normal streams, or a refusal when the app asks anyway.
- **Offline sync** unhides the download buttons. Go+-only tracks remain 30-second previews, and encrypted offline copies need a real subscription. At most the app can save tracks the account can already stream.
- **No audio ads** does work locally, and the patch's ad-request overrides cover the same ground more broadly.

Local Go+ state never establishes server-side access. Paid streams, downloads and audio quality stay tied to the account.

## Advertising and tracking services

Home in Android Auto changes the car Home content and exports the active player queue to the public media session. Next alone does not publish upcoming titles or artwork. The three additional controls act independently: Disable analytics stops the app's event handler, Disable consent popup skips OneTrust, and Enable SoundCloud Go changes local plan and advertising behavior. They do not remove every tracking service or supply an account. Local Go+ controls do not establish paid-content access on SoundCloud's servers.

## Before using

Sign in to SoundCloud on the phone. A patched APK must be signed again, so the Play Store installation cannot be updated in place; keep it until the patched copy works. All additional controls rebuild independently and together with Home on this exact input. Their local effects and app startup were checked on Android without an account. Signed-in Home, cover tiles and Up next were confirmed on the phone after an in-place upgrade. Downloads and audio quality remain dependent on your account and server access.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
