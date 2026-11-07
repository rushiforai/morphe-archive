# Roadmap — Apple Music Android Freedom

Documento de planejamento. O produto são **apps próprios** que usam o Apple Music
(7.0.0 patcheado) apenas como backend de conta/DRM/playback.

## O que vive neste repositório

| Pasta | Papel |
|---|---|
| `patches/` | Código dos patches Morphe. **Não é mais distribuído**; existe só para gerar o engine. |
| `engine/` (a criar) | Pipeline interno que monta o APK do engine por ABI (arm32 TV / arm64 carro) e assina com `CN=Morphe`. |
| `core/` | Cliente `MediaBrowser`/`MediaController`, modelos, playback e ações da sessão — compartilhado. |
| `tv-app/` | UI para Android TV (D-pad). |
| `car-app/` (a criar) | UI para o head unit BYD DiLink (toque/D-pad). |

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

### Fase 0 — engine e patches (em andamento)
- [x] Patches DiLink (login/ADI/TLS/web assets) — o engine é só backend.
- [x] Remover os patches `TV:` — a UI de TV passa a ser o `tv-app` (o engine ficou só com os
  patches DiLink: `support`, `manifest`, `TLS trust`, `web assets` e `hide engine launcher`).
- [ ] `engine/`: script/CI que gera `AppleMusic-engine-arm32.apk` (TV) e `-arm64.apk` (carro),
  assinados via secrets. Bundle `.mpp` descontinuado.
- Aceite: engine instala, loga e toca; companion conecta com UID compartilhado.

### Fase 1 — `core/`
- [ ] Extrair cliente MediaBrowser, modelos, `PlaybackSnapshot`, `__AUTO_ROOT__`.
- [ ] API de `customActions` + `sendCustomAction(actionId)`.
- Aceite: `tv-app` sem regressão; `:core` sem dependência de UI.

### Fase 2 — `tv-app` (TV, D-pad)
- [ ] Menu de ações da sessão no Now Playing (Favorito, Aleatório, Repetir, Reprodução
  Automática, **Criar Estação**), genérico a partir de `getCustomActions()`.
- [ ] "Criar estação" em card (long-press no ENTER): tocar o item e disparar
  `CREATE_STATION`; se a ação não for anunciada para o item, mostrar "indisponível".
- [ ] Performance: p99 da linha nova (hoje ~157 ms) e cold start da cache window.
- Aceite: create station a partir de faixa/álbum/artista tocando; sem regressão de foco.

### Fase 3 — `car-app` (DiLink, toque/D-pad)
- [ ] UI de toque: alvos ≥ 48 dp, tipografia grande, no máximo 2 níveis de navegação.
- [ ] Telas: Tocando agora (fixa), Início (shelves), Biblioteca, Rádio.
- [ ] Botões do volante via `MediaController`; "Criar estação" no player e no contexto do item.
- [ ] API 29: sem APIs 30+, sem sombra animada, Compose enxuto.
- Aceite: rodar no DiLink (1920x1080, API 29) tocando e navegando com toque.

### Fase 4 — Login inicial
- [ ] Ação "Entrar na conta" no companion: abre `com.apple.android.music/.common.MainActivity`
  por intent explícita (o engine não tem ícone no launcher — patch
  `DiLink: hide engine launcher`), usuário loga e volta.
- [ ] Estados de erro: engine ausente / não logado / serviço indisponível.
- Aceite: instalação limpa num device → login → volta ao companion logado.

### Fase 5 — Distribuição
- [x] Workflow de release de APKs (`workflow_dispatch`, release `apps-<version>`): assina o engine
  por ABI e os companions com os secrets `MORPHE_*`; o `.mpp` não é mais publicado.
- [x] Artefatos: `AppleMusic-engine-arm32.apk`, `AppleMusic-engine-arm64.apk`,
  `AppleMusic-TV.apk`, `AppleMusic-Car.apk` + `SHA256SUMS`.
- [x] README de instalação (ordem engine→companion, assinatura única, desinstalar o oficial).
- [ ] Primeiro run real do workflow com `ENGINE_SOURCE_URL` e instalação limpa nos dois devices.
- Aceite: instalação limpa seguindo o README, sem ADB além do install.

### Fase 6 — UI revamp (identidade Apple Music)
- [ ] Tokens: preto de fundo, cinzas de texto secundário, accent `#FA243C`, cantos 12–16 dp,
  espaçamento generoso, tipografia sem serifa com pesos 600/700 (usar fonte aberta tipo Inter —
  SF Pro não é redistribuível).
- [ ] Cards com capa dominante, gradiente sutil atrás do player, chip discreto.
- [ ] Transições curtas (150–200 ms) e foco só por escala/cor.
- Aceite: lado a lado com o app original, mesma "sensação" sem copiar assets proprietários.

## Distribuição por device

| Device | Engine | Companion |
|---|---|---|
| TV (MiTV, arm32, API 34) | `AppleMusic-engine-arm32.apk` (só patches DiLink) | `AppleMusic-TV.apk` |
| Carro (DiLink, arm64, API 29) | `AppleMusic-engine-arm64.apk` | `AppleMusic-Car.apk` |

## Riscos e limites conhecidos

- **Busca** não existe no `MediaBrowserService` (`SEARCH_SUPPORTED=false` no caminho do Android Auto);
  exigiria falar direto com a API da Apple ou refletir nas internas via UID compartilhado.
- **Letra/fila** só pelo que a sessão expõe (metadata/custom actions), não pela UI do engine.
- **Assinatura**: perder o cert `MORPHE_*` quebra o UID compartilhado e obriga reinstalar tudo.
- **Box arm32 de 2 GB**: orçamento de frame apertado; medir sempre em release.
- **Patches**: qualquer mudança no engine precisa ser reaplicada no APK do engine e nos dois devices.

## Métricas de performance (referência)

- `tv-app` release: janky ~50%, p50 40–48 ms; linha nova ~157 ms (era 202 ms).
- Medição confiável: frame pesado por linha nova via `gfxinfo framestats`
  (janela `AnimationStart→PerformTraversalsStart`), não os percentis do `gfxinfo` agregado.
