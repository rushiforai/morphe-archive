# ArchiveTune microG Patches

[Morphe](https://github.com/MorpheApp) patches for [ArchiveTune](https://github.com/rukamori/ArchiveTune) that add
sign-in through [microG](https://github.com/ReVanced/GmsCore) and make brand accounts selectable.

> Unofficial. Not affiliated with or endorsed by ArchiveTune, Morphe, ReVanced, microG or Google.
> These patches do not bypass authentication: you still sign in to your own Google account, only the
> way you do it changes.

#Warning:
This project is completly made by Ai which inclues everythign aside from some template files. If you dont agree with this then dont use these patches.
I am not responsible if these patches break the app. With the limited testing I have done they seem fine. Im alos lazy plus i use the free plan for claude so maintenance if at all will be blotchy

This is also my first time using GitHub so i have no idea what im doing.

## ❓ About

ArchiveTune signs in with a copied web cookie, which expires and offers no obvious way to use a brand account.
These patches let you pick a Google account from microG instead of typing a password, and make brand accounts
show up in ArchiveTune's account switcher.

**Sign in with microG**: on the Login screen, microG's account picker replaces Google's password page. microG
provides a one-time sign-in link for the chosen account (the mechanism Google's own apps use to open a signed-in
web page), the login page loads it, and ArchiveTune's normal login completes. If microG is missing, refuses, or
you cancel, the original Google page loads so login is never blocked.

**Show all brand accounts**: ArchiveTune hides every account YouTube reports as having no YouTube channel, which
includes most music-only brand accounts. This stops that filtering so they appear under
Settings > Account > the dropdown arrow next to the Account button > "YouTube channels".

### Requirements

- ArchiveTune **15.1.0**, official release APK (do not change the package name or version code: the app's
  built-in gatekeeper sends both to its server before allowing network access).
- microG-RE (package `app.revanced.android.gms`) with your Google account added.
- Morphe Manager (built against Patcher 2.3.0).

### Limitations

- The session is still a web cookie, so it can expire. Re-login is one tap in microG instead of a password.
- Tested on the FOSS universal APK. The GMS flavor was checked by inspecting its code but not run.
- Newer ArchiveTune versions are not listed as compatible yet. If a patch fails with
  "Failed to match the fingerprint", the app changed that code.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/timtkdb/archivetune-microg-patches

<a href="https://morphe.software/add-source?github=timtkdb/archivetune-microg-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/timtkdb/archivetune-microg-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 ArchiveTune&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `moe.rukamori.archivetune`

**🎯 Supported versions:**

| 15.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Show all brand accounts](#show-all-brand-accounts) | ArchiveTune's account switcher hides every account that YouTube reports as having no YouTube channel. Music-only brand accounts usually have none, so they never show up under "YouTube channels" in the account menu. This makes them show up. |  |
| [Sign in with microG](#sign-in-with-microg) | Sign in with an account from microG (GmsCore) instead of typing a Google password. microG signs the login page in as the chosen account, then ArchiveTune's normal login flow runs, including YouTube Music's own main/brand account switcher. |  |

</details>

<!-- PATCHES_END -->

### 🔧 How it works

| Piece | Detail |
|---|---|
| Manifest | Adds microG-RE's `SPOOFED_PACKAGE_NAME/SIGNATURE` metadata so it presents the app to Google as YouTube Music, `<queries>` for microG, and the account picker activity. |
| Login hook | Redirects the login screen's `WebView.loadUrl(<Google sign-in URL>)` call to the extension. |
| Extension | Shows microG's picker, asks microG for a `weblogin:` token (microG returns a sign-in URL), loads it in the WebView, falls back to the original page on failure. The URL is a one-time credential and is never logged. |
| Brand accounts | Makes `YouTube.booleanValue(JsonObject, String)` return no value for the key `hasChannel`, so the app's existing `?: true` default applies. |

Fingerprints match by names and string literals only. ArchiveTune's release builds are optimized by R8 (lambdas merged
into switch classes, methods moved into unrelated classes, most of OkHttp stripped), so nothing depends on lambda
class names or on OkHttp.

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

timtkdb's ArchiveTune microG Patches are licensed under the [GNU General Public License v3.0](LICENSE)
