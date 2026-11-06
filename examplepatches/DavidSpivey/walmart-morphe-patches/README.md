# Walmart Morphe patches (Ron)

Personal Morphe patch bundle for the Walmart Android app (`com.walmart.android`).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/DavidSpivey/walmart-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Walmart&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.walmart.android`

**🎯 Supported versions:**

| 26.42 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable automatic store mode](#disable-automatic-store-mode) | Stops the store mode sheet from popping up on its own when you open the app in a store. Location, store-specific pricing, the in-store search filter and the store mode banner/button still work. |  |

</details>

<!-- PATCHES_END -->

### Disable automatic store mode
Stops the store mode sheet from popping up by itself when you open the app inside a Walmart.

Still works after patching:
- Location services, so the app knows which store you're in (store pricing, aisle locations).
- The "In-store" filter in search.
- The store mode banner/button. Tap it any time to open store mode yourself.

Checked against Walmart **26.42**. The fingerprints don't depend on obfuscated class names, so newer versions should keep working. If an update ever breaks it, Morphe will say the patch failed to apply. It won't break the app.

### How it works
In 26.42, `InternalStoreModeApiImpl` (obfuscated as `com.walmart.glass.storemode.api.v`) has a handler, `h(StoreStatus)`. The store mode banner calls it whenever your in-store status changes. When you walk into a store, it queues `StoreModeBottomSheetFragment` (or the sign-in sheet) as an automatic in-app popup. The patch makes that handler return immediately.

Tapping the banner opens the sheet through a separate path (`StoreModeBottomSheetFragment().showNow(...)`), and so does the store mode deep link (`StoreModeLinkRouteHandler` → `e(...)`), so manual store mode is unaffected.

## Using it with Morphe Manager

1. On GitHub, create a new **public** repository named `walmart-morphe-patches`. You can start empty or from https://github.com/MorpheApp/morphe-patches-template ("Use this template", with "Include all branches" ticked).
2. Upload the contents of this folder, replacing the template's files. Delete the template's `extensions/` folder and `patches/src/main/kotlin/app/template/` if they're present.
3. In `patches/build.gradle.kts`, change `DavidSpivey` to your GitHub username.
4. Repo Settings → Actions → General → Workflow permissions: choose "Read and write permissions" and tick "Allow GitHub Actions to create and approve pull requests".
5. Commit to the `main` branch with a message that starts with `feat:`, for example `feat: disable automatic store mode`. The Release workflow builds `patches-x.y.z.mpp` and publishes a release.
6. In Morphe Manager, add a patch source using your repo URL (`https://github.com/DavidSpivey/walmart-morphe-patches`). Then pick Walmart, choose your XAPK/APKM, keep **Disable automatic store mode** checked, and patch.

To build locally instead, use `./gradlew :patches:buildAndroid` (needs a GitHub token, see the Morphe docs). The output is `patches/build/libs/patches-*.mpp`.
