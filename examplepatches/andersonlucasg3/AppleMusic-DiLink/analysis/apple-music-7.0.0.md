# Apple Music 7.0.0 (Android) — Análise estática

**Alvo:** `com.apple.android.music` versionName `7.0.0`, versionCode `1614`
**Objetivo:** subsidiar um repositório de patches Morphe (fork do ReVanced) para rodar em head unit BYD DiLink 3.0 (Android 9/10, API 28/29), landscape/panorâmico, sem GMS e sem Play Integrity.
**Data da análise:** 2026-11-03
**Escopo:** somente leitura. Nenhum APK foi modificado, nenhum patch foi implementado.

---

## 0. Proveniência do artefato (como o APK foi obtido)

Todas as URLs "humanas" dos espelhos estavam atrás de Cloudflare (`403`, `server: cloudflare`, `cf-ray: ...`) a partir deste ambiente, e o TLS do `curl.exe`/`WinHTTP` estava quebrado no sandbox (`schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS`). O caminho que funcionou foi a **API pública do APKPure usada pelo `apkeep`**.

| Passo | Evidência |
|---|---|
| Endpoint de versões: `https://api.pureapk.com/m/v3/cms/app_version?hl=en-US&package_name=com.apple.android.music` | Definido em `tools/_probe/consts.rs` (`APKPURE_VERSIONS_URL_FORMAT`), obtido de `https://raw.githubusercontent.com/EFForg/apkeep/master/src/consts.rs` |
| Headers obrigatórios: `x-cv: 3172501`, `x-sv: 29`, `x-abis: ...`, `x-gp: 1` | `tools/_probe/apkpure.rs` linhas 18–41 |
| **Descoberta crítica:** com `x-sv: 29` (API 29) a API devolve só até `5.2.1`. Com `x-sv: 30` devolve `7.0.0`/`vc=1614` | `tools/_probe/versions.pb` (0 ocorrências de `7.0.0`) vs `tools/_probe/versions_sv30.pb` (35 versões, topo `7.0.0`) |
| Resposta é protobuf; a URL assinada vem no campo `download.pureapk.com/b/XAPK/...` | `tools/parse700.py` |
| A URL assinada caiu (`302`) em `data.winudf.com/XAPK/...` e entregou 119.188.711 bytes | `server: tencent-cos`, tamanho idêntico ao campo `s=119188711` da API |

**Integridade conferida:** o SHA-1 do arquivo baixado (`9f45131a62a8357c7ce2cee8366396081af96eda`) é **idêntico** ao SHA-1 declarado pela própria API do APKPure na entrada da versão 7.0.0. Tamanho também idêntico ao declarado. A data de upload declarada na resposta (`2026-10-30T10:35:47+00:00`) confere com 30/10/2026.

Arquivos e hashes (também em `apks/apple-music-7.0.0/SHA256SUMS.txt`):

| Arquivo | Bytes | SHA-256 | SHA-1 |
|---|---|---|---|
| `AppleMusic_7.0.0_apkpure.xapk` | 119.188.711 | `e8cc2650cac9788122bf91edc339d6d96bbbf3eac2c90e4c2a97ec955c6581b1` | `9f45131a62a8357c7ce2cee8366396081af96eda` |
| `splits/com.apple.android.music.apk` (base) | 79.546.986 | `41c12111ef6fdac9ed4b61ad38e48b7dd33bc65adbedf1dd1459b1bce31a8cec` | `3872c63c59b1ac96e64f0b4649f018ed215ad605` |
| `splits/config.arm64_v8a.apk` | 39.196.949 | `53c88cbaf5cb58f116d4fe5417c99cd435f6d76fd5883e2bbcaf46f03a5ab150` | `85d38e5463effc33b1a50857c7a330067325b110` |
| `splits/config.mdpi.apk` | 373.367 | `134c863c85aa07b23ee6b97ed842dcb47ec96bbe3a380c21fa45fe71c39286cb` | `a46ddc35e16c4884ad59dc5dc5e7fd5ec018a576` |
| `splits/manifest.json` (metadado XAPK) | 2.686 | `2aeb0b45a6903c0fb09f5fb67936af15f69871bd7f362763d0814eaadc5cd449` | `a4708a8bdcca6b9599b49426db07fd4708b8a0df` |

O `manifest.json` do próprio XAPK declara exatamente `version_code: 1614`, `version_name: 7.0.0`, `min_sdk_version: 30`, `target_sdk_version: 36`, `split_configs: ["config.arm64_v8a","config.mdpi"]` — coerente com o que o `aapt2` extrai do APK (ver §1).

> **Não há split `config.xxhdpi`.** O XAPK entregue pelo APKPure traz apenas `config.mdpi` como split de densidade. O base APK, porém, já contém as densidades 160/240/320/480/640 (ver §1), então isso não impediu a análise.

---

## 1. Identidade

Fonte autoritativa: `aapt2 dump badging` sobre o base APK → `analysis/_evidence/aapt2_badging_base.txt`.

| Campo | Valor | Evidência |
|---|---|---|
| package | `com.apple.android.music` | `aapt2_badging_base.txt:1` |
| versionName | `7.0.0` | `aapt2_badging_base.txt:1` |
| versionCode | `1614` | `aapt2_badging_base.txt:1` |
| minSdkVersion | **30** | `aapt2_badging_base.txt:2`; `<uses-sdk android:minSdkVersion="30">` em `analysis/jadx_res/resources/AndroidManifest.xml` |
| targetSdkVersion | **36** | `aapt2_badging_base.txt:3` |
| compileSdkVersion | **36** (`platformBuildVersionCode=36`, codename `16`) | `aapt2_badging_base.txt:1` |
| sharedUserId | `com.apple.android` | `manifest_decoded_summary.txt` §ROOT |
| ABIs | **somente `arm64-v8a`** | `native-code: 'arm64-v8a'` no badging de `config.arm64_v8a.apk` |
| launchable-activity | `com.apple.android.music.common.MainActivity` | `aapt2_badging_base.txt:92` |
| application class | `com.apple.android.music.AppleMusicApplication` | `manifest_decoded_summary.txt` §application |

### Splits existentes

| Split | Bytes | Conteúdo |
|---|---|---|
| `base` (`com.apple.android.music.apk`) | 79.546.986 | 4 dex (`classes.dex` 9.855.972; `classes2.dex` 10.621.404; `classes3.dex` 8.134.412; `classes4.dex` 8.177.216), `resources.arsc`, `res/`, `assets/` |
| `config.arm64_v8a` | 39.196.949 | 25 `.so` em `lib/arm64-v8a/` |
| `config.mdpi` | 373.367 | 379 entradas `res/` + `resources.arsc` |

Split manifests **não** declaram `uses-sdk` nem `uses-permission` (verificado por `aapt2 dump xmltree --file AndroidManifest.xml` em ambos); apenas `versionCode`, `split`, `splitTypes` e `hasCode=false`. Ou seja: **só o manifest do base carrega o `minSdkVersion`** — relevante para o patch de minSdk (§6.4).

### Volume de código

`analysis/_evidence/dexscan.txt`:

- 41.756 classes definidas; 157.290 strings únicas nos 4 dex.
- Pacotes por nº de classes: `com/apple/android/music` 10.021; `com/apple/mediaservices/amskit` 1.400; `com/google/android/exoplayer2` 1.203; `com/google/android/gms` 1.164; `com/apple/mediaservices/amsuikit` 658; `com/google/protobuf` 348; `com/google/android/material` 286; `androidx/glance/*`.
- 90% do app é **R8 com repackage classes**: pacotes de uma letra (`q8`, `w0`, `Rb`, `J4`, `Se`, `k8`, `O`, `la`, `p1`, `b0`, `ja`, `z0`, `w9`…). Isso é decisivo para a estratégia de patch: **fingerprints por string de null-check do Kotlin sobrevivem** (ex.: `"createStandard(...)"`, `"prepareIntegrityToken(...)"`), mas nomes de classe obfuscados não são estáveis entre versões.

### Bibliotecas nativas (`config.arm64_v8a`)

`libAMSKit.so` (9,0 MB), `libCoreADI.so`, `libCoreFP.so`, `libCoreLSKD.so`, `libFPDIFor3P.so` (FairPlay/FPDI), `libandroidappmusic.so`, `libmedialibrarycore.so` (14,1 MB), `libmediaplatform.so`, `libdaapkit.so`, `libstoreapi.so`, `libicudata_sv_apple.so` (10,2 MB), `libicui18n_sv_apple.so`, `libicuuc_sv_apple.so`, `libcrashlytics*.so` (4 arquivos), `libxml2.so`, `libdispatch.so`, `libBlocksRuntime.so`, `libc++_shared.so`, `librenderscript-toolkit.so`, `libandroidx.graphics.path.so`, `libdatastore_shared_counter.so`.

---

## 2. Manifest

Fonte: `analysis/jadx_res/resources/AndroidManifest.xml` (decodificado pelo jadx, com enums **resolvidos para nome**), sumarizado em `analysis/_evidence/manifest_decoded_summary.txt` e `analysis/_evidence/activity_table.md`. O dump bruto do `aapt2` está em `analysis/_evidence/manifest_xmltree.txt`.

> **Nota metodológica (importante):** o `aapt2 xmltree` imprime `screenOrientation` como **inteiro** (`3`, `1`…). Ler esse inteiro como "portrait" é um erro fácil: em `ActivityInfo`, `LANDSCAPE=0`, `PORTRAIT=1`, `USER=2`, `BEHIND=3`, `SENSOR_PORTRAIT=7`, `LOCKED=14`. Toda a tabela abaixo usa os nomes simbólicos do manifest decodificado, não os inteiros.

### `screenOrientation` das 32 activities

`analysis/_evidence/activity_table.md` (íntegra). Resumo:

- **23 activities sem `screenOrientation`** (inclui `MainActivity`, o launcher).
- **8 activities com `behind`**: `ConnectPostDetailPageActivity`, `SocialWebActivity`, `AccountSettingsSubscriptionActivity`, `ChoosePictureActivity`, `StaticHtmlActivity`, `ManageDownloadedContentActivity`, `EQActivity`, `ConsumptionOnlyActivity`.
- **1 activity com `portrait`**: `com.apple.android.music.mli.MLIChromeTabActivity` (linha 22 da tabela) — `exported=true`, `singleTop`.

Nenhuma activity usa `landscape`, `sensor`, `fullSensor`, `locked` ou `user` no manifest.

### `resizeableActivity`

- `<application android:resizeableActivity="true">` — definido **uma única vez**, no application (`manifest_decoded_summary.txt`).
- Todas as 32 activities: `(unset)` — nenhuma sobrescreve.

### `supports-screens`

**Não existe** elemento `<supports-screens>` no manifest (`manifest_decoded_summary.txt` → seção `<supports-screens>` vazia). O `aapt2` deriva o default: `supports-screens: 'small' 'normal' 'large' 'xlarge'` (`aapt2_badging_base.txt:113`).

### `configChanges`

Padrão dominante: `screenSize|orientation` (activities 1–5, 8, 14–19 e widgets). Exceções relevantes:

- `FullScreenVideoActivity`: conjunto completo — `fontScale|fontWeightAdjustment|grammaticalGender|layoutDirection|density|smallestScreenSize|screenSize|uiMode|screenLayout|orientation|navigation|keyboardHidden|keyboard|locale|mnc|mcc`.
- `MainActivity`: **nenhum** `configChanges` → é **recriada** em rotação.
- `SonosAuthActivity` / `SdkAuthActivity`: `smallestScreenSize|screenSize|uiMode|screenLayout|orientation|keyboardHidden`.

### `uses-feature`, `uses-library`, `queries`

`uses-feature` explícito — **apenas um**: `android.hardware.camera` com `required="false"` (`manifest_decoded_summary.txt`).

Features **implícitas** reportadas pelo `aapt2` (`aapt2_badging_base.txt:96-107`):

```
uses-feature: android.hardware.bluetooth      (implícita: permissão BLUETOOTH)
uses-feature: android.hardware.faketouch      (default de todo app)
uses-feature: android.hardware.location       (implícita: ACCESS_COARSE_LOCATION)
uses-feature: android.hardware.screen.portrait  (implícita: "one or more activities have specified a portrait orientation")
uses-feature: android.hardware.wifi           (implícita: ACCESS_WIFI_STATE + CHANGE_WIFI_STATE)
uses-feature-not-required: android.hardware.camera
```

→ **Não** há `android.hardware.touchscreen` (só `faketouch`), **não** há `leanback`, **não** há `android.hardware.type.automotive`. Mas há a linha 104: **`android.hardware.screen.portrait` implícita**, causada exclusivamente por `MLIChromeTabActivity`. Isso é exatamente o tipo de feature que faz o Play filtrar o app em telas landscape-only.

`uses-library` (todas `required=false`) — `manifest_decoded_summary.txt`:

- `androidx.window.extensions`
- `androidx.window.sidecar`
- `android.ext.adservices`

`queries` — o bloco completo está em `analysis/jadx_res/resources/AndroidManifest.xml` linhas 36–75:

- 22 `<package>`: `com.snapchat.android`, `com.facebook.katana`, `com.instagram.android`, `com.google.android.apps.messaging`, `com.whatsapp`, `com.apple.android.music.classical` (+ `.qa`, `.development`), `com.google.android.gm`, `com.facebook.orca`, `org.telegram.messenger`, `com.google.android.apps.maps`, `com.google.android.gms.policy_cast_dynamite`, `com.apple.android.music`, `com.apple.atve.androidtv.appletv`, `com.shazam.android`.
- 5 `<intent>`: `VIEW` http, `VIEW` https, `DISPLAY_AUDIO_EFFECT_CONTROL_PANEL`, `IMAGE_CAPTURE`, `com.android.vending.billing.InAppBillingService.BIND`, `com.google.android.apps.play.billingtestcompanion.BillingOverrideService.BIND`.
- 1 `<provider>`: `androidx.car.app.connection.provider` / authority `androidx.car.app.connection`.

### Permissões (29, do manifest)

`INTERNET`, `READ_EXTERNAL_STORAGE`, `WRITE_EXTERNAL_STORAGE`, `WAKE_LOCK`, `MODIFY_AUDIO_SETTINGS`, `ACCESS_WIFI_STATE`, `CHANGE_WIFI_STATE`, `CHANGE_NETWORK_STATE`, `ACCESS_NETWORK_STATE`, `BLUETOOTH`, `com.google.android.apps.photos.permission.GOOGLE_PHOTOS`, `READ_CONTACTS`, `DOWNLOAD_WITHOUT_NOTIFICATION`, `FOREGROUND_SERVICE`, `FOREGROUND_SERVICE_DATA_SYNC`, `FOREGROUND_SERVICE_MEDIA_PLAYBACK`, `POST_NOTIFICATIONS`, `ACCESS_COARSE_LOCATION`, `RECEIVE_BOOT_COMPLETED`, `com.android.vending.BILLING`, `USE_BIOMETRIC`, `USE_FINGERPRINT`, `com.google.android.c2dm.permission.RECEIVE`, `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE`, `com.google.android.gms.permission.AD_ID`, `ACCESS_ADSERVICES_ATTRIBUTION`, `ACCESS_ADSERVICES_AD_ID`, `com.apple.android.music.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` (declarada com `protectionLevel=0x2`).

Nenhuma `uses-permission-sdk-23`.

### Componentes

**Services (21)** — os do app: `player.MediaPlaybackService` (`exported=true`, `foregroundServiceType=mediaPlayback`), `download.controller.DownloadService` (`dataSync`), `settings.services.MediaTransferService`, `icloud.ICloudApiService`, `pushnotifications.controllers.PushNotificationsService` (`exported=true`), `settings.services.DownloadManagerMigrationStepService`.
Os demais são de biblioteca: `androidx.glance.appwidget.GlanceRemoteViewsService`, `androidx.work.*`, `androidx.room.MultiInstanceInvalidationService`, `androidx.credentials.playservices.CredentialProviderMetadataHolder`, `com.google.firebase.components.ComponentDiscoveryService`, `com.google.firebase.sessions.SessionLifecycleService`, `com.google.firebase.messaging.FirebaseMessagingService`, `com.google.android.gms.cast.framework.ReconnectionService`, `com.google.android.gms.auth.api.signin.RevocationBoundService`, `com.google.android.gms.measurement.AppMeasurementService`, `AppMeasurementJobService`, `androidx.core.widget.RemoteViewsCompatService`, `com.google.android.datatransport.*` (2).

**Receivers (22)** — 6 widgets (`AppleMusicWidget`, `RecentlyPlayedWidgetProvider`, `RecommendationsWidgetProvider`, `ChartsWidgetProvider`, `PinsWidgetReceiver`, `RadioWidgetReceiver`), `UpgradeReceiver`, `NotificationBroadcastReceiver`, `PartnerInstallReceiver` (`exported=true`), `androidx.mediarouter.media.MediaTransferReceiver`, `androidx.glance.*` (3), `androidx.car.app.notification.CarAppNotificationBroadcastReceiver`, `androidx.work.*` (3), `com.google.android.gms.cast.framework.media.MediaIntentReceiver`, `com.google.firebase.iid.FirebaseInstanceIdReceiver` (`exported=true`), `com.google.android.gms.measurement.AppMeasurementReceiver`, `androidx.profileinstaller.ProfileInstallReceiver`, `com.google.android.datatransport.*`.

**Providers (6)**: `androidx.core.content.FileProvider` (`com.apple.android.music.provider`), `ArtworkContentProvider` (`.ArtworkProvider`), `WidgetImageProvider`, `androidx.startup.InitializationProvider`, `com.google.firebase.provider.FirebaseInitProvider`, `com.apple.mediaservices.amskit.device.AMSStableIdentifier` (`com.apple.android.music.ams.stable`).

**Activity-alias**: `com.apple.android.music.deeplink` → target `MainActivity`, `exported=true`.

### meta-data relevantes

| Nome | Valor | Evidência |
|---|---|---|
| `android.max_aspect` | **2.4** | `manifest_decoded_summary.txt` §META-DATA |
| `com.google.android.gms.car.application` | `@xml/auto_app_description` | idem |
| `com.google.android.play.billingclient.version` | `9.1.0` | idem |
| `com.android.vending.splits.required` | `true` | idem |
| `com.android.stamp.source` | `https://play.google.com/store` | idem |
| `com.google.android.gms.cast.framework.OPTIONS_PROVIDER_CLASS_NAME` | `com.apple.android.music.player.mediarouter.cast.CastOptionsProvider` | idem |
| `firebase_crashlytics_collection_enabled` | `false` | idem |
| `android.webkit.WebView.MetricsOptOut` | `true` | idem |
| `androidx.credentials.CREDENTIAL_PROVIDER_KEY` | `androidx.credentials.playservices.CredentialProviderPlayServicesImpl` | idem |

`res/xml/auto_app_description.xml`:

```xml
<automotiveApp>
    <uses name="media"/>
</automotiveApp>
```

→ o app declara **Android Auto / media browser** (`com.google.android.gms.car.application`). Não é Car App Library de templates, é projeção de mídia. Relevante apenas como plano B no head unit, não como UI nativa.

---

## 3. Dependências Google

### (a) Google Play Services (`com.google.android.gms.*`)

Presente: **1.164 classes definidas** de `com/google/android/gms` (`dexscan.txt`), 1.473 strings de marcador.

Uso **real pelo código da Apple** (imports em `com/apple/**`):

| API | Onde | Evidência |
|---|---|---|
| `GoogleApiAvailability` (repackaged como `p226ke.C5291e`, extends `C5292f`) | checagem de disponibilidade do GMS que **gateia o Play Integrity** | `analysis/jadx_src/sources/p226ke/C5291e.java` (importa `com.google.android.gms.common.api.GoogleApiActivity`); chamada em `com/apple/android/music/utils/C4184h.java:1102-1107` |
| Cast framework (`com.google.android.gms.cast.CastDevice`, `MediaInfo`, `MediaError`; `internal.cast.*`) | `com/apple/android/music/player/mediarouter/cast/CastManager.java` (`createCastContextWithRetry`), `CastOptionsProvider` | imports encontrados em 15 arquivos de `com/apple/**`; `CastManager.java:649,677` |
| `com.google.android.gms.common.api.Status` | callbacks do Cast | 4 imports |
| `com.google.android.gms.internal.measurement.*` | Firebase Analytics (transitivo) | 15 imports de `C4643i2`, `K4`, `H4`, `O5`, `K5`, `InterfaceC4736v5`, `C4715s5` |
| `com.google.android.gms.internal.play_billing.*` | Play Billing (transitivo de `com.android.billingclient`) | 5 imports |
| `com.google.android.gms.auth.api.signin.internal.SignInHubActivity` | **somente manifest-merged**; nenhum import de `com.google.android.gms.auth.*` em `com/apple/**` | `activity_table.md` #28 + ausência de imports |
| `com.google.android.gms.measurement.AppMeasurementService/JobService/Receiver` | manifest-merged pelo Firebase Analytics | `manifest_decoded_summary.txt` |

### (b) Firebase / FCM

Classes definidas: 176 strings de `com/google/firebase` (`dexscan.txt`). Uso real:

- **FCM** — a classe do app `com.apple.android.music.pushnotifications.controllers.PushNotificationsService` **estende** `com.google.firebase.messaging.FirebaseMessagingService` (`PushNotificationsService.java:105`). Chamadas a `FirebaseMessaging.getInstance().getToken()`:
  - `com/apple/android/music/AMApplicationObserver.java:442`
  - `com/apple/android/music/AMApplicationObserver.java:545`
  - `com/apple/android/music/pushnotifications/PushNotificationsHandler.java:522`
- **Crashlytics** — 83 referências a `FirebaseCrashlytics` em `com/apple/**`; nota-se 27 imports diretos. Exemplo de uso: `com/apple/android/music/utils/C4174c.java:57` (`recordException` quando o Integrity dá timeout).
- **Analytics / Installations / datatransport / sessions** — registrados via `com.google.firebase.components.*Registrar` no manifest e `FirebaseInitProvider` (`manifest_decoded_summary.txt` §META-DATA).
- `firebase_crashlytics_collection_enabled=false` no manifest, mas o código chama `recordException` explicitamente.

### (c) Play Integrity / SafetyNet

**SafetyNet: ausente.** Não há `com.google.android.gms.safetynet` nem `SafetyNet` no dex. As ocorrências de "Attestation" que aparecem na busca são **FairPlay/FPDI da Apple** (`FPDIAttrSetAttestationMode`, `com.apple.mediaservices.amskit.AMSErrorCode$FairPlay`), tecnologia distinta.

**Play Integrity (Standard API): presente e ativo.** Cadeia completa rastreada:

1. **Entrada no app:** `com.apple.android.music.bootstrapper.amskit.GooglePlayIntegrityProvider` (compilado em `p095e7/i.java`) implementa `com.apple.mediaservices.amskit.fairplay.IExternalAppIntegrityProvider`. Em `getAppIntegrityToken()` (`p095e7/i.java:34-70`) chama `new C4174c().a(...)`, e:
   - se o resultado for `null` → **retorna `null`** (linha 66-68). Ou seja, existe caminho de degradação graciosa já embutido.
   - senão → `new IExternalAppIntegrityProvider.AppIntegrityData(str, AppPermissionsTypeAdapter.VOICE_SEARCH_APP)` (linha 69).
2. **Gerenciador:** `com.apple.android.music.utils.AppIntegrityManager` (compilado em `C4174c.java` + `C4176d.java` + `C4178e.java`, os dois últimos são as continuações de corrotina; `@e(c="com.apple.android.music.utils.AppIntegrityManager", f="AppIntegrityManager.kt", l={37})` em `C4176d.java:3`).
   - `C4174c.java:35-37`: `if (!C4184h.w(context)) return null;` — **gate de disponibilidade do GMS**.
   - `C4174c.java:39-43`: timeout de 5000 ms (`H1.g.u(5000L, Ij.c.MILLISECONDS)`).
   - `C4174c.java:56-59`: em timeout, `FirebaseCrashlytics...recordException(new a("Play Integrity token request timed out after 5000ms"))`.
3. **Chamadas Play Core (repackaged):** em `C4178e.java`:
   - `Nf.e.f13494a` (singleton) → `Nf.c` → `cVar.f13493a.b()` com null-check `"createStandard(...)"` (`C4178e.java:96`) — corresponde a `IntegrityManagerFactory.createStandard(context)`.
   - `bVar.a(new Nf.x())` com null-check `"prepareIntegrityToken(...)"` (`C4178e.java:110`).
   - `cVar2.a(new Nf.y(oVar))` com null-check `"request(...)"` (`C4178e.java:124`).
   - token final em `((Nf.b.AbstractC0136b) obj).a()` (`C4178e.java:122,129`).
4. **Parâmetros da requisição** (`analysis/jadx_src/sources/Nf/x.java:5` e `:28`):
   - `PrepareIntegrityTokenRequest{cloudProjectNumber=**843686588413**, webViewRequestMode=0, sessionId=null}` — este é o projeto Google Cloud da Apple.
   - `StandardIntegrityTokenRequest{requestHash=null, verdictOptOut=**<set vazio>**}` (`Nf/y.java:28`; `Sf/o.java` mostra `size()==0`, `hashCode()==0`). Ou seja, **nenhum veredito é suprimido**: o app não usa `VERDICT_OPT_OUT`.
5. **Identificação do pacote obfuscado:** `Nf` é o Play Core Integrity repackaged pelo R8. Prova: `Nf/a.java:19` concatena a URL `https://developer.android.com/google/play/integrity/reference/com/google/android/play/core/integrity/model/StandardIntegrityErrorCode.html#` para montar mensagens de erro. `Sf.*` são as classes internas do play-core (component provider).
6. **Consumo no AMSKit:** o token vira `AMSCore::IExternalAppIntegrityProvider::AppIntegrityData` e é injetado na sessão nativa via `Session.setExternalAppIntegrityProvider` / `SessionBuilder.setExternalAppIntegrityProvider` (`com/apple/mediaservices/amskit/bindings/SessionBuilder.java:36`, `Session.java:87`), adaptado por `ExternalAppIntegrityProviderAdaptor.java`.

### (d) Play Core in-app updates

- `com/google/android/play/core/appupdate`: **0 referências** no dex (`dexscan.txt` → marcador `play_core_appupdate` ausente).
- `com/google/android/play/core/review`: 1 string; `com/google/android/play/agesignals`: 1 string; `com/google/android/play/core/common`: 2 strings.
- `PlayCoreDialogWrapperActivity` e `AgeSharingConsentWrapperActivity` estão no manifest (`activity_table.md` #32 e #29), mas o **único** import de `com.google.android.play.*` em `com/apple/**` é de `PlayCoreDialogWrapperActivity` em `com/apple/android/music/common/activity/BaseActivity.java:104` — provavelmente só para contexto de diálogo.
- Conclusão: **não há fluxo de in-app update nem de in-app review implementado pelo app**. Os componentes Play Core no manifest são sobra de dependência e são candidatos naturais a remoção (§6).

---

## 4. UI / stack e comportamento em telas largas

### Stack é **Views**, não Compose

- `layout/` contém **1.252 XMLs**; `analysis/jadx_res/resources/res/layout` (contagem direta). Nomes como `activity_main.xml`, `fragment_player_main.xml`, `library_main.xml`, `small_list_d_item.xml`, `epoxy_recyclerview_layout.xml`.
- **ViewBinding/DataBinding:** 38 classes `androidx/databinding/*`; `MainActivity.java:959` faz `androidx.databinding.g.e(this, R.layout.activity_main)`; existe `com/apple/android/music/DataBinderMapperImpl.java` mapeando `layout-*/*` → confirma ViewBinding gerado.
- **Epoxy (Airbnb)**: 147 classes `com/airbnb/epoxy/*` (`AsyncEpoxyController`, `Carousel`, …). Todos os controllers de tela são `*EpoxyController` (ex.: `ListenNowEpoxyController`, `RadioEpoxyController`, `MultiRoomEpoxyController`).
- **RecyclerView** 251 strings, **Fragment** 192, **AppCompat** 161, **Material Components** 286 classes.
- **Compose**: apenas **57 classes** `androidx/compose/*` — são `AndroidCompositionLocals_androidKt`, `ComposeView`, `PointerInputEventHandler`, `PreviewActivity`. `androidx/compose/foundation` = 3 strings, `androidx/compose/runtime` = 2. Ou seja: Compose entra **somente** como dependência transitiva do **Glance** (199 strings `androidx/glance/*`), que é usado para os **widgets de tela inicial** (`glance_*.xml`), não para a UI do app.

→ Implicação para o fork: qualquer adaptação de layout será em **XML + resource qualifiers**, não em Compose.

### Há suporte nativo a tablet/landscape

Diretórios com qualificador presentes no base APK (`analysis/jadx_res/resources/res/`):

| Qualificador | Conteúdo |
|---|---|
| `layout-sw600dp/` (8) | `activity_library.xml`, `fragment_global_search.xml`, `fragment_search.xml`, `fragment_search_library.xml`, `library_details_header.xml`, `song_credits_page_header.xml`, `design_layout_snackbar.xml`, `mtrl_layout_snackbar.xml` |
| `layout-w600dp/` (23) | `activity_main.xml`, `library_main.xml`, `fragment_music_content.xml`, `music_player.xml`, `toolbar_collapsing_actionbar.xml`, `small_list_d_item.xml` + `small_list_d_{start,mid,end}[_collection].xml` (item em 3 colunas), `collection_page_list_item.xml`, `header_page_e/f.xml`, etc. |
| `layout-w600dp-land/` (1) | `bottom_navigation.xml` |
| `layout-w600dp-port/` (1) | `bottom_navigation.xml` |
| `layout-land/` (8) | `video_controller.xml`, `paragraph_a2_body.xml`, `appwidget_player_*`, material pickers |
| `values-w600dp/` | `bools.xml`, `dimens.xml`, `drawables.xml`, `styles.xml` |
| `values-w600dp-land/`, `values-w600dp-port/` | `bools.xml`, `dimens.xml`, `integers.xml` |
| `values-sw600dp/`, `values-sw720dp/`, `values-w600dp-h720dp/` | dimens/integers/styles |
| `values-h360dp-land/`, `values-h480dp-land/`, `values-w320dp-land/` | dimens/integers (`values-h480dp-land`) |
| `drawable-sw600dp/`, `drawable-w600dp/`, `menu-sw600dp/` | recursos |
| buckets de largura | `w360dp`, `w400dp`, `w410dp`, `w460dp`, `w501dp`, `w600dp`, `w675dp`, `w700dp`, `w720dp`, `w727dp`, `w735dp`, `w830dp`, `w834dp`, `w982dp`, `w1024dp`, `w1135dp`, `w1195dp`, `w1501dp`, **`w2501dp`** |

Flags em `bools.xml` (o mecanismo central de adaptação):

```xml
<!-- values-w600dp/bools.xml -->
<bool name="isWideViewportVideoPlayer">true</bool>
<bool name="is_tablet">true</bool>
<bool name="useNavigationDrawer">true</bool>

<!-- values-land/bools.xml -->
<bool name="is_portrait">false</bool>
```

`is_tablet` é lido em **18 pontos** do código, ex.: `com/apple/android/music/utils/j1.java:167`, `common/BaseActivityFragment.java:2106`, `listennow/ListenNowEpoxyController.java:5876`, `radio2/RadioEpoxyController.java:2285`, `collection/mediaapi/controller/b.java:253,632,660,688,696,707`, `library2/LibraryUpsellEpoxyController.java:134`, `search2/SearchLandingEpoxyController.java:564`. `useNavigationDrawer` em `common/fragment/MusicContentFragment.java:1232,1563,1647`.

`strings` `sw600dp` também aparecem no dex (`dexscan.txt`: 6 em `classes2.dex`), via `DataBinderMapperImpl.java:1110,1185,1200,1202,1258,1351` — é o mapeamento do ViewBinding para `layout-sw600dp/*`.

Além disso, `values-w600dp/dimens.xml` redefine medidas de tela larga (ex.: `now_playing_artwork_margin_horizontal=78dp` vs. valor de telefone; `mini_player_max_width=420dp`; `header_page_h_aspect_ratio=2.28`). `values-sw600dp/integers.xml` define `playlist_flow_column_count=3`.

**Conclusão:** a UI **já sabe** ser tablet/landscape, desde que `smallestWidth >= 600dp` (o que ativa `values-w600dp`) e desde que a activity **possa** ficar em landscape.

### Código que força orientação (os dois únicos pontos)

**1) `MainActivity` — o gate principal.** `analysis/jadx_src/sources/com/apple/android/music/common/MainActivity.java:937-945`:

```java
m1.f51371b.getClass();
com.apple.android.music.utils.K kX = m1.x();
if (kX == com.apple.android.music.utils.K.FOLDABLE) {
    Integer numY = m1.y();
    kX = (numY == null || numY.intValue() >= 600) ? K.TABLET : K.PHONE;
}
boolean z10 = kX == com.apple.android.music.utils.K.TABLET;
Objects.toString(kX);
setRequestedOrientation(z10 ? -1 : 7);     // -1 = UNSPECIFIED | 7 = SENSOR_PORTRAIT
```

O classificador, `com/apple/android/music/utils/m1.java:505-529`:

```java
public static K x() {
    if (AppleMusicApplication.a.a().getPackageManager()
            .hasSystemFeature("android.hardware.sensor.hinge_angle")) return K.FOLDABLE;
    Integer numY = y();
    if (numY != null) return numY.intValue() >= 600 ? K.TABLET : K.PHONE;
    return K.TABLET;
}

public static Integer y() {
    Context contextA = AppleMusicApplication.a.a();
    DisplayManager displayManager = ... ;
    Display display = displayManager != null ? displayManager.getDisplay(0) : null;
    if (display == null) return null;
    Point point = new Point();
    display.getCurrentSizeRange(point, new Point());   // outSmallestSize
    return Integer.valueOf(p368ri.a.b(point.x / contextA.getResources().getDisplayMetrics().density));
}
```

`com/apple/android/music/utils/K.java` define `SMALLEST_WIDTH_TABLET = 600` e o enum `PHONE(0) / TABLET(1) / FOLDABLE(2)`.

**Leitura:** o app só libera rotação se `menor_lado_px / density >= 600` (ou se for foldable com `hinge_angle`). Em head unit 1280×720:
- a `density = 1.0` (160 dpi) → 720 ≥ 600 → **TABLET** → orientação livre;
- a `density = 1.5` (240 dpi) → 480 < 600 → **PHONE** → `setRequestedOrientation(7)` = **SENSOR_PORTRAIT** → app travado em retrato numa tela landscape.

Esse é o mecanismo que quebra no DiLink, e é 100% dependente da densidade reportada pelo head unit — não é um valor fixo no APK. `y()` usa `Display.getDisplay(0)`; em unidades com múltiplos displays (cluster + central), o índice 0 pode não ser o display principal (UNVERIFIED quanto ao comportamento no DiLink).

**2) Share/story.** `analysis/jadx_src/sources/com/apple/android/music/common/actionsheet/Q.java:164` → `activity.setRequestedOrientation(14)` (`LOCKED`) em `onCreateView` (`dialog_share_story_loader`), e `:206` → `setRequestedOrientation(-1)` ao sair. Afeta só o fluxo de compartilhar story.

Além desses três `setRequestedOrientation` (o único símbolo encontrado em todo o dex: `dexscan.txt` → `setRequestedOrientation` = 1 string em `classes2.dex`), **não há** nenhum uso de `getRequestedOrientation`, `Configuration.ORIENTATION_LANDSCAPE` ou `ORIENTATION_PORTRAIT` no código da Apple (verificado por grep em `com/apple/**`).

### `android:max_aspect = 2.4`

`manifest_decoded_summary.txt` §META-DATA. Em API 26+ isso limita a proporção da janela. Uma tela panorâmica de head unit com proporção > 2.4:1 sofreria letterbox. Candidato a patch (§6.1).

### Densidade e o split `mdpi`

O XAPK só trouxe `config.mdpi`. O base APK já contém densidades 160/240/320/480/640 (`aapt2_badging_base.txt:116`), então a UI funciona, mas em telas de alta densidade alguns drawables virão do base em vez de um split dedicado. Para o head unit (tipicamente 160–240 dpi) isso é irrelevante.

---

## 5. API level gates (risco para minSdk 28/29)

O app foi compilado com `minSdk=30`, então **não existe nenhuma checagem `SDK_INT >= 30`** — o código *assume* API 30. Isso é o ponto central do risco de rebaixar `minSdk`.

Varredura completa: **apenas 32 referências a `Build.VERSION.SDK_INT` em todo `com/apple/**`** (`grep` em `analysis/jadx_src/sources/com/apple`) — 30 comparações diretas + 2 leituras hoisted para variável local (`CustomTextView.java:358` → `i10 >= 36` na linha 359; `replayinapp/j.java:184` → `i10 >= 31` na linha 185):

| Gate | Qtde | Exemplos (arquivo:linha) |
|---|---|---|
| `>= 36` | 1 | `common/views/CustomTextView.java:359` (hoisted; `LineBreakConfig`, `PrecomputedText.Params.getLineBreakConfig`) |
| `>= 35` | 3 | `NewPlaylistFragment.java:800`; `FullScreenVideoActivity.java:693`; `ShareLyricsActionSheetFragment.java:967` |
| `< 35` | 2 | `PlayerActivity.java:214` |
| `>= 34` | 2 | `DownloadService.java:748`; `ExtensionsKt.java:268` |
| `>= 33` | 7 | `AMApplicationObserver.java:1032`; `player/d1.java:106`; `ListPreferenceFragment.java:291`; `ExtensionsKt.java:330,390,406`; `AMSOKHTTPMetricsListener.java:54` |
| `< 33` | 2 | — |
| `> 32` | 2 | `NotificationsUpsellFragment.java:69,86` |
| `>= 31` | 8 | `PlaylistEditFragment.java:1325,1382,2434`; `PlaylistEditViewModel.java:978`; `MainActivity.java:892`; `MediaPlaybackService.java:283`; `utils/m1.java:451` (`new Font.Builder(Font)` vs `Font.Builder(ByteBuffer)`); `replayinapp/j.java:185` (hoisted) |
| `< 31` | 4 | `PlaylistEditFragment.java:1436,1481`; `NotificationBroadcastReceiver.java:100`; `PushNotificationsService.java:311` |
| `<= 30` | 1 | `NotificationBroadcastReceiver.java:186` |

Notar: **nenhum `>= 30`** e **nenhum `>= 29`/`>= 28`**. Ou seja, tudo que é API 30+ e não está listado acima está **sem proteção**.

### Os gates mais críticos (na prática, para API 28/29)

**5.1 — `EmojiSearchFragment`: uso de API 30 sem nenhuma checagem (achado concreto)**

`analysis/jadx_src/sources/com/apple/android/music/common/views/EmojiSearchFragment.java`, classe interna `a` (`ViewTreeObserver.OnGlobalLayoutListener`), método `onGlobalLayout()` linhas 54–105:

```java
// linha 82
boolean zIsVisible = windowInsets.isVisible(WindowInsets.Type.ime());      // API 30
// linha 85
int i10 = windowInsets.getInsets(WindowInsets.Type.ime()).bottom;          // API 30
// linha 92
int i11 = windowInsets.getInsets(WindowInsets.Type.navigationBars()).bottom; // API 30
// linha 104
window.setDecorFitsSystemWindows(false);                                   // API 30
```

Não há `SDK_INT` em nenhuma linha deste arquivo. Em API 28/29 → `NoSuchMethodError`/`NoClassDefFoundError` ao abrir o seletor de emoji. É o bloqueio de minSdk **mais objetivo** que encontrei.

**5.2 — `getInstallSourceInfo` (API 30) está protegido por `catch (Throwable)`**

`analysis/jadx_src/sources/com/apple/android/music/utils/C4182g.java:32-40`:

```java
try {
    installingPackageName = contextA.getPackageManager()
        .getInstallSourceInfo(contextA.getPackageName()).getInstallingPackageName();
} catch (Throwable unused) {
    installingPackageName = null;
}
```

`NoSuchMethodError` é `Error`, e `Error` é `Throwable` → é capturado. Cai no ramo `!"com.android.vending".equals(null)` → abre URL web em vez de `market://`. **Degrada bem** em API 28/29 e, de quebra, já é o comportamento desejado num ambiente sem Play Store. (Mesmo padrão em `bc/a.java:62`, da lib de Install Referrer.)

**5.3 — `WindowInsetsController` / `WindowMetrics` / `setDecorFitsSystemWindows`**

Presentes no dex como *referências* (`dexscan.txt`): `WindowInsetsController` 4 strings, `WindowMetrics` 6, `getCurrentWindowMetrics` 1, `setDecorFitsSystemWindows` 1. As ocorrências em `com/apple/**` estão **dentro de androidx** (`p088e/*`, `p468x2/*`, `p447w0/*`) e em `androidx.window.*` — que fazem suas próprias checagens de versão. O único uso direto e sem guarda em código do app é o 5.1.

**5.4 — `androidx.window.extensions` / `sidecar`**

Declarados como `uses-library required=false` — em API 28/29 simplesmente não existem e o `androidx.window` cai no fallback. Não bloqueia.

**5.5 — Superfície de risco não enumerável só por `SDK_INT`**

`WindowInsets.Type` (usado em 5.1) é `int`/classe aninhada de API 30; `Display.getCurrentSizeRange` é API 17 (ok); `ForegroundServiceStartNotAllowedException` e `TelephonyCallback` aparecem no dex mas não no código da Apple.

---

## 6. Candidatos a patch (fingerprints)

> Convenção: **VERIFIED** = há evidência direta no código citado; **UNVERIFIED** = inferência plausível que ainda não foi confirmada por execução.

### 6.1 Rotação / landscape (objetivo principal)

| # | Alvo | Evidência | Por quê | Status |
|---|---|---|---|---|
| R1 | `com.apple.android.music.common.MainActivity` — `onCreate`, `setRequestedOrientation(z10 ? -1 : 7)` | `MainActivity.java:945`; `z10` de `m1.x()` em `:938-943` | Único ponto que trava a UI principal em `SENSOR_PORTRAIT`. Forçar `z10`/`TABLET` (ou trocar o literal `7` por `-1`) libera rotação em qualquer densidade | **VERIFIED** |
| R2 | `com.apple.android.music.utils.m1.x()` | `m1.java:505-515` | Retornar sempre `K.TABLET` neutraliza o classificador na origem — cobre R1 **e** qualquer outro consumidor futuro de `x()`. Fingerprint estável: `hasSystemFeature("android.hardware.sensor.hinge_angle")` (`:507`) + constante `600` (`:512`) + `K.TABLET` (`:514`) | **VERIFIED** |
| R3 | `com.apple.android.music.utils.m1.y()` | `m1.java:517-529` | Alternativa a R2: forçar retorno `>= 600`. Fingerprint: `display.getCurrentSizeRange(point, new Point())` (`:527`) | **VERIFIED** |
| R4 | `AndroidManifest.xml`: remover `android:screenOrientation="portrait"` de `com.apple.android.music.mli.MLIChromeTabActivity` | `activity_table.md` linha 22; `aapt2_badging_base.txt:104-105` | Elimina a feature implícita `android.hardware.screen.portrait` que o aapt2 deriva. **Esse é o único motivo** da feature; sem ela, o app deixa de se declarar portrait-only | **VERIFIED** (causa) |
| R5 | `AndroidManifest.xml`: `android:max_aspect` de `2.4` | `manifest_decoded_summary.txt` §META-DATA | Telas panorâmicas > 2.4:1 fariam letterbox. Elevar para razão maior | **UNVERIFIED** — depende da proporção real do DiLink |
| R6 | `com.apple.android.music.common.actionsheet.Q.onCreateView` — `setRequestedOrientation(14)` | `Q.java:164` (restaura em `:206`) | Trava em `LOCKED` durante o share de story; se a activity já estiver landscape, pode causar recriação/letterbox | **VERIFIED** (código) / efeito **UNVERIFIED** |

Observação para R1–R3: `MainActivity` **não** declara `configChanges`, então em rotação ela é **recriada** (perde estado do player na UI, mas `MediaPlaybackService` é foreground service e mantém a reprodução). Se o objetivo for rotação "sem recriar", é preciso *também* um patch de manifest adicionando `configChanges`.

### 6.2 GMS bypass (rodar sem Play Services)

| # | Alvo | Evidência | Por quê | Status |
|---|---|---|---|---|
| G1 | `com.apple.android.music.utils.C4184h.w(Context)` | `C4184h.java:1102-1107` | `return GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(ctx) == 0` (via `p226ke.C5291e.b(context, C5292f.f62599a)`), com `C5292f.f62599a = 12451000` (`C5292f.java:30`) — a constante de versão do GMS, útil como fingerprint. Forçar `false` faz o `AppIntegrityManager` **já existente** retornar `null` pelo caminho previsto (`C4174c.java:35-37`) | **VERIFIED** |
| G2 | `AppleMusicApplication` — inicialização de Firebase/FCM | `AMApplicationObserver.java:442,545` (`FirebaseMessaging.getInstance().getToken()`); `PushNotificationsService.java:105` | Sem GMS, `getToken()` falha/rejeita e o serviço de push não registra; verificar se exceção é engolida | **UNVERIFIED** — precisa checar o tratamento dos callbacks |
| G3 | Manifest: `com.google.firebase.provider.FirebaseInitProvider`, `FirebaseMessagingService`, `FirebaseInstanceIdReceiver`, `com.google.android.gms.measurement.*`, `com.google.android.datatransport.*`, `androidx.credentials.playservices.*`, `com.google.android.play.core.common.PlayCoreDialogWrapperActivity`, `com.google.android.play.agesignals.AgeSharingConsentWrapperActivity` | `manifest_decoded_summary.txt` §SERVICES/RECEIVERS/PROVIDERS/ACTIVITIES | Componentes de biblioteca que só existem para GMS/Firebase. Removê-los enxuga o startup e evita `ClassNotFoundException`/crash em receivers disparados pelo sistema | **VERIFIED** (existência) / efeito **UNVERIFIED** |
| G4 | `com.apple.android.music.BaseActivity` — uso de `PlayCoreDialogWrapperActivity` | `com/apple/android/music/common/activity/BaseActivity.java:104` | Se for só `getIntent()`/contexto de diálogo, remover componente é seguro; se for `startActivity`, precisará de guarda | **UNVERIFIED** — precisa ler o uso completo |
| G5 | Cast | `player/mediarouter/cast/CastManager.java` (`createCastContextWithRetry`), `CastOptionsProvider` (manifest meta-data) | Cast exige GMS. Sem GMS, `CastContext` lança. O código tem retry (`CastManager.java:649,677`) — pode entrar em loop | **UNVERIFIED** — o retry pode mascarar falha permanente |

### 6.3 Play Integrity bypass

| # | Alvo | Evidência | Por quê | Status |
|---|---|---|---|---|
| I1 | `com.apple.android.music.utils.C4174c.a(Continuation)` (AppIntegrityManager.requestIntegrityToken) | `C4174c.java:15-62`, em especial `:35-37` (gate) e `:60-61` (retorno) | Fazer retornar `null` incondicionalmente usa o caminho que **o próprio app já trata** (`p095e7/i.java:66-68` devolve `null` → AMSKit recebe `optional` vazio) | **VERIFIED** (código) / aceitação pelo servidor **UNVERIFIED** |
| I2 | `com.apple.android.music.bootstrapper.amskit.GooglePlayIntegrityProvider.getAppIntegrityToken` | `p095e7/i.java:34-70` | Forçar `return null` na entrada é mais cirúrgico e não depende do obfuscado `Nf.*` | **VERIFIED** |
| I3 | Play Core Integrity repackaged (`Nf.*`): `createStandard` → `prepareIntegrityToken` → `request` | `C4178e.java:96,110,124`; identificação em `Nf/a.java:19` | Se for necessário interceptar mais fundo (ex.: para devolver token falso), o alvo é `Nf.b.a(Nf.x)` / `Nf.b.c.a(Nf.y)`. **Nomes não são estáveis** entre versões (R8) — fingerprint recomendado: `PrepareIntegrityTokenRequest{cloudProjectNumber=` e `StandardIntegrityTokenRequest{requestHash=` (`Nf/x.java:28`, `Nf/y.java:28`) | **VERIFIED** (existência) |
| I4 | `cloudProjectNumber = 843686588413` | `Nf/x.java:5` | Constante útil como **fingerprint de detecção** e para validar que o alvo é o Play Integrity da Apple | **VERIFIED** |
| I5 | `verdictOptOut` = conjunto vazio | `Nf/y.java:28`, `Sf/o.java` (`size()==0`) | O app **não** suprime vereditos; não existe flag de "opt-out" já ligada que pudesse ser explorada | **VERIFIED** |
| I6 | `libAMSKit.so` / `IExternalAppIntegrityProvider` | `SessionBuilder.java:36`, `Session.java:87`, `ExternalAppIntegrityProviderAdaptor.java` | Se o servidor da Apple **exigir** o token, o bypass em Java não basta e o trabalho migra para o nativo (`libAMSKit.so`, 9 MB, C++/JavaCPP) | **UNVERIFIED** — requer teste de login contra o servidor |

Observação importante: **SafetyNet não existe neste app**; o `Attestation` que aparece é FairPlay/FPDI (`AMSErrorCode$FairPlay.FailedFPDIAttrSetAttestationMode`, `FPDIAttrSetAttestationMode`). Não confundir os dois ao escrever os patches.

### 6.4 minSdk 30 → 28/29

| # | Alvo | Evidência | Por quê | Status |
|---|---|---|---|---|
| M1 | `<uses-sdk android:minSdkVersion="30">` no manifest **do base** | `manifest_decoded_summary.txt` §uses-sdk; splits **não** têm `uses-sdk` (verificado por `aapt2 xmltree`) | Só há um lugar a mudar. Sem isso o app nem instala em API 28/29 | **VERIFIED** |
| M2 | `EmojiSearchFragment$a.onGlobalLayout()` — 4 chamadas API 30 sem guarda | `EmojiSearchFragment.java:82,85,92,104` | Crash garantido (`NoSuchMethodError`) em API 28/29 ao abrir o seletor de emoji. Precisa de guarda `SDK_INT >= 30` com fallback (`ViewCompat.getRootWindowInsets`/`WindowInsetsCompat`) | **VERIFIED** |
| M3 | `targetSdkVersion="36"` | `aapt2_badging_base.txt:3` | Manter 36 em API 28 é aceitável, mas muda comportamento de permissões/receivers. Se o objetivo é previsibilidade no DiLink, avaliar rebaixar target também (decisão de produto) | **UNVERIFIED** |
| M4 | Varredura sistemática de API 30+ em bytecode | — | O grep por `SDK_INT` (30 refs) cobre o código Kotlin/Java da Apple, mas **não** cobre chamadas cujo resultado é usado só em bibliotecas nem caminhos raros (widgets, video, share). Falta uma passada por *method references* do dex contra a tabela de APIs por nível | **UNVERIFIED** — trabalho pendente |
| M5 | `minSdk` nas splits | `aapt2 dump xmltree` em `config.arm64_v8a` e `config.mdpi` | Confirmado: **não** declaram `uses-sdk`, então herdam do base. Não é preciso patchá-las para minSdk | **VERIFIED** |

### 6.5 Restrição de ABI (não é patch, é pré-requisito de instalação)

O conjunto só tem `arm64-v8a` (badging do split + `lib/arm64-v8a/*`). Se o head unit for `armeabi-v7a` ou `x86`, **nenhum patch resolve** — seria necessário outro artefato. Verificar com `adb shell getprop ro.product.cpu.abi`. Status do ABI do DiLink: **UNVERIFIED** (não há dispositivo conectado: `adb devices` vazio).

---

## 7. Lacunas e o que falta verificar

1. **ABI do head unit** — `adb devices` retorna lista vazia neste ambiente. Sem `ro.product.cpu.abi` não é possível confirmar que `arm64-v8a` serve. Não houve acesso a dispositivo.
2. **`density` e `smallestWidth` reais do DiLink** — determinam se `m1.x()` cai em PHONE ou TABLET. É a variável que decide se R1/R2 são necessários.
3. **Exigência do token de Integrity pelo servidor da Apple** — o código tem caminho de degradação, mas se o backend rejeitar requisições sem `AppIntegrityData`, o bypass Java (I1/I2) não resolve e o alvo passa a ser `libAMSKit.so`.
4. **Comportamento de `CastManager.createCastContextWithRetry` sem GMS** — pode haver loop de retry; não foi analisado o limite de tentativas (`CastManager.java:649,677` apenas anuncia as corrotinas de retry).
5. **`BaseActivity` e `PlayCoreDialogWrapperActivity`** — uso exato não lido (só o import).
6. **Varredura exaustiva de API 30+ por reference-table** — só o grep de `SDK_INT` foi feito; uma análise por *method refs* do dex está pendente.
7. **Densidade:** só `config.mdpi` veio no XAPK; não foi verificado se o APKPure serve `config.xxhdpi`/`xhdpi` com outro `x-abis`/parâmetro.
8. **`is_portrait`** está declarado (`values/bools.xml` true, `values-land/bools.xml` false) mas **não é lido por nenhum código Java** (só aparece em `R.java:1833` e nos XMLs de values). Se ele é usado por DataBinding em algum layout, não foi localizado — possivelmente resíduo.

---

## Anexos (evidências brutas)

| Arquivo | Conteúdo |
|---|---|
| `analysis/_evidence/aapt2_badging_base.txt` | `aapt2 dump badging` do base APK (116 linhas) |
| `analysis/_evidence/manifest_xmltree.txt` | `aapt2 dump xmltree` do AndroidManifest (899 linhas, valores numéricos) |
| `analysis/_evidence/manifest_decoded_summary.txt` | manifest decodificado + parser estruturado (208 linhas) |
| `analysis/_evidence/activity_table.md` | tabela das 32 activities |
| `analysis/_evidence/dexscan.txt` | contagem de classes/strings e marcadores por dex |
| `analysis/_evidence/defined_classes.txt` | 41.756 descritores de classe |
| `analysis/_evidence/dex_strings.txt` | 157.290 strings únicas do dex |
| `analysis/jadx_res/resources/AndroidManifest.xml` | manifest com enums simbólicos (830 linhas) |
| `analysis/jadx_src/sources/**` | 24.519 arquivos `.java` (117 MB) — decompilação completa |
| `analysis/dex/classes*.dex` | os 4 dex extraídos para inspeção |
| `apks/apple-music-7.0.0/SHA256SUMS.txt` | SHA-256 + SHA-1 + tamanho de cada artefato |
| `tools/` | `dl.mjs`, `post.mjs`, `dexscan.py`, `parse_manifest.py`, `parse_manifest2.py`, `parse700.py`, `jadx/`, `apkeep.exe` |

Ferramentas usadas: `jadx 1.5.6` (release oficial, SHA-256 do zip `545ea2be…e8974` confere com o publicado), `aapt2` do build-tools 36.0.0 do SDK local, `apkeep 1.1.0` (só para descobrir a API; o download em si falhou nele por causa do TLS do sandbox).
