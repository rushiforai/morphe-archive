# 👋🧩 Riky Morphe Patches

Patches for apps I like.

## ❓ About

Ad-removal patches for Android apps, published as a Morphe patch bundle. Currently removes ads from **3B Meteo**.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=riky-dev/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/riky-dev/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
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

Riky Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
