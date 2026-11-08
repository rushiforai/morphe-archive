# Handoff — Apple Music

Atualizado em **2026-11-07**. Documento de passagem de contexto; não é uma release.

## Estado atual — 2026-11-07 (apps 1.7.0)

- O produto é **APKs**, não bundle: releases `apps-<versão>` até **`apps-1.7.0`** com
  `AppleMusic-engine-arm32/arm64`, `AppleMusic-TV`, `AppleMusic-Car`, `updates.json` e
  `SHA256SUMS`. O `.mpp` é interno (só gera o engine) e não é publicado.
- **Busca de catálogo** nos dois companions (amp-api com o developer token do engine, mesmo UID;
  fallback para a busca do app original) e **auto-update** in-app lendo `updates.json`
  (`versionCode`, SHA-256, `PackageInstaller`, engine antes do companion).
- Validação desta rodada: **emulador Android TV x86** (`tv34`, 1920×1080) com engine x86 logado;
  a **TV física está fora de alcance**. A instalação no head unit DiLink não foi refeita.
- Estado por fase, decisão do APK único e métricas: [ROADMAP.md](ROADMAP.md). Instalação para
  usuário: [README.md](README.md).

## Sessão 2026-11-07 — patches de TV removidos

Os patches `TV: manifest`, `TV: D-pad focus` e `TV: player expand focus` (e o helper
`TvFocusCompat.java` + o recurso `res/anim/tv_focus_scale.xml`) foram **removidos**: a UI de TV é
o companion `tv-app` e o engine ficou só com os patches DiLink (`support`, `manifest`, `TLS trust`,
`web assets`, `hide engine launcher`). O APK do engine não tem entrada no launcher — o workflow
passou a validar a ausência de `launchable-activity` em vez do `leanback-launchable-activity`. As
seções de TV abaixo são históricas.

## Sessão 2026-11-06 — Android TV (branch `feat/android-tv`)

Suporte a Android TV no mesmo bundle, **versão 1.3.0** (a 1.2.0 já estava publicada no `main`,
então o bump foi para 1.3.0). O branch foi atualizado para `main` (`231d0d7`) antes do bump, logo
a 1.3.0 herda as correções de UI do API 29 da 1.2.0 (tema do login no WebView e faixa preta das
letras).

Patches novos (todos `default=false`, dependem uns dos outros):

- `TV: manifest` (`tv/TvManifestPatch.kt`): intent-filter `LEANBACK_LAUNCHER` +
  `android:banner="@mipmap/ic_launcher"` na `MainActivity` e `uses-feature` de
  `android.software.leanback`/`android.hardware.touchscreen` com `required=false`. Depende do
  patch `DiLink: support` (minSdk 29 + tablet).
- `TV: D-pad focus` (`tv/TvDpadPatch.kt`): `defaultFocusHighlightEnabled` e
  ripple/foreground nos cards do Listen Now, nas linhas da Busca, no pill do mini player e nos
  controles do player; `player_controls` deixa de ser focável; `nextFocusDown` no pill; padding no
  `tab_navigation_host` (topo `?attr/actionBarSize`, base 80dp) para o foco sair da lista.
- `TV: player expand focus` (`tv/TvExpandedFocusPatch.kt` +
  `extensions/.../TvFocusCompat.java`): hook no `onStateChanged` (`PlayerMainFragment$i.c`) leva o
  foco ao `play_pause` quando o sheet expande e devolve ao mini player/lista quando fecha.

Device: TV box Xiaomi `MiTV-AFMU0` (product `twilight`), Android 14 / API 34, `armeabi-v7a`,
1920×1080 a 320 dpi, `adb 100.74.105.35:5555`.

Evidências (1.3.0):

- Build: `.mpp` 1.3.0 em `patches/build/libs/` (784.251 B) e `patches-list.json` com 7 patches
  (4 DiLink + 3 TV).
- APK de release: `.pipeline/tv/merged32.apk` (base + `config.armeabi_v7a` + `config.xhdpi` do
  APKM) → `.pipeline/release/AppleMusic-1.3.0-AndroidTV-arm32.apk` (100.455.600 B, SHA-256
  `c4e1687845cee5952cc71aab9253c5d9744ade8be3031293c1d9f39e54a9f80c`).
- `aapt2 dump badging`: `leanback-launchable-activity: ...MainActivity`,
  `native-code: 'armeabi-v7a'`, `minSdkVersion:'29'`, `targetSdkVersion:'36'`,
  `uses-feature-not-required` para leanback/touchscreen.
- `apksigner verify --print-certs`: `CN=Morphe`, SHA-256
  `1e058623722ed37eb59bb55411d01d6b7b212c6a8353aacecd60d515cee60463` (o mesmo do APK do DiLink,
  então `install -r` manteve a conta).
- Instalado com `adb install -r` e aberto com
  `am start -n com.apple.android.music/com.apple.android.music.common.MainActivity`.
- D-pad validado no controle: grade da Busca → pill do mini player → ENTER abre o Now Playing com
  foco no play/pause → BACK volta para a lista; ENTER alterna PLAYING/PAUSED.
- `dumpsys media_session`: a sessão do Apple Music fica em `PLAYING(3)` com metadata
  `Lost In Hollywood / System Of A Down / Mezmerize`. As duas sessões em `ERROR(7)` com
  "Áudio Bluetooth desconectado" são do `com.android.bluetooth`, não do app.
- Screenshot: `.pipeline/tv/release-check.png` (abertura + Now Playing com foco);

Limitações e pendências:

- O indicador de foco é o highlight/ripple do framework, **não** escala o card; não há recursos
  `-television`. As abas do topo são alcançadas com UP + LEFT a partir do conteúdo.
- Banner provisório (`@mipmap/ic_launcher`); não há banner 320×180 no APK.
- TV 32-bit exige o split `armeabi-v7a` no merge; o APK do DiLink (arm64) não instala no box.
- Pendente: push do branch, merge/tag `v1.3.0` e release com `patches-1.3.0.mpp` +
  `AppleMusic-1.3.0-AndroidTV-arm32.apk`; validar em outra TV (arm64/4-ABI) e decidir sobre
  escala de foco.

## Sessão 2026-11-05 — trabalho sem acesso ao carro

O DiLink não estava acessível nesta sessão. Foi feito o que não depende dele:

- **Porta do patch de acessibilidade para a fonte** (`AppleMusicDiLinkPatch.kt` +
  `AccessibilityCompat.java`). Os call sites de API 30 foram contados em **todos** os dex do
  7.0.0: `View.getStateDescription` (1: `x2/E$j.b`), `View.setStateDescription` virtual
  (1: `x2/E$j.d`) e `invoke-super` (3: `Lif/a`, MaterialCheckBox em `classes4.dex`),
  `AccessibilityNodeInfo.getStateDescription` (1: `y2/j.toString`) e
  `AccessibilityNodeInfo.setStateDescription` (2: `x2/a$a.onInitializeAccessibilityNodeInfo` e
  `androidx.compose.ui.platform.b$c.b`). O helper isola as chamadas API 30 numa classe aninhada
  carregada só em API 30+, e devolve `null`/no-op em API 29.
  Os 3 `invoke-super` de `Lif/a` vão para um no-op dedicado: redirecioná-los para o helper
  virtual chamaria o override do próprio `Lif/a` e recursaria para sempre. Em API 30+ o
  `Lif/a` mantém o campo próprio; só o valor de acessibilidade da plataforma deixa de ser
  atualizado (regressão apenas de acessibilidade).
- **Dois call sites extras de `View.getWindowInsetsController()`** foram protegidos:
  `x2/E$j.c` (retorna `null` em API < 30) e `androidx/preference/a$a.a(Window)` (método inteiro
  vira no-op em API < 30 — é o teclado de diálogo de preferência, que também usaria
  `WindowInsets.Type.ime`).
- **Patch de recurso TLS** (`DilinkTlsPatch.kt`): substitui `res/xml/network_security_config.xml`
  por um `domain-config` estreito para `gsd.apple.com` confiando em `@raw/apple_ca`, mantendo o
  store do sistema no resto. O manifest já referencia esse recurso e `res/raw/apple_ca.pem` já
  existe no APK; nada é instalado no carro.
- **Workflow de GitHub Actions** (`.github/workflows/build.yml`) para gerar `.mpp` +
  `patches-list.json` sem JVM local. Precisa dos secrets `GPR_KEY` (token com `read:packages`) e
  `GPR_USER`, porque o `GITHUB_TOKEN` do repositório não lê o registry da organização MorpheApp.
  Os secrets foram configurados e o workflow rodou com sucesso
  ([run 41950676081](https://github.com/andersonlucasg3/apple-music-android-freedom/actions/runs/41950676081),
  build em 2m01s): `patches-1.0.4.mpp` (708.779 B) + `patches-list.json` gerados, com
  `Patcher-Version: 1.6.0`, `classes.dex` e `extensions/extension.mpe` contendo
  `AccessibilityCompat`.
- **Release 1.0.4 publicada** em
  <https://github.com/andersonlucasg3/apple-music-android-freedom/releases/tag/v1.0.4> com o asset
  `patches-1.0.4.mpp` (SHA-256 `2a185656a6e13a46023e289f32da8366e694b9d6aac4ad279f15ac31cd330c1a`).
  `patches-bundle.json` e `patches-list.json` apontam para 1.0.4. O bundle foi salvo em
  `Downloads/Buddy/patches-1.0.4.mpp` no celular.
- **Ainda não aplicado nem testado no carro** (o DiLink não estava acessível); a decisão foi
  publicar a 1.0.4 mesmo assim e seguir numa nova versão se aparecerem mais problemas.
- Commits: `96bb7a4` (porta a11y/TLS + CI), `dfdbad4` (setup do Android SDK no runner),
  `3230692` (versão 1.0.4), `8c31f47` (patches-list gerado). Tag `v1.0.4` no `8c31f47`.
- O JVM local continua quebrado (`Failed to mark memory page as executable`).

### Pendências quando o carro voltar

1. Baixar `patches-1.0.4.mpp` da release e aplicar ao XAPK 7.0.0 (Morphe Manager ou CLI).
2. Instalar no DiLink e repetir: `uiautomator dump` sem derrubar o app; Ajustes → Movimento;
   login até o WebView.
3. Investigar o timeout `LoadingHTML` via WebView DevTools (CDP) — sem isso o login continua
   bloqueado, independente do TLS.
4. Validar e só então subir versão, tag e release.

## Objetivo

Fazer o Apple Music 7.0.0 (`com.apple.android.music`, versionCode 1614) rodar no head unit
**BYD DiLink 3.0 (Android 10 / API 29)** com o bundle de patches Morphe, incluindo:

- landscape/tablet;
- startup sem GMS;
- backport das APIs 30 usadas pelo app;
- login da Apple funcionando;
- tela **Ajustes** funcionando;
- nova versão + tag + `.mpp` publicados seguindo o fluxo do repositório.

## Restrições confirmadas pelo usuário

- **Não instalar certificado no DiLink.** Essa abordagem foi tentada e não é opção.
- O app deve funcionar apenas com o **patch Morphe** aplicado ao APK e a instalação normal.
- O formato de distribuição/teste correto é o `.mpp` do Morphe, mas ele não corrige sozinho
  incompatibilidades de runtime. Até a 1.0.3 a regra era lançar só depois de login e Ajustes
  passarem no carro; em 2026-11-05 o usuário decidiu publicar a **1.0.4 sem essa validação** e
  seguir numa nova versão se aparecerem mais problemas.

## Estado do repositório

- Repositório: `https://github.com/andersonlucasg3/apple-music-android-freedom`
- Branch: `main`
- HEAD: `8c31f47 chore: regenerate patches-list for 1.0.4`
- Working tree: limpo quando este handoff foi escrito.
- Tags existentes: `v1.0.0`, `v1.0.1`, `v1.0.2`, `v1.0.3`, `v1.0.4`.
- Versão em `gradle.properties`: `1.0.4`.
- `patches-bundle.json` e `patches-list.json` apontam para `1.0.4`.
- Release `v1.0.4` publicada (asset `patches-1.0.4.mpp`).

## Estado do carro

- ADB: `10.202.204.179:5555`
- Produto: `DiLink3.0`
- Modelo: `BYD_AUTO`
- Android: 10 / API 29
- ABI: `arm64-v8a`
- Tela: `1920x1080`, densidade `240`
- WebView do sistema: `com.android.webview` **74.0.3729.186** (2019), `targetSdk 29`,
  `armeabi-v7a`.

A conexão ADB tem caído. Para reconectar:

```sh
adb disconnect 10.202.204.179:5555
adb connect 10.202.204.179:5555
adb devices -l
```

O APK atualmente instalado é o build de teste:

```
.pipeline/fix/applemusic-dilink-fixed22.apk
```

O `fixed22` é a base `fixed21` + configuração interna de confiança TLS, mas ainda não contém
o patch de acessibilidade descoberto depois.

## O que já funciona

- O app abre no DiLink e mostra a home/onboarding em landscape.
- A navegação principal (Início, Novidades, Rádio, Biblioteca, Buscar) renderiza.
- Ajustes abre e a tela **Letra** funciona.
- O fluxo de login chega ao WebView de autenticação da Apple (spinner), mas ainda não completa.
- Builds de teste são instalados com `adb install -r`.

## Login — diagnóstico atual

O problema tem duas camadas.

### 1. TLS/CA — já resolvido no APK de teste

- `gsd.apple.com` usa `Apple Root CA - G3`.
- O store de CAs do DiLink não contém essa raiz; no Brave o erro era
  `NET::ERR_CERT_AUTHORITY_INVALID`.
- O APK já contém `res/raw/apple_ca.pem` com a raiz/intermediário da Apple.
- Foi criado um `network_security_config.xml` interno apontando para `@raw/apple_ca`.
- Com essa configuração, `https://gsd.apple.com/auth/container/signin` retornou **HTTP 200**
  e os scripts de autenticação da Apple (`appleid.cdn-apple.com`) baixaram.

Isso prova que a correção de TLS **dentro do APK** funciona e deve ser portada para o patch
de verdade, sem instalar nada no carro. Preferir um `domain-config` restrito a
`gsd.apple.com` em vez do `base-config` amplo usado no teste.

### 2. WebContainer — ainda bloqueante

Depois do TLS, o app chega ao servidor, mas o WebView ainda falha com:

```text
Bootstrap failed: A timeout occurred in state: LoadingHTML
Error page displayed. title: , message: [9]
```

O processo continua vivo: é o “soft crash” descrito pelo usuário, não um `FATAL EXCEPTION`.

`Loading Mescal session` também falha com `Code 8`, mas o bootstrap continua; ainda não está
provado se isso é causa ou consequência.

Hipótese principal: a página/fluxo de autenticação usa recursos JavaScript incompatíveis com
o WebView 74. Próximo passo é habilitar WebView DevTools no build de teste, abrir o login e
inspecionar a página via CDP:

```sh
adb shell cat /proc/net/unix | grep webview_devtools_remote
adb forward tcp:9222 localabstract:webview_devtools_remote_<pid>
curl http://127.0.0.1:9222/json/list
```

Para isso, injetar `WebView.setWebContentsDebuggingEnabled(true)` no startup do app
(`MainActivity.onCreate` ou `AppleMusicApplication.onCreate`; a chamada existente em
`svgroupactivities/WebViewHolderImpl` não é do WebView de login).

## Ajustes — diagnóstico atual

Reprodução no carro:

1. Home → três pontos no topo direito → **Ajustes**.
2. A tela principal mostra: Iniciar Sessão, OPÇÕES DE TELA, Movimento, Letra, DIAGNÓSTICO.
3. **Letra** abre e renderiza os radios normalmente.
4. **Movimento** abre com título e uma linha divisória, mas o conteúdo fica **totalmente
   em branco**.
5. A seção **DIAGNÓSTICO** também aparece sem linhas na tela principal.

O `motion_settings_preference.xml` contém duas `CheckBoxPreference` com layout customizado
(`@layout/preference`, `@layout/switch_preference_layout`), então a suspeita está na inflação
dessas preferências no Android 10, não no backend de conta.

### Crash de acessibilidade descoberto

Ao usar `uiautomator dump`, o app cai com:

```text
java.lang.NoSuchMethodError: No virtual method
getStateDescription()Ljava/lang/CharSequence;
in class Landroid/view/View;

at x2.E$j.b(MusicApp:1)
at x2.a$a.onInitializeAccessibilityNodeInfo(MusicApp:46)
```

O dropbox também registrou um caminho anterior:

```text
java.lang.NoSuchMethodError: No virtual method
setStateDescription(Ljava/lang/CharSequence;)V
in class Landroid/view/accessibility/AccessibilityNodeInfo;
at androidx.compose.ui.platform.b$c.b(MusicApp:1301)
```

O `fixed22` já contém o bypass do Compose (`androidx.compose.ui.platform.b$c.b`), mas **não
contém** o equivalente da ponte AndroidX de acessibilidade. Isso não explica sozinho o
conteúdo em branco de Movimento, mas impede inspecionar a árvore de views e pode ser
disparado por serviços de acessibilidade do carro.

### Patch mínimo planejado para o teste binário

No DEX principal (`classes.dex`):

| Classe/método | Correção |
|---|---|
| `Lx2/E$j;->b(Landroid/view/View;)Ljava/lang/CharSequence;` | retornar `null` em API < 30 |
| `Lx2/E$j;->c(Landroid/view/View;)Lx2/W;` | retornar `null` em API < 30 |
| `Lx2/E$j;->d(Landroid/view/View;Ljava/lang/CharSequence;)V` | no-op em API < 30 |
| `Lx2/a$a;->onInitializeAccessibilityNodeInfo(...)` | neutralizar a chamada direta a `AccessibilityNodeInfo.setStateDescription` |
| `Ly2/j;->toString()` | neutralizar/guardar a chamada direta a `AccessibilityNodeInfo.getStateDescription` |

No patch de fonte, preferir helpers que preservem o comportamento em API 30+:
`AccessibilityCompat.getStateDescription/setStateDescription`, com guarda `SDK_INT >= 30`.
Não deixar no-ops permanentes se for possível manter a compatibilidade.

## Correções binárias já presentes no `fixed22`

Em `classes-v19.dex`:

- criação de provider `MediaRouter2` (`N4/a`, `N4/e`) ignorada em API < 30;
- remoção de `View.setWindowInsetsAnimationCallback` em `m1/t`, `S/b1.k2`, `S/n1.e`, `x2/E.m`;
- remoção de `WindowManager.LayoutParams.setFitInsetsSides/Types`;
- remoção de `Outline.setPath`;
- bypass da geração de nós de acessibilidade do Compose
  (`androidx.compose.ui.platform.b$c.b`);
- ajustes de MediaRouter edit-mode/null-route;
- guarda de WorkManager historical exit reasons;
- guarda de `Window.setDecorFitsSystemWindows`;
- seleção de `V$e`/`V$i` para WindowInsets;
- constantes de `AccessibilityAction` definidas como null em API < 30.

Em `classes4-v9.dex`:

- remoção de `Outline.setPath` em `Cf/q$a`;
- `Context.getAttributionTag` anulada em API antiga;
- remoção de `Outline.setPath` em `Of/a$a`;
- retorno antecipado em `Vf/k.onGlobalLayout`;
- correção de branch em `Wg/u.b`.

O diff de disassembly está em `/tmp/dex-diff.txt`; dumps em `/tmp/am-classes.dump`,
`/tmp/am-classes4.dump`.

## Artefatos e ferramentas

APK de teste e DEXs:

```
.pipeline/fix/applemusic-dilink-fixed22.apk
.pipeline/fix/classes-v19.dex
.pipeline/fix/classes4-v9.dex
.pipeline/fix/network_security_config.bin
```

Scripts:

```
.pipeline/tools/rebuild_apk_multi.py
.pipeline/tools/sign_apk_v2.py
.pipeline/tools/build_nsc_axml.py
```

Python virtualenv com `androguard`, `requests` e `websocket-client`:

```
.pipeline/venv
```

Rebuild do APK de teste:

```sh
.pipeline/venv/bin/python .pipeline/tools/rebuild_apk_multi.py \
  .pipeline/dilink/installed-base.apk \
  .pipeline/fix/applemusic-dilink-fixed23-unsigned.apk \
  classes.dex=.pipeline/fix/classes-v20.dex \
  classes4.dex=.pipeline/fix/classes4-v10.dex \
  res/xml/network_security_config.xml=.pipeline/fix/network_security_config.bin
```

Assinatura:

```sh
.pipeline/venv/bin/python .pipeline/tools/sign_apk_v2.py \
  .pipeline/fix/applemusic-dilink-fixed23-unsigned.apk \
  .pipeline/fix/applemusic-dilink-fixed23.apk \
  .pipeline/signing/signer-key.pem \
  .pipeline/signing/signer-cert.der
```

Instalação:

```sh
adb install -r .pipeline/fix/applemusic-dilink-fixed23.apk
```

**Não commitar** `.pipeline`, keystores, chaves ou artefatos grandes.

## Porta para o patch de fonte

Portar as correções binárias para:

```
patches/src/main/kotlin/app/morphe/patches/applemusic/dilink/AppleMusicDiLinkPatch.kt
extensions/extension/src/main/java/app/morphe/extension/applemusic/
```

Helpers desejados, em vez de no-ops permanentes:

- `OutlineCompat.setPath`;
- `LayoutParamsCompat.setFitInsetsSides/Types`;
- `ViewCompat.setWindowInsetsAnimationCallback`;
- `WindowCompat.setDecorFitsSystemWindows`;
- `ContextCompat.getAttributionTag`;
- helpers de acessibilidade (`getStateDescription`/`setStateDescription`);
- helper de compatibilidade do MediaRouter.

O patch de recursos precisa acrescentar `network_security_config.xml` com referência interna
a `@raw/apple_ca`. A referência já foi validada: `@raw/apple_ca` resolve para
`0x7f130000`. Fazer o `domain-config` mais estreito possível.

## Release 1.0.4

**Executada em 2026-11-05** (sem validação no carro, por decisão do usuário):

1. `gradle.properties` → `1.0.4`.
2. `patches-bundle.json` atualizado com versão, URL e descrição.
3. `README.md` e `analysis/validation.md` atualizados sem afirmar que login funciona.
4. `patches-list.json` regenerado no CI (`:patches:generatePatchesList`), não editado à mão.
5. Workflow de GitHub Actions criado e usado (o JVM local continua quebrado).
6. `patches-1.0.4.mpp` baixado e conferido (SHA-256).
7. Tag `v1.0.4` e release publicadas com o asset.

Pendente da lista original: aplicar no Morphe Manager/DiLink, validar login e Ajustes no carro.
Se algo falhar, corrigir e lançar a próxima versão.

Push, tag e release são ações externas: chamar `confirm` com a ação exata antes.

## Próximos passos, em ordem

> O patch de acessibilidade e o TLS já foram portados para a **fonte** em 2026-11-05 (ver a
> primeira seção). Os passos abaixo ficam para quando o DiLink voltar; o `fixed23` binário não é
> mais necessário se o `.mpp` novo for validado.

1. Reaplicar o patch binário de acessibilidade e gerar `fixed23`.
2. Instalar no carro e confirmar que `uiautomator dump` não derruba mais o app.
3. Abrir Movimento e inspecionar a árvore de views; se continuar em branco, capturar
   inflação/layout e logcat da `PreferenceFragmentCompat`.
4. Habilitar WebView DevTools e investigar o timeout `LoadingHTML` via CDP.
5. Verificar `Mescal Code 8` depois que a página carregar.
6. Portar tudo para o patch de fonte e fazer o `.mpp` via Actions.
7. Validar no Morphe Manager + DiLink antes da versão/tag.

## Riscos e observações

- O WebView 74 pode não suportar o bundle JavaScript moderno da autenticação Apple; o CDP
  deve confirmar isso antes de tentar substituir o WebView do sistema.
- O `uiautomator dump` aciona acessibilidade e derruba o app no estado atual; usar screenshots
  até o patch de acessibilidade.
- O ADB do carro é instável e pode cair no meio dos taps.
- O conteúdo em branco de Movimento pode ser um problema independente de layout/preferência,
  não apenas de acessibilidade.
- Não voltar a tentar `CertInstaller` ou qualquer instalação de certificado no DiLink.

## Sessão 2026-11-05 (continuação) — 1.0.9 no carro

- ADB do carro via Tailscale (`100.74.124.38:5555`) funcionou.
- **O app abre e navega no DiLink** (home renderiza em landscape, API 29).
- Correções de startup na fonte (mpp, versão 1.0.9):
  - `x2/V.<init>(WindowInsets)`: a injeção anterior caía em código inalcançável; agora é
    injetada após `Object.<init>` e escolhe `V$e` (API < 30), `V$i` (30–33) e o caminho
    original `V$j` (≥ 34).
  - `androidx.mediarouter.app.c.<init>`: forçar `isInEditMode()=true` só em API < 30; em
    API ≥ 30 isso deixava `mRouter` null e o `onAttachedToWindow` dava NPE.
- **Login bloqueado (não é o patch)**: `anisetteRequest(-1) failed` +
  `R8.b code=-45061` no `foothill`/ADI nativo.
  - Reproduzido no carro (API 29) e no S24 (API 36), com e sem o bypass de integrity.
  - Controle: APK original **sem patch, apenas re-assinado**, falha igual no S24; o app
    original instalado pela Play Store loga normalmente.
  - Conclusão: o re-sign quebra o atestado (Play Integrity/FairPlay ADI). Login em APK
    patcheado provavelmente exige bypass de atestação server-side — não resolvido.

## Sessão 2026-11-05 (login, continuação)

Progresso concreto (tudo na fonte/mpp):

- **JS da Apple no WebView 74**: `assets/index.js` e os chunks `appleauth` usam ES2020
  (`?.`, `??`), que o Chromium 74 não parseia. Foi criado `tools/fetch_assets.js` +
  `tools/assemble_assets.js` + esbuild (`tools/transpile_assets.js`), o blob
  `assets/transpiled_assets.bin` é publicado no repo e embutido em
  `res/raw/js_ams_adaptor.js` por `DilinkWebAssetsPatch`; `PlatformCompat.interceptWebResource`
  serve os assets transpilados em `shouldInterceptRequest`.
- **Anisette**: `PlatformCompat.applyAnisetteHeaders` injeta headers v3 do servidor
  `ani.sidestore.io` no interceptor de StoreAPI (`tb.a.a`); `remoteOtpResponse` substitui o
  `IAnisetteProvider.request` (classe dex `Le7/d;`, método `request-4PLdz1A`). O provider
  nativo (`Le7/k`) também foi substituído (`request`, `startProvisioning`, `synchronize`,
  `finishProvisioning`, `eraseProvisioning`, `dispose`), com `Expected` construído por reflexão.
- **API 30 extra**: `IBinder.getSuggestedMaxIpcSizeBytes()` (p507z3.C7059k) redirecionado.
- **Resultado**: e-mail/senha e **2FA são aceitos no S24** (código 324808 validado);
  o passo final `AMSIDMSAuthenticationCompleteAction` (commerce auth, **Anisette V1.5/AMD**)
  ainda falha com `commerceAuthenticationFailed` e apaga o provisionamento. O ADI nativo
  retorna `-45061` em qualquer build re-assinado; semear `adi.pb` do iTunes Windows não
  resolveu (identidade ligada ao keychain do Windows).
- Apple Music da MS Store usa **PlayReady**, não gera `adi.pb`.
- **`libCoreADI.so` importa apenas `libc`/`libdl`** (sem JNI, PackageManager, rede ou SSL):
  `open/lstat/fstat/read/write/mkdir/__system_property_get/gettimeofday`. Logo o `-45061` é
  estado local (arquivos/propriedades), não uma checagem de assinatura via Java. A hipótese
  mais forte agora é que o **provisionamento nunca completa** (o intercâmbio com a Apple é feito
  pelo StoreApi, fora da lib), possivelmente por falta de token de integrity válido.
- Substituto do provider levado ao limite: `Le7/d.request-4PLdz1A`, `provisioning`,
  `synchronize`, `eraseProvisioning` e o provider nativo `Le7/k` (`request`, `start`, `finish`,
  `sync`, `erase`, `dispose`) foram trocados por respostas nossas. `remoteOtpResponse` funciona
  até para `dsid=-2`; falsificar `startProvisioning`/`synchronize` faz o fluxo cair em
  “Ocorreu um problema ao conectar com o servidor” antes do 2FA — ou seja, o AMSCore precisa de
  dados reais de provisionamento, não de um `Success` vazio.
- Automação de UI por **CDP** (`tools/cdp_login.js`, `tools/cdp_watch.js`, `tools/cdp_eval.js`)
  tornou o login reproduzível no S24 (preencher campos e clicar em “Continuar”/“Iniciar sessão”).
- Próximo: RE do `libCoreADI` para achar o caminho do `-45061` e/ou uma fonte Anisette V1.5/AMD
  que aceite o provisionamento sem o ADI nativo.

## Sessão 2026-11-05 (resolvido) — login + playback no DiLink

- A pesquisa pública corrigiu o diagnóstico: `-45061` é `kADINotProvisioned` (estado), não assinatura.
  O `INativeAnisetteProvider` foi substituído por OTP local, sem `libCoreADI`.
- Identidade Android provisionada com `apple-auth` (MIT), driver em `.pipeline/apple-auth`:
  GrandSlam (`device-android-1`, secondary 384 B, profile −2) e Store (`device-android-store`,
  secondary 272 B, profile −1). Port Java do OTP em `extensions/.../adi/{AmdOtp,StoreOtp,Tables,StoreTables}.java`,
  perfis em `AdiProfile.java`/`StoreProfile.java` (gerados por `tools/gen_adi_profiles.py`).
- Provider devolve **OTP cru**: GrandSlam com envelope de 28 B (v5 + trailer 4) e Store com AMD de
  24 B (v4, sem trailer); machine ID de 60 B.
- `Surface.setFrameRate` (API 30, ExoPlayer) redirecionado — era o crash no playback após o login.
- Resultado: conta ativa no S24 e no carro (`AccountTable.json`, DSID 1123805986) e **player
  tocando** no DiLink; UI de letras, fila, busca e Ajustes navegáveis.
- Pendências: layout em API 29 (faixa preta nas letras, cards cortados à direita, gaps no Ajustes).
- Release 1.1.0: `.mpp` (entrada XAPK; APKM rejeitado pelo `apkFileType = XAPK`) e APK merged
  `AppleMusic-1.1.0-DiLink.apk` para instalação manual.

## Sessão 2026-11-06 — fixes de UI (sem o carro)

O carro não estava acessível; tudo abaixo foi feito por análise de código/screenshots e build
local. **Nada foi validado no DiLink com o build novo.**

- **Repositório renomeado** para `andersonlucasg3/apple-music-android-freedom`: remote, README,
  `patches-bundle.json`, metadados do `patches/build.gradle.kts`, URL raw de
  `DilinkWebAssetsPatch.kt` e `analysis/validation.md` atualizados (commit `22820a8`). A release
  1.1.0 continua acessível no nome novo.
- **Login (WebView) — coloração quebrada (corrigido na fonte):** o widget da Apple escolhe o tema
  com `matchMedia("(prefers-color-scheme: dark)")`; o WebView 74 tem `matchMedia`, mas não a media
  feature, então `matches` é sempre falso. Resultado: fundo preto (WebView) + textos do tema claro
  (`#1d1d1f`/`#494949`) e input claro. No S24 o `matches` é verdadeiro e o tema escuro fecha.
  Correção em `PlatformCompat.interceptWebResource`: o JS servido por `shouldInterceptRequest`
  passa por `applyColorSchemeCompat`, que troca as 6 ocorrências (1 `.matches` + 5 atribuições) por
  um resultado "dark". JS reescrito passou no `node --check`.
- **Letras — faixa preta (corrigido na fonte):** `player/c1.g` esconde a nav bar com
  `setSystemUiVisibility(vis | 4098)` (IMMERSIVE_STICKY|HIDE_NAVIGATION) sem
  `LAYOUT_HIDE_NAVIGATION`; em API 29 o conteúdo continua com 990 px e a área da barra (90 px)
  fica preta. Fingerprint `PlayerLyricsImmersiveFingerprint`: em API < 30 o método retorna antes
  de aplicar o imersivo (a barra do BYD volta, como nas outras telas); API 30+ inalterada.
  Verificado por `dexdump` no dex patcheado.
- **Carrosséis:** a geometria está correta — 6 cards de 274 px + 30 px de vão + 34 dp de margem
  esquerda; os 54 px à direita são o `peek` de 36 dp do próximo card (`AbsolutePeekCarousel`).
  O 6º card termina dentro da tela; o "Chill" cortado é a própria arte. Decisão de remover o peek
  é de design, não bug de API.
- **Ajustes:** tela é Compose (`AccountSettingsFragment` → `LazyColumn`). As linhas de toggle de
  "Buscar Amigos" reservam altura (249 px cada) mas não pintam nada (pixels 0,0,0 até com
  brightness 8×). Suspeita: alpha/cores do Compose theme no host; ainda **UNVERIFIED** — precisa
  de dump da árvore (uiautomator já não derruba o app) ou reprodução em emulador.
- **Build local voltou a funcionar:** o erro `IllegalArgumentException` do plugin `app.morphe.patches`
  era falta de `GITHUB_ACTOR`/`GITHUB_TOKEN` (não do JVM). Com JDK 21 + essas variáveis,
  `:patches:buildAndroid` e `morphe-desktop patch` rodam. Test build:
  `.pipeline/tmp/ui-fix-test.apk` (104 MB, arm64, assinado pelo morphe-desktop) e
  `patches/build/libs/patches-1.1.0.mpp` regenerado localmente (sem release).
- **Emulador:** o AVD x86_64 API 29 foi criado em `.pipeline/emulator/` (WHPX OK), mas o APK é
  arm64-only (`INSTALL_FAILED_NO_MATCHING_ABIS`). Para separar API de qualificador de tela, o
  teste correto é o mesmo APK num emulador API 36 1920x1080/240dpi, não num API 29 x86.


