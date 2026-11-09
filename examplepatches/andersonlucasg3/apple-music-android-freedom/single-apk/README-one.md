# APK único — Apple Music One

Um APK por ABI com o **engine Apple Music 7.0.0 patcheado** e a nossa UI **embutida**:
sem companion, sem `sharedUserId` de terceiros, sem recursos próprios. A activity do
engine (`com.apple.android.music.common.MainActivity`, login) continua no APK; só deixa
de ser a `LAUNCHER`.

- UI: [`single-apk/single-ui`](single-ui) — package `com.anderson.applemusic.one`, agora
  organizado em `theme/`, `widget/`, `screen/` e `media/`.
- Build: [`single-apk/build-one-apk.ps1`](build-one-apk.ps1).
- Empacotamento (dex extra + manifest binário + assets/one): [`tools/axml_inject.py`](tools/axml_inject.py)
  e [`tools/pack_single_apk.py`](tools/pack_single_apk.py), herdados do spike da fase A.
- Evidências desta revisão visual: [`evidence/revamp-one-*`](evidence).

## Por que funciona

O engine foi minerado pelo R8: qualquer classe/extensão de terceiro (AndroidX, Kotlin,
Compose, Coil) colide com a cópia que já existe no dex do engine. A UI aqui é **só Java
+ APIs do framework** (`android.app.Activity`, `MediaBrowser`/`MediaController`,
`HttpURLConnection`, `org.json`, `LruCache`, `GradientDrawable`, `Path`, `SeekBar`), **sem
`res/`** e **sem `R.*`** — as únicas classes no dex gerado são
`com.anderson.applemusic.one.*` (normais + anônimas), então ele convive com o dex do engine
na posição `classesN.dex`. A auditoria do build falha se qualquer classe de fora aparecer.

## Módulo da UI

Não há módulo Gradle: o build é `javac --release 8` + `d8 --min-api 29`, compilando contra
`android-36` (compileSdk 36), sem dependências e sem buildConfig. Os **assets** (Inter) são
copiados para dentro do APK em `assets/one/` (ver **Build**).

### Estrutura de pacotes

| Pacote | Arquivos | Papel |
|---|---|---|
| `theme/` | `Tokens`, `Inter`, `Shapes`, `ColorArt` | design tokens (cores/raios/tipo/escala), tipografia Inter via assets, `GradientDrawable` arredondado + `clipToOutline`, cor dominante da capa |
| `widget/` | `TopBar`, `TabView`, `MiniPlayer`, `CoverCard`, `SeeAllCard`, `ShelfView`, `ListRow`, `SectionHeader`, `ActionSheet`, `EmptyState`, `Skeleton`, `Pill`, `CircleButton`, `Focus`, `Icons`, `IconView` | componentes reutilizáveis; ícones desenhados em `Path` |
| `screen/` | `HomeScreen`, `LibraryScreen`, `RadioScreen`, `CollectionScreen`, `DetailScreen`, `NowPlayingScreen`, `SearchScreen`, `UpdatesScreen`, `AccountScreen` + `ScreenHost`/`ChildSink` | telas e navegação; não há `Fragment`/AndroidX |
| `media/` | `MediaClient`, `ArtworkLoader`, `CatalogSearch`, `CatalogResolver`, `AccountSession` | `MediaBrowser`/`MediaController` do engine, capas, busca na `amp-api`, resolução de nomes da biblioteca e leitura da conta |
| `one` | `OneActivity`, `UpdateManager`, `Version` | shell (activity, overlays, updater, versão gerada no build) |

`ScreenHost` é o contrato mínimo entre `OneActivity` e as telas: assinar um nó do browse,
tocar/enviar ação, abrir/fechar overlays e escrever na linha de status. As telas não
conhecem `MediaBrowser`, updater nem reflexão.

## Design system

Tokens espelhados dos companions Compose (`tv-app/TvTheme.kt`, `car-app/Theme.kt`):

| Token | Valor |
|---|---|
| fundo | `#000000` (player: `#0A0A0B`) |
| superfícies | `#1C1C1E` / hover `#2C2C2E` / pressed `#313134` |
| texto | `#FFFFFF` / secundário `#8E8E93` |
| accent | `#FA243C` |
| trilha | `#3A3A3C` |
| raios | card 16 dp, controle 14 dp, sheet 20 dp, capa pequena 8 dp |
| tipo | display 34–36, seção 24–26, card 15–16, caption 12–13 (pesos 400/500/600/700) |
| foco | escala 1.05 em 160 ms + contorno accent; toque = ripple, sem hover |

- **Inter** (SIL OFL): os 4 TTFs estão em
  [`single-ui/assets/fonts`](single-ui/assets/fonts) (copiados de
  `tv-app/src/main/res/font`) e a licença em [`single-ui/assets/OFL.txt`](single-ui/assets/OFL.txt).
  O build empacota tudo em `assets/one/`; `Inter.load()` usa
  `Typeface.createFromAsset(assets, "one/fonts/inter_*.ttf")` e cai em `sans-serif` se o
  asset não existir (ex.: build antigo do CI).
- **Ícones**: `Icons.IconDrawable` desenha play, pause, prev, next, busca, conta, chevrons,
  close, check, refresh, plus, home, rádio, biblioteca, nota, more e download em `Path`
  sobre uma grade 24×24. Nada de `android.R.drawable`.
- **Cards**: capa quadrada dominante com cantos 16 dp (`clipToOutline`), scrim
  `GradientDrawable` linear na base, título/subtítulo com ellipsize e “Tocar” em accent.
  “Ver tudo” é um card de superfície com chevron. Elevação é estática (2 dp), sem sombra
  animada.
- **TV**: `Focus` aplica 1.05/160 ms, contorno accent e troca de superfície; a hero é
  full-bleed, então usa só o contorno (escala cortaria as bordas). As fileiras encadeiam
  `nextFocusLeft/Right` e `nextFocusDown` (card → mini player). No emulador de TV —
  que se anuncia como touchscreen — o modo D-pad vence por `leanback`/`uiMode`.
- **Toque** (celular/carro): ripple limitado ao raio; nenhum estado de hover.
- **Mini player**: barra persistente com capa 40 dp, título/artista e play/pause; tocar
  fora do botão abre o player cheio; fica acima da busca e das telas.
- **Skeleton**: blocos `#1C1C1E` com pulso de alpha substituem a tela até o catálogo
  chegar (sem “piscar” de vazio → cheio).

## Build

```powershell
./single-apk/build-one-apk.ps1 -PoneVersion 1.9.13         # versionCode 10913 derivado
./single-apk/build-one-apk.ps1 -Abi arm64,arm32 -PoneVersion 1.9.13
```

O build compila a UI uma vez e gera, para cada ABI:

| ABI | Engine de entrada | Saída |
|---|---|---|
| arm64 | `.pipeline/ci162/AppleMusic-engine-arm64.apk` | `single-apk/out-one/AppleMusic-one-arm64.apk` |
| arm32 | `.pipeline/rel160/AppleMusic-engine-arm32.apk` | `single-apk/out-one/AppleMusic-one-arm32.apk` |
| x86 | `.pipeline/emulator/AppleMusic-engine-x86.apk` | `single-apk/out-one/AppleMusic-one-x86.apk` |

Antes do `javac` o build gera `out-one/generated/.../Version.java` com `NAME = -PoneVersion`,
`CODE = -PoneVersionCode` (derivado como `MAJOR*10000+MINOR*100+PATCH`) e `ENGINE`, o
`versionName/versionCode` lido do APK de engine de entrada (o painel de Atualizações
continua mostrando `7.0.0 (1614)`). Desde a 1.9.10 o build também **grava essa versão da
UI no `<manifest>` do APK** (`--version-name`/`--version-code` do `axml_inject.py`): o
pacote instalado deixa de se chamar 7.0.0/1614, e o updater compara
`one-<abi>.versionCode` com o `versionCode` que o **PackageManager** reporta para o
pacote instalado — o mesmo que `dumpsys` e `aapt2 dump badging` mostram.

Passos por ABI: extrai o `AndroidManifest.xml` binário → injeta a activity (MAIN/LAUNCHER +
tema), a `<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES"/>` e
o `versionName`/`versionCode` da UI →
empacota o dex novo como `classesN.dex` **e os assets em `assets/one/`** →
`zipalign -p 4` → `apksigner` com `tools/tv-app-signing.p12` (alias `morphe`, senha
`Morphe`) → verifica assinatura, `launchable-activity`, presença de
`assets/one/fonts/inter_bold.ttf` + `assets/one/OFL.txt` e audita o dex com `dexdump`.

`pack_single_apk.py` copia `single-apk/single-ui/assets` para `assets/one/` e falha se
algum caminho já existir no engine; `--assets` é opcional e o default encontra o diretório
no checkout, então o caminho bash do CI continua funcionando (e passa a levar a Inter).

Auditoria do dex (falha o build se sobrar classe de fora):

```
dexdump -l plain single-apk/out-one/dex/classes.dex | findstr "Class descriptor"
# 262 classes, todas Lcom/anderson/applemusic/one/...
```

## Instalar / abrir

Sempre por cima do engine já instalado (`install -r`), nunca desinstalando — o UID e a
conta são preservados:

```powershell
adb -s RXCX100BZ5J  install -r single-apk/out-one/AppleMusic-one-arm64.apk   # celular
adb -s emulator-5554 install -r single-apk/out-one/AppleMusic-one-x86.apk    # TV x86

adb -s <serial> shell am start -n com.apple.android.music/com.anderson.applemusic.one.OneActivity
```

O engine continua logado; o botão **Conta** abre o painel de conta (ver **Login**).

## Login (conta Apple)

O engine **não tem activity de autenticação**. O login é o diálogo Compose
`AuthenticationDialogAms` (`com.apple.mediaservices.amsfacade`), criado pelo
`DialogConnectorViewModel` da activity. O fluxo continua igual:

1. **Conta** abre o painel de conta (mesmo padrão visual do resto); “Entrar na conta
   Apple” inicia `com.apple.android.music.common.MainActivity` (a activity do engine que
   hospeda o `StoreApiDialogs` — ela herda de `StoreBaseActivity`);
2. por reflexão chama `S()` na activity: instala a `ComposeView` de `StoreApiDialogs` em
   tela cheia, cobrindo a home do engine;
3. chama `U().showAMSAuthWithType(AuthenticateRequest.Type.Interactive)`: o diálogo AMS
   aparece e é ele que dispara o login (`AuthenticationDialogAms` →
   `AmsAuthViewModel.startSignIn`).

Resultado: **Entrar** abre direto a tela *"Continue com o e-mail ou número de telefone"*
do Apple ID. Se a reflexão falhar (classe ou método ausentes em outro build), o botão cai
no comportamento antigo: abre a `MainActivity` do engine.

### Deep link / extra: não existe para o login de conta

Testado no emulador (`am start -a VIEW -d ... -n com.apple.android.music/.common.MainActivity`):

- `apple-music://accountSummary` → home do engine (nenhum auth);
- `https://itunes.apple.com/accountSummary` → tela **Account** do engine (nenhum auth);
- `music://itunes.apple.com/sonosAuth` e os demais `apple-music://...` são roteados pelo
  `C3871e`/`deeplink` para destinos de conteúdo/commerce; não chamam
  `showAMSAuthWithType`;
- `musicsdk://applemusic/authenticate-v3?appPackage=<pkg>&devToken=<token>&appName=<nome>`
  (`SdkAuthActivity`) **abre a mesma tela do Apple ID** via
  `SdkLandingViewModel.signIn` → `X6.e.c(..., SDK)`, mas é o fluxo de autorização do
  **MusicKit SDK**: exige `devToken`/`appPackage`, mostra o consentimento do SDK, devolve
  um `music_user_token` para o app chamador, chama `moveTaskToBack` ao terminar e tem um
  guard de uso único (`C.f45619d`). Com parâmetros de teste ele fica preso no loader.
  Por isso **não** é usado como caminho principal; a reflexão é o caminho suportado.

O manifest do engine não declara nenhuma activity de auth própria
(`SdkAuthActivity`/`SonosAuthActivity` só repassam para a `MainActivity`;
`SocialWebActivity` é WebView de social), e o diálogo é Compose — não dá para instanciá-lo
numa `Activity` pura sem AndroidX/Compose no nosso dex.

### Fechar o sheet (X) ou concluir o login

O sheet AMS é um overlay Compose dentro da `MainActivity` do engine. Fechar pelo **X**
(`userClosedPageView` → `onDismiss` → `DialogConnectorViewModel.hideAMSAuthWithType`) ou
concluir o login (o `AmsAuthViewModel` emite o resultado e o mesmo `onDismiss` roda) só
esconde o sheet; a home do engine continuaria na frente. A UI observa
`getShouldShowAMSAuthWithType()` do `DialogConnectorViewModel` (por reflexão, a cada 250 ms)
e, quando ele volta a `null`, chama `finish()` na `MainActivity`. Assim **X**, **BACK** e
login concluído caem de volta nesta UI; o engine (processo, serviço e conta) continua vivo
como backend. O painel de conta é fechado ao voltar do engine.

### Volta do engine: catálogo recarregado

Ao abrir a `MainActivity` a UI marca `refreshOnResume`; no `onResume` ela limpa abas,
prateleiras, drill-down e capas, reconecta o `MediaBrowser` (o serviço pode ter reiniciado
após o login) e reassina `__AUTO_ROOT__`. O `MediaClient.disconnect()` descarta cache e
callbacks, então nada velho é reentregue; se o catálogo vier vazio/erro (serviço ainda
subindo), a UI reconecta até 4× antes de desistir.

### Painel de Conta: perfil logado x convite deslogado

`AccountScreen` lê o estado da conta do próprio engine, sem classes do engine no nosso
dex (`media/AccountSession.java`):

- **Sessão**: `files/AccountTable.json` (StoreApi/Gson) tem `accounts[]` + `activeAccount`;
  um item ativo com `dsid != 0` é a sessão logada — o mesmo critério do
  `AccountStore.isLoggedIn()`. O arquivo é lido a cada `open()`, então voltar do login já
  mostra a conta nova.
- **Perfil**: `firstName`/`lastName` (ou o Apple ID `id` como fallback) e o `id` viram
  nome e e-mail; a inicial do nome vira o avatar.
- **Assinatura**: `files/datastore/settings.preferences_pb`, chaves
  `subscription_status` (`ENABLED`/`DISABLED`/`UNLINKED`/`GLIDE`),
  `subscription_reason` (`INDIVIDUAL`/`FAMILY`/`MEMBER`/…), `subscription_is_family` e
  `subscription_free_trial` — exatamente o que o `a1.i()` do engine lê. Resultado:
  “Assinatura Individual/Família/Universitária/pela operadora”, “Teste grátis”,
  “Assinatura em carência”, “Sem assinatura ativa” ou “Assinatura não informada”.
- **Deslogado**: o convite e o botão “Entrar na conta Apple” continuam iguais, chamando
  `host.openAccount()` (reflexão `S()`/`showAMSAuthWithType` já existente).
- **Ações (logado)**: **Gerenciar assinatura** e **Conta Apple** abrem a tela Account do
  engine (deep link + componente, ver 1.9.12); BACK volta para esta UI. Sign out continua
  fora do painel.
- **Sair**: não há botão. Deslogar exige o `AccountStore.removeAccount`/`clearActive` +
  `SignOutTask` do AMSKit; o manifest não declara activity nem deep link de sign-out, e
  mexer nos arquivos à mão arriscaria a conta. O painel avisa que o sign-out não é feito
  ali.

Teste do estado deslogado: como o celular e o emulador estão logados, o painel foi
renderizado deslogado com um `--ez one.signedOut true` temporário (removido antes do
commit), sem tocar na conta; o screenshot `account-signedout-tv.png` é dessa execução.

### Voltar (BACK) no Android 15/16

Com targetSdk 36 o *predictive back* vem ligado: o sistema deixa de chamar
`Activity.onBackPressed()`. `OneActivity` registra o mesmo fechamento em
`OnBackInvokedDispatcher` (API 33+) — ações, atualizações, conta, busca, player cheio,
“Ver tudo” e o drill-down — e mantém `onBackPressed()` para API 29–32.

## O que está funcional

- **Início**: hero da primeira prateleira (capa, “EM DESTAQUE”, título display, Tocar),
  prateleiras horizontais com cards de capa e “Ver tudo” como card com chevron;
  carregamento com skeleton; “Tocar agora” quando o nó é uma lista de reproduzíveis.
- **Biblioteca**: tela própria com contagem por categoria, filtro local, linha
  **Aleatória** e seções (Adições Recentes, Playlists, Artistas, Álbuns) com cards,
  “Ver tudo”, ícone por seção e **ordenação A–Z / Recentes** persistida (1.9.11); artista/
  álbum/playlist de biblioteca abrem as telas de detalhe resolvendo o id de catálogo pelo
  nome. Rádio continua em grade de estações (`RadioScreen`), com breadcrumb, botão **‹** e
  drill-down; “Ver tudo” de uma prateleira abre o `CollectionScreen` em overlay com o mesmo
  tratamento.
- **Navegação hierárquica**: artista → álbuns (browse), álbum → faixas e playlist → faixas
  (amp-api), com **Tocar** a coleção inteira e toque numa faixa que já começa nela. Detalhes
  de ids e degradação na seção **Navegação hierárquica**.
- **Now Playing fullscreen**: fundo em gradiente escuro derivado da **cor dominante da
  capa** (`ColorArt`), capa grande 16 dp, título/artista/álbum, progresso com tempos,
  prev 60 / play 80 / next 60 (play em accent), **aleatório/repetir/favorito**,
  **Criar Estação**, **Ações** e **Fila**. Layout lado a lado em TV/carro e empilhado no
  celular; no layout lado a lado os três toggles ficam na linha do cabeçalho (ao lado de
  Ações) porque a janela girada não tem altura sobrando. Seek arrasta e envia `seekTo`.
- **Aleatório / Repetir / Favorito**: aparecem só quando a sessão publica a ação
  correspondente (`...playback.action.SHUFFLE`, `.REPEAT`, `.FAVORITE` em
  `PlaybackState.getCustomActions()`); cada botão tem `contentDescription` e envia
  `sendCustomAction` com confirmação própria ("Aleatório alternado", "Repetir alternado",
  "Favorito alternado"). O engine **não publica o estado** resultante (nem em
  `PlaybackState`/extras, ver **Limitações**), então os botões não pintam estado ativo, e
  as três ações **não são duplicadas** no sheet "Ações".
- **Fila / “A seguir”**: pill **Fila** no player (escondida quando a sessão não tem fila)
  abre um sheet com `MediaController.getQueue()` — número, título, artista, a faixa atual
  em accent com o glifo de play. Tocar uma linha chama
  `skipToQueueItem(QueueItem.getQueueId())`; o sheet fica aberto e o destaque anda junto.
  BACK com o sheet aberto fecha só o sheet.
- **Coleções de faixas**: quando o nó lista faixas (não mais coleções), `CollectionScreen`
  mostra **Tocar** no cabeçalho, numera as linhas e marca a que está tocando; tocar uma
  linha toca a coleção e salta para aquela faixa. Se o engine não montar a fila a tempo,
  cai para `playFromMediaId` da própria faixa.
- **Ações**: sheet centrado com as `customActions` restantes (Reprodução Automática,
  Adicionar à Biblioteca, Criar Estação), linhas de 56 dp, bullet accent para
  “Criar Estação”, feedback e Fechar. Aleatório/Repetir/Favorito saíram do sheet: são
  botões do player.
- **Mini player**: persistente em todas as telas, capa 40 dp, play/pause; toque fora do
  botão abre o player. No D-pad, DOWN de um card foca a barra e ENTER abre o player.
- **Busca**: campo arredondado, **escopo Catálogo / Biblioteca**, resultados agrupados por
  tipo (Músicas/Álbuns/Artistas/Playlists) com capa, skeleton durante a consulta, estado
  vazio e estado sem conexão com “Tentar de novo” + fallback “Abrir a busca do Apple Music”.
  Os **últimos 10 termos** ficam em `SharedPreferences` e aparecem com **Limpar** quando o
  campo está vazio; tocar num recente preenche e busca. O escopo **Biblioteca** filtra
  **localmente** artistas/álbuns/playlists já carregados de `/library` (sem nenhum GET);
  o **Catálogo** usa a amp-api. TV usa o IME do sistema. Tocar um resultado abre o nível
  correspondente (artista/álbum/playlist/faixa); **longa pressão** continua tocando o
  resultado direto. **Um GET por submit**: ENTER e `IME_ACTION_SEARCH` (e o botão Buscar)
  com o mesmo termo em voo viram uma requisição só, e respostas de uma consulta antiga são
  descartadas por token de geração — a última consulta vence.
- **Telas de detalhe**: `DetailScreen` empilha **artista → álbum → artista → faixa** com
  breadcrumb, botão ‹ e BACK nível a nível. Artista (arte, gêneros, todos os álbuns em
  grade, músicas principais), álbum (capa, título, artista clicável, ano, gênero, nº de
  faixas, gravadora/copyright, faixas com duração e **Tocar**), playlist (curador, texto,
  faixas com duração) e faixa (artista e álbum clicáveis, duração, **Tocar**). Abrir o
  álbum a partir de uma faixa rola e destaca aquela faixa.
- **Detalhe a partir de qualquer ponto**: cards do Início/Rádio e “Ver tudo” com id de
  catálogo (`3-` álbum, `4-` playlist, `6-` artista) abrem a tela de detalhe; itens de
  biblioteca (só `persistentId`) resolvem o id de catálogo pelo nome e abrem a mesma tela;
  estações (`9-`) tocam.
- **Conta**: com sessão ativa, mostra o **perfil** do engine (avatar com a inicial,
  nome, Apple ID e assinatura) e os links **Gerenciar assinatura** / **Conta Apple**, que
  abrem a tela Account oficial (um BACK volta ao painel), e **Ajustes do Apple Music**, que
  abre a tela de Ajustes do engine (um BACK volta ao painel; ver Onda 3a); sem sessão,
  mostra o convite e o botão oficial de login do Apple ID (fluxo acima). O estado é relido
  a cada abertura.
- **Atualizações**: painel com versão instalada (`1.9.13 (10913)`), versão do engine,
  mensagem de estado, progresso, Verificar / Baixar e instalar / Cancelar / Fechar.
  Compara `one-<abi>.versionCode`, baixa, confere SHA-256 e instala via `PackageInstaller`.
- **Estados**: vazio, erro e sem conexão com ícone e texto (`EmptyState`) em Início,
  Biblioteca, Rádio, Busca e Atualizações.
- **Rotação/estado**: girar o aparelho recria a activity, mas a tela volta igual — aba
  selecionada, pilha de overlays (coleção com breadcrumb, detalhe artista → álbum, busca,
  player, fila, ações, conta, atualizações), filtro da Biblioteca, termo da Busca e
  posição de scroll (guardada como fração do alcance, então portrait ↔ landscape mantém o
  lugar). O conteúdo é recarregado do engine/amp-api — uma assinatura por nó e uma consulta
  por busca —, sem duplicar o carregamento; gira de novo antes de a árvore chegar? o estado
  pendente é repassado. Log: `root arrived, tab=N (restored)` e
  `overlays restored: collection=… detail=… player=… queue=… actions=…`. Detalhes na seção
  **Rotação e estado (1.9.7)**.
- **Foco D-pad**: abas com contorno/pill, cards com 1.05 + contorno accent, player com
  cadeia explícita de foco, sheets com foco nas linhas; DOWN do chrome entra no conteúdo.

## Fila e “começar da faixa N” (investigação no device)

Medido com o engine 7.0.0 (1614) logado, em `RXCX100BZ5J` (arm64) e `emulator-5554`
(TV x86), via `adb logcat -s AppleMusicOne` e `adb shell dumpsys media_session`:

1. **Tocar uma coleção** (`playFromMediaId("__AUTO_ROOT__/library/albums/3-…")`) monta a
   fila da coleção: `dumpsys media_session` → `queueTitle=null, size=18`, metadata da
   faixa 1 (`Red Lights`); o log do `MediaController.getQueue()` lista os itens com
   `QueueItem.getQueueId()`, `getDescription().getTitle()/getSubtitle()/getMediaId()` —
   p.ex. `queue[0] id=0 media=870659635 title=Red Lights`. O engine também acrescenta
   autoplay ao fim da fila (18 → 28 itens), então a fila é maior que o álbum.
2. **`skipToQueueItem` funciona e o `id` é o `QueueItem.getQueueId()`**, que neste engine
   é o índice 0..n-1 (a fila é reindexada a cada troca). Prova: `skipToQueueItem 2` →
   metadata `Light Years Away (feat. DBX)` no celular e `Sana Corazón` na TV, com
   `state=PLAYING` e a posição seguindo; o sheet reflete a nova ordem (o engine reordena
   a fila para começar na faixa escolhida).
3. **Faixa isolada**: `playFromMediaId(<id de faixa>)` também cria fila (o engine monta
   uma fila curta, p.ex. 3 itens), mas o id da faixa não carrega o contexto do álbum.
4. **Não existe “playFromMediaId(coleção) + extras com índice”**: o caminho do engine é
   `PlaybackMediaIdHandler.createProviderForMediaId(String)` — só a string do media id,
   sem `Bundle` — e `MediaSessionCallbacks` (`C3928e0`) chama `prepare(provider, index,
   true, position)` com índice 0. Os `startItemIndex` de
   `StorePlaybackQueueItemProvider`/`LibraryCollectionPlaybackQueueItemProvider` só são
   preenchidos pelos builders internos, não por extras da sessão.
5. **A árvore do Android Auto expõe artistas, mas não faixas de álbum/playlist** (detalhes e
   ids na seção **Navegação hierárquica**): `__AUTO_ROOT__/library` tem 5 nós; os itens de
   artista (`6-<persistentId>`) são marcados `browsable=false` mas **assiná-los devolve os
   álbuns do artista**; um álbum (`3-`) ou uma playlist (`4-`) assinados devolvem a lista de
   álbuns/playlists inteira, nunca as faixas. Por isso o “tocar a coleção e pular para a
   faixa N” usa o **id de catálogo** resolvido na amp-api; o id de biblioteca continua
   servindo para tocar a coleção inteira quando a resolução falha.

## Navegação hierárquica

Medido no device (engine 7.0.0, `RXCX100BZ5J` e `emulator-5554`) com uma sonda que assina
cada nó e loga id/título/subtítulo/flags; os logs estão resumidos na tabela.

### O que vem do browse tree

| Nó assinado | Filhos | id do filho | flags do filho |
|---|---|---|---|
| `__AUTO_ROOT__` | Início, Rádio, Biblioteca | `__AUTO_ROOT__/home`, `/radio`, `/library` | `browsable` |
| `__AUTO_ROOT__/library` | Aleatória (`/library/songs`), Adições Recentes, Playlists, Artistas, Álbuns | `__AUTO_ROOT__/library/<nó>` | Aleatória `playable`; demais `browsable` |
| `/library/songs` | 0 | — | toca a biblioteca embaralhada |
| `/library/recently_added` | 12 itens mistos | `.../recently_added/3-…` (álbum) e `/4-…` (playlist) | `playable` |
| `/library/artists` | 93 artistas | `.../artists/6-<persistentId>` | `browsable=false`, `playable=true`, sem capa |
| `/library/artists/<6-…>` | **os álbuns do artista** (AC/DC 1, Angra 2, Avenged Sevenfold 9) | `.../artists/6-…/3-<persistentId>` | `browsable=false`, `playable=true`, capa https |
| `/library/albums` | 281 álbuns | `.../albums/3-<persistentId>` | `browsable=false`, `playable=true` |
| `/library/albums/<3-…>` | **não são faixas**: devolve os 281 álbuns de novo (idem `/songs` e `/tracks`) | — | — |
| `/library/playlists` | 18 playlists | `.../playlists/4-<persistentId>` | `browsable=false`, `playable=true` |
| `/library/playlists/<4-…>` | 0 filhos; `/songs` e `/tracks` devolvem as 18 playlists de novo | — | — |
| `/home/<prateleira>` | cards de catálogo | `3-<catalogId>`, `4-pl.<id>`, `9-ra.q-…` (estação) | `playable` |

- **Formato dos ids**: itens de biblioteca são `<contentType>-<persistentId>` da
  `MediaLibrary` — `3` álbum, `4` playlist, `6` artista —, sem id de catálogo. Os `extras`
  da `MediaDescription` só trazem dicas de estilo do Android Auto. As prateleiras do Início
  já vêm com **id de catálogo** (`3-1445027335`, `4-pl.…`). A fila revela ids de catálogo
  de faixa (`queue[0] media=1704078588`), nunca o id de catálogo do álbum.
- **Assinar o id do artista funciona mesmo com `browsable=false`** — é o que dá
  artista → álbuns sem rede. Para álbum e playlist não existe nó de faixas na árvore, então
  o nível de faixas vem da **amp-api**.

### O que vem da amp-api

| Chamada | Endpoint | Resultado medido |
|---|---|---|
| faixas do álbum | `/v1/catalog/{sf}/albums/{id}?include=tracks&limit[tracks]=100` | Aqua (Angra) → `1704078587`, 10 faixas |
| faixas da playlist | `/v1/catalog/{sf}/playlists/{id}?include=tracks&limit[tracks]=100` | Backstreet Boys: essenciais → `pl.331a…`, 22 faixas |
| busca de artista (1.9.5) | `/v1/catalog/{sf}/search?term=<nome>&types=artists&limit=8` | AC/DC → `5040714` (mesmo id nas lojas br/us) |
| álbuns do artista (1.9.5) | `/v1/catalog/{sf}/artists/{id}?include=albums&limit[albums]=50` | AC/DC → `5040714`, 26 álbuns (br) / 25 (us) |

O nível artista → álbuns existe nos dois caminhos: a assinatura do nó do artista devolve os
álbuns da **biblioteca** (fallback sem rede) e, desde a 1.9.5, o toque resolve o artista
por nome e abre o `DetailScreen` com todos os álbuns + músicas principais.

O id de catálogo de um artista/álbum/playlist **não** vem no browse, então ele é resolvido
por nome: `/v1/catalog/{sf}/search?types=artists|albums|playlists&limit=8` com o título e o
artista/curador do item, e a escolha exige título igual (sem diferenciar caixa/espaços,
ignorando os sufixos “ - Single”/“ - EP” e qualificadores como “(Deluxe Version)” que a
biblioteca acrescenta) e, quando existe, o mesmo artista. Sem correspondência exata, a tela
**degrada**: artista abre o browse dos álbuns da biblioteca; álbum/playlist mostram
“Faixas indisponíveis” e o **Tocar** toca a coleção pelo id de biblioteca (fluxo que já
funcionava). Playlist criada pelo usuário não existe no catálogo — é o caso de degradação
real medido (`Músicas favoritas`). O storefront/idioma são os do device (`br`/`pt-BR` no
celular, `us`/`en-US` na TV).

### Implementação

`CollectionScreen` passou a ter uma pilha de níveis com dois tipos de nó: **browse**
(assinatura no engine) e **álbum/playlist** (faixas da amp-api). Regras de clique:

- id `.../artists/6-…`, `.../albums/3-…` ou `.../playlists/4-…` sob `/library` → resolve o
  catálogo pelo nome e abre o `DetailScreen`; sem match, o artista desce para o browse dos
  álbuns e álbum/playlist abrem `CollectionScreen.bindCollection(...)`, que mantém a
  mensagem “Faixas indisponíveis” e o **Tocar** pelo id de biblioteca;
- id de catálogo (`3-<catalogId>`, `4-pl.…`, `6-<artistId>`) fora de `/library` → abre o
  `DetailScreen` pelo id direto, sem busca por nome;
- **Tocar** toca a coleção inteira: `playFromMediaId(<id de catálogo>)` monta a fila do
  álbum/playlist;
- tocar a faixa N chama `playFromMediaId(<álbum/playlist>)` + `skipToQueueItem(N-1)`
  (índice da lista = índice da fila), e a linha em reprodução fica em accent;
- “Ver tudo” das prateleiras e a Biblioteca/Rádio continuam usando o mesmo componente, com
  breadcrumb, voltar e skeleton; cada nível novo começa no topo da lista.

### Telas de detalhe (1.9.4)

Medido no device (engine 7.0.0, lojas `br`/`pt-BR` e `us`/`en-US`) com as mesmas chamadas
que o código faz hoje. Todas devolvem **HTTP 200** e os campos abaixo em `attributes`:

| Tela | Endpoint | Shape medido |
|---|---|---|
| artista | `/v1/catalog/{sf}/artists/{id}?include=albums&limit[albums]=50` | `name`, `genreNames[]`, `artwork.url`; `relationships.albums.data[]` **com atributos completos** (`name`, `artistName`, `artwork`, `releaseDate`, `trackCount`) — Angra `192030844` → 27 álbuns |
| músicas principais | `/v1/catalog/{sf}/artists/{id}/view/top-songs?limit=10` | `data[]` de `songs` com `name`, `artistName`, `albumName`, `durationInMillis`, `trackNumber`, `artwork` |
| álbum | `/v1/catalog/{sf}/albums/{id}?include=tracks,artists&limit[tracks]=100` | `name`, `artistName`, `releaseDate`, `genreNames[]`, `trackCount`, `copyright`, `recordLabel`, `artwork`; `relationships.tracks.data[]` com `durationInMillis`, `trackNumber`, `discNumber`, `albumName`; `relationships.artists.data[0].id/name` — Rebirth `1689475163` → 10 faixas |
| faixa | `/v1/catalog/{sf}/songs/{id}?include=albums,artists` | `name`, `artistName`, `albumName`, `durationInMillis`, `artwork`; `relationships.albums.data[0].id/name`, `relationships.artists.data[0].id` |
| playlist | `/v1/catalog/{sf}/playlists/{id}?include=tracks&limit[tracks]=100` | `name`, `curatorName`, `editorialNotes.short`, `artwork`; `tracks.data[]` com `durationInMillis`/`trackNumber` |

- `include=albums,songs` devolve **HTTP 400** (`limit[songs]` máximo 20); as músicas vêm
  da view `top-songs`, cujo `data[]` só traz ids/`href` quando pedida como
  `?views=top-songs` — por isso o endpoint `/view/top-songs` (com atributos) é o usado.
- **Artista não tem coleção tocável**: `playFromMediaId(<artistId>)` e
  `playFromMediaId(ra.<artistId>)` não montam fila (sessão continua `state=NONE`), então a
  tela de artista **não** mostra “Tocar”; cada álbum (e a faixa principal) abre/ toca pelo
  id de catálogo. É a degradação explícita para o único nível sem “tocar tudo”.
- A pilha é do `DetailScreen` (não do browse): tocar o artista dentro do álbum empilha
  outro nível, e o BACK percorre exatamente o caminho seguido. `OneActivity` hospeda o
  `detailHost` acima de busca/coleção; no D-pad os descendentes das telas de baixo ficam
  bloqueados enquanto o detalhe está aberto, e o foco começa no ‹.
- O overlay continua usando os mesmos componentes (`CoverCard` na grade de álbuns,
  `TrackRow` + `setEmphasis` para a faixa em foco, `SectionHeader`, `Pill`, `Skeleton`,
  `EmptyState`); falha de um nível mostra `EmptyState` + “Tentar de novo”.

### Biblioteca (1.9.5)

Medido no device (engine 7.0.0) com `adb logcat -s AppleMusicOne` e `uiautomator dump`: o
nó `__AUTO_ROOT__/library` devolve **5 filhos** e cada um virou uma **seção** (o tipo sai
do último segmento do id, então os títulos em inglês da TV funcionam sem id fixo):

| Nó | Filhos medidos | Arte no browse | O que a Biblioteca mostra | Toque |
|---|---|---|---|---|
| `.../library/songs` (Aleatória) | `playable`, 0 filhos | — | linha **Aleatória** (“Tocar a biblioteca inteira”) | `playFromMediaId(__AUTO_ROOT__/library/songs)` → fila 101 (biblioteca embaralhada) |
| `.../library/recently_added` | 12 (álbuns e playlists) | 12/12 | seção “Adições Recentes” (20 primeiros + **Ver tudo**) | resolve título+artista/curador → `DetailScreen`; sem match → lista de faixas degradada |
| `.../library/playlists` | 18 | 18/18 | seção “Playlists” | idem; playlist do usuário degrada com **Tocar** pelo id de biblioteca |
| `.../library/artists` | 93 | **0/93** | seção “Artistas” (inicial em um disco quando não há capa) | resolve o artista por nome (`/search?types=artists`) → `DetailScreen` com álbuns + músicas principais; sem match → browse dos álbuns da biblioteca |
| `.../library/albums` | 281 | 281/281 | seção “Álbuns” | resolve título+artista (`/search?types=albums`) → `DetailScreen` do álbum com faixas, duração, gravadora e **Tocar** |

- **Cabeçalho**: título + contagem das categorias já carregadas (“12 recentes · 18
  playlists · 93 artistas · 281 álbuns”), ícone por seção (`SectionHeader` com glifo) e
  contagem ao lado de cada seção; `Skeleton.rows` no carregamento e `EmptyState` +
  “Tentar de novo” quando o nó raiz falha. Cada seção mostra placeholders até os filhos
  chegarem.
- **Busca local**: o campo “Filtrar artistas, álbuns e playlists” filtra **o que já foi
  carregado** (sem rede; medido: `backstreet` → 1 resultado, zero chamadas amp-api),
  agrupa por seção com contagem e abre o mesmo detalhe; BACK limpa o filtro antes de sair
  da aba. Comparação sem caixa/acento (`Normalizer` NFD).
- **“Ver tudo”** abre o `CollectionScreen` do nó; os itens de biblioteca ali também
  resolvem o id de catálogo e abrem o `DetailScreen` (antes só desciam o browse: artista
  listava os álbuns da biblioteca, álbum/playlist mostravam faixas sem capa/metadados).
- **D-pad (TV)**: DOWN entra no filtro → linha Aleatória → primeira seção; dentro das
  seções DOWN vai para a **próxima seção** (`nextFocusDown` encadeado) e só a última
  (Álbuns) desce para o mini player; LEFT/RIGHT percorrem a fileira. Medido:
  “Ver tudo 93 itens” (Artistas) → ENTER → `AC/DC` (`/us/search?types=artists` →
  `/us/artists/5040714`, 25 álbuns).
- **Degradação sem quebrar**: quando o nome não está na loja, o toque continua no caminho
  antigo — álbum/playlist abrem `CollectionScreen` no modo “sem lista de faixas” com
  **Tocar** pelo id de biblioteca (`.../library/playlists/4-…`, fila 4 medida), artista
  abre o browse dos álbuns da biblioteca.
- **Limites da fonte**: artistas não têm capa na árvore (0/93), então a lista usa a
  inicial; “Aleatória” não tem lista de faixas (`/library/songs` = 0 filhos), por isso
  não existe categoria “Músicas” — só o atalho que toca a biblioteca embaralhada.

### Biblioteca: ordenação, “Ver tudo” e “Músicas” (1.9.11)

**Ordenação local e persistida.** Duas pills no topo da Biblioteca alternam **A–Z** e
**Recentes**. A–Z ordena `Artistas`, `Álbuns` e `Playlists` no cliente (mesma normalização
NFD do filtro, então “Áqua” cai em A), inclusive os resultados do filtro; **Recentes**
mantém a ordem que o engine entregou para o nó (a seção Adições Recentes continua
cronológica). A escolha vai para `SharedPreferences` (`one-library`/`sort`) e foi
verificada depois de `force-stop` + reabrir (`A–Z, selecionado` no dump; `wave2c-12`).
Nenhuma requisição é feita para ordenar.

**“Ver tudo” completo.** O `SeeAllCard` mostra a contagem real do nó (12/18/93/281) e
abre o `CollectionScreen` do nó inteiro, que desde a 1.9.9 usa `ListView` reciclado.
Medido: “Ver tudo, 281 itens” → lista com **281 itens**, `perf collection list items=281
rows=9 views=55` (`wave2c-11`); a contagem do cabeçalho do overlay é a mesma do card.

**“Músicas” não existe na fonte (investigado no código do engine).** O provider do Android
Auto (`analysis/jadx_src/sources/p032b7/A.java`, usado por `C3124a`) monta o nó
`/library` nesta ordem: `songs` (que é o atalho **Shuffle Library**, construído como
`LibraryCollectionPlaybackQueueItemProvider` com `shuffleMode(1)`), `recently_added`,
`playlists`, `artists`, `albums`. O item `songs` é `playable` e um **leaf**: não tem
filhos, e o caso “nó songs com filhos” só acrescenta o atalho `downloaded_music` (também
playable, sem lista) — não há categoria navegável de faixas. A tela “Músicas” do app
original é uma consulta **local** à `MediaLibrary` do próprio engine, que não é exposta
pela árvore de browse do `MediaBrowser`. A rota de biblioteca da amp-api
(`/v1/me/library/*`) exigiria o *music-user-token* do token store do engine, que não está
disponível para a UI (MUT ausente/vazio — ver **UNVERIFIED**). Conclusão: **não há**
categoria “Músicas” a acrescentar sem inventar dados; mantivemos o atalho **Aleatória**
(`playFromMediaId(__AUTO_ROOT__/library/songs)`, fila medida de 101 itens) e documentamos
o limite.

### Busca: recentes e escopo (1.9.11)

**Recentes.** Os últimos **10** termos ficam em `SharedPreferences`
(`one-search`/`recent`, um por linha, mais novo primeiro, sem duplicata por
caixa/acento). Com o campo vazio, o painel mostra “Buscas recentes” + contagem + pill
**Limpar**, e cada termo é uma `ListRow` com ícone de busca; tocar preenche o campo e
dispara a busca no escopo atual. Persistiu após `force-stop` + reabrir
(`wave2c-03/04/13`) e o “Limpar” esvazia a lista e volta ao estado inicial.

**Escopo Catálogo / Biblioteca.** Duas pills logo abaixo do campo; a ativa fica em accent
e o rótulo acessível ganha “, selecionado”. **Catálogo** mantém a amp-api (1 GET por
submit, token de geração descartando resposta antiga). **Biblioteca** não faz requisição:
`OneActivity.librarySections()` lê as categorias **já carregadas** do cache de browse do
`MediaClient` (`/library` → recentes/playlists/artistas/álbuns; 12/18/93/281) e o
`SearchScreen` filtra localmente com a mesma normalização do filtro da Biblioteca. Se a
Biblioteca ainda não foi aberta nesta sessão, o escopo mostra “Abra a Biblioteca uma vez”
+ **Abrir Biblioteca** — nunca dispara rede para “resolver” a busca. O snapshot fica num
campo estático do `OneActivity`, então **girar** preserva escopo, termo e resultados mesmo
com o cache novo do `MediaClient` (`wave2c-08`, `root arrived, tab=2 (restored)`); a
escolha de escopo também vai no bundle (`one.search.scope`). Tocar um resultado de
biblioteca usa o mesmo `LibraryOpener` da Biblioteca (resolve o id de catálogo por nome),
então o filtro em si continua sem HTTP.

**Estados e não-regressão.** Vazio (com/sem recentes), skeleton durante o GET, “Nenhum
resultado para X” (`wave2c-15`), erro de rede com **Tentar de novo** + fallback do engine
(`wave2c-16/17`) e “N resultados na Biblioteca”. O cache do último termo no Catálogo evita
repetir o GET ao alternar de escopo; ENTER duplicado continua virando uma só requisição —
medido: `daft` e `angra` produziram **um** `amp-api HTTP 200` cada (`wave2c-02`,
`wave2c-14`).

### CatalogResolver, testes JVM/CI e ações da conta (1.9.12)

**Resolução de nomes num só lugar.** `media/CatalogResolver` reúne o que estava repetido na
Biblioteca, no “Ver tudo” e na Busca: `lastSegment` (id de browse), `pick` (melhor match por
título/artista) e a normalização de títulos da biblioteca (“ - Single”/“ - EP”,
“(Deluxe Version)”/“[Remastered]”), antes privada em `CatalogSearch`. As três resoluções por
nome (artista/álbum/playlist) devolvem o id de catálogo, a capa com fallback e o *miss*;
`CollectionScreen` e `LibraryOpener` ficaram só com o fallback que é **deles** (empilhar o
nível de browse vs. abrir a lista de faixas da biblioteca). `CatalogSearch` continua dono do
HTTP/JSON; o teste JVM cobre os parsers sem Android. O desenho das faixas já era compartilhado
(`widget/TrackRow`); não foi extraído um `TrackListView` porque os três usos têm interação
diferente (fila dá `skipToQueueItem`, detalhe empilha/abre ações, coleção toca a partir da
faixa) — unificar mudaria comportamento.

**Testes JVM, sem device e sem dependência no APK.** `single-apk/single-ui/test` tem três
`main`: `UpdateAbisTest` (mapa de ABI do updater, 16 checks), `CatalogResolverTest`
(normalização/pick/`lastSegment`, 24 checks) e `CatalogSearchTest` (JSON de
search/album/artist/playlist/tracks, 46 checks). `single-apk/test-single-ui.ps1` compila com
`javac --release 8` contra `android.jar`, baixa o `org.json` **só para o classpath de teste**
(verificado por SHA-256) e roda os três. O CI (`build.yml`, job `release`) executa esse script
antes do build e falha a release se algum teste quebrar. Saída local:

```
UpdateAbisTest: OK (16 checks)
CatalogResolverTest: OK (24 checks)
CatalogSearchTest: OK (46 checks)
single-ui JVM tests: OK
```

**Conta com ações.** Com sessão ativa, o painel mostra **Gerenciar assinatura** e **Conta
Apple**: ambos abrem a tela **Account** oficial do engine com
`ACTION_VIEW https://itunes.apple.com/accountSummary` no componente
`com.apple.android.music/.common.MainActivity` (o caminho validado). A tela é um destino de
navegação dentro da `MainActivity` (`singleTask`), então `OneActivity` observa a activity do
engine (create/resume) e troca o fallback do dispatcher de BACK do próprio engine para
`finish()`: **um BACK volta para esta UI**, tanto na chave legada (TV/API 34) quanto no
predictive back (API 36). Se o engine de outra build não tiver o formato esperado, cai nos
callbacks de `OnBackInvokedDispatcher` (API 33+). Nada de sign out: o painel continua sem
editar arquivos de conta. Medido: `account BACK hooked on the engine back dispatcher` →
`account screen BACK, returning to the UI`; `logcat -b crash` vazio, painel ainda aberto ao
voltar (`wave2d-account-back-phone.png`, `wave2d-account-back-tv.png`).

### Onda 3a (1.9.13): letras e Ajustes do engine

**Letras: o endpoint não devolve letra para o token da UI — nada foi inventado.** A sonda
rodou no `RXCX100BZ5J` (arm64/API 36, logado, `br`/`pt-BR`) com o **developer token** que o
`CatalogSearch` já lê de `files/datastore/encrypted_tokens.preferences_pb`
(`key_api_token_musicAndroid`). Para a faixa `1411628233` (Imagine Dragons — *Believer*):

| Requisição | Resultado |
|---|---|
| `GET /v1/catalog/br/songs/1411628233?l=pt-BR` | **HTTP 200**, `attributes.hasLyrics=true`, `attributes.hasTimeSyncedLyrics=true` |
| `GET /v1/catalog/br/songs/1411628233/lyrics?l=pt-BR` | **HTTP 404** |
| idem + `&extend=ttmlLocalizations` | **HTTP 404** |
| idem sem `l`, e com storefront `us` | **HTTP 404** |

Corpo do 404: `{"errors":[{"title":"No related resources","detail":"No related resources
found for lyrics","status":"404","code":"40403"}]}`. Ou seja, o token e o id estão válidos
(a faixa responde 200 e declara letra), mas a relação `lyrics` não é exposta a este cliente;
não há `data[0].attributes.ttml` nem `lyrics` para parsear. O DataStore do token só tem a
chave do developer token (sem `music-user-token`). Como a regra da Onda 3 era **só
implementar se o endpoint respondesse**, o painel "Letra", o cache por `songId` e o
`EmptyState` "Sem letra" **não foram adicionados**; o log bruto está em
[`evidence/wave3a-lyrics-probe.txt`](evidence/wave3a-lyrics-probe.txt). O engine tem os
modelos `attributes.ttml`/`ttmlLocalizations` no `mediaapi` e uma UI nativa de letras, mas
esse caminho não é o `GET .../songs/{id}/lyrics` com o token da UI.

**Ajustes do engine.** O engine **não tem activity de Ajustes**: o `SettingsFragment`
(`com.apple.android.music.settings2.fragment.SettingsFragment`) é um destino de navegação
dentro da `MainActivity` (`com.apple.android.music.common.MainActivity`), com id
`R.id.action_settings = 0x7f0a008c` no grafo `nav_graph.xml`. O painel **Conta** (logado)
ganhou o link **Ajustes do Apple Music**; `OneActivity` inicia a `MainActivity` explícita,
espera o `NavHost` ficar pronto e chama o helper R8 `M9.p.a(Context, id)` por reflexão.
O mesmo gancho de BACK usado na tela de conta troca o fallback do dispatcher do engine por
`finish()`: **um BACK volta para esta UI**. Se o helper/nav destination não existir na
build, `engineSettingsAvailable()` devolve `false` e o link some (sem crash). Medido:
`engine settings opened id=0x7f0a008c` → tela **Ajustes** do engine (BIBLIOTECA, ÁUDIO) →
`account BACK hooked...` → `OneActivity`; `logcat -b crash` vazio.

**Equalizador: activity existe, mas está quebrada no engine 7.0.0 — link escondido.** O
manifest declara `com.apple.android.music.equalizer.EQActivity` **sem `android:theme`**;
ela herda o tema de splash e morre em `BaseActivity.setContentView` ("You need to use a
Theme.AppCompat theme"). Aplicando o tema AppCompat em `onActivityPreCreated` (setTheme +
`Theme.setTo`) o crash seguinte é `EQActivityFragment.onCreateView` →
`NullPointerException` (o fragmento/layout de EQ do engine está inutilizável nesta build;
o `DefaultEqualizerConfig` e o fragmento são legado). Como o crash é no **mesmo processo**,
não dá para abrir "só um pouco": o atalho **Equalizador** não é mostrado, e a preferência
de equalizador do engine fica na própria tela de **Ajustes do Apple Music**
(`settings_preference.xml`, chave `equalizer`; não exercitada nesta rodada). Nada de
`EQActivity` foi alterado no build. O painel **Conta** passou a ser rolável (o conteúdo já
não cabia nos ~360 dp do celular girado): no landscape o link **Ajustes do Apple Music** e o
**Fechar** ficam alcançáveis por rolagem (`wave3a-account-landscape-scrolled.png`), e o
portrait continua com tudo visível.

### Rotação e estado (1.9.7)

O manifest do engine não declara `configChanges`, então girar (ou mudar `wm size`)
destrói e recria a activity. A 1.9.6 voltava para o Início e recarregava o browse
(`evidence/debt-05-rotated.png`); a partir da 1.9.7 `OneActivity` implementa
`onSaveInstanceState` e remonta **a mesma tela**:

| O que | Onde é salvo | Como volta |
|---|---|---|
| aba selecionada | `OneActivity` (`one.tab` + `one.tab.id`) | `onRoot` escolhe a aba por id (fallback índice) em vez de `selectTab(0)` |
| coleção "Ver tudo" (overlay) | `CollectionScreen` (`one.collection.*`: ids/títulos/tipos + breadcrumb) | pilha reconstruída e só o nível do topo é resubscreito; BACK continua descendo |
| detalhe (artista → álbum → …) | `DetailScreen` (`one.detail.*`) | breadcrumb e nível do topo voltam; só ele é buscado na amp-api |
| busca | `SearchScreen` (`one.search.open/term/scope/scroll`) | painel reaberto com o termo, o **escopo** Catálogo/Biblioteca e **uma** nova consulta (ou o filtro local) |
| player / fila | `OneActivity` (`one.player.open/queue`) | `openPlayer()` + sheet "A seguir" disparados no primeiro snapshot da sessão |
| ações, conta, atualizações | `OneActivity` | sheet de ações reabre quando a sessão publica as mesmas ações; painéis abrem direto |
| filtro da Biblioteca | `LibraryScreen` (`one.library.filter`) | aplicado antes do primeiro layout; resultados refeitos a partir do que já carregou |
| ordenação da Biblioteca | `SharedPreferences` (`one-library`/`sort`) | A–Z/Recentes aplicada antes das seções e do filtro; persiste entre execuções |
| scroll (Início, Biblioteca, detalhe, coleção, busca) | `widget/ScrollMemory` (fração do alcance) | reaplicado quando o conteúdo mede; a fração absorve a mudança de tamanho dos cards |

Detalhes de implementação:

- **sem duplo carregamento**: a restauração entra no fluxo normal de `onRoot`
  (`selectTab(index, savedState)`), então cada tela carrega uma vez. `OneActivity` mantém
  um `Map<String, List<ChildSink>>` de assinaturas (duas telas restauradas podem querer o
  mesmo nó) e `MediaClient.cachedChildren()` responde direto quando o nó já veio,
  evitando `subscribe` duplicado.
- **rotação em série**: se a activity girar de novo antes de `__AUTO_ROOT__` chegar,
  `onSaveInstanceState` repassa o bundle pendente (`out.putAll`) em vez de gravar uma
  tela vazia.
- **volta do engine** continua igual: `refreshOnResume` também é salvo, então girar com a
  `MainActivity` do engine na frente ainda reconecta e reassina o catálogo.
- **o que o engine continua dono**: posição da faixa, fila e estado de shuffle/repeat não
  são serializados (vêm do `MediaSession` ao reconectar); o sheet "Ações" só reaparece se a
  sessão publicar as mesmas ações naquele instante; a busca reexecuta a consulta (1 GET);
  o scroll do filtro é reconstruído junto com os resultados e pode voltar ao topo enquanto
  as categorias chegam.

### Acessibilidade (1.9.8)

Todo nó clicável passou a ter rótulo próprio: `CoverCard`/`SeeAllCard` levam
`contentDescription` com título/subtítulo ou “Ver tudo, N itens”, `ListRow` e `TrackRow`
exibem título/artista (a faixa também o número), e `Pill`/`TabView` herdam o texto visível.
Os `CircleButton` sem texto ganharam descrição explícita (“Fechar player”, “Faixa anterior”,
“Reproduzir”/“Pausar”, “Próxima faixa”, “Fechar busca”, “Limpar busca/filtro”, “Voltar”,
“Fechar”). `IconView` (todos os glifos desenhados) e as capas (`ImageView`) são decorativos
(`importantForAccessibility=NO`).

Os overlays são **camadas de acessibilidade**: `OneActivity.refreshAccessibility()` marca com
`IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS` tudo o que está abaixo da camada ativa
(Início/abas, coleção, busca, detalhe, mini player, player, sheet de ações, atualizações,
conta) e devolve `AUTO` ao fechar — inclusive quando a folha fecha pelo “Fechar” ou por toque
fora (`ActionSheet.dismiss()` avisa o host). A fila “A seguir” esconde a página do player, e
os painéis (ações, conta, atualizações) consomem o toque com `OnTouchListener` em vez de
serem `clickable` sem rótulo.

Verificação com `uiautomator dump --compressed`, que é a árvore de acessibilidade (o dump sem
`--compressed` inclui views não importantes por design do UiAutomator):

| Tela | Nós | Cliques sem rótulo | Camada de baixo exposta |
|---|---|---|---|
| Player (celular) | 21–22 | 0 | não |
| Sheet Ações (celular) | 14 | 0 | não |
| Fila “A seguir” (celular) | 34–35 | 0 | não |
| Player (TV x86) | 21–22 | 0 | não |
| Sheet Ações (TV x86) | 14 | 0 | não |
| Início / Biblioteca / Busca / Detalhe / Coleção / Rádio | 27–44 | 0 | — (cada um só com o mini player acima) |
| Atualizações | 15 | 0 | não |

Dumps e screenshots em [`evidence/wave1c-*`](evidence) (`wave1c-player.xml`,
`wave1c-actions.xml`, `wave1c-queue.xml`, `wave1c-tv-*`, `wave1c-*-compressed.xml`).

### Performance: listas recicladas e Início sob demanda (1.9.9)

As listas que crescem com a conta deixaram de inflar todas as linhas: `CollectionScreen`
(níveis LIST, inclusive os **281 álbuns**), os resultados do filtro da Biblioteca e a fila
“A seguir” do player passaram a usar `ListView` + `BaseAdapter` com `convertView` e
`bind` (`ListRow.bind`, `TrackRow.bind`). A Home passou a assinar só as **6 primeiras
prateleiras**; as demais entram em lotes de 6 quando a rolagem chega perto do fim ou pelo
pill **Carregar mais**. O pill **Atualizar** invalida o cache do nó (`MediaClient.invalidate`
→ `ScreenHost.refreshChildren`), reassina o root e as prateleiras já abertas e reaplica a
fração de scroll.

`widget/Perf` conta a árvore de views; cada tela loga `perf …`:

| Tela | 1.9.8 (antes) | 1.9.9 (depois) |
|---|---|---|
| Início (root com 16 prateleiras) | 16 `children` de uma vez; **1365** views | **6** `children`; **563** views; 12/16 ao rolar (lotes de 6) |
| Biblioteca → Álbuns (`Ver tudo`, 281 itens) | **1680** views num `LinearLayout` | 9 linhas visíveis; **55** views (`perf collection list items=281 rows=9 views=55`) |
| Filtro da Biblioteca (282 resultados) | **2123** views para 351 resultados | 7 linhas visíveis; **41** views (`perf library results=282 rows=7 views=41`) |
| Fila “A seguir” (29 faixas) | **361** views para 60 faixas | 5 linhas visíveis; **31** views (`perf queue items=29 rows=5 views=31`) |

- **Rolagem**: `dumpsys gfxinfo` na lista de 281, 12–15 swipes → **2 quadros janky em 878
  (0,23%)** e **2 em 1099 (0,18%)**; `logcat -b crash` vazio.
- **Memória**: abrir a lista de 281 com a Home carregada: **TOTAL PSS 729 MB** (1.9.8) →
  **339 MB** (1.9.9); **483 MB** depois de rolar a lista inteira (capas novas no
  `LruCache` de 24 MB). Home inicial: 273 MB → **236 MB**.
- **Refresh**: “Atualizar” com a Home rolada (~hero cortada) repovoa e **mantém a posição**
  (`wave2a-refresh-scroll-after.png`, mesmo enquadramento do antes).
- **Rotação**: Início volta na mesma aba/posição (`tab=0 (restored)`, `requested=6`); a
  lista de 281 volta no mesmo bloco (Bita/Black Pantera) porque `CollectionScreen` salva
  `firstVisiblePosition` + topo da linha, não uma fração do `ScrollView`.
- **Grade**: a Rádio continua no `ScrollView` em grade. O `GridView` do framework **não
  expõe `setItemsCanFocus`**; sem isso o D-pad perderia o foco por card (regressão de TV) e
  a grade tem só 10 estações — o custo não justifica trocar.
- **D-pad**: Início mantém DOWN da aba → hero → cards (o pill Atualizar fica depois da
  hero); percorrer os cards carrega os lotes; na lista de 281 DOWN foca a linha e ENTER
  abre o álbum; na fila o foco inicia na linha atual e ENTER faz `skipToQueueItem`.

Evidências: [`evidence/wave2a-home-before.png`](evidence), `wave2a-home-after.png`,
`wave2a-albums-before.png`, `wave2a-albums-after.png`, `wave2a-albums-scroll-after.png`,
`wave2a-queue-before.png`, `wave2a-queue-after.png`, `wave2a-library-filter-before.png`,
`wave2a-library-filter-after.png`, `wave2a-refresh-scroll-after.png`,
`wave2a-rotate-home-after.png`, `wave2a-albums-rotate-after.png`, `wave2a-tv-*.png`.

### Updater: ABI estrita (1.9.8)

`UpdateAbis` (classe Java pura, sem `android.*`) mapeia a **ABI primária**
(`Build.SUPPORTED_ABIS[0]`): `arm64-v8a` → `one-arm64`, `armeabi-v7a`/`armeabi` →
`one-arm32`, `x86`/`x86_64` → `one-x86`. Se a chave não existir no `updates.json`, o painel
mostra **“Sem atualização para esta ABI. Instalada: …”**. O fallback antigo para
`one-arm32`/`one-x86` foi removido: num arm64 sem suporte a 32-bit ele oferecia o APK errado.

Teste JVM do mapeamento e dos parsers (fora do APK, sem dependências empacotadas):

```powershell
./single-apk/test-single-ui.ps1
# UpdateAbisTest: OK (16 checks)
# CatalogResolverTest: OK (24 checks)
# CatalogSearchTest: OK (46 checks)
# single-ui JVM tests: OK
```

O script baixa o `org.json` só para o classpath de teste (SHA-256 fixo) e é o mesmo passo que
o CI roda antes do build.

Medido no celular: `updates.json: sem atualização para esta ABI (arm64-v8a, instalada
1.9.10 (10910))`.

### Versionamento real e reconexão (1.9.10)

**Versão do pacote.** O `<manifest>` do APK único agora leva o `versionName`/`versionCode`
da UI (1.9.10 / 10910), gravados pelo `axml_inject.py` sem rebuild do AXML:

```
$ aapt2 dump badging single-apk/out-one/AppleMusic-one-arm64.apk | head -1
package: name='com.apple.android.music' versionCode='10910' versionName='1.9.10' ...
$ adb -s RXCX100BZ5J shell dumpsys package com.apple.android.music | grep -E "version(Name|Code)|firstInstall"
    versionCode=10910 ...
    versionName=1.9.10
    firstInstallTime=2026-11-05 14:51:14   # preservado pelo install -r
```

O `UpdateManager` passou a comparar `one-<abi>.versionCode` com o versionCode do
**pacote instalado** (PackageManager), não com `Version.CODE`; o painel mostra
`Instalada 1.9.10 (10910)` / `Engine 7.0.0 (1614)` (o engine é capturado do APK de entrada
e vira `Version.ENGINE`). Log do check:
`updates.json: sem atualização para esta ABI (arm64-v8a, instalada 1.9.10 (10910))`.
O CI passa `--version-name "$VERSION" --version-code "$VERSION_CODE"` e **falha o release**
se o badging dos `one-*` não tiver os dois valores.

**Lifecycle do `MediaBrowser`.** `OneActivity` reconecta com backoff exponencial
(0,5 s → 1 s → 2 s → 4 s → 8 s → … máx. 30 s) em `onConnectionFailed`,
`onConnectionSuspended`, `onSessionDestroyed` e após a volta do engine; o backoff só zera
quando o browser conecta ou o catálogo chega. Em `onStop` o ticker e o reconnect pendente
são removidos (`reconnectPending`) e voltam em `onStart` — nada consulta o engine em
background. A fila deixou de ser lida a cada 500 ms: `MediaController.Callback.onQueueChanged`
(atualizado por `emitPlayback(true)`) e os callbacks de estado/metadata atualizam a fila; o
tick de 500 ms agora só relê a posição (`emitPlayback(false)`, fila em cache).

**Como o teste de reconexão foi feito.** O `MediaPlaybackService` roda no **mesmo processo**
do companion (e o shell não pode desabilitar componente de pacote não-debuggable), então
matar só o serviço derruba a activity junto. O caminho de falha foi exercitado com um seam
temporário (`connect()` recusando as 3 primeiras tentativas, removido antes do commit) num
build x86 instalado no `emulator-5554`: o log mostra
`reconnect in 500 ms` → `1000 ms` → `2000 ms` → `MediaBrowser connected` e `root arrived`,
sem reiniciar a activity (`evidence/wave2b-reconnect-backoff-tempbuild.txt`).
O serviço real também foi parado 50× com `am stopservice` (durante rotação) sem crash:
`dumpsys activity` mostrou o browser voltando e a fila de 55 faixas restaurada. Limitação:
não foi possível matar o serviço **com o playback em andamento sem matar o próprio app**.

**Background.** Com o app em `HOME` e tocando, `dumpsys activity activities` mostra
`OneActivity` parada; `MEDIA_NEXT` no background gerou `queue changed`/`queue size=53` no
log e a tela reabriu já com a faixa nova (`wave2b-background-queue.txt`,
`wave2b-phone-after-background.png`). `dumpsys cpuinfo` no background fica dominado pelo
decode de áudio (29%), sem leituras periódicas do ticker (removido em `onStop`).

Evidências: `wave2b-phone-updates.png` / `.xml` (Instalada 1.9.10/Engine 7.0.0),
`wave2b-version-badging.txt` (badging das duas ABIs + `dumpsys` dos dois devices),
`wave2b-phone-account.png` (conta preservada), `wave2b-phone-home.png`,
`wave2b-phone-player.png`, `wave2b-reconnect-backoff-tempbuild.txt`,
`wave2b-background-queue.txt`, `wave2b-phone-after-background.png`.

Onda 2c (1.9.11, busca/biblioteca): `wave2c-01-search-initial.png` (vazio + escopo),
`wave2c-02-search-catalog.png` / `wave2c-14-recent-tap.png` (catálogo e recente tocado),
`wave2c-03-recents.png` / `wave2c-04-recents-persist.png` / `wave2c-13-recents-final.png`
(recentes com **Limpar** e persistência), `wave2c-19-recents-cleared.png` (Limpar esvazia e
volta ao estado inicial), `wave2c-15-search-empty.png` (nenhum resultado),
`wave2c-16-search-error.png` / `wave2c-17-search-retry.png` (sem conexão e retry),
`wave2c-06-search-library.png` / `wave2c-07-search-library-angra.png` /
`wave2c-08-search-library-rotated.png` (escopo Biblioteca com 0 `amp-api HTTP`, girado),
`wave2c-05-library-recent.png` / `wave2c-09-library-az.png` /
`wave2c-10-library-az-artists.png` / `wave2c-12-library-sort-persist.png` (ordenação e
persistência), `wave2c-11-seeall-albums.png` (“Ver tudo”, 281), e os dumps
`wave2c-*.xml`. TV x86: `wave2c-tv-01-home.png`, `wave2c-tv-02-search.png`,
`wave2c-tv-03-library.png`, `wave2c-tv-04-search-library.png`,
`wave2c-tv-05-search-library-portrait.png`.

Onda 2d (1.9.12, refactor/testes/conta): `wave2d-before-library-phone.png`,
`wave2d-after-library-phone.png`, `wave2d-before-collection-phone.png`,
`wave2d-after-collection-phone.png`, `wave2d-before-detail-phone.png`,
`wave2d-after-detail-phone.png` (mesmas telas antes/depois do `CatalogResolver`),
`wave2d-before-account-phone.png` / `wave2d-after-account-phone.png` (painel ganhou os
links), `wave2d-account-manage-phone.png` (tela Account oficial),
`wave2d-account-back-phone.png` (um BACK de volta ao painel),
`wave2d-account-apple-phone.png` (link Conta Apple) e `wave2d-account-apple-back-phone.png`;
TV x86: `wave2d-before/after-library-tv.png`, `wave2d-before/after-collection-tv.png`,
`wave2d-before/after-detail-tv.png`, `wave2d-after-account-tv.png`,
`wave2d-account-manage-tv.png`, `wave2d-account-back-tv.png`.

Onda 3a (1.9.13, letras/Ajustes): `wave3a-account-phone.png` (painel com o link **Ajustes do
Apple Music**), `wave3a-account-landscape.png` / `wave3a-account-landscape-scrolled.png`
(painel rolável no landscape, com o link alcançável), `wave3a-settings-phone.png` (tela
Ajustes do engine), `wave3a-settings-back-phone.png` (um BACK de volta),
`wave3a-account-tv.png`, `wave3a-settings-tv.png`, `wave3a-settings-back-tv.png` (mesmo
fluxo na TV x86), `wave3a-settings-logcat.txt` (`engine settings opened`/BACK nos dois
devices) e `wave3a-lyrics-probe.txt` (HTTP 404 do endpoint de letras, com a faixa que
declara letra).

## Validado

| Device | Resultado |
|---|---|
| `RXCX100BZ5J` (arm64, API 36, toque) | Instala por cima do engine logado. Home com hero/prateleiras/“Ver tudo”; toque em card toca (mini player aparece); mini → player cheio com gradiente da capa, tempos e controles; seek atualiza a posição (0:03 → 3:08); Ações abre o sheet e envia **Favorito** (`sendCustomAction ...FAVORITE`); Rádio em grade e Biblioteca em lista com drill-down; busca `daft` HTTP 200 (18 resultados) e resultado tocável; painel de Conta renderiza (login oficial não re-exercitado nesta rodada); BACK fecha ações/player/busca e mantém a activity (predictive back); `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1080p, D-pad) | Instala por cima. Barra de apps em uma linha com Buscar/Conta/Atualizações rotulados; DOWN da aba foca a hero (contorno accent), DOWN foca o card (1.05 + contorno), ENTER toca; mini player com foco próprio (DOWN de card → mini); ENTER abre o player cheio lado a lado; Ações abre o sheet e envia **Criar Estação**; BACK fecha sheet e depois o player sem sair; Rádio em grade e Biblioteca em lista (ícone substituto quando o nó não tem capa); busca `daft` HTTP 200 (18 resultados) digitada pelo IME/`input text`; Atualizações mostra `1.9.0 (10900)` + engine `7.0.0 (1614)` e “Sem atualização”; `logcat -b crash` vazio. |
| `arm32` | APK gerado e assinado; não havia device arm32/carro online nesta rodada. |
| `RXCX100BZ5J` (arm64, 1.9.2, fila) | Instalado por cima. Álbuns continuam como lista de coleções (“281 itens”, sem numeração — sem regressão); tocar um álbum toca a coleção (`queue size=18` → 28 com autoplay); **Fila** aparece no player em “Ale/Trance Life”; o sheet “A seguir” lista 28 faixas com a atual em accent; tocar a 3ª (`skipToQueueItem 2`) mudou a metadata para `Light Years Away (feat. DBX)` e `state=PLAYING` continuou; o sheet refez o destaque; BACK fecha o sheet; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.2, fila) | Instalado por cima. Álbum `Trance Life` tocando (0:05 → 0:16), pill **Fila** no layout lado a lado; sheet “A seguir” com 18 faixas; tocar a 3ª (`skipToQueueItem 2`) → metadata `Sana Corazón` com `state=PLAYING` e a fila reindexada; BACK fecha só o sheet, player continua; `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.1, conta) | Instalado por cima. Logado: painel **Conta** abre o perfil com inicial “A”, nome completo, Apple ID e **“Assinatura Individual”** (lidos de `AccountTable.json` + `settings.preferences_pb`, sem rede); `logcat` `signedIn=true accountFile=true status=ENABLED reason=INDIVIDUAL`; BACK/Fechar fecham; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.1, conta) | Instalado por cima. Mesmo perfil no layout TV (painel central), **“Assinatura Individual”**; estado deslogado verificado com override de teste (`one.signedOut`): convite + **Entrar na conta Apple** + Fechar, sem alterar a conta; `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.3, navegação) | Instalado por cima. **Biblioteca → Artistas** (93) → **Angra** (2 álbuns, capas do engine) → **Aqua** (10 faixas da amp-api, `amp-api HTTP 200 /br/albums/1704078587`) → **Tocar** = `playFromMediaId 1704078587`, `queue size=10` (20 com autoplay), metadata `Viderunt Te Aquae`; tocar a 3ª (`skipToQueueItem 2`) → `Awake from Darkness`, `state=PLAYING`, linha em accent; **Playlists** (18) → **Backstreet Boys: essenciais** (22 faixas) → Tocar = `playFromMediaId pl.331a…`, `queue size=22`; 3ª faixa (`skipToQueueItem 2`) → `Quit Playing Games (With My Heart)`, `PLAYING`; playlist de usuário **Músicas favoritas** degrada (“Faixas indisponíveis”) e **Tocar** toca pelo id de browse (`queue size=4`); BACK volta nível a nível; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.3, navegação) | Instalado por cima. Biblioteca → **Artists** (93, títulos em inglês na TV) → **Avenged Sevenfold** (9 álbuns) → **Hail to the King (Deluxe Version)** (12 faixas; id de catálogo US `672046420` resolvido pelo título base) → **Tocar** = `queue size=12` (22), metadata `Shepherd of Fire`; 3ª (`Doing Time`, `skipToQueueItem 2`) → `PLAYING`; **Playlists** → **Backstreet Boys Essentials** (22 faixas) → Tocar = `queue size=22`; 3ª (`Quit Playing Games (With My Heart)`) → `PLAYING`; lista sempre começa na faixa 1 (scroll reset); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.4, detalhes) | Instalado por cima. Busca **Angra** (18 resultados; artista agora com gênero “Metal”, sem `["Metal"]`) → **artista** `HTTP 200 /br/artists/192030844?include=albums&limit[albums]=50` (27 álbuns) + `/view/top-songs` (10, com álbum e duração) → **Rebirth** `HTTP 200 /br/albums/1689475163?include=tracks,artists` (ano 2001, 10 faixas, Hard rock, gravadora/copyright, durações) → **Tocar** = `playFromMediaId 1689475163`, `queue size=10` (20), metadata `In Excelsis`; 3ª faixa (`skipToQueueItem 2`) → `Millennium Sun`, linha em accent; link **Angra** no álbum → `Artista` com breadcrumb `Rebirth › Angra`; BACK volta álbum → artista → busca; **faixa** `Wuthering Heights` (`/br/songs/1689467014?include=albums,artists`) com links Artista/Álbum e **Tocar**; o link do álbum abre em `Angels Cry` rolando/destacando a faixa 7; **playlist** `Angra: essenciais` (`pl.e095…`, 25 faixas com duração); card do Início abre **álbum** (`Stone Sour`); longa pressão em resultado toca (`Carry On`, `queue size=18/1/11`, metadata atualizada); `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.4, detalhes/D-pad) | Instalado por cima. D-pad: ENTER na hero → playlist detail, foco no **‹** (contorno accent); DOWN → faixa 1 focada, ENTER = `playFromMediaId pl.095…`, `queue size=50` (60), metadata `Midnight Sun`; BACK fecha o detalhe e devolve o foco à aba Início; telas de baixo com foco bloqueado enquanto o overlay está aberto. Busca `Angra` na loja US (19 resultados) → **artista** (27 álbuns, grade de 5) → **Rebirth** (breadcrumb `Angra › Rebirth`, 10 faixas com duração); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.5, biblioteca) | Instalado por cima. **Biblioteca** com contagem (12 recentes · 18 playlists · 93 artistas · 281 álbuns), filtro local (`backstreet` → 1 resultado, **zero** chamadas amp-api) e seções; **artista** AC/DC → `/br/search?types=artists` → `/br/artists/5040714` (26 álbuns + top-songs) → **Back In Black** (10 faixas); **álbum da biblioteca** `A Capella - Single` → `/br/search?types=albums` → `/br/albums/1445027335` (1 faixa, gravadora/copyright), **Tocar** = `playFromMediaId 1445027335` (fila 1) e toque na faixa = mesma coleção; **playlist** `Backstreet Boys: essenciais` → `pl.331a…` (22 faixas, curador/descrição), **Tocar** (fila 22) e faixa 2 (`skipToQueueItem 1`); **playlist do usuário** `Músicas favoritas` degrada (“Faixas indisponíveis”) e **Tocar** toca pelo id de biblioteca (fila 4); `Ver tudo` de Artistas (93) → AC/DC → mesmo detalhe; BACK nível a nível; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.5, biblioteca/D-pad) | Instalado por cima. Biblioteca em 1080p com as seções do engine (`Shuffle Library`, `Recently Added`, `Playlists`, `Artists`, `Albums`) e contagens; D-pad DOWN: filtro → Shuffle → Recentes → “Ver tudo” de Playlists → “Ver tudo” de Artistas (93 itens) → ENTER = `AC/DC` (`/us/search?types=artists` → `/us/artists/5040714`, 25 álbuns) → DOWN = grade → ENTER = álbum (`/us/albums/574050396`); “Ver tudo” de Álbuns (281) → card `A War You Cannot Win` → detalhe (`/us/albums/1440920100`, 2012, 12 faixas, Metal) → RIGHT/ENTER em **Tocar** = `playFromMediaId 1440920100` (fila 12); DOWN da última seção → mini player; BACK volta nível a nível; `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.6, player/insets/busca) | Instalado por cima. Player com **Aleatório/Repetir/Favorito** (3 ações presentes) e `contentDescription` medido no `uiautomator` (`Aleatório`/`Repetir`/`Favorito`); toques enviaram `sendCustomAction ...SHUFFLE`, `...REPEAT` e `...FAVORITE` com “Aleatório alternado”/“Repetir alternado”/“Favorito alternado” na pílula de feedback; sheet **Ações** agora só com Reprodução Automática/Adicionar à Biblioteca/Criar Estação; girado para landscape (2340×1080) “Atualizações” termina em x=2148 e o mini player em x=2160, ambos fora da nav bar (que começa em ~2188); busca `daft` com ENTER+ENTER+Buscar = **um** `amp-api HTTP 200 /br/search?term=daft…` (18 resultados); Atualizações mostra `1.9.6 (10906)`; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.6, player/D-pad) | Instalado por cima. Player lado a lado com os três toggles na linha do cabeçalho; D-pad: UP (play → ‹), RIGHT (‹ → aleatório), ENTER = `sendCustomAction ...SHUFFLE` + “Aleatório alternado”; `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.7, rotação) | Instalado por cima. **Início** rolado até “MPB: joias ocultas”, girado 2× (`user_rotation 1` → `0`): volta na mesma aba e na mesma posição (`wave1b-02/03/04`). **Biblioteca** com filtro `backstreet` (1 resultado) girada para landscape: aba `tab=2 (restored)` e filtro/resultado preservados (`wave1b-06/07/08`). **Álbum** `A Capella - Single` → link **Ylvis** (profundidade 2) girado 2×: breadcrumb `A Capella - Single › Ylvis` intacto e BACK voltando álbum → Biblioteca (`wave1b-13/14/15/16/17`). **Player** com “A seguir” aberto girado: `queue sheet restored (34 tracks)` e sheet de volta em landscape (`wave1b-24/33`). **Ver tudo** (`Mais relevantes pra você`, 9 itens) girado: `collection=true`, lista e breadcrumb de volta (`wave1b-26/27/28`). **Busca** `daft` (18 resultados) girada: painel reaberto com o termo e **um** `amp-api HTTP 200 /br/search?term=daft…` (`wave1b-29/30/31`). `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.7, `wm size`) | Instalado por cima. Rotação simulada com `wm size 1080x1920` / `1920x1080` / `reset`: **Início** `tab=0 (restored)` com as prateleiras e o foco do D-pad (`wave1b-tv-01/02`); **player** aberto na janela “retrato” e voltando lado a lado no landscape com a posição seguindo (0:10 → 0:28, `wave1b-tv-03/04`); **Biblioteca** com filtro `backstreet` (1 resultado) e `wm size` para “retrato”: `tab=2 (restored)` e `backstreet`/`Backstreet Boys Essentials` preservados (`wave1b-tv-05/06`); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.8, a11y/updater) | Instalado por cima. Player aberto e pausado: `uiautomator dump --compressed` com **22 nós / 10 clicáveis, 0 sem rótulo** e nenhum nó da tela de baixo; **Ações** com **14/5, 0 sem rótulo** e nenhum controle do player; **Fila** 35/9, 0 sem rótulo e página do player fora da árvore; girado em landscape com a fila aberta: `queue sheet restored (35 tracks)` e a árvore continuou só com a fila; Início/Biblioteca/Busca/Detalhe/Coleção/Rádio com 0 clicáveis sem rótulo; **Atualizações** mostra “Sem atualização para esta ABI. Instalada: 1.9.8 (10908)” e o log `updates.json: sem atualização para esta ABI (arm64-v8a, instalada 1.9.8 (10908))`; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.8, a11y) | Instalado por cima. Player e **Ações** com **22/10** e **14/5** nós/clicáveis, **0 sem rótulo** e nenhuma camada de baixo exposta; Início com 14 clicáveis, todos rotulados; `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.9, performance) | Instalado por cima. Início abre com **6/16** prateleiras (`children` 6, `perf home shelves=6/16 … views=563`); rolar carrega 12 e 16 em lotes; **Atualizar** com a Home rolada repovoa e mantém o enquadramento (`wave2a-refresh-scroll-after.png`); **Biblioteca → Álbuns** (281) rola em `ListView` com 9 linhas/55 views e `gfxinfo` 0,23% janky; filtro `a` (282) com 7 linhas/41 views; girado para landscape e de volta no mesmo bloco da lista; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.9, performance/D-pad) | Instalado por cima. Início **6/16** e DOWN pelos cards carrega os lotes até 16; DOWN da aba → hero → cards; lista de 281 com 7 linhas e foco por linha (ENTER abre “A Decade and a Half”); fila com 29 faixas/5 linhas/31 views, foco na linha atual e ENTER = `skipToQueueItem 1` (metadata `Rulers of the Mind`); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.10, versão/reconexão) | Instalado por cima (`install -r`), `firstInstallTime` de 2026-11-05 preservado. `dumpsys package` = `versionCode=10910 versionName=1.9.10`; badging idem; painel Atualizações com `Instalada 1.9.10 (10910)` / `Engine 7.0.0 (1614)` e log `updates.json: sem atualização para esta ABI (arm64-v8a, instalada 1.9.10 (10910))`. Faixas: `MEDIA_NEXT` no background atualizou a fila por callback (`queue changed`, 55→54→53) e o player voltou com a faixa nova; `OneActivity` parada em `dumpsys activity`; rotação 2× reconectou o browser e restaurou a fila de 55 itens; `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.10, backoff) | APK x86 instalado por cima. Com um seam temporário de falha de conexão (removido antes do commit): `reconnect in 500 ms` → `1000 ms` → `2000 ms` → `MediaBrowser connected`/`root arrived`, sem reiniciar a activity (`wave2b-reconnect-backoff-tempbuild.txt`); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.11, busca/biblioteca) | Instalado por cima (`versionName=1.9.11`, `versionCode=10911`). **Busca**: `daft`/`angra` = um `amp-api HTTP 200` cada; recentes (3 termos) sobreviveram a `force-stop` + reabrir (`wave2c-03/04/13`); escopo **Biblioteca** `angra` → 3 resultados (Artistas 1, Álbuns 2) com **zero** `amp-api HTTP` (`wave2c-07`); girado com o painel aberto → `Biblioteca, selecionado`, termo e resultados preservados (`wave2c-08`); erro com Wi-Fi/dados desligados (“Sem conexão” + **Tentar de novo**) e retry após religar → resposta da amp-api (`wave2c-16/17`); termo aleatório → “Nenhum resultado para …” (`wave2c-15`). **Biblioteca**: contagens 12/18/93/281; **A–Z** ordena Artistas/Álbuns/Playlists e persiste após reiniciar (`wave2c-09/10/12`); **Ver tudo, 281 itens** abre a lista completa com 9 linhas/55 views (`perf collection list items=281 rows=9 views=55`, `wave2c-11`); `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.11, busca/biblioteca) | x86 instalado por cima. Biblioteca com 12/18/93/281 e pills **A–Z/Recentes**; Busca → escopo **Biblioteca** `angra` = 3 resultados (1 artista + 2 álbuns) **sem** `amp-api HTTP` (`wave2c-tv-04`); `wm size 1080x1920` com a busca aberta preservou escopo/termo/resultados (`wave2c-tv-05`); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.12, refactor/testes/conta) | Instalado por cima (`versionName=1.9.12`, `versionCode=10912`). **Refactor**: Biblioteca, “Ver tudo” e detalhe da playlist `Backstreet Boys: essenciais` idênticos ao build 1.9.11 (`wave2d-before-*` / `wave2d-after-*`); a resolução continua `/br/search?types=playlists` → `/br/playlists/pl.331a…`. **Testes**: `UpdateAbisTest: OK (16)`, `CatalogResolverTest: OK (24)`, `CatalogSearchTest: OK (46)`. **Conta**: **Gerenciar assinatura** e **Conta Apple** abrem a tela Account oficial (deep link + componente); **um** BACK volta ao painel (`account BACK hooked on the engine back dispatcher` → `account screen BACK, returning to the UI`); `logcat -b crash` vazio. |
| `emulator-5554` (TV x86, 1.9.12, refactor/conta) | x86 instalado por cima. Biblioteca/“Ver tudo”/detalhe iguais (`wave2d-before/after-library|collection|detail-tv.png`); **Gerenciar assinatura** abre a tela Account do engine e **um** BACK volta ao painel (`wave2d-account-manage-tv.png`, `wave2d-account-back-tv.png`); `logcat -b crash` vazio. |
| `RXCX100BZ5J` (arm64, 1.9.13, Ajustes + letras) | Instalado por cima (`versionName=1.9.13`, `versionCode=10913`). Painel Conta mostra **Ajustes do Apple Music** (e **não** mostra Equalizador); toque → `engine settings opened id=0x7f0a008c` → tela **Ajustes** do engine (BIBLIOTECA, ÁUDIO); **um** BACK → `account BACK hooked on the engine back dispatcher` / `account screen BACK, returning to the UI` → `OneActivity`; `logcat -b crash` vazio. Letras: `/br/songs/1411628233` responde 200 com `hasLyrics=true`, mas `/lyrics` (e variantes) responde **404**; sem UI de letra (`wave3a-lyrics-probe.txt`). |
| `emulator-5554` (TV x86, 1.9.13, Ajustes) | x86 instalado por cima (`1.9.13`). Conta → **Ajustes do Apple Music** → tela Ajustes do engine (`engine settings opened id=0x7f0a008c`); **um** BACK volta à `OneActivity`; `logcat -b crash` vazio. |

Evidências lado a lado com as referências dos companions
(`.pipeline/revamp-tv/`, `.pipeline/revamp-car/` e as fotos de celular em
`.pipeline/car-app/`), em [`evidence/`](evidence):

| Tela | Single APK | Referência | Comparação |
|---|---|---|---|
| Início (TV) | `revamp-one-tv-home.png` | `revamp-tv/01-inicio.png` | `revamp-one-tv-home-vs-revamp-tv.png` |
| Biblioteca (TV) | `revamp-one-tv-library.png` | `revamp-tv/02-biblioteca.png` | `revamp-one-tv-library-vs-revamp-tv.png` |
| Rádio (TV) | `revamp-one-tv-radio.png` | `revamp-car/03-radio.png` | `revamp-one-tv-radio-vs-revamp-car.png` |
| Fullscreen (TV) | `revamp-one-tv-fullscreen.png` | `revamp-tv/04-fullscreen.png` | `revamp-one-tv-fullscreen-vs-revamp-tv.png` |
| Ações (TV) | `revamp-one-tv-actions.png` | `revamp-tv/05-acoes.png` | `revamp-one-tv-actions-vs-revamp-tv.png` |
| Busca (TV) | `revamp-one-tv-search.png` | `revamp-tv/03-chip-focado.png` (catálogo) | `revamp-one-tv-search-vs-revamp-tv.png` |
| Início (celular) | `revamp-one-phone-home.png` | `car-app/revamp-phone-home.png` | `revamp-one-phone-home-vs-car-app.png` |
| Biblioteca (celular) | `revamp-one-phone-library.png` | `car-app/revamp-phone-library.png` | `revamp-one-phone-library-vs-car-app.png` |
| Rádio (celular) | `revamp-one-phone-radio.png` | `car-app/revamp-phone-radio.png` | `revamp-one-phone-radio-vs-car-app.png` |
| Fullscreen (celular) | `revamp-one-phone-fullscreen.png` | `car-app/revamp-phone-player.png` | `revamp-one-phone-fullscreen-vs-car-app.png` |
| Ações (celular) | `revamp-one-phone-actions.png` | `car-app/revamp-phone-home.png` | `revamp-one-phone-actions-vs-car-app.png` |
| Busca (celular) | `revamp-one-phone-search.png` | `car-app/revamp-phone-library.png` | `revamp-one-phone-search-vs-car-app.png` |
| Conta logada (celular) | `account-profile-phone.png` | `revamp-one-phone-account.png` (convite) | perfil em vez do convite |
| Conta logada (TV) | `account-profile-tv.png` | `revamp-one-tv-home.png` (chrome) | painel central com perfil |
| Conta deslogada (TV) | `account-signedout-tv.png` | `revamp-one-phone-account.png` | convite + login preservados |

Extras da mesma rodada: `revamp-one-tv-home-focus.png` e
`revamp-one-tv-card-focus.png` (foco D-pad), `revamp-one-tv-home-playing.png`,
`revamp-one-tv-action-station.png` (feedback de Criar Estação),
`revamp-one-phone-home-playing.png` (mini player), `revamp-one-phone-seek.png`
(seek) e `revamp-one-phone-account.png` (painel de conta).

Onda 1 (1.9.6): `wave1a-player-phone.png` (player no celular com os três toggles),
`wave1a-shuffle-feedback.png` (confirmação “Aleatório alternado”),
`wave1a-actions-sheet.png` (sheet sem as três ações), `wave1a-land-home.png`
(landscape: “Atualizações” e o play do mini player fora da nav bar),
`wave1a-land-player.png` (player lado a lado com os toggles no cabeçalho),
`wave1a-search-one-get.png` e `wave1a-search-logcat.txt` (um único GET `daft`),
`wave1a-tv-player.png` e `wave1a-tv-feedback.png` (player e feedback na TV).

Onda 1b (1.9.7, rotação/estado): `wave1b-01-home-portrait.png` … `wave1b-04-home-back-portrait.png`
(Início antes, rolado, em landscape e de volta — mesma aba e posição), `wave1b-05-library.png`
… `wave1b-08-library-filter-back.png` (Biblioteca e filtro `backstreet` preservados nas duas
direções), `wave1b-09-home-for-detail.png` … `wave1b-12-detail-back-portrait.png` (playlist
`Chill` em pé e girada), `wave1b-13-album-detail.png` … `wave1b-17-detail-back-album.png`
(álbum → artista com breadcrumb de profundidade 2 e BACK), `wave1b-18-home-playing.png` …
`wave1b-25-player-queue-back.png` e `wave1b-32/33` (player e sheet “A seguir” com 34 faixas
girados), `wave1b-26/27/28` (overlay “Ver tudo”), `wave1b-29/30/31` (busca `daft` girada),
`wave1b-tv-01` … `wave1b-tv-07` (mesmos estados no emulador TV com `wm size`) e
`wave1b-restore-logcat.txt` (`root arrived, tab=N (restored)`, `overlays restored`,
`queue sheet restored`).

Onda 1c (1.9.8, a11y/updater): `wave1c-player.png` / `wave1c-player.xml` (player com os 21
nós e 10 clicáveis rotulados), `wave1c-actions.png` / `wave1c-actions.xml` (sheet só com a
camada ativa), `wave1c-queue.xml` (fila esconde a página do player), `wave1c-player-land.xml`
(fila girada), `wave1c-home.xml`, `wave1c-library.xml`, `wave1c-search.xml`,
`wave1c-detail.xml`, `wave1c-collection.xml`, `wave1c-radio.xml`, `wave1c-updates.xml`
(“Sem atualização para esta ABI”), `wave1c-account.xml` (dump **sem** `--compressed`, que
ainda mostra a tela de baixo) e `wave1c-account-compressed.xml` (árvore de acessibilidade só
com a conta) e `wave1c-tv-*` (player, ações e Início no emulador x86).

Fila (1.9.2): `queue-02-player.png` e `queue-11-tv-player.png` (pill **Fila** no celular
e na TV), `queue-03-panel.png` e `queue-12-tv-panel.png` (“A seguir” com a faixa atual em
accent), `queue-04-skipped.png` e `queue-13-tv-skipped.png` (depois do
`skipToQueueItem 2`: destaque na faixa 3 e fila reindexada), `queue-05-playing.png`,
`queue-06-resumed.png` e `queue-14-tv-back.png` (reprodução seguindo depois do salto),
`queue-01-albums.png` (lista de álbuns sem numeração/“Tocar”).

Hierarquia (1.9.3): `nav-02-artist-albums.png` (Angra → 2 álbuns),
`nav-03-album-tracks.png` (Aqua → 10 faixas + Tocar), `nav-04-third-track.png` (3ª faixa
tocando, em accent), `nav-05-playlist-tracks.png` (Backstreet Boys: essenciais → 22
faixas), `nav-06-playlist-third.png`, `nav-07-playlist-degrade.png` (playlist de usuário
sem catálogo, com Tocar), `nav-tv-01-artist-albums.png`, `nav-tv-02-album-tracks.png`,
`nav-tv-03-third-track.png`, `nav-tv-04-playlist-tracks.png` e
`nav-tv-05-playlist-third.png` (mesmos níveis na TV).

Detalhes (1.9.4): `detail-00-home.png`, `detail-01-search.png` (busca Angra com
chevron), `detail-02-song.png` (faixa: artista/álbum/duração/Tocar),
`detail-03-song-album-focus.png` (álbum aberto pela faixa, rolando até ela),
`detail-04-artist.png` (artista: arte, gêneros, 27 álbuns), `detail-05-artist-topsongs.png`
(músicas principais com álbum e duração), `detail-06-artist-album-artist.png` (breadcrumb
`Angra › Make Believe › Angra`), `detail-07-back-album.png`, `detail-08-back-artist.png` e
`detail-09-back-search.png` (BACK nível a nível), `detail-10-playlist.png` (curador, texto,
faixas com duração), `detail-11-home-card.png` (card do Início → álbum),
`detail-12-tv-home-card.png` (playlist na TV), `detail-13-tv-dpad-focus.png` (faixa focada
no D-pad), `detail-14-tv-artist.png` e `detail-15-tv-album.png` (artista/álbum na TV).

Biblioteca (1.9.5): `library-audit-01-categories.png` … `library-audit-07-recent.png`
(antes: categorias sem contagem/arte, artista caía no browse de 1 álbum, álbum/playlist
abriam lista sem capa/metadados), `library-01-root-phone.png` e
`library-02-artists-shelf-phone.png` (cabeçalho com contagem, filtro, Aleatória, seções),
`library-03-artist-detail-phone.png` (artista com arte, gênero e álbuns),
`library-04-artist-album-phone.png`, `library-05-album-detail-phone.png` (álbum da
biblioteca com faixas), `library-06-filter-phone.png` (filtro local),
`library-07-playlist-detail-phone.png`, `library-08-artists-ver-tudo-phone.png` e
`library-09-ver-tudo-artist-detail-phone.png` (lista completa → detalhe),
`library-10-playlist-degrade-phone.png` (playlist do usuário com **Tocar**),
`library-11-root-after-phone.png`, `library-12-tv-home.png`,
`library-13-tv-library.png` (TV), `library-14-tv-focus-search.png` …
`library-18-tv-focus-shelf3.png` (D-pad seção a seção), `library-19-tv-artist-focus.png`
e `library-20-tv-artist-detail.png`, `library-23-tv-library-album-detail.png` e
`library-24-tv-album-playing.png` (álbum da biblioteca na TV).

## Limitações / P1

- **Aleatório/Repetir sem estado ativo**: o engine publica as ações, mas não o modo
  resultante. Medido no `PlaybackState` (1.9.6): extras trazem flags de fila/formato
  (`...EXTRA_NUM_REPEATABLE_TRACKS`, `EXO_SPEED`, `...PLAYBACK_STATE_EXTRA_AUDIO_VARIANT`,
  `...EXTRA_CAN_EDIT_QUEUE`, `androidx.media.PlaybackStateCompat.Extras.KEY_MEDIA_ID`…) e
  **nenhuma chave de shuffle/repeat**; `dumpsys media_session` também só mostra os
  `custom actions` (Favorito/Aleatório/Repetir/Reprodução Automática/Adicionar à
  Biblioteca/Criar Estação quando há faixa; Aleatório/Repetir/Reprodução Automática com a
  sessão sem faixa). Por isso os botões só enviam a ação e confirmam; não pintam
  ativo/inativo. O caso “ação ausente com o player aberto” não foi reproduzido.
- **Altura do player no celular**: a linha dos toggles custa ~50 dp. No aparelho de teste
  (780 dp de altura) sobra espaço; num aparelho de 640 dp de altura a linha de pills pode
  encostar na barra de navegação (UNVERIFIED, sem device pequeno nesta rodada).
- **Insets horizontais**: o conteúdo aplica left/right + `displayCutout`; em landscape a
  barra de apps troca os atalhos rotulados por ícones (Buscar/Conta/Atualizações) porque a
  fileira rotulada não cabe ao lado das abas — ver `wave1a-land-home.png`.
- **Rotação recarrega o conteúdo**: a tela (aba, overlay, filtro, termo, scroll) volta
  igual, mas o conteúdo é buscado de novo — uma assinatura por nó e uma consulta por busca;
  posição de faixa/fila e o estado de shuffle/repeat continuam vindo do engine, não do
  estado salvo. O scroll é uma fração do alcance (a altura dos cards muda entre portrait e
  landscape) e o scroll dos resultados do filtro da Biblioteca pode voltar ao topo enquanto
  as categorias ainda chegam. O sheet "Ações" só reaparece se a sessão publicar as mesmas
  ações no primeiro snapshot, e os painéis Conta/Atualizações reabrem sem novo `check()`.
- **Sem blur real**: o fundo do player é um gradiente escuro da cor dominante da capa
  (API 29 viável, sem `RenderEffect`/RenderScript nem blur em software). O visual é
  próximo do car-app, não idêntico ao desfoque do iOS.
- **Home carrega todas as prateleiras de uma vez** (~22 × 12 cards) e baixa todas as
  capas; não há carregamento sob demanda por prateleira.
- **Updater**: o caminho de download + SHA-256 + `PackageInstaller` continua não
  exercitado ponta a ponta (não há release com `one-*`); o caminho “sem atualização”
  (parsing do `updates.json` real) foi validado nos dois devices, agora mostrando
  `Sem atualização para esta ABI` na 1.9.8. A seleção de asset é só pela **ABI primária**
  (teste JVM em `single-apk/test-single-ui.ps1`); `one-arm32`/`one-x86` não são mais
  oferecidos como fallback.
- **Acessibilidade medida por dump**: `uiautomator dump` sem `--compressed` lista também
  views que não são importantes para acessibilidade (comportamento do UiAutomator), então a
  verificação de “só a camada ativa” usa `uiautomator dump --compressed`; o TalkBack em si
  não foi ligado nesta rodada (avaliação estática da árvore).
- **“Tocar tudo” no artista não existe**: a amp-api devolve álbuns e músicas principais,
  mas não uma coleção tocável, e o engine não monta fila para id de artista (testado com
  `playFromMediaId(192030844)` e `ra.192030844`: sessão continua `state=NONE`). O artista
  fica sem o pill **Tocar**; cada álbum e cada faixa principal continuam tocando.
- **Biblioteca sem capa de artista**: o browse devolve `art=0` para os 93 artistas (só os
  álbuns/playlists têm `content://`), então a seção usa a inicial em um disco; a arte real
  aparece no `DetailScreen` (resolvida na amp-api).
- **Biblioteca mostra 20 cards por seção**: as listas completas (93 artistas, 281 álbuns)
  ficam atrás de **Ver tudo** e o filtro local procura em todos os itens já carregados; não
  há busca de servidor nem carregamento incremental dentro da aba. A ordenação **A–Z** é
  aplicada às seções e ao filtro, mas o overlay de **Ver tudo** continua na ordem da fonte
  (não há parâmetro de ordenação no `CollectionScreen`).
- **“Músicas” não existe no browse**: `/library/songs` é um leaf `playable` (0 filhos) cujo
  único papel é o **Shuffle Library**; a lista de faixas do app original vem de uma consulta
  local à `MediaLibrary` do engine (`LibrarySections`), fora da árvore do `MediaBrowser`.
  A rota `/v1/me/library/songs` da amp-api exigiria o MUT, que não é legível pela UI — não
  foi exercitada (UNVERIFIED). O atalho **Aleatória** continua sendo o caminho.
- **Busca no escopo Biblioteca depende do que já foi carregado**: ela lê o cache de browse
  da Biblioteca (sem rede) e, se a aba nunca abriu no processo, mostra **Abrir Biblioteca**
  em vez de buscar. O snapshot estático sobrevive à rotação, mas **não** à morte do
  processo; nesse caso é preciso reabrir a Biblioteca uma vez.
- **`one-x86`** não é publicado pelo CI (só arm32/arm64); o build local gera para o
  emulador.
- **Login**: o diálogo AMS é hospedado pela `MainActivity` do engine; a UI o fecha
  (X/BACK/sucesso) ao ver `shouldShowAMSAuthWithType` voltar a `null`. O fluxo de
  senha/2FA do Apple ID não é exercitado automaticamente (a senha não está no repo).
- **Conta (links e BACK)**: os links usam o dispatcher interno do engine 7.0.0 para fazer
  um BACK voltar ao painel; se uma build futura mudar o formato das classes/fields, o código
  cai no fallback de `OnBackInvokedDispatcher` (API 33+) e o BACK pode voltar para a home do
  engine. Medido em API 34 (TV) e API 36 (celular); **API 29 não exercitada**. Sign out
  continua ausente por decisão de segurança.
- **Letras (endpoint da amp-api)**: `GET /v1/catalog/{sf}/songs/{id}/lyrics` devolveu
  **HTTP 404 "No related resources found for lyrics"** para uma faixa com
  `hasLyrics=true` e `hasTimeSyncedLyrics=true`, com o developer token da UI; as variantes
  (`extend=ttmlLocalizations`, sem `l`, storefront `us`) também deram 404. Nenhuma UI de
  letra foi adicionada; o caminho interno de TTML do engine (ou um token que exponha a
  relação) não foi investigado a fundo — UNVERIFIED.
- **Equalizador**: a `EQActivity` declarada no manifest não abre (sem tema AppCompat e,
  depois do override, `EQActivityFragment.onCreateView` lança `NullPointerException`); o
  atalho é escondido para não derrubar o app. A preferência de equalizador do engine fica
  na tela **Ajustes do Apple Music** (`settings_preference.xml`), não exercitada nesta
  rodada. Uma UI de EQ própria exigiria falar com o renderer/`DefaultEqualizerConfig`,
  fora do escopo; **API 29 não exercitada**.
- **Foco inicial no emulador TV**: o emulador se anuncia como touchscreen; a UI detecta
  `leanback`/`uiMode` television e usa o caminho D-pad. Em devices sem essa flag o foco
  pode cair no modo toque.
- **Assinatura**: os APKs saem com o cert Morphe; sem ele o `install -r` falha e a conta
  seria perdida ao desinstalar.
