# Apple Music — apps para Android TV e head unit

Apps próprios que usam o **Apple Music 7.0.0** (`com.apple.android.music`, versionCode 1614,
APKM de 4 ABIs) apenas como **backend**: conta, DRM e playback. O Apple Music é patcheado no
build e vira o **engine** (sem ícone no launcher); a UI é dos companions `AppleMusic-TV` e
`AppleMusic-Car`, que falam com o engine pelo `MediaBrowserService` do framework.

A distribuição é por **APKs** nas releases `apps-<versão>`
([releases](https://github.com/andersonlucasg3/apple-music-android-freedom/releases)): engine por
ABI + companions, todos assinados com o mesmo certificado. O bundle `.mpp` do Morphe ainda é
gerado por `:patches:buildAndroid`, mas é **interno**: só serve para montar o engine e não é
publicado.

> **Estado atual — `apps-1.7.0` (2026-11-07):** engine `arm32`/`arm64`, `AppleMusic-TV`,
> `AppleMusic-Car`, `updates.json` e `SHA256SUMS` publicados juntos. Os companions têm busca de
> catálogo e atualização in-app. O **APK único** (engine + UI framework-only) é viável e passa a
> ser publicado a partir da 1.8.0 — ver [APK único](#apk-único-applemusic-one-abiak) e
> [ROADMAP](ROADMAP.md#decisão-apk-único-por-device-viável-com-ui-framework-only).

## Instalação (usuário)

### 1. Baixe a release certa

Abra a release mais recente `apps-<versão>` (ex.: `apps-1.7.0`) e baixe os arquivos para o
device. Instale **engine e companion da mesma release**.

| Asset | Para |
|---|---|
| `AppleMusic-engine-arm32.apk` | Engine de devices 32-bit (TV box `armeabi-v7a`) |
| `AppleMusic-engine-arm64.apk` | Engine de devices 64-bit (carro, celular, TV `arm64-v8a`) |
| `AppleMusic-TV.apk` | Companion de Android TV (D-pad) |
| `AppleMusic-Car.apk` | Companion de toque (head unit/celular) |
| `updates.json` / `SHA256SUMS` | Metadados do updater e checksums dos downloads |

Confira a ABI do device com `adb shell getprop ro.product.cpu.abi` antes de escolher o engine.
Os APKs são grandes (engine ~100 MB, companions ~22–26 MB) e o engine não tem ícone no launcher.

### 2. Desinstale o Apple Music oficial

O APK do engine usa o **mesmo package** do app oficial, mas outra assinatura: não é possível
instalar por cima, e o Android recusa o upgrade.

```powershell
adb uninstall com.apple.android.music
```

Isso apaga os dados locais do app (a conta continua no servidor da Apple). Só depois instale o
engine.

### 3. Instale o engine e depois o companion

```powershell
adb install -r AppleMusic-engine-arm32.apk   # ou -arm64.apk
adb install -r AppleMusic-TV.apk              # ou AppleMusic-Car.apk
```

Também funciona por gerenciador de arquivos/instalador do device. **A ordem importa** e os dois
APKs precisam ser da mesma release.

### 4. Entre na conta

O companion não pede credenciais: o login acontece na UI do engine.

- **Carro:** toque em **Entrar na conta** na barra superior (o botão também aparece na tela de
  erro quando o engine está instalado mas sem sessão).
- **TV:** o `AppleMusic-TV` não tem esse botão e o engine é oculto do launcher. Abra a tela de
  login do engine por intent explícita e volte ao companion:

  ```powershell
  adb shell am start -n com.apple.android.music/com.apple.android.music.common.MainActivity
  ```

Depois do login, abra o companion: ele conecta ao `MediaBrowserService` e mostra Início/Rádio/
Biblioteca. A busca também passa a funcionar (ela usa o token guardado pelo engine — ver
[Busca](#busca)).

### 5. Atualizações

O companion verifica atualizações sozinho no máximo uma vez por dia, ao abrir, e oferece
**Verificar atualizações** na barra superior. Quando há versão nova, ele baixa os APKs, confere o
SHA-256 e abre o instalador do sistema; o **engine é atualizado antes do companion**. Autorize
“instalar apps desconhecidos” para o companion quando o sistema pedir. Detalhes em
[Auto-update](#auto-update).

### Certificado único e `sharedUserId`

Engine e companions são assinados com o **mesmo** certificado `CN=Morphe` (SHA-256
`1e058623722ed37eb59bb55411d01d6b7b212c6a8353aacecd60d515cee60463`) e declaram
`android:sharedUserId="com.apple.android"`. Isso dá aos três apps o mesmo UID, o que é
necessário para:

- o `MediaBrowserService` do engine aceitar a conexão do companion;
- o companion ler o DataStore do engine (token da busca).

Por isso **nunca misture** APKs de releases/certificados diferentes: a instalação falha ou o
companion não conecta. Perder esse certificado obriga a reinstalar engine e companions (e perde
os dados do engine).

## O que cada app faz

### `AppleMusic-TV` (Android TV, D-pad)

- Início/Rádio/Biblioteca a partir da árvore `__AUTO_ROOT__`; ENTER em card navegável desce um
  nível, ENTER em card tocável toca, BACK volta.
- Chip do tocando agora na barra de navegação; ENTER abre o **player em tela cheia** com capa
  grande, progresso, play/pause, anterior/próxima e seek de ±10 s no D-pad.
- **Criar estação** e **Ações** (lista genérica de `customActions` da sessão: Favorito, Aleatório,
  Repetir, Reprodução Automática, Adicionar à Biblioteca) no player; long-press em card abre o menu
  de contexto do item.
- **Busca** de catálogo pelo ícone de lupa, com teclado do sistema.
- **Verificar atualizações** no cabeçalho.
- Tema Apple-like (fundo preto, accent `#FA243C`, cantos 16 dp, fonte Inter) e animação só de
  foco (escala + cor), sem sombra animada.

### `AppleMusic-Car` (head unit/celular, toque)

- UI de toque em 1920×1080/API 29: alvos ≥ 48 dp, tipografia grande e no máximo **dois níveis**
  de navegação (root → um detalhe).
- Início/Rádio (shelves de capas quadradas), Biblioteca (categorias do engine), detalhe com
  breadcrumb e contagem de itens.
- **Mini player** fixo minimalista no rodapé; tocar no restante da barra abre o **player em tela
  cheia** com capa, progresso arrastável, controles e a folha **Ações**.
- **Long-press** em cards e linhas abre a folha de ações; **Criar estação** toca o item, espera o
  engine publicar a ação para a faixa nova e dispara (senão mostra “Indisponível”).
- **Busca** de catálogo com teclado do sistema e fallback para a busca do app original.
- **Entrar na conta** e **Verificar atualizações** na barra superior.
- Estados de erro com “Tentar de novo” (engine não instalado, serviço indisponível).

## APK único (`AppleMusic-one-<abi>.apk`)

A partir da 1.8.0 o CI também publica um APK por ABI com o **engine + a UI no mesmo pacote**
(`AppleMusic-one-arm32.apk`, `AppleMusic-one-arm64.apk`): não precisa do companion. A UI
([`single-apk/single-ui`](single-apk/single-ui)) é Java puro com views do framework, compilada no
runner com `javac`+`d8` e injetada como `classesN.dex` no APK do engine já assinado; a
`common.MainActivity` do engine continua no pacote e abre pelo botão **Conta**. Compose/AndroidX
não entram porque o engine foi minerado pelo R8 e as classes colidiriam (ver
[ROADMAP](ROADMAP.md#decisão-apk-único-por-device-viável-com-ui-framework-only)).

**Instalação:**

1. Desinstale o Apple Music oficial (`com.apple.android.music`): a assinatura é outra.
2. Instale `AppleMusic-one-<abi>.apk` — **por cima do engine**, se ele já está instalado (mesmo
   pacote e mesmo cert `CN=Morphe`: conta e dados são preservados), ou em um device novo. O
   companion deixa de ser necessário.
3. Abra o app: a UI conecta no engine já logado; login/Conta abre a activity do engine.

**Atualização:** o botão **Atualizações** (e uma checagem automática ao abrir, no máximo 1x/dia)
baixa o `updates.json` do último release, compara `one-<abi>.versionCode` com a versão da UI
injetada no build (`Version.NAME`/`Version.CODE`, gerada por `-PoneVersion`/`-PoneVersionCode`),
baixa o `AppleMusic-one-<abi>.apk` com progresso, confere o **SHA-256** e instala pela
`PackageInstaller` (diálogo do sistema; autorize "instalar apps desconhecidos" para o app). A ABI
é detectada em runtime por `Build.SUPPORTED_ABIS` (arm64-v8a→`one-arm64`, armeabi-v7a→`one-arm32`,
x86/x86_64→`one-x86`). A instalação substitui o próprio pacote: mesmo cert, dados preservados.
Estados no diálogo: sem atualização, disponível (versão/tamanho), baixando (%), verificando,
instalando, erro — com **Cancelar** durante o download.

**Ainda falta (paridade com os companions):** telas próprias de Biblioteca/Rádio, polimento
visual, estados de erro/offline e `one-x86` publicado (hoje o CI publica arm32/arm64; o build
local `single-apk/build-one-apk.ps1` gera o x86 para o emulador).

## Arquitetura

```
core/            # biblioteca Android compartilhada, sem UI
  MediaBrowserClient (browse/playback/custom actions), BrowseItem, Section,
  PlaybackSnapshot/CustomAction, SearchClient/SearchResult, update/ (updates.json,
  download+sha256, PackageInstaller)
tv-app/          # companion Android TV (Compose for TV, D-pad)
car-app/         # companion de toque (Compose Material 3; DiLink/celular)
patches/         # patches Morphe do Apple Music 7.0.0 — interno, só gera o engine
extensions/      # módulo .mpe carregado pelos patches
analysis/        # investigação (API 29, login, busca, viabilidade de TV)
single-apk/      # APK único: UI framework-only injetada no engine (build + tools)
search-spike/    # spike histórico: leitura do token e chamada à amp-api
.github/workflows/build.yml   # build e release dos APKs
```

Fluxo: o companion conecta no `MediaBrowserService` do engine, lista a árvore `__AUTO_ROOT__`
(`Início`/`Rádio`/`Biblioteca`), toca por `playFromMediaId` e envia ações de sessão por
`sendCustomAction`. Player, metadados e `customActions` vêm de `MediaController`. O `core/` não
usa Compose nem recursos, então os dois companions reutilizam o mesmo cliente.

`patches/` não é produto: gera o `.mpp` que o CI aplica ao APK do Apple Music para produzir o
engine (`DiLink: support`/`manifest`/`TLS trust`/`web assets` + `DiLink: hide engine launcher`).
`single-apk/` gera o APK único (`AppleMusic-one-<abi>.apk`); `search-spike/` é um spike
encerrado, mantido como evidência.

## Build local

Requisitos:

- **JDK 21** (`JAVA_HOME`) — a mesma versão do CI (temurin 21).
- Android SDK com `compileSdk 36` e **build-tools 36.0.0** (`ANDROID_HOME` ou `local.properties`).
- Credenciais com `read:packages` para `app.morphe:morphe-patcher` (GitHub Packages):
  `GITHUB_ACTOR` + `GITHUB_TOKEN` (ou `gpr.user`/`gpr.key`).

```powershell
$env:JAVA_HOME = "C:\Users\anderson\.jdks\jdk-21.0.11+10"
$env:GRADLE_USER_HOME = "$PWD\.gradle-user"   # opcional; .gradle-user/ está no .gitignore
$env:GITHUB_ACTOR = "andersonlucasg3"
$env:GITHUB_TOKEN = $(gh auth token)
```

Companions (release) e o `.mpp` interno do engine:

```powershell
.\gradlew.bat :patches:buildAndroid :tv-app:assembleRelease :car-app:assembleRelease `
  --no-daemon -Pkotlin.compiler.execution.strategy=in-process `
  "-Dorg.gradle.jvmargs=-Xmx4096m -XX:MaxMetaspaceSize=1024m"
```

O `-Dorg.gradle.jvmargs=-Xmx4096m -XX:MaxMetaspaceSize=1024m` é obrigatório: os companions
linkam quatro dex e o `mergeExtDex` estoura o heap padrão (512 MiB no daemon local, ~2 GB no
runner). Saídas sem assinatura:

- `tv-app/build/outputs/apk/release/tv-app-release-unsigned.apk`
- `car-app/build/outputs/apk/release/car-app-release-unsigned.apk`
- `patches/build/libs/patches-<versão>.mpp` (uso interno; não distribua)

`appVersionName`/`appVersionCode` vêm de `-PappVersionName`/`-PappVersionCode` (o CI passa a
versão); sem eles vale o default do módulo.

### Assinatura

O certificado local é `tools/tv-app-signing.p12` (alias e senha `Morphe`; **não versionado**,
como todo `tools/`). Se ele não existir, gere a partir do keystore BKS do morphe-desktop em
`tools/morphe-data/morphe.keystore` — o comando `BksToP12` está no
[`tv-app/README.md`](tv-app/README.md#sign-with-the-morphe-certificate). O SHA-256 do cert precisa
ser `1e05862372…e60463`.

TV:

```powershell
$bt = "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.0.0"
& "$bt\zipalign.exe" -p -f 4 tv-app\build\outputs\apk\release\tv-app-release-unsigned.apk .pipeline\tv-aligned.apk
& "$bt\apksigner.bat" sign --ks tools\tv-app-signing.p12 --ks-key-alias Morphe `
  --ks-pass pass:Morphe --key-pass pass:Morphe `
  --out .pipeline\AppleMusic-TV.apk .pipeline\tv-aligned.apk
& "$bt\apksigner.bat" verify --print-certs .pipeline\AppleMusic-TV.apk
```

Carro (faz `zipalign` + `apksigner` + verificação):

```powershell
.\car-app\sign.ps1 -Variant release
```

## CI e release

O workflow [`.github/workflows/build.yml`](.github/workflows/build.yml) roda apenas por
`workflow_dispatch` e publica APKs (nunca o `.mpp`):

| Input | Obrigatório | O que faz |
|---|---|---|
| `version` | sim | Versão da release `apps-<version>`, sem o `v` (ex.: `1.7.0`). Também deriva o `versionCode` (`1.7.0` → `10700`, esquema `MAJOR*10000 + MINOR*100 + PATCH`). |
| `source_url` | não | URL do APKM 4-ABI. Vazio usa o secret `ENGINE_SOURCE_URL`; sem os dois, a release sai só com os companions. |
| `publish` | não (`true`) | `false` gera só artifacts, sem release. |

Secrets:

- **`MORPHE_KEYSTORE_P12`** (base64 do PKCS#12 `CN=Morphe`) + **`MORPHE_KEYSTORE_PASSWORD`**,
  **`MORPHE_KEY_ALIAS`**, **`MORPHE_KEY_PASSWORD`** — assinatura de todos os APKs.
- **`GPR_KEY`** (token com `read:packages`) e **`GPR_USER`** (conta) — dependências
  `app.morphe:*` no GitHub Packages; o `GITHUB_TOKEN` do repo não lê o registry da organização.
- **`ENGINE_SOURCE_URL`** — URL do asset do release `engine-source`
  (`AppleMusic_7.0.0_apkmirror.apkm`). O input `source_url` tem precedência.

O job:

1. builda `:patches:buildAndroid :tv-app:assembleRelease :car-app:assembleRelease` com heap de
   4 GB;
2. assina `AppleMusic-TV.apk` e `AppleMusic-Car.apk` com `zipalign` + `apksigner` e valida
   `CN=Morphe` + SHA-256 do certificado;
3. com `source_url`, baixa o APKM, monta `splits32` (base + `armeabi_v7a` + `xhdpi`) e `splits64`
   (base + `arm64_v8a` + `xhdpi`), mergeia com APKEditor 1.4.9 e aplica o `.mpp` com a CLI do
   morphe-desktop 2.1.1 (`--unsigned -e "DiLink: hide engine launcher"`). O engine é re-assinado
   com o p12 e validado (`sem launchable-activity`, `native-code` da ABI certa);
4. gera `updates.json` (versão, `releasedAt`, por asset nome/SHA-256/tamanho/`versionCode`) e
   `SHA256SUMS`;
5. cria/atualiza a release `apps-<version>` com os 6 assets (engine ×2, companions ×2,
   `updates.json`, `SHA256SUMS`) — ou 4 sem engine, com o aviso **engine não anexado** nas notas.

## Busca

O `MediaBrowserService` do engine **não anuncia** `SEARCH_SUPPORTED`, então a busca dos
companions não passa pelo engine. Ela fala direto com a **amp-api** da Apple:

- lê o *developer token* que o engine guarda no DataStore
  (`files/datastore/encrypted_tokens.preferences_pb`), decriptado com a chave do AndroidKeyStore
  (`music_token_store_key`) — possível porque engine e companion compartilham o UID;
- chama `GET https://amp-api.music.apple.com/v1/catalog/{storefront}/search` e agrupa os
  resultados em Músicas/Álbuns/Artistas/Playlists (capa, título, artista);
- storefront/idioma vêm do `Locale` (fallback `us`); o token fica só em memória e é relido no
  primeiro `401`;
- tocar um resultado chama `playFromMediaId` com o id de catálogo. Artista não é tocável: cai na
  busca do próprio app (`MEDIA_SEARCH`).

Fallback: quando o token não existe/não decripta, a tela avisa e oferece **Abrir busca do app
original** (`https://music.apple.com/search`).

Limitações: o token só existe depois do login no engine (engine limpo = só fallback); a busca é
de **catálogo**, não da biblioteca; o resultado toca o item, não monta uma fila própria.
Análise: [`analysis/search-feasibility.md`](analysis/search-feasibility.md).

## Auto-update

Cada release publica `updates.json`:

```json
{
  "version": "1.7.0",
  "versionCode": 10700,
  "releasedAt": "2026-11-07T12:15:04Z",
  "assets": {
    "tv":           { "name": "AppleMusic-TV.apk", "sha256": "…", "size": 22490825, "versionCode": 10700 },
    "car":          { "name": "AppleMusic-Car.apk", "sha256": "…", "size": 25755734, "versionCode": 10700 },
    "engine-arm32": { "name": "AppleMusic-engine-arm32.apk", "sha256": "…", "size": 100955444, "versionCode": 1614 },
    "engine-arm64": { "name": "AppleMusic-engine-arm64.apk", "sha256": "…", "size": 105325826, "versionCode": 1614 }
  }
}
```

O `core/update` lê `https://github.com/andersonlucasg3/apple-music-android-freedom/releases/latest/download/updates.json`
(sem token; a API do GitHub é só fallback), compara `versionCode` com o APK instalado e com a
versão do engine, e monta o plano. No máximo uma checagem automática por 24 h; o botão
**Verificar atualizações** força. O download é streaming com progresso e SHA-256 conferido antes
de instalar; a instalação usa `PackageInstaller` (diálogo do sistema), **engine primeiro**. O
engine só entra no plano se estiver instalado e assinado pelo nosso certificado
(`engineSignedByUs`), para nunca tentar atualizar um app alheio. Depois da instalação, o
`InstallResultReceiver` devolve o status e a UI mostra o resultado (cancelado, bloqueado, sem
espaço etc.).

O APK único tem o seu próprio updater (framework-only, sem `core/`):
`single-apk/single-ui/UpdateManager.java` lê o mesmo `updates.json` e usa as entradas
`one-arm32`/`one-arm64`, cujo `versionCode` é o da **UI** (`Version.CODE`) e não o do engine.

## Limitações conhecidas

- **Busca**: não há busca nativa no engine (`SEARCH_SUPPORTED=false`); a dos companions depende do
  token do engine e cobre só o catálogo (ver [Busca](#busca)).
- **Letra/fila**: só o que a sessão expõe (`MediaController`/`customActions`), não a UI do engine.
- **Playback em emulador x86**: os engines publicados são arm32/arm64 e não instalam em AVD x86;
  um engine x86 montado localmente abre e loga no emulador, mas a reprodução não roda lá — valide
  playback em device arm.
- **APK único por device**: viável com UI framework-only (sem Compose/AndroidX, que colidiriam
  com o dex minerado pelo R8); publicado como `AppleMusic-one-arm32/arm64.apk`. Falta paridade
  visual/funcional com os companions e o `one-x86` no CI — ver
  [`single-apk/README-one.md`](single-apk/README-one.md).
- **Assinatura**: perder o cert `MORPHE_*` quebra o UID compartilhado e obriga reinstalar tudo.
- **Dois níveis** no carro: nós mais profundos da biblioteca não são navegáveis no companion; use
  o app do Apple Music.
- **Engine** precisa ser atualizado com a release; patches novos exigem reaplicar/atualizar o APK
  do engine nos devices.
- **Validação física**: a revamp e a busca foram validadas em TV/celular; a instalação no head
  unit DiLink continua **não verificada** (ver [`car-app/README.md`](car-app/README.md)).

## Histórico

- **1.1.0–1.4.0**: Apple Music patcheado rodando no DiLink (login, playback, landscape/API 29),
  distribuído como bundle `.mpp` + APK mesclado.
- **1.3.0**: patches de foco/D-pad para Android TV; foram removidos depois, quando a UI de TV
  virou companion.
- **1.5.0**: primeira release só de APKs — engine + `AppleMusic-TV` + `AppleMusic-Car` com cert
  único; o `.mpp` deixa de ser produto.
- **1.6.0**: revamp visual (tokens Apple, Inter, cards), engine oculto do launcher e UX de
  toque do carro (mini player, player cheio, long-press).
- **1.6.2–1.6.3**: updater in-app (`updates.json`) e polimento visual final.
- **1.7.0**: busca de catálogo nos dois companions.

## Documentação relacionada

- [ROADMAP.md](ROADMAP.md) — fases, decisão do APK único, riscos e métricas.
- [HANDOFF.md](HANDOFF.md) — histórico de sessões e diagnósticos.
- [`core/README.md`](core/README.md), [`tv-app/README.md`](tv-app/README.md),
  [`car-app/README.md`](car-app/README.md) — detalhes de cada módulo.

## Licença

MIT — ver [LICENSE](LICENSE).
