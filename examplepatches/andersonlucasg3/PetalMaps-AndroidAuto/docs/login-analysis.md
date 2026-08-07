# Analise de Fluxo de Login — Petal Maps 4.7.0.322

**Data:** 2025-07-14
**Contexto:** APK reassinado com patch Morphe. Botao de login (conta Huawei) nao faz nada.

---

## (A) Cadeia de Chamadas do Botao de Login

### 1. UI: MineFragment (perfil/mycenter)

**Arquivo:** com/huawei/maps/app/setting/ui/fragment/MineFragment.java

Handler onClick() na linha 1772: se id == R.id.avatar_frame, login_des, display_name
ou avatar → t0() dispara o login.

### 2. t0() — entrada do fluxo (MineFragment.java:673-694)

- Checa rede (K0()); se offline, mostra toast e sai
- Cria OnAccountSuccessListener (r) e OnAccountFailureListener (q)
- d4.a().silentSignIn(this.r, this.q)
- OnFailure (q) → T0(exc) → startActivityForResult(d4.a().getAccountIntent(), 1000)

### 3. d4.a() — AccountFactory (defpackage/d4.java:9-12)

return up2.g(a81.c()) ? a.g() : b.n();

- up2.g() = isHuaweiPhone() → le ro.product.manufacturer via SystemProperties
- COM ManufacturerCheckBypassPatch (up2.g() → true): retorna a.g() = HwPhoneAccountHelper
- SEM patch em dispositivo nao-Huawei: retorna b.n() = ThirdPartyPhoneAccountHelper

### 4. a.java — HwPhoneAccountHelper (Huawei ID Auth)

Arquivo: com/huawei/maps/businessbase/utils/account/a.java

silentSignIn() em a.java:382-399:
- Se ja logado → sucesso imediato
- Se servico nulo → falha imediata
- Senao → this.a.silentSignIn() [HuaweiIdAuthServiceImpl] → doWrite() → bind AIDL ao HMS Core

### 5. b.java — ThirdPartyPhoneAccountHelper (Account Picker)

Arquivo: com/huawei/maps/businessbase/utils/account/b.java

silentSignIn() em b.java:556-568:
- Se ja logado → sucesso
- Se tem refresh token → refresh via backend Petal Maps
- Senao → falha → getAccountIntent() → AccountPickerService.signIn()
  → Intent para AccountPickerSignInHubActivity
---

## (B) Causa Mais Provavel do Nada Acontece

### Hipotese: ManufacturerCheckBypassPatch forca caminho Huawei ID Auth,
### que NAO tem fallback WebView quando HMS Core ausente.

### B.1 Caminho Huawei ID (com patch ativo)

1. silentSignIn() → HuaweiIdAuthServiceImpl.silentSignIn() (linha 110-128)
2. Cria HuaweiIdSignInRequest → doWrite() → HuaweiApi.a() → RequestHandler
   → BaseHmsClient.connect() tenta bind AIDL ao HMS Core (com.huawei.hwid)
3. SEM HMS Core → onConnectionFailed → Task falha
4. Callback k() em a.java:178-211 → onFailureListener
   → MineFragment.T0() → startActivityForResult(getAccountIntent(), 1000)
5. getAccountIntent() retorna Intent para HwIdSignInHubActivity

### B.2 HwIdSignInHubActivity — SEM fallback WebView

**Arquivo:** com/huawei/hms/hwid/internal/ui/activity/HwIdSignInHubActivity.java:232-246

private void a() {
    q.a(this, callback);  // verifica HMS Core
    // callback.onComplete(i):
    //   i==0 → b() → abre AccountPickerSignInHubActivity
    //   i!=0 → a(i) → setResult(0) + finish()  ← FALHA SILENCIOSA
}

q.a() (em com/huawei/hms/hwid/q.java:14-28):
- isHuaweiMobileServicesAvailable() retorna 1 (SERVICE_MISSING)
- NAO eh erro resolvivel → onComplete(1) → a(1) → finish()

**HwIdSignInHubActivity NUNCA chama getSignInIntentByH5() nem abre WebView.**
Activity transparente (setContentView nunca chamado) → usuario ve flicker ou nada.

6. MineFragment.onActivityResult() (linha 1705-1729): task falha → V1() reseta UI

**RESULTADO: HwIdSignInHubActivity abre e fecha em ms, UI volta ao estado inicial.**

### B.3 Contraste: Account Picker TEM fallback WebView

**Arquivo:** AccountPickerSignInHubPresenter.java:308-326

public void checkMinVersion() {
    if (i == 0) startSignInActivity(getApkSignInIntent(), ...);  // HMS OK
    else if (1 != i) onSignInFailed(i);
    else getSignInIntentByH5();  // i==1 → HMS CORE NAO INSTALADO → ABRE WEBVIEW!
}

getSignInIntentByH5() → AccountLiteSdkServiceImpl.signInH5() → WebViewActivity
OAuth no browser, **sem depender do app com.huawei.hwid.**

**Este caminho FUNCIONARIA sem HMS Core, mas nosso patch o desvia.**

### Cronologia do nada acontece

| Tempo | Evento |
|-------|--------|
| T+0ms | Toque no botao → t0() → silentSignIn() |
| T+0ms | HuaweiIdAuthServiceImpl.silentSignIn() → doWrite() → bind AIDL |
| T+~2-5s | Bind AIDL falha (HMS Core ausente) → Task.onFailure |
| T+~5s | T0() → startActivityForResult(getAccountIntent()) |
| T+~5s | HwIdSignInHubActivity abre (transparente) |
| T+~5.1s | isHuaweiMobileServicesAvailable() → 1 → finish() |
| T+~5.2s | onActivityResult() → task falha → V1() reseta UI |
---

## (C) Onde a Assinatura do App eh Lida no Fluxo de Autenticacao

### C.1 HiPkgSignManager.getInstalledAppHash()
**Arquivo:** com/huawei/secure/android/common/sign/HiPkgSignManager.java:99-101
Usa getPackageInfo(str, 64) → signatures[0].toByteArray() → SHA-256.
Usado por ValidProviderUtil (g0b.java) para verificar **OUTROS APKs**
(HMS Core, AppGallery, CarComing). **NAO verifica o Petal Maps.**

### C.2 PackageManagerHelper.getPackageSignature()
**Arquivo:** com/huawei/hms/utils/PackageManagerHelper.java:71-77
Usado pelo SDK HMS para verificar assinatura do **HMS Core**. Nao afeta o Petal Maps.

### C.3 HMSPackageManager fingerprints
**Arquivo:** com/huawei/hms/utils/HMSPackageManager.java
Fingerprints hardcoded de com.huawei.hwid. Verifica se HMS Core eh legitimo.
**Nao afeta o Petal Maps.**

### C.4 SafetyDetectClient.sysIntegrity()
**Arquivo:** com/huawei/hms/support/api/safetydetect/a.java
Envia SHA-256 do APK ao servidor. **Nao chamado no fluxo de login.**

### C.5 HuaweiIdSignInRequest + client info (x.java:22-47)
String appId = Util.getAppId(context);          // 102457337
String packageName = context.getPackageName();  // com.huawei.maps.app
**Assinatura NAO incluida no request!**

### Conclusao sobre assinatura

**A assinatura do APK NAO eh lida client-side no fluxo de login.**
O certificado eh verificado SERVER-SIDE pelo HMS Core (se instalado)
via PackageManager do system_server.

NAO ha ponto para patch de spoof de assinatura no fluxo de login —
porque o app nao le a propria assinatura nesse caminho.

Se o backend recusar o token: so seria spoofavel com **LSPosed**
hookando PackageManager.getPackageInfo() no processo com.huawei.hwid.

---

## (D) Avaliacao: Patch no APK Basta ou Precisa LSPosed?

### D.1 Correcao do nada acontece: BASTA patch no APK

O problema eh **auto-infligido pelo ManufacturerCheckBypassPatch**.

**SOLUCAO RECOMENDADA: Patch em d4.java metodo a()**

ANTES (d4.java:11):
  return up2.g(a81.c()) ? a.g() : b.n();

DEPOIS:
  return b.n();  // sempre usa Account Picker (tem fallback WebView H5)

**SMALI ALVO:** d4.smali — metodo a()L...AccountApi;
- Remover invoke-static {v0}, Lup2;->g(...)Z
- Remover branch if-eqz
- Deixar invoke-static {}, Lb;->n()... + areturn-object

### D.2 Compatibilidade com patches existentes

| Patch | Impacto no login |
|-------|-----------------|
| AntiRepackPatch (SecurityDetect.irpj → false) | Essencial; OK |
| ManufacturerCheckBypassPatch (up2.g → true) | **PROBLEMA** — remove fallback WebView |
| HiPkgSignManager / ValidProviderUtil | OK — verificam outros APKs |

### D.3 Cenario futuro: se backend recusar o token OAuth

1. Tentar sem patch de assinatura — fluxo H5 pode ser mais permissivo.
2. Se falhar: **LSPosed** hook em PackageManager.getPackageInfo() no processo
   com.huawei.hwid retornando assinatura original.
   SHA-256 original: ddab0c1db857b116ab1f7a41583f8b452a609cdbd9a2ef088f5592d6fadb5cff

---

## (E) Resumo Executivo

| Questao | Resposta |
|---------|----------|
| Causa do nada acontece | ManufacturerCheckBypassPatch forca a.g() (Huawei ID Auth). HwIdSignInHubActivity NAO tem fallback WebView. Account Picker b.n() tem fallback signInH5() mas nao eh alcancado. |
| Local exato da falha | HwIdSignInHubActivity.java:232-246 → a() → q.a() → HMS ausente → a(i) → finish() sem abrir UI |
| Assinatura no fluxo | NAO eh lida client-side. Verificada pelo HMS Core (system_server) ou backend. |
| Patch necessario | Modificar d4.java:a() para retornar b.n() em vez de a.g() |
| Precisa LSPosed? | **NAO** para o problema atual. So se backend recusar tokens OAuth H5. |

---

## (F) Referencias de Arquivos e Linhas

| Arquivo | Linhas | Descricao |
|---------|--------|-----------|
| defpackage/d4.java | 9-12 | AccountFactory: decide a.g() vs b.n() |
| defpackage/up2.java | 140-169 | g(): isHuaweiPhone() via ro.product.manufacturer |
| .../account/a.java | 276-285, 382-399 | HwPhoneAccountHelper.silentSignIn() |
| .../account/b.java | 301-313, 556-568 | ThirdPartyAccountHelper: getAccountIntent() / silentSignIn() |
| .../MineFragment.java | 673-694, 1204-1207, 1705-1729, 1772-1781 | t0(), T0(), onActivityResult(), onClick() |
| .../HwIdSignInHubActivity.java | 120-173, 232-246 | onCreate(), a(): check HMS + fallback |
| .../hwid/q.java | 14-28 | isHuaweiMobileServicesAvailable() |
| .../AccountPickerSignInHubPresenter.java | 308-326 | checkMinVersion(): TEM fallback H5 |
| .../AccountLiteSdkServiceImpl.java | 51-97 | signInH5() → WebViewActivity |
| .../HuaweiIdAuthServiceImpl.java | 95-128 | silentSignIn() → doWrite() |
| .../HuaweiApi.java | 508-521 | doWrite() → bind AIDL ao HMS Core |
| .../hwid/x.java | 22-47 | Intent com appId + packageName |
| .../HiPkgSignManager.java | 80-101 | getInstalledAPPSignature() / getInstalledAppHash() |
| defpackage/g0b.java | 11-59 | ValidProviderUtil: providers EXTERNOS |
| .../MapApplication.java | 109-116 | SecurityDetect.irpj() — anti-repack |
| .../SplashActivity.java | 284-301 | enterHome(): bloqueia nao-Huawei |