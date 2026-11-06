# MUBI patches

**App:** MUBI: Curated Cinema (`com.mubi`)
**Bundle format:** APKM (split APKs, base + config)
**Targets:** 100.0 (29145546), 99.1 (29145545)
**Min SDK:** 24 · **Target SDK:** 36 (100.0)

MUBI's streaming entitlement is server-side: the API only returns a playable
manifest and a Widevine licence to a subscribed account. None of these patches
attempt to change that, and no patch here makes an unsubscribed account play.

What these patches do is remove nag/promo surfaces, restore player/platform
features, and stop tracking — all locally, using structures that survive MUBI's
frequent releases.

## Patch list

| Patch | Default | Mechanism | Limitations |
|---|---|---|---|
| Allow screenshots & screen recording | off | Clears bit `0x2000` (`FLAG_SECURE`) from the literals feeding `Window.addFlags`/`setFlags`, and flips literal `SurfaceView.setSecure(true)` to `false`. | DRM video may still render black in a capture on some devices; non-literal flags are left stock. |
| Block analytics & tracking | **on** | Replaces void-returning call sites into Braze/Appboy, Firebase Analytics, GMS AppMeasurement, AppsFlyer, Adjust, Facebook App Events and Segment with `nop`. | Push (FCM/Braze push) and account APIs untouched; only outbound event logging is silenced. |
| Block upgrade & sale deep links | **on** | Manifest: sets `UpgradeSubscriptionsActivity` `android:exported="false"`; rewrites `upgrade-yearly`/`blackfriday` hosts and `/app_flash_sale2024`, `/summer_sale_2024` paths to a sentinel (never deletes the only host/path of a filter). | In-app upgrade navigation still works; entitlements and purchases unchanged. |
| Enable picture-in-picture | **on** | Manifest: `supportsPictureInPicture` + required `configChanges` on `PlayerActivity`/`TrailerActivity`; bytecode: prepends `enterPictureInPictureMode()` to `onUserLeaveHint`. | Needs Android 8+; TV activities intentionally not marked PiP. |
| Force highest video quality | off | `clearBody()` + `const-wide v0, 0x3B9ACA00L; return-wide v0` on ExoPlayer2/Media3 `DefaultBandwidthMeter.getBitrateEstimate()`. | More buffering/data on slow links; server- and licence-side caps still apply. |
| Bypass forced update | off | At `AppUpdateInfo` call sites: `nop` the invoke and set the `move-result` to `UPDATE_NOT_AVAILABLE` (1) / `isUpdateTypeAllowed` → `false`. | Running an outdated build can break playback when the API changes. |
| Change package name | off | Manifest resource patch: package, `com.mubi.*` permission ids, provider authorities, `taskAffinity`, launcher label (via a new string resource). Component class names are never renamed. | Re-signed clone: Play Billing, Cast and Google sign-in may fail. |
| Force TV (leanback) UI | off | `nop`s `UiModeManager.getCurrentModeType()` and sets its `move-result` to `2` (`UI_MODE_TYPE_TELEVISION`). | Global within the app — forces leanback even on phones. Heuristic: no effect if TV is detected another way. |
| Remove promo cards & upsell banners | **on** | Manifest: `android:enabled="false"` on Braze content-cards/feed activities; bytecode: `nop` void `requestContentCardsRefresh`/`launchContentCards` call sites. | Push notifications untouched; only Braze-driven promo surfaces are disabled. |
| Suppress subscription paywall | off | Inserts `finish(); return-void` right after `onCreate`'s super call in `UpgradeSubscriptionsActivity`. | **Does not unlock playback or grant a subscription** — entitlement is server-side; can leave a dead-end on a hard account wall. |
| Skip pre-roll promos | **on** | Clears boolean pre-roll gate methods (`Z`-returning, named like pre-roll, in classes referencing "preroll") to `return false`. | Server-injected or stream-embedded pre-roll is out of scope and unaffected. |
| Disable autoplay previews | **on** | In classes whose names match home/browse/feed/discover/explore/landing only: rewrites the literal `true` feeding `Player.setPlayWhenReady(Z)` to `false`. | Opening a title still plays; non-literal arguments are left stock. |
| Prefer external browser over Custom Tabs | **on** | Removes the `android.support.customtabs.action.CustomTabsService` `<intent>` from the manifest `<queries>` block. | Best-effort: no effect if MUBI calls `CustomTabsIntent.launchUrl` directly without probing. |
| Packaging toolkit (signature, install source, MicroG) | off | `dependsOn` the shared `Spoof app signature`, `Spoof install source` and `GmsCore support (MicroG)` patches. | Does not bypass Play Integrity; cannot fix Play Billing on a re-signed build; MicroG needs GmsCore installed. |
| Spoof Widevine level for MUBI | off | `dependsOn` the shared `Spoof Widevine / DRM level` patch (`MediaDrm.getPropertyString`/`getPropertyByteArray` call sites). | Licence servers still decide resolution; L3-attesting flows unaffected. |
| Skip TV confirmation dialog | off | Inserts `finish(); return-void` right after `onCreate`'s super call in `TvConfirmationDialogActivity`. | TV-only usefulness; a flow waiting on a specific dialog result may stall. |

## Design rules

1. **Structural, not fingerprinted.** MUBI ships a build every 1–3 weeks. Scans walk
   the DEX for stable API calls (`Window.addFlags`, `Player.setPlayWhenReady`,
   `MediaDrm.getPropertyString`, Play Core `AppUpdateInfo`, Braze class names) instead
   of pinning obfuscated methods.
2. **Fail-safe.** Every patch checks for its target before writing. A renamed class,
   a missing method or a non-literal argument means that site is left stock — never a
   guessed edit.
3. **Void call sites only** for call-site `nop` patches. Replacing an invoke that
   returns a value with `nop` would leave a dangling `move-result`.
4. **Manifest edits keep matching semantics.** Promo hosts/paths are rewritten to a
   sentinel rather than deleted, because deleting the only host of a `mubi://` filter
   would broaden it to every URI.
5. **No component class renaming.** `Change package name` rewrites permission ids,
   authorities and affinities, but never `android:name` on activities/services/providers.

## Known limitations

- **No APK was available while writing these patches.** Class/activity names come from
  public static analysis (taptrap, tabbed-out, MediaHub) of a merged `com.mubi` build.
  The structural scans are written to no-op rather than mis-patch, but method-level
  anchors should be confirmed against 100.0 (29145546) with jadx/apktool.
- **Entitlement, 4K/HDR, region locks and downloaded-file decryption are server-side.**
  No client patch can grant them.
- **Play Billing/Cast/Google sign-in on a re-signed clone** are signature-bound. The
  packaging toolkit helps with local checks only.
- **Custom Tabs** is best-effort: if MUBI calls `CustomTabsIntent.launchUrl` directly,
  removing the query does not change the handoff.

## Adding a new MUBI version

1. Add an `AppTarget(version = "...", versionCode = ...)` to `MUBI_COMPATIBILITY` in
   `shared/Constants.kt`.
2. Patch 100.0 and check that every default-on patch still applies (the patcher logs
   unmatched fingerprints; structural patches simply do less).
3. Drop targets older than a few months — MUBI forces updates quickly.
4. If an activity or deep-link host changed, update the constants at the top of the
   relevant patch, not the scan logic.

See `MUBI_PATCH_PLAN.md` at the repository root for the full research dossier.
