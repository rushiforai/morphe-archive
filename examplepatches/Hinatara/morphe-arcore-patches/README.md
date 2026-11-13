# Morphe ARCore experiment patches

Experimental Morphe patch for CardboardXR on unsupported devices —
ZTE nubia Neo 5G test. Fingerprint **VERIFIED** from the real dex,
patch default = false.

## Add to Morphe Manager

Remote source (auto-updates when a new release is published):

- In Morphe: **Sources → + → Remote** → paste
  `https://github.com/Hinatara/morphe-arcore-patches`
- Or tap: [Add to Morphe](https://morphe.software/add-source?github=Hinatara/morphe-arcore-patches)

The repo is private (owner's choice): set a GitHub PAT in Morphe
Settings → GitHub PAT first, or the source cannot be fetched.

## Patches

<!-- PATCHES_START -->
> **[v1.1.2](https://github.com/Hinatara/morphe-arcore-patches/releases/tag/v1.1.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 CardboardXR&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.brenpoly.cardboardxr`

**🎯 Supported versions:**

| 1.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force ARCore availability: SUPPORTED_INSTALLED (CardboardXR)](#force-arcore-availability-supported-installed-cardboardxr) | Experimental: force the real checkAvailability() in CardboardXR (com.google.ar.core.k) to return SUPPORTED_INSTALLED. Fingerprint VERIFIED from the CardboardXR 1.0.0 dex. Does NOT supply a device profile, so AR session creation may still fail. |  |

</details>

<!-- PATCHES_END -->

## Notes

- Target: **CardboardXR 1.0.0** (`com.brenpoly.cardboardxr`).
- Only patch: `Force ARCore availability: SUPPORTED_INSTALLED
  (CardboardXR)` — forces the real `checkAvailability()` implementation
  (`com.google.ar.core.k`, returned by `ArCoreApk.getInstance()`) to
  return `SUPPORTED_INSTALLED`. `ArCoreApk.checkAvailability` itself is
  only a stub in this app (throws `UnsupportedOperationException`).
  Fingerprint verified from the CardboardXR 1.0.0 dex: defining class
  `Lcom/google/ar/core/k;`, filter is the string
  `"request not running but result is null?"` (unique in the whole dex).
- The old target (Google Play Services for AR, the service APK) is
  dropped: its dex contains no `ArCoreApk` class at all (verified by
  dexdump on ARCore 1.57.262640283), so no fingerprint can ever match
  there. See `FINGERPRINT_RESEARCH.md` in the scaffold.
- Forcing availability does NOT supply a device profile, so an AR
  session may still fail on the ZTE Z2571N (no device profile data).
- Releases: GitHub Actions workflow `Release` (semantic-release) runs
  on push to main — it builds the `.mpp`, creates a GitHub Release with
  the bundle, and commits `patches-bundle.json` back so Morphe can
  auto-update. Manual builds: workflow `Build .mpp` (no PAT needed,
  Actions injects `GITHUB_TOKEN`).
- Local build needs JDK 21 + Android SDK 36 + a GitHub token for the
  Morphe package registry (the registry returns 401 without one).
##Currently under testing, please do not download as it is unstable. 
