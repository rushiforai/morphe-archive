## [nvbangg/builder-for-morphe](https://github.com/nvbangg/builder-for-morphe)

<div align="center">

[![Typing SVG](https://readme-typing-svg.demolab.com/?font=Google+Sans&size=25&duration=3000&pause=2000&color=&center=true&vCenter=true&random=false&width=550&lines=%F0%9F%93%A6+Build+APKs+from+various+patch+sources)](#-build-your-own-apks)<br>
This repository uses GitHub Actions to automatically build your own patched APKs on every new update.
</div>

<details>
<summary><b>🔥 Features</b></summary>

- 🛑 **Ad-blocking**: blocks all types of ads (who needs them anyway?).
- 🚀 **Enhanced features**: squeezes more out of the app.
- ⭐ **Customization**: personalize the app to fit your needs.
- 💉 **Optimization**: optimized APKs for performance and size.
- 🔒 **Persistent**: patched app won't be updated or overwritten by Play Store.
- 🔄 **Auto-updates**: supports automatic updates through [Obtainium](https://github.com/ImranR98/Obtainium) using releases from your own fork.
- ✨ **And much more!**
</details>

## 📋 List of apps in this repository

- This repository does not provide pre-patched APKs; it is only a tool to build your own APKs. 
- Releases contain unmodified APKs used for building, not pre-patched ones.

## 🤖 Build Your Own APKs

- 🍴 `Fork` [this repo](https://github.com/nvbangg/builder-for-morphe) (don't forget to ⭐ `Star` and 👀 `Watch` it)
- ⚙️ **[Optional]** Customize the apps you want in [`config.toml`](config.toml)
- 🚀 Run the [CI workflow](../../actions/workflows/ci.yml) (make sure workflows are enabled first)
- ⬇️ Download your APKs from [Releases](../../releases)

## 📚 Documentation & Contributing

For full configuration reference, setup and contributing guide, see [CONTRIBUTING.md](CONTRIBUTING.md).

For all Morphe resources, projects, supported apps and patches, visit [nvbangg/awesome-for-morphe](https://github.com/nvbangg/awesome-for-morphe).

<details>
<summary><h3>⚠️ Disclaimer</h3></summary>

- This project is **not affiliated with any patch creators mentioned here**, and is intended for educational & personal use only.
- All builds are done using **publicly available tools**. This repository simply automates the process for convenience.
- Everything happens through the **public GitHub Actions** to ensure security and transparency. For maximum security, you can always build the applications yourself using the provided source code or official methods.
- The build code is a **complete Python rewrite** based on an adaptation that was first implemented by *[j-hc](https://github.com/j-hc)*. All credits go to him for laying down the initial foundation.
- If a build fails due to upstream app or patch changes, please report it to the patch creators or wait for an update.
</details>

---

<p align="center">⭐ Star <a href="https://github.com/nvbangg/builder-for-morphe">this repo</a> if useful</p>

<details>
<summary align="center"><i>Maintained with ❤️ by <a href="https://github.com/nvbangg">nvbangg</a> and <a href="https://github.com/krvstek">krvstek</a></i></summary>

### 🤝 Acknowledgments

This repo is based on the [krvstek/uni-apks](https://github.com/krvstek/uni-apks) (GPL-3.0). See [all changes](https://github.com/nvbangg/builder-for-morphe/commits/main/?author=nvbangg):

- Easily [build your own APKs](#-build-your-own-apks) just by customizing `config.toml` (no extra setup required)
  - No manual brand configuration needed in `ci.yml`
  - [Automatic upstream sync](CONTRIBUTING.md#-sync-upstream) (preserves your custom `config.toml`)
  - Pre-configured support for many apps (just set `enabled = true` for the apps you want)
- Other changes contributed upstream: [Pull Requests](https://github.com/krvstek/uni-apks/commits/main/?author=nvbangg), [co-authored commits](https://github.com/search?q=repo%3Akrvstek%2Funi-apks+Co-authored-by%3A+nvbangg&type=commits)
</details>
