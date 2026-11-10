# o0b Patches

Morphe patches

## ❓ About

https://morphe-patches.software/

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=o0b/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.13.0](https://github.com/o0b/morphe-patches/releases/tag/v1.13.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;59 patches total
<details open>
<summary>📦 Ivy&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 1.1.29 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Adjust animation speed](#adjust-animation-speed) | Scales or disables all XML-based animations in Ivy (Quick Panel, drawer, widget and handle animations). Set the scale to 0 to remove animations, or use the disable toggle. | • Animation scale<br>• Disable animations |
| [Disable telemetry](#disable-telemetry) | Disables Fabric, Crashlytics, and Answers analytics. |  |
| [Force offline](#force-offline) | Disables Firebase and RSS network fetches. |  |
| [Remove INTERNET permission](#remove-internet-permission) | Strips the INTERNET permission and disables Ivy's ads, telemetry, Firebase and RSS network paths so the app starts fully offline instead of crashing. |  |
| [Remove Quick Panel transition animation](#remove-quick-panel-transition-animation) | Forces the Quick Panel frame, ribbon and edge-slide animations to finish instantly while keeping the animation listeners that set the panel visible. |  |
| [Remove ads](#remove-ads) | Removes AdMob initialization and the quick panel ad view. |  |

</details>

<details open>
<summary>📦 Nova Launcher&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 81006 (8.1.6) |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Bugsnag](#disable-bugsnag) | No-ops Bugsnag on Nova Launcher 8.1.6: both HTTP deliverers return DELIVERED so no payload ever leaves the device (queued error files are deleted as sent), and Nova's error-reporting flag is forced false — which also disables novalytics usage recording. The client still initializes; crash data stays local-only. |  |
| [Disable Sesame integrations](#disable-sesame-integrations) | Disables Nova Launcher 8.1.6's Sesame third-party integrations (Spotify, OneDrive, Twitch, Slack, Discord, Dropbox, Deezer, GitHub): the integration ingest always returns 0 items, so no background or manual data pulls run and their APIs are never contacted. The Sesame engine and local search indexing continue to work. |  |
| [Disable Sesame search results](#disable-sesame-search-results) | Removes the bundled Sesame (Branch) deep-shortcut results from Nova Launcher's search on 8.1.6 by no-op'ing its results provider. Search still returns apps, contacts and settings. |  |
| [Unlock Prime](#unlock-prime) | Unlocks Nova Launcher Prime on 8.1.6 by forcing the runtime prime flags (Lzg/t1;->y / ->t) to true at every write — the settings initializer and the Prime-unlocker package-change handler. |  |

</details>

<details open>
<summary>📦 Hurry Day Countdown & Reminder&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 30.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Firebase analytics and remote config](#disable-firebase-analytics-and-remote-config) | No-ops the app's FirebaseAnalytics event logger and the startup RemoteConfig fetch (no FID, no config phone-home). |  |
| [Disable Pairip integrity and license checks](#disable-pairip-integrity-and-license-checks) | Removes the signature-tamper crash and the Play-licensing error dialog and shutdown that fire without Google Play services. |  |
| [Unlock pro features](#unlock-pro-features) | Forces the app's own "purchased" preference on at process start and neutralizes the billing re-verify that erases it without Play services. |  |

</details>

<details open>
<summary>📦 Business Calendar 2&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.55.6 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable telemetry](#disable-telemetry) | Disables Firebase completely (init provider, analytics, Crashlytics, Remote Config wiring, install UUID), turns off the sale promo push notifications, and prevents Fyber's crash handler from installing at process start. |  |
| [Unlock Pro](#unlock-pro) | Unlocks Business Calendar 2 Pro by forcing the complete pro status and the force-pro override to return true, routing every feature gate to the full package (7) without touching billing. |  |

</details>

<details open>
<summary>📦 meteoblue Weather&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| Cirrus Uncinus 3.1.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all meteoblue Weather premium features by making the billing data source's purchase-state flow always report an active purchase. |  |

</details>

<details open>
<summary>📦 Octopi Launcher&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.92 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks Octopi Launcher Pro by returning true from the isPro LiveData getter, bypassing all pro feature gates without modifying billing or database logic. |  |

</details>

<details open>
<summary>📦 Wavelet&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.05 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks Wavelet's pro features (Reverberation, Virtualizer, Bass tuner, Equal loudness) by initializing the purchase-verified state flow to true and making the purchase processor always report a verified purchase, which also suppresses the purchase flow. |  |

</details>

<details open>
<summary>📦 Your Calendar Widget&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.71.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Your Calendar Widget: Remove ads](#your-calendar-widget-remove-ads) | Kills AdMob at every evidenced seam: auto-init provider (attachInfo), overview + settings + promotion-screen banner loaders, the timed promotion popup, and the rewarded-ad bootstrap + display (AdManager load/show). Works independently of the Pro patch. |  |
| [Your Calendar Widget: Unlock Pro](#your-calendar-widget-unlock-pro) | Unlocks all Pro/task features by forcing the read-side gates (both Utility.isProVersion overloads + Utility.hasTaskAccess). Erosion-safe: purchase state lives in sticky settings that only these gates read; billing failure paths never bypass them. Without GMS, Play Billing can never resolve purchases. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;39 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Amazon IAP components](#disable-amazon-iap-components) | Disables the orphan Amazon In-App Purchasing response receiver and strips the Amazon PrivacyPass attest permission. Inert without the Amazon Appstore installed. |  |
| [Disable Android debugging](#disable-android-debugging) | Sets android:debuggable=false on the application element, blocking JDWP debugger attach and `run-as` access to the app's private data over ADB. Apps that rely on debug-only behavior will lose it. |  |
| [Disable CafeBazaar components](#disable-cafebazaar-components) | Disables the orphan CafeBazaar in-app billing receiver and strips its pay-through permission. Inert without CafeBazaar installed. |  |
| [Disable Google Play billing components](#disable-google-play-billing-components) | Disables the Play Billing library's proxy billing activities, the Play Core dialog wrapper and asset-pack extraction services, and the Pairip license activity. Billing and licensing permission declarations are handled by the Remove GMS permissions master patch — this patch only disables the components. Purchases were already impossible in re-signed patched APKs. |  |
| [Disable Huawei store components](#disable-huawei-store-components) | Disables orphan Huawei HMS, AGConnect and OTA update SDK components: the HMS bridge and enable-service activities, AGConnect service discovery and initializer, Huawei's in-app OTA updater, package installer and file provider, and the account sign-in hub activities. Strips the AppGallery common-data permission. Inert without Huawei AppGallery installed. |  |
| [Disable OneStore components](#disable-onestore-components) | Disables orphan OneStore (Korean GAA SDK) components: the IAP proxy activity and sign-in activity. Inert without OneStore installed. |  |
| [Disable RuStore components](#disable-rustore-components) | Disables orphan RuStore SDK components: the payment activity, pay and imaging content providers, and the metrics event job service. Inert without RuStore installed. |  |
| [Disable Samsung IAP components](#disable-samsung-iap-components) | Disables orphan Samsung In-App Purchase SDK components: the dialog, package-check, account, payment and subscription-plan activities. Strips the Samsung IAP billing permission. Inert without Samsung Galaxy Store installed. |  |
| [Disable Xiaomi store components](#disable-xiaomi-store-components) | Disables orphan Xiaomi billing client and Common IAP components: the proxy billing activities and payment/extra web activities they register. Inert without Xiaomi's store and payment service installed. |  |
| [Disable ad SDK calls](#disable-ad-sdk-calls) | No-ops common ad SDK load/show/init/fetch methods in bundled ad packages. |  |
| [Disable cleartext traffic](#disable-cleartext-traffic) | Sets android:usesCleartextTraffic=false on the application element, forcing all traffic to HTTPS. Plaintext HTTP can be read and injected by anyone on the network. Apps that legitimately use plain HTTP (local device dashboards, IoT) lose those requests. |  |
| [Disable legacy external storage](#disable-legacy-external-storage) | Sets android:requestLegacyExternalStorage=false on the application element, confining the app to scoped storage — its own directories and media collections instead of raw access to every app's shared files. Only affects apps targeting Android 10; file-manager-style apps lose raw shared-storage paths. |  |
| [Disable lock-screen display](#disable-lock-screen-display) | Disables android:showWhenLocked and android:turnScreenOn on every activity that declared them, so no app screen can display over the lock screen and no activity can wake the screen by itself. Stalkerware and scareware use lock-screen overlays to fake unlock prompts and push alerts while the phone is locked; alarm, incoming-call and 2FA screens lose their over-lock UX. Both removals are on by default — open the patch options (gear) to deselect one. | • Disable show-when-locked<br>• Disable turn-screen-on |
| [IPC guard (cross-app exfil barrier)](#ipc-guard-cross-app-exfil-barrier) | A cross-app IPC barrier for suspect apps: outbound intents to other packages are dropped (own-package traffic passes through), ContentResolver access to foreign authorities is blocked, runtime receivers become not-exported, and notification PendingIntents aimed at other apps become no-ops. The manifest sweep (providers unexported, <queries> stripped, HCE removed) always applies. Breaks share sheets, link opens, pickers and cross-app logins unless the destination package is in the allowlist. All guards are on by default — open the patch options (gear) to deselect or allowlist. | • Guard outbound intents<br>• Guard content providers<br>• Force receivers not-exported<br>• Guard PendingIntents<br>• Allowed packages |
| [Network host allowlist](#network-host-allowlist) | Blocks all of the app's DNS resolution except the domains you allow: every non-allowlisted host resolves to 0.0.0.0, so no traffic leaves the device except to the hosts you list in the options (gear). Entries are suffix-matched — example.com also allows its subdomains. Unlike literal-based host blocking, this catches hosts the app fetches from configuration or redirects, not just shipped literals. The allowlist is baked at patch time; re-patch to change it. | • Allowed domains |
| [Override auto backup](#override-auto-backup) | Forces android:allowBackup on the application element in the chosen direction. Disable excludes the app's private data — databases, preferences, tokens — from cloud auto backup, adb backup and device transfers (the privacy direction). Enable restores the platform default for apps that opted out, overriding the developer's protection of secrets and license tokens. Pick the direction in the patch options (gear); default is Disable. | • Backup override |
| [Prevent task hijacking (StrandHogg)](#prevent-task-hijacking-strandhogg) | Hardens the app against task-hijacking overlays (StrandHogg): clears the cloneable task affinity, disables activity re-parenting and pins launcher activities to singleTask so no other app can interleave phishing UI in front of this one. Recents behavior can change (relaunch resumes instead of restarting; splash launchers may act differently). All mitigations are on by default — open the patch options (gear) to deselect. | • Clear task affinity<br>• Disable task re-parenting<br>• Force launcher singleTask |
| [Remove GMS permissions](#remove-gms-permissions) | Strips the Google Play-defined permission declarations from the manifest: advertising ID, Play Billing, legacy license checks, install referrer attribution, push (C2DM), legacy account auth scopes, legacy activity recognition and Google Services Framework sync. Inert on devices without Google Play; on Play devices it kills the matching capability. All removals are on by default — open the patch options (gear) to deselect specific ones. | • Remove AD_ID (Google Play Services)<br>• Remove BILLING (Google Play)<br>• Remove CHECK_LICENSE (Play Licensing)<br>• Remove BIND_GET_INSTALL_REFERRER_SERVICE<br>• Remove C2DM permissions (push)<br>• Remove C2D_MESSAGE (app-scoped push lock)<br>• Remove READ_GSERVICES (Google Services Framework)<br>• Remove legacy ACTIVITY_RECOGNITION (Google Play Services)<br>• Remove GOOGLE_AUTH scopes (legacy account tokens) |
| [Remove Health Connect permissions](#remove-health-connect-permissions) | Strips the app's Health Connect declarations — background reads granted without a separate prompt, and history reaching back before install. All removals are on by default — open the patch options (gear) to keep specific ones. | • READ_HEALTH_DATA_IN_BACKGROUND<br>• READ_HEALTH_DATA_HISTORY |
| [Remove INTERNET permission](#remove-internet-permission) | Removes the android.permission.INTERNET permission from the manifest. Blocks every socket the app opens, so bundled ad, analytics and telemetry SDKs cannot phone home. Also disables any legitimate online features — only enable for apps you want fully offline. |  |
| [Remove SMS & MMS permissions](#remove-sms-mms-permissions) | Strips the app's messaging declarations — premium-SMS fraud, OTP interception and the carrier push channel, all of which bypass the internet stack entirely. All removals are on by default — open the patch options (gear) to keep specific ones. | • SEND_SMS<br>• READ_SMS<br>• RECEIVE_SMS<br>• RECEIVE_MMS<br>• RECEIVE_WAP_PUSH |
| [Remove ad & Privacy Sandbox permissions](#remove-ad-privacy-sandbox-permissions) | Strips the app's ad-stack declarations — interest profiling, the advertising identifier and cross-app attribution measurement. All removals are on by default — open the patch options (gear) to keep specific ones. | • ACCESS_ADSERVICES_TOPICS<br>• ACCESS_AD_SERVICES_AD_ID<br>• ACCESS_ADSERVICES_ATTRIBUTION |
| [Remove calendar permissions](#remove-calendar-permissions) | Strips the app's calendar declarations — the read side harvests schedules offline, the write side injects phantom events into the trusted Calendar UI. All removals are on by default — open the patch options (gear) to keep specific ones. | • READ_CALENDAR<br>• WRITE_CALENDAR |
| [Remove camera & flashlight permissions](#remove-camera-flashlight-permissions) | Strips the app's camera and flashlight permission declarations, capture included. All removals are on by default — open the patch options (gear) to keep specific ones. | • CAMERA<br>• FOREGROUND_SERVICE_CAMERA<br>• FLASHLIGHT |
| [Remove contacts & accounts permissions](#remove-contacts-accounts-permissions) | Strips the app's social-graph and account-enum declarations — the read side harvests offline, the write side is an integrity attack vector. All removals are on by default — open the patch options (gear) to keep specific ones. | • READ_CONTACTS<br>• WRITE_CONTACTS<br>• GET_ACCOUNTS |
| [Remove location permissions](#remove-location-permissions) | Strips the app's location permission declarations, GNSS and service-context capture included. All removals are on by default — open the patch options (gear) to keep specific ones. | • ACCESS_FINE_LOCATION<br>• ACCESS_COARSE_LOCATION<br>• ACCESS_BACKGROUND_LOCATION<br>• FOREGROUND_SERVICE_LOCATION |
| [Remove media & storage permissions](#remove-media-storage-permissions) | Strips the app's media and shared-storage declarations — the full library including PII screenshots, EXIF GPS location history, and legacy shared-storage integrity. All removals are on by default — open the patch options (gear) to keep specific ones. | • READ_MEDIA_IMAGES<br>• READ_MEDIA_VIDEO<br>• READ_MEDIA_AUDIO<br>• READ_MEDIA_VISUAL_USER_SELECTED<br>• ACCESS_MEDIA_LOCATION<br>• READ_EXTERNAL_STORAGE<br>• WRITE_EXTERNAL_STORAGE |
| [Remove microphone & audio permissions](#remove-microphone-audio-permissions) | Strips the app's audio declarations — microphone capture, service-context capture, and global audio-state modification. All removals are on by default — open the patch options (gear) to keep specific ones. | • RECORD_AUDIO<br>• FOREGROUND_SERVICE_MICROPHONE<br>• MODIFY_AUDIO_SETTINGS |
| [Remove nearby radio permissions](#remove-nearby-radio-permissions) | Strips the app's Bluetooth, UWB, Wi-Fi Aware and NFC declarations — beacon presence mapping, discoverability and direct RF exfiltration links, all offline-capable. All removals are on by default — open the patch options (gear) to keep specific ones. | • BLUETOOTH<br>• BLUETOOTH_ADMIN<br>• BLUETOOTH_SCAN<br>• BLUETOOTH_CONNECT<br>• BLUETOOTH_ADVERTISE<br>• UWB_RANGING<br>• NEARBY_WIFI_DEVICES<br>• NFC |
| [Remove network state permissions](#remove-network-state-permissions) | Strips the app's network-visibility declarations — Wi-Fi identity, VPN detection and LAN inventory. All removals are on by default — open the patch options (gear) to keep specific ones. | • ACCESS_WIFI_STATE<br>• ACCESS_NETWORK_STATE<br>• ACCESS_LOCAL_NETWORK |
| [Remove notification permission](#remove-notification-permission) | Removes the android.permission.POST_NOTIFICATIONS permission from the manifest — a lure and phishing delivery channel into your notification shade. Apps go quiet; that is the point. |  |
| [Remove persistence & wakeup permissions](#remove-persistence-wakeup-permissions) | Strips the app's persistence and wake-scheduling declarations — boot auto-start, CPU hold and precise periodic wakeups, the backbone of always-on background telemetry. All removals are on by default — open the patch options (gear) to keep specific ones. | • RECEIVE_BOOT_COMPLETED<br>• WAKE_LOCK<br>• SCHEDULE_EXACT_ALARM<br>• USE_EXACT_ALARM |
| [Remove phone & call permissions](#remove-phone-call-permissions) | Strips the app's telephony declarations — silent dialing, identity correlation, call hijacking and call-record tampering. All removals are on by default — open the patch options (gear) to keep specific ones. | • CALL_PHONE<br>• READ_PHONE_STATE<br>• READ_PHONE_NUMBERS<br>• ANSWER_PHONE_CALLS<br>• READ_CALL_LOG<br>• WRITE_CALL_LOG<br>• USE_SIP |
| [Remove screenshot detection permission](#remove-screenshot-detection-permission) | Removes the android.permission.DETECT_SCREEN_CAPTURE permission from the manifest (Android 15+) — banking apps scold you and surveillance apps learn that evidence is being collected. Removing it makes your screenshots silent. Pair with the Universal Screenshot Protection Bypass to also clear FLAG_SECURE. |  |
| [Remove sensor & motion permissions](#remove-sensor-motion-permissions) | Strips the app's motion and body-sensor declarations — activity inference, tap logging, gait profiling and device fingerprinting. All removals are on by default — open the patch options (gear) to keep specific ones. | • OTHER_SENSORS<br>• ACTIVITY_RECOGNITION<br>• BODY_SENSORS<br>• BODY_SENSORS_BACKGROUND |
| [Remove silent download permission](#remove-silent-download-permission) | Removes android.permission.DOWNLOAD_WITHOUT_NOTIFICATION — the grant apps declare to run DownloadManager transfers with hidden visibility, so payload pulls (including dropper self-updates) happen with no visible notification. Once stripped, a hidden download request fails loudly at enqueue (SecurityException: Invalid value for visibility: 2) instead of hiding — the transfer can no longer be invisible. Pairs with the REQUEST_INSTALL_PACKAGES toggle in the special-access patch; apps that legitimately download quietly in the background (e.g. podcast auto-updates) will surface notifications or fail at the attempt — smoke test per app. |  |
| [Remove special-access permissions](#remove-special-access-permissions) | Strips the app's special-access declarations — usage-history surveillance, overlay tapjacking, all-files access, the dropper channel and settings hijacking; removal means the app can never reach its Settings grant state. All removals are on by default — open the patch options (gear) to keep specific ones. | • PACKAGE_USAGE_STATS<br>• SYSTEM_ALERT_WINDOW<br>• MANAGE_EXTERNAL_STORAGE<br>• MANAGE_MEDIA<br>• REQUEST_INSTALL_PACKAGES<br>• WRITE_SETTINGS |
| [Remove surveillance service declarations](#remove-surveillance-service-declarations) | Strips the BIND_* family — system-signature declarations no third-party app can ever be granted, kept in the manifest only as intent markers for accessibility scraping, device admin, notification listening and keylogging. All removals are on by default — open the patch options (gear) to keep specific ones. | • BIND_ACCESSIBILITY_SERVICE<br>• BIND_DEVICE_ADMIN<br>• BIND_NOTIFICATION_LISTENER_SERVICE<br>• BIND_INPUT_METHOD |
| [Silence app logging](#silence-app-logging) | Nops every logging call site — android.util.Log writers, System.out/err print and println, and Throwable.printStackTrace — so tokens, credentials and PII never reach the logcat ring buffer, where adb, bug reports and forensic capture read them. Bundled wrappers like Timber funnel through android.util.Log and are silenced transitively. Log-based debug features and in-app log viewers go empty — that is the point. | • Silence android.util.Log<br>• Silence System.out / System.err<br>• Silence printStackTrace |

</details>

<!-- PATCHES_END -->

## 📜 License

o0b Patches are licensed under the GNU General Public License v3.0
