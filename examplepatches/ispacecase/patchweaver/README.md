<p align="center">
<img src="readme.png" alt="Patchweaver">
</p>

# 👋🧩 Patchweaver

Personal collection of [Morphe](https://morphe.software) patches. F-Droid is the first one in
here — more may get added over time as I patch other apps I use.

## ❓ About

Patches for apps I like.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ispacecase/patchweaver

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ispacecase/patchweaver/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 F-Droid&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.23.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Selectable install backend](#selectable-install-backend) | Adds a setting to choose how F-Droid installs APKs: system default, Shizuku, InstallerX, or a custom installer package. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

This repo resolves `app.morphe.patches` (the Gradle plugin) and `app.morphe:morphe-patcher` from
GitHub Packages, which requires an authenticated GitHub token even for public packages:

```bash
export GITHUB_TOKEN="$(gh auth token)"
export GITHUB_ACTOR="$(gh api user --jq .login)"
```

(a token needs the `read:packages` scope — `gh auth refresh -s read:packages` adds it). A
`flake.nix`/`.envrc` are included for `nix develop`/`direnv` users, which export these
automatically.

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Patch the `.mpp` file using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like
  any other patch bundle, or with `apply-tool` in this repo if you don't have that set up:

```bash
./gradlew :apply-tool:installDist

# Generate a signing key once, if you don't have one:
keytool -genkeypair -keystore debug.keystore -alias patchweaver \
  -keyalg RSA -keysize 2048 -validity 10000 -storepass patchweaver -keypass patchweaver \
  -dname "CN=patchweaver"

./apply-tool/build/install/apply-tool/bin/apply-tool \
  path/to/input.apk patches/build/libs/patches-*.mpp output.apk \
  debug.keystore patchweaver patchweaver patchweaver
```

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more
information.

## 🧑‍💻 Dev usage

- **Make all changes to the `dev` branch.**
- Always use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
  messages: `feat:` a new feature, `fix:` a fixed problem, `chore:` anything not user-facing.
- Commits of `fix:` and `feat:` automatically generate a new pre-release; `chore:` does not.
- Others can apply `dev` branch releases by enabling `pre-release` in Morphe Manager patch
  sources.
- When `dev` is ready for a stable release, merge it into `main` (no squash, merge only).
- **Always use semantic release (`release.yml`)** — don't manually upload or create releases;
  it updates `patches-list.json`, `patches-bundle.json`, and `CHANGELOG.md` for you.

## 🤓 Tips

- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md)
  for more on writing patches and fingerprints.
- Don't hand-edit `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md` — `release.yml`
  regenerates them.
- Don't force-push over a semantic-release commit; it breaks future releases. If a release needs
  fixing, cut a new one instead.

## 📜 License

Patchweaver is licensed under the [GNU General Public License v3.0](LICENSE), with additional
conditions under GPLv3 Section 7 — see [NOTICE](NOTICE).
