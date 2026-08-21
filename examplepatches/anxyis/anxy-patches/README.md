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
| **After Motion Z+** 🎯 💻 | `com.alightcreative.motion` | <ul><li>AMZ Popup Suppression (Complete Suite)</li><li>Native Server 1 Startup Gate Bypass</li><li>New Project Wizard Suppression</li><li>Modded By Satriyaid Dialog Suppression</li><li>Updates Required Popup Suppression</li><li>Seed Default Preferences</li></ul> |
| **Alight Motion Pro** 🎯 | `com.alightcreative.motion` | <ul><li>Updates Required Popup Suppression</li><li>Seed Default Preferences</li></ul> |

<br/>

🎯 _This app has strict target version requirements defined in the patch (e.g. `5.0.273.1028426`, `5.0.273`)._\
💻 _These patches include native AArch64 code modifications targeting `arm64-v8a` CPUs._

<br/>

---

## Frequently Asked Questions 🙋

#### How do I use this with Morphe Manager?
1. Open [**this link**](https://morphe.software/add-source?github=anxyis/anxy-patches) directly on your Android phone, or manually add `anxyis/anxy-patches` under **Morphe Manager** &rarr; **Settings** &rarr; **Sources**.
2. Select your target application APK (e.g. After Motion Z+ `5.0.273`).
3. Select the desired patches and tap **Patch**!

#### What does the AMZ Popup Suppression suite do?
It completely eliminates:
- The startup **"SERVER 1 / Follow all my social media"** dialog.
- The **"Updates Required"** mandatory Firebase prompt.
- The intrusive multi-step **Project Wizard** dialog upon creating projects.
- The **"Modded by Satriyaid"** alert dialogs.
- The **"VISIT LINK AND DONT SHOW AGAIN"** banner in the Effect Browser.

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
