# single-apk — o engine e a nossa UI no mesmo APK (spike)

Prova de conceito de **um APK por device**: o APK do Apple Music 7.0.0 patcheado (engine) recebe
o nosso dex + uma activity nossa como `LAUNCHER`, sem companion separado. Se isso vale, a
distribuição vira 1 APK por device e o `sharedUserId`/cert deixam de ser acoplamento entre apps.

- **Fase A (empacotamento): funcionou no TV box** (Xiaomi `MiTV-AFMU0`, `armeabi-v7a`, API 34,
  `100.74.105.35:5555`). O carro (`100.74.124.38`, arm64/API 29) estava **offline** nesta rodada
  (sem ping, ADB timeout): a variante arm64 foi gerada, mas **não instalada**.
- **Fase B (UI real):** a UI Compose atual **não** pode ser mesclada como está — números e parecer
  em [Fase B](#fase-b--a-ui-compose-pode-ser-mesclada).

## Resultado da Fase A

APK gerado: `single-apk/out/AppleMusic-single-apk-arm32.apk` (~96 MB), instalado **por cima** do
engine existente com `adb install -r` (sem desinstalar; `firstInstallTime` 08:18:43 preservado,
`lastUpdateTime` atualizado, assinatura `CN=Morphe` / SHA-256
`1e058623722ed37eb59bb55411d01d6b7b212c6a8353aacecd60d515cee60463`).

Evidência de `adb shell am start -n com.apple.android.music/com.anderson.applemusic.probe.ProbeActivity`
(íntegra em `evidence/spike-single-tv-logcat.txt`):

```
I/SingleApkProbe: onCreate pkg=com.apple.android.music pid=7835
I/SingleApkProbe: MediaBrowser connected, root=ROOT_MEDIA_ITEM
I/SingleApkProbe: subscribe __AUTO_ROOT__
I/SingleApkProbe: children parent=__AUTO_ROOT__ count=3 -> Início [browsable]; Rádio [browsable]; Biblioteca [browsable];
I/SingleApkProbe: playFromMediaId id=__AUTO_ROOT__/library/songs title=Biblioteca (Aleatória)
I/SingleApkProbe: metadata title=Arco-Íris artist=Mundo Bita & Xuxa
I/SingleApkProbe: playbackState=3
```

Screenshot: `evidence/spike-single-tv-02.png` (nossa UI aberta dentro do APK do Apple Music, com os
3 filhos do `__AUTO_ROOT__` e `state=3` tocando). O primeiro screenshot
(`evidence/spike-single-tv-01.png`) é a mesma UI antes do conserto da assinatura de callback.
Controle: `evidence/_control-tv-app.png` mostra o `tv-app` (companion) lendo a mesma árvore no
mesmo aparelho.

`dumpsys media_session` no momento do teste: `ownerPid=7835, ownerUid=10066, active=true`, pacote
`com.apple.android.music`.

## Receita reproduzível

```powershell
# build (TV / arm32)
powershell -NoProfile -ExecutionPolicy Bypass -File single-apk\build-single-apk.ps1

# build + update por cima do engine instalado + logcat + screenshot
powershell -NoProfile -ExecutionPolicy Bypass -File single-apk\build-single-apk.ps1 `
  -Install -LaunchAndCapture -Device 100.74.105.35:5555

# variante do carro (arm64) — artefato pronto, device offline na rodada
powershell -NoProfile -ExecutionPolicy Bypass -File single-apk\build-single-apk.ps1 `
  -Engine .pipeline/car/AppleMusic-engine-arm64.apk -OutDir single-apk/out/car-arm64 `
  -ApkName AppleMusic-single-apk-arm64.apk
```

Passos do script (sem Gradle, sem aapt2 rebuild):

1. `javac --release 8` + `d8 --min-api 29` do probe (`probe/src/.../ProbeActivity.java`) — sem
   recursos, sem `R.*`, sem Compose;
2. extrai `AndroidManifest.xml` do engine e injeta a activity com `tools/axml_inject.py`;
3. `tools/pack_single_apk.py` reescreve o zip: troca o manifest e adiciona `classes9.dex`,
   preservando ordem/compressão de todas as outras entradas (inclusive `resources.arsc` STORED e
   as `.so` STORED);
4. `zipalign -p 4` + `apksigner` (p12 `tools/tv-app-signing.p12`, alias `morphe`, senha `Morphe`);
5. `zipalign -c`, `apksigner verify --print-certs` e `aapt2 dump badging`.

### Por que patchear o AXML em vez de usar apktool/aapt2

O manifest do engine referencia dezenas de recursos do app (`@0x7f15xxxx`, `@0x7f14...`). Recompilar
o manifest exigiria reconstruir recursos; decodificar/rebuildar o APK inteiro com apktool reescreveria
100 MB de recursos e os 8 dex. O `axml_inject.py` só:

- acrescenta 3 strings ao string pool existente (UTF-16, sem styles) **no fim**, para não deslocar
  os índices usados pelo resource map do manifest;
- remove o flag `SORTED` (o pool cresce fora de ordem; o parser volta a busca linear);
- insere os chunks `<activity android:name android:exported><intent-filter><action MAIN><category
  LAUNCHER>` como primeiro filho de `<application>`;
- corrige o tamanho do chunk XML externo. Todo o resto é copiado byte a byte.

Validado com `aapt2 dump badging` (`launchable-activity: ...ProbeActivity`) e `dump xmltree`
(`exported=true`, `action=MAIN`, `category=LAUNCHER`) antes de instalar.

### Detalhes do probe

- Activity Views pura (ListView + TextView), cores/labels programáticos, `FontFamily` do sistema.
- `MediaBrowser` de framework em `com.apple.android.music/com.apple.android.music.player.MediaPlaybackService`,
  assina `__AUTO_ROOT__`, lista os filhos, desce um nível e toca o primeiro item `playable` com
  `playFromMediaId`.
- Manifest: `exported=true`, `MAIN`/`LAUNCHER`, **sem** `sharedUserId` novo — o engine já declara
  `com.apple.android`, e como agora é o mesmo APK o UID é o mesmo por construção.
- Pegadinha encontrada: o Media3 do engine entrega os filhos pelo overload
  `onChildrenLoaded(parentId, children, Bundle)`; sobrescrever só o de 2 argumentos deixa a lista
  vazia sem erro nenhum (era o estado do primeiro teste).
- A `MainActivity` do engine continua `LAUNCHER`: o update deixa **dois** ícones (o nosso e o
  original). Para produção, remover o `LAUNCHER` do engine é o próximo passo (exigiria editar o
  intent-filter existente — o mesmo patcher sabe fazer).

## Evidência de que o update não quebrou o engine

- `adb install -r` → `Success`; `dumpsys package` continua `versionCode=1614`, `signatures=[1c4af95f]`
  (hash do cert Morphe) e `firstInstallTime` inalterado.
- O engine continua abrindo normalmente (`MainActivity`) e o probe usa a sessão de mídia real dele.
- Rollback, se precisar: `adb install -r .pipeline/release/AppleMusic-1.4.0-AndroidTV-arm32.apk`
  (nunca desinstalar).

## Fase B — a UI Compose pode ser mesclada?

### Versões resolvidas dos apps (cache do Gradle / `build.gradle.kts`)

| Dependência | tv-app / car-app |
|---|---|
| `androidx.compose:compose-bom` | 2026.06.01 → `ui`/`runtime` **1.12.1** |
| `androidx.activity:activity-compose` | **1.13.0** |
| `androidx.lifecycle:*` | declarado 2.10.0, resolvido **2.11.0** |
| `io.coil-kt.coil3:*` | declarado 3.5.0, resolvido **3.6.3** |
| `org.jetbrains.kotlinx:kotlinx-coroutines` | **1.11.0** |
| Kotlin (plugin/compilador) | **2.4.21** |
| `androidx.tv:tv-material` | 1.1.0 |

### Engine (7.0.0 patcheado, `.pipeline/release/AppleMusic-1.4.0-AndroidTV-arm32.apk`)

Não há versão de biblioteca gravada no APK: não existe `META-INF/<lib>.version`, os
`*.kotlin_module` são dos módulos do app e o R8 renomeia/reduz boa parte do AndroidX
(`x2/`, `p507z3/`, `androidx.compose.ui.platform.b`…). **Versão exata do engine: UNVERIFIED** —
só dá para medi-la pelo que colide de nome com o app.

### Classes em comum (dex do engine × dex dos apps)

`tools/dex_dupes.py` (compara descritores e assinaturas de método de todos os `classes*.dex`).
Relatório completo em `evidence/phase-b-dex-overlap.txt` / `.json`.

| | engine | tv-app | car-app |
|---|---|---|---|
| classes | 42.895 | 14.658 | 16.383 |
| `androidx/` | 2.039 | 11.221 | 13.004 |
| `kotlin/` | 1.131 | 1.080 | 1.080 |
| `coil3/` / `kotlinx/` | 0 / 0 | 513 / 1.142 | 513 / 1.142 |

- **1.151 classes duplicadas** (nome idêntico) entre engine e cada app; **51** com conjunto de
  métodos diferente, somando **287 métodos que só existem no lado do app**.
- `androidx/`: 49 classes em comum, **36 divergentes** (ex.: `AndroidCompositionLocals_androidKt`
  engine=4 métodos × app=13; `SavedStateHandle` 5 × 18; `NestedScrollView` 86 × 122;
  `IconCompat` 13 × 37).
- `kotlin/`: 1.067 em comum, 9 divergentes (KProperty/TimeMark/Continuation — parte é artefato do
  R8 ter inlinado default methods, não necessariamente versão diferente).

### Parecer

**Mesclar a UI atual como está: NÃO é seguro.** Num APK único o dex do app entra depois dos 8 dex do
engine (`classes9.dex`+), e **o dex anterior vence** para classes de mesmo nome. Ou seja, as 36
classes `androidx` divergentes resolvem para a cópia (mais antiga) do engine, e 287 métodos que o
app compilado chama podem não existir → `NoSuchMethodError` em runtime, provavelmente no meio da UI.

Caminhos, em ordem de esforço:

1. **Recompilar a UI contra as versões do engine** — é o caminho correto e definitivo, mas exige
   descobrir as versões exatas do engine (não recuperáveis do dex; dá para estimar por marcadores de
   API ou por tentativa, rodando a UI). Sem isso não dá para dizer que a UI "roda como está".
2. **Inverter a ordem dos dex** (app primeiro, engine depois), de modo que a cópia mais nova do app
   vença. O engine passaria a chamar APIs mais novas do AndroidX (que mantém compatibilidade binária
   para frente), mas é uma aposta que precisa de validação com uma tela Compose real.
3. **Manter o companion para a UI** e usar o APK único só para o bridge/launcher (foi o que a Fase A
   provou ser viável), até (1) ou (2) serem validados.

O lado bom: como o R8 do engine renomeia a maior parte do AndroidX (2.039 nomes canônicos contra
11.221 no app), a superfície de colisão é pequena — 1.151 classes, das quais só 51 divergem. Não é
"inviável", é "não é drop-in".

## Riscos e limitações

- **ABI continua por device**: TV arm32 e carro arm64 precisam de APKs diferentes (o engine não é
  multi-ABI). "1 APK por device" ≠ "1 APK universal".
- A activity roda no processo do engine, então `AppleMusicApplication.onCreate` executa junto; no
  teste o processo já estava quente. Processo frio (após reboot) ainda não foi medido.
- Dois ícones no launcher enquanto o `LEANBACK`/`LAUNCHER` original não for removido.
- O teste de update usou como base o **mesmo** APK instalado (100.517.113 B, mesmo cert). Atualizar
  por cima de um engine de build diferente (mas mesma versão/assinatura) não foi testado.
- Carro não validado nesta rodada (offline); a variante arm64 foi gerada e verificada
  (`launchable-activity` + assinatura Morphe), mas **não instalada**.
- O patcher de manifest assume string pool UTF-16 sem styles e `<application>` já existente; se o
  engine mudar de versão, rodar de novo o `aapt2 dump badging` antes de instalar.
- `.pipeline/` não é commitado: o script aponta para os APKs do pipeline local.
