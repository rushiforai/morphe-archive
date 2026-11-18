# M1zir’s SwiftKey Clipboard Patches

Maintained by **Abubakr Ahmed (M1zir)**.

Experimental Morphe bundle for **Microsoft SwiftKey 9.13.19.3**
(`com.touchtype.swiftkey`). Based on
[murilosimao/swiftkey-patch v0.1.1](https://github.com/murilosimao/swiftkey-patch/releases/tag/v0.1.1),
commit `2d6d054b387d5b39a8d35d35d335a478a542306b`.

[Add this source to Morphe](https://morphe.software/add-source?github=M1zir/swiftkey-clipboard-patches) · [Releases](https://github.com/M1zir/swiftkey-clipboard-patches/releases)

## Use on Android

1. Copy **swiftkey-clipboard-patches-0.3.1.mpp** to your Android device.
2. In Morphe, open **Sources → Add → Local** and select that file.
3. Select an **original, unpatched SwiftKey 9.13.19.3 APK**.
4. Select **Keep clipboard history forever**, **Restore Arabic 123 legacy layout**,
   or both. Deselect any other patches you do not want.
5. Patch the app and install the resulting APK through Morphe.
6. For clipboard retention, turn on **Rich input → Clipboard → Remember copied items**.
7. For the legacy layout, open **SwiftKey → Languages**, select your enabled Arabic
   language, and choose **Arabic 123 - Legacy** in its layout chooser.

Menu wording can vary. The bundle includes JVM classes and DEX for Desktop and
Android loaders. Desktop application was verified; Android Manager import and
operation still need a device test.

The modified APK has a different signature from Microsoft's app. Android may
refuse to install it over the official installation. Save important clips and
settings before any uninstall, which erases local app data. Keep Morphe's signing
key for future updates.

## Behavior

The clipboard patch disables local age expiry and fixes timestamp comparison for clips
weeks or years apart. It preserves manual deletion, pin/unpin, clipboard
enable/disable, and the existing save/load code.

No fixed entry-count cap was found in this version's local collection and JSON
save/load paths, so no numeric limit replacement is needed. “Forever” means no
automatic age expiry, not infinite device storage. SwiftKey loads the list and
rewrites it when saving; very large histories can become slow. Expired clips
cannot be recovered.

Screenshots and images successfully added to SwiftKey’s clipboard use this same
local expiry rule. SwiftKey copies screenshot images into its private
`clipboard_images` directory. Real-device screenshot retention remains untested.

Cloud sync, remote deletion, duplicate handling, and single-slot incoming cloud
clipboard behavior remain native. This is **local history retention**, not an
unlimited cloud archive. Image availability can depend on source URIs and files.
The patch adds no permissions, network calls, separate clipboard collector, or
database. SwiftKey's existing interface text is unchanged, including any mention
of one hour.

The **Restore Arabic 123 legacy layout** patch exposes the original layout still
bundled in this APK. It adds the legacy choice wherever the current Arabic 123
layout is available, without changing the default or replacing modern layouts.
Version 0.3.1 selects the variant whose middle row ends in **ط**, with **و** as
the third bottom-row letter and no separate **ؤ** key. **ؤ** remains on long-press.
If upgrading from v0.3.0, select **Arabic 123 - Legacy** again after installation;
the previously saved layout is not switched automatically.
The native localized name, key maps, symbols and long-press behavior are reused.
No old APK or separate layout download is needed. See [layout details](docs/ARABIC_LAYOUT.md).

The bundle retains the optional **Customise toolbar**, **Disable telemetry**,
and **Disable cloud sign-in prompt** patches. The toolbar editor retains upstream
Portuguese labels. See [original documentation](docs/UPSTREAM_README.md).

## Validation

See [VALIDATION.md](VALIDATION.md) for the input hash, passed checks, and limitations.
The patch validates package/version, class strings, method signatures, opcode
sequences, and references. It stops on a changed or already patched target.

Microsoft's [version listing](https://support.microsoft.com/en-us/swiftkey-keyboard/for-microsoft-swiftkey-commercial-partners)
listed 9.13.19.3 as latest on 2026-11-10. Verification used its original ARM64 APK.
Beta and future versions are not declared compatible. Apply all desired patches
in one pass to an original APK.

## Build and local verification

Requires JDK 21+, Python 3.11+, curl, and Android SDK platform 36.
Set `JAVA_HOME` and `ANDROID_HOME`:

```sh
python3 scripts/bootstrap.py
./gradlew buildAndroid
./scripts/patch.sh /absolute/path/to/original-9.13.19.3.apk
```

Output: `patches/build/libs/swiftkey-clipboard-patches-0.3.1.mpp`.
Public tools are pinned with checksums; no GitHub token is needed.
The patch script selects only the clipboard patch and verifies its emitted
bytecode; it does not install the APK. Test APKs and signing material stay local.

Use `./scripts/build.sh` to also run the upstream JVM/UI tests.
The UI tests require a Robolectric-supported host; Linux ARM64 is unsupported.

## Maintainer releases

This source is configured for `M1zir/swiftkey-clipboard-patches`.
Release 0.3.1 is experimental; enable pre-releases in Morphe if necessary.
The repository owner is Abubakr Ahmed (M1zir); upstream credit is preserved.

For future releases, increment `version` in `gradle.properties`, run
`python3 scripts/configure-source.py M1zir/swiftkey-clipboard-patches`, then build.
Commit the generated catalog and metadata, tag that commit, and upload the MPP,
`patches-bundle.json`, and `patches-list.json` to the matching release.

GPL-3.0: [LICENSE](LICENSE), [attribution](THIRD_PARTY_NOTICES.md).
Independent fork; not an official Microsoft, Morphe, or upstream release.
Modified 2026-11-10/11: Arabic 123 legacy layout restoration, clipboard retention, overflow-safe sorting, verification,
bundle identity, and documentation.
