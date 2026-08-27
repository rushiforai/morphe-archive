# 🧩 kecerim's Patches

Morphe patches for a few Android apps I use.

## ❓ About

### [dream Player](https://play.google.com/store/apps/details?id=de.cyberdream.dreamepg.player) (`de.cyberdream.dreamepg.player`)

A free Enigma2 / IPTV client for phones and tablets. Its premium features — unlimited
channels, bouquets and profiles, saving autotimers, widgets, and an ad-free UI — are unlocked
by a single in-app purchase.

`Unlock premium` turns that flag on, and stops the app validating the purchase against the
vendor's license server, which would otherwise revoke it.

### [Settle Up](https://play.google.com/store/apps/details?id=cz.destil.settleup) (`cz.destil.settleup`)

A group expense splitter. Free users see a rewarded ad after adding expenses, and premium
features are unlocked either by subscribing or by watching an ad for a temporary unlock.

`Remove ads` stops the ad counter and blocks the ad screen. `Unlock premium` answers the
app's client-side feature gates. Note that Settle Up keeps premium state in Firebase rather
than in a local flag, so anything the backend enforces server-side is out of reach of a
client patch.

Both Settle Up patches also disable Google Play's PairIP license check, which otherwise
closes the app on startup and sends you to the Play Store, because patching re-signs the APK.

> [!NOTE]
> **These patches were written by AI.** Claude reverse-engineered the apps, wrote the
> fingerprints and the patches, and verified the resulting bytecode. A human reviewed and
> released it, but keep that origin in mind before you trust it: read the source and check
> the patched app yourself rather than assuming it has had the scrutiny hand-written patches
> normally get.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Kecerim24/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/Kecerim24/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Settle Up&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 11.0.2280 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads](#remove-ads) | Removes the rewarded ads shown after adding expenses. |  |
| [Unlock premium](#unlock-premium) | Unlocks all premium features that the app gates on the client. |  |

</details>

<details open>
<summary>📦 dream Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 14.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Unlocks all premium features, removes ads and disables the online license check. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

kecerim's Patches are licensed under the [GNU General Public License v3.0](LICENSE)
