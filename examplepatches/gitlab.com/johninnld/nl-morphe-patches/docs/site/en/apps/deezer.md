# Deezer

Use Deezer's full catalogue, remove advertising and subscription prompts, and keep the car media browser usable with DriveDeck, Gearslip or another compatible Android Auto host.

**App version:** 9.0.27.3 · **Build:** 9002703 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive for this exact version in Morphe Manager, including its architecture, language and display splits.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Remove advertising** | On | Disables banner, native, audio and preroll advertising. Playback continues without an ad break and the audio-ad launcher never receives its ad payload. |
| **Disable tracking** | On | Disables Adjust initialization and events, Segment event delivery and its Braze destination, the Firebase Analytics/Crashlytics/Performance/Sessions collectors, Facebook automatic app events and advertising IDs. |
| **Search and sort playlists** | On | Shows native playlist header search and Sort, preserving ownership and chart checks. |
| **Player queue shortcuts** | On | Adds Deezer’s existing Add to queue and Play Next choices to the full player menu when available for the selected track. |
| **Enable queue item selection** | On | Lets a connected car host request a particular occurrence in Deezer’s current Up next queue. Selections from a replaced queue are discarded, and the active queue item follows the current occurrence. |
| **Android Auto API 9 media surface** | On | Adds a car browser and player. Allows compatible custom hosts and uses API 9 presentation only when the host negotiates API 9; lower-level hosts keep the fallback. |
| **Google sign-in through microG-RE** | On | Routes Google account selection and authorization through installed microG-RE, using Deezer’s original OAuth identity and standard package name. |
| **Remove premium upsell UI** | On | Removes the Premium tab, profile promotion, Settings conversion banner and Plan management row, Downloaded music subscription banner and Listen without ads menu entry. Shows the free plan as Deezer Premium; account and playback remain unchanged. |
| **Enable lyrics** | On | Uses native lyrics first, then matching LRCLIB plain or synchronized lyrics when native data is missing. Availability follows usable data. LRCLIB receives track metadata; Deezer and Google tokens are never sent to LRCLIB. |
| **Enable offline downloads** | On | Enables native album, playlist and Favorite tracks downloads and removes the download upgrade offer. Deezer handles media storage, library registration and offline playback. Individual tracks follow Deezer's normal saved-library or playlist workflow. |
| **Enable full streaming** | On | Restores full-track client playback controls, without changing the account or media service. |
| **Remove subscription paywalls** | On | Skips the country/plans startup redirect and closes subscription prompts. |
| **Allow any Android Auto host** | On | Allows Deezer’s native media browser and templated car service to accept compatible custom hosts. |

This port targets 9.0.27.3 exclusively. All thirteen patches are selected by default.

## Playback

A signed-in Deezer account receives a track token and a full stream from `media.deezer.com/v1/get_url`. The Milkbeat Deezer plugin uses that same path: `deezer.ping` opens the gateway session, `deezer.getUserData` returns the licence token, `song.getData` returns the per-track token, and `get_url` returns the `BF_CBC_STRIPE` stream. **Enable full streaming** keeps Deezer's own media service and removes only the client-side verdicts that would turn that stream into a preview, a device-limit refusal or a subscription requirement. The account, catalogue and transport are unchanged; the quality that comes back still follows what the account and licence allow.

## Advertising and tracking

Deezer drives its placements from the gateway-provided `AdsConfigDataModel`. The advertising patch exposes an empty ad configuration, so banner eligibility, the audio/preroll gate, the audio-ad scheduler and SmartAdServer setup all take their existing "nothing to show" paths. It also closes video-ad activities and prevents the audio-ad launcher from putting an ad into its intent.

The tracking patch works at the SDK entry points rather than deleting classes the app still references: Adjust is never configured and its event sink is a no-op; Segment's track/delivery methods and its Braze destination are no-ops; Firebase, Facebook automatic events, attribution permissions and the Adjust/Facebook manifest providers are disabled. Sign-in, catalogue, playback and functional notifications remain in place.

## Why the car browser was empty

Deezer's media-browser service validates the caller package and signing certificate, then replaces the browser root with null when the caller is not trusted. The patch keeps the caller lookup and the root construction and skips only that rejection branch. `QUERY_ALL_PACKAGES` is added so Android 11 and newer can resolve an arbitrary host package.

## Before using

Use the standard `deezer.android.app` installation and sign in on the phone first. Select that Deezer entry in your car host if an older cloned copy is also installed. A patched APK is signed with a new certificate and cannot be updated in place from the Play Store.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md) · [Coverage and comparison](../guides/deezer-patches.md)
