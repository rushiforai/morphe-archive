# Débito técnico da UI nova (APK único) vs. Apple Music 7.0.0

**Repo:** `AppleMusic-DiLink` · **branch:** `main` · **HEAD:** `2a1ca0e` · **data:** 2026-11-08
**Devices:** `RXCX100BZ5J` (SM-S921B, API 36, 1080×2340@480) com `AppleMusic-one` **1.9.5 (10905)** sobre o engine **7.0.0 (1614)**; `emulator-5554` (AOSP TV x86, API 34, 1920×1080) com o `one-x86` 1.9.5.
**Método:** leitura de `single-apk/single-ui/src` (38 `.java`; dex com 139 classes), de `analysis/jadx_src` (24.519 `.java`, 32 activities, 1.252 layouts) e execução nos dois devices com `uiautomator dump`, `logcat -s AppleMusicOne`, rotação e screenshots. O original foi confirmado no código: Listen Now (`listennow`), Rádio (`radio2/3`, `RadioEpoxyController`), Biblioteca (`library2/3`), Busca (`search2`, `KEY_RECENT_SEARCH`), Player/Fila (`player`, `NewPlayerQueueViewFragment`), Letras (`PlayerLyricsViewFragment`, `StaticLyricsFragment`, TTML), Download (`DownloadService`, `ManageDownloadedContentActivity`), Conta/Ajustes (`AccountSettingsFragment`, sign out, manage subscription), Criar Estação/Favoritar/Adicionar/Compartilhar (action sheets), Cast (`CastManager`), Dolby Atmos, song credits, EQ e widgets.

## Resumo executivo

A UI 1.9.5 cobre o fluxo principal (Início, Biblioteca, Rádio, Busca, detalhes, player, fila, conta e updater) e roda nos dois devices sem crash observado. Ela ainda está longe do app original nos **controles do player** (aleatório/repetir/favorito existem só no sheet "Ações"), **letras**, **download/offline**, **conta** (somente leitura) e **Ajustes**. Os débitos de engenharia mais caros são a **ausência total de testes**, a **perda de estado na rotação**, as **listas sem recycling** (Home carrega ~225 cards de uma vez), a **acessibilidade quase inexistente** e a **versão do pacote fixa em 7.0.0**. O maior retorno por esforço está em expor as `customActions` que o engine já publica e corrigir rotação/insets/a11y antes de perseguir paridade de features caras.

## Lacunas por área

Legenda: **Imp.** impacto — A=alto, M=médio, B=baixo; **Esf.** esforço — P=pequeno, M=médio, G=grande; **Risco** — A=alto, M=médio, B=baixo.

| Área | Original (7.0.0) | Nós (1.9.5) | Gap | Imp. | Esf. | Risco |
|---|---|---|---|---|---|---|
| Início | Listen Now com mixes, recomendações, recentes, charts e "Ver tudo" paginado | Hero + 20 prateleiras do browse, cards e "Ver tudo"; carrega tudo de uma vez | Sem refresh/paginação; ~225 cards e capas em burst; títulos do engine misturam idioma | M | M | B |
| Biblioteca | Músicas, Álbuns, Artistas, Playlists, Baixados, gêneros, ordenar/editar | 5 seções (recentes, playlists, artistas, álbuns, Aleatória), 20 previews, filtro local | Sem "Músicas", "Baixados", ordenação ou edição; artista sem capa na fonte | A | M | M |
| Rádio | Estações ao vivo 24/7, por gênero, locais/internacionais, agenda e episódios | Grade de 10 estações do nó `/radio` | Só catálogo de estações; sem ao vivo/agenda/gêneros | A | G | A |
| Busca | Landing com recentes, sugestões, escopo catálogo+biblioteca | Query única na amp-api, 8 por tipo, grupos por tipo | Sem recentes, biblioteca, paginação ou sugestões; duplica GET no ENTER | M | M | M |
| Player/Fila | Transporte, seek, fila, aleatório, repetir, favorito, adicionar, compartilhar, letra, download, Atmos, Cast | Transporte, seek, fila, "Criar Estação" e sheet de ações | Sem botões de aleatório/repetir/favorito/letra/share/add/download; ações escondidas | A | P | M |
| Letras | Letra completa, sincronizada/karaokê, tradução e offline | Nada | Nenhuma letra; engine tem UI Compose/TTML não invocável | A | G | A |
| Download/Offline | `DownloadService`, gerenciar baixados, download por item, reprodução offline | Nada | Sem download nem estado offline; não foi observada ação de download no `MediaSession` | A | G | A |
| Conta | Perfil, assinatura, família, notificações, sign out | Perfil + assinatura lidos de `AccountTable.json`/DataStore | Somente leitura; sem sign out, gerenciar assinatura, família ou notificações | M | M | A |
| Config | Ajustes de reprodução, letras, download, EQ, Dolby, notificações | Nenhuma tela de Ajustes | Sem EQ, qualidade, Dolby ou preferências | M | G | B |
| Acessibilidade | App nativo, com árvore de acessibilidade convencional | 4 `contentDescription` na Home; 0 nos controles do player; overlays deixam a tela de baixo na árvore | TalkBack não identifica controles; foco atravessa camadas | A | P | B |
| Performance | RecyclerView/Epoxy, carregamento por viewport, cache de imagem | `ScrollView` + `LinearLayout`; Home eager; fila de dezenas de linhas (até 101 na Aleatória); filtro reconstrói tudo | Sem recycling; memória/jank no DiLink; capas de 24 MB sem cache em disco | A | M | M |
| Engenharia | versionCode real (1614), contratos internos estáveis | 0 testes; pacote 7.0.0 (1614); updater virtual com fallback de ABI; login por reflexão; sem reconexão automática do `MediaBrowser` | Regressões silenciosas; versão/instalação ambíguas; quebra se o engine mudar ou o serviço reiniciar | A | M | A |

## Backlog priorizado

### Onda 1 — maior impacto / menor esforço (7 itens)

1. **Player: aleatório, repetir e favorito de primeira classe.** O engine já publica `com.apple.android.music.playback.action.SHUFFLE`, `.REPEAT` e `.FAVORITE` (logcat). Criar toggles no player e feedback específico (hoje `feedback()` devolve "Ação enviada"). Arquivos: `NowPlayingScreen.java`, `OneActivity.java`, `MediaClient.java`. Aceite: botão aparece só quando a ação existe, envia o ID, tem `contentDescription` e não duplica no sheet; estado ativo documentado como não exposto pelo engine.
2. **Rotação/estado.** `OneActivity` não tem `onSaveInstanceState`; girar reseta para Início, perde filtro/overlay/scroll e recarrega o browse (medido). Salvar `selectedTab`, pilha de overlay, filtro e posições; restaurar em `onCreate` (recarregar o conteúdo do engine é aceitável; voltar para a tela errada não). Arquivos: `OneActivity.java`, `LibraryScreen.java`, `SearchScreen.java`, `NowPlayingScreen.java`, `CollectionScreen.java`, `DetailScreen.java`. Aceite: girar 2× mantém aba, filtro, overlay e posição; se recarregar, continua na mesma tela e não volta para Início.
3. **Insets horizontais.** O listener em `OneActivity.java:212` aplica só top/bottom; em landscape a nav bar cobre "Atualizações" e metade do play do mini player (`debt-05-rotated.png`, `debt-05-crop.png`). Aplicar left/right e cutout. Aceite: nenhum controle sob a nav bar em 2340×1080 landscape; screenshot comparativo.
4. **Acessibilidade mínima.** Só há 4 `contentDescription` na Home e nenhum nos controles do player; overlays mantêm a tela de baixo na árvore (201 nós no dump do player). Rotular botões/cards/linhas, marcar imagens decorativas e pôr `importantForAccessibility=NO_HIDE_DESCENDANTS` nos overlays. Arquivos: `widget/`, `screen/`. Aceite: todo nó clicável tem rótulo; `uiautomator` só expõe a camada ativa; smoke com TalkBack.
5. **Busca: uma requisição por submit.** `onEditorAction` trata ENTER e `IME_ACTION_SEARCH`, e `submit()` pode rodar duas vezes; o logcat mostra dois `GET /br/search?...daft` idênticos com 500 ms. Deduplicar e ignorar resposta antiga. Arquivos: `SearchScreen.java`, `CatalogSearch.java`. Aceite: um GET por submit (logcat) e a última consulta vence.
6. **Updater: ABI estrita.** `candidateKeys()` cai para `one-arm32`/`one-x86` quando a chave da ABI não existe; num arm64 sem 32-bit isso oferece APK errado. Aceitar só a ABI primária. Arquivo: `UpdateManager.java:264`. Aceite: arm64 nunca seleciona `one-arm32`; teste unitário do mapeamento.
7. **Docs de arquitetura.** `HANDOFF.md` ainda descreve apps 1.7.0/bundle e não menciona a single-ui; o README principal ainda diz que "a UI é dos companions". Atualizar ponteiros, versão e matriz de teste. Arquivos: `HANDOFF.md`, `README.md`. Aceite: um leitor encontra single-ui e a versão 1.9.x em dois cliques.

### Onda 2 — médio esforço, impacto estrutural (9 itens)

1. **Listas com recycling.** Trocar `addList`/`addGrid`/filtro/fila por `ListView`+adapter com `convertView` (RecyclerView não é opção: não há AndroidX no classpath da UI); limitar a Home. Arquivos: `CollectionScreen.java:471,521`, `LibraryScreen.java:568`, `NowPlayingScreen.java:411`. Aceite: tela de 281 álbuns com nº de views limitado; rolagem sem jank no emulador; memória estável.
2. **Home sob demanda.** Carregar as 6 primeiras prateleiras e as demais no scroll; adicionar refresh explícito. Arquivo: `HomeScreen.java:166`. Aceite: carga inicial ≤6 prateleiras; nenhum burst de ~225 capas; "atualizar" repovoa sem perder a posição.
3. **Biblioteca mais completa.** Investigar a categoria "Músicas" (hoje `/library/songs` é `playable` com 0 filhos) e/ou a biblioteca da amp-api; adicionar ordenação e busca incremental/paginada. Arquivo: `LibraryScreen.java`. Aceite: categorias com contagem, ordenação A–Z e "Ver tudo" paginado; se "Músicas" não existir na fonte, documentar e manter o atalho Aleatória.
4. **Busca com recentes e escopo.** Guardar termos recentes, separar catálogo/biblioteca, cancelar requisição antiga e paginar. Arquivos: `SearchScreen.java`, `CatalogSearch.java`. Aceite: recentes persistem; busca de biblioteca não faz rede; digitação não dispara N GETs.
5. **Versionamento real do APK.** Injetar `versionCode`/`versionName` da UI no manifest (hoje 1614/7.0.0; o updater compara um código virtual). Arquivos: `single-apk/tools/axml_inject.py`, `.github/workflows/build.yml`, `UpdateManager.java`. Aceite: `aapt2 dump badging` mostra 1.9.x/109xx; `dumpsys package` e updater concordam; instalação por cima preserva a conta.
6. **Fim da duplicação de resolução.** `CollectionScreen`, `LibraryScreen` e `DetailScreen` repetem `resolveArtist/Album/Playlist` e o desenho de faixas; extrair um `CatalogResolver` e um `TrackListView`. Arquivos: os três screens. Aceite: uma única implementação, comportamento e telas iguais (comparação lado a lado).
7. **Testes e CI de runtime.** Testes JVM para parsers (`CatalogSearch`), `UpdateManager.parse/candidateKeys` e normalização da Biblioteca; passo de CI que roda os testes e um smoke de emulador (abrir, Home/Busca/player, `logcat -b crash` vazio). Arquivos: novo diretório de testes, `build.yml`. Aceite: testes verdes no CI e falha se o dex/launcher quebrar.
8. **Conta com ações.** Links para gerenciar assinatura/família e, se seguro, sign out via UI do engine; hoje o painel só lê arquivos e avisa que não sai. Arquivos: `AccountScreen.java`, `OneActivity.java`. Aceite: links abrem a tela oficial; sign out só se o fluxo do engine for confirmado; nenhum arquivo de conta editado à mão.
9. **Lifecycle do `MediaBrowser` e polling.** `connect()` só roda em `onCreate`/retorno do engine; falha ou suspensão do serviço apenas mostra status, e a fila é lida a cada 500 ms. Reconectar com backoff, ouvir `onQueueChanged` e pausar o ticker em `onStop`. Arquivos: `MediaClient.java`, `OneActivity.java`. Aceite: matar/reiniciar o serviço durante o playback reconecta sozinho; a fila atualiza sem o tick de 500 ms; sem polling em background.

### Onda 3 — grande esforço / baixo retorno imediato (4 itens)

1. **Letras estáticas.** Se o endpoint `/v1/catalog/{sf}/songs/{id}/lyrics` responder com o token atual (UNVERIFIED), mostrar letra simples no detalhe/player; sem sincronismo. Arquivos: `CatalogSearch.java`, `DetailScreen.java`, `NowPlayingScreen.java`. Aceite: letra quando existir, `EmptyState` quando não; sem quebrar offline.
2. **Rádio ao vivo completa.** Categorias, agenda e episódios exigem endpoints de rádio da amp-api e tratamento de anúncios/região; o browse só entrega 10 estações. Arquivos: `RadioScreen.java`, `CatalogSearch.java`. Aceite: categorias e "ao vivo" com fallback para a grade atual.
3. **Ajustes/EQ/Dolby.** Expor atalhos para `EQActivity` e preferências do engine (mesmo pacote/UID) em vez de recriar Ajustes. Arquivos: `AccountScreen.java`, `OneActivity.java`. Aceite: abre EQ e Ajustes do engine sem crash em API 34/36; API 29 a validar no carro.
4. **i18n.** Centralizar strings (hoje espalhadas em PT-BR) e seguir o locale do device/engine; na TV o chrome em PT convive com prateleiras em inglês (`debt-15-tv-home.png`). Arquivos: todos os screens/widgets. Aceite: PT/EN sem strings hardcoded; conteúdo do engine mantém o idioma da conta.

## O que provavelmente não vale a pena

| Item | Por quê |
|---|---|
| Letras sincronizadas/karaokê/tradução | Exige TTML + timing + UI própria; a UI de letras do engine não tem intent público e o sincronismo teria de ser reimplementado. Licença/região. Só faria sentido com demanda explícita. |
| Download/offline | `DownloadService` é interno ao engine, ligado a FairPlay/ADI e slots de conta; não foi observada ação de download no `MediaSession`. Alto risco de quebrar a conta e o playback. |
| Cast/AirPlay | No Android é Cast; `CastManager` depende de GMS, ausente no DiLink, e não há alvo/receiver no produto. |
| Dolby Atmos/áudio espacial | Depende de hardware/AVR e de metadados que a sessão padrão não expõe (UNVERIFIED); alcance baixo no head unit. |
| Rádio ao vivo "completa" | O browse entrega 10 estações; agenda/episódios/locais exigem API de rádio e tratamento de anúncios por região. Grande esforço para pouco uso no carro. |
| Social/Connect/SharePlay/widgets | Fora do escopo do APK único; sem superfície de API no browse/sessão e sem demanda. |
| Sign out manipulando `AccountTable.json` | O próprio painel evita; editar arquivos do engine pode deslogar/limpar biblioteca. Se necessário, abrir a UI oficial. |

## UNVERIFIED / limitações desta rodada

- **API 29/DiLink real** não estava conectado. O `OnBackInvokedDispatcher` é guardado por `SDK_INT >= 33`, mas o caminho em API 29 não foi executado.
- **Offline/erro de rede** não foram provocados; os `EmptyState`/retry existem no código, mas o comportamento real de reconexão não foi medido.
- **Updater ponta a ponta** (download + SHA-256 + `PackageInstaller`) não foi exercitado: nenhum release atual tem assets `one-*`; o diálogo só mostra "Sem atualização".
- **Login completo** não foi re-exercitado (credenciais ausentes); a conta já estava logada. A reflexão `S()`/`U()` e o poll de 250 ms continuam frágeis.
- **TalkBack** não foi ligado; a medição é estática (labels/árvore), não a experiência real do leitor de tela.
- **arm32** não foi instalado (sem device arm32); o build x86 é local e não é publicado pelo CI.
- **Estado ativo de aleatório/repetir** não é exposto pelo `MediaSession` (nomes/ícones não mudam após o toggle); só é possível enviar a ação, não pintar o estado.
- **Endpoint de letras da amp-api** não foi testado com o token do engine.

## Evidências

| Arquivo | O que mostra |
|---|---|
| `single-apk/evidence/debt-02-home.png` | Home 1.9.5 no celular (hero + prateleiras + mini player) |
| `single-apk/evidence/debt-04-library-filter.png` | Biblioteca com filtro local e teclado; mini player sobre o último resultado |
| `single-apk/evidence/debt-05-rotated.png` / `debt-05-crop.png` | Após girar: volta para Início, filtro perdido, reload; nav bar cobre "Atualizações" e o play do mini player |
| `single-apk/evidence/debt-07-radio.png` | Rádio = grade de 10 estações (sem ao vivo/agenda) |
| `single-apk/evidence/debt-08-search.png` | Busca de catálogo com 18 resultados agrupados |
| `single-apk/evidence/debt-10-player.png` | Player sem aleatório/repetir/favorito/letra/share/download |
| `single-apk/evidence/debt-11-queue.png` | Fila "A seguir" com 14 faixas e destaque da atual |
| `single-apk/evidence/debt-12-actions.png` | Sheet "Ações" com Favorito/Aleatório/Repetir/Autoplay/Adicionar/Criar Estação |
| `single-apk/evidence/debt-13-account.png` | Conta somente leitura (perfil + assinatura) |
| `single-apk/evidence/debt-14-updates.png` | Instalada 1.9.5 (10905) / engine 7.0.0 (1614); "Sem atualização" |
| `single-apk/evidence/debt-15-tv-home.png` | TV x86 1.9.5: chrome em PT e prateleiras em inglês |

Logcat: Home recebe `children .../home count=20` e 20 prateleiras (5–13 itens) quase todas em ~40 ms (a última, ~0,9 s); `sendCustomAction ...SHUFFLE`, `.REPEAT`, `.FAVORITE` confirmados; dois GETs `/br/search?...daft` idênticos com 500 ms; `updates.json: sem one-* mais novo para arm64-v8a`; `dumpsys package` reporta `versionName=7.0.0 versionCode=1614`.
