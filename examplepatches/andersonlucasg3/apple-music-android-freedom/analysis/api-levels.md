# API levels (minSdk 28/29) e startup sem GMS — Apple Music 7.0.0 (DiLink)

> Status: **análise estática concluída** (sem device). Data: 2026-11-03.
> Artefato: `com.apple.android.music` 7.0.0, vc 1614, XAPK `apks/apple-music-7.0.0/AppleMusic_7.0.0_apkpure.xapk`.
> Este arquivo não substitui `analysis/apple-music-7.0.0.md` (que ficou intocado); é o anexo de fechamento das lacunas **M4** (§6.4) e **G2/G5** (§6.2) daquele relatório.

**Veredito curto**

- A varredura por *reference table* achou **1.279 referências** a APIs de plataforma com `since > 28` em 4 dex (1.024 métodos, 109 campos, 146 tipos), sendo **109 em `com/apple/**`** (código do app) e o resto em classes obfuscadas — que **não são só do app**: o R8 ofuscou também as bibliotecas, então androidx aparece em pacotes como `p468x2` (= `androidx.core.view`), `p088e`, `p447w0`, etc.
- O achado central é que **o R8 apagou os guards `SDK_INT >= 30`** no build (minSdk de compilação = 30). Exemplo provado: `androidx.core.view.WindowInsetsControllerCompat` (obfuscado em `p468x2.W`) só ramifica em `SDK_INT >= 35`; no resto chama `Window.getInsetsController()` (API 30) **sem checagem**. Isso é usado no tema do `MainActivity` (`I/C1307t0.java:117`) e em `MusicContentFragment.java:596` → **crash na tela principal em API 29** (assim que o observer de tema roda).
- Além disso, código do app chama `java.util.Objects.requireNonNullElse*` (API 30) sem guarda em getters de playback e na inicialização da medialibrary → **crash em API 29**.
- Portanto: **minSdk 28 e 29 não são viáveis com o patch atual**; a guarda do emoji não é suficiente. Detalhes e lista completa abaixo.
- **Startup sem GMS**: o app abre. Firebase inicializa (recursos `google_app_id` presentes no APK), o `getToken()` só tem callback de sucesso (falha é engolida), o Cast tem retry limitado (3× / 1 s) e `catch` que emite `null`, e o único check de GMS no startup (`C4184h.w`) retorna `false` sem lançar.

---

## 1. Varredura de API level

### 1.1 Método (e o que foi de fato usado)

| Etapa | Implementação |
|---|---|
| Banco oficial | `C:\Users\anderson\AppData\Local\Android\Sdk\platforms\android-36\data\api-versions.xml` (5.674.817 bytes): 6.735 `<class>`, 50.132 `<method>`, 32.191 `<field>`, 2.533 `<implements>` |
| `since` efetivo | `max(since do membro, since da classe)` quando o membro não tem `since` (38.522 métodos não têm atributo e herdam o da classe) |
| Herança | `extends` + `implements` do próprio XML, caminhada transitiva. **Regra: menor `since` encontrado na hierarquia** (ver 1.3) |
| Referências | parser de DEX próprio em Python (não `dexdump` textual): lê `method_ids`/`field_ids`/`type_ids` e decodifica o bytecode Dalvik para atribuir **caller** a cada `invoke-*`, `iget/iput/sget/sput` e `const-class/new-instance/check-cast/instance-of/new-array` |
| Guardas | `grep` do método no jadx (`analysis/jadx_src/sources/**`) por `SDK_INT`, mais leitura manual dos casos destacados |
| Classes sintéticas | flag `SYNTHETIC` (0x1000) do `class_def` separada: bridges do R8 não são código-fonte do app (ver 1.5) |

Números da extração:

| Métrica | Valor |
|---|---|
| dex analisados | 4 (classes.dex … classes4.dex, 36,8 MB) |
| classes definidas | 41.756 |
| métodos com código | 200.552 |
| instruções de referência analisadas | **1.790.258** (900.425 `invoke`, 633.610 field-ops, 256.223 type-ops) |
| refs a métodos de classe de plataforma | 327.340 |
| refs a campos de plataforma | 11.055 |
| **refs com `since > 28`** | **1.279** → 1.024 método, 109 campo, 146 tipo |
| distribuição por `since` | 29: 545 · 30: 296 · 31: 211 · 32: 15 · 33: 89 · 34: 111 · 35: 12 |
| métodos não decodificados | **3 de 200.552 (0,0015%)** — ver limitações |

Sanidade do parser: a chamada que o relatório anterior já tinha achado à mão (`EmojiSearchFragment$a.onGlobalLayout` → `Window.setDecorFitsSystemWindows`, API 30) aparece no resultado; o dump do `dexdump` para `openKeyboardForTitle` bate instrução por instrução com a saída do patch (ver §3).

### 1.2 Limitações declaradas (UNVERIFIED onde aplicável)

1. **Herança é heurística.** O XML descreve a hierarquia *da API 36*. Ex.: `java/util/TreeMap.firstEntry()` não está declarado em `TreeMap`; a busca acha `NavigableMap.firstEntry` (`since=9`) e `SequencedMap.firstEntry` (`since=35`, via `SortedMap implements SequencedMap` na API 35). Usar "primeiro achado" daria falso positivo; usar o **mínimo** dá o resultado correto nesse caso. O caso oposto (método que só existe no override novo) continua sendo detectado porque o mínimo continua > 28.
2. **Reflexão/JNI/`Class.forName`/strings não são cobertas.** Só referências no bytecode.
3. **3 métodos não decodificaram** (`badop` por dessincronia de payload): `LZ2/Y.<clinit>`, `Attributes$$serializer.deserialize`, `Attributes.<init>` (classes2). Nenhum é candidato a API 30; ficam fora da varredura.
4. **Caller pode ser classe sintética** criada por R8 (bridge/outline). Nesses casos a guarda normalmente está no chamador real, que o jadx mostra *inlined*. Separei os 27 refs nessa situação (1.5) e não os tratei como achado de app.
5. **O jadx no Windows perdeu arquivos** por colisão de maiúsculas/minúsculas (`x2` vs `X2`, `e` vs `E`, `f4` vs `F4`). Por isso `analysis/jadx_src/sources/x2/W.java` contém `package X2; class w` — o arquivo real do compat `Lx2/W;` é `p468x2/W.java` (jadx renomeia o pacote colidente). Ao grepar, use o nome `pNNN…` correspondente.
6. `since` considera apenas API de plataforma; APIs de *extension SDK* (`<sdk id=…>`) vêm com o id numérico e foram tratadas como nível normal (nenhuma apareceu nos achados).

### 1.3 Achados em código do app (`com/apple/**`)

109 refs / 43 métodos. Desses, 27 refs são de classes sintéticas (bridges) — listados em 1.5. A tabela abaixo é o **código real do app** (32 métodos).

Legenda: `GUARD` = há `SDK_INT` no método (pode ser guarda parcial); `—` = sem nenhuma checagem. Arquivo:linha é o jadx.

#### API 30 (crash em API 28 **e** 29)

| since | guarda | classe.método | arquivo:linha | alvo |
|---|---|---|---|---|
| 30 | — | `MediaPlaybackPreferences.getCellularAudioQuality()` | `MediaPlaybackPreferences.java:238` | `Objects.requireNonNullElse` |
| 30 | — | `MediaPlaybackPreferences.getDolbyAtmosState()` | `MediaPlaybackPreferences.java:262` | `Objects.requireNonNullElse` |
| 30 | — | `MediaPlaybackPreferences.getWifiAudioQuality()` | `MediaPlaybackPreferences.java:326` | `Objects.requireNonNullElse` |
| 30 | — | `StorePlaybackQueueItemProvider.isExplicitAllowed()` | `StorePlaybackQueueItemProvider.java:220` | `Objects.requireNonNullElse` |
| 30 | — | `medialibrary.library.a.<init>(…)` | `medialibrary/library/a.java:197` | `Objects.requireNonNullElseGet` |
| 30 | — | `NewPlaylistFragment.openKeyboardForTitle(View)` | `NewPlaylistFragment.java:789` | `Window.getInsetsController` (via `p468x2.W$a.<init>`) + `WindowInsetsController.show` |
| 30 | parcial (`>= 35`) | `FullScreenVideoActivity.onCreate(Bundle)` | `FullScreenVideoActivity.java:645,691-695` | `WindowInsetsController.hide`, `Window.getInsetsController` |
| 30 | — | `metrics.f.b(EventType)` | `metrics/f.java:51` | `WifiInfo.getWifiStandard` |
| 30 | — | `BaseAssetRequest.fetchMiniSinfs(String, Map)` | `BaseAssetRequest.java:103` | `List.of` |
| 30 | **patch** | `EmojiSearchFragment$a.onGlobalLayout()` | `EmojiSearchFragment.java:54` | `Window.setDecorFitsSystemWindows` |
| 30 | **patch (por tabela)** | `common.views.O.onApplyWindowInsets(...)` | classe sintética do listener, uso único em `EmojiSearchFragment$a` | `WindowInsets.isVisible/getInsets`, `WindowInsets$Type.ime/navigationBars` |
| 30 | catch | `com.apple.android.music.f.invokeSuspend` (corpo de `C4182g`) | `utils/C4182g.java:32-40` | `PackageManager.getInstallSourceInfo` / `InstallSourceInfo.getInstallingPackageName` |

Observações:

- `NewPlaylistFragment` e `FullScreenVideoActivity` **não** têm guarda `< 30`: o `SDK_INT >= 35` só escolhe a implementação do compat. Em API 29, `new p468x2.W.a(window, …)` chama `Window.getInsetsController()` e lança `NoSuchMethodError` (evidência: `p468x2/W.java`, construtor `a(Window, C6812v)`).
- `O` é a classe do listener anônimo do emoji. O único `invoke` a `O.<init>` em todo o dex está em `EmojiSearchFragment$a.onGlobalLayout` (varredura dedicada), e o patch atual retorna antes de `setOnApplyWindowInsetsListener` → coberto **por tabela**, não por guarda própria.
- `com.apple.android.music.f` é a continuação sintética de `C4182g`; o `try/catch (Throwable)` está em `C4182g.java:38` e captura `NoSuchMethodError` (que é `Error`), como o relatório anterior já dizia.

#### API 33 (crash em API 28/29)

Nenhum método **não-sintético** do app chama API 33 direto. Todos os achados 33 são bridges do R8 (`utils/X`, `utils/Y`, `utils/Z`, `utils/a0`, `pushnotifications/fragment/a`, `player/e1`), e os chamadores reais estão protegidos:

| Bridge | Chamador real (jadx) | Guarda |
|---|---|---|
| `utils/X.a` | `ExtensionsKt.java:407` | `>= 33` (`ExtensionsKt.java:406`) |
| `pushnotifications/fragment/a.a` | `NotificationsUpsellFragment.java:70` | `> 32` (`:69`) |
| `utils/Y.a` | `ListPreferenceFragment.java:292` | `>= 33` (`:291`) |
| `utils/Z.a`, `utils/a0.a` | idem família `ExtensionsKt` | `>= 33` |

#### API 29 (crash **só** em API 28)

| guarda | classe.método | arquivo:linha | alvo |
|---|---|---|---|
| — | `PlaylistEditCoverFragment.onViewCreated/onDestroyView` | `:389` / `:362` | `Window.setNavigationBarContrastEnforced` |
| — | `CustomTextView.setText(CharSequence, BufferType)` | `:208` | `TextView.getTextDirectionHeuristic` |
| — | `ExpandCollapseTextView.n(...)` | `:107` | `Paint.getTextBounds(CharSequence,int,int,Rect)` |
| — | `DownloadService.e()` | `:91` | `Service.startForeground(int, Notification, int)` |
| — | `AudioDeviceCapabilities.b(...)` | `:25` | `AudioTrack.isDirectPlaybackSupported` |
| — | `VocalsAudioProcessor.logMetrics()` | `:134` | `PowerManager.getCurrentThermalStatus` |
| — | **`utils.m1.<clinit>`** | `m1.java:156-159` | `new FontStyle(...)` |
| — | `utils.m1.B(...)` | `m1.java:271-342` | `Typeface.CustomFallbackBuilder`, `FontFamily.Builder` |
| parcial (`>= 31`) | `utils.m1.t(...)` | `m1.java:451` | `Font.Builder(ByteBuffer)` — o ramo `< 31` usa API 29 |
| — | `player.S0.<init>/V`, `player.x.<init>/a0/l/o0`, `PlayerLyricsViewFragment$b.invoke`, `profiles.BaseProfileEpoxyController.populateViews`, `profiles.d0.b` | `S0.java:648`, `x.java`, `:1638`, `d0.java:106` | `Resources.getFloat(int)` |
| — | `metrics.e.a(...)` (classe sintética) | `metrics/e.java:28` | `CellInfoNr`, `CellIdentityNr` |
| — | `utils.b0`, `utils.k1`, `utils.l1` (sintéticas) | — | `RenderNode`, `Font.Builder` |

O caso mais grave de API 29 é `m1.<clinit>`: `FontStyle` é API 29 e é instanciado no **inicializador estático** de `m1`. Em API 28, a primeira leitura de `m1` (inclusive `m1.x()`, que o patch de tablet usa) derruba a classe com `NoClassDefFoundError`. Em API 29 funciona.

### 1.4 O achado que muda o jogo: R8 apagou os guards `SDK_INT >= 30`

O relatório anterior dizia "não existe nenhuma checagem `SDK_INT >= 30`" e atribuía isso ao código da Apple. A varredura mostra que **também nas bibliotecas** os ramos `>= 30` sumiram, e o motivo é o `minSdk=30` de compilação (o R8 avalia `SDK_INT >= minSdk` como sempre verdadeiro e remove o ramo morto).

Prova direta, `p468x2/W.java` (= `androidx.core.view.WindowInsetsControllerCompat`, ofuscado):

```java
// p468x2/W.java:126-137 — construtores do compat
public a(Window window, C6812v c6812v) {
    this(window.getInsetsController(), c6812v);  // API 30, sem guarda (linha 126)
    this.f82861c = window;
}

public W(Window window, View view) {
    C6812v c6812v = new C6812v(view);
    if (Build.VERSION.SDK_INT >= 35) {
        this.f82858a = new c(window, c6812v);
    } else {
        this.f82858a = new a(window, c6812v);     // linha 132: TODAS as versões < 35
    }
}
```

O `dexdump` confirma o bytecode (`classes.dex`):

```
x2.W$a.<init>:(Landroid/view/Window;Lx2/v;)V
0000: invoke-virtual {v2}, Landroid/view/Window;.getInsetsController:()Landroid/view/WindowInsetsController;
```

Chamadores desse construtor em código do app:

| chamador | arquivo:linha | contexto |
|---|---|---|
| `MainActivity` (lambda de tema) | `I/C1307t0.java:117` | `w = new p468x2.W(mainActivity.getWindow(), …)` e em seguida `w.b(...)`/`w.a(...)` para status/nav bar |
| `MusicContentFragment.c(int)` | `MusicContentFragment.java:596` | troca de tema/visibilidade do player |
| `NewPlaylistFragment.openKeyboardForTitle` | `:800` | diálogo de nova playlist |
| `FullScreenVideoActivity.onCreate` | `:693` | tela cheia de vídeo |
| `androidx.mediarouter`, `com.google.android.material.*` | — | bibliotecas |

**Consequência:** em API 29 o app não chega à tela principal (o observer de tema do `MainActivity` cai em `x2.W$a.<init>`). O patch do emoji não toca nisso. `Objects.requireNonNullElse*` é o segundo crash da mesma natureza (API 30 de `java.util`), e `m1.<clinit>` é o crash de API 28.

Isso também explica por que o `p468x2.W$a` tem fallbacks `d()/e()` para `systemUiVisibility` mas o construtor não os usa: o ramo `Impl20/23/26` foi removido como código morto.

### 1.5 Classes sintéticas (R8 bridges) — não são achados de app

27 refs em classes com flag `SYNTHETIC` (0x1000): `common/views/O` (listener anônimo — este é coberto pelo patch do emoji), `metrics/e`, `player/e1`, `pushnotifications/fragment/a`, `utils/X`, `utils/Y`, `utils/Z`, `utils/a0`, `utils/b0`, `utils/k1`, `utils/l1`.

Para essas, o jadx **inlina** a chamada no chamador real (ex.: `ExtensionsKt.java:407` mostra `intent.getSerializableExtra(str, NavigationIntentFragmentRequestCode.class)`), e é lá que a guarda existe. Não inspecionei os 27 individualmente; os que consegui mapear estão na tabela de API 33 acima. **UNVERIFIED** para `player/e1` e `metrics/e` (mas ambos são bridges de trechos que o código-fonte protege por `SDK_INT`; `metrics/e` é o mapa de telemetria de célula, `player/e1` é o blur do player).

### 1.6 O que já está coberto

| Caminho | Cobertura |
|---|---|
| `EmojiSearchFragment` (4 chamadas API 30) | patch (`onGlobalLayout` retorna antes de registrar o listener) |
| Play Integrity (`getAppIntegrityToken`) | patch (retorna `null`) |
| Rotação/tablet (`m1.x()`) | patch (retorna `TABLET`) |
| `getInstallSourceInfo` (API 30) | `catch (Throwable)` em `C4182g.java:38` + `bc/a.java:62` |
| APIs 33 (`Bundle/Intent.getSerializable(…, Class)`) | guards `>= 33` nos chamadores reais |
| `Outline.setPath` (API 30) | `PlayerMainFragment.java:247` exige `SDK_INT >= 33` antes do caminho com `Path` |
| APIs 31–35 com guarda | 210 refs; a maioria em bibliotecas com `SDK_INT >= 31/33/35` (ex.: `CustomTextView:359`, `replayinapp/j:185`) |

### 1.7 Risco residual (resumo)

| Risco | Nível | Evidência |
|---|---|---|
| `p468x2.W$a.<init>` → `Window.getInsetsController()` sem guarda, usado pelo `MainActivity` | **bloqueante em API 29** | `p468x2/W.java:126`; `I/C1307t0.java:117`; `MusicContentFragment.java:596` — **UNVERIFIED** apenas *quando* o observer de tema dispara (se antes da primeira frame, o crash é no startup) |
| `Objects.requireNonNullElse*` (API 30) em getters de playback e medialibrary | **bloqueante em API 29** | `MediaPlaybackPreferences.java:238/262/326`; `medialibrary/library/a` |
| `m1.<clinit>` (`FontStyle`, API 29) | **bloqueante em API 28** | `m1.java:156-159` |
| `Resources.getFloat` (API 29) em player/lyrics/profiles | bloqueante em API 28 | `S0.java:648`, `x.java`, `BaseProfileEpoxyController.java:1638` |
| `FullScreenVideoActivity` / `NewPlaylistFragment` (API 30) | crash em telas específicas (nova playlist já corrigida) | §1.3 |

**Conclusão (estado anterior ao backport):** `minSdk 28` **não** é viável; `minSdk 29` **também não** com o patch de então (dois bloqueios independentes: `x2.W` e `Objects.requireNonNullElse`). O caminho para 29 exigiria, no mínimo, reescrever o compat `p468x2.W` (construtor + `a()/b()/c()` + `v$b`) e trocar as 4 chamadas de `Objects.requireNonNullElse*` por null-checks — nenhum dos dois é "guarda de uma linha". **O backport descrito em §5 foi aplicado em 2026-11-03 e cobre esses dois bloqueios + os demais alvos de API 30; a decisão do produto é Android 10 (API 29).**

---

## 2. Startup sem GMS

### 2.1 Firebase/FCM — `AMApplicationObserver.java:442,545`

Cadeia real:

- `AppleMusicApplication.onCreate` cria e registra o observer: `AppleMusicApplication.java:987-993` (`new AMApplicationObserver(...)`, `registerActivityLifecycleCallbacks`).
- O corpo que interessa é o `invokeSuspend` do coroutine do observer (`AMApplicationObserver.java:423-479` e `526-582`), não um método de `Application`.
- A chamada está **duas vezes** (dois caminhos do mesmo state machine):
  - `:440-443` — `Pb.a.f15305a.getClass(); if (Pb.a.j()) { FirebaseMessaging.getInstance().getToken().e(new J3(new O.i1(...))); }`
  - `:543-546` — idem.
- `Pb.a.j()` é `SubscriptionCoordinator.j()` (`Pb/a.java:442`): `MusicStatus == ENABLED || UNLINKED`. **Não é checagem de GMS** — é status de assinatura.
- `Task.e(...)` recebe um `J3`, que implementa `onSuccess` (`J4/J3.java:69`). Só o **sucesso** é tratado; falha do `Task` não chama nada. Não há `try/catch` em volta (o `catch (Exception)` de `:517` cobre só o bloco "Failed to get the bag", antes das linhas 442/545).

O que acontece sem GMS:

1. `FirebaseInitProvider` está no manifest (`analysis/_evidence/manifest_decoded_summary.txt:163`, authority `com.apple.android.music.firebaseinitprovider`, `initOrder=100`).
2. Os recursos que o `FirebaseApp.initializeApp(context)` exige existem no APK (`analysis/jadx_res/resources/res/values/strings.xml`):
   - `google_app_id` → `1:843686588413:android:460563c870948822` (`:1435`)
   - `google_api_key` (`:1434`), `google_crash_reporting_api_key` (`:1436`), `gcm_defaultSenderId` (`:1415`), `project_id` (`:2106`), `firebase_database_url` (`:1389`), `google_storage_bucket` (`:1437`)
3. Logo, `FirebaseApp` é inicializado **sem GMS** (o provider não fala com o Play Services). `FirebaseMessaging.getInstance()` e `FirebaseCrashlytics.getInstance()` não lançam `IllegalStateException` ("Default FirebaseApp is not initialized").
4. `getToken()` retorna um `Task` que falha de forma assíncrona (FIS/HTTP). Como só existe `addOnSuccessListener`, **a falha é descartada** — sem crash e sem retry.
5. `FirebaseCrashlytics.getInstance().isCrashlyticsCollectionEnabled()` (`:426`, `:529`): o manifest tem `firebase_crashlytics_collection_enabled=false`, então retorna `false` e o bloco é pulado.

Conclusão parcial: **FCM não derruba o startup sem GMS**; o push simplesmente não registra. O que *seria* fatal é remover o `FirebaseInitProvider` do manifest (patch G3 do relatório anterior): aí `FirebaseCrashlytics.getInstance()` em `:426/:529` lançaria `IllegalStateException` dentro do coroutine e derrubaria o app. **Não remover o provider sem trocar as chamadas por checagem de `FirebaseApp.getApps(context).isEmpty()`.**

### 2.2 Cast — `CastManager.createCastContextWithRetry`

- Declaração: `CastManager.java:1032`. Defaults: `retryCount = 3`, `delayMillis = 1000` (`createCastContextWithRetry$default`, `:1036-1044`). O call site `:1241` usa a máscara `3` e portanto **3 tentativas de 1 s**, não 0.
- Retry: `AnonymousClass3` (`:679-729`) é o predicado do `retryWhen`; retorna `attempt < retryCount` (`:722`). Fim do limite → `catch` `AnonymousClass4` (`:733-772`), que faz `FirebaseCrashlytics.getInstance().recordException(new Exception("Error creating cast context", th2))` (`:759`) e **emite `null`** (`interfaceC2137h.emit(null, …)`, `:762`).
- Logo: **não há loop infinito**. Sem GMS, `CastContext.getSharedInstance` falha, o retry tenta 3× com 1 s de intervalo, o `catch` engole e o fluxo segue com `castContext = null` → Cast desabilitado. ~3 s de atraso no máximo, nenhum crash.
- Ressalva: o corpo de `AnonymousClass2.invokeSuspend` (que chama o `CastContext`) **não foi decompilado** ("Method not decompiled", `:673`), então *qual* exceção exata o GMS ausente produz é **UNVERIFIED**; mas qualquer que seja, cai no `catch` acima.

### 2.3 `GoogleApiAvailability` / check de GMS no startup

- `C4184h.w(Context)` (`utils/C4184h.java:1102-1107`) = `C5291e.getInstance().b(context, C5292f.f62599a) == 0`, ou seja `GoogleApiAvailability.isGooglePlayServicesAvailable(ctx) == 0`.
- É chamado **no startup** em `AppleMusicApplication.java:1067`, `:1070` e `:1071`.
- Sem GMS: a API `isGooglePlayServicesAvailable` está **dentro do próprio APK** (1.164 classes `com/google/android/gms` empacotadas), então não há `ClassNotFoundException`; o retorno é `SERVICE_MISSING` (≠ 0) → `false`. Efeito: pula `registerActivityLifecycleCallbacks(new C4117u(this))` (`:1068`) e o bloco `H.a(...)` (`:1072`). Nenhuma exceção.
- Outros usos de `C4184h.w` são tardios: `C4174c.java:35` (AppIntegrityManager — já coberto pelo patch I1), `commerce/activities/h.java:45`, `ListenNowFragment.java:802/1041`, `MLIViewModel.java:834`.

### 2.4 Conclusão — "sem GMS o app abre?"

**Sim, abre.** Evidências:

| Ponto | Resultado sem GMS | Evidência |
|---|---|---|
| `FirebaseInitProvider` | inicializa `FirebaseApp` normalmente (recursos presentes) | manifest:163; `strings.xml:1434-1437,1415,2106` |
| `FirebaseMessaging.getToken()` | falha assíncrona, sem listener de falha → silencioso | `AMApplicationObserver.java:442,545`; `J4/J3.java:69` |
| `FirebaseCrashlytics.getInstance()` | OK (FirebaseApp existe); coleta desligada | manifest + `:426,:529` |
| `C4184h.w()` (3× no onCreate) | `false`, sem exceção | `C4184h.java:1102-1107`; `AppleMusicApplication.java:1067-1071` |
| Cast | 3 tentativas / 1 s, `catch` → `null` | `CastManager.java:1032,1036-1044,722,759-762` |
| Play Integrity | `null` (patch) → AMSKit recebe opcional vazio | patch I1/I2 |

**Risco de crash por GMS**: nenhum caminho conhecido no startup. O único jeito de transformar isso em crash é **remover** `FirebaseInitProvider`/componentes Firebase do manifest (G3) sem ajustar `FirebaseCrashlytics.getInstance()` — aí o coroutine do observer estoura `IllegalStateException`. Não fazer G3 sem esse ajuste.

---

## 3. Ação aplicada (patch)

### 3.1 Achado e decisão

Achado não coberto: **`NewPlaylistFragment.openKeyboardForTitle(View)`** (`NewPlaylistFragment.java:789-805`) — método de UI real (diálogo de nova playlist) que constrói `p468x2.W.a` e chama `WindowInsetsController.show(0)` (API 30) sem nenhum `SDK_INT`. Em API 28/29 → `NoSuchMethodError` em `Window.getInsetsController()` no construtor do compat.

Guarda mínima aplicada no patch existente, no mesmo padrão do emoji (`addInstructionsWithLabels` + `ExternalLabel`): retorno antecipado em `SDK_INT < 30`. Degradação: o campo de título não recebe foco/teclado automático.

Edição em `patches/src/main/kotlin/app/morphe/patches/applemusic/dilink/AppleMusicDiLinkPatch.kt`:

```kotlin
internal object NewPlaylistKeyboardFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/music/collection/mediaapi/fragment/NewPlaylistFragment;",
    name = "openKeyboardForTitle",
    returnType = "V",
)
...
NewPlaylistKeyboardFingerprint.method.apply {
    addInstructionsWithLabels(
        0,
        """
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x1e
            if-ge v0, v1, :supported
            return-void
        """,
        ExternalLabel("supported", getInstruction(0)),
    )
}
```

`openKeyboardForTitle` tem 5 registradores e 1 parâmetro (`this` = v3), então `v0/v1` são livres — mesma conta do `onGlobalLayout`.

### 3.2 Verificação (build + aplicação)

```
$env:JAVA_HOME="C:\Users\anderson\.jdks\jdk-21.0.11+10"; $env:GRADLE_USER_HOME="$PWD\.gradle-user"
$env:GITHUB_ACTOR="andersonlucasg3"; $env:GITHUB_TOKEN=$(gh auth token)
.\gradlew.bat :patches:build :patches:generatePatchesList "-Pkotlin.compiler.execution.strategy=in-process"
```
→ `BUILD SUCCESSFUL in 10s` (30 tasks; `:patches:compileKotlin`, `:patches:jar`, `:patches:generatePatchesList`).

```
java -jar tools\morphe-desktop-1.20.0-all.jar patch -p patches\build\libs\patches-1.0.0.mpp -o .pipeline\out.apk --validate apks\apple-music-7.0.0\AppleMusic_7.0.0_apkpure.xapk
```
→ `Applied: Apple Music DiLink support`, `Changed 4 of 41756 classes to mutable`, `Wrote 1 dex files`, `Saved to ...\.pipeline\out.apk`, exit code 0 (`--validate` sem erro).

Conferência no APK gerado (`.pipeline/out.apk` → `classes5.dex`, o dex novo com as 4 classes mutáveis), via `dexdump` do build-tools 36.0.0:

```
com.apple.android.music.collection.mediaapi.fragment.NewPlaylistFragment.openKeyboardForTitle:(Landroid/view/View;)V
0000: sget v0, Landroid/os/Build$VERSION;.SDK_INT:I
0002: const/16 v1, #int 30
0004: if-ge v0, v1, 0007
0006: return-void
0007: const-string v0, "view"
...
```

A guarda está presente e o alvo do label é a primeira instrução original (checagem de null do parâmetro). As 4 classes mutáveis são as esperadas: `EmojiSearchFragment$a`, `m1`, `p095e7/i` (App Integrity) e `NewPlaylistFragment`.

### 3.3 O que **não** foi patchado (de propósito)

- `p468x2.W` / `p468x2.W$a`: exigiria reescrever o compat (construtor + `a()/b()/c()` + `v$b`) e um fallback para `f82859a == null`; é o bloqueio real de API 29, mas não é uma "guarda mínima" e não dá para validar sem device. Fica como **candidato nº 1** de próximo patch.
- `Objects.requireNonNullElse*`: trocar 4 chamadas por `if (x != null) x else y` em smali é possível, mas mexe em getters `@Keep` usados por JNI; precisa de teste em device. Fica documentado.
- `FullScreenVideoActivity`: a guarda exigiria pular 5 instruções no meio do `onCreate` (não é retorno no topo). Fica documentado; o crash só ocorre ao abrir vídeo em tela cheia.

---

## 4. Lacunas restantes (UNVERIFIED)

1. **Execução em API 28/29**: toda a análise é estática. Os crashes apontados (`NoSuchMethodError` em `x2.W$a.<init>`, `Objects.requireNonNullElse`, `m1.<clinit>`) são inferidos do bytecode e de `api-versions.xml`; não há device/emulador nesta sessão.
2. **`CastContext.getSharedInstance` sem GMS**: o corpo do `AnonymousClass2.invokeSuspend` não foi decompilado; a exceção exata é desconhecida (mas é capturada).
3. **27 refs em classes sintéticas**: só os bridges de API 33 foram rastreados até o chamador real; `player/e1`, `metrics/e`, `metrics/e`-família e `b0/k1/l1` não foram verificados um a um.
4. **Colisão de case no jadx**: qualquer análise futura que dependa de `sources/x2`, `sources/e`, `sources/f4` deve usar os nomes `p468x2`, `p088e`, `p088e`/`F4` conforme o jadx mapeou; os arquivos "curtos" podem estar sobrescritos.
5. **3 métodos não decodificados** (0,0015%) não entraram na varredura; nenhum tem chamada de plataforma conhecida.
6. **API 28 x 29**: os achados de `since=29` (fontes, `Resources.getFloat`, `startForeground`) só quebram em 28. Como o alvo declarado é Android 10 (29) e 9 (28), os dois níveis precisam de decisões separadas.

---

## 5. Backport aplicado para API 29 (2026-11-03)

Decisão do produto: manter o 7.0.0 e rodar no **Android 10 (API 29)** do DiLink. `minSdk` do patch agora é **29** (`DilinkManifestPatch`); API 28 continua fora de escopo porque tem bloqueio próprio (`utils.m1.<clinit>` com `FontStyle`, §1.3).

O que o patch (`AppleMusicDiLinkPatch`) faz hoje, além do que já existia (tablet/landscape, emoji, Play Integrity, `openKeyboardForTitle`):

| Alvo | Como | Evidência no APK patcheado |
|---|---|---|
| `Objects.requireNonNullElse` / `...ElseGet` (API 30, 7 call sites) | redirecionados para `ObjectsCompat` (extensão) com os mesmos registradores | `MediaPlaybackPreferences` (5), `StorePlaybackQueueItemProvider` (1), `medialibrary/library/a` (1); **0** refs a `Ljava/util/Objects;.requireNonNullElse*` no APK |
| `List.of` (API 30, 7 call sites, inclui `BaseAssetRequest.fetchMiniSinfs`) | redirecionados para `ListCompat.of` | `Lapp/morphe/extension/applemusic/ListCompat;.of:(Ljava/lang/Object;)Ljava/util/List;` |
| `x2.W$a.<init>(Window, v)` (API 30) | guarda no topo com o helper puro `WindowInsetsControllerCompat.isAtLeast30(int)` (sem tipo de API 30) usando só `v0`; em API < 30 o ramo **legado é independente**: faz o próprio `Object.<init>`, seta `b`/`c` e retorna — nunca executa o `invoke-direct` cujo protótipo cita `WindowInsetsController` (campo `a` fica null por default) | `sget v0, SDK_INT` → `invoke-static {v0}, …isAtLeast30(I)Z` → `move-result v0` → `if-eqz v0, :legacy` → `goto :orig` → `:legacy invoke-direct {v1}, Object.<init>` + `iput b` + `iput c` + `return-void` → `:orig` instruções originais (`getInsetsController` → `move-result` → `invoke-direct …<init>(WindowInsetsController, x2/v)` → `iput c` → `return`) |
| `x2.W.a(Z)` / `x2.W.b(Z)` | controller null → só o fallback `d()/e()` e `return` | null-check + `invoke-virtual Lx2/W$a;->d(I)V` |
| `x2.W$a.a()/b()` | controller null → `false` | `if-eqz` + `return v0` |
| `x2.W$a.c()` | controller null → caminho do tag (window conhecida) ou `return` | `if-eqz` + `goto` para o tag path |
| `WindowInsetsController.setSystemBarsAppearance/getSystemBarsAppearance/setSystemBarsBehavior` (API 30, 32 call sites) | redirecionados para `WindowInsetsControllerCompat` (null-safe) | necessário porque `e.m.b` → `e.m.a` → `q.b` (`e.p.b`) roda no **`MainActivity.onCreate`** e lê `W$a.a` direto |
| `FullScreenVideoActivity.onCreate` (API 30) | guarda `SDK_INT < 30` que pula só o bloco de insets (alvo: instrução após `WindowInsetsController.hide`) | `if-ge v8, v1, 0144` antes do bloco |
| `metrics.f.b(EventType)` → `WifiInfo.getWifiStandard` (API 30) | redirecionado para `WifiInfoCompat` (retorna 0 em API < 30) | `Lapp/morphe/extension/applemusic/WifiInfoCompat;.getWifiStandard` |

Resultado da varredura (§1.1) sobre o APK patcheado: **1.279 → 1.237** referências `since > 28`. As que continuam relevantes para as telas do app estão **guardadas** (`hide` do `FullScreenVideoActivity`, `show` do `NewPlaylistFragment`); as demais estão em classes de biblioteca sem caminho no app (`x2/v$b`, `Af/h`, `Af/i`, `androidx/preference`, `w0/q2`). Restam sem guarda `View.getWindowInsetsController()` em `x2/E$j.c` (só chamado por `Af/h`/`Af/i`, SearchView do material) e `x2/v$b.a()`.

**Não verificado (runtime real):** nenhum device/emulador nesta sessão; o comportamento de `e.p.b` com controller null, o `setSystemUiVisibility` de fallback e o `WindowInsetsControllerCompat` da extensão em API 29 são inferidos do bytecode.

---

## Anexos (artefatos desta análise)

| Arquivo | Conteúdo |
|---|---|
| `.pipeline/api-scan/api_versions.json` | `api-versions.xml` parseado (classe → since/extends/implements/métodos/campos) |
| `.pipeline/api-scan/dex_refs.jsonl` | 1.279 achados crus (caller, target, since, offset, dex) |
| `.pipeline/api-scan/dex_scan.py` | parser DEX + cruzamento (reproduzível: `python dex_scan.py`) |
| `.pipeline/api-scan/parse_api.py` | parser do XML |
| `.pipeline/api-scan/guard_check.py` / `guards.txt` | checagem de guarda por método (com a ressalva dos `>= 35` que não são guarda) |
| `.pipeline/api-scan/build.log`, `patch.log` | saída do build e da aplicação do patch |
