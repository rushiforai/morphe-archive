# 🔭 bin0culars patches

Unofficial patches for apps patched with [Morphe](https://morphe.software), made by bin0culars. Not affiliated with or endorsed by the Morphe project.

## ❓ About

bin0culars patches provides quality-of-life and layout modifications for third-party Android applications. The initial patch set targets Reddit, adding responsive tablet layout improvements designed to work seamlessly alongside Morphe's official Reddit patches.

### How to use these patches

In Morphe Manager, add this repository as a patch source: https://github.com/bin0culars/bin0culars-patches

<a href="https://morphe.software/add-source?github=bin0culars/bin0culars-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/bin0culars/bin0culars-patches/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.reddit.frontpage`

**🎯 Supported versions:**

| 2026.45.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Account switcher private mode](#account-switcher-private-mode) | Lets you choose whether the account switcher offers Anonymous Browsing or Incognito, even with one account. Choose in Settings → bin0culars mods. |  |
| [Content-type filter](#content-type-filter) | Show only videos, images, text or link posts on Home and Popular. |  |
| [Post side panel](#post-side-panel) | On tablets in landscape, opens posts in a panel on the right while the feed stays visible. Can be turned off in Settings → bin0culars mods. |  |
| [Tablet grid feed](#tablet-grid-feed) | Shows the feed as a grid with 2 or 3 columns on tablets and other wide screens. Phones are unchanged. |  |

</details>

<!-- PATCHES_END -->

## 📱 Reddit: Tablet grid feed

Displays a multi-column masonry grid (2–3 columns depending on screen width) on tablets and wide screens. Supported feeds include Home, Popular, Latest, News, communities, Following, and custom feeds. Phones and comments remain unchanged.

To toggle:
1. Open Reddit Settings → **bin0culars mods** → Tablet grid feed (this row replaces the "Reddit rules" link).
2. Restart Reddit to apply changes.

- **Tested version:** 2026.45.0
- **Tip:** Pairs well with Morphe's "Start as guest" and "Hide ads" patches.

### Use with Morphe's Reddit patches

Morphe Manager's simple mode patches each app from one source. To combine this patch with Morphe's own Reddit patches (for example Start as guest or Hide ads), turn on **Expert mode** in Morphe Manager's settings.

1. Settings → Expert mode.
2. Tap Reddit and choose the app version.
3. On the patch selection screen, each source has its own tab: keep **Tablet grid feed** in the bin0culars-patches tab and pick the patches you want in the Morphe Patches tab (tap "source hidden" if that tab is not shown).
4. Tap Patch and confirm **Proceed anyway** on the "Multiple patch sources selected" notice.

Tested together with Morphe's Start as guest and Hide ads on Reddit 2026.45.0. Reddit settings then show both a **bin0culars mods** and a **Morphe** entry.

## 🐛 Issues and requests

For bug reports and feature requests, visit https://github.com/bin0culars/bin0culars-patches/issues.

## 🛠️ Building

Build the patches bundle with:

```bash
./gradlew buildAndroid
```

Building requires a GitHub personal access token with `read:packages` permissions, configured via `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties` or via the `GITHUB_ACTOR`/`GITHUB_TOKEN` environment variables.

The built bundle is output to `patches/build/libs/patches-*.mpp`.

## 📜 License

bin0culars patches are licensed under the [GNU General Public License v3.0](LICENSE), with additional conditions under section 7 — see [NOTICE](NOTICE). Parts are adapted from [Morphe patches](https://github.com/MorpheApp/morphe-patches).
