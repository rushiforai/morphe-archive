# 👋🧩 SyncPatch

Patches for Sync for Reddit, built with the [Morphe](https://morphe.software) patcher.

## ❓ About

Quality-of-life patches for the Sync for Reddit app (free, Pro, and Dev variants),
for Android 14 and later. Highlights:

- Per-view-mode title font — all remaining hardcoded title surfaces follow the
  user's title font setting
- Predictive back fixes (exit on single back press, etc.)

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=burakdede0/SyncPatch

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.3](https://github.com/burakdede0/SyncPatch/releases/tag/v1.1.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Sync for Reddit&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| v23.06.30-13:39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Exit on single back press](#exit-on-single-back-press) | Makes the app exit on the first back press. |  |
| [Fix hardcoded title fonts](#fix-hardcoded-title-fonts) | Replaces hardcoded fonts. |  |
| [Predictive back gesture](#predictive-back-gesture) | Enables predictive back gestures. |  |

</details>

<details open>
<summary>📦 Sync Pro&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| v23.06.30-13:39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Exit on single back press](#exit-on-single-back-press) | Makes the app exit on the first back press. |  |
| [Fix hardcoded title fonts](#fix-hardcoded-title-fonts) | Replaces hardcoded fonts. |  |
| [Predictive back gesture](#predictive-back-gesture) | Enables predictive back gestures. |  |

</details>

<details open>
<summary>📦 Sync Dev&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| v23.06.30-13:39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Exit on single back press](#exit-on-single-back-press) | Makes the app exit on the first back press. |  |
| [Fix hardcoded title fonts](#fix-hardcoded-title-fonts) | Replaces hardcoded fonts. |  |
| [Predictive back gesture](#predictive-back-gesture) | Enables predictive back gestures. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Dev usage

- **Make all changes to the `dev` branch.**
- For local development work build your patches using the gradle task `./gradlew buildAndroid`
  to generate the mpp file found in `patches/build/libs/patches-*.mpp`. Apply your patches
  locally using a Morphe Desktop tool like any other patch bundle.
- Always use [Semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
  messages for commits. To keep it simple use only 3 commit message types:
  - `feat: Added a new feature`
  - `fix: Some problem now fixed`
  - `chore: Random change you do not want in the user facing changelog`
- Commits of `fix:` and `feat:` will automatically generate new pre-releases and `chore:` will not create a new release.
- Users can apply your dev branch releases by enabling `pre-release` in Morphe Manager patch sources.
- When your dev branch is ready, and you want a stable release, merge dev branch to main (do not squash, and only merge).
- **Always use semantic release (release.yml)**. Do not manually upload or create releases by hand
  because many files must be updated and release.yml handles everything.

### GitHub Packages authentication

The build resolves the `app.morphe.patches` Gradle plugin and the Morphe patcher from the
Morphe GitHub Packages registry, which requires authentication even for public packages.
Create a personal access token with the scope `read:packages`
[here](https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe)
and add it to `~/.gradle/gradle.properties` (create the file if it does not exist):

```properties
gpr.user=YourGitHubUserName
gpr.key=YourPersonalAccessToken
```

In GitHub Actions, `GITHUB_TOKEN` provides this automatically.

### Extension resources

The `.mpe` extension resources (`patches/src/main/resources/extensions/titlefont.mpe` and
`predictiveback.mpe`) are committed so CI can bundle them into patches releases.
After changing the extension sources, rebuild them locally with `./build_ext.sh`
(requires JDK 17 and the Android SDK, plus the unmodified Sync APK for classpath stubs)
and commit the updated files.

## 🤓 Tips
- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md) for more examples of creating patches and fingerprints.
- Do not manually edit or manually commit any generated files such as `patches-list.json`,
  `patches-bundle.json`, `CHANGELOG.md`. These files will be automatically updated by `release.yml`.
- Do not force push any semantic release commits as that will break all future releases.
  If you need to fix a broken release, it's always easiest to create a new release instead of
  fixing an existing release.

## 📜 License

SyncPatch is licensed under the [GNU General Public License v3.0](LICENSE)
