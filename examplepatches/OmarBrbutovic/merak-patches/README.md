<p align="center">
  <img src="patches-bundle.png" alt="Merak Patches" width="128">
</p>

<h1 align="center">Merak Patches</h1>

<p align="center">Patches that make Android apps a bit nicer to use, for <a href="https://morphe.software">Morphe</a>.</p>

*Merak* is a Bosnian word for the simple pleasure of enjoying small things, like a slow coffee with friends. These patches aim for the same: small changes that make everyday apps more pleasant.

## ➕ Add to Morphe Manager

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/OmarBrbutovic/merak-patches

<a href="https://morphe.software/add-source?github=OmarBrbutovic/merak-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Then pick an app in Morphe Manager, keep the patches you want, and patch. Supported apps and versions are listed in the [patches list](#-patches-list).

## 🔐 Google Authenticator

Google Authenticator shows all accounts in one long list. These patches let you sort them into your own categories, shown as **folders** or as **cards**:

- **Folders:** a grid of folders. Open one to see only its accounts. Long-press and drag a folder to reorder.
- **Cards:** all accounts on one page, grouped into a card for each category.
- **Categories:** each category has a name, color and optional icon (work, bank, games, mail and more).
- **Google Account sync:** signing in and syncing work through [MicroG-RE](https://github.com/MorpheApp/MicroG-RE).
- **Custom branding:** a different app name and launcher icon, so you can tell the patched app from the original.

The patched app installs next to the original Google Authenticator; it doesn't replace it.

### How to install

1. Install [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) if you want to sign in with a Google Account. The app asks for it on start when it's missing.
2. In Morphe Manager, select **Google Authenticator** and get the original app in the supported version shown below. It is an APKM (split APK) bundle.
3. Leave the patches on, or open a patch to change its options, then patch and install.

> [!IMPORTANT]
> The patched app is a separate app with its own storage. Your accounts don't move over by themselves: sign in to sync them with your Google Account, or use **Transfer accounts** in the original app. Before you uninstall either app, export your accounts or make sure they are synced.

### Patch options

| Patch | Option | Default | Description |
|---|---|---|---|
| Custom branding | App name | Authenticator+ | Name on the home screen and in the app list. Pick a preset or type your own. |
| Custom branding | Icon background | Dark grey | Color behind the Authenticator mark on the launcher icon. |
| Custom branding | Custom icon | None | Square image (PNG, JPG or WEBP, 432 × 432 px or larger) used as the whole launcher icon. Launchers crop it to their icon shape, so keep important content away from the edges. |
| GmsCore support | Package name | `app.merak.android.apps.authenticator2` | Package name of the patched app. Changing it later means a reinstall, which loses the app data. |

Turn off **Custom branding** to keep the original name and icon.

### Using the account organizer

- **Switch layout:** use the **Folders | Cards** switch in the bar above the account list.
- **Organize:** the button in that bar opens a sheet where you can:
  - create categories
  - change their order
  - put each account in a category
- **Folder options:**
  - Press and hold a folder, then release it, to choose accounts, rename it, change its color or icon, or delete it.
  - Press, hold and drag to move it.
- **Back:** closes an open folder.
- **Search:** searches all accounts, in both layouts.

Categories are stored only on your device, inside the patched app. Accounts are matched by a one-way hash, so renaming an account keeps its category. Categories are not synced with your Google Account, and they are not included in **Transfer accounts**.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/OmarBrbutovic/merak-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**3 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Google Authenticator**](PATCHES.md#google-authenticator-comgoogleandroidappsauthenticator2) | 3 | `7.2` | [`com.google.android.apps.authenticator2`](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2) |
<!-- PATCHES_END -->

## 🛠️ Building locally

- Run `./gradlew buildAndroid`. It needs a GitHub token with `read:packages`, see the [Morphe setup guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment).
- The built patches file is `patches/build/libs/patches-*.mpp`.
- Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

### Releasing

- Make changes on the `dev` branch and use [semantic commit](https://www.conventionalcommits.org) messages:
  - `feat:` and `fix:` create a release.
  - `chore:` doesn't.
- Pushing to `dev` creates a pre-release. Users get pre-releases only if they turn them on for this source in Morphe Manager.
- Pushing to `dev` also opens a pull request to `main`. Merge it (don't squash) to create a stable release.
- Releases are made only by [release.yml](.github/workflows/release.yml). Don't create releases by hand, and don't edit the generated files:
  - `patches-list.json`
  - `patches-bundle.json`
  - `PATCHES.md`
  - `CHANGELOG.md`

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## ⚠️ Disclaimer

- **Not affiliated:** this is an independent, unofficial project. It is not affiliated with, endorsed by or sponsored by Google LLC or the Morphe project.
- **Trademarks:** Google, Google Authenticator and Google Play are trademarks of Google LLC. Other app names are trademarks of their owners. They are used here only to say which apps the patches work with.
- **No apps are distributed:** this repository contains only patches, written for this project. It doesn't contain or distribute any app, APK, code or assets of Google or anyone else. You need your own copy of each app, and the patches modify that copy on your device for your own use. Don't share or publish patched apps.
- **Terms of service:** using a modified app, or signing in through MicroG-RE instead of Google Play services, may be against the terms of service of the app or of Google. You are responsible for how you use these patches and for any consequences, including action taken on your accounts.
- **No warranty:** the patches are provided "as is", without warranty of any kind, as described in sections 15 and 16 of the [license](LICENSE). The authors are not liable for any damage or data loss, including losing access to your accounts or two-factor codes. Always keep a backup of your accounts, for example through **Transfer accounts** or Google Account sync, and keep your accounts' backup codes.
- **Privacy:** the patches don't add analytics, tracking or network requests of their own. GmsCore support only sends the app's existing Google connections to MicroG-RE instead of Google Play services. Account secrets are never stored, shown or sent anywhere by the patches. Categories are saved only on your device, and accounts are matched by a one-way hash.

If you are a rights holder and have a concern about this project, please [open an issue](https://github.com/OmarBrbutovic/merak-patches/issues).

## 📜 License

Merak Patches are licensed under the [GNU General Public License v3.0](LICENSE).
