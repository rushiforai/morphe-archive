# Plano D-pad — Listen Now e Buscar (Apple Music 7.0.0)

Plano cirúrgico para o controle remoto padrão (D-pad) funcionar de ponta a ponta começando por
**Listen Now** (Epoxy) e **Buscar**. Complementa `analysis/android-tv-viability.md`. Fonte
decompilado em `analysis/jadx_src/sources/`, recursos em `analysis/jadx_res/resources/res/`.
Nada foi alterado; este arquivo é o único artefato.

Regra de leitura: `arquivo:linha` sempre relativo à raiz do repo (o worktree não tem esses artefatos).

---

## 1. Mapa do Listen Now

Cadeia de montagem: `ListenNowFragment.onCreateView` infla `fragment_listen_now`
(`ListenNowFragment.java:1037`), pega `listen_now_recycler` (`:1042`) e instala o controller
`ListenNowEpoxyController` (`:1063`). O RecyclerView externo é
`ScrollInterceptingEpoxyRecyclerView` com `android:layout_height="match_parent"` e
`android:orientation="vertical"` (`fragment_listen_now.xml:15-20`) — a orientação real vem de
`EpoxyRecyclerView.B0()` (altura `match_parent` ⇒ `LinearLayoutManager(1)`, vertical:
`EpoxyRecyclerView.java:108-125`).

`ListenNowEpoxyController.buildModels2` (`ListenNowEpoxyController.java:5860`) monta, nesta ordem:

| # | Modelo Epoxy | Layout | Geometria |
|---|---|---|---|
| 1 | `C3642j0` (`:5867`) | `inapp_banner` (`C3642j0.java:106`) | vertical, 1 célula |
| 2 | `C4226x0` (`:5877`) | `listen_now_page_header_c2_profile` (`C4226x0.java:162`) | vertical (título "Listen Now" + avatar) |
| 3 | `G0` por Recommendation (`:3210` via `addSectionHeader`) | `new_row_linked_header_concert` (`G0.java:153`) | vertical (título da linha + "See All") |
| 4 | carrossel `W` p/ `MUSIC_COVER_SHELF` (`:6034`) | filhos `w1` → `swiping_grid_a_standard` (`w1.java:250`) | **HORIZONTAL** |
| 5 | carrossel `C3772n` p/ `MUSIC_CIRCLE_COVER_SHELF` (`:3373`) | filhos `v1` → `swiping_grid_a_catalog_only` (`v1.java:333`), span = `grid_c_column_count` (`:3375`) | **HORIZONTAL** (grid) |
| 6 | carrossel `F` p/ `MUSIC_NOTES_HERO_SHELF`/power swoosh (`:3694-3721`) | filhos `M0`/`N0` → `power_swoosh_container_a` (`M0.java:295`) / `power_swoosh_container_b` (`N0.java:311`) | **HORIZONTAL** |
| 7 | `r1` (super hero, direto, sem carrossel: `Z extends r1`, `:5012`+`:1763`) | `super_hero_container_a` (`r1.java:206`) | vertical, 1 card grande |
| 8 | carrossel `M` p/ `MUSIC_SOCIAL_CARD_SHELF` (`:4748`) | filhos `B1` → `swiping_grid_l_friend` (`B1.java:185`) | **HORIZONTAL** |
| 9 | `K1` p/ `MUSIC_UPSELL_SHELF` (friends upsell, `:3553`) | `view_listen_now_set_up_social_profile_block` (`K1.java:160`) | vertical |
| 10 | carrossel `W` com filhos `y1` p/ `CONCERTS_FOR_YOU` (`:4847`) | `swiping_grid_b_standard` (`y1.java:251`) | **HORIZONTAL** |

Ramos: `buildStandardSwoosh` tem duas sobrecargas — a de `:6025` (carrossel `W`) e a de `:4805`,
que só liga o coletor de concertos `y1` quando `Attributes.kind == CONCERTS_FOR_YOU` e há
localização (`:4809`, `:4818`) e, para os demais, delega ao coletor de `w1` (`:4810` +
`C3795k.java:31` → `buildStandardSwoosh$lambda$44` → `w1`, `:4890-4962`).
`ListenNowRoomEpoxyController` (variante Room/tablet) usa `C3636h0` →
`header_section_a_listen_now` (`C3636h0.java:114`); `ListenNowUnsubscribedEpoxyController` usa
`C4226x0` + `H1` → `unsubscribed_upsell` (`H1.java`).

Correção ao briefing: **os cards do Listen Now não têm `?attr/selectableItemBackground`**.
`swiping_grid_a_standard.xml:2-6` e `swiping_grid_b_standard.xml:2-6` não têm `background` nem
`foreground`. O ripple aparece nas linhas de lista genéricas (`large_list_a_item.xml:8`,
`small_list_d_item.xml:8`), não nas linhas do Listen Now.

---

## 2. Como cada linha horizontal é construída

Não é `com.airbnb.epoxy.Carousel` direto: o modelo é `p054c8.a` (`AbsolutePeekCarouselModel`), que
cria a view por código — `k()` instancia `AbsolutePeekCarousel` com `MarginLayoutParams(-1,-2)`
(`p054c8/a.java:262-264`) e `l()` lança (`:269`). `AbsolutePeekCarousel extends p054c8.f extends
com.airbnb.epoxy.Carousel` (`AbsolutePeekCarousel.java:17`; `p054c8/f.java:15`), e
`Carousel extends EpoxyRecyclerView` (`Carousel.java:12`).

LayoutManager: `EpoxyRecyclerView.setLayoutParams` chama `setLayoutManager(B0())` na primeira vez
(`EpoxyRecyclerView.java:331-339`); `B0()` devolve `LinearLayoutManager(0)` (horizontal) quando
`layout_height` **não** é `match_parent`/`0` — exatamente o caso `-2` dos carrosséis — e
`LinearLayoutManager(1)` caso contrário (`EpoxyRecyclerView.java:108-125`). Com
`setCarouselSpanCount(n>1)` vira `GridLayoutManager(n, 0)`, também horizontal
(`AbsolutePeekCarousel.java:31-36`, reaplicado em `:100`). Padding/spacing vêm de `Carousel.b` via
`Carousel.setPadding` (`Carousel.java:223-245`) e `setNumViewsToShowOnScreen`
(`Carousel.java:218`); o snap é `LinearSnapHelper` (`Carousel.java:20-25`).

Consequência: setas dentro de um carrossel só rolam se **houver uma View focada dentro dele** —
`RecyclerView.focusSearch` delega ao LayoutManager (`onFocusSearchFailed`) e rola uma tela quando o
`FocusFinder` não acha o próximo (`RecyclerView.java:2768-2823`). Sem foco em item, nada rola.

---

## 3. Foco real (o que é focável hoje)

| Layout | Focável hoje | Onde o clique é ligado |
|---|---|---|
| `swiping_grid_a_standard` (`w1`) | **nada** (`xml:2-6`: root `ConstraintLayout` sem `focusable`/`clickable`) | root `ConstraintLayout` (`Pe.f71016a0`, `p337q8/Pe.java:23,58`) via `Q.onModelBound` — `ListenNowEpoxyController.java:1319` (+ long click `:1326`) |
| `swiping_grid_b_standard` (`y1`) | **nada** (`xml:2-6`) | root via binder `N` — `:1180` / `:1181` |
| `swiping_grid_a_catalog_only` (`v1`) | **nada** (mesmo padrão) | root via binder `C3771m` — `:2462` |
| `power_swoosh_container_a` (`M0`) | **nada** | root via `C3783y` — `:2993` |
| `power_swoosh_container_b` (`N0`) | **nada** | root via binder `C` — `:509` |
| `super_hero_container_a` (`r1`) | **nada** | root via binder `X` — `:1597` |
| `swiping_grid_l_friend` (`B1`) | só os botões internos (background borderless, `xml:113`) | botões internos via `K` — `:1029-1050` |
| `new_row_linked_header_concert` (`G0`) | **"See All"** — `header_swiping_button_b.xml:7-8` tem `focusable="true"` e `clickable="true"` | `G0` liga `BR.onHeaderClickListener` (`G0.java:33-37`); include em `new_row_linked_header_concert.xml:38-49` |
| `listen_now_page_header_c2_profile` | **nada** | avatar via `C3778t` — `:2680-2681` |

Ou seja: em uma tela de Listen Now a **única** coisa focável é o "See All" de cada linha. `ENTER`
em uma View focada+clicável é tratado pelo próprio `View` (`onKeyUp` → `performClick`), então o
clique já existente passaria a funcionar — o que falta é **a View do card ser focável**.

Falta para o item receber foco e reagir ao ENTER: (a) `android:focusable="true"` **e**
`android:focusableInTouchMode="true"` no root do card (no DiLink há toque, logo o window está em
touch mode, e ali só aceita foco quem é `focusableInTouchMode`); (b) um indicador visual (§4);
(c) foco inicial (§5).

---

## 4. Visual de foco

O tema **desliga** o realce padrão de foco e pinta o "focused highlight" com a cor do fundo:

- `VersionableAppTheme`: `android:defaultFocusHighlightEnabled=false` (`values/styles.xml:6612`) e
  `android:colorFocusedHighlight=@color/background_color` (`:6606`).
- `AppTheme` herda dela (`values/styles.xml:70`); o app usa `AppTheme.Splash`
  (`manifest_xmltree.txt`, `<application android:theme=@0x7f15002e>`; `public.xml` → `AppTheme.Splash`),
  cujo `postSplashScreenTheme` é `@style/TranslucentOverlayStatusBar` (`:243-249`), filho de
  `AppTheme` (`:6581`) — a cadeia chega na `VersionableAppTheme`.
- Ripple: `selectableItemBackground` resolve para o ripple do AppCompat (`:2306`, `:2343`) e
  `colorControlHighlight=@color/secondary_background_color` (`:99`); ripple é estado **pressed**,
  não `focused`.

Logo: hoje o usuário **não veria** onde está o foco — mesmo que algo ficasse focável. Duas saídas
sem criar recurso novo (resourcePatch editar XML existente é suportado; **criar** drawable novo é
UNVERIFIED):
1. `android:defaultFocusHighlightEnabled="true"` no root do card — reativa o realce do framework
   só naquela View (é atributo de `View`, sobrepõe o tema). Cor exata do halo = framework
   (UNVERIFIED no device).
2. `android:foreground="?attr/selectableItemBackground"` — dá feedback no toque/D-pad apenas como
   ripple; não é estado de foco.

Recomendação: (1) primeiro; se o halo não aparecer, um selector `state_focused` exige drawable novo
(avaliar se o resourcePatcher aceita arquivo novo).

---

## 5. Foco inicial

Não existe hoje:

- zero `focusedByDefault="true"` no app (única ocorrência é `false` em `new_playlist_header.xml:30,56`);
- zero `requestFocus()` em `listennow/` ou `search*/` (as 6 ocorrências do app estão em
  `collection/.../V1.java:33`, `NewPlaylistFragment.java:803`, `common/views/AbstractC3571e0.java:72`,
  `common/views/p0.java:98`, `EmojiSearchFragment.java:63`, `settings/.../GiftCardRedeemDialog.java:261`);
- nenhum `onKeyDown`/`dispatchKeyEvent`/`OnKeyListener` de D-pad no app; a única `onKeyUp` é
  `MainContentActivity.java:936-958` (BACK e volume 24/25) — `MainActivity extends
  TopNavigationActivity` (`MainActivity.java:76`), que não sobrescreve tecla, e `MainActivity`
  também não chama `setTheme`.

O `RecyclerView` se declara focável em touch mode no construtor
(`RecyclerView.java:5422 setFocusableInTouchMode(true)`), mas uma lista focada **sem filho focado**
não move foco com D-pad. Portanto o estado inicial é "nada focado" e o primeiro DPAD não faz nada.
O mecanismo exato do framework para conceder foco inicial não está no bundle (**UNVERIFIED**); o
que se verifica no device é `focused="true"` no dump do uiautomator (§7).

Para o primeiro card ganhar foco de forma determinística é preciso **uma** chamada programática
depois que os modelos são montados — não há atributo de XML confiável para isso em item de
RecyclerView (itens são criados/reciclados depois do foco da janela).

---

## 6. Duas opções

### (A) Resource-only — editar layouts

Editar, nos roots dos cards: `android:focusable="true"`, `android:focusableInTouchMode="true"`,
`android:defaultFocusHighlightEnabled="true"` e, onde não houver botão interno,
`android:descendantFocusability="blocksDescendants"`:

- Listen Now: `swiping_grid_a_standard`, `swiping_grid_b_standard`, `swiping_grid_a_catalog_only`,
  `power_swoosh_container_a`, `power_swoosh_container_b`, `super_hero_container_a`,
  `swiping_grid_l_friend` (sem `blocksDescendants`);
- Buscar/listas: `small_list_d_item` (`xml:2-9`, hoje sem foco), `search_landing_row`
  (`xml:5`, já `focusable`, mas o clique é nos tiles filhos).

Não propor `nextFocus*`: as linhas são dinâmicas e o `FocusFinder` já resolve vertical/horizontal.
Esforço: ~7 arquivos XML, zero bytecode. Cobre Listen Now **e** Search de uma vez.
**Buraco:** não resolve o foco inicial — a tela abre sem foco e o primeiro DPAD continua inerte.

### (B) Bytecode — hook de foco inicial

Uma única injeção (padrão dos patches existentes: `Fingerprint` + `addInstructions` +
classe em `extensions/extension/src/main/java/app/morphe/extension/applemusic/`), por exemplo no
construtor de `ScrollInterceptingEpoxyRecyclerView`
(`common/recyclerview/ScrollInterceptingEpoxyRecyclerView.java`, ctor) ou em
`EpoxyRecyclerView.setController`: registrar um `OnChildAttachStateChangeListener` que, quando
nada tem foco, faz `focusSearch`/DFS no primeiro filho e chama `requestFocus()` no primeiro
descendente focável. ~15 linhas de Java na extension.
Custo: um fingerprint novo + rebuild; nenhuma mudança de comportamento existente.
Alternativa mais pesada (não recomendada): `OnKeyListener` global no `MainActivity` — teria que
reescrever navegação que o framework já faz.

### Menor mudança que faz o Listen Now funcionar de verdade

**A + B-mínimo.** A sozinho deixa a tela sem foco inicial (não há como pedir foco inicial por XML
em item de RecyclerView); B sozinho não tem o que focar (os cards não são focáveis). Faço A
primeiro (é o grosso e vale para Buscar também) e uma injeção de ~15 linhas para o foco inicial.
Recomendação explícita: **(A) agora, (B) como o único hook de bytecode necessário** — não aceito
"B puro" (OnKeyListener global) porque duplica navegação que o framework já faz.

O que provavelmente **não** dá para evitar sem mexer no app: foco inicial determinístico;
o "See All" só funciona se o `onHeaderClickListener` do databinding estiver realmente ligado ao
root do include (verificar no device); e a barra inferior/Now Playing (Compose) fica fora do
alcance do D-pad enquanto não receber a mesma atenção (fora de escopo aqui).

---

## 7. Plano de teste no device

Pré: `adb install -r` do APK patchado; app aberto em Listen Now; **sem** tocar na tela antes.

| # | Comando | Esperado |
|---|---|---|
| 1 | `adb shell uiautomator dump /sdcard/w.xml && adb pull /sdcard/w.xml` | inspecionar `focused="true"`: hoje **nenhum**; depois de B, o primeiro card |
| 2 | `adb shell input keyevent 20` (DPAD_DOWN) ×3 | foco desce entre linhas; realce visível (§4) |
| 3 | `adb shell input keyevent 22` (DPAD_RIGHT) ×5 | carrossel rola e o foco anda card a card |
| 4 | `adb shell input keyevent 23` (DPAD_CENTER) | abre álbum/playlist do card focado |
| 5 | `adb shell input keyevent 66` (ENTER) no "See All" | abre a página da linha (se o handler estiver ligado) |
| 6 | `adb shell input keyevent 21` (DPAD_LEFT) no 1º card | não deve sair da tela |
| 7 | `adb shell dumpsys activity top \| findstr mFocused` | view com foco atual |
| 8 | Buscar: abrir aba, `keyevent 20` | sai do campo de texto para os resultados |
| 9 | Toque (DiLink): tap no card e swipe vertical | continua abrindo/rolando (regressão) |

Observar por tela: Listen Now (linhas 1-3 e carrosséis 4-10 do §1), Buscar landing
(`search_landing_row`) e resultados (`small_list_d_item`).

---

## 8. Riscos de regressão no DiLink (touch)

- `focusableInTouchMode="true"` faz o card **manter** o realce depois de um toque no head unit
  (estado "focado" persiste). Cosmético, mas visível.
- `RecyclerView.onRequestChildFocus` rola até o filho focado: um toque pode gerar um pequeno
  "pulo" de scroll. Se incomodar, limitar o atributo ao modo não-touch (impossível por XML).
- `descendantFocusability="blocksDescendants"` **quebra** o foco dos botões internos — nunca usar
  em `swiping_grid_l_friend`, `view_listen_now_set_up_social_profile_block` e
  `listen_now_page_header_c2_profile`.
- `android:foreground` no root desenha **sobre** os filhos; se o halo cobrir texto, trocar por
  `background` (perde o ripple, que hoje nem existe nesses cards).
- A mudança em `small_list_d_item`/`search_landing_row` afeta todas as listas (álbum, biblioteca,
  busca) — desejável, mas amplia a superfície de teste.
- `ScrollInterceptingEpoxyRecyclerView` só trata `MotionEvent`
  (`ScrollInterceptingEpoxyRecyclerView.java:onInterceptTouchEvent`) — o hook de foco não pode
  alterar esse caminho.

---

## 9. UNVERIFIED

1. Mecanismo do framework que dá foco inicial à janela (não está no bundle; AOSP não foi lido aqui).
2. Cor/visibilidade do halo de `defaultFocusHighlightEnabled` no device.
3. Se `resourcePatch` consegue **criar** drawable novo (só edição de arquivo existente foi vista
   em `DilinkManifestPatch.kt` / `DilinkWebAssetsPatch.kt`).
4. Se o "See All" tem clique ligado: o layout não mostra `@{onHeaderClickListener}` e
   `G0.java:33-37` só faz o `setVariable`.
5. Navegação vertical entre carrossel aninhado e RecyclerView externo (só `focusSearch` foi lido).
6. Mapa do Buscar além de `fragment_global_search.xml` / `Y0` / `small_list_d_item`
   (os controllers `SearchResultsEpoxyController`, `SearchHintsEpoxyController` não foram mapeados
   layout a layout).
