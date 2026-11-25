# Native patched Maps in Gearslip and Android Auto

## Acceptance requirements

- YouTube Music has one functional music tile in Gearslip; its unusable Settings tile is absent.
- Patched Maps has one navigation entry and opens its real Android Auto map/navigation UI in Gearslip.
- Android Auto also discovers and opens that **patched Maps package**, after installation through KingInstaller. Stock Maps opening is a failure.
- Preserve the patched app's phone UI and existing Android Auto projection path. Do not substitute phone mirroring, a web map, a different map engine, or a placeholder template for the requested UI.
- Confirm discovery, rendering, destination search, route start, touch, back, reconnect and package identity separately. Installer attribution or a successful Binder handshake does not establish navigation compatibility.

## Current dev candidate validation

The final6 candidate passes genuine Android Auto 18.0.664204 / official DHU 2.1 acceptance (17 checks): one renamed Maps entry; native map; the host's real on-screen keyboard; exact typed `amsterdam centraal`; original Maps route preview; explicit Start and turn-by-turn guidance; Back/Exit/cancel; dashboard resize; disconnect and reconnect. Installed bytes match `d7e15e2822a19db22360ed71d55190623b293c5623fd072409cff44267721e37`, with KingInstaller's expected installer attribution and stock Maps disabled.

The same APK passes 28 actual Gearslip 0.3.31-alpha integration checks, including exact typed destination, native result selection, Start/guidance, Back/Exit, one navigation entry, obsolete-message-pin removal and reconnect. Gearslip's actual host callbacks and Maps' original input connection are exercised; Gearslip phone-preview keyboard visuals and physical head-unit operation remain unverified. The user requested a dev prerelease for physical testing.

The module has 41 passing unit tests. Strict APK patch/rebuild/signature/reference validation passes. Actual emitted-DEX probes pass 3 private-client isolation checks, 8 GPS/optional-speed policy checks, and 4 native editor/surface-retention checks. Source hashes for the tested implementation match the isolated worktree. Historical failures below explain the changes and do not describe the current candidate.

Local evidence: `.analysis/gearslip-maps-native/aa-dhu-acceptance-final6.json`, `gearslip-final6/acceptance-final6.json`, and the associated final6 screenshots/logs. These are emulator/DHU results, not physical-car acceptance or stable publication.

## Observed cause

Gearslip's `MessagingCatalog` treats an Android Auto descriptor containing `notification` as a messenger. Its stock exclusion list explicitly excludes `com.google.android.apps.maps` because Maps' car UI uses the Android Auto projection protocol. Renaming patched Maps bypasses that package exclusion and exposes a messages tile. Maps has no manifest declaration for `androidx.car.app.CarAppService` with category `NAVIGATION` in the examined standalone APK.

The existing Gearslip music patch independently introduced the YouTube Music duplicate: it explicitly constructed both `AppTile.Player` and a Settings `AppTile.Screen`. The correction returns a singleton player list for Settings plus media. Original settings-only and navigation precedence paths remain intact.

## Binary references

| Artifact | SHA-256 | Evidence |
| --- | --- | --- |
| Gearslip 0.3.31-alpha, code 13 | `93dd18368f2482c5d36f11fdb8a0a7e6aedfde1d7456500b5c1d1296587fcecc` | REA `ev_6517af621fc0db978b9b90cd7f9b19457bb84a724b8a0450962e4209403dac5d` |
| Maps 26.43.05.1002020710, code 1068844719 | `81506a2c54fc9a8faca34c18af7619d9c9d26cbfbe799b66884a59ac17791004` | REA `ev_d7c875ae7312eb852f6f737fb67716171b36e2a05f9c29d6d63798bcda153b83` |
| User's De-Waze 5.26.90.901 / patches 1.24.1 | `d542e8f54bcba872cdbcc7e3c35109a70fc191f79181e9f543a6d858c15d0403` | REA `ev_74c6ada0c49381d3db7c46516f818af9dfdb3b74b340ede235ef070fe571b852` |

De-Waze exports `com.waze.car_lib.WazeCarAppService` with the standard Car App Library service action and `NAVIGATION` category. Maps instead exports `com.google.android.apps.gmm.car.GmmCarProjectionService` with `CATEGORY_PROJECTION_NAVIGATION`. Merely copying Waze's manifest filter onto Maps' existing service would leave incompatible Binder protocols.

## Recovered Maps projection boundary

The exact examined Maps DEX has these boundaries (obfuscated names are version-specific):

- `GmmCarProjectionService` extends `behn`; its activity class is `tok`, the original Maps car activity.
- `behn.onCreate()` constructs `bemm`; `onBind()` returns `beiy`, descriptor `com.google.android.gms.car.ICarProjection`.
- Projection transaction 1 supplies the callback and `ICar` host interfaces. Transactions 2 and 4 create and resume the original car activity. Transaction 7 forwards touch events.
- `DrawingSpec` carries width, height, density, a real `Surface`, insets and display information. Maps creates its own presentation/virtual display for its car layout; this path does not capture the phone screen.
- Host display interfaces use the exact descriptors `com.google.android.gms.car.display.manager.ICarDisplayManager` and `com.google.android.gms.car.display.manager.ICarDisplay`.
- The original car decor is loaded separately: `ltu` -> `nnd` -> `beir` selects a signature-checked Android Auto package; `lui` loads `com.google.android.gearhead.appdecor.CarUiEntry` from its classloader. The Maps APK does not contain that class.

## Runtime evidence and current limits

A disposable API 36 emulator probe runs inside the installed patched Maps process, using the original DEX and an `ImageReader` surface. It successfully bound and initialized the original projection service, queried host/display capabilities, created the presentation backend and entered the real Maps car activity initialization. It then failed while loading `CarUiEntry` from the emulator's **stub-only** Android Auto system package. This is an observed missing dependency, not a successful rendered map.

The initial probe is under `.analysis/gearslip-maps-native/`; `probe-02.log` records that failure. It uses a test host implementation and reflection to exercise the original controller.

With the genuine full Android Auto package and location permission, `probe-04.log` and its captured image show the original Maps car map, search bar and controls. The production renderer was then exercised from the emitted patched Maps DEX, without copying its implementation into the probe APK. `renderer-search.log` and `renderer-guidance.log` show native search-panel entry, route preview and Start producing turn-by-turn guidance. These route tests use an injected navigation URI; they do not establish typing/selecting a destination through the host keyboard.

The real, officially named Gearslip 0.3.31-alpha host subsequently passed 16 integration assertions against the injected service: one navigation entry, no incidental messaging/media entry, API 7 negotiation, native map pixels, search-panel display and reconnect. Its image-reader test exercises the actual Gearslip host Binder implementations and Maps adapter, not Gearslip's complete preview composition. Back-to-map and destination selection remain separate acceptance checks.

KingInstaller 2.5's genuine Shizuku UI installed the emitted Maps APK byte-for-byte, with `installerPackageName=com.android.vending` and `initiatingPackageName=com.google.android.packageinstaller`. The rooted Shizuku server first failed because Android's PackageInstaller rejects content URIs from UID 0 without an associated package; restarting the genuine server as shell UID 2000 resolved that environment issue. The production Maps adapter does not require root or Shizuku to render.

The user-supplied Android Auto 16.8 bundle's projection certificate expired on 2026-09-02. Both genuine DHU 2.0 and 2.1 reject it at the current date. The user-supplied Android Auto 18.0.664204 bundle matches the newly acquired, Google-signed build and contains a renewed certificate through 2027-02-03. It completes TLS and displays the genuine Android Auto host. The disposable emulator needed the genuine AA package provisioned as a system app to qualify for Android's normal static automotive-projection role; no APK patch, role-qualification bypass or clock change was used.

Android Auto 18 discovered and selected the correct `org.ungoogled.android.apps.maps/patches.maps.gearslip.NativeCarService` component, but exposed a product compatibility defect: its explicit bind intent has no action, while Gearslip's includes the discovery action. The service's action filter returned a null binding. A failing regression now covers that legitimate explicit bind; returning the Binder preserves the existing UID/package/certificate handshake checks. The final2 artifact awaits the remaining genuine-host acceptance checks.

Native Maps requests its keyboard through projection callback 16, with an `IProxyInputConnection` and `EditorInfo`. The current adapter acknowledges that callback without providing a host keyboard. Actual typed-search acceptance must be checked and completed before calling the native interface fully usable; opening the search panel and URI routing are insufficient substitutes.

The music fix has separate RED/GREEN actual-DEX evidence and build reports under `.analysis/gearslip-tile-fix/`. No Maps compatibility claim or stable publication follows from those passing checks.

## Historical implementation gates

1. Native keyboard input, real destination selection, route preview, Start, guidance and Back/Exit are now covered by final6 host tests.
2. The same final6 APK is verified through Gearslip and genuine Android Auto, with KingInstaller bytes and installer metadata recorded separately.
3. Single-entry behavior, obsolete message pins, reconnect and surface cleanup are covered against final6.
4. Dev publication still requires the integrated release build/CI and release-asset verification. Stable promotion remains subject to user confirmation and physical testing.

Do not promote these app changes to `main` or publish a stable release without the repository-required user confirmation.
