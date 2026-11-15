# Jo's Patches

Free, open-source patches for Android apps, for use with
[Morphe](https://morphe.software).

Current apps:

- **Memorize Pi Digits â€“ 3.14Ï€** (`com.unknownprojectx.pi`)
- **Material Capsule** (`com.pryshedko.mtisland`)

More apps will be added over time.

## Add to Morphe

Click this link on an Android device with Morphe installed:

**https://morphe.software/add-source?gitlab=JoPatches/jo-patches**

Or add the repository manually as a patch source in Morphe Manager:

**https://gitlab.com/JoPatches/jo-patches**

## Patches

<!-- PATCHES_START EXPANDED -->

| Patch | App | Default | What it does |
|---|---|---|---|
| **Remove home screen ads** | Memorize Pi Digits | on | Blocks every AdMob banner entry point (DeviceManager, AdManager, AdmobAdapter), so no banner view is created. |
| **Remove cross-promotion (Prime Button and game icons)** | Memorize Pi Digits | on | Deactivates the "Prime Button" and the six side-panel game icons inside `data.unity3d` and scales them to zero. |
| **Disable Firebase Analytics tracking** | Material Capsule | on | Deactivates Google Analytics for Firebase through the documented manifest switches and removes the advertising-ID / Privacy-Sandbox permissions. |
| **Unlock Pro features** | Material Capsule | on | Forces the Pro/Premium entitlement to active, so gestures, widgets, card colours, the full mode player and app search work without a Play purchase. |
| **Bypass PairIP license check** | both apps | on | Disables the Play PairIP license check that would otherwise send a re-signed build to the Play Store. Needed for a normal sideloaded install. |

Every patch is enabled by default and only shown for the app versions listed
under [Supported app versions](#supported-app-versions).

<!-- PATCHES_END -->

## What the patches do

### Memorize Pi Digits

The main menu of the app shows three kinds of advertising:

1. an **AdMob banner** above the Unity surface,
2. the **â€œPrime Buttonâ€**, a Unity UI button promoting another app by the same
   developer,
3. **six side-panel game icons** (three per side) promoting more games.

This bundle removes all three:

| Element | Patch |
|---|---|
| AdMob banner on the home screen | **Remove home screen ads** (DEX) |
| â€œPrime Buttonâ€ | **Remove cross-promotion** (Unity scene) |
| Six side icons below `MainMenu/PromoteIcon` | **Remove cross-promotion** (Unity scene) |
| PairIP license block on sideloaded builds | **Bypass PairIP license check** (DEX) |

Interstitial and rewarded ads are **not** touched, and no other game feature is
changed.

#### Remove home screen ads

The banner is an Android `View` created by the Unity plugin
`com.homelib.android.ad`. The patch returns early from every Java entry point
that can create or show it:

- `DeviceManager.ShowBannerAd(int)`
- `AdManager.ShowBannerAd(int)`
- `AdmobAdapter.showBannerAd()`
- `AdmobAdapter.show()`

No banner view is created, and no banner request is sent to AdMob. The freed
area shows the black Unity background.

#### Remove cross-promotion (Unity scenes)

The â€œPrime Buttonâ€ and the side icons are Unity `GameObject`s inside
`assets/bin/Data/data.unity3d`, so they cannot be removed with a Java patch.
The patch edits the serialized scenes (`level0`â€“`level2`) in place:

- every target `GameObject`: `m_IsActive = false`
- every related `Transform`: `m_LocalScale = (0, 0, 0)`

Zero scale is deliberate: the menu scripts re-activate the objects at runtime,
and zero scale also shrinks their box colliders so the invisible elements
cannot be tapped.

### Material Capsule

Material Capsule contains **no advertising SDK** â€” no AdMob, AppLovin, Unity
Ads, ironSource or similar. The `AD_ID` and Privacy-Sandbox permissions in the
manifest come from the bundled `play-services-measurement` library, not from an
ad network. There is therefore no ads patch for this app.

What the app does ship is **Google Analytics for Firebase**. It registers
`FirebaseInitProvider`, the `AppMeasurement` service and the analytics
component registrars, and the app's own wrapper logs selection events.

| Element | Patch |
|---|---|
| Firebase Analytics event upload | **Disable Firebase Analytics tracking** (manifest) |
| Advertising-ID / Privacy-Sandbox permissions | **Disable Firebase Analytics tracking** (manifest) |
| Pro / Premium entitlement | **Unlock Pro features** (DEX) |
| PairIP license block on sideloaded builds | **Bypass PairIP license check** (DEX) |

#### Disable Firebase Analytics tracking

The patch works on the manifest instead of patching obfuscated call sites:

- `firebase_analytics_collection_deactivated` = `true` â€” the SDK drops every
  event before it is queued, so no event leaves the device.
- `google_analytics_adid_collection_enabled` = `false` â€” the measurement SDK
  does not read the advertising ID.
- `google_analytics_ssaid_collection_enabled` = `false` â€” same for the App Set
  ID.
- The `com.google.android.gms.permission.AD_ID`,
  `android.permission.ACCESS_ADSERVICES_AD_ID` and
  `android.permission.ACCESS_ADSERVICES_ATTRIBUTION` permissions are removed.

No DEX method is touched. The capsule itself, the accessibility service,
notifications, widgets and billing keep working unchanged.

#### Unlock Pro features

The Pro flag is a single encrypted value in the app's DataStore (`SECURE_DATA`,
AES key alias `pro_version_key`, plaintext `"yes"` / `"no"`). All feature gates
â€” gestures, widgets, card colours, full mode player, app search â€” read it as a
Kotlin `Flow<Boolean>`, collected by the corresponding view model:

- `uu1.d()` exposes that flow. Both it and the activity's own state go through
  the same transform, which reads the DataStore snapshot, decrypts the value
  and emits the `Boolean` (and additionally requires the integrity status).
- `uu1.c(...)` is the suspend one-shot read of the same value, used by the
  purchase check.

The patch replaces both at the source:

1. the transform emits `Boolean.TRUE` unconditionally (both emit sites), so
   every collector sees Pro as active from the first emission and the
   integrity check is bypassed at the same time,
2. the suspend one-shot read returns `true`, so the purchase check agrees and
   never revokes Pro,
3. the gesture item's `isEnabled` setter stores `true` unconditionally.

Step 3 exists because the app disables **all** gestures on its own: whenever its
Pro/billing reconciliation runs (`u40` â†’ the gesture repository's bulk reset),
every gesture is written with `isEnabled = false`. That wiped the user's
switches on each app start. Since the patched app always reports Pro, that reset
must never win. Trade-off: a gesture switch turns itself back on when it is
turned off manually; to remove a gesture, delete it instead of disabling it.

The billing code (`u40`, `sku_five_dollars`, Play Billing 9.1.0) is left
untouched: it still exists and still writes the flag after a real purchase, the
app simply no longer depends on it.

### Bypass PairIP license check (both apps)

Both apps ship Google's PairIP wrapper in its license-check-only variant (no
`libpairipcore.so`). On launch it requires the installer package to be
`com.android.vending`; a re-signed APK installed from storage is otherwise
redirected to the Play Store and closed. The patch disables the check so the
patched build can start.

If you install the patched build with a root/mount based installer over the
Play Store version, this patch is not needed. It is enabled by default because
most users sideload the patched APK.

## Supported app versions

| App | Version | Version code | Architecture | Status |
|---|---|---|---|---|
| Memorize Pi Digits | 11.01 | 11010 | arm64-v8a | verified |
| Material Capsule | 17.3 | 173 | arm64-v8a | patch build verified, not device-tested |

The compatibility declarations pin these versions and version codes. Morphe
will show a warning for other versions, and a patch aborts cleanly instead of
producing a broken build.

## Requirements

- Android device with the Play Store version of the app (for the root/mount
  route) **or** a sideloaded patched APK
- Morphe Manager or Morphe Desktop
- arm64-v8a device (both XAPKs contain only this ABI)

## Installation

1. Obtain the original XAPK of the supported version (see table above). Morphe
   accepts the XAPK directly.
2. Add this repository as a patch source in Morphe.
3. Select the app and apply the patches (all applicable patches are enabled by
   default).
4. Patch, sign and install **from Morphe's own installer** - not by opening the
   finished APK from a file manager (see the Play Protect note below).

> The patched APK has a different signature than the Play Store version.
> Uninstall the original first (back up your data if needed) and disable
> automatic updates for the app.

### If Play Protect says "App blocked to protect your device"

Play Protect has a second, much stricter protection next to normal app scanning.
It shows a dialog with **only an OK button**:

> App blocked to protect your device
> This app can request access to sensitive data. This can increase the risk of
> identity theft or financial fraud.

This is not a malware verdict and it is not about the signature. Google's rule
([developer guidance](https://developers.google.com/android/play-protect/warning-dev-guidance))
is purely mechanical: an APK that is **downloaded from an internet-sideloading
source** - a web browser, a messaging app or a file manager - is blocked
automatically when it declares any of

- `RECEIVE_SMS` / `READ_SMS`
- `BIND_NOTIFICATION_LISTENER_SERVICE`
- `BIND_ACCESSIBILITY_SERVICE`

Material Capsule declares the notification listener *and* the accessibility
service; they are the app's core features (island notifications, gesture
actions). So opening the patched APK from Chrome, Downloads or Files always
gets the hard block. Memorize Pi declares neither of them, which is why the same
install route only shows the normal warning there.

**The fix is the install route, not the patch: let Morphe install it.** Morphe's
built-in installer stages the APK as a locally generated file
(`PackageInstaller.PACKAGE_SOURCE_LOCAL_FILE`), not as an internet download, so
the rule above never applies and Play Protect can stay fully enabled.

1. Morphe â†’ **Settings â†’ Installation** â†’ default installer on the system
   installer, "After patching" on *Install automatically* (or *Ask*).
2. Patch the XAPK inside Morphe and tap **Install** in Morphe.
3. Do not open the finished APK from Chrome, Downloads or a file manager - that
   is exactly the route Google blocks.

If the APK is already on the device and cannot be routed through Morphe again:

1. `adb install -r -d <file>.apk` - adb is not an internet-sideloading source.
2. Play Store â†’ profile â†’ Play Protect â†’ gear icon â†’ disable "Scan apps with
   Play Protect" for the install, then enable it again.
3. Root / mount installer over the Play Store version (original signature stays
   intact, nothing to block, no data loss).

Neither a different signing key nor renaming the package changes this - both are
irrelevant to the rule above, and a rename would break widgets, the
accessibility service and app links.

Do **not** install the re-signed APK over the Play Store version: the installer
rejects it with "App not installed" because of the signature mismatch.

## How it works

- The DEX patches use Morphe fingerprints on stable, non-obfuscated framework
  glue and replace the method bodies with `return-void` (or `return true` for
  the installer check). The PairIP patch is shared by both apps.
- The **Unlock Pro features** patch works on the entitlement itself, not on the
  UI: that is the only place where the Pro state is produced. Its fingerprints
  match the obfuscated classes structurally (collector interface, `"yes"`
  literal, AES decrypt helper, `SecretKey` factory), so a re-obfuscated build
  fails loudly instead of patching the wrong method.
- The Firebase Analytics patch only edits `AndroidManifest.xml`; it adds the
  documented Firebase meta-data switches and removes the advertising-ID
  permissions. No DEX entry is changed.
- The scene patch parses the `UnityFS` container, decompresses the LZ4 blocks,
  reads the `SerializedFile` object table of the `level*` scenes and flips
  `m_IsActive` / `m_LocalScale` in place. Object sizes do not change, so all
  offsets and metadata stay valid. Only blocks that contain edited bytes are
  recompressed, and the result is verified with a full decompress round-trip
  before it is written back.
- The bundle is self-contained: the LZ4 block codec is implemented in this
  project, so no third-party compression library is shipped.

Technical details (in German) are in
[`docs/Technische-Doku.md`](docs/Technische-Doku.md) and
[`docs/Material-Capsule.md`](docs/Material-Capsule.md).

## Building locally

```powershell
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot"
.\gradlew.bat :patches:build "-Pversion=1.6.2"
# result: patches/build/libs/patches-1.6.2.mpp
```

Run the integration test against the original base APK of Memorize Pi Digits:

```powershell
.\gradlew.bat :patches:runBundleTest "-Pversion=1.6.2" `
    "-PapkFile=C:\path\to\com.unknownprojectx.pi.apk"
```

Run the integration test against the original base APK of Material Capsule:

```powershell
.\gradlew.bat :patches:runBundleTestMaterialCapsule "-Pversion=1.6.2"
```

The Memorize Pi test patches the base APK, checks the DEX entry points,
verifies that `assets/bin/Data/data.unity3d` stays **STORED**, and checks all
scene targets. The Material Capsule test checks the PairIP method, the Pro
entitlement (flow transform emits `Boolean.TRUE`, one-shot read returns `true`)
and the resulting manifest (analytics switches present, advertising-ID
permissions gone). With `MORPHE_SCENE_REFERENCE=<data.unity3d>` the scene test
also compares the patched object bytes against a reference bundle.

Build the release bundle **last**, because `buildAndroid` is what adds
`classes.dex` to the `.mpp`:

```powershell
.\gradlew.bat clean :patches:generatePatchesList "-Pversion=1.6.2"
.\gradlew.bat :patches:buildAndroid "-Pversion=1.6.2"
```

## Release process

The current release is published on GitLab. The bundle
(`patches/build/libs/patches-<version>.mpp`) is built locally with
`./gradlew :patches:buildAndroid` and uploaded as a release asset.
`patches-bundle.json` is updated to point at that download URL.

The `.github/workflows/release.yml` file is kept for a future GitHub mirror
and uses semantic-release. Commits there must use semantic messages:

- `feat: ...` â†’ minor release
- `fix: ...` â†’ patch release
- `chore: ...` â†’ no release

Do not edit `patches-list.json`, `patches-bundle.json` or `CHANGELOG.md` by
hand when a release pipeline is in use; they are generated during the release.
If the `MORPHE_SIGNING_KEY` secret is configured, the release artifacts are
signed and Morphe Manager can verify them.

## Legal notice

This project is not affiliated with the developers of Memorize Pi Digits or
Material Capsule, nor with the Morphe project.

The patches modify apps you must own a license for. The **Bypass PairIP
license check** patch circumvents a technical protection measure. Distributing
that patch may be unlawful in some jurisdictions (for example Â§ 95a UrhG in
Germany) and may violate the app store's terms. The same applies to the
**Unlock Pro features** patch, which bypasses the paid Pro entitlement of
Material Capsule. Both are published for interoperability and personal use; you
are responsible for how you use them.

Morphe and its maintainers do not review or endorse third-party patch sources.

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE),
with the additional conditions in [NOTICE](NOTICE).
