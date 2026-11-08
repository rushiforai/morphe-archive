# Busca de catálogo nos companions — viabilidade

Os companions (`tv-app`/`car-app`) só navegam o browse tree do `MediaBrowserService`; o engine não
expõe `onSearch` (nenhum `onSearch(` em `analysis/jadx_src/sources`; `MediaPlaybackService` estende
`AbstractServiceC1544y1`, manifest:368-377). Este documento avalia 4 caminhos, com o que foi testado
no device em 07/11/2026 (TV `100.74.105.35` API 34 arm32, carro `100.74.124.38` API 29 arm64).

| # | Caminho | Estado | Entrega |
|---|---|---|---|
| 1 | Intent/deep link para a busca do engine | **funciona** (abre a UI; sem termo) | 30 min |
| 2 | Reflexão nas classes do engine | **inviável** (morre na inicialização) | — |
| 3 | API direta `amp-api` com o token do engine | **implementado nos companions** | 1-2 dias |
| 4 | Filtro local do que já está carregado | trivial, entrega pouco | ~1 h |

## 1. Intent / deep link — funciona, mas sem termo

O engine é reabrível por intent explícita e tem rotas de busca:

- `analysis/jadx_res/resources/AndroidManifest.xml:157-233`: `MainActivity` exportada; filtros
  `MEDIA_PLAY_FROM_SEARCH` (:167), `MEDIA_SEARCH` (:171) e `VIEW` http/https (`music.apple.com`,
  `itun.es`, … :174-203) + schemes `apple-music`/`apple-musics` (:208-209).
- `navigation/deeplink/y.java:85`: rota `/search` → destino `B.SEARCH`.
- `common/MainActivity.java:1146-1148` (cold start) e `:1244-1246` + `onPostResume:1258-1261`
  (já rodando) entregam o `data:` ao pipeline de deep link com `bundle = null` (`C3871e.c`, :1261).

Testado na TV, engine já em execução:

```powershell
adb shell am start -a android.intent.action.VIEW -d 'https://music.apple.com/search' `
  -n com.apple.android.music/com.apple.android.music.common.MainActivity
```

→ abre a tela de busca do engine (evidência: `search-spike/tv-search-deeplink.png`). Custo para o
companion: um `Intent` + `startActivity` (3 linhas). **Limite:** o campo abre vazio.

Termo pré-preenchido: o fragmento lê o argumento de navegação `SEARCH_TERM`
(`search/fragments/viewpager/SearchActivityBaseFragment.java:385-411`), mas o único produtor é o
voice search interno (`Da/a.java:102-103`). Enviar `--es SEARCH_TERM` (+ `medialibrary_pid`, exigido
por `MainActivity.java:1234-1237` para os extras virarem bundle) **não** preencheu o campo — testado
na TV e a tela abriu vazia. Causa provável (não instrumentada): o mesmo URI é enfileirado
(`MainActivity.java:1246`) e reprocessado no `onPostResume` com `bundle=null` (:1261), sobrescrevendo
a navegação com argumentos.

`MEDIA_SEARCH`/`MEDIA_PLAY_FROM_SEARCH` com extra `query` não abre UI: cai no VoiceSearchHelper
(`common/MainActivity.java:651-654` → `common/S.java:52` → `Da.c`) e toca o melhor resultado. Não
testado no device (interromperia a reprodução).

## 2. Reflexão nas classes do engine — inviável

Engine e companion compartilham o UID de verdade (`dumpsys package`: `sharedUser=com.apple.android/10066`
na TV e `/10090` no carro, para os dois pacotes). O spike abriu `PathClassLoader(engine.apk)` e:

- `MediaApiRepositoryHolder`, `MediaApiSearchSessionImpl` e `Search2PageResultsViewModel` carregam e
  executam `<clinit>` OK;
- `com.apple.android.music.mediaapi.network.MediaApiImpl` → `ClassNotFoundException` — o impl HTTP é
  ofuscado (`p455w9.Q`, `analysis/jadx_src/sources/p455w9/Q.java`);
- `MediaApiRepositoryHolder.init(...)` (`MediaApiRepositoryHolder.java:115-121`) só é chamado pelo
  `Application` e injeta `mediaApiSharedPreferences`, `resourceProvider` e `B9.a` (token provider, que
  fala com AMS/storeapi, `B9/h.java:1226-1228` em `Q.java`); a busca ainda passa por corrotinas e pela
  `MediaLibrary` nativa.

Ou seja: para instanciar a cadeia seria preciso reconstruir o grafo de DI do app + AMS + libs nativas
dentro do processo do companion. Custo alto, frágil entre versões e **desnecessário**: o caminho 3
chama o mesmo endpoint que `MediaApiImpl` chama.

## 3. API direta — PoC funciona nos dois devices

Endpoint (montado em `search/Search2PageResultsViewModel.java:868-884`):

```
GET https://amp-api.music.apple.com/v1/catalog/{storefront}/search
      ?term=<query>&types=songs&limit=3&l=en-US
Authorization: Bearer <developer token>      # p455w9/Q.java:1165-1180
Music-User-Token: <user token>               # opcional para catálogo (ver abaixo)
```

Tokens do engine:

- persistidos em `files/datastore/encrypted_tokens.preferences_pb` (`p201ja/C0.java:35`) com as chaves
  `key_api_token_musicAndroid` e `key_music_user_token` (`p262m9/b.java:141,173`);
- cada valor é AES/GCM (`p201ja/T.java:110-121`), com a chave AES-256 no **AndroidKeyStore**, alias
  `music_token_store_key` (`p201ja/T.java:55-63`); o IV fica ao lado (`<chave>__iv`).

PoC (`search-spike/`, mesmo UID + cert Morphe): lê o `.preferences_pb`, abre o alias do KeyStore,
decifra o token e chama o endpoint. Resultado real (TV e carro, HTTP 200):

```
term=daft punk&types=songs&limit=3  →  Get Lucky (Daft Punk/Pharrell/Nile Rodgers)
                                       One More Time (Daft Punk)
                                       Instant Crush (Daft Punk & Julian Casablancas)
```

Logs: `search-spike/logs/tv-api-poc.txt` e `search-spike/car-poc.png` (carro, API 29, UID 10090).
Controle: a mesma chamada **sem** `Music-User-Token` devolveu 200 com o mesmo corpo — busca de catálogo
não precisa do token de usuário (só biblioteca/personalização precisariam).

Custo/riscos para o companion: ~150 linhas (HTTP + JSON) + ~80 linhas de leitura/decifra do token
(reler a cada uso; o developer token é JWT e expira — tratar 401 revivendo do arquivo). Riscos: o
engine pode trocar o alias/arquivo entre versões; mudar o formato do pb exige reescrever o parser;
ToS do serviço.

## 4. Filtro local — fallback pobre

O `core/MediaBrowserClient.kt` já guarda `childrenCache` por nó e assina shelves; filtrar títulos já
carregados é ~50 linhas e zero rede, mas só acha o que está na tela/biblioteca — não é busca de
catálogo. Serve como fallback quando o token não estiver disponível.

## Recomendação

**Caminho 3**: módulo `search` no `core/` (ou em cada app) lendo o token do engine por UID
compartilhado e chamando `/v1/catalog/{sf}/search`, com a UI de resultados no padrão dos companions.
Esforço: 1-2 dias (token+HTTP+parser ~meio dia; tela, foco D-pad, paginação e tratamento de erro o
resto). Fallback de 30 min: botão "Buscar no Apple Music" que dispara o deep link do caminho 1.

## Implementado (07/11/2026) — caminho 3 nos dois companions

`core/SearchClient.kt` + `core/SearchResult.kt` (token → AES/GCM → `HttpURLConnection` →
`org.json`, sem lib nova), tela de busca em `:tv-app` e `:car-app` e o toque em um
resultado. Medições reais (termo `daft punk`, storefront `br`):

- **Token**: lido e decifrado nos devices testados — HTTP 200, 27 543 bytes com
  `types=songs,albums,artists,playlists&limit=8`. O parse do `preferences_pb` continua
  dependente do layout `entry{1:key,2:{5:value}}`; qualquer falha (arquivo, alias, cipher)
  vira `TokenUnavailable` e a tela oferece o deep link.
- **`playFromMediaId` funciona com o id de catálogo puro** (`617154366` → "Get Lucky",
  `696884422` → álbum "Homework" desde a faixa 1, `pl.7465…` → playlist). Caminho no
  engine: `MediaSessionCallbacks.onSetMediaItems` (`player/C3928e0.java:55-89`) pede um
  provider ao `PlaybackMediaIdHandler`; o provider do Android Auto
  (`p032b7/C3124a.java:154`) só reconhece ids `__AUTO_ROOT__/…`, devolve `null`, e o engine
  cai no `StorePlaybackQueueItemProvider(mediaId)` — por isso o id cru basta. Evidência:
  `playFromMediaId <id>` no logcat + metadados mudando no `dumpsys media_session`, na TV
  (API 34) e no S24 (API 36).
- **`MEDIA_SEARCH`** (fallback): a intent chega no engine (`START … act=
  android.intent.action.MEDIA_SEARCH … cmp=com.apple.android.music/.common.MainActivity
  (has extras)`) e abre a busca dele; o play depende do estado da conta — nos testes
  apareceu o diálogo "Mais de um dispositivo está tentando reproduzir músicas" (mesma
  conta ativa em outro device), que bloqueou o play. Resultados de **artista** não têm id
  reproduzível (`mediaIdCandidates()` vazio) e seguem direto por esse caminho.
- UI: TV com `BasicTextField` + IME do sistema e D-pad (o campo consome DOWN/ENTER para
  entregar o foco à lista), carro com teclado por toque; grupos
  Músicas/Álbuns/Artistas/Playlists, capa/título/artista, "Limpar", `back` fecha,
  "Abrir busca do app original" como fallback.
- Capturas: `.pipeline/search-tv-*.png`, `.pipeline/search-phone-*.png`,
  `.pipeline/search-car-results.png`.

## Não verificado
- deep link com o engine **parado** (cold start) — não testei para não interromper a reprodução;
- expiração/renovação do developer token e o 401 correspondente (o código relê o arquivo
  uma vez e devolve erro claro, mas não forcei um token expirado);
- se a Apple exige `Music-User-Token` para buscar na **biblioteca**;
- tocar um resultado **com o engine sem nenhuma faixa carregada**: os testes sempre
  partiram de uma sessão já carregada;
- o **head unit BYD** (`100.74.124.38`) ficou offline no meio da validação;
- o parsing do protobuf depende do layout atual do DataStore (`entry{1:key,2:{5:value}}`).
