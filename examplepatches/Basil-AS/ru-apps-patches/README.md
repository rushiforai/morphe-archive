# 🧩 RU Apps Patches

Патчи [Morphe](https://morphe.software) для российских Android-приложений.

## ❓ О проекте

Репозиторий содержит патчи для российских приложений и релизы с готовыми пропатченными сборками.
Здесь публикуются только сами патчи, список поддерживаемых приложений и версий, а также релизы.

Проект не связан с авторами патчируемых приложений и не связан с проектом Morphe
(Morphe упоминается только для описания совместимости).

### Как подключить патчи

Добавить источник в Morphe: https://morphe.software/add-source?github=Basil-AS/ru-apps-patches

## 🩹 Список патчей

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/Basil-AS/ru-apps-patches/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;176 patches total
<details open>
<summary>📦 Avito&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 234.5 | 234.0 | 233.5 | 233.1 | 232.0 | 231.5 | 231.0 | 230.5 | 230.0 | 229.1 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes dark-theme page, app navigation and system bars pure black (AMOLED) while keeping elevated cards, sheets and controls gray so their boundaries remain visible. |  |
| [Block listings](#block-listings) | Hides Avito offers from blacklisted adverts or sellers and adds a blacklist manager (import/export compatible with the Ave Blacklist extension). |  |
| [Bypass RootBeer root detection](#bypass-rootbeer-root-detection) | Stubs calls into the scottyab/rootbeer native root-checking library so it always reports a clean (non-rooted) result. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Disable telemetry](#disable-telemetry) | Disables Avito first-party clickstream analytics, Avito's direct Adjust telemetry wrapper, AppMetrica, and Varioqub A/B-test reporting. |  |
| [Disable update prompts](#disable-update-prompts) | Prevents Avito's force-update screen opener from launching update screens. Toggleable in Настройки Morphe. |  |
| [Hide professional sellers](#hide-professional-sellers) | Adds a maximum seller review count to Avito search filters and hides or dims offers from sellers above that limit. |  |
| [Morphe settings](#morphe-settings) | Adds a "Настройки Morphe" entry to Avito's settings that hosts the configuration for the other Morphe patches. |  |
| [Remove ads](#remove-ads) | Disables Avito ads by removing ad SDK entry points and short-circuiting commercial banner loading. |  |
| [UI tweaks](#ui-tweaks) | Optional interface tweaks, each toggleable in Настройки Morphe: single-row home categories, hide the "Подписки" tab in Избранное, hide installments (Рассрочка) and the "Спросите у продавца" block on offers, expand descriptions by default (no "Читать далее"), hide reserved offers and offer recommendations, hide profile raffle, referral and Avito Pro promos, optionally hide profile sections (recommendations, tools, services, jobs), and hide the Avi assistant tab in the bottom navigation. |  |

</details>

<details open>
<summary>📦 VK Video&nbsp;&nbsp;•&nbsp;&nbsp;21 patches</summary>
<br>

**🎯 Supported versions:**

| 1.165 | 1.163 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block deep midroll ads](#block-deep-midroll-ads) | Disables the dedicated request_midroll runnable, midpoint configuration, and direct named midroll starts. |  |
| [Block midroll ads](#block-midroll-ads) | Stops the runtime MIDROLL branch before VideoAutoPlay pauses or switches the main video player to the instream ad engine. |  |
| [Bypass native signature check](#bypass-native-signature-check) | Prevents libvkcore.so from terminating re-signed VK Video builds at startup. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable OpenTelemetry APM](#disable-opentelemetry-apm) | Disables the ru.ok.tracer/OpenTelemetry pipeline (OkHttp request interception, CPU/network tech-stats, span/metric/log upload) by forcing its tracing-enabled gate off. |  |
| [Disable VK Video MyTarget SDK](#disable-vk-video-mytarget-sdk) | Disables MyTarget's auto-init content provider and ad activity so the SDK never starts. |  |
| [Disable VK Video advertising ID](#disable-vk-video-advertising-id) | Removes the advertising ID permission so ad SDKs cannot read the device's real advertising identifier. |  |
| [Disable ad pixel tracking](#disable-ad-pixel-tracking) | Stops PixelStatsTrackerImpl from sending individual and batch ad pixels. |  |
| [Disable ad-free subscription promo](#disable-ad-free-subscription-promo) | Disables VK's VIDEO_AD_FREE_SUBSCRIPTION feature gate so profile promo items are never created. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Disable in-app update](#disable-in-app-update) | Disables the VK Video in-app update check and update prompt. |  |
| [Disable video ad repository](#disable-video-ad-repository) | Replaces the real video advertising repository with VK's built-in no-op STUB. |  |
| [Filter Clips SDK ads](#filter-clips-sdk-ads) | Drops client-side Clips SDK ad videos plus StaticAds/MarketAds before they enter the rendered feed. |  |
| [Filter clip feed ads](#filter-clip-feed-ads) | Removes server-provided StaticAd, MarketAd, FloatingAd, and MyTarget ad items before the VK Clips feed mapper can render them. |  |
| [Fix install conflict with stock VK](#fix-install-conflict-with-stock-vk) | Allows the re-signed VK Video build to coexist with the official VK app. |  |
| [Hide ad XML surfaces](#hide-ad-xml-surfaces) | Collapses known catalog, video-banner, and player ad layouts while preserving their XML structure. |  |
| [Hide home showcase ads](#hide-home-showcase-ads) | Replaces the native MyTarget showcase ad card on the home catalog with VK's EmptyVh. |  |
| [Hide promoted banner content](#hide-promoted-banner-content) | Forces VideoDiscoverAdsDto.canShowAdBanner to false. |  |
| [Remove clip ads](#remove-clip-ads) | Disables VK Clips ad feature gates, ad configs, and SDK ad feature parameters. |  |
| [Remove video ads](#remove-video-ads) | Disables player ad feature gates and strips server-provided instream/mobile/sport/banner ad payloads. |  |

</details>

<details open>
<summary>📦 T-Bank&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass RootBeer root detection](#bypass-rootbeer-root-detection) | Stubs calls into the scottyab/rootbeer native root-checking library so it always reports a clean (non-rooted) result. |  |
| [Bypass STCrypt CKey root detection](#bypass-stcrypt-ckey-root-detection) | Disables the STCrypt/CKey SDK's aggregate root-detection check so it always reports a clean (non-rooted) result. |  |
| [Bypass anti-tamper](#bypass-anti-tamper) | Stubs TBank's native RASP executor calls and neutralizes tamper flag reporting. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Disable telemetry worker](#disable-telemetry-worker) | Stops T-Bank's BaseTelemetryWorker-derived background jobs (disk-buffered OpenTelemetry upload) from doing any work. |  |
| [Remove TBank ads](#remove-tbank-ads) | Removes TBank stories and promotional surfaces. |  |

</details>

<details open>
<summary>📦 Ozon&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass RootBeer root detection](#bypass-rootbeer-root-detection) | Stubs calls into the scottyab/rootbeer native root-checking library so it always reports a clean (non-rooted) result. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Disable checkout tips](#disable-checkout-tips) | Removes courier tips UI and prevents tip IDs or tip API calls from being submitted. |  |
| [Disable lottery and in-app pushes](#disable-lottery-and-in-app-pushes) | Disables lottery onboarding and the in-app push SDK used for reward popups. |  |
| [Disable telemetry](#disable-telemetry) | Disables Ozon analytics, attribution, crash reporting, and telemetry uploads. |  |
| [Disable tip notifications](#disable-tip-notifications) | Suppresses Ozon push notifications asking the user to leave a pickup-point tip. |  |
| [Hide Ozon Bank ad banner](#hide-ozon-bank-ad-banner) | Removes the advertising banner carousel from the Ozon Bank screen. |  |
| [Hide account lottery and review feed](#hide-account-lottery-and-review-feed) | Removes the lottery entry banner and review feed shortcut from the account screen. |  |
| [Hide seller rating prompt](#hide-seller-rating-prompt) | Removes the post-purchase seller rating prompt. |  |
| [Remove Ozon ads](#remove-ozon-ads) | Removes Ozon ad widgets, banner carousels, video ads, and PDP promo blocks. | • Hide recommendation grids |
| [Show final prices only](#show-final-prices-only) | Hides crossed-out prices, discount percentages, and redundant price rows in the cart total. |  |

</details>

<details open>
<summary>📦 Ozon Bank&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass RootBeer root detection](#bypass-rootbeer-root-detection) | Stubs calls into the scottyab/rootbeer native root-checking library so it always reports a clean (non-rooted) result. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable Ozon Bank VPN warning](#disable-ozon-bank-vpn-warning) | Removes the warning shown when Ozon Bank detects an active VPN connection. |  |
| [Disable Ozon Bank advertising ID](#disable-ozon-bank-advertising-id) | Removes the advertising ID permission so AdMob and other ad SDKs cannot read the device's real advertising identifier. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Hide Ozon Bank benefit sections](#hide-ozon-bank-benefit-sections) | Adds options to hide selected non-advertising sections from the Benefit page. | • Hide Buy for 1 ruble<br>• Hide Partner benefits<br>• Hide For shopping on Ozon<br>• Hide Ozon Premium |
| [Hide Ozon Bank promotions](#hide-ozon-bank-promotions) | Uses the classic home design and removes promotional cards, sections, shortcuts, and the startup installment offer from Ozon Bank pages. |  |

</details>

<details open>
<summary>📦 MAX&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 26.35.0 | 26.34.0 | 26.10.1 | 26.11.3 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass VPN check](#bypass-vpn-check) | Reduces MAX's external IP-checker fallback list to a single, blockable endpoint. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable MAX advertising ID](#disable-max-advertising-id) | Removes the advertising ID permission so ad and analytics SDKs cannot read the device's real advertising identifier. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Disable background telemetry workers](#disable-background-telemetry-workers) | Stops MAX's SampleUploadWorker (diagnostic uploads to apptracer.ru) and DailyAnalyticsWorker (daily permission-status telemetry) from doing any work. |  |

</details>

<details open>
<summary>📦 RuTube&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 31.17.2-rustore | 31.14.2-rustore |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom branding icon](#custom-branding-icon) | Adds a badge to the launcher icon so the patched app is distinguishable from an unpatched install. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable RuTube advertising ID](#disable-rutube-advertising-id) | Removes the advertising ID permission so ad SDKs cannot read the device's real advertising identifier. |  |
| [Disable Segment analytics](#disable-segment-analytics) | Disables Segment (segment.com) event tracking by no-opping its event-processing entry point. |  |
| [Disable ads](#disable-ads) | Prevents the ad SDK from starting, which stops banner ads and pre-roll video ads. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Enable background playback](#enable-background-playback) | Allows playback to continue when the app is not in the foreground, which is otherwise only available with a paid subscription. |  |
| [Lift download restrictions](#lift-download-restrictions) | Allows downloading videos the app otherwise refuses, either because the uploader disabled downloads or because the video is longer than six hours. |  |
| [Unlock subscription features](#unlock-subscription-features) | Reports the account as subscribed to the app itself, which enables features gated behind a paid subscription such as background playback. Anything the server enforces is unaffected. |  |

</details>

<details open>
<summary>📦 RuStore&nbsp;&nbsp;•&nbsp;&nbsp;16 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable Mine redesign](#disable-mine-redesign) | Reverts the Mine screen to the classic layout, disabling the redesigned V2/V3 interface. |  |
| [Disable ads](#disable-ads) | Removes advertisements and search recommendations, clears advertising identifiers, keeps advertising consent disabled, and removes the unsolicited VK ID prompt, with options for additional interface cleanup. | • Disable loyalty program<br>• Hide Featured and Games tabs<br>• Hide notification buttons |
| [Disable analytics](#disable-analytics) | Disables analytics and tracking in RuStore. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Disable background hooks](#disable-background-hooks) | Disables RuStore network-state monitoring, built-in VPN sessions, and startup hooks. |  |
| [Disable background scan](#disable-background-scan) | Disables the periodic Kaspersky background device scan. |  |
| [Disable gaming profile](#disable-gaming-profile) | Removes the Game Profile and usage statistics access, hides both gaming cards, and blocks navigation to the profile. |  |
| [Disable invasive permissions](#disable-invasive-permissions) | Removes privileged, phone, SMS, location, storage, billing, USB, and vendor access. |  |
| [Disable push services](#disable-push-services) | Disables RuStore and VK remote push services and background tasks. |  |
| [Exclude Google Play apps from updates](#exclude-google-play-apps-from-updates) | Excludes Google Play installs from RuStore update checks while keeping RuStore and sideloaded apps. |  |
| [Replace RuStore SDK device identifier](#replace-rustore-sdk-device-identifier) | Replaces the RuStore SDK device identifier sent with payment and session requests with the zero UUID. |  |
| [Replace VK SDK device identifier](#replace-vk-sdk-device-identifier) | Replaces the VK SDK device fingerprint sent by VK ID and VK Pay request paths with the zero UUID. |  |
| [Restore secure-session compatibility](#restore-secure-session-compatibility) | Preserves RuStore secure-session requests when the APK is re-signed. |  |
| [Skip update authentication](#skip-update-authentication) | Skips the VK ID authorization suggestion shown during app installs and updates. |  |

</details>

<details open>
<summary>📦 Yandex Music&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.09.5 #167.1rur |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Yandex Maps&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 31.1.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Yandex Go&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 5.98.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Yandex Rasp&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 3.73.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Yandex Weather&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 26.10.10 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Yandex Pay&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 0.243.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Sberbank&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 17.13.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable Sberbank advertising ID](#disable-sberbank-advertising-id) | Removes the advertising ID permission so ad and analytics SDKs cannot read the device's real advertising identifier. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Alfa-Bank&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 12.60.07 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 VTB Online&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 20.18.1.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Mir Pay&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.64.5.350 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 2GIS&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 7.29.1.632.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Zvuk&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.117.0rs |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Gosuslugi&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 27.1.0.9876-rustore |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Wildberries&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 7.8.3002-rustore |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |
| [Remove Wildberries ads](#remove-wildberries-ads) | Removes Wildberries home banners, grid banners, profile banners, promo headers, product recommendations, and lottery popups. | • Hide recommendation grids |

</details>

<details open>
<summary>📦 AliExpress&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 8.89.1.3597464 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Perekrestok&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 3.99.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Whoosh&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Yandex Mail&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 9.30.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 Beeline&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 5.48.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 MTS&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 6.77 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 MegaFon&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.69.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() choke point (the actual activation entry point, called directly from app code — not manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries. |  |
| [Disable analytics libraries](#disable-analytics-libraries) | Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase). |  |
| [Disable analytics manifest components](#disable-analytics-manifest-components) | Disables analytics and tracking components and metadata in AndroidManifest.xml. |  |

</details>

<details open>
<summary>📦 XYZ app&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.0.0 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Example Patch](#example-patch) | Example patch to start with. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;16 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Adjust](#disable-adjust) | Disables Adjust attribution manifest entry points. |  |
| [Disable Firebase telemetry](#disable-firebase-telemetry) | Disables Firebase telemetry collection flags and DataTransport sender entry points. |  |
| [Disable Google Analytics](#disable-google-analytics) | Disables legacy Google Analytics manifest entry points. |  |
| [Disable Kaspersky SDK](#disable-kaspersky-sdk) | Disables Sberbank's bundled Kaspersky KAV SDK (background antivirus scanning) manifest entry points. |  |
| [Disable RuStore metrics](#disable-rustore-metrics) | Disables RuStore metrics manifest entry points. |  |
| [Disable Sentry telemetry](#disable-sentry-telemetry) | Disables Sentry telemetry by turning off SDK auto-init and clearing the DSN. |  |
| [Disable freeRASP](#disable-freerasp) | Disables the freeRASP mobile security SDK startup. |  |
| [Spoof USB debugging status](#spoof-usb-debugging-status) | Spoofs USB debugging and related developer settings through common Android APIs. |  |
| [Spoof VPN status](#spoof-vpn-status) | Spoofs VPN state through common Android network APIs. |  |
| [Spoof VPN telemetry field](#spoof-vpn-telemetry-field) | Forces boolean values boxed right after a VPN-flag telemetry key (vpn, is_vpn, is_vpn_on, isVpnConnected, vpn_enabled, vpn_connected) to false, as defense-in-depth alongside Spoof VPN status for apps that cache the VPN flag before reporting it. Default-off: verify against a real decompile of the target app first (see provenance comment). |  |
| [Spoof default proxy and DNS servers](#spoof-default-proxy-and-dns-servers) | Makes ConnectivityManager.getDefaultProxy() return null and LinkProperties.getDnsServers() return an empty list, closing two detection checks not covered by Spoof VPN status (the system-default proxy, and loopback/private DNS server comparison). |  |
| [Spoof emulator status](#spoof-emulator-status) | Spoofs emulator state through common Build, QEMU file, command, and system property checks. |  |
| [Spoof install source](#spoof-install-source) | Spoofs package installer checks to report Google Play as the install source. |  |
| [Spoof installed VPN apps list](#spoof-installed-vpn-apps-list) | Makes PackageManager queries for installed VpnService-implementing apps (the android.net.VpnService intent action) return an empty list, hiding which VPN client apps are installed without affecting any other PackageManager query. |  |
| [Spoof network interface MTU](#spoof-network-interface-mtu) | Forces NetworkInterface.getMtu() to report the standard Ethernet MTU (1500) instead of a reduced tunnel-typical value, when the call site shows a VPN-detection context. |  |
| [Spoof system proxy properties](#spoof-system-proxy-properties) | Makes System.getProperty("http.proxyHost") and the other JVM-level proxy property keys return null, as if no proxy/VPN-provided proxy were configured. |  |

</details>

<!-- PATCHES_END -->

## 📦 Релизы

Готовые файлы (`.mpp` и пропатченные APK) публикуются на странице
[Releases](https://github.com/Basil-AS/ru-apps-patches/releases).

## 📚 Документация

- [Установка и использование](docs/ru/usage.md)
- [Сборка из исходников](docs/ru/build.md)
- [Список приложений](docs/ru/apps.md)
- [Участие в проекте](CONTRIBUTING.md)

## 📜 Лицензия

Проект распространяется под лицензией [GNU GPL v3.0](LICENSE).
Основан на [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
