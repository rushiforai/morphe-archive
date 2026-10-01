# 🔮 anxy Morphe Patches

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/anxyis/anxy-patches/release.yml)
![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)
![Release](https://img.shields.io/github/v/release/anxyis/anxy-patches)

<br/>

> [!TIP]
> **One-Tap Morphe Import**: If you have **Morphe Manager** installed on your Android device, tap [**Add to Morphe Manager**](https://morphe.software/add-source?github=anxyis/anxy-patches) to automatically add this repository as a remote source!

<br/>

| App | Package | Patches |
|---|---|---|
| **Alight Motion** 🎯 | `com.alightcreative.motion` | <ul><li>Premium Unlock (Complete Suite — 5.0.270)</li><li>PairIP License Bypass + Force-Update Suppression</li><li>Membership & Settings Gates Unlock</li><li>Device Capability Unlock (Max Res/Layers)</li><li>Encoder / Effect / Import Features Unlock</li><li>Effects Content Bundle (353 effects + thumbnails)</li><li>Dev Settings Extras + Home Declutter</li></ul> |

<br/>

🎯 _This app has strict target version requirements defined in the patch (e.g. `5.0.273.1028426`, `5.0.273`, `5.0.270.1002578`)._\
💻 _These patches include native AArch64 code modifications targeting `arm64-v8a` CPUs._

<br/>

---

## Frequently Asked Questions 🙋

#### How do I use this with Morphe Manager?
1. Open [**this link**](https://morphe.software/add-source?github=anxyis/anxy-patches) directly on your Android phone, or manually add `anxyis/anxy-patches` under **Morphe Manager** &rarr; **Settings** &rarr; **Sources**.
2. Select your target application APK (e.g. Alight Motion `5.0.270`).
3. Select the desired patches and tap **Patch**!

> [!NOTE]
> **Where to get the original 5.0.270 APK:** open [APKMirror's Alight Motion uploads](https://www.apkmirror.com/uploads?appcategory=alight-motion-video-and-animation-editor) and download **version `5.0.270.1002578`** (not the newest one).

#### What does the Alight Motion suite do?
It unlocks the full premium function set on `5.0.270.1002578`:
- **Premium state + membership gates** — all Pro-gated UI and features.
- **PairIP license bypass** — no license checks, no paywalls, no forced update.
- **Device capability unlock** — max export resolution and layer counts.
- **Encoder / effect / import features** — previously gated codecs and tools.
- **Effects content bundle** — 353 effect XMLs + thumbnails + banner.
- **Dev Settings extras + home declutter** — extra toggles, no tutorial button.

#### Will more apps be added?
Yes! The repository is structured to modularly support additional applications over time.

---

## Development & Local Builds

```bash
# Build the patch bundle (.mpp)
./gradlew :patches:build

# Run automated JUnit 5 regression tests
./gradlew test

# Generate patch metadata list
./gradlew generatePatchesList
```

---

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See [LICENSE](LICENSE) for details.

---

## Credits

**Alight Motion extra effects** — effect XMLs and thumbnails bundled with these patches are credited to **Toji Motion** and **Tanryu**. All unlock behavior is original work; only the bonus effect content carries their credit.
