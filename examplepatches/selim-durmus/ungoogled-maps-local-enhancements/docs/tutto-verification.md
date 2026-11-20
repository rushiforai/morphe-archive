# Tutto Enhancements 1.3.0 verification

Verified 2026-10-07 (America/Edmonton) / 2026-10-08 UTC.

## Build and compatibility

- Maps 26.36.04.973607363 / 1068763346; original APK hash remains pinned in config/build-lock.json.
- bearinmind 1.7.4 at c7bd4c2630b257f695f59a5cf08b98b0b46e85d4, with 21 default patches and microG disabled.
- Tutto MPP SHA-256: ba8243c3facfa036fc047c616cf8df01cc72f3bdb5f7745bb04bd8f0a13c5b8c. Repeated compilation produced the same hash.
- Morphe Desktop 1.18.1 applied both bundles in a single run, including Hide ads and clutter. Reversing bundle argument order also passed.
- Missing upstream, upstream with Offline saved places disabled, and microG enabled each failed with a specific Tutto compatibility message, before producing an APK.
- Route ownership (12 checks), marker geometry (including 10,000-place membership) and label matching tests passed.
- Updated build-all.ps1 completed with fresh caches and Java networking denied by its negative-control-tested guard. Output was signed with the existing key.
- Full PC APK SHA-256: f9265a4c0dc70931cd4b165f89398e35eba371c713cef4ed826c2fcaac53cead.

## Runtime

The combined app installed in-place on the API 36 emulator and retained its test fixtures. Home/Work shortcuts appeared, Work opened route preview, Back cleared the coordinate query, saved markers appeared, and searching the Sinem fixture showed the local result above normal autocomplete and opened the expected place.

The same signed PC build was installed in-place on the Pixel after backing up its old APK and a fresh Local saved export. Its certificate matched the installed version. Home/Work shortcuts and saved marker targets appeared. Customization showed Hide sponsored content and Hide AI enabled, with existing theme/navigation settings preserved.

Morphe Manager 1.34.0 loaded the Android DEX bundle as a separate Tutto Enhancements source/tab and successfully built an APK with both sources (22 patches, STRIP_FAST). The first attempt ran out of storage in the old emulator; the retry completed on an isolated emulator with a 16 GB data partition and a 768 MB patcher heap. The Manager-generated APK was not installed; runtime checks above used the PC-generated APK. No phone data was cleared.

## Limits

The ad-filter patch and enabled switches were verified; this is not a claim that every possible server-delivered advertisement is blocked. Future Maps/upstream patch releases require compatibility review. APK byte identity across different patching runtimes is not guaranteed. The original v1.2.0 encrypted recovery archive remains unchanged; current compiled bundles and source are preserved in this repository.
