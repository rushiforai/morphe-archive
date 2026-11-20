# 🧩 Channel blocker patches (Morphe add-on)

**Add-on bundle** for Morphe patches. Adds a **"Block channel"** toggle to
YouTube's own flyout menu items ("Not interested" / "Don't recommend
channel"); blocked channels are removed from search results and recommendations.

## ⚠️ Requires the official Morphe patch bundle

This bundle is an add-on: it registers through Morphe's add-on manager and
injects its filter into the base bundle's runtime Litho filter. It **must be
patched together with the official Morphe Patches source** (verified at patch
time with a clear error message).

## How it works

- Registers via `AddOnManager.registerAddOns()` (Morphe add-on contract)
- Filter: injected into `LithoFilterPatch.isFiltered()` of the base bundle —
  blocked channel ids found in a component's protobuf buffer remove it
- Menu toggle: hooks the contextual flyout click handler (fingerprint ported
  from upstream Morphe patches); tapping "Not interested" / "Don't recommend
  channel" also persists the channel to a local blocklist

## ❓ About

Patches for apps I like.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/needfish/channel-blocker-patches

<a href="https://morphe.software/add-source?github=7kitan/channel-blocker-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v2.0.1](https://github.com/needfish/channel-blocker-patches/releases/tag/v2.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.google.android.youtube`

**🎯 Supported versions:**

| 21.30.216 | 21.28.208 | 21.23.492 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block channel](#block-channel) | Adds channel blocking to the video menu. Blocked channels are hidden from search results and video recommendations. Requires the Morphe official patch bundle. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
