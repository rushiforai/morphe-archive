# 🧩 W3Schools Patches

Morphe patches for **W3Schools** (`com.w3schools.app.prod`).

## ➕ Add to Morphe

**One tap** (open on the phone that runs Morphe Manager):
[**Add to Morphe**](https://morphe.software/add-source?github=RyuuseiAkira/w3s-patches)

**Manually:** Morphe Manager → patch sources **+** → **Remote** → paste
`https://github.com/RyuuseiAkira/w3s-patches`

Uninstall the Play Store version of W3Schools first. The patched build is signed with a different key.
For Google Sign-In, install [**MicroG-RE**](https://github.com/MorpheApp/MicroG-RE/releases)
(`app.revanced.android.gms`) and add your Google account there before signing in.

> GPLv3 · Not affiliated with W3Schools. Targets the W3Schools versions in the patch list below.
> *MicroG-RE support* is **off by default** — enable it if you want to sign in with Google.
> All patches include an internal Pairip license check bypass so sideloaded builds start cleanly.
> Server-enforced features (Code Duel daily cap, Full Access, certification exams, avatar asset claims,
> and backend League XP boost) stay controlled by W3Schools' servers.

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.2.1](https://github.com/RyuuseiAkira/w3s-patches/releases/tag/v1.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 W3Schools&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description |
|----------|----------------|
| **Bypass forced updates** | Prevents remote minimumClientBuild version lockouts and disables Play in-app review prompts on sideloaded builds. |
| **Disable tracking and analytics** | Disables Meta AppEvents, AdServices attribution, AAID/InstallReferrer harvesting, and RevenueCat diagnostic telemetry while preserving login and billing. |
| **Enable developer tools** | Unlocks the hidden Billing Debug and Developer Console screens in Settings without switching away from production APIs. |
| **Hide upgrade prompts** | Hides the Explore plans upsell card on the Streak screen and the Go unlimited link in Code Duel. |
| **MicroG-RE support** | Redirects Google Play Services and Credential Manager to MicroG-RE (app.revanced.android.gms) with package and signature spoofing so Google Sign-In works on re-signed builds. |
| **Unlimited energy** | Bypasses client-side energy consumption, reports full charges, and shows the unlimited energy UI. |
| **Unlock curriculum map** | Unlocks sequential lessons, checkpoints, and milestones on the curriculum map and removes overview unlock upsell banners. |

</details>
<!-- PATCHES_END -->

## 📚 Documentation

Technical notes, bytecode hooks, regex targets, and client/server scope live in [`docs/`](docs/README.md):

- [Unlimited energy](docs/unlimited-energy.md)
- [Unlock curriculum map](docs/unlock-curriculum-map.md)
- [Bypass forced updates](docs/bypass-forced-updates.md)
- [Disable tracking and analytics](docs/disable-telemetry.md)
- [Hide upgrade prompts](docs/hide-upgrade-prompts.md)
- [Enable developer tools](docs/enable-developer-tools.md)
- [MicroG-RE support](docs/microg-re-support.md)
- [Pairip bypass & client/server boundaries](docs/pairip-and-limitations.md)

## 🛠️ Building locally

- `./gradlew buildAndroid` → the bundle lands in `patches/build/libs/patches-*.mpp`
- Patch that file with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other bundle.

## 📜 License

[GNU General Public License v3.0](LICENSE).

## 🙏 Credits

- Built with [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) and [MorpheApp/morphe-patcher](https://github.com/MorpheApp/morphe-patcher) (GPLv3).
- **MicroG-RE support**: adapted from [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) GmsCore support (GPLv3) for [MorpheApp/MicroG-RE](https://github.com/MorpheApp/MicroG-RE).
