# Discord Patches

Morphe patches for Discord (Stable builds).

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=jrddupont/discord-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/jrddupont/discord-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Discord&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 344.13 - Stable | 343.12 - Stable | 342.16 - Stable | 341.13 - Stable |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide gift button](#hide-gift-button) | Hides the gift button in the chat message composer. |  |
| [Hide quest promo banner](#hide-quest-promo-banner) | Hides the quest promo banner at the top of the server channel list. |  |
| [Pin app to built-in bundle](#pin-app-to-built-in-bundle) | Forces Discord to always run the bundle inside the APK and ignore downloaded (OTA) updates, which would otherwise silently undo the other patches. Turn this off (or update the APK) to receive official updates. |  |

</details>

<!-- PATCHES_END -->

## ⚠️ Warnings — read before installing

**🤖 This codebase is entirely AI-generated.** It was written and
verified with an AI assistant and has only been tested on the author's
own device. It works there, but that is the full extent of the testing.
Use it at your own risk: it could break Discord, misbehave on your
device, or stop working with any Discord update. Bug reports are
welcome, but there is no support guarantee.

**🔄 How the patches work — and why updating is disabled.** Discord
ships as versioned APKs (e.g. 344.13 Stable), and these patches are
built against the exact internals of specific versions — a new Discord
release usually needs a newly analyzed patch. On top of that, Discord
can silently download new JavaScript code from the internet (OTA /
bundle updates) that overrides the code inside the installed APK. Since
these patches modify the JavaScript bundled in the APK, any such
downloaded update would silently undo them (observed on-device: both
patches died together after an update landed). To make the patches
stick, the "Pin app to built-in bundle" patch disables that
self-updating behavior and forces Discord to always run the code inside
the APK. The trade-off: you will not receive Discord's code updates
until you install a newer patched APK yourself. If you want official
updates again, turn that patch off (or update the APK).

### 🛠️ Building locally

- Run `./gradlew buildAndroid` (in this environment use the local Gradle
  directly — see HANDOFF notes in the parent workspace — not `./gradlew`,
  since the wrapper cannot download its distribution here)
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Apply the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Discord Patches are licensed under the [GNU General Public License v3.0](LICENSE)
