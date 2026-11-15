# FolderSync

Package `dk.tacit.android.foldersync.lite`, supported target `4.14.0` (APKM).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/foldersync/`](../../patches/src/main/kotlin/dev/hyzor/patches/foldersync/).

| Patch | Default | What it does |
|---|---|---|
| Unlock Premium | on | Reports the lite build as the paid version and turns off its ads, unlocking the premium options and the unlimited account/sync-pair limits. |

## Port notes

This is a port of [arandomhooman/hoomans-morphe-patches](https://github.com/arandomhooman/hoomans-morphe-patches)'
4.9.3 / 4.12.0 patch. The 4.14.0 build kept the shape the patch depends on. Note the split
package: the two edited classes (`VersionFeaturesConfig`, `AppPreferenceManager`) are in
`dk.tacit.foldersync.services`, while the consumer that rebuilds the config,
`AppLiteVersionFeatures`, is in the Android subpackage
`dk.tacit.android.foldersync.services`.

The tested artifact is the APKMirror APKM (`base.apk` plus `arm64-v8a` and dpi splits,
versionCode `2020100216`). Morphe patches the base APK; the splits are carried through
unchanged.

## How the app decides you are premium

FolderSync keeps the decision on the device in one data class,
`dk.tacit.foldersync.services.VersionFeaturesConfig`:

```text
a: VersionIdentifier   build flavour (GOOGLE_PLAY_FREE in this APK)
b: boolean             isPaidVersion  <- the premium gate
c: int                 maxAccounts    (already Int.MAX_VALUE in the lite build)
d: int                 maxFolderPairs (already Int.MAX_VALUE)
```

Every premium surface reads field `b` directly: the dashboard, the account and folder-pair
lists, both folder-pair detail screens, and the automation screens. `VersionFeaturesConfig.a()`
returns `showAds` (`!isPaid && flavour == GOOGLE_PLAY_FREE`), so the same flag also stops the
ads; `AdManagerAdMob` and the About screen read the `"premium_version"` preference directly
instead.

The live part is what makes a single hook insufficient. `AppLiteVersionFeatures` seeds a
`MutableStateFlow` with a config built from `getPremiumVersionPurchased()`, then collects
`AppPreferenceManager`'s `PreferenceState` flow and rebuilds the config from
`PreferenceState.premiumVersionPurchased` on every emission. The Play Billing coroutine
reports a non-owner as `setPremiumVersionPurchased(false)`, which pushes a fresh state and
rebuilds the config with `isPaid = false`. Forcing only the preference getter would therefore
be undone a moment after startup.

The patch forces the constructor's boolean argument (`p2`, stored into `b`) instead, so every
config the app builds — the seed and each rebuild or copy — has `isPaidVersion = true`. It
also forces the preference getter to `true` for the direct readers. Only the client-side
decision changes; anything FolderSync's backend verifies is untouched.

## Verification

Static checks:

- `tools/verify_fingerprints.py` resolves both anchors against the stock APKM.
- Morphe applies the bundle to the stock APKM with `--validate`: both fingerprints match
  exactly once, and the patch changes 2 of the 39,662 classes.
- The patched DEX was disassembled. `VersionFeaturesConfig.<init>` now begins with
  `const/4 v2, #int 1` before the `iput-boolean` into `b`, and `getPremiumVersionPurchased()`
  is `const/4 v0, #int 1; return v0`.
- The two patched classes were stripped from their original DEX, so there is no duplicate
  class definition.
- The output is signed by Morphe and still declares `dk.tacit.android.foldersync.lite`
  `4.14.0` (`2020100216`).

Device run on an Android 16 x86_64 emulator (`sdk_gphone64_x86_64`, API 36): the patched
APK installed, cold-started without a fatal exception, and stayed up. Play Billing is not
available on the emulator (`BillingClient: In-app billing API version 3 is not supported on
this device`), so `AppLiteVersionFeatures` takes its no-billing fallback and writes
`getPremiumVersionPurchased()` back into the preference.

That fallback made it possible to test the two hooks separately. A temporary build with only
the constructor hook (removed again before committing) was installed after clearing app data:

| Build | Side sheet header | Automation tab |
|---|---|---|
| constructor hook only | `FolderSync` (preference reads false) | licensed UI, **Add Event**, no upgrade widget |
| full patch | `FolderSync (Premium)` | licensed UI, **Add Event**, no upgrade widget |

The constructor-only row is the important one: the preference really was false, and the
Automation tab still saw `VersionFeaturesConfig.b = true`. `AutomationScreenKt` swaps the
licensed content for `PremiumVersionWidget` when `AutomationUiState.automationIsLicensed` is
false, and that flag is `VersionFeaturesConfig.b`, so the constructor hook holds through the
billing-driven rebuild on its own. Reinstalling the full patch on top of that same
preference-false data made the header read `(Premium)` again, which is the forced
`getPremiumVersionPurchased()` read.

No `AdView` appears in the dashboard hierarchy, there is no upgrade or purchase text, and the
log has no ad request or ad SDK activity.

Not exercised: creating a folder pair or account and running a real sync (no providers were
configured), the purchase screen (there is no purchase row in the premium state), and the
account/folder-pair limits (the lite build already passes `Int.MAX_VALUE` for both).
