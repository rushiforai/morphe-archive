# 👋🧩 Riky's Morphe Patches

## ❓ About

Ad-removal and premium-unlock patches for Android apps, published as a Morphe patch bundle.

This project is a fork of the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template) by the Morphe contributors, extended with additional patches and development tooling.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=riky-dev/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.3](https://github.com/riky-dev/morphe-patches/releases/tag/v1.3.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Electron: battery health info&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.0.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Spoofs premium/unlocked state to disable ad-gated behavior. |  |

</details>

<details open>
<summary>📦 3BMeteo&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.9.15 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Removes banner, native, cover and interstitial ads and unlocks premium features. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

```bash
make build
# or: ./gradlew :patches:buildAndroid
```

The built `.mpp` is at `patches/build/libs/patches-*.mpp`. Apply it with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager.

### 🧑‍💻 Developing patches

See **[AGENTS.md](AGENTS.md)** for the full agent-oriented guide. Independent tools live in `scripts/` and `Makefile`:

```bash
make check                    # environment preflight
make fetch APP=meteo3b        # download app bundle
make extract APP=meteo3b        # unzip to analysis/meteo3b/extract/
make decompile APP=meteo3b      # jadx + apktool output
make analyze APP=meteo3b        # optional analysis hints (not a patch plan)
make build && make verify APP=meteo3b
```

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Riky's Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE).

This project is based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Copyright (C) 2025 Morphe contributors. Modifications copyright (C) 2026 [riky-dev](https://github.com/riky-dev).

See [NOTICE](NOTICE) for Morphe branding restrictions and additional terms.
