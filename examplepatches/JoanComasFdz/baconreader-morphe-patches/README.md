<div align="center">

# 🥓 BaconReader Patches

**BaconReader, alive again.** Patches for [Morphe](https://morphe.software) that make BaconReader work with today's Reddit.

[![Morphe](https://img.shields.io/badge/Morphe-patches-ff4500?style=flat-square)](https://morphe.software)
[![BaconReader](https://img.shields.io/badge/BaconReader-6.1.4-f57c00?style=flat-square)](#-install)
[![User guide](https://img.shields.io/badge/user_guide-📖-2ea44f?style=flat-square)](https://joancomasfdz.github.io/baconreader-morphe-patches/)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue?style=flat-square)](LICENSE)

[**➕ Add to Morphe Manager**](https://morphe.software/add-source?github=JoanComasFdz/baconreader-morphe-patches)

</div>

## ⚡ Install

1. Install [Morphe Manager](https://morphe.software).
2. Add this repository as a patch source, one of two ways:
   - On your phone, open [**Add to Morphe Manager**](https://morphe.software/add-source?github=JoanComasFdz/baconreader-morphe-patches) and tap **Open in Morphe**.
   - Or, in Morphe Manager, tap **Sources** in the bottom bar, then **+**, paste this address in **Source URL** and tap **Add**:
     ```text
     https://github.com/JoanComasFdz/baconreader-morphe-patches
     ```
   Add the repository's address, not a `.mpp` file from its releases (**Select patch source files**), nor another link.
3. On Morphe Manager's home screen, tap **BaconReader Premium** or **BaconReader**, the one your APK is, and patch your **BaconReader 6.1.4** APK.
4. Uninstall the original BaconReader, then install the patched one.

Settings live in BaconReader → **Settings → Patches**.

> [!WARNING]
> Use an APK you trust. Repackaged "Premium" APKs often carry malware.

### Update

On Morphe Manager's home screen, tap **BaconReader Premium** (or **BaconReader**), then **Patch**, then
**Install → Update**. Morphe Manager patches its own copy of the APK you picked the first time and signs the result with
the same key, so Android updates the app and keeps your login and settings: you don't need to keep the APK.

Don't patch the installed BaconReader: it's patched already, and the patches look for the original code, so they fail.

### Troubleshooting

- **Morphe Manager asks for the non-premium BaconReader APK:** the repository was added wrongly. In **Sources**,
  remove it, then add it again as step 2 says, with the link or the address
  `https://github.com/JoanComasFdz/baconreader-morphe-patches` in **Source URL**. Both **BaconReader** and
  **BaconReader Premium** then show on the home screen.
- **"Invalid source URL":** the address must be the repository's, as above.

## 🧩 What's inside

Fixes for what broke since 2023, features BaconReader never had, and cleanups of what no longer works.

<div align="center">

[**📖 Explore the user guide**](https://joancomasfdz.github.io/baconreader-morphe-patches/)

</div>

## 🛠️ Development

What each patch does: [docs/patches.md](docs/patches.md), grouped as the user guide shows it; its settings and differences from ReVanced: [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md). Build and release: [patcher-specific-build.md](patcher-specific-build.md), [patcher-specific-release.md](patcher-specific-release.md). Code style and checks: [STYLE.md](STYLE.md), [patcher-specific-code.md](patcher-specific-code.md) and [AGENTS.md](AGENTS.md).

End-to-end tests: [tests/BaconReader.E2E](tests/BaconReader.E2E/README.md), each a PR shows as GIFs. A VS Code extension plays their recordings next to their code; the repository's dev container (a Codespace) installs it: [tools/vscode-extension](tools/vscode-extension/README.md).

## 📜 License

[GPL-3.0](LICENSE). The patches are ported from [ReVanced Patches](https://gitlab.com/ReVanced/revanced-patches). Not affiliated with Reddit, BaconReader or Morphe.

## 🤖 AI disclosure

I developed these patches with AI assistance (Claude Code). The AI wrote most of the code following my requirements, and I review the results and test the patches on my device. With it I also developed end-to-end tests that run the patches on a real phone: the user guide shows each test's steps, its Gherkin, beside the video of its run. The commits say so too.
