# Deezer

Use Deezer's full catalogue, remove advertising and subscription prompts, and keep the car media browser usable with DriveDeck, Gearslip or another compatible Android Auto host.

**App version:** 9.0.26.3 · **Build:** 9002603 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive for this exact version in Morphe Manager, including its architecture, language and display splits.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow any Android Auto host** | On | Lets Deezer's car media browser accept any Android Auto host by selecting its built-in Android Auto tree, keeping Home, Library, Recently played and Explore browsable with Deezer's own Up next queue. |
| **Enable full streaming** | On | Keeps full-track playback enabled for the signed-in account: removes preview and device-limit verdicts, keeps offline and radio rights, clears the streaming time limit, and leaves catalogue entries playable through Deezer's own media service. |
| **Remove advertising** | On | Disables banner, native, audio and preroll advertising. Playback continues without an ad break and the audio-ad launcher never receives its ad payload. |
| **Disable tracking** | On | Disables Adjust initialization and events, Segment event delivery and its Braze destination, the Firebase Analytics/Crashlytics/Performance/Sessions collectors, Facebook automatic app events and advertising IDs. |
| **Remove premium upsell UI** | On | Removes the Premium tab from the bottom navigation bar, the Get Premium button on the user profile, the conversion banner and Plan management row in Settings, and shows the free account plan as Deezer Premium. The rest of Settings, profile, account and playback stay intact. |
| **Remove subscription paywalls** | On | Skips the startup plans page (treats the account as not waiting for payment and ignores the no-freemium startup redirect), consumes the Premium tab before it launches, redirects the startup Premium activity to Home instead of exiting to the launcher, blocks the post-login premiumtab WebView paywall, and closes the artist paywall, trial-start and offer-dialog activities after their normal lifecycle starts. |

## Playback

A signed-in Deezer account receives a track token and a full stream from `media.deezer.com/v1/get_url`. The Milkbeat Deezer plugin uses that same path: `deezer.ping` opens the gateway session, `deezer.getUserData` returns the licence token, `song.getData` returns the per-track token, and `get_url` returns the `BF_CBC_STRIPE` stream. **Enable full streaming** keeps Deezer's own media service and removes only the client-side verdicts that would turn that stream into a preview, a device-limit refusal or a subscription requirement. The account, catalogue and transport are unchanged; the quality that comes back still follows what the account and licence allow.

## Advertising and tracking

Deezer drives its placements from the gateway-provided `AdsConfigDataModel`. The advertising patch exposes an empty ad configuration, so banner eligibility, the audio/preroll gate, the audio-ad scheduler and SmartAdServer setup all take their existing "nothing to show" paths. It also closes video-ad activities and prevents the audio-ad launcher from putting an ad into its intent.

The tracking patch works at the SDK entry points rather than deleting classes the app still references: Adjust is never configured and its event sink is a no-op; Segment's track/delivery methods and its Braze destination are no-ops; Firebase, Facebook automatic events, attribution permissions and the Adjust/Facebook manifest providers are disabled. Sign-in, catalogue, playback and functional notifications remain in place.

## Why the car browser was empty

Deezer's media-browser service validates the caller package and signing certificate, then replaces the browser root with null when the caller is not trusted. The patch keeps the caller lookup and the root construction and skips only that rejection branch. `QUERY_ALL_PACKAGES` is added so Android 11 and newer can resolve an arbitrary host package.

## Before using

Sign in to Deezer on the phone first. A patched APK is signed with a new certificate and cannot be updated in place from the Play Store.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
