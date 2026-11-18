# ghostknow LIHKG patches for Morphe

Unofficial patch bundle for the **LIHKG** Android app, built on the
[Morphe](https://morphe.software) patcher. Not affiliated with Morphe or with LIHKG.

## ❓ About

One patch: make the app treat the signed-in account as an **LIHKG+ member** everywhere
the client checks.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager:
`https://github.com/ghostknow/morphe-lihkg-patches`

<a href="https://morphe.software/add-source?github=ghostknow/morphe-lihkg-patches&name=LIHKG%20patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ghostknow/morphe-lihkg-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 LIHKG&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.lihkg.app`

**🎯 Supported versions:**

| 19.1.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Always plus member](#always-plus-member) | Reports the signed-in account as an LIHKG+ member everywhere the app checks. |  |

</details>

<!-- PATCHES_END -->

## 📝 Notes on this patch

- Target: `com.lihkg.app`, tested against **19.1.4** (versionCode 8000140, minSdk 24).
  Newer versions are accepted experimentally because the fingerprints match by shape and
  by un-obfuscated model field names, but they are not verified.
- LIHKG ships as a split APK archive, so download the **`.apks`** build from APKMirror and
  feed that to Morphe Manager.
- The app stores the entitlement as one SharedPreferences boolean, key `is_plus_user`,
  written from `Me.is_plus_user` at login and on every `/api_v2/system/property` refresh,
  and read back through a single helper. The patch forces that reader and the model getter
  to `true`, which flips: fullscreen and in-feed ad placement, the `X-LI-PLUS` request
  header, `post_plus.html` in the thread webview, the LIHKG+ row on the account screen,
  and the `isPlus` value passed to the WebView JS bridge.
- **Sign in first.** The `X-LI-PLUS` header is only added when a user token exists, so as a
  guest the server still returns ad configs (`Thread.acf`) and you will keep seeing ads.
- Anything the server enforces per account is not unlocked by a client patch.
- Patching re-signs the app with Manager's key, so the Play Store copy must be uninstalled
  once, which clears local drafts, app settings and the stored login token.

## 🚀 Getting development started

1. Set up a GitHub PAT with the `read:packages` scope as described
   [here](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)
   (Gradle resolves `app.morphe:morphe-patcher` from GitHub Packages, which needs auth even for public packages).
2. Enable "Allow GitHub Actions to create and approve pull requests" in
   Settings > Actions > General > Workflow permissions.
3. (Optional) Sign releases so Morphe Manager rejects a bundle that was swapped after publishing:
   `./gradlew generateSigningKey`, commit `morphe-signing.pub`, and put `morphe-signing.key`
   in the `MORPHE_SIGNING_KEY` Actions secret. Never commit the private key.

## 🧑‍💻 Dev usage

- **Make all changes to the `dev` branch.**
- Build locally with `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp`,
  then apply it with Morphe Desktop against your own original LIHKG `.apks`.
- Use semantic commits: `feat:` and `fix:` publish pre-releases from `dev`,
  `chore:` publishes nothing.
- Merge `dev` into `main` (no squash, merge only) for a stable release.
- Always release through `release.yml`. Do not hand-create releases, and do not hand-edit
  `patches-list.json`, `patches-bundle.json` or `CHANGELOG.md`.
- Never force-push a semantic release commit.

## 🛠️ Files

```
patches/src/main/kotlin/app/ghostknow/patches/
  shared/Constants.kt              Compatibility + app targets for com.lihkg.app
  lihkg/PlusMembershipPatch.kt     the patch
  lihkg/Fingerprints.kt            the three fingerprints it matches
```

## 📄 License

GPLv3, with the additional conditions in [NOTICE](NOTICE). This bundle is derived from and
built on the [Morphe](https://github.com/MorpheApp) project; it is not authored by Morphe.
