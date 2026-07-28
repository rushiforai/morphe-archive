# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

TODO: Update this about section with a brief introduction/summary about this repo and what it offers.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://github.com/itsthejoker/itsthejoker-patches/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Roost&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 1.4.12 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [10x Bullet Damage](#10x-bullet-damage) | Multiplies the player's bullet damage by 10 in the Bullet Hell minigame (damage 1 -> 10), applied to both enemies and bosses. |  |
| [Beam of Death (10x Fire Rate)](#beam-of-death-10x-fire-rate) | Multiplies the player's firing speed by 10 in the Bullet Hell minigame (fire interval 0.15 -> 0.015) for a near-continuous beam. |  |
| [Bypass Play Store license check](#bypass-play-store-license-check) | Disables the PairIP Play-license check so a non-Play (e.g. patched/sideloaded) install no longer redirects to the "get it on Google Play" wall on launch. |  |
| [Free Nest Egg (bypass claim cooldown)](#free-nest-egg-bypass-claim-cooldown) | Removes the client-side cooldown timer check on the nest-egg free-bird claim button so the claim request is sent to the server on every tap. The server still controls eligibility; this only stops the client from blocking the request. |  |
| [Redirect Google login to microG](#redirect-google-login-to-microg) | Routes Roost's Google Play Services calls to microG RE so a patched install can sign in with Google. Requires microG RE (app.revanced.android.gms) installed. |  |
| [Skip Play Integrity (fix microG Firebase delay)](#skip-play-integrity-fix-microg-firebase-delay) | Makes Play Integrity attestation fail fast instead of hanging ~60s under microG, removing the delay before Firebase logins, leaderboards, and other backend calls. |  |
| [Triple Bullet Size](#triple-bullet-size) | Triples the on-screen size of the player's bullets in the Bullet Hell minigame (sizePx 6.0 -> 18.0). |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=itsthejoker/itsthejoker-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/itsthejoker/itsthejoker-patches

### 🛠️ Building

To build UserXYZ Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
