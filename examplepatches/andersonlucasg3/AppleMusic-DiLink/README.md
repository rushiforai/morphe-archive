# Apple Music DiLink — patches Morphe

Bundle de patches [Morphe](https://github.com/MorpheApp) para o **Apple Music 7.0.0**
(`com.apple.android.music`, versionCode 1614) rodar no head unit **BYD DiLink 3.0** (Android 9/10).

Objetivo final do bundle: destravar o landscape, rebaixar o `minSdk` de 30 para 28/29 e rodar sem
GMS/Play Integrity.

> **Estado atual (1.1.0):** o app **instala, abre, loga e reproduz no DiLink** (API 29, landscape).
> O login passa por e-mail, senha, 2FA e pelo `AMSIDMSAuthenticationCompleteAction`; o player toca
> normalmente. Os assets JS da Apple são transpilados para Chrome 74 no build e servidos pelo APK;
> o Anisette/ADI nativo é substituído por OTP local (GrandSlam V3 e Store AMD V1.5) com uma
> identidade Android provisionada via `apple-auth` embutida no bundle.
>
> Validado: build, aplicação no APK, bytecode, carregamento no patcher do Manager, fluxo completo
> no Morphe mobile, startup sem GMS e runtime no DiLink.

## Patches

| Patch | Default | O que faz |
|---|---|---|
| `Apple Music DiLink support` | sim | `m1.x()` passa a devolver `K.TABLET` (destrava a rotação: `MainActivity` deixa de fixar `SENSOR_PORTRAIT`); `EmojiSearchFragment$a.onGlobalLayout()` retorna cedo em API < 30 (evita `NoSuchMethodError` em `WindowInsets.Type`/`setDecorFitsSystemWindows`); `getAppIntegrityToken()` devolve `null`, caminho que o app já trata; backport de `Objects.requireNonNullElse*`, `List.of`, `WifiInfo.getWifiStandard`, das chamadas de `WindowInsetsController` e dos acessores de *state description* (`View`/`AccessibilityNodeInfo`, API 30). |
| `Apple Music DiLink manifest` | não (dependência) | `minSdkVersion` 30 → 29 e remove `screenOrientation="portrait"` da única activity que o declarava (`MLIChromeTabActivity`), eliminando a feature implícita `android.hardware.screen.portrait`. |
| `Apple Music DiLink TLS trust` | não (dependência) | Substitui `res/xml/network_security_config.xml` para confiar em `@raw/apple_ca` (Apple Root CA - G3, já embutida no APK) **apenas** em `gsd.apple.com`; o resto continua usando o store do sistema. Nada é instalado no head unit. |
| `Apple Music DiLink web assets` | sim | Embute os assets JS da Apple (page + chunks `appleauth`) **transpilados para Chrome 74** dentro de `res/raw/js_ams_adaptor.js`; `PlatformCompat.interceptWebResource` serve esses assets em `shouldInterceptRequest`. Sem isso o WebView 74 do DiLink não parseia o ES2020 da Apple. |

Evidências da análise (com `arquivo:linha`) em [`analysis/apple-music-7.0.0.md`](analysis/apple-music-7.0.0.md);
resultados dos testes em aparelho em [`analysis/validation.md`](analysis/validation.md).

### Limitações conhecidas

- **API 29 validada no DiLink**: o app abre, renderiza no landscape e navega. O backport cobre os
  pontos mapeados em [`analysis/api-levels.md`](analysis/api-levels.md) (insets/`WindowInsetsController`,
  `Objects.requireNonNullElse*`, `List.of`, `WifiInfo.getWifiStandard`, acessibilidade) e agora também
  `IBinder.getSuggestedMaxIpcSizeBytes()` (API 30, usado por `p507z3.C7059k`). Para API 28 ainda há
  `m1.<clinit>` (`FontStyle`), fora do escopo.
- **Login resolvido:** WebView 74 (assets JS transpilados), 2FA e commerce auth (OTP local
  GrandSlam/Store) funcionam. O `libCoreADI` nativo não é mais chamado.
- **UI (API 29) — pendências de layout:** faixa preta na tela de letras, cards cortados à direita
  nos carrosséis e espaçamentos grandes no Ajustes. São diferenças de layout/insets, **não** de
  accent color (o app não usa dynamic color no carro).
- **Entrada para patch: XAPK.** O bundle declara `apkFileType = XAPK`; arquivos `.apkm` são
  rejeitados pelo Manager. Use o XAPK do Apple Music 7.0.0 (APKPure).
- A identidade ADI embutida é sintética (sem conta); o APK final é merged e assinado com
  `CN=Morphe`, então é preciso desinstalar o Apple Music oficial antes de instalar o patcheado.

## Estrutura

```
settings.gradle.kts                  # plugin app.morphe.patches 1.3.3 (mavenLocal primeiro)
gradle/libs.versions.toml            # morphe-patcher 1.6.0, smali, gson
patches/
  build.gradle.kts                   # about/group do bundle
  src/main/kotlin/
    app/morphe/patches/applemusic/shared/Constants.kt      # Compatibility + AppTarget("7.0.0")
    app/morphe/patches/applemusic/dilink/AppleMusicDiLinkPatch.kt  # landscape + API 29 backport
    app/morphe/patches/applemusic/dilink/DilinkManifestPatch.kt    # minSdk + portrait lock
    app/morphe/patches/applemusic/dilink/DilinkTlsPatch.kt         # Apple Root CA G3 p/ gsd.apple.com
    util/PatchListGenerator.kt       # gera patches-list.json
extensions/extension/                # módulo de extensão (.mpe), namespace app.morphe.extension.applemusic
patches-list.json                    # gerado por :patches:generatePatchesList
tools/                               # jars locais (não versionados): morphe-desktop, APKEditor
```

## Requisitos

- JDK 21 (o JDK 25 quebra o Kotlin 2.2).
- Android SDK com `compileSdk 36` (o módulo `extensions/extension` usa AGP). `ANDROID_HOME` ou
  `local.properties` com `sdk.dir`.
- Token GitHub com `read:packages` para `app.morphe:morphe-patcher` (GitHub Packages).

## Build

Testado neste repo:

```powershell
$env:JAVA_HOME   = "C:\Users\anderson\.jdks\jdk-21.0.11+10"
$env:GRADLE_USER_HOME = "$PWD\.gradle-user"   # sandbox bloqueia escrita em ~/.gradle
$env:GITHUB_ACTOR = "andersonlucasg3"
$env:GITHUB_TOKEN = $(gh auth token)

.\gradlew.bat :patches:build
.\gradlew.bat :patches:generatePatchesList
```

Para **publicar/instalar no Morphe mobile**, o `.mpp` precisa conter `classes.dex` (o Manager
carrega via `loadPatchesFromDex`). O plugin 1.3.3 só funde o dex no `:patches:buildAndroid`:

```powershell
.\gradlew.bat :patches:buildAndroid
```

O `:patches:build` sozinho gera um bundle só com classes — suficiente para a CLI desktop, mas
rejeitado pelo Manager com "Patch bundle is missing dex entries".

`GRADLE_USER_HOME` fica dentro do repo (`.gradle-user/`, no `.gitignore`); o token nunca é escrito
em arquivo versionado — só passado por variável de ambiente.

Artefatos gerados em `patches/build/libs/`:

| Arquivo | Conteúdo |
|---|---|
| `patches-1.0.4.mpp` | bundle aplicável (classes + `extensions/extension.mpe`) |
| `patches-1.0.4-sources.mpp` | sources |
| `patches-1.0.4-javadoc.mpp` | javadoc |

`generatePatchesList` reescreve `patches-list.json` (não editar à mão) e depende de `build`.

> O gerador lê o **primeiro** `.mpp` de `build/libs/`. Se houver bundles antigos de versões
> anteriores, rode `:patches:clean` (ou apague-os) antes de gerar, senão a lista sai com a versão
> errada — foi o que aconteceu aqui com 1.0.0/1.0.1.

> Sob o sandbox deste repo o Kotlin daemon não consegue abrir `~/.kotlin` e o build cai
> automaticamente para compilação in-process (o build continua verde). Para evitar o erro no log:
> `.\gradlew.bat :patches:build "-Pkotlin.compiler.execution.strategy=in-process"`.

### Build via GitHub Actions

Quando não há JVM utilizável no local (por exemplo, no próprio Android), o workflow
[`.github/workflows/build.yml`](.github/workflows/build.yml) roda:

```sh
./gradlew clean :patches:generatePatchesList :patches:buildAndroid --no-daemon
```

e publica `patches/build/libs/*.mpp` + `patches-list.json` como artefato (`workflow_dispatch`).
Requer o secret de repositório **`GPR_KEY`** (token com `read:packages`, para o registry
`maven.pkg.github.com/MorpheApp/registry`) e, opcionalmente, **`GPR_USER`**. O `GITHUB_TOKEN`
padrão do repositório não tem acesso aos pacotes de outra organização. O JDK 21 e o SDK Android
(`platforms;android-36`, `build-tools;36.0.0`) são instalados no runner.

## Aplicar o bundle localmente (sem celular)

Jars necessários (não versionados, baixar em `tools/`):

- `morphe-desktop-1.20.0-all.jar` — <https://github.com/MorpheApp/morphe-desktop/releases/download/v1.20.0/morphe-desktop-1.20.0-all.jar>
- `APKEditor-1.4.9.jar` — <https://github.com/REAndroid/APKEditor/releases/download/V1.4.9/APKEditor-1.4.9.jar>

### 1. Merge dos splits (base + arm64_v8a + mdpi)

```powershell
java -jar tools\APKEditor-1.4.9.jar m -i .pipeline\splits -o .pipeline\merged.apk
```

### 2. Aplicar o patch

```powershell
java -jar tools\morphe-desktop-1.20.0-all.jar patch `
  -p patches\build\libs\patches-1.0.4.mpp `
  -o .pipeline\applemusic-7.0.0-dilink-patched.apk `
  .pipeline\merged.apk
```

A CLI assina o APK de saída com o keystore padrão que ela gera em `tools/morphe-data/`
(`CN=Morphe`). Conferir:

```powershell
& "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.0.0\apksigner.bat" verify --print-certs .pipeline\applemusic-7.0.0-dilink-patched.apk
```

### Alternativa: aplicar direto no XAPK

O Morphe Desktop também aceita bundle de splits e faz o merge sozinho:

```powershell
java -jar tools\morphe-desktop-1.20.0-all.jar patch `
  -p patches\build\libs\patches-1.0.4.mpp `
  -o .pipeline\applemusic-7.0.0-from-xapk.apk `
  apks\apple-music-7.0.0\AppleMusic_7.0.0_apkpure.xapk
```

Outros comandos úteis da CLI (`java -jar tools\morphe-desktop-1.20.0-all.jar --help`):

- `list-patches --patches <mpp>` — lista os patches do bundle e se estão habilitados.
- `list-versions --patches <mpp>` — versões de app declaradas na compatibilidade.
- flags de `patch`: `-e/--enable`, `-d/--disable`, `--force`, `--striplibs`, `--unsigned`, `--keystore`.

## Usar no app Morphe (Android)

O bundle é publicado em [releases](https://github.com/andersonlucasg3/AppleMusic-DiLink/releases)
e o repositório serve como *patch source*:

- **Remote**: no Morphe → **Sources** → **+** → Remote →
  `github.com/andersonlucasg3/AppleMusic-DiLink`.
- **Local**: baixe `patches-1.0.4.mpp` do release e abra no Morphe, ou
  `adb push patches-1.0.4.mpp /sdcard/Download/` e abra o arquivo no aparelho.

O Apple Music não é distribuído por este repositório, então o Morphe não oferece link de
download: forneça o **XAPK 7.0.0 (vc 1614)** na tela de seleção de APK. O Manager funde os
splits e aplica os mesmos patches da CLI.

> **Testado no Morphe Manager 2.3.0 (Galaxy S24, Android 16):** source carregada, Apple Music 7.0.0
> reconhecido, patch aplicado (1 patch) e APK instalado/aberto pelo próprio Manager. O bundle usa
> `Patcher-Version: 1.6.0`; o Manager aceita versões maiores e não exige atualização.

## Instalar no DiLink

Pré-requisito: ADB habilitado no head unit (Wi-Fi ADB ou USB host).

```powershell
adb connect <ip-do-dilink>:5555
adb uninstall com.apple.android.music        # assinatura diferente do app original
adb install -r .pipeline\out.apk
adb logcat -s AndroidRuntime:E ActivityManager:I
```

Checklist de teste no carro:

1. O app abre sem `NoSuchMethodError`/`ClassNotFoundException`.
2. A UI principal fica em landscape (sem `SENSOR_PORTRAIT`).
3. Seletor de emoji abre sem crash (em API < 30 o teclado não abre automaticamente).
4. Login e reprodução funcionam sem GMS; se o servidor recusar por falta de integrity, ver limitações.

## Licença

MIT — ver [LICENSE](LICENSE).
