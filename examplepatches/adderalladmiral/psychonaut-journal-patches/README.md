# Journal Patches

[Morphe](https://github.com/MorpheApp) patches for [Journal](https://journal.isaakhanimann.com) (`com.isaakhanimann.journal`) — the substance-use tracking app by Isaak Hanimann.

Seven focused patches: unlock premium features, hide bottom-nav tabs you don't use, drop the Feedback section from Settings, trim unused permissions (up to and including all network access), stop the app from talking to RevenueCat's servers entirely, swap in your own substances database, or clone the app to run side by side with a stock install..

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/adderalladmiral/test-actual/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Journal&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clone](#clone) | Renames the package and app label so the patched build installs alongside a stock Journal instead of replacing it. | • Package name<br>• App name |
| [Custom substances database](#custom-substances-database) | Replaces the bundled Substances.json asset with your own file. | • Substances JSON path |
| [Hide bottom tabs](#hide-bottom-tabs) | Lets you individually hide the Stats, Drugs and Safer tabs from the bottom navigation bar. Journal and Settings can't be hidden. | • Hide Stats tab<br>• Hide Drugs tab<br>• Hide Safer tab |
| [Hide feedback section](#hide-feedback-section) | Removes the "Feedback" section (FAQ, bug report, copy support info) from Settings. |  |
| [Purge RevenueCat](#purge-revenuecat) | Stops the app from ever talking to RevenueCat's servers: skips SDK initialization on startup and neuters the app's periodic "refresh entitlement" network calls. Requires Unlock premium to also be enabled - without it, premium status has no way to ever resolve as active. |  |
| [Remove internet permission](#remove-internet-permission) | Removes the ACCESS_NETWORK_STATE permission, and optionally INTERNET too. | • Also remove INTERNET |
| [Unlock premium](#unlock-premium) | Forces the RevenueCat "premium" entitlement check to always resolve as active, including before the app has ever reached RevenueCat's servers. |  |

</details>

<!-- PATCHES_END -->

## Patches

### Unlock premium
*Enabled by default*

Forces the RevenueCat `"premium"` entitlement check to always resolve as active — including on a fresh, offline install, before the app has ever reached RevenueCat's servers. Two spots are patched:

- The `EntitlementInfo.isActive()` result is forced to `true` at the point both the "entitlement present" and "entitlement absent" code paths converge, so the check resolves correctly regardless of account state.
- The in-memory listener that seeds premium status on cold start defaults to `Boolean.TRUE` instead of `Boolean.FALSE`, so the app doesn't show as non-premium for the brief window before any network response arrives (or ever, if offline).

No options.

### Hide bottom tabs
*Enabled by default*

Individually hides the **Stats**, **Drugs**, and **Safer** tabs from the bottom navigation bar. **Journal** and **Settings** are always kept and can't be hidden.

| Option | Type | Default | Description |
|---|---|---|---|
| `hideStats` | boolean | `true` | Removes the Stats tab |
| `hideDrugs` | boolean | `true` | Removes the Drugs tab |
| `hideSafer` | boolean | `true` | Removes the Safer tab |

### Hide feedback section
*Enabled by default*

Removes the "Feedback" section (FAQ, bug report, copy support info) from the Settings screen. No options.

### Remove internet permission
*Enabled by default*

Removes the `ACCESS_NETWORK_STATE` permission. By default `INTERNET` is left declared — RevenueCat's SDK does a static manifest check on startup and crashes immediately (`IllegalArgumentException: Purchases requires INTERNET permission.`) if it's missing, even though the app never actually depends on that permission doing anything once **Unlock premium** is applied.

| Option | Type | Default | Description |
|---|---|---|---|
| `removeInternet` | boolean | `false` | Also removes `INTERNET`. **Requires Purge RevenueCat to also be enabled** — without it, RevenueCat's SDK still calls `configure()` on startup and crashes without `INTERNET` declared. |

### Purge RevenueCat
*Disabled by default*

Stops the app from ever talking to RevenueCat's servers, rather than just lying to it about entitlement status: skips `Purchases.configure()` on startup entirely, and neuters the app's periodic "refresh entitlements" network calls. Verified with a packet capture — zero RevenueCat traffic with this enabled.

Requires **Unlock premium** to also be enabled — this patch only stops the network calls; premium status still needs to resolve to `true` some other way, which is what Unlock premium's bytecode-level defaults do.

No options.

### Custom substances database
*Disabled by default*

Overwrites the bundled `assets/Substances.json` with your own file, letting you swap in an expanded or customized substance database at patch time.

| Option | Type | Default | Description |
|---|---|---|---|
| `substancesFile` | string (required) | — | Absolute path on your machine to a replacement `Substances.json` |

[`data/Substances.json`](data/Substances.json) in this repo is an expanded database (302 substances, 25 categories) merged from other Journal-based apps — extra substances, additional routes of administration, and new categories layered on top of the stock data. Point `substancesFile` at it (using the file's absolute path on your machine) to use it.

### Clone
*Disabled by default*

Renames the package name and app label so a patched build installs alongside a stock Journal instead of replacing it — useful for testing patches without losing your existing install. Rewrites the manifest package, permissions, and provider authorities (which must be unique per-device), plus matching string constants in the bytecode (e.g. RevenueCat integration, file sharing) so the clone doesn't break at runtime.

| Option | Type | Default | Description |
|---|---|---|---|
| `packageName` | string (required) | `com.isaakhanimann.journal.morphe` | New package name for the patched app |
| `appName` | string (required) | `Journal Morphe` | New app label. Set to `Journal` to leave the label unchanged |

## Building

Requires JDK 17+. Build the patch bundle with the included Gradle wrapper:

```bash
./gradlew :patches:build
```

The compiled patch pack is written to `patches/build/libs/patches-1.0.0.mpp`.

## Applying patches

Patching itself is done with [Morphe Desktop](https://github.com/MorpheApp/morphe-patcher), the Morphe patcher's desktop app — not this repo. Point it at the `.mpp` file you just built and your own Journal APK.

### List available patches

In Morphe Desktop, add `patches-1.0.0.mpp` as a patch bundle and it'll list the six patches above, along with their options, in the UI.

### Configure options

The easiest way to configure multiple patches at once is with an options file rather than setting each one by hand in the UI. Morphe Desktop can generate a template for you from the Options tab, or from the CLI it bundles:

```bash
java -jar morphe-desktop-*.jar options-create --patches=patches-1.0.0.mpp options.json
```

Edit the generated `options.json` to enable/disable patches and set their options, for example:

```json
[
    {
        "patches": {
            "Unlock premium": { "enabled": true },
            "Hide feedback section": { "enabled": true },
            "Remove internet permission": { "enabled": true },
            "Hide bottom tabs": {
                "enabled": true,
                "options": {
                    "hideStats": false,
                    "hideDrugs": false,
                    "hideSafer": true
                }
            },
            "Custom substances database": {
                "enabled": true,
                "options": {
                    "substancesFile": "/absolute/path/to/Substances.json"
                }
            },
            "Clone": { "enabled": false }
        }
    }
]
```

### Patch the APK

Either run the patch from Morphe Desktop's UI (select the `.mpp` bundle, your `options.json`, and your Journal APK), or use its bundled CLI:

```bash
java -jar morphe-desktop-*.jar patch \
  --patches=patches-1.0.0.mpp \
  --options-file=options.json \
  -o journal-patched.apk \
  journal-15.5.apk
```

### Install

```bash
adb install -r journal-patched.apk
```

## Project layout

```
journal-patches/
├── patches/
│   └── src/main/kotlin/com/journal/patches/
│       ├── clone/          Clone
│       ├── navigation/     Hide bottom tabs
│       ├── premium/        Unlock premium, Purge RevenueCat
│       ├── privacy/        Remove internet permission
│       ├── settings/       Hide feedback section
│       ├── substances/     Custom substances database
│       └── shared/         Compatibility constants
└── settings.gradle.kts
```

Patches are built with the [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) Kotlin DSL and locate their targets in obfuscated bytecode using `Fingerprint`s — string constants, method signatures, and interface implementations that stay stable across Journal releases even as class and method names get re-obfuscated each build.

## License

GPLv3
