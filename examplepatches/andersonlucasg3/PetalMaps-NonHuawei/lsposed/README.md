# Petal Maps Hidden API Unlock (módulo LSPosed)

Módulo LSPosed com duas funções para o Petal Maps (`com.huawei.maps.app`):

1. **Isenta hidden APIs** no processo do Petal Maps — a extension injetada no APK
   usa reflexão em APIs `@hide` (`android.window.ScreenCapture`,
   `SurfaceControl.screenshot`).
2. **Concede `android.permission.READ_FRAME_BUFFER` no system_server** — em
   Android 14+, `IWindowManager.captureDisplay` exige essa permissão signature;
   o check resolve no `PermissionManagerService` para o UID do chamador, e o
   módulo o transforma em GRANTED.

## Técnica 1 — isenção de hidden APIs

- Em API 28–33, módulos chamavam `dalvik.system.VMRuntime.setHiddenApiExemptions`
  via meta-reflexão; isso morreu no Android 11 (`PreventMetaReflectionBlocklistAccess`).
- Em Android 14/15 (API 34/35), o método **continua existindo e sem gate de caller**
  no ART ([runtime.h](https://android.googlesource.com/platform/art/+/refs/heads/android15-release/runtime/runtime.h) —
  `Runtime::SetHiddenApiExemptions` apenas substitui a lista), e a lista é consultada
  primeiro para callers de domínio application
  ([hidden_api.cc](https://android.googlesource.com/platform/art/+/refs/heads/android15-release/runtime/hidden_api.cc) —
  `DoesPrefixMatchAny(runtime->GetHiddenApiExemptions())`). O que é bloqueado é o
  *lookup reflexivo* do próprio método.
- Este módulo faz o bootstrap da chamada com a biblioteca oficial do LSPosed
  [LSPosed/AndroidHiddenApiBypass](https://github.com/LSPosed/AndroidHiddenApiBypass)
  (`org.lsposed.hiddenapibypass:hiddenapibypass`, mantida 2021–2025, suporte declarado
  Android 1.0–17): variante `HiddenApiBypass` (Unsafe) com fallback `LSPass`.
  O prefixo `"L"` isenta todas as APIs hidden do processo; os prefixos específicos
  (`ScreenCapture`, `SurfaceControl`, etc.) são redundantes com `"L"`, mas ficam
  listados por clareza.

## Técnica 2 — READ_FRAME_BUFFER no captureDisplay (API 34+)

Cadeia verificada no AOSP (android14- e android15-release):

```
WindowManagerService.captureDisplay
  -> checkCallingPermission(READ_FRAME_BUFFER)   // throw SecurityException se negado
  -> ContextImpl.checkCallingPermission
  -> ActivityManagerService.checkPermission
  -> ActivityManager.checkComponentPermission (static)
  -> IPackageManager.checkUidPermission
  -> ComputerEngine.checkUidPermission           // services/core/.../pm/ComputerEngine.java
  -> PermissionManagerService.checkUidPermission // ponto final da decisão
```

O hook é instalado no **system_server** (escopo System Framework) sobre a classe
`com.android.server.pm.permission.PermissionManagerService`, nos dois overloads que
existem conforme a versão:

- Android 14: `checkUidPermission(int uid, String permName)` (privado)
- Android 15: `checkUidPermission(int uid, String permissionName, int deviceId)` (público)

Um after-hook substitui o resultado por `PERMISSION_GRANTED` quando
`args[1].equals("android.permission.READ_FRAME_BUFFER")` — o método original
executa normalmente (side effects de auditoria preservados); só a decisão muda.
O overload inexistente na versão em uso falha em `findAndHookMethod` e é
ignorado com log (`Permission hook not present on this version: ...`).

**Trade-off documentado**: o grant vale para **qualquer UID** consultando
`READ_FRAME_BUFFER` (não apenas o Petal Maps). Qualquer app que consiga chamar
`captureDisplay` passa a ter o check liberado. Em device pessoal o risco é
baixo; para restringir, filtre por uid no hook (resolva o uid via
`getPackageUid` ou compartilhe-o do processo do app via `XSharedPreferences`).

## Requisitos

- LSPosed 1.9.x (Zygisk) — versão estável mais recente: v1.9.2.
- O módulo usa o formato legacy (manifest meta-data + `assets/xposed_init` +
  `IXposedHookLoadPackage`), suportado por LSPosed 1.8.x–1.10.x.

## Build

O subprojeto é independente do build raiz (que aplica o plugin Morphe) e usa o
wrapper da raiz com o settings próprio:

```bash
cd lsposed && ../gradlew -p . assembleRelease
```

(No Windows: `..\gradlew.bat -p . assembleRelease`.)

- Gradle 9.6.1 (wrapper da raiz), AGP 9.1.0, JDK 21 (JBR do Android Studio,
  fixado em `gradle.properties`), SDK 36 (`local.properties`).
- O APK assinado sai em `lsposed/app/build/outputs/apk/release/app-release.apk`
  (assinado com o debug keystore local — módulo de uso pessoal).

## Instalação e ativação

1. Instale o APK: `adb install lsposed/app/build/outputs/apk/release/app-release.apk`.
2. Abra o LSPosed Manager → **Módulos** → ative **Petal Maps Hidden API Unlock**.
3. No escopo do módulo, marque **com.huawei.maps.app** e **System Framework**
   (o manifest sugere os dois via meta-data `xposedscope`; o item "System
   Framework" corresponde ao package `android` — o LSPosed faz esse mapeamento
   automaticamente para módulos legacy).
4. Reinicie o device (o hook de system_server só entra em vigor no boot do
   system_server) e force parada do Petal Maps.

## Verificação

```bash
adb logcat -s PetalMapsHiddenApi:I
```

No processo do Petal Maps:
`setHiddenApiExemptions: OK` e
`Verification: SurfaceControl.screenshot via reflection ACCESSIBLE`.

No system_server (durante o boot):
`Permission hook installed: com.android.server.pm.permission.PermissionManagerService.checkUidPermission`
(para o overload da sua versão de Android). Quando a captura roda:
`grant READ_FRAME_BUFFER (uid=..., count=1)`.

## Notas

- A isenção de hidden APIs vale por processo: o Petal Maps e o system_server
  aplicam a própria ao carregar; processos secundários do app também.
- HyperOS (Xiaomi) pode ter modificado o caminho de `captureDisplay`; se o hook
  não for suficiente, confira o log (`Permission hook installed/not present`)
  e o logcat do WMS.
