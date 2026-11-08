# Roadmap — Apple Music Android Freedom

Documento de planejamento. O produto são **apps próprios** que usam o Apple Music
(7.0.0 patcheado) apenas como backend de conta/DRM/playback.

## O que vive neste repositório

| Pasta | Papel |
|---|---|
| `patches/` | Código dos patches Morphe. **Não é distribuído**; existe só para gerar o engine. |
| `.github/workflows/build.yml` | Pipeline que monta e assina o engine por ABI (arm32 TV / arm64 carro) e os companions, e publica a release `apps-<versão>`. |
| `core/` | Cliente `MediaBrowser`/`MediaController`, modelos, playback, ações da sessão, busca e auto-update — compartilhado. |
| `tv-app/` | UI para Android TV (D-pad). |
| `car-app/` | UI para o head unit BYD DiLink (toque/D-pad). |
| `single-apk/` | APK único por ABI: engine + UI framework-only no mesmo pacote (`AppleMusic-one-<abi>.apk`). |
| `search-spike/` | Spike encerrado: leitura do developer token e chamada à amp-api. |

## Princípios

- **Engine é backend**: nenhuma tela do engine é usada; ele fica oculto do launcher — o patch
  `DiLink: hide engine launcher` remove a categoria `LAUNCHER` da `MainActivity` e o companion
  é a única entrada.
- **Assinatura única**: engine e companions assinados com o mesmo cert (`MORPHE_*`, secrets do repo),
  com `sharedUserId="com.apple.android"` — sem isso o `MediaBrowserService` recusa (`LibraryResult -4`).
- **Release build** para medir/entregar; debug é ~4× mais lento no box.
- **Sem sombra animada**; foco por escala leve (`graphicsLayer`) + cor de estado.
- **Fronteiras de arquivo** para trabalho paralelo: agente TV só `tv-app/`, agente Carro só `car-app/`,
  mudanças no `core/` passam por um único agente at a time.

## Fases

### Fase 0 — engine e patches (concluída)
- [x] Patches DiLink (login/ADI/TLS/web assets) — o engine é só backend.
- [x] Remover os patches `TV:` — a UI de TV passa a ser o `tv-app` (o engine ficou só com os
  patches DiLink: `support`, `manifest`, `TLS trust`, `web assets` e `hide engine launcher`).
- [x] Pipeline de engine no CI (`.github/workflows/build.yml`, não em `engine/`): gera
  `AppleMusic-engine-arm32.apk` (TV) e `-arm64.apk` (carro), assinados via secrets. O bundle
  `.mpp` é interno e não é publicado.
- Aceite: engine instala, loga e toca; companion conecta com UID compartilhado.

### Fase 1 — `core/` (concluída)
- [x] Extrair cliente MediaBrowser, modelos, `PlaybackSnapshot`, `__AUTO_ROOT__`.
- [x] API de `customActions` + `sendCustomAction(actionId)`.
- Aceite: `tv-app` sem regressão; `:core` sem dependência de UI.

### Fase 2 — `tv-app` (TV, D-pad) (concluída)
- [x] Menu de ações da sessão no Now Playing (Favorito, Aleatório, Repetir, Reprodução
  Automática, **Criar Estação**), genérico a partir de `getCustomActions()`.
- [x] "Criar estação" em card (long-press no ENTER): tocar o item e disparar
  `CREATE_STATION`; se a ação não for anunciada para o item, mostrar "indisponível".
- [x] Performance: custo da linha nova medido em release e reduzido (~157 ms → ~143 ms de
  frame pesado; ver [Métricas](#métricas-de-performance-referência)).
- Aceite: create station a partir de faixa/álbum/artista tocando; sem regressão de foco.

### Fase 3 — `car-app` (DiLink, toque/D-pad) (concluída)
- [x] UI de toque: alvos ≥ 48 dp, tipografia grande, no máximo 2 níveis de navegação.
- [x] Telas: Tocando agora (fixa), Início (shelves), Biblioteca, Rádio.
- [x] Botões do volante: as teclas chegam direto à sessão de mídia do engine; o app não
  intercepta chaves.
- [x] "Criar estação" no player e no contexto do item.
- [x] API 29: sem APIs 30+, sem sombra animada, Compose enxuto.
- Aceite: rodar no DiLink (1920x1080, API 29) tocando e navegando com toque. Validado em
  celular/TV em 1080p; instalação no head unit ainda **não verificada** (`car-app/README.md`).

### Fase 4 — Login inicial (concluída)
- [x] Ação "Entrar na conta" no companion: abre `com.apple.android.music/.common.MainActivity`
  por intent explícita (o engine não tem ícone no launcher — patch
  `DiLink: hide engine launcher`), usuário loga e volta. Implementada no `car-app`; no `tv-app`
  a tela de login do engine é aberta por intent (`adb shell am start -n ...`), porque a UI de TV
  não tem esse botão.
- [x] Estados de erro: engine ausente / não logado / serviço indisponível.
- Aceite: instalação limpa num device → login → volta ao companion logado. Fluxo implementado;
  a instalação limpa no head unit continua pendente de validação física.

### Fase 5 — Distribuição
- [x] Workflow de release de APKs (`workflow_dispatch`, release `apps-<version>`): assina o engine
  por ABI e os companions com os secrets `MORPHE_*`; o `.mpp` não é mais publicado.
- [x] Artefatos: `AppleMusic-engine-arm32.apk`, `AppleMusic-engine-arm64.apk`,
  `AppleMusic-TV.apk`, `AppleMusic-Car.apk` + `SHA256SUMS`.
- [x] README de instalação (ordem engine→companion, assinatura única, desinstalar o oficial).
- [ ] Instalação limpa nos dois devices seguindo o README (o run do workflow com
  `ENGINE_SOURCE_URL` já aconteceu; falta a validação física no head unit).
- Aceite: instalação limpa seguindo o README, sem ADB além do install.

### Fase 6 — UI revamp (identidade Apple Music) (concluída)
- [x] Tokens: preto de fundo, cinzas de texto secundário, accent `#FA243C`, cantos 12–16 dp,
  espaçamento generoso, tipografia sem serifa com pesos 600/700 (Inter, OFL — SF Pro não é
  redistribuível).
- [x] Cards com capa dominante, gradiente sutil atrás do player, chip discreto.
- [x] Transições curtas (150–200 ms) e foco só por escala/cor.
- Aceite: lado a lado com o app original, mesma "sensação" sem copiar assets proprietários.

## Entregue fora do roadmap

- **Busca de catálogo** nos dois companions: lê o developer token do engine (mesmo UID),
  chama `amp-api.music.apple.com` e cai para a busca do app original quando o token não existe.
  Ver [README](README.md#busca) e [`analysis/search-feasibility.md`](analysis/search-feasibility.md).
- **Auto-update in-app**: `updates.json` + `SHA256SUMS` nas releases, comparação de `versionCode`,
  download com SHA-256 e instalação por `PackageInstaller` (engine antes do companion).
  Ver [README](README.md#auto-update).

## Distribuição por device

| Device | Engine | Companion |
|---|---|---|
| TV (MiTV, arm32, API 34) | `AppleMusic-engine-arm32.apk` (só patches DiLink) | `AppleMusic-TV.apk` |
| Carro (DiLink, arm64, API 29) | `AppleMusic-engine-arm64.apk` | `AppleMusic-Car.apk` |

## Riscos e limites conhecidos

- **Busca** não existe no `MediaBrowserService` (`SEARCH_SUPPORTED=false` no caminho do Android
  Auto); nos companions ela é feita direto na `amp-api` com o developer token lido do engine e
  depende do login — sem token, só o fallback para a busca do app original.
- **Letra/fila** só pelo que a sessão expõe (metadata/custom actions), não pela UI do engine.
- **Assinatura**: perder o cert `MORPHE_*` quebra o UID compartilhado e obriga reinstalar tudo.
- **Box arm32 de 2 GB**: orçamento de frame apertado; medir sempre em release.
- **Patches**: qualquer mudança no engine precisa ser reaplicada no APK do engine e nos dois devices.
- **Emulador x86**: os engines publicados são arm-only; playback não roda em AVD x86.

## Métricas de performance (referência)

- `tv-app` release, leg isolada final (DOWN ×12, 3 reps): **8 frames pesados** (antes: 11) e
  `heavyP50` **142,8 ms** (antes: 144,0; revamp: 149,6; round 2: 156,7). RIGHT ×16: 0 frames
  pesados e `compP50` 6,6–7,2 ms.
- Sweep completo do round 2: janky **49–56 %**, p50 **40–48 ms**, p99 300–350 ms.
- Medição confiável: janela `AnimationStart→PerformTraversalsStart` via `gfxinfo framestats`,
  não os percentis do `gfxinfo` agregado. Dumps e scripts em `.pipeline/tv-app/perf2/` (local,
  não versionado); narrativa completa em [`tv-app/README.md`](tv-app/README.md#performance).

## Decisão: APK único por device (viável com UI framework-only)

A conclusão anterior ("não viável") valia para a UI em Compose/AndroidX. A decisão nova: **é
viável**, desde que a UI seja **só Java + views do framework**, sem nenhuma biblioteca.

Por quê:

- O **engine foi minerado pelo R8** — por exemplo `kotlin.Unit.INSTANCE` virou o static field `a`.
  Qualquer classe de terceiro (AndroidX, Kotlin, Compose, Coil) colide com a cópia do engine e
  quebra o `FirebaseInitProvider` (`NoSuchFieldError: No field a`) ou a UI nova
  (`ComponentActivity.<init>`). Por isso o APK único continua **sem** Compose/AndroidX: o motivo
  é o R8, não o empacotamento.
- Java puro não referencia classes mineradas: `single-apk/single-ui` compila com
  `javac --release 8` + `d8 --min-api 29` contra `android.jar`, e o dex resultante só tem
  `com.anderson.applemusic.one.*` — convive com o dex do engine como `classesN.dex`.
- A activity injetada no manifest binário vira a `LAUNCHER`; a `common.MainActivity` do engine
  continua no pacote (botão **Conta**). Instalar por cima preserva UID/conta e o cert é o mesmo.

O que o CI faz (1.8.0+): compila a UI, injeta o dex + `REQUEST_INSTALL_PACKAGES` no engine
assinado por ABI, reassina com o p12 e publica `AppleMusic-one-arm32.apk` /
`AppleMusic-one-arm64.apk`; o `updates.json` ganha `one-arm32`/`one-arm64` (`versionCode` da UI) e
o updater embutido (download + SHA-256 + `PackageInstaller`) atualiza o próprio pacote.

Limite atual: paridade de telas/visual com os companions (Biblioteca/Rádio próprias, polimento) e
`one-x86` no CI; x86 só no build local para o emulador.

