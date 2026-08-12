# 🧩 Imgur Morphe Patches

> ⚠️ **Experimental.** This is an unofficial, experimental Morphe patch bundle and is provided for
> **educational purposes only**. Use at your own risk. It is not affiliated with or endorsed by
> Imgur or Morphe. Violates Imgur's Terms of Service — do not use it to circumvent monetization in
> production.

Morphe patches that remove all ads from the Imgur Android app (`com.imgur.mobile`).

## How to use

Add this repo as a patch source in Morphe Manager:

https://morphe.software/add-source?github=sushruth/imgur-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/sushruth/imgur-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Imgur&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.34.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads](#remove-ads) | Removes all ads in the app by forcing the no-ads (Emerald) entitlement flag. |  |

</details>

<!-- PATCHES_END -->

## 🚀 Get started

Requires a JDK 21 and the Morphe CLI. Everything runs through [devbox](https://www.jetify.com/devbox)
— see `AGENTS.md` for the locked-down workflow.

## 🛠️ Building

```sh
devbox run build       # builds patches/build/libs/patches-*.mpp
devbox run patch -- work/imgur.apk work/imgur-patched.apk
```

Building requires a GitHub PAT with `read:packages` scope (Morphe dependencies live on GitHub
Packages). See `AGENTS.md` → "GitHub Packages auth".

## 📜 License

Imgur Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
