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
| `media/` | `MediaClient`, `ArtworkLoader`, `CatalogSearch` | `MediaBrowser`/`MediaController` do engine, capas, busca na `amp-api` |
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
./single-apk/build-one-apk.ps1 -PoneVersion 1.9.0          # versionCode 10900 derivado
./single-apk/build-one-apk.ps1 -Abi arm64,arm32 -PoneVersion 1.9.0
```

O build compila a UI uma vez e gera, para cada ABI:

| ABI | Engine de entrada | Saída |
|---|---|---|
| arm64 | `.pipeline/ci162/AppleMusic-engine-arm64.apk` | `single-apk/out-one/AppleMusic-one-arm64.apk` |
| arm32 | `.pipeline/rel160/AppleMusic-engine-arm32.apk` | `single-apk/out-one/AppleMusic-one-arm32.apk` |
| x86 | `.pipeline/emulator/AppleMusic-engine-x86.apk` | `single-apk/out-one/AppleMusic-one-x86.apk` |

Antes do `javac` o build gera `out-one/generated/.../Version.java` com `NAME = -PoneVersion`
e `CODE = -PoneVersionCode` (derivado como `MAJOR*10000+MINOR*100+PATCH`); é essa versão da
UI — não o `7.0.0` do engine — que aparece no painel de Atualizações e que o updater
compara.

Passos por ABI: extrai o `AndroidManifest.xml` binário → injeta a activity (MAIN/LAUNCHER +
tema) e `<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES"/>` →
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
# 139 classes, todas Lcom/anderson/applemusic/one/...
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
  “Ver tudo” e ícone por seção; artista/álbum/playlist de biblioteca abrem as telas de
  detalhe resolvendo o id de catálogo pelo nome. Rádio continua em grade de estações
  (`RadioScreen`), com breadcrumb, botão **‹** e drill-down; “Ver tudo” de uma prateleira
  abre o `CollectionScreen` em overlay com o mesmo tratamento.
- **Navegação hierárquica**: artista → álbuns (browse), álbum → faixas e playlist → faixas
  (amp-api), com **Tocar** a coleção inteira e toque numa faixa que já começa nela. Detalhes
  de ids e degradação na seção **Navegação hierárquica**.
- **Now Playing fullscreen**: fundo em gradiente escuro derivado da **cor dominante da
  capa** (`ColorArt`), capa grande 16 dp, título/artista/álbum, progresso com tempos,
  prev 60 / play 80 / next 60 (play em accent), **Criar Estação**, **Ações** e **Fila**.
  Layout lado a lado em TV/carro e empilhado no celular. Seek arrasta e envia `seekTo`.
- **Fila / “A seguir”**: pill **Fila** no player (escondida quando a sessão não tem fila)
  abre um sheet com `MediaController.getQueue()` — número, título, artista, a faixa atual
  em accent com o glifo de play. Tocar uma linha chama
  `skipToQueueItem(QueueItem.getQueueId())`; o sheet fica aberto e o destaque anda junto.
  BACK com o sheet aberto fecha só o sheet.
- **Coleções de faixas**: quando o nó lista faixas (não mais coleções), `CollectionScreen`
  mostra **Tocar** no cabeçalho, numera as linhas e marca a que está tocando; tocar uma
  linha toca a coleção e salta para aquela faixa. Se o engine não montar a fila a tempo,
  cai para `playFromMediaId` da própria faixa.
- **Ações**: sheet centrado com as `customActions`, linhas de 56 dp, bullet accent para
  “Criar Estação”, feedback (“Favorito aplicado”, “Criando estação…”) e Fechar.
- **Mini player**: persistente em todas as telas, capa 40 dp, play/pause; toque fora do
  botão abre o player. No D-pad, DOWN de um card foca a barra e ENTER abre o player.
- **Busca**: campo arredondado, resultados agrupados por tipo (Músicas/Álbuns/Artistas/
  Playlists) com capa, skeleton durante a consulta, estado vazio e estado sem conexão com
  “Tentar de novo” + fallback “Abrir a busca do Apple Music”. TV usa o IME do sistema.
  Tocar um resultado abre o nível correspondente (artista/álbum/playlist/faixa); **longa
  pressão** continua tocando o resultado direto.
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
  nome, Apple ID e assinatura); sem sessão, mostra o convite e o botão oficial de login
  do Apple ID (fluxo acima). O estado é relido a cada abertura do painel.
- **Atualizações**: painel com versão instalada (`1.9.0 (10900)`), versão do engine,
  mensagem de estado, progresso, Verificar / Baixar e instalar / Cancelar / Fechar.
  Compara `one-<abi>.versionCode`, baixa, confere SHA-256 e instala via `PackageInstaller`.
- **Estados**: vazio, erro e sem conexão com ícone e texto (`EmptyState`) em Início,
  Biblioteca, Rádio, Busca e Atualizações.
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

- **Sem blur real**: o fundo do player é um gradiente escuro da cor dominante da capa
  (API 29 viável, sem `RenderEffect`/RenderScript nem blur em software). O visual é
  próximo do car-app, não idêntico ao desfoque do iOS.
- **Home carrega todas as prateleiras de uma vez** (~22 × 12 cards) e baixa todas as
  capas; não há carregamento sob demanda por prateleira.
- **Updater**: o caminho de download + SHA-256 + `PackageInstaller` continua não
  exercitado ponta a ponta (não há release com `one-*`); o caminho “sem atualização”
  (parsing do `updates.json` real) foi validado nos dois devices, agora mostrando
  `1.9.0 (10900)`.
- **“Tocar tudo” no artista não existe**: a amp-api devolve álbuns e músicas principais,
  mas não uma coleção tocável, e o engine não monta fila para id de artista (testado com
  `playFromMediaId(192030844)` e `ra.192030844`: sessão continua `state=NONE`). O artista
  fica sem o pill **Tocar**; cada álbum e cada faixa principal continuam tocando.
- **Biblioteca sem capa de artista**: o browse devolve `art=0` para os 93 artistas (só os
  álbuns/playlists têm `content://`), então a seção usa a inicial em um disco; a arte real
  aparece no `DetailScreen` (resolvida na amp-api).
- **Biblioteca mostra 20 cards por seção**: as listas completas (93 artistas, 281 álbuns)
  ficam atrás de **Ver tudo** e o filtro local procura em todos os itens já carregados; não
  há busca de servidor nem carregamento incremental dentro da aba.
- **“Aleatória” sem lista de faixas**: `/library/songs` é `playable` e devolve 0 filhos,
  então a Biblioteca não tem a categoria “Músicas” — o atalho toca a biblioteca
  embaralhada (fila medida: 101 itens).
- **`one-x86`** não é publicado pelo CI (só arm32/arm64); o build local gera para o
  emulador.
- **Login**: o diálogo AMS é hospedado pela `MainActivity` do engine; a UI o fecha
  (X/BACK/sucesso) ao ver `shouldShowAMSAuthWithType` voltar a `null`. O fluxo de
  senha/2FA do Apple ID não é exercitado automaticamente (a senha não está no repo).
- **Foco inicial no emulador TV**: o emulador se anuncia como touchscreen; a UI detecta
  `leanback`/`uiMode` television e usa o caminho D-pad. Em devices sem essa flag o foco
  pode cair no modo toque.
- **Assinatura**: os APKs saem com o cert Morphe; sem ele o `install -r` falha e a conta
  seria perdida ao desinstalar.
