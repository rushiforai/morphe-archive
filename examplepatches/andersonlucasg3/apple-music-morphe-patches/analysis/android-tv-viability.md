# Viabilidade de Android TV — Apple Music 7.0.0 (`com.apple.android.music`, versionCode 1614)

Investigação somente-leitura sobre o APK 7.0.0 e o fonte decompilado. Nenhum patch, build ou
arquivo de código foi alterado; o único artefato produzido é este relatório. Todas as afirmações
abaixo têm evidência `arquivo:linha` ou foram obtidas por leitura direta de DEX/XML; o que não
pôde ser provado está marcado **UNVERIFIED**.

---

## Resumo

O app **já tem mais substrato de TV do que o briefing supunha**, mas não tem a entrada de TV:

- Três dos cinco tabs (New, Radio, Library) e várias telas de detalhe/settings são **Jetpack
  Compose**; Listen Now e Search continuam em **Epoxy/RecyclerView**. O Compose
  embarcado tem o sistema de foco e o tratamento de teclas (`onKeyEvent`) do Foundation, e o
  `ContentInViewNode` do Foundation já escolhe um comportamento de *scroll-to-focused* diferente
  quando `android.software.leanback` existe (`Cc/c.java:30` + `O/C1780w.java:92,389`). Isso é
  suporte de TV **da biblioteca**, não do app.
- O layout de tablet existe e casa com TV 1080p: `layout-w600dp/activity_main.xml` (DrawerLayout +
  NavigationView) e `values-w600dp/bools.xml` (`is_tablet=true`, `useNavigationDrawer=true`).
  Importante: em 1080p/320 dpi a tela tem 960×540 dp, então **`sw600dp` NÃO casa** (menor largura
  540 dp), mas **`w600dp` casa** — e é `w600dp`, não `sw600dp`, que define o grosso do tablet.
- O app **não tem nenhuma detecção de TV no código de UI**. Os usos de `uiMode & 48 == 32` em
  `utils/ExtensionsKt.java:431` e `utils/C4184h.java:1109` são **modo noturno**
  (`UI_MODE_NIGHT_YES`), não `UI_MODE_TYPE_TELEVISION` (que é `4`, máscara `15`). As strings
  `android.software.leanback` / `android.hardware.type.television` pertencem a bibliotecas
  (Compose Foundation, media3, MediaRouter, Firebase), não ao app.
- Não há `LEANBACK_LAUNCHER`, `android:banner`, `android.software.leanback` nem
  `android.hardware.touchscreen required=false` no manifest. Sem isso o app não aparece no
  launcher de TV nem no catálogo de TV da Play.
- O login interativo **não é uma tela nativa**: é um diálogo Compose que renderiza o
  `PageViewState` do AMSUIKit, que por sua vez é um `WebView` (`AuthenticationDialogAmsKt.java:168`,
  `PageViewContents.java:895`, `UIKitAndroidWebView.java:58`). O layout nativo
  `fragment_signin.xml` (e-mail/senha em `CustomEditText`) existe, mas está morto: nenhuma classe
  do app infla `R.layout.fragment_signin`; o id só aparece no `DataBinderMapperImpl` (varredura de
  constantes no DEX). Esse é o bloqueador mais caro.

Balanço: **layout de tablet + Compose já suportam TV parcialmente; manifest é barato; D-pad em
Epoxy e login por WebView são os bloqueadores reais.**

---

## O que já existe

### 1. Quem referencia `android.software.leanback` e `android.hardware.type.television`

Varredura do fonte decompilado (`analysis/jadx_src/sources`) por ambas as strings e por
`hasSystemFeature(`. Quatro sítios, todos de biblioteca:

| Arquivo:linha | Classe / método | Efeito |
|---|---|---|
| `Cc/c.java:30-34` | `androidx.compose.foundation.gestures.ContentInViewNode` (a classe é `O/C1780w`, ver `O/C1780w.java:92`) — lambda default de `ContentInViewScrollSpec` | Se `hasSystemFeature("android.software.leanback")`, usa `C1778v.f14179b`; senão `InterfaceC1776u.a.f14169c` (`O/C1778v.java:5-7`). Muda o cálculo de *bring-into-view* para o item focado. **Suporte a D-pad de biblioteca, não do app.** |
| `androidx/mediarouter/app/a.java:53` | `a.c(Context)` | `isTV = com.google.android.tv || android.hardware.type.television || android.software.leanback`; usado em `androidx/mediarouter/app/e.java:440,463` para o diálogo de rotas/cast. |
| `H6/d.java:29-39` | `H6.d.a(Context)` (implementa `Yg.f.a`) | TV → `BuildConfig.FLAVOR` (string vazia); watch → `"watch"`; auto → `"auto"`; embedded → `"embedded"`. Registrado como metadado **`android-platform`** do Firebase em `com/google/firebase/FirebaseCommonRegistrar.java:52`. Só telemetria/UA. |
| `J4/B2.java:1287-1291` | Classe de sessão de mídia do media3 (stub legado; `J4/B2`) | Em leanback, o tratamento de `KEYCODE_MEDIA_PLAY_PAUSE`/`KEYCODE_HEADSETHOOK` não usa o atraso de duplo-toque; é o comportamento de TV do media3. |

Não há `androidx.tv` nem `androidx.leanback` no APK: zero classes em
`analysis/_evidence/defined_classes.txt`, zero diretórios em `analysis/jadx_src/sources/androidx`,
zero strings `androidx.tv`/`androidx.leanback` em `dex_strings.txt`.

Artefatos de TV que existem sem serem UI do app:

- `analysis/jadx_res/resources/META-INF/onboardingkit-ui_tvRelease.kotlin_module`: módulo
  `com.apple.applemediaservices.onboardingkit` compilado na variante **`tvRelease`**, com
  `PrivacySplash*`, `PrivacyLink*`, `PrivacyModalBottomSheet*` (apenas o onboarding de privacidade).
- `analysis/jadx_res/resources/AndroidManifest.xml:74`: `<queries><package
  android:name="com.apple.atve.androidtv.appletv"/>` — o app consulta a visibilidade do pacote do
  **Apple TV para Android TV**. Não há código em `com/apple` que use esse pacote; é só `<queries>`.
- `analysis/jadx_res/resources/car-app-api.level` = `7`; a lib `androidx.car.app` está no APK
  (provider `androidx.car.app.connection` em `AndroidManifest.xml:63-65`,
  `CarAppPermissionActivity` em `:588`, receiver em `:591`), mas **não existe
  `androidx.car.app.CarAppService`** no manifest. Ou seja, a lib está presente, o serviço de Car
  App não.

### 2. Stack de UI por tela

Fonte principal: `Xb/e.java` (fragmento-base que **devolve um `ComposeView`**):

- `Xb/e.java:237-245` — `onCreateView` cria `new ComposeView(...)`, aplica
  `setViewCompositionStrategy` e `setContent(...)`; a tela inteira é Compose.
- 36 subclasses declaradas como `extends Xb.e`/`extends Xb.h` em `com/apple` (varredura
  `extends Xb.e|extends Xb.h`), mais as que importam `Xb.h` e usam `extends h` (ex.:
  `NewTabFragment.java:5,38`).

| Tela | Stack | Evidência |
|---|---|---|
| Shell `MainActivity` | Views (ConstraintLayout/DrawerLayout) + 2 `ComposeView` (gradientes e `dialogs_host`) | `layout/activity_main.xml:14,42`; `layout-w600dp/activity_main.xml:27,55` |
| Listen Now | Epoxy `ScrollInterceptingEpoxyRecyclerView` + `ComposeView` de app bar flutuante | `layout/fragment_listen_now.xml:15-20,23-28` |
| New (tab `new_navigation`) | **Compose** (`NewTabFragment extends Xb.h`) | `newtab/NewTabFragment.java:5,38`; `Xb/e.java:237-245` |
| Radio | **Compose** (`RadioFragment extends Xb.h`) | `radio3/RadioFragment.java:51` |
| Library | **Compose** (`LibraryComposeContentFragment extends Xb.h`) | `library3/LibraryComposeContentFragment.java:127`; nav `library_navigation.xml` (start destination `LibraryComposeContentFragment`) |
| Search (landing) | Epoxy `ExclusiveViewPoolEpoxyRecyclerView` + Compose app bar | `layout/fragment_landing_search.xml:11-16,18-24` |
| Album | **Compose** (`AlbumPageFragment extends Xb.h`); existe variante legada Epoxy (`AlbumFragment`) | `collection2/fragment/AlbumPageFragment.java:102`; `collection/mediaapi/fragment/AlbumFragment.java:1056`; ambas no `nav_graph.xml:47-57` (`action_album_legacy` vs `action_album_compose`) |
| Artist | **Compose** (`ArtistFragment extends Xb.h`) | `profiles2/ArtistFragment.java:62` |
| Settings | **Compose** (`SettingsFragment extends Xb.e`) | `settings2/fragment/SettingsFragment.java:45` |
| Now Playing | Views (ConstraintLayout, controles custom) | `layout/music_player.xml:2-10`; `layout/constraint_player_media_controls.xml` |
| Lyrics | RecyclerView + Compose app bar | `layout/fragment_static_lyrics.xml:11-20`; `lyrics/StaticLyricsFragment.java:48,267,418` |
| MLI / Chrome tab | WebView (container programático) | `layout/mli_page_layout.xml:29-36`; `AndroidManifest.xml:345-358` |
| Login | Diálogo Compose + AMSUIKit `PageView` → WebView | ver §7 |

Sobre “telas principais”: os tabs de `MusicContentFragment` são
`ListenNowFragment` (Epoxy), `NewTabFragment` (Compose), `RadioFragment` (Compose),
`LibraryComposeContentFragment` (Compose) e `SearchLandingFragment` (Epoxy) — ver
`navigation/home_navigation.xml`, `new_navigation.xml`, `radio_navigation.xml`,
`library_navigation.xml`, `search_navigation.xml`. (O antigo Browse/`TopChartsFragment` é Epoxy —
`TopChartsFragment.java:169-172` — e continua no grafo como `action_top_chart`; o grafo do tab
`new_navigation.xml` aponta para `NewTabFragment`.) O shell de tablet monta os tabs em **Compose**:
`layout-w600dp/fragment_music_content.xml:49-56` (`top_nav_tabs` é `ComposeView`) e
`MusicContentFragment.java:1840-1843` (`setContent`); no telefone é `BottomNavigationView`
(`layout/fragment_music_content.xml:66-85`, listener em `MusicContentFragment.java:1862-1874`).

### 3. Compose: onde está e qual versão

- `androidx.compose.ui.platform.ComposeView` aparece 24 vezes em 21 layouts (incluindo
  `layout-w600dp/activity_main.xml` e `layout-w600dp/fragment_music_content.xml`).
- O pacote `androidx.compose` no fonte decompilado só preserva nomes em
  `analysis/jadx_src/sources/androidx/compose/ui/platform/` (15 arquivos); o resto do Compose foi
  ofuscado para pacotes como `O`, `X`, `p504z0`, `p291o1`, `H0`.
- **Versão exata: UNVERIFIED.** Não há `ComposeVersion`, `androidx.compose.ui:ui:1.x` nem string
  de versão do Compose em `analysis/_evidence/dex_strings.txt`; `ComposeVersion` também não
  aparece em `defined_classes.txt` (foi inlinado/removido pelo R8). O que se pode afirmar:
  - metadata Kotlin `mv = {2, 0, 0}`/`{2, 1, 0}` nas classes Compose (ex.: `ComposeView.java:17`;
    `O/C1780w.java:92`), ou seja, Kotlin 2.0/2.1;
  - APIs de `Modifier.Node`/`FocusableNode`/`ContentInViewNode` e `ContentInViewScrollSpec`
    presentes (`O/C1780w.java:92,389`; `Cc/c.java:30`), o que indica Compose recente, mas **não
    autoriza afirmar um número de versão** — o número não está no APK.

### 4. D-pad e teclas: o que o app trata

Varredura de `com/apple` por `onKeyDown`, `onKeyUp`, `dispatchKeyEvent`, `onKeyPreIme`,
`setOnKeyListener`, `KeyEvent.KEYCODE_`:

- **Um único `onKeyUp`**: `common/MainContentActivity.java:936-958`. Ele trata
  `KEYCODE_BACK` (`4`) e `KEYCODE_VOLUME_UP/DOWN` (`24`/`25`) e delega o resto para `super`.
- `MainContentActivity` **não está no manifest**: a lista decodificada de activities
  (`analysis/_evidence/manifest_decoded_summary.txt:67-97`) e o `AndroidManifest.xml:116-358` não
  a contêm. A activity que abre é `MainActivity` (`AndroidManifest.xml:157-165`), que
  **não sobrescreve** `onKeyUp`/`onKeyDown`/`dispatchKeyEvent` (varredura global em `com/apple`).
- `setOnKeyListener` aparece só em `collection/mediaapi/fragment/StartCollabUpsellFragment.java:83`
  (BACK em diálogo) e `settings/fragment/GiftCardRedeemDialog.java:86` é `onEditorAction`, não
  D-pad.
- **Nenhum `KEYCODE_DPAD_*`** no string pool do DEX (`analysis/_evidence/dex_strings.txt`); não há
  `onKeyPreIme`, `onGenericMotionEvent`, `dispatchGenericMotionEvent` nem `onTrackballEvent` em
  `com/apple`.

Foco declarado em XML: 105 ocorrências de `android:focusable="true"` em 77 layouts base +
`layout-w600dp`, 22 `android:nextFocus*` em 11 layouts (contagem em `layout/` e
`layout-w600dp/`). Mas é heterogêneo e sem mapa de navegação:

- Focáveis: `layout/large_list_a_item.xml:5`; `layout/small_list_c_item.xml:6`;
  `layout/header_page_e.xml:38,70,79`; `layout/large_list_a_item_library.xml:6`.
- **Não focáveis na raiz**: `layout/small_list_d_item.xml:2-8` (sem `focusable`);
  `layout/header_page_e.xml:2-7` (raiz sem `focusable`); `layout/fragment_music_content.xml:65-66`
  e `layout-w600dp/fragment_music_content.xml:65-66` marcam o `player_sheet_container` como
  `focusable=false`/`focusableInTouchMode=false`.
- Nenhum `android:focusedByDefault="true"` nem `android:defaultFocus` em layout algum; só
  `focusedByDefault="false"` em `new_playlist_header.xml:30,56`. Também não há
  `keyboardNavigationCluster` nos layouts do app (só em `abc_screen_toolbar.xml`).

Carrosséis e paginação:

- `common/recyclerview/ScrollInterceptingEpoxyRecyclerView.java:35-56` só intercepta
  `MotionEvent` (toque); não há `onKeyDown`.
- `common/recyclerview/CarouselConfiguringLayoutManager.java:34-36` é um layout manager “dummy”
  só para padding/peek (`F()` lança `UnsupportedOperationException`).
- `AbsolutePeekCarousel` estende o carrossel do Epoxy (`AbsolutePeekCarousel.java:17`) e só
  sobrescreve medição (`X(View)`, `B0()`); nenhuma tecla.
- `ViewPager2` aparece em Search, NewPlaylist, Reactions, EmojiKeyboard etc.; em
  `Search2ResultsPagerFragment.java:958` e `search/fragments/viewpager/F.java:122` o
  `setUserInputEnabled(false)` desliga o swipe e deixa a troca por toque nos tabs.
- A troca de tabs em si é por callback de clique, não por gesto: no tablet é o `ComposeView`
  `top_nav_tabs` (`MusicContentFragment.java:1840-1843`, `g1()` em `:1295-1327`) com
  `Modifier.clickable`; no telefone é `BottomNavigationView.setOnItemSelectedListener`
  (`MusicContentFragment.java:1862-1874`). O primeiro tem DPAD_CENTER coberto pelo Compose; a
  focabilidade dos itens do `BottomNavigationView` **não foi verificada**.
- O que **funciona** por padrão é o Compose: `AbstractClickableNode$onKeyEvent` e
  `ScrollableNode$onKeyEvent` estão compilados (`dex_strings.txt:101669-101670,101734-101735`), ou
  seja, `Modifier.clickable` trata DPAD_CENTER/ENTER e os scrollables Compose tratam setas.

Teclas de mídia: `MediaPlaybackService` declara `android.media.browse.MediaBrowserService`,
`androidx.media3.session.MediaSessionService` e `android.intent.action.MEDIA_BUTTON`
(`AndroidManifest.xml:368-377`); o stub do media3 trata play/pause em leanback
(`J4/B2.java:1287-1291`). Isso deve fazer o play/pause do controle remoto funcionar mesmo com a UI
sem foco, mas é session de mídia — não navegação.

### 5. APIs de foco do Compose no DEX

Presentes (strings de erro/diagnóstico e nomes de classes internas no DEX):

- `FocusRequester` / `focusRequester` / `FocusRequesterElement` — `dex_strings.txt:1809-1810,29146-29157`.
- `focusProperties`, `applyFocusProperties called on wrong node` — `dex_strings.txt:102861,115714`.
- `FocusOwnerImpl:dispatchKeyEvent`, `FocusTransactions:requestFocus`, `focusManager`,
  `LocalFocusManager` — `dex_strings.txt:29144,29158,115713,72680`.
- `FocusableNode` (Foundation) — `dex_strings.txt:101679-101680`.
- `onKeyEvent` no clickable/scrollable — `dex_strings.txt:101669-101670,101734-101735`.

Não encontrados no pool de strings: `focusGroup`/`FocusGroup` e `onPreviewKeyEvent`. Isso **não
prova ausência da classe** (R8 pode ter removido nomes não usados), mas prova que o app não usa
essas APIs: varredura de `com/apple` por `FocusRequester|focusGroup|focusProperties|onKeyEvent|
LocalFocusManager` retorna **zero**. Ou seja: o app usa o foco automático do Compose, sem
`focusGroup`, sem `focusRequester` explícito e sem tratamento de tecla próprio.

`androidx.tv`/`androidx.leanback`: ausentes (ver §1).

### 6. Recursos: qualificadores e largura

Diretórios em `analysis/jadx_res/resources/res`:

- **Existem** `layout-land`, `layout-w400dp`, `layout-w600dp`, `layout-w600dp-land`,
  `layout-w600dp-port`, `layout-w675dp`, `layout-w720dp`, `layout-w735dp`, `layout-w830dp`,
  `layout-w834dp`, `layout-sw600dp`, `values-w600dp`, `values-sw600dp`, `values-w600dp-land`,
  `values-w600dp-port`, `values-h720dp`, `values-h1024dp`, `values-w1024dp`, `values-w1135dp`,
  `values-w1195dp`, `values-w1501dp`, `values-w2501dp`, `menu-sw600dp`, `drawable-w600dp`.
- **Não existe** nenhum `*-television` (nem `layout-television`, `values-television`,
  `drawable-television`).

O que muda com largura:

- `layout-w600dp/activity_main.xml` troca o `ConstraintLayout` do telefone
  (`layout/activity_main.xml:2-6`) por **`DrawerLayout` + `NavigationView`**
  (`layout-w600dp/activity_main.xml:2,70-98`).
- `values-w600dp/bools.xml:3-5`: `is_tablet=true`, `useNavigationDrawer=true`; no base
  `values/bools.xml:24,35` ambos são `false`.
- `values-sw600dp/bools.xml:3`: `is_tablet=true` (só o booleano; o layout de tablet está em
  `layout-w600dp`, não em `layout-sw600dp`).
- `values-w600dp/dimens.xml` (22 dimens) muda margens/tamanhos de mini player, header, now playing,
  playlist, search, upsell etc. (`:1-24`); há também `values-w600dp-land`, `values-w600dp-port`,
  `values-w600dp-h720dp`.
- `layout-w600dp` tem 23 layouts, incluindo `activity_main.xml`, `fragment_music_content.xml`,
  `music_player.xml`, `library_main.xml`, `header_page_e.xml`, `header_page_f.xml`.
- `layout-land` tem 8 layouts, quase todos de widget/player de vídeo
  (`video_controller.xml`, `appwidget_player_*`), e `layout-w600dp-land/bottom_navigation.xml`.

**TV 1080p e a conta de densidade:** a premissa do briefing é 1920×1080 a 320 dpi. Isso dá
960×540 dp. O qualificador `sw600dp` usa a **menor** largura (540 dp) e **não casa**; `w600dp` usa
a largura disponível (960 dp) e **casa**. Consequência:

- `values-w600dp/bools.xml` → `is_tablet=true` (bom).
- `layout-w600dp/*` → layout de tablet/drawer (bom).
- `values-sw600dp/*` → **não** se aplica em 1080p/320; em 1080p/240 (1280×720 dp) aplica-se.
- `m1.x()` (`utils/m1.java:505-515`) olha `smallestScreenWidthDp >= 600`: em 1080p/320
  (540 dp) ele retorna **`PHONE`**, e `MainActivity` travaria orientação em retrato
  (`MainActivity.java:938-945`, `setRequestedOrientation(7)`). O patch atual força
  `K.TABLET` no início de `m1.x()` (`AppleMusicDiLinkPatch.kt:608-614`), o que também resolve TV
  1080p/320 — mas esse acoplamento precisa ser mantido/consciente no patch de TV.

Para o DiLink atual (1920×1080 a 240 dpi = 1280×720 dp), `sw600dp` e `w600dp` casam; por isso a
validação existente não distingue os dois casos.

### 7. Manifest: componentes relevantes

Activities de UI (nomes e linhas em `analysis/jadx_res/resources/AndroidManifest.xml`):

- `com.apple.android.music.common.MainActivity` — `:157-234`: `exported=true`,
  `launchMode=singleTask`, `windowSoftInputMode=adjustPan`, filtros `MAIN`+`LAUNCHER`
  (`:162-165`), `MEDIA_PLAY_FROM_SEARCH` (`:166-169`), `MEDIA_SEARCH` (`:170-173`), deep links
  `music.apple.com`/`applemusic.com`/`itun.es`/`itunes.apple.com` (`:174-203`), `apple-music`/
  `apple-musics` (`:204-211`), `search.itunes.apple.com` (`:212-219`), `setup.icloud.com`
  (`:220-234`).
- `com.apple.android.music.player2.FullScreenVideoActivity` — `:146-152` (`singleTask`,
  `supportsPictureInPicture`, tema imersivo).
- `com.apple.android.music.mli.MLIChromeTabActivity` — `:345-358` (WebView/MLI; único
  `screenOrientation="portrait"` do manifest, removido pelo patch atual).
- `com.apple.android.music.commerce.activities.ChromeTabsActivity` — `:293-307` (`musics`/`buy.itunes.apple.com`).
- `SonosAuthActivity` — `:263-277`; `SdkAuthActivity` — `:278-292`.
- `StaticHtmlActivity` — `:138-142`; `ConsumptionOnlyActivity` — `:308-313`.
- `androidx.compose.ui.tooling.PreviewActivity` — `:746-748` (exported=true, resquício de tooling).
- `activity-alias com.apple.android.music.deeplink` → `MainActivity` — `:235-239`.

Não há `PlayerActivity` separada: `com.apple.android.music.common.activity.PlayerActivity` é
classe-base (`PlayerActivity.java:92`) e não está no manifest; o “Now Playing” é bottom sheet
dentro do `MainActivity` (`layout/fragment_music_content.xml:43-53`).

Serviços/receivers importantes:

- `MediaPlaybackService` — `:368-377`, com `MediaBrowserService` + `MediaSessionService` +
  `MEDIA_BUTTON` (o serviço que sustenta playback/controle remoto).
- `DownloadService` — `:378-381`; `MediaTransferService` — `:382-384`; `ICloudApiService` —
  `:385`; `PushNotificationsService` — `:386-393`.
- Widgets/receivers — `:397-487`; providers — `:490-506`.
- **CarAppService: ausente**. Só `androidx.car.app.connection.provider` (`:63-65`),
  `CarAppPermissionActivity` (`:588`), `CarAppNotificationBroadcastReceiver` (`:591`). A lib
  `androidx.car.app` está no APK (`car-app-api.level` = 7), mas não há serviço de Car App.

`<uses-feature>` e filtragem:

- Único `<uses-feature>` declarado: `android.hardware.camera` com `required=false`
  (`AndroidManifest.xml:77-79`).
- `aapt2 dump badging` (`analysis/_evidence/aapt2_badging_base.txt:96-107`) lista como
  implícitos/requeridos: `android.hardware.bluetooth` (`:98-99`), `android.hardware.faketouch`
  (`:100-101`), `android.hardware.location` (`:102-103`), `android.hardware.screen.portrait`
  (`:104-105`), `android.hardware.wifi` (`:106-107`). **Não lista
  `android.hardware.touchscreen`** — o default do aapt2 aqui é `faketouch`, não `touchscreen`.
- `android:resizeableActivity="true"` (`:103`), `android.max_aspect=2.4` (`:111-112`).
- O `screen.portrait` implícito vem só de `MLIChromeTabActivity` (`:349`); o patch atual remove
  esse atributo (`DilinkManifestPatch.kt:32-38`), então a implicação deve desaparecer na
  re-derivação do manifest.

O que a Play filtraria em TV (política, não código): sem uma activity com
`android.intent.category.LEANBACK_LAUNCHER`, o app não é oferecido no catálogo de TV e não aparece
no launcher de TV; sem `<uses-feature android:name="android.software.leanback"
android:required="false"/>`, o aparelho TV tende a ser excluído; `faketouch` implícito e
`android.hardware.location`/`wifi`/`bluetooth` podem excluir TVs que não reportem essas features.
O item exato que a Play usa por device é **UNVERIFIED** sem Play Console/device; a lista acima é a
do manifest empacotado.

### 8. O que o `DilinkManifestPatch.kt` faz e se a API Morphe permite TV

Hoje (`patches/.../DilinkManifestPatch.kt:28-39`):

```
document(MANIFEST).use { manifest ->
    val usesSdk = manifest.getElementsByTagName("uses-sdk").item(0) as Element
    usesSdk.setAttribute("android:minSdkVersion", "29")
    val activities = manifest.getElementsByTagName("activity")
    for (index in 0 until activities.length) { ... removeAttribute("android:screenOrientation") }
}
```

- `document(MANIFEST)` vem de `ResourcePatchContext` e devolve
  `app.morphe.patcher.util.Document`, que **implementa `org.w3c.dom.Document`**
  (verificado por `javap` no `morphe-patcher-2.1.0.jar`: `getDocumentElement`, `createElement`,
  `createAttribute`, `getElementsByTagName`, `appendChild`, `insertBefore`, `setAttribute` etc.).
- `Document.close()` **serializa de volta** o XML com `XmlWriter.writeDocument` (verificado por
  `javap -c`: `close()` → `utf8Writer(file)` → `XmlWriter.writeDocument(this)`). Por isso o
  `use {}` do patch existente persiste as mudanças.
- Portanto, a mesma API permite, sem trocar de mecanismo:
  - achar `MainActivity` na lista de `<activity>` e `setAttribute("android:banner",
    "@mipmap/ic_launcher")`;
  - criar um `<intent-filter>` com `createElement("intent-filter")`, dois `createElement("action")`
    / `("category")` com `setAttribute("android:name", "android.intent.action.MAIN")` e
    `"android.intent.category.LEANBACK_LAUNCHER"`, e `activity.appendChild(filter)`;
  - criar `<uses-feature android:name="android.software.leanback" android:required="false"/>` e
    `<uses-feature android:name="android.hardware.touchscreen" android:required="false"/>` e
    inserir antes de `<application>` (`getDocumentElement().insertBefore(feature, application)`).
- O padrão `setAttribute("android:...")` já é usado no patch (`:30`), então a serialização de
  atributos com prefixo `android` já está validada na prática. O risco residual é o `XmlWriter`
  do Morphe com elementos novos (namespace/ordem), que só um build de teste confirma; não há
  bloqueio de API.
- `android:banner` precisa de um drawable; `@mipmap/ic_launcher` existe
  (`res/mipmap-anydpi-v26/ic_launcher.xml` e PNGs por densidade), mas **não há banner 320×180**.
  Para sideload o launcher de TV usa ícone/banner; para a Play, banner 320×180 é requisito de
  listagem.

---

## Lacunas para TV

1. **Entrada no launcher/TV**: falta `LEANBACK_LAUNCHER` na `MainActivity`; sem isso o app não
   aparece no launcher de TV. Custo: baixo (DOM patch).
2. **Declaração de features**: faltam `android.software.leanback` (required=false) e
   `android.hardware.touchscreen` (required=false); o manifest atual só declara câmera. Custo:
   baixo.
3. **D-pad nas telas Epoxy** (Listen Now e Search): itens de lista com foco heterogêneo, sem
   `focusRequester`/`focusGroup`, sem mapa `nextFocus` e sem tratamento de tecla no app. Custo:
   alto.
4. **Foco inicial/visual e overscan**: não há `focusedByDefault`/`defaultFocus`; não há recursos
   `-television`; a UI é edge-to-edge (`fitsSystemWindows=false` em
   `layout-w600dp/activity_main.xml:5`) e a TV aplica overscan. Custo: médio.
5. **Login**: é WebView; não há tela nativa viva para e-mail/senha. Custo: alto.
6. **Distribuição**: sem os itens 1–2 a Play não lista em TV; com sideload, o item 1 ainda é
   necessário para o launcher. Custo: baixo/médio.

---

## D-pad / entrada (detalhado)

### O que o app faz

- `MainActivity` não intercepta teclas; o único `onKeyUp` do app está em `MainContentActivity`
  (não declarada), para BACK/volume (`MainContentActivity.java:936-958`). Um controle remoto de TV
  manda `DPAD_UP/DOWN/LEFT/RIGHT/CENTER`, `BACK`, `MEDIA_PLAY_PAUSE`; para o app, D-pad não tem
  tratamento nenhum e BACK/volume ficam no comportamento padrão do Android, não nessa classe.
- O `MediaPlaybackService` cobre play/pause via `MediaSession` (`AndroidManifest.xml:368-377`,
  `J4/B2.java:1287-1291`), então teclas de mídia têm chance real de funcionar.
- O Compose cobre DPAD_CENTER/ENTER nos `clickable` e setas nos scrollables
  (`dex_strings.txt:101669-101670,101734-101735`). Isso vale para New, Radio, Library, Album,
  Artist, Settings, diálogos e para os tabs de tablet (`top_nav_tabs` Compose).

### O que falta

- Foco inicial: nada com `focusedByDefault=true`/`defaultFocus`; a primeira tecla pode não ter
  alvo previsível. Em Compose, sem `FocusRequester`/`focusGroup` o primeiro foco é o primeiro
  focusable da composição, que pode ser um item fora da tela.
- Epoxy/RecyclerView: `small_list_d_item` e a raiz de `header_page_e` não são focáveis
  (`small_list_d_item.xml:2-8`, `header_page_e.xml:2-7`); itens como `large_list_a_item.xml:5` e
  `small_list_c_item.xml:6` são. O resultado é navegação parcial: algumas fileiras entram no foco,
  outras não; não há `nextFocus` para carrossel.
- Carrossel horizontal: não há `onKeyDown`/scroll-to-focused no `RecyclerView`; com foco no item,
  a seta direita pode sair da fileira em vez de rolar o carrossel. `CarouselConfiguringLayoutManager`
  é só padding (`:34-36`) e `ScrollInterceptingEpoxyRecyclerView` só olha toque (`:35-56`).
- Player: controles são `ImageButton`/`SeekBar`; alguns `setFocusable(true)` explícitos
  (`PlayerSeekBar.java:75`, `MinimalSeekBar.java:40`, `SwipingAddDownloadStateButton.java:956`),
  mas não há lógica de foco/tecla no `PlayerMainFragment` (varredura: 0 `setFocusable`/
  `requestFocus`/`onKey`).

### Login e entrada de texto

Cadeia real do login interativo (7.0.0):

1. `StoreBaseActivityKt.showLoginDialog` (`commerce/activities/p.java:13`) chama
   `X6/e.a(...)`.
2. `X6/e.java:109-120` monta `p475xb.a` com `kind = Authentication` e chama
   `m.i().e().f(aVar, bundle, ...)`.
3. `p138g7/b.java:164-196` trata `Authentication` e publica `p138g7.a` via
   `W.a(new P(...))` (DialogEventDispatcher).
4. `commerce/activities/q.java:157-158` recebe `P` e chama
   `DialogConnectorViewModel.showAuthenticationDialog`.
5. `Rb/C1956b4.java:146,167` renderiza `AuthenticationDialogAmsKt.AuthenticationDialogAms(...)`.
6. `AuthenticationDialogAmsKt.java:166-168` obtém `PageViewState` e chama
   `amsApi.getPageViewWrapper$app_fuseRelease()`.
7. `AmsApiImpl.java:465-467` → `UIAuthCoordinator.performUIAuth` (`:143-145`).
8. `PageViewContents.java:144` define `DisplayPage` com `WebContainerRoot`; `:895-900` guarda um
   `UIKitView`. `UIKitWebView$Companion$invoke$webViewCompletable$1.java:150` cria
   `UIKitAndroidWebView`, que tem um `WebView` (`UIKitAndroidWebView.java:58,64`) com JavaScript e
   DOM storage ligados (`:195-196`).

Consequências:

- **Não há `LoginActivity`/`SignInFragment` vivo**. O layout `fragment_signin.xml:87-118` tem
  `CustomEditText` de e-mail (`signin_id`, `inputType=textEmailAddress`) e senha
  (`signin_password`), botões nativos e checkbox; mas nenhuma classe do app referencia
  `R.layout.fragment_signin` (id `0x7f0d0260`). A varredura de constantes no DEX encontra esse id
  **somente** em `DataBinderMapperImpl$b.<clinit>` e `DataBinderMapperImpl.<clinit>`
  (`DataBinderMapperImpl.java:1206`); não há `SignInFragment` em `defined_classes.txt`. Ou seja, a
  UI nativa de login é código morto em 7.0.0.
- `AmsApi.AuthType` só tem `Silent`, `SilentPreferred`, `Interactive` (`AmsApi.java:22-25`); não há
  `DeviceCode`/QR. As únicas strings de QR são SharePlay/colaboração
  (`values/strings.xml:834,2506`) e “another device” é eviction de playback
  (`values/strings.xml:1414`), não login.
- Um D-pad + IME de TV **pode** digitar nos campos do WebView se o campo receber foco, mas a
  navegação D-pad dentro do formulário Apple ID e o foco do `WebView` dentro do bottom sheet
  Compose **não estão configurados nem provados**. **UNVERIFIED** sem device.
- O fluxo inclui páginas `SendSMS`/`VerifySMS` (`PageViewContents.java:144`), ou seja, 2FA por
  SMS também é WebView; isso aumenta a dependência de teclado/IME.

---

## Layout

- O app **já foi validado** em 1920×1080/240 dpi (1280×720 dp), que cai em `sw600dp`/`w600dp`.
- Em TV 1080p/320 dpi (960×540 dp), o tablet vem de `w600dp` (não de `sw600dp`); o layout
  `layout-w600dp/activity_main.xml` (drawer) e `values-w600dp/bools.xml` (`is_tablet=true`) são
  usados. O `m1.x()` nativo diria `PHONE` (sw=540 < 600) e travaria retrato; o patch atual força
  `TABLET` (`AppleMusicDiLinkPatch.kt:608-614`), o que mantém rotação livre e layout tablet.
- O ponto frágil é a **densidade real da TV**: se a TV reportar 240 dpi (1280×720 dp), o
  comportamento é o do DiLink; se reportar 320 dpi (960×540 dp), `sw600dp` deixa de casar e só
  `w600dp` segura o layout. Qualquer regra nova deve usar `w600dp`, não `sw600dp`.
- Não há `-television`; margens de overscan e tamanhos de fonte para 10-foot UI não existem. O
  `android.max_aspect=2.4` (`AndroidManifest.xml:111-112`) cobre 16:9.
- O shell de tablet usa `DrawerLayout` + `NavigationView` (`layout-w600dp/activity_main.xml:2,70-98`)
  e tabs no topo em Compose (`:49-56`); isso é mais próximo de TV do que o bottom nav do telefone.

---

## Manifest / instalação

- Instalação sideload: o manifest já tem `minSdk` rebaixado pelo patch para 29; nada em TV
  (API 29+) impede instalar. `resizeableActivity=true` e `max_aspect=2.4` ajudam.
- Launcher de TV: **sem `LEANBACK_LAUNCHER` não aparece**. Adicionar o filtro à `MainActivity`
  (que já é `exported=true`) é o mínimo.
- Play TV: além do filtro, declarar `android.software.leanback required=false` e
  `android.hardware.touchscreen required=false`; a ausência do primeiro e o `faketouch` implícito
  são os candidatos a filtro. O conjunto exato que a Play usa por device é **UNVERIFIED**.
- `MediaBrowserService`/`MediaSessionService` já estão declarados (`:368-377`); não é preciso
  serviço novo para playback/controle remoto.
- `CarAppService` não existe; não há UI de Android Auto pronta para reaproveitar.
- `android:sharedUserId="com.apple.android"` (`AndroidManifest.xml:3`): se o Apple TV Android TV
  (`com.apple.atve.androidtv.appletv`) usar o mesmo sharedUserId e estiver instalado com outra
  assinatura, o install do Apple Music re-assinado pode falhar com
  `INSTALL_FAILED_SHARED_USER_INCOMPATIBLE`. **UNVERIFIED** para o pacote Apple TV; é um risco de
  instalação em TV, não de código.

---

## Riscos

1. **Login (alto)**: WebView + 2FA SMS; sem UI nativa viva; D-pad/IME não configurados. Se o
   login falhar, o resto da viabilidade de TV é irrelevante.
2. **D-pad em Epoxy (alto)**: Listen Now e Search não têm foco consistente; carrosséis não rolam
   com seta sem trabalho específico.
3. **Foco/overscan (médio)**: sem `focusedByDefault`, sem `focusGroup`, sem `-television`; a
   primeira tecla e a borda da tela podem ficar ruins.
4. **Manifest/Play (baixo/médio)**: correção barata, mas sem ela não há entrada no launcher nem
   catálogo.
5. **Back (UNVERIFIED)**: `MainActivity` não tem tratamento próprio de BACK; o Navigation
   Component deve cuidar do básico, mas bottom sheet/player/drawer podem não fechar como se
   espera no controle remoto.
6. **Performance (baixo)**: Epoxy + `BlurView` (eightbitlab) em 1080p de TV; não é bloqueador, mas
   pode pesar em TV box.

---

## Itens UNVERIFIED

- **Versão exata do Compose**: não há string de versão nem `ComposeVersion` no DEX; só é possível
  dizer “Compose recente” pelas APIs (`ContentInViewNode`/`ContentInViewScrollSpec`, `Modifier.Node`,
  metadata Kotlin 2.0/2.1). Falta: rodar `jadx` com mapping original ou inspecionar o POM de build.
- **Densidade real da TV alvo**: 320 dpi é premissa; se for 240, `sw600dp` também casa. Falta:
  `adb shell wm density`/`getprop ro.sf.lcd_density` na TV.
- **Comportamento do D-pad dentro do WebView de login**: não há código de foco/tecla; depende do
  Chromium/WebView e do IME da TV. Falta: teste em device com o diálogo de login aberto.
- **Se o login WebView oferece alguma alternativa (QR/device code)**: não há string no APK; a
  página é remota. Falta: capturar a URL/página do `PageViewState` em device.
- **Filtragem exata da Play para TV**: o manifest empacotado lista `faketouch`/`location`/`wifi`/
  `bluetooth`, mas o conjunto que a Play usa por device não é verificável sem Console.
- **Foco real dos itens Epoxy**: o XML é misto; se `setOnClickListener` torna o item focável
  depende do `View`/Epoxy em runtime. Falta: teste em device ou leitura do modelo Epoxy concreto
  de Listen Now/Search.
- **`sharedUserId` do Apple TV**: não foi verificado o manifest do pacote
  `com.apple.atve.androidtv.appletv`.
- **Se `MainContentActivity` é código morto**: não está no manifest; pode ser usada por algum
  flavor/rota não empacotada. Falta: confirmar no APK instalado.
- **Mapping de qual variante de Album (Compose vs Epoxy) é usada em runtime**:
  `nav_graph.xml:47-57` tem as duas; a escolha depende de flag. Falta: teste/flag.

---

## Arquivos-fonte das evidências

Materiais lidos/consultados:

- `analysis/jadx_src/sources/` — fonte Java decompilado (classes do app e bibliotecas).
- `analysis/jadx_res/resources/AndroidManifest.xml` — manifest decodificado (texto).
- `analysis/jadx_res/resources/res/` — layouts, values, navigation, META-INF.
- `analysis/_evidence/dex_strings.txt` — pool de strings dos 4 DEX.
- `analysis/_evidence/defined_classes.txt` — classes definidas (41.756).
- `analysis/_evidence/aapt2_badging_base.txt` — badging aapt2.
- `analysis/_evidence/manifest_decoded_summary.txt` — resumo do manifest.
- `analysis/dex/classes*.dex` — DEX usados nas varreduras de constantes (androguard 4.1.3).
- `patches/src/main/kotlin/app/morphe/patches/applemusic/dilink/DilinkManifestPatch.kt`.
- `patches/src/main/kotlin/app/morphe/patches/applemusic/dilink/AppleMusicDiLinkPatch.kt`.
- `analysis/apple-music-7.0.0.md`, `analysis/api29-reachability.md`, `analysis/api-levels.md`,
  `analysis/reversing-apple-music-login.md` (contexto; não repetidos aqui).
- `morphe-patcher-2.1.0.jar` — API `Document`/`ResourcePatchContext` verificada com `javap`.

Métodos de verificação usados (reprodutíveis):

- `Select-String`/`grep` no fonte por `leanback`, `television`, `hasSystemFeature`,
  `onKeyDown|onKeyUp|dispatchKeyEvent|onKeyPreIme|setOnKeyListener|KEYCODE_`,
  `android:focusable|focusableInTouchMode|nextFocus|descendantFocusability`,
  `GestureDetector|onTouchEvent|ViewPager2|setUserInputEnabled`, `uiMode|UI_MODE_TYPE`.
- Varredura de `com/apple` por `FocusRequester|focusGroup|focusProperties|onKeyEvent|
  LocalFocusManager` (0 resultados).
- `aapt2 dump badging` (arquivo já gerado) para features implícitas.
- `javap` no `morphe-patcher-2.1.0.jar` para `ResourcePatchContext.document(String)` e
  `app.morphe.patcher.util.Document` (implementa `org.w3c.dom.Document`; `close()` grava com
  `XmlWriter.writeDocument`).
- androguard 4.1.3 para procurar o id `0x7f0d0260` (`fragment_signin`) nas instruções `const`
  dos 4 DEX: só `DataBinderMapperImpl` e `DataBinderMapperImpl$b`.
- Leitura direta de `layout-w600dp/*` e `values-w600dp/*` para a conta de `w600dp` vs `sw600dp`.

Observação de limitação: o `jadx` foi gerado no Windows, onde paths são case-insensitive; pacotes
que diferem só por caixa (ex.: `c8`/`C8`) podem ter sido mesclados no output. Nenhuma conclusão
deste relatório depende de uma classe desse tipo; as classes do app usadas aqui estão em pacotes
de caixa única.
