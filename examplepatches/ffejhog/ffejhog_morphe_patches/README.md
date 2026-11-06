# 👋🧩 ffejhog Morphe Patches

Personal [Morphe](https://morphe.software) patches.

## ❓ About

Patches for apps I like.

### How to use these patches

Add this repo url to Morphe Manager: https://github.com/ffejhog/ffejhog_morphe_patches

<a href="https://morphe.software/add-source?github=ffejhog/ffejhog_morphe_patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 📱 Bluesky

### Bypass age verification gate

Bluesky is a React Native app, so its UI is compiled to a Hermes bytecode bundle
(`assets/index.android.bundle`) rather than Dalvik bytecode. In regions that require age
assurance and for users who have not completed it, the app shell renders a full-screen
"share your age range" page instead of the app:

```
if      (session.status === 'deactivated')  -> DeactivatedScreen
else if (state.error === 'account-data')    -> DataUnavailableScreen
else if (state.access === Access.None)      -> NoAccessScreen     <- the age gate
else                                        -> RoutesContainer    <- the app
```

The patch swaps the conditional jump of that third branch for a non-branching comparison, so
the gate branch becomes unreachable and the shell always renders the app. The instruction is
the same length, so all other offsets stay valid, and the bundle's trailing SHA-1 footer is
recomputed so the Hermes runtime still accepts the file.

Age assurance state itself is untouched, so region-based content restrictions for unverified
users still apply. Only the blocking screen is removed.

The patch is a `RawResourcePatch` that matches a 12-byte window of the shell, anchored on the
two preceding instructions so the pattern is unique in the ~33 MB bundle. If a future app
version compiles the shell differently the patch fails with a clear error instead of producing a
broken APK; other versions are therefore marked experimental.

> **Note:** Do not patch Bluesky from Morphe Manager's "saved / cached APK" source. That path
> drops the app's config splits, so the patched build is base-only and the age gate comes back.
> Always patch from the installed app or a fresh APK download. This is a Manager limitation,
> not a patch bug.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/ffejhog/ffejhog_morphe_patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Bluesky&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `xyz.blueskyweb.app`

**🎯 Supported versions:**

| 1.137.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass age verification gate](#bypass-age-verification-gate) | Removes the full-screen age verification wall that blocks the app in regions requiring age assurance. Content restrictions for unverified users are unchanged. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

ffejhog Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
