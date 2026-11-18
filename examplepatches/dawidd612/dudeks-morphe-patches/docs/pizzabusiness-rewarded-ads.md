# Good Pizza, Great Pizza: rewarded videos

**Skip rewarded ads** and **Google Play Games via MicroG-RE** target
`com.tapblaze.pizzabusiness` **5.57.3 (2277)**, distributed as APKM.
Both are selected by default and marked **stable** for this supported version. They share startup
support and can also be selected independently.
Static analysis used the supplied base APK and ARM64 native library. No APK,
game assets, save files or user screenshots belong in this repository.

## Behavior

When the player accepts an eligible rewarded-video offer, send its placement to
the game's normal reward callback without displaying the video. Native game code
still decides the reward type, quantity, limits and eligibility. This covers the
shared video gateway, including sponsor rewards, extra tips, double rewards,
oven speed-up, undo refresh, garden/avatar items and event-specific video offers.
It does not remove purchase requirements or make unavailable game offers appear.
Tapjoy offerwall tasks and ordinary interstitial ads are separate mechanisms.

## Why this hook

The native game has one Java lookup of `showRewardedVideo(String)`. Its direct
callers and the shared `GameManager::showAd` route converge on
`BaseIronSourceWrapper.showRewardedVideo`. The existing request Runnable captures
the placement, so no placement list or hardcoded reward amount is needed.

- Keep that request and its constructor; dispatch it through
  `Cocos2dxActivity.runOnGLThread` instead of `Activity.runOnUiThread`.
- Replace only its `run` body with `onVideoStarted`, `onVideoWatched(placement)`,
  `onVideoEnded`, then `onVideoReady`. Preserve the original null-placement
  fallback, `DefaultRewardedVideo`.
- Report video readiness independently of LevelPlay's cache/no-fill result.
- Silence the original rewarded SDK's ready Runnable, so background loads cannot
  reuse the native ready timer key ahead of the local reward/end sequence.
- Before the original `Initialize` body, queue `onInitialized` and `onVideoReady`
  on the game thread. Native ready/show gates check the initialization flag
  before calling Java; changing Java readiness alone cannot bypass failed SDK
  initialization. Keep the original initialization for interstitials and Tapjoy.

The native watched callback marks the request successful, dispatches the placement
to the active game listener and updates watched counters. The ended callback
reads that success flag. Native callbacks use distinct Cocos `scheduleOnce` keys
with a 0.1-second delay; this build appends timers and processes them in insertion
order. One Java task queues the sequence, but rewards are processed later by the
native scheduler. This is not a database transaction or a new concurrent-ad queue.
The game's single-active-request behavior, daily limits, low-RAM and ANR guards
are retained. Rapid repeated taps and interrupted activity lifecycles need device
testing.

The patch does not synthesize ad-network impressions, clicks, revenue or
verification postbacks. Original game analytics/counters and SDK initialization
remain; unused ads may still load in the background.

## Re-signed startup companion

The input uses PairIP. Its Java signature check rejects a Morphe signing
certificate before game startup. The companion guards this exact input layout
and no-ops `SignatureCheck.verifyIntegrity(Context)` and `StartupLauncher.launch()`.

The reported Google Play "Get this game from Play" screen is consistent with the
licensing client's remediation flow. The old companion only disabled the public
`checkLicense(Context)` entry. There are additional entries through `stopTrial`,
initialization, callbacks and delayed retries. The companion now disables the
ten local licensing operations covering public check/trial entry, initialization,
trial end, service binding, response processing, repeated-check scheduling,
paywall/error activity launch and delayed shutdown. In particular, disabling
binding also covers callbacks that bypass the ordinary initialization entry.

If Android restores an old `LicenseActivity` task, its `onStart` calls the
superclass and finishes only that activity. It neither sends the Play pending
intent nor closes the game's tasks. All affected method signatures and expected
calls are checked before the grouped edits. Replacement bodies have their old
exception tables removed. No successful signed license response is fabricated.

The companion restores 1459 original string constants, ARM64 native initialization
and four exact upstream SDK receiver bodies; see [bootstrap provenance](pizza-bootstrap.md).
`VMRunner`, protected assets and the other 16 protected SDK/WorkManager callers
remain intact. Tapjoy's connection receiver uses application context so its normal
cleanup survives Activity destruction. Connection retries, failures and SDK UI
contexts remain unchanged. ARM32 and physical-device compatibility remain unverified.
Android's installation signature rules and server-side checks are not changed.

## Google Play Games through MicroG-RE

The separate default-selected patch targets **MorpheApp/MicroG-RE 7.1.0+**,
package `app.revanced.android.gms`. Stable **7.1.1** is recommended; its release
removes an SMS permission that could make Play Protect block its installation.
See [official releases](https://github.com/MorpheApp/MicroG-RE/releases).

Only the Games Connect and Games Service clients are redirected. Their service
actions and host package point to MicroG; per-client overrides disable the stock
Google Play Services availability gate and stock Chimera lookup. A missing
MicroG service still produces a real connection failure. Other Google services,
Firebase and billing keep their original routing. Binder descriptors, transaction
IDs and Bundle keys retain their original Google namespace.

**Paid purchases remain blocked in the re-signed APK by Google Play's billing
configuration check.** Working Games sign-in does not authorize Play Billing.
See [the reproduced checkout failure and publisher requirements](pizza-billing.md).

The manifest declares MicroG package visibility plus the original package name
and APK signing-certificate SHA-1 (`828d99f1d85e52eb473af06d690f84ee72904330`)
using MicroG-RE's supported metadata. The game keeps its own package name, client
ID, Games application ID and save paths. Its presence check looks for MicroG
instead of requiring the separate stock Play Games app.

The SDK initializes during Activity creation, after the game's existing root-window
check accepts that Activity, so its lifecycle observer can track the foreground
window before the first sign-in. Rejected duplicate windows do not initialize it.
MicroG resolutions bypass the
legacy stock GMS/Play Store version probe and still launch the service's actual
PendingIntent, including cancellation and retries. Authentication results,
`requestServerSideAccess`, player retrieval and success/error callbacks remain
unchanged. No account, player ID, token or cloud-save result is fabricated.
Real account selection, server authorization and player retrieval succeeded on
the API 35 ARM64-translating emulator. TapBlaze restored the user's existing save;
that is separate from Google Play Games authentication. Current regression
results and limits are recorded in [runtime validation](pizza-runtime-validation.md).

## Input and validation

- Base APK SHA-256:
  `b7fa170de51747f740d69dc066b5aa61ec040661a0477f0de7d86cc46623d01a`.
- ARM64 `libcocos2dcpp.so` SHA-256:
  `8566506cbfe3d2e420c9b68a0a1752d9c3023ce3bde86db26ae4d9bab52d9521`.
- The patch guards method descriptors, native callbacks, request ownership,
  register counts, expected calls and the startup program ID. Already modified
  or unexpected inputs are rejected.
- CI builds the Android patch bundle and compatibility metadata.
- `scripts/VerifyPizzaRewardDex.java` checks the actual patched DEX and executes
  its replacement request instructions against callback fakes. Run it with a
  dexlib2-containing JAR, such as the JADX all JAR, on the classpath; arguments are
  `patched.apk [original.apk]`. This does not execute the native reward handlers
  or establish that the re-signed game starts.
- Applied to the supplied base APK using Morphe CLI 1.17.0 in FULL bytecode mode.
  The emitted DEX passed five placement scenarios (including null, empty and
  Unicode), unchanged game-thread dispatch methods, preserved SDK initialization,
  preserved VMRunner and empty exception tables in the startup companion.
- `scripts/VerifyPizzaIntegrationDex.java` checks the actual emitted DEX and
  binary manifest: ten inactive license operations, safe restored-activity exit,
  scoped MicroG routing, real package presence check, original signer metadata,
  unchanged authentication/SDK methods and exact upstream receiver restorations.
  `verify_pizza_assets.py` compares all input APKM splits, permitting only the
  reviewed ARM64 reconstruction hash with `--bootstrap-delta`. Compile it together with
  `VerifyPizzaRewardDex.java`, using the Morphe CLI JAR as the classpath; run with
  `patched.apk original.apk microg patches/src/main/resources/pizzabusiness/5.57.3`
  (or `stock` when the MicroG patch is disabled).
  When `Hide paid offers` is selected, append `hide-paid` to the integration
  command and add `--store-visibility docs/pizza-store-visibility.json` to the
  split-asset verifier. This permits only the reviewed native visibility output
  and checkout entry; runtime cancellation and save tests remain required.
- CI compiles the full bundle and both verification tools. The copyrighted input
  APK stays outside the repository; emitted-APK checks run separately on the
  supplied input. Neither CI nor these checks executes Google authentication.

## Test on the phone

1. Preserve your save/sync before changing installations. Use the clean APKM
   5.57.3 (2277), retaining its native and asset splits. Keep the same Morphe
   signing key when updating an existing patched installation; do not clear data
   or uninstall to work around an update error.
2. Install MicroG-RE 7.1.1 (`app.revanced.android.gms`) and add your Google account
   there. Select the desired patches, or disable the MicroG patch if keeping stock Games
   routing. Updating the patch source alone does not modify an installed game.
   `Hide paid offers` hides the paid storefront/starter promotion and cancels
   checkout. It keeps gem-to-funds exchanges and does not grant paid products.
3. Test launch, a background/foreground cycle and a restart first. A startup crash
   requires its log; do not treat successful patching as successful installation.
4. Accept each available video offer. Check that no video opens, exactly the
   normal reward appears, and its UI returns to gameplay. Check another offer,
   fast repeated taps and leaving/re-entering the game during completion.
5. Test with no ad fill/network access where the game itself allows the offer.
   Game eligibility/online requirements still apply.
6. Sign in through the game's Google Play Games button, upload a small progress
   change and verify it after restarting. Confirm a real restore on another
   installation/device before relying on the cloud copy. If it fails, capture
   the exact message and relevant `PlayGames`, `GamesService`, `GamesConnectService`
   and `AndroidRuntime` log lines, excluding account/token contents.

Realme GT7 / Realme UI 7 runtime and every event offer have **not** been tested
here. Exact version support is based on inspected code, not a device guarantee.
