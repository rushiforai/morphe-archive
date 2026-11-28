# 🧩 WhatsApp Clean Experience Patches

Enhanced WhatsApp experience through Morphe patches.

> **Independent community project.** Not affiliated with WhatsApp, Meta, or Morphe.

## ❓ About

WhatsApp Clean Experience provides patches for WhatsApp that:

- **Promotional UI Cleanup** — Reduces supported promotional and advertising-related interface elements.
- **Meta AI UI Cleanup** — Hides supported Meta AI-related interface entry points.
- **Download Status** — Saves eligible, non-View-Once WhatsApp Status images and videos to local storage.
- **Keep Messages & Media** — User-controlled local archiving for currently available conversation messages and received media, with local search and storage management.
- **Patch Settings** — Adds a native "Pengaturan Patch" menu into WhatsApp Settings.

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager:

<a href="https://morphe.software/add-source?github=mridwanfirdaus2603/whatsapp">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches

<!-- PATCHES_START -->
> **[v1.0.0](https://github.com/mridwanfirdaus2603/whatsapp/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**5 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**WhatsApp**](PATCHES.md#whatsapp-comwhatsapp) | 5 | `2.26.46.76` | [`com.whatsapp`](https://play.google.com/store/apps/details?id=com.whatsapp) |
<!-- PATCHES_END -->

## 📱 Supported WhatsApp Versions

| Version | Status |
|---|---|
| **2.26.46.76** | ✅ Target version (APKM) |
| Other versions | ⚠️ Experimental — may work but untested |

## 📦 Installation

1. Install [Morphe Manager](https://morphe.software).
2. Add this patch source to Morphe Manager (use the button above or add manually).
3. Download WhatsApp **2.26.46.76** APKM from APKMirror.
4. Select patches to apply in Morphe Manager.
5. Patch and install.

## ⚙️ Configuration

Each patch can be enabled or disabled in **Morphe Manager** before patching.
When **Patch Settings** is applied, you can also toggle supported features at runtime inside WhatsApp (**Pengaturan > Pengaturan Patch**):

- **Sembunyikan Elemen Promosi** — Persisted via `SharedPreferences` (controls promotional AB-Props & WAMO ad verification; restart WhatsApp to apply all changes).
- **Sembunyikan Meta AI** — Persisted via `SharedPreferences` (controls Meta AI AB-Props & HomeActivity UI cleanup; restart WhatsApp to apply all changes).
- **Download Status** — Persisted via `SharedPreferences` (controls the Status viewer download button for eligible Status media).
- **View Once Privacy** — Informational notice only (no unlock switch); View Once protections remain intact.
- **Keep Messages & Media** — Persisted via `SharedPreferences` (controls local conversation & received media archiving and opens **Kelola Arsip Lokal**).

## 🔧 Patch Settings Menu

When the Patch Settings patch is applied, a new "**Pengaturan Patch**" entry appears
in WhatsApp's Settings screen between **Bahasa Aplikasi** and **Bantuan dan masukan**. This menu shows:

- **Pembersihan Iklan** — Runtime switch for promotional UI cleanup.
- **Meta AI** — Runtime switch for Meta AI UI cleanup.
- **Download Status** — Runtime switch for saving eligible Status media.
- **View Once** — Privacy information explaining that View Once media cannot be saved or unlocked.
- **Message and Media Archive** — Runtime switch and **Kelola Arsip Lokal** manager (view, search, sync received media, clear archive, check storage usage).
- **Informasi Patch** — Patch version, WhatsApp version, compatibility status, and supported features.

## ⚠️ Known Limitations

- **Restart required for AB-Props.** Some WhatsApp feature flags are cached at startup; toggling switches in **Pengaturan Patch** saves immediately, and restarting WhatsApp applies all flag changes.
- **View Once media is NOT unlocked or saved.** WhatsApp does not expose a legitimate, consent-based save mechanism for View Once media. View Once privacy controls and ephemeral restrictions remain 100% intact, and no bypass patch is included in the bundle.
- **No anti-delete / deleted-message recovery.** **Keep Messages & Media** only archives messages and received media while they are legitimately available to the user. It does not retrieve messages deleted by the sender or bypass disappearing-message restrictions.
- **Fingerprint-based detection.** Patches rely on fingerprinting WhatsApp's AB-Prop resolvers (`Unknown BooleanField`, `Unknown IntField`), `is_wfal_paused`, `HomeActivity`, `StatusPlaybackActivity`, `StatusPlaybackContactFragment`, `Conversation`, and `Settings` / `SettingsTabActivity`. Untested WhatsApp versions may differ.
- **No complete ad removal guarantee.** Only identifiable promotional elements are targeted.
- **UI hiding only for Meta AI.** Backend services and infrastructure are not modified.
- **Status & Archive runtime behavior** must be verified on device with the compiled `.mpp` bundle.

## 🛠️ Building

### Remote (Recommended)

Push changes to the `dev` branch. GitHub Actions will automatically build and generate the `.mpp` artifact.

### Locally

```bash
./gradlew buildAndroid
```

The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`.

## 🔒 Disclaimer

- This is an **independent community project**.
- Not affiliated with WhatsApp, Meta, Morphe, or any other entity.
- Does not claim to remove all advertisements or disable Meta AI services.
- Use at your own risk.
- Modifying WhatsApp may violate its Terms of Service.

## 📜 License

WhatsApp Clean Experience Patches are licensed under the [GNU General Public License v3.0](LICENSE).
