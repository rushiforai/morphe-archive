# Compatibility & version history

Which IPTV Pro Stream Player builds each patch bundle release supports, and how each
version was verified. Morphe Manager only offers the versions declared inside the
bundle; this file is the human-readable history behind that list.

## Supported versions (current: v1.3.0)

| Package | App version | versionCode | Status | Verification |
|---------|-------------|-------------|--------|--------------|
| `com.iptvprostreamplayer.v1` | 2.7.24 | 207 | ✅ Supported | 2026-10-27 — dex-level: 6/6 edits, released `.mpp` |
| `com.iptvprostreamplayer.v1` | 2.7.21 | 204 | ✅ Supported | 2026-10-19 — dex-level: 6/6 edits |
| `com.iptvprostreamplayer.v1` | 2.7.17 | — | ⚪ Older target | Not re-verified in recent releases |
| `com.iptvprostreamplayer.v1` | 1.2.7 | — | ⚪ Older target | Not re-verified in recent releases |
| `com.iptvprostreamplayer.v1.fr` | 2.7.24 | 207 | ✅ Supported | 2026-10-27 — dex-level: 6/6 edits, released `.mpp` |
| `com.iptvprostreamplayer.v1.fr` | 2.7.21 | 204 | ✅ Supported | 2026-10-19 — dex-level: 6/6 edits |

"Verified" means the patch was applied to that exact APK and the injected bytecode was
checked instruction-by-instruction after decoding — not just that the patcher printed
`Applied`.

In Morphe the two packages are listed as **IPTV Pro Stream Player** (global) and
**IPTV Pro Stream Player (FR)**. Pick the entry that matches the APK you are attaching:
selecting the global entry and then choosing the `.fr` APK ends in “Wrong package
selected”.

## Release history

| Bundle | Date | App versions | Notes |
|--------|------|--------------|-------|
| [v1.3.0](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.3.0) | 2026-10-27 | 2.7.24 (global + `.fr`) | Remapped subscription gate to the new coroutine/Remote Config layer (`s43.c`), pro entitlement to `qh7.l` |
| [v1.2.0](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.2.0) | 2026-10-19 | `.fr` 2.7.21 | Added the French localized build as a second package |
| [v1.1.0](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.1.0) | 2026-10-19 | 2.7.21 | Re-verified the patch unchanged on the 2.7.21 build |
| [v1.0.2](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.0.2) | 2026-10-01 | — | Bundle display-name fix (`IPTV Pro patches`) |
| [v1.0.1](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.0.1) | 2026-08-31 | — | Maintenance release |
| [v1.0.0](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.0.0) | 2026-08-29 | 1.2.7, 2.7.17 | First release |

Every release keeps its `.mpp` asset, so an older bundle can still be downloaded for
the app version it declares. Bundles never silently drop a version: a removal is called
out in the release notes.

## Hook map (which code each version patches)

| App version | Subscription gate | Pro entitlement | Installer-source spoof |
|-------------|-------------------|-----------------|-----------------------|
| 2.7.24 | `s43.c(String)Z` — only the `subscription_needed` key is forced to false | `qh7.l(Z, Continuation)` returns `Boolean.TRUE` | shared `changePackageInstallerPatch` (`i04`, `c45`, `dq`, `LicenseClient`) |
| 2.7.21 | `O7/j.A()Z` / `O7/j.B()Z` forced to false | `O7/h.w()` / `O7/h.x()` return `Boolean.TRUE` | shared `changePackageInstallerPatch` |
| 2.7.17 / 1.2.7 | Earlier mapping (not re-verified) | Earlier mapping (not re-verified) | Earlier mapping (not re-verified) |

The bundle tries the newer hooks and falls back to the older fingerprints at runtime,
so one bundle can cover both generations.

## Policy

- A version is added to the bundle **only after** the patch has been applied to that
  exact APK and the injected code verified at dex level.
- App updates that change obfuscation get a new bundle release; previously supported
  versions stay declared unless the release notes say otherwise.
- Morphe Manager refuses (or warns for experimental targets) any version the bundle
  does not declare. Do not force a patch onto an undeclared version — the patch may
  report success without applying anything.
