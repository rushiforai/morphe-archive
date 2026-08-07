# Relatório de Análise Estática — Petal Maps APK

**APK:** `com.huawei.maps.app`  
**Versão:** `4.7.0.322(001)` — versionCode `40700322`  
**Target SDK:** 34 | **Min SDK:** 26 (Android 8.0)  
**ABIs:** `arm64-v8a`, `armeabi-v7a` (APK universal)  
**Fonte:** APKPure  
**Ferramenta:** jadx 1.5.6 | 28.893 classes, ~24.942 arquivos Java gerados  

---

## 1. Identificação

| Campo | Valor |
|-------|-------|
| Package | `com.huawei.maps.app` |
| Launcher Activity | `com.huawei.maps.app.petalmaps.splash.SplashActivity` |
| Application Class | `com.huawei.maps.launch.MapApplication` |
| AppComponentFactory | `androidx.core.app.CoreComponentFactory` |
| Tamanho APK | ~82.8 MB |

---

## 2. Activities e Services Principais

### Activities (não exaustivo — principais)

| Classe | Função |
|--------|--------|
| `.app.petalmaps.splash.SplashActivity` | **Launcher** (MAIN/LAUNCHER + deep links geo/http) |
| `.app.petalmaps.PetalMapsActivity` | Activity principal do mapa (2.260 linhas) |
| `.auto.splash.activity.SplashActivity` | Splash HiCar (`huawei.intent.action.hicar.MAP`) |
| `.auto.activity.AutoPetalMapsActivity` | Activity HiCar (1.221 linhas, UI automotiva completa) |
| `.privacy.activity.PrivacyActivity` | Aceite de privacidade |
| `.launch.activity.DeeplinkDispatchActivity` | Deep links (`mapapp://`, `petalmaps://`) |
| `.app.fastcard.CardMainActivity` | Fast card / widget |
| `.app.wxapi.WXEntryActivity` | Integração WeChat |
| `.mediapicker.MediaPickerActivity` | Seleção de mídia |
| `.imagepicker.activity.ImagePickerActivity` | Seleção de imagens |
| Várias `.setting.*` | Configurações (ambiente, feedback, wearable) |

### Services

| Classe | Função |
|--------|--------|
| `.hicar.service.HiCarService` | Callback HiCar (start/stop/removeCard) |
| `.auto.navi.floatingwindow.service.FloatingWindowService` | Janela flutuante modo carro |
| `.navi.service.NaviForegroundService` | Navegação foreground |
| `.app.navigation.service.NavFloatingWindowService` | Janela flutuante de navegação |
| `.app.navigation.service.NavNotificationService` | Notificações de navegação |
| `.voice.ipc.MapControlService` | Controle de voz (HwVoiceAssistant) |
| `.businessbase.push.MessagePushService` | HMS Push |
| `.offline.service.OfflineDataService` | Dados offline |
| `.locationshare.service.LocationShareService` | Compartilhamento de local |
| `.team.service.TeamLocationShareService` | Localização em equipe |
| `.transportation.service.TransportNaviService` | Navegação de transporte público |

---

## 3. Verificações de Assinatura / Anti-Tamper ⚠️ CRÍTICO

### 3.1 `SD.irpj()` — Detecção Nativa de Repack (OBSTÁCULO #1)

**Arquivo:** `com/huawei/maps/launch/MapApplication.java:109-116`  
**Implementação nativa:** `com.huawei.secure.android.common.detect.SecurityDetect.irpj()` → `libaegissec.so`

```java
public static void g() {
    boolean zIrpj = SecurityDetect.irpj();
    if (!zIrpj || "china".equals(a81.b().getAppFlavor())) {
        return;
    }
    Process.killProcess(Process.myPid());  // MATA o processo!
}
```

- Chamado no `MapApplication.onCreate()` via `TaskExecutor` em thread secundária
- `irpj` = **I**ntegrity **R**e**p**ackage **J**oint — verifica se o APK foi reempacotado/reassinado
- Se detectar repack e o flavor **não for** `"china"` → `Process.killProcess()`
- O flavor padrão é `"product"`, NÃO `"china"` — portanto a proteção está ATIVA
- **Mitigação necessária:** patch no bytecode para neutralizar esta chamada (substituir `irpj()` por retorno `false` ou remover a condicional)

### 3.2 `HiPkgSignManager` — Gerenciador de Assinatura Huawei Secure SDK

**Arquivo:** `com/huawei/secure/android/common/sign/HiPkgSignManager.java`

- `getInstalledAppHash()` — SHA-256 da assinatura via `getPackageInfo(str, 64)`
- `getInstalledAppHashV2V3()` — API 28+: usa `signingInfo.getApkContentsSigners()` + `getSigningCertificateHistory()`
- `doCheckArchiveApk()` / `doCheckInstalled()` — compara hash SHA-256 com o do APK
- Usado por `ValidProviderUtil` (`defpackage/g0b.java`) para verificar providers com fingerprints hardcoded

### 3.3 `HMSPackageManager` — Verificação HMS com Fingerprints Hardcoded

**Arquivo:** `com/huawei/hms/utils/HMSPackageManager.java`

- **Fingerprints hardcoded** para `com.huawei.hwid` e `com.huawei.hwid.tv` (SHA-256)
- Verificação multi-camada: V3 (`d()`), DSS (`a(Bundle,...)`), V2 (`a(String,String)`)
- Valida CNs hardcoded: `"Huawei CBG Application Integration CA"`, `"Huawei CBG HMS"`
- Valida OUs: `"Huawei CBG"`, `"Huawei CBG Cloud Security Signer"`
- Verifica `META-INF/HUAWEI.CER` no APK do HMS Core
- **Relevância:** apenas em dispositivos com HMS Core instalado

### 3.4 `ReadApkFileUtil` — Verificação do MANIFEST.MF e HUAWEI.CER

**Arquivo:** `com/huawei/hms/utils/ReadApkFileUtil.java`

- Sistema de proteção MDM (Mobile Device Management) do HMS Core
- Verifica `META-INF/HUAWEI.CER` com assinaturas RSA:
  - V3: `SHA384withRSA` com chave pública `EMUI11_PK` (2048 bits)
  - V2: `SHA256withRSA` com chave pública `EMUI10_PK` (2048 bits)
  - V1: `SHA256withRSA` com chave pública de 1024 bits
- `verifyApkHash()` — calcula SHA-256 do APK e compara com `ApkHash:` do `HUAWEI.CER`
- Se falhar → HMS marcado como `SPOOF` → erro 29
- **Relevância:** apenas em dispositivos com HMS Core

### 3.5 `SafetyDetectClient.sysIntegrity()` — HMS SafetyDetect

**Arquivo:** `com/huawei/hms/support/api/safetydetect/a.java`

- Envia para servidor Huawei: nonce + appId + SHA-256 do APK + assinatura
- **Possível ponto de falha:** se o backend validar a assinatura do APK, pode recusar um APK reassinado
- Serviço declarado no manifest: `safetydetect:6.7.0.305`

### 3.6 `ValidProviderUtil` — Providers com Fingerprints Hardcoded

**Arquivo:** `defpackage/g0b.java`

| Fingerprint (SHA-256) | Contexto |
|------------------------|----------|
| `76B09489...DFE2E2E` | CarComing |
| `3BAF59A2...B40614F` | AGC default |
| `BC8B6BE3...BD94EF6` | Log caller (mycenter) |

### 3.7 Root / Xposed / Emulator Detection

| Detecção | Arquivo | Método |
|----------|---------|--------|
| **Root (Java)** | `com.huawei.secure.android.common.detect.RootDetect.java` | Busca `su` em 20+ paths, `ro.secure=0`, `test-keys`, Magisk binary |
| **Root (Nativo)** | `libaegissec.so` via `SD.irtj()` | API 27+ |
| **Xposed** | `com.huawei.secure.android.common.detect.XposedDetect.java` | Stack trace + `/proc/{pid}/maps` scan |
| **Emulador** | `RootDetect.java` + `Emui10RootDetect.java` | Build.HARDWARE, FINGERPRINT, MODEL, PRODUCT |
| **HwSecurityDiagnose** | `Emui10RootDetect.java` | API Huawei proprietária `getStpStatusByCategory(8, ...)` |

---

## 4. Dependência HMS Core

### 4.1 Inicialização no MapApplication.onCreate()

```java
// Ordem de inicialização:
1. a81.h(this)                           // contexto global
2. this.mAppFlavor = "product"           // flavor
3. BasicFrameworkInit.init(this)         // SDK Huawei Map BasicFramework
4. System.loadLibrary("map")             // lib nativa do mapa (em thread separada)
5. kc5.b().e()                           // configuração regional
6. AGConnectInstance.initialize(ctx)      // AppGallery Connect
7. g()                                   // SecurityDetect.irpj() — anti-repack
```

### 4.2 Account Kit (HuaweiIdAuth)

- Wrapper em `defpackage/d4.java` (singleton `d4.a()`)
- `silentSignIn()` — usado em ~30+ lugares para login silencioso
- `requestAccountLogin()` — login com código de autorização
- `hasLogin()` — verifica status de login
- **Uso:** `SplashActivity.enterHome()` → `silentSignIn()` para determinar país (China vs outros)
- **Uso:** `AutoPetalMapsActivity` → `silentSignIn()` para rotas, favoritos, commute address
- **Não bloqueante:** app prossegue mesmo se login falhar

### 4.3 Map Kit (Huawei)

- `com.huawei.map.mapapi.HWMap`, `HWMapOptions`, `MapView`, `CustomMapView`
- `MapFragment`, `SupportMapFragment`, `TextureMapView`, `TextureMapFragment`
- `OnMapReadyCallback` → `onMapReady(HWMap)`
- NÃO USA Google Maps — exclusivamente Map Kit Huawei
- Native: `System.loadLibrary("map")` carrega `libmap.so`
- API keys configuradas via `tp2` (config provider)

### 4.4 Outros Kits HMS

| Kit | Status |
|-----|--------|
| Location Kit | `AutoLocationHelper` + `com.huawei.location.lite` |
| Push Kit | `HmsMessaging.setAutoInitEnabled(true)` |
| SafetyDetect | `sysIntegrity()` (envia SHA-256 APK ao servidor) |
| ML Kit | TTS (iFlytek), ASR, tradução |
| Analytics (HiAnalytics) | v3.2.1.500 |
| Awareness Kit | v3.4.0.301 |

### 4.5 Verificação de Dispositivo Huawei

- NÃO usa `HuaweiApiAvailability` ou `isHuaweiMobileServicesAvailable`
- Usa `SystemProperties.get("ro.product.manufacturer")` → `"HUAWEI"` ou `"HONOR"`
- `SplashActivity.enterHome()`: se não for Huawei → mostra diálogo de restrição, não prossegue para o mapa

### 4.6 AGConnect

- `AGConnectInstance.initialize()` no `MapApplication.onCreate()`
- `AGConnectCrash` — crash reporting
- `AGConnectConfig` — remote config (sentinelas de lat/lng)
- AppGallery referrer, AppLinking, APMS

---

## 5. Suporte Veicular Existente

### 5.1 HiCar (Huawei) — SUPORTE COMPLETO ✅

| Componente | Arquivo | Linhas |
|------------|---------|--------|
| `HiCarService` | `com/huawei/maps/hicar/service/HiCarService.java` | 50 |
| `HiCarHelper` (classe `a`) | `com/huawei/maps/hicar/a.java` | 1.182 |
| `HiCarThemeHelper` | `com/huawei/maps/hicar/HiCarThemeHelper.java` | 182 |
| `IHiCarListener` | `com/huawei/maps/hicar/listener/IHiCarListener.java` | 20 |

- Estende `com.huawei.hicarsdk.controller.AbstractCarOperationService`
- Cria cards no painel HiCar, gerencia ciclo de vida, navegação cruise
- Suporta card window (`com.huawei.hicar.map.supportCardWindow = V2.0`)
- Capacidades: `cruiseMode, asrVoice, carCruiseMode`
- Meta-data: `com.huawei.carBaseKit.version = 14.0.2.480`

### 5.2 Pacote `auto` — UI Automotiva Completa

**Diretório:** `com/huawei/maps/auto/` (~300+ arquivos Java)

| Sub-pacote | Conteúdo |
|------------|----------|
| `activity/` | `AutoPetalMapsActivity`, `LicenseActivationTask` |
| `adapter/` | `A88DeviceInfoAdapter`, `CarCenterConsole`, `IAutoDeviceInfoAdapter` |
| `cruise/` | `CruiseFragment`, `CruiseVoiceListener` |
| `common/` | Views específicas para carro (AutoSpeedLayout, LoadErrorView, etc.) |
| `databinding/` | ~200+ classes de data binding com prefixo `Auto` |
| `splash/` | SplashActivity específica para carro |

- Layouts: navegação principal, cruise, busca, favoritos, configurações, offline maps
- Temas: AutoAppTheme, dark/light sincronizado com carro
- `MapStyleManager.MapStyleType.CAR_CONTROL` — estilo de mapa otimizado para carro

### 5.3 Android Auto / AndroidX Car — AUSENTE ❌

- ❌ `androidx.car.app.CarAppService` — nenhuma referência
- ❌ `androidx.car.app.CarContext` — nenhuma referência
- ❌ `CarSession`, `Screen` — nenhuma referência
- ❌ `carx` — nenhuma referência
- ❌ `com.google.android.gms.car` — nenhuma referência

---

## 6. Ofuscação

| Aspecto | Avaliação |
|---------|-----------|
| **Nível** | Moderado (ProGuard/R8) |
| **Classes em `defpackage/`** | 3.969 classes (nomes: `a.java` a `z.java` + combinações 2-3 chars) |
| **Classes preservadas no app** | ✅ Todas em `com.huawei.maps.app.*` preservam nomes originais |
| **MapApplication** | ✅ Nome preservado |
| **SplashActivity** | ✅ Nome preservado |
| **PetalMapsActivity** | ✅ Nome preservado |
| **HiCarService** | ✅ Nome preservado |
| **AutoPetalMapsActivity** | ✅ Nome preservado |
| **Mapping file** | ❌ Ausente no APK (esperado) |
| **Strings criptografadas** | ❌ Não detectado no código Java (strings usam R.string) |
| **Libs nativas** | 17 `.so` por ABI (incluindo `libaegissec.so`, `libsqlcipher.so`) |

### Estrutura do pacote `com.huawei.maps/` (46 sub-pacotes):

```
activation/  app/  aspect/  auto/  basicframework/  bean/
businessbase/  common/  commonui/  constant/  cruise/
dependencycallback/  device/  diymaps/  dynamic/  dynamiccard/
dynamicframework/  feedback/  flavoradapter/  hicar/  hivoicetone/
hwengine/  imagepicker/  launch/  locationshare/  log/
media/  mediapicker/  navi/  offline/  poi/  privacy/
route/  search/  setting/  share/  startup/  tasktransfer/
team/  transportation/  tts/  ugc/  visibletalkable/  voice/
```

---

## 7. Bibliotecas Nativas

| Biblioteca | Provável Função |
|------------|-----------------|
| `libmap.so` | Engine de renderização de mapa Huawei |
| `libnaviClient.so` | Cliente de navegação |
| `libaegissec.so` | **Segurança/Anti-tamper (contém `irpj`, `irtj`, `idj`, `iej`)** |
| `libaeswb.so` | Cifra AES whitebox |
| `libsqlcipher.so` | Banco de dados criptografado |
| `libyoga.so` | Layout engine (Facebook Yoga) |
| `libfb.so` | Biblioteca Facebook (provavelmente para WeChat/Share) |
| `libjslite.so` | JavaScript engine leve |
| `libml-vadenergy.so` | Detecção de voz (ML Kit) |
| `libopus_voicekit.so` | Codec de áudio Opus |
| `libucs-credential.so` | Credenciais UCS |
| `libucs-kms.so` | Key Management Service UCS |
| `libapms_ndk_anr.so` | APMS ANR detection |
| `libnative_crash.so` | Crash reporting nativo |
| `libnative-lib.so` | Código nativo genérico |
| `libGwiVdr.so` | Processamento de vídeo |
| `libTransform.so` | Transformação de coordenadas |

---

## 8. Meta-Data Relevantes

| Meta-Data | Valor |
|-----------|-------|
| `com.huawei.hms.client.appid` | `102457337` |
| `com.huawei.hms.client.cpid` | `101309515` |
| `com.huawei.maps.app.wx.appid` | `wx8b36db64041547e1` |
| `install_channel` | `001` |
| `com.huawei.hicar.map.capability` | `cruiseMode,asrVoice,carCruiseMode` |
| `com.huawei.hicar.supportCardWindow` | `V2.0` |
| `com.huawei.carBaseKit.version` | `14.0.2.480` |
| `data_is_support_hivoice` | `true` |
| `com.huawei.quickcard.sdkVersionName` | `12.4.1.301` |
| `com.huawei.wearengine.sdk.api_level` | `12` |

---

## 9. Operation Types (Regiões)

Definido em `com.huawei.maps.businessbase.network.NetworkConstant$OperationType`:

| Tipo | Descrição |
|------|-----------|
| `CHINA` | China continental |
| `SECOND_CENTER` | Centro secundário |
| `ASPIEGEL` | Global / Europa |
| `RUSSIA` | Rússia |
| `ERROR` | Erro |
| `NO_PERMISSION` | Sem permissão |

---

## 10. Resumo Executivo

| Questão | Resposta |
|---------|----------|
| **Versão exata** | `4.7.0.322(001)` — versionCode `40700322` |
| **Launcher Activity** | `com.huawei.maps.app.petalmaps.splash.SplashActivity` |
| **Application Class** | `com.huawei.maps.launch.MapApplication` |
| **Suporte Android Auto existente** | ❌ NENHUM |
| **Suporte HiCar existente** | ✅ Completo (HiCarService + HiCarHelper 1182 linhas + UI auto completa) |
| **Verificações de assinatura** | ⚠️ SIM, MÚLTIPLAS CAMADAS |
| **Risco de reassinatura** | 🔴 ALTO — requer neutralização do `SD.irpj()` e possivelmente outros checks |
| **Ofuscação** | Moderada, classes principais preservadas |

### Veredito sobre Risco de Verificação de Assinatura

**RISCO ALTO.** O APK contém múltiplas camadas de proteção contra reassinatura e repackaging:

1. **`SD.irpj()` (nativo, `libaegissec.so`)** é o obstáculo mais imediato — mata o processo se detectar repack. Chamado no `MapApplication.onCreate()`. Precisa ser neutralizado via patch no bytecode da chamada.

2. **`HiPkgSignManager`** com fingerprints hardcoded em `ValidProviderUtil` (`g0b.java`). Pode rejeitar providers.

3. **`SafetyDetectClient.sysIntegrity()`** envia SHA-256 do APK ao servidor Huawei. Pode recusar o APK reassinado no lado servidor (mas o app não parece depender criticamente do resultado para funcionar).

4. **Dispositivo não-Huawei**: o `SplashActivity` já bloqueia a entrada se o dispositivo não for Huawei (`ro.product.manufacturer != "HUAWEI"`). Isso precisará ser removido ou bypassado para o patch Android Auto.

5. **Verificação HMS Core** (`HMSPackageManager`, `ReadApkFileUtil`) não deve afetar dispositivos sem HMS Core instalado.

### Pontos de Hook para o Patch

- **`MapApplication.onCreate()`** (linha ~271): neutralizar `g()` → `SecurityDetect.irpj()`
- **`SplashActivity.enterHome()`** (linha ~284): remover verificação `up2.g()` (manufacturer check)
- **Manifest**: adicionar `CarAppService`, meta-data Android Auto, intent-filter `androidx.car.app.CarAppService`
- **Extension dex**: implementar `CarAppService` + `Session` + `Screen` que reutiliza os layouts do pacote `auto` existente
