<h1>
  🧩 rimixyz Morphe Patches
  <a href="README.md"><img align="right" src="https://img.shields.io/badge/English-2962FF?style=flat-square" alt="English"></a>
</h1>

<p align="left">
  <a href="https://github.com/rimixyz/morphe-patches/releases/latest">
    <img src="https://img.shields.io/github/v/release/rimixyz/morphe-patches?label=latest&color=2962FF&style=flat-square" alt="Última versão">
  </a>
  <a href="https://github.com/rimixyz/morphe-patches/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/rimixyz/morphe-patches?color=0F9D58&style=flat-square" alt="Licença">
  </a>
  <img src="https://img.shields.io/badge/Made%20in-Brazil-009C3B?style=flat-square" alt="Feito no Brasil">
</p>

Coleção pessoal de patches para o [Morphe](https://morphe.software).

## ❓ Sobre

**Feito pra mim, compartilhado pra todo mundo:** Tudo aqui começa como algo que eu queria no meu próprio celular — apps que uso no dia a dia e jogos que estou jogando ou resolvi revisitar. Se te ajudar também, aproveita! As atualizações acontecem no meu ritmo, sem cronograma fixo ou garantias.

> [!NOTE]
> **100% feito com IA e testado antes de lançar:** Todo patch neste repositório é criado 100% com IA e testado em aparelho real até funcionar direitinho antes de ser publicado na `main`.

## 📲 Como usar

Clique no botão abaixo para adicionar esta fonte direto no **Morphe Manager**, ou cole manualmente a URL do repositório: `https://github.com/rimixyz/morphe-patches`

<a href="https://morphe.software/add-source?github=rimixyz/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Adicionar ao Morphe" height="48">
</a>

**Canais de lançamento:**
- **`main` (Estável):** patches testados em aparelho real e prontos para uso diário.
- **`dev` (Pré-lançamento):** atualizações em andamento ou mudanças maiores em teste antes de subir para a `main`.
- **🧪 Experimental:** alvos de apps ainda em investigação — podem estar incompletos, instáveis ou ser removidos a qualquer momento.

## 🩹 Patches

<!-- PATCHES_START -->
> **[v1.8.0](https://github.com/rimixyz/morphe-patches/releases/tag/v1.8.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;33 patches total
<details>
<summary>📦 HabitNow&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.habitnow`

**🎯 Supported versions:**

| 2.5.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP protection](#bypass-pairip-protection) | Restores the obfuscated runtime values and disables the PairIP virtual machine. |  |
| [Disable analytics and tracking](#disable-analytics-and-tracking) | Disables Firebase Analytics and Crashlytics collection and removes advertising ID permissions. |  |
| [Unlock premium](#unlock-premium) | Grants the local premium state the app reads for its paid features. |  |

</details>

<details>
<summary>📦 New Star Soccer&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**Package name:** `com.newstargames.newstarsoccer`

**🎯 Supported versions:**

| 4.34 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Convert IAP items to Star Bux](#convert-iap-items-to-star-bux) | Converts real-money boots, Super NRG drinks, and Pro/Expert agents and trainers into Star Bux purchases in both modern and classic UI, and replaces the dead Buy Bux redirect with an in-game insufficient-funds banner. |  |
| [Disable Google Play Games](#disable-google-play-games) | Disables broken Google Play Games auto-sign-in on re-signed APKs and hides the dead Play Games button on the Career screen (modern and classic UI). |  |
| [Disable ads](#disable-ads) | Blocks AdMob and DT Exchange/Fyber interstitial ads, removes the built-in promo interstitial, and hides the promotional "Games we like" button while keeping opt-in rewarded videos. |  |
| [Disable analytics and tracking](#disable-analytics-and-tracking) | Disables Firebase Analytics, Flurry analytics and startup measurement, and removes Advertising ID permissions. |  |
| [Disable remote config and cloud overrides](#disable-remote-config-and-cloud-overrides) | Freezes the in-game Cloud/DLC/Cohort override system so remote updates and cached DLC files can never overwrite local patched assets or TweakValues, and speeds up startup. |  |
| [Disable retention notifications](#disable-retention-notifications) | Prevents the game from scheduling local "come back and play" reminder notifications whenever it goes to the background. |  |
| [Enhanced replays and MP4/GIF export](#enhanced-replays-and-mp4-gif-export) | Adds a Replay Studio button during goal replays to customize playback speed, loop, slow-mo overlays, all-chance replays, and export clean HUD-free MP4 videos or animated GIFs. |  |
| [Fix text input backspace](#fix-text-input-backspace) | Fixes backspace when typing names in the game by using the in-game keyboard, which has a working delete button. |  |
| [Retro season selector](#retro-season-selector) | Prompts to choose a historical club database (2011–2026) bundled in the APK whenever you start a new career. Existing careers are unaffected. |  |
| [Save backup and restore](#save-backup-and-restore) | Adds a Backup button to the Career screen (modern and classic UI) to export and restore your full save via the system file picker, with automatic rollback protection. |  |
| [Unlock Pro features](#unlock-pro-features) | Unlocks the Pro license, ad removal, pitches/weather and special balls by setting the local license flags the game checks. |  |

</details>

<details>
<summary>📦 MyTherapy&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `eu.smartpatient.mytherapy`

**🎯 Supported versions:**

| 4.16.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable PairIP license check](#disable-pairip-license-check) | Neutralizes the PairIP license check so the re-signed APK can start, without removing its components. |  |
| [Disable all ads](#disable-all-ads) | Blocks all ad formats (banner, native, interstitial and rewarded), stops Mobile Ads/mediation SDK initialization, and skips UMP ad consent prompts. |  |
| [Disable analytics and tracking](#disable-analytics-and-tracking) | Disables Firebase Analytics, AppsFlyer attribution, Sentry diagnostics, internal analytics tracking, and removes Advertising ID permissions. |  |
| [Local backup and restore](#local-backup-and-restore) | Adds a Local Backup & Restore item to Settings to export/restore local .zip backups (with automatic rollback) and import official MyTherapy Archive CSV history. |  |
| [Unlock Plus benefits](#unlock-plus-benefits) | Grants the local Plus state the app reads for ad-free access, extra calendar days and the PDF entry point. |  |

</details>

<details>
<summary>📦 XRecorder&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `videoeditor.videorecorder.screenrecorder`

**🎯 Supported versions:**

| 2.5.6.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Blocks app-open ad load/show in XRecorder. SDK init is kept because the splash depends on it; ad-free comes from Unlock Pro's IProChecker. Server-side ad decisions are not affected. Known issue: the Edit tab closes in tests while loading the native video engine; core screen recording works with Pro unlocked. |  |
| [Disable analytics and tracking](#disable-analytics-and-tracking) | Disables Firebase Analytics, Crashlytics and ad ID permissions in XRecorder. Does not change any server-side feature or account state. Known issue: the Edit tab closes in tests while loading the native video engine; core screen recording works with Pro unlocked. |  |
| [Disable remote config](#disable-remote-config) | Freezes Firebase Remote Config overrides (AdCfg25, ServerDomain) in XRecorder. Server-side features and A/B flags are NOT emulated. Known issue: the Edit tab closes in tests while loading the native video engine; core screen recording works with Pro unlocked. |  |
| [Unlock Pro](#unlock-pro) | Unlocks the local Pro state of XRecorder (paywall, locks, ad-free). LOCAL ONLY: server-side AI, credits/quotas and subscription token validation are NOT unlocked. Known issue: the Edit tab closes in tests while loading the native video engine; core screen recording works with Pro unlocked. |  |

</details>

<details>
<summary>📦 Auto Clicker&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.truedevelopersstudio.automatictap.autoclicker`

**🎯 Supported versions:**

| 2.3.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads and tracking](#disable-ads-and-tracking) | Blocks AdMob banner/interstitial ads and SDK initialization, disables Firebase Analytics and Crashlytics events, and removes advertising ID permissions. REQUIRES Accessibility: on Android 17, disable Advanced Protection or allow restricted settings (Apps > Auto Clicker > menu > Allow restricted settings), then enable the Auto Clicker service. |  |
| [Unlock Pro](#unlock-pro) | Grants the local ad-free/premium state without a purchase. REQUIRES Accessibility: on Android 17, disable Advanced Protection or allow restricted settings (Apps > Auto Clicker > menu > Allow restricted settings), then enable the Auto Clicker service. |  |

</details>

<details>
<summary>📦 Notisave&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.tenqube.notisave`

**🎯 Supported versions:**

| 274.1.3.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads and tracking](#disable-ads-and-tracking) | Blocks ads, disables Blytics, Singular, Firebase Analytics and AppMetrica activation, and prevents Advertising ID lookups. |  |
| [Translate to Brazilian Portuguese](#translate-to-brazilian-portuguese) | Adds Brazilian Portuguese translations for Notisave when the device language is Portuguese (Brazil). |  |
| [Unlock premium](#unlock-premium) | Grants the local premium state the app reads for its paywall, VIP support, settings locks and ad-free UI. |  |

</details>

<details>
<summary>📦 17TRACK&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `yqtrack.app`

**🎯 Supported versions:**

| 3.1.6896.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads and tracking](#disable-ads-and-tracking) | Blocks all AdMob and Flutter Google Mobile Ads formats, hides the 'Deals' tab and campaign promos, disables Firebase Analytics, Crashlytics, and Facebook SDK auto-tracking, and removes Advertising ID permissions. |  |
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Restores the original certificate SHA-1 so Firebase Auth (Google login) and push notifications keep working after the APK is re-signed. |  |

</details>

<details>
<summary>📦 Wrestling Revolution&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `air.WRCareer`

**🎯 Supported versions:**

| 2.150.64 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Yodo1 ads and analytics](#remove-yodo1-ads-and-analytics) | Suppresses Yodo1 MAS banners, interstitials, rewarded videos, app-open ads (including SDK init preloads), and stops the bundled ThinkingData analytics tracker (c1.yodo1.com). Rewarded flows still grant their in-game reward. |  |
| [Unlock Pro](#unlock-pro) | Grants the Pro license locally by injecting a synthetic purchase into the Distriqt billing events. Unlocks the editor and the full career content. |  |

</details>

<details>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from Google Play. Useful when an app blocks features because it detects a sideloaded install. | • Store to impersonate |

</details>

<!-- PATCHES_END -->

<details>
<summary>🛠️ Compilando localmente (para desenvolvedores)</summary>
<br>

- Requer **Java 21** e credenciais do GitHub Packages com escopo `read:packages`:
  - Defina as variáveis de ambiente `GITHUB_ACTOR` e `GITHUB_TOKEN`, **ou**
  - Adicione `gpr.user=<usuario>` e `gpr.key=<token>` no seu `~/.gradle/gradle.properties` local (nunca faça commit de tokens no `gradle.properties` do repositório).
- Execute `./gradlew buildAndroid`
- O arquivo `.mpp` compilado será gerado em `patches/build/libs/patches-*.mpp`
- Aplique os patches usando o [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) ou o Morphe Manager.

Consulte a [documentação do Morphe](https://github.com/MorpheApp/morphe-documentation) para mais informações.

</details>

## 📜 Licença

rimixyz Morphe Patches é licenciado sob a [GNU General Public License v3.0](LICENSE).
