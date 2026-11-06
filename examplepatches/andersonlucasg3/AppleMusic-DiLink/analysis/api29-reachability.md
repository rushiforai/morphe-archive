# Alcançabilidade dos pontos de crash de API 30 que sobraram — Apple Music 7.0.0 (DiLink, minSdk 29)

> Data: 2026-11-03. Escopo: provar (ou refutar) que os alvos `since > 28` **sem guarda** que o scan
> dex (`.pipeline/api-scan/dex_scan_patched.py`, `analysis/api-levels.md` §5) deixou fora dos
> helpers são alcançáveis a partir de telas/fluxos reais do app. Sem device/emulador nesta sessão.
> Este arquivo é anexo de `analysis/api-levels.md` (que **não** foi alterado).

**Veredito curto**

| # | Alvo | Situação no APK patcheado | Veredito |
|---|---|---|---|
| 1 | `Landroid/view/View;->getWindowInsetsController()` | 4 refs | 2 UNREACHABLE (`androidx/preference/a$a`, `x2/E$j.c`) + 2 **UNCERTAIN** (`x2/v$b.a()/b()`, Compose) |
| 2 | `WindowInsetsController;->show(I)V` | 4 refs | 1 UNREACHABLE (`a$a`), 1 UNCERTAIN (`v$b.b`), 1 UNREACHABLE (`Af/h`), 1 **GUARDED** (`NewPlaylistFragment`) |
| 2b | `WindowInsetsController;->hide(I)V` | 3 refs | 1 UNCERTAIN (`v$b.a`), 1 UNREACHABLE (`Af/i`), 1 **GUARDED** (`FullScreenVideoActivity`) |
| 3 | `androidx/preference` (diálogo de `EditTextPreference` → `a$a.a(Window)`) | 1 ref | **UNREACHABLE** (o único XML com `EditTextPreference` não é carregado por nenhum código) |
| 4 | `w0/q2` (Compose) | **0** refs restantes | sem vetor de crash; não é Glance/widget |
| 5 | Outros `since>28` em `com/apple/**` | 100 refs (80×`since 29`, 14×`30`, 6×`33`) | `since 29` = seguros no minSdk 29; `30`/`33` = todos guardados, redirecionados ou dentro de `catch` |

**Ação**: o único ponto que não pôde ser provado morto é o do **Compose**
(`SoftwareKeyboardControllerCompat.Impl30` = `x2/v$b`), cujo chamador é instanciado por todo
`ComposeView` do app. Foi aplicada uma guarda **mínima e sem check-cast** nos dois métodos
(`x2/v$b.a()`/`b()`): em API < 30 delega ao `Impl20` (`x2/v$a`), que só usa `InputMethodManager`.
Em API ≥ 30 o bytecode é idêntico ao original. Nada em `com/apple/**` precisou de patch novo.

---

## 1. Método

| Etapa | O que foi feito |
|---|---|
| Dex analisados | os 6 dex do APK **patcheado** (`.pipeline/out.apk` → `.pipeline/patched/classes.dex`…`classes6.dex`; `classes5` = classes alteradas, `classes6` = extensão) |
| Grafo de chamadas reverso | parser DEX próprio (`.pipeline/api-scan/trace.py`, derivado do `dex_scan_patched.py`): resolve `method_ids`/`field_ids`/`type_ids` e decodifica o bytecode Dalvik de **210.824** métodos, gerando 126.667 alvos de `invoke-*` distintos e 37.983 refs de tipo (`new-instance`/`check-cast`/`instance-of`) com o caller de cada site. Cache em `callgraph.pkl` |
| Tracing | BFS reverso do alvo até: (a) entry point real (activities/services/receivers do manifest — `analysis/_evidence/activity_table.md`; `AppleMusicApplication`), (b) ausência total de chamador (código morto), (c) classes de biblioteca com callback registrado em ponto alcançável |
| Cross-check | `dexdump.exe` (build-tools 36.0.0) em `classes5.dex`/`classes3.dex` para os métodos alterados e para os `catches`; jadx (`analysis/jadx_src/sources/**`) para leitura de fonte; recursos (`analysis/jadx_res/resources/**`) para XMLs de preferência e layouts |
| Busca por id de recurso | varredura de bytes nos 6 dex pelo literal `0x7f180010` (`R.xml.debug_settings_preference`) — nenhuma codificação `const`/`sget` encontrada |
| Critério de veredito | **REACHABLE** só com caminho de chamadas completo desde um entry point; **UNREACHABLE** quando o único caminho depende de código nunca instanciado/carregado; **UNCERTAIN** quando o elo final esconde-se atrás de dispatch/reflexão/Compose sem símbolo |

Ressalvas do método (valem para todos os vereditos):

1. A análise é **estática**; não há device/emulador. `NoSuchMethodError` é inferido de
   `api-versions.xml` + bytecode (o método não existe em API 29).
2. Dispatch virtual é aproximado pelo tipo declarado no `invoke` (é o que o verifier usa de fato).
3. As 3 classes que não decodificam (0,0015% dos métodos, `analysis/api-levels.md` §1.2) não
   participam de nenhum caminho abaixo.

---

## 2. Alvo 1 — `Landroid/view/View;->getWindowInsetsController()`

Refs no APK patcheado (4), todas `since=30`:

| # | caller | dex | off | cadeia até um entry point | veredito |
|---|---|---|---|---|---|
| 1 | `Landroidx/preference/a$a;->a(Landroid/view/Window;)V` | classes.dex | 4 | `a.onCreateDialog()` → só quando `this instanceof W4.a` (`a.java:136-137`) → `W4.a` só é criado em `DialogPreference.w()` para `EditTextPreference` (`DialogPreference.java:71-72`) → nenhum `EditTextPreference` é criado (ver §5) | **UNREACHABLE** |
| 2 | `Lx2/E$j;->c(Landroid/view/View;)Lx2/W;` | classes.dex | 0 | `x2/E` = `androidx.core.view.ViewCompat` (`E$j` = bundle Api30); únicos 2 chamadores: `Af/h.run()` e `Af/i.run()` (casos "SearchView") → `com.google.android.material.search.SearchView` **nunca é instanciado** (ver §6) | **UNREACHABLE** |
| 3 | `Lx2/v$b;->a()V` (hide) | classes.dex | 9 | `E1/P.run()` (controle de teclado do Compose) ou `Af/i.run()` (SearchView, morto) | **UNCERTAIN** |
| 4 | `Lx2/v$b;->b()V` (show) | classes.dex | 32 | `E1/P.run()`; `Af/h.run()` (morto); `NewPlaylistFragment.openKeyboardForTitle` (já guardado) | **UNCERTAIN** |

### 2.1 Por que `x2/v$b` é o problema (e não `x2/W`)

`x2/v` = `androidx.core.view.SoftwareKeyboardControllerCompat` (jadx: `p468x2/C6812v`):

```java
// p468x2/C6812v.java:60-68 (Impl30 = x2/v$b, hide)
public final void a() {
    View view = this.f82910b;
    WindowInsetsController c = this.f82911c;
    if (c == null) c = view != null ? view.getWindowInsetsController() : null;  // API 30, sem guarda
    if (c == null) { super.a(); return; }
    ...
}

// p468x2/C6812v.java:105-116 — o R8 apagou a escolha Impl20/26/30: o ctor (View) SEMPRE cria Impl30
public C6812v(View view) { b bVar = new b(view); bVar.f82910b = view; this.f82908a = bVar; }
```

Ou seja: `new SoftwareKeyboardControllerCompat(view)` seguido de `show()`/`hide()` é
`NoSuchMethodError` em API 29 — o `super.a()/super.b()` (Impl20, `InputMethodManager`) só é
alcançado quando `view == null`, o que não acontece nesse ctor.

Bytecode (dexdump do APK patcheado **antes desta rodada**, quando a classe ainda estava em
`classes.dex`): `x2.v$b.a:()V @0x6a8150 |0009: invoke-virtual {v0},
Landroid/view/View;.getWindowInsetsController` e `x2.v$b.b:()V @0x6a81f4 |0020: invoke-virtual
... getWindowInsetsController`.

### 2.2 A cadeia do Compose (o elo UNCERTAIN)

```
Landroidx/compose/ui/platform/a;-><init>(Context, fi/f)      AndroidComposeView (162 métodos)
        |  off 488
        v
LE1/Q;-><init>(View, androidx/compose/ui/platform/a)          E1/Q implementa E1/F (InputMethodManager do Compose)
        |  E1/Q.java:270-277  i(Q$a) -> new E1/P(this,0); Choreographer.execute(...)
        v
LE1/P;->run()                                                E1/P.java:24-81 (case 0)
        |  E1/P.java:69-76
        v
LE1/C1129s; -> f3300c -> f82908a  (x2/v = SoftwareKeyboardControllerCompat)
        |  E1/P.java:72  /  :74
        v
Lx2/v$b;->b()V  (show)   /   Lx2/v$b;->a()V  (hide)          <-- getWindowInsetsController() API 30
```

* `E1/Q` é criado **apenas** pelo `AndroidComposeView` (`trace refs`: 1 site, `androidx/compose/ui/platform/a;<init>` off 488)
  e é o `InputMethodManager` que o Compose usa para `startInput`/`stopInput`/`show`/`hide`
  (`E1/Q.java:143-155, 218-221, 244-247`; `E1/F` é a interface que o core do Compose chama:
  `p1/P.invokeSuspend` → `F.a()` (StartInput), `b0/x0.e(...)` → `F.b()` (StopInput),
  `p1/s0.a()/b()` → `F.f()/F.d()` (show/hide)).
* `E1/C1129s` (jadx) = `E1/s`, criado no ctor de `E1/Q` (`E1/C1129s.java:30-33`):
  `f3300c = new C6812v(view)` → **Impl30 sempre**.
* No `E1/P.run()` (case 0), a decisão é `f11 = TRUE/FALSE` conforme as requisições pendentes
  (`StartInput`/`StopInput`/`ShowKeyboard`/`HideKeyboard`) e então chama
  `f82908a.b()` (show, `E1/P.java:72`) ou `f82908a.a()` (hide, `:74`). Basta **uma** dessas
  requisições em API 29 para o crash.
* **Quem pede**: qualquer sessão de input de texto do Compose (um `BasicTextField` focado). A
  stack de texto do Compose **está compilada** no APK (`androidx.compose.foundation.text`
  presente: `TextFieldSelectionState_androidKt$addBasicTextFieldTextContextMenuComponents…`,
  `LegacyPlatformTextInputServiceAdapter…`, `AndroidPlatformTextInputSession`).
* **O que falta para fechar**: identificar a tela do app que hospeda um `BasicTextField`/`TextField`
  do Compose. O Compose está em 30+ layouts (`activity_main.xml:14,42`,
  `activity_main_content_layout.xml:36`, `fragment_music_content.xml:16`, `fragment_landing_search.xml`
  — ComposeView `floating_app_bar_container`, etc.), mas o texto das composables está ofuscado
  (`w0/*`, `b0/*`, `o1/*`) e não há símbolo de app que nomeie o campo. Ver §9.

---

## 3. Alvo 2 — `WindowInsetsController.show(I)` / `hide(I)`

`show(I)V` (4 refs, `since=30`):

| caller | off | cadeia | veredito |
|---|---|---|---|
| `Landroidx/preference/a$a;->a(Window)` | 12 | idem §2 #1 | UNREACHABLE |
| `Lx2/v$b;->b()` | 44 | idem §2 #4 | UNCERTAIN |
| `LAf/h;->run()` | 92 | `Af/h` case 0 = `SearchView` (`Af/h.java:31-46`) → criado com case 0 **somente** em `SearchView.i()` (`SearchView.java:503-507`) → SearchView nunca instanciado | UNREACHABLE |
| `Lcom/apple/.../NewPlaylistFragment;->openKeyboardForTitle(View)` | 77 | diálogo de nova playlist (entry point real), **porém guardado**: `sget SDK_INT / const 30 / if-ge → return-void` na instrução 0 (`classes5.dex`, `code_off=0x203d4`) | **GUARDED** |

`hide(I)V` (3 refs, `since=30`):

| caller | off | cadeia | veredito |
|---|---|---|---|
| `Lx2/v$b;->a()` | 65 | idem §2 #3 | UNCERTAIN |
| `LAf/i;->run()` | 88 | `Af/i` case 0 = `SearchView.hide` (`Af/i.java:31-52`), criado com case 0 só em `SearchView.f()` (`SearchView.java:444-446`) | UNREACHABLE |
| `FullScreenVideoActivity.onCreate` | 321 | tela cheia de vídeo (activity real, `activity_table.md:9`), **guarda** `sget v8, SDK_INT / const 30 / if-ge v8, v1, +29` → salta para o `return-void` de `0x0050` (`classes5.dex`, `code_off=0x243b4`) | **GUARDED** |

Também verificado que `x2/W$a;-><init>(Window, x2/v)` continua guardado no APK novo
(`classes5.dex 0x27900`: `isAtLeast30` → `if-eqz v0` → `const/4 v0, 0` → `<init>(WindowInsetsController, x2/v)`).

---

## 4. Alvo 3 — `androidx/preference` e o caminho do `EditTextPreference`

**O app usa `androidx.preference` de verdade** (não é biblioteca morta):

* `BasePreferenceFragment extends androidx.preference.b` (`BasePreferenceFragment.java:18`).
* `DolbyAtmosSettingsFragment` (`:4`, `:59 d1(R.xml.dolby_atmos_preferences)`),
  `KaraokeSettingsFragment` (`:58 d1(R.xml.karaoke_preferences)`) usam `CheckBoxPreference`.
* A tela de settings (`settings_preference.xml:105`) e `basic_settings_preference.xml:7` usam
  `ListPreference` — que abre `W4.c`, não `W4.a`.

Mas o caminho que chama `getWindowInsetsController()` é exclusivo do diálogo de **EditText**:

```java
// androidx/preference/DialogPreference.java:71-72 — só EditTextPreference cria o diálogo W4.a
if (this instanceof EditTextPreference) { dVar = new W4.a(); ... }

// androidx/preference/a.java:38-42 — o alvo (API 30)
public static class C0412a {
    public static void a(Window window) {
        window.getDecorView().getWindowInsetsController().show(WindowInsets.Type.ime());
    }
}
// :136-137 — e só roda para instância de W4.a
if (this instanceof W4.a) { C0412a.a(dVarCreate.getWindow()); }
```

Evidência de que **nunca existe** um `EditTextPreference` em runtime:

1. Subclasses de `androidx/preference/a`: só `W4/a`, `W4/c`, `W4/d` (diálogos da biblioteca);
   `W4/a` **não tem subclasses**; `androidx/preference/EditTextPreference` **não tem subclasses**.
2. Nenhum `new-instance Landroidx/preference/EditTextPreference;` nos 6 dex (o inflater instancia
   por reflexão a partir do XML).
3. O **único** XML com `<EditTextPreference>` é `res/xml/debug_settings_preference.xml` (linhas
   6, 88, 232). O recurso é `0x7f180010` (`R.java:16363`; `public.xml:16296`) e **nenhuma**
   instrução dos 6 dex contém esse literal (busca de bytes) — ou seja, nenhum
   `setPreferencesFromResource(...)`/`d1(...)` o carrega. A tela de "debug" que o app realmente
   abre é `UserDebugSettingsFragment`, que carrega `R.xml.user_debug_preferences`
   (`UserDebugSettingsFragment.java:45`, 1 hit de `0x7f18001e` em `classes3.dex`) — e esse XML
   não tem `EditTextPreference`.

**Veredito: UNREACHABLE.** Ressalva em §9 (é um caminho latente: se alguém adicionar um
`EditTextPreference` ou carregar `debug_settings_preference.xml`, o crash volta).

---

## 5. Alvo 4 — `w0/q2`

* **O que é**: uma classe de nó do **Compose**, não um widget/Glance. `Lw0/q2` tem 16 refs de
  método e é criada por `Lw0/T2;->a(pi/a;JLw0/P2;LI/c;LH0/h;Lz0/m;I)V` (composable: recebe
  `H0/h` = `Composer`), em `classes.dex` off 246.
* **Por que aparecia no scan antigo**: as 4 refs eram
  `WindowInsetsController.setSystemBarsAppearance(II)V` (offsets 206/215/253/262) — já
  redirecionadas para `app/morphe/extension/applemusic/WindowInsetsControllerCompat` no backport
  anterior. Ela **não** chama `getWindowInsetsController()`, `show()` nem `hide()`.
* Refs `since > 28` restantes em `w0/q2` no APK patcheado: **0**.
* Glance (`androidx.glance.appwidget`) só aparece nas activities de configuração de widget
  (`activity_table.md:21-22`) e não tem relação com `q2`.

**Veredito: sem vetor de crash.** (A premissa "w0/q2 tem 4 refs a getWindowInsetsController" do
enunciado não se confirma: as 4 refs de `q2` eram `setSystemBarsAppearance`, já cobertas.)

---

## 6. Por que `Af/h`/`Af/i` e o material `SearchView` estão mortos

* `Af/h`/`Af/i` são Runnables **de origens diferentes que o R8 fundiu no mesmo molde** (material
  SearchView + `SoftwareKeyboardController.Impl20` + profileinstaller + ripple do `v0/g`): o campo
  `int` do ctor seleciona o `switch`. O `switch`:

```java
// Af/h.java:30-55
case 0:  SearchView sv = (SearchView) obj; ... W wC = E.j.c(editText); ... aVar.f82859a.show(0);
case 1:  threadpool/ profileinstaller
default: ((InputMethodManager) view.getContext().getSystemService("input_method")).showSoftInput(view, 0);
```
* O **case 0** só é passado por `SearchView.i()` (`new h(this, 0)`, `SearchView.java:505`) e por
  `SearchView.f()` (`new i(this, 0)`, `SearchView.java:445`). O `x2/v$a.b()` (fallback Impl20)
  passa literal `2` — cai no `default` (`showSoftInput`), é safe em API 29.
* `com.google.android.material.search.SearchView` / `SearchBar`:
  * **0** `new-instance` nos 6 dex (`trace types` retorna só `check-cast`/`instance-of` dos
    próprios `Af/*` e de `SearchView$Behavior`);
  * **0** referências em layouts (`res/layout/**` não tem `material.search.*`; só existe a string
    `searchbar_scrolling_view_behavior` em `strings.xml:2300`, não usada por nenhum layout);
  * o "search" do app é `com.apple.android.music.common.views.CustomSearchView extends
    androidx.appcompat.widget.SearchView` (appcompat clássico, `collection_search_layout.xml:32`,
    `emojikeyboard_layout.xml:8`), que não toca `WindowInsetsController` (0 refs no scan).

**Veredito: UNREACHABLE** para `Af/h`, `Af/i` e, por consequência, para `x2/E$j.c`.

---

## 7. Alvo 5 — outros `since>28` em `com/apple/**`

O APK patcheado tem **100** refs `since>28` com caller em `com/apple/**` (contra 109 do APK
original, `analysis/api-levels.md` §1.3):

| since | refs | métodos | situação |
|---|---|---|---|
| 29 | 80 | 26 | **seguros**: o minSdk é 29 (`m1.<clinit>`/`FontStyle`, `Resources.getFloat`, `startForeground(int,Notification,int)`, `setNavigationBarContrastEnforced`, …) |
| 30 | 14 | 7 | todos cobertos — ver tabela abaixo |
| 33 | 6 | 6 | bridges do R8 (`utils/X`, `Y`, `Z`, `a0`, `pushnotifications/fragment/a`, `player/e1`) com guarda `>= 33` no chamador real (`api-levels.md` §1.3, tabela de API 33). O único que `api-levels.md` §1.5 deixava **UNVERIFIED** — `player/e1` (`BitmapShader.setFilterMode`, API 33) — foi verificado agora por dexdump: o chamador real é `player/d1$b.resize(II)` (`ShaderFactory` do blur do player) e tem guarda `sget SDK_INT / const 33 / if-ge → +5` antes da chamada (`classes2.dex code_off=0x504498`, offs 76-82) |

Métodos `com/apple/**` com ref `since=30` (14 refs):

| método | alvo | cobertura |
|---|---|---|
| `NewPlaylistFragment.openKeyboardForTitle` | `WindowInsetsController.show(I)` | **guarda no topo** (patch do backport, §3) — `classes5.dex 0x203d4`, off 0-6 |
| `EmojiSearchFragment$a.onGlobalLayout` | `Window.setDecorFitsSystemWindows` | **guarda no topo** (patch do emoji) |
| `common.views.O.onApplyWindowInsets` (6 refs) | `WindowInsets.Type.ime/navigationBars`, `isVisible`, `getInsets` | **por tabela**: `O` só é instanciado em `EmojiSearchFragment$a.onGlobalLayout` off 53 (`trace types`: 1 site), que retorna antes de `setOnApplyWindowInsetsListener` em API < 30 |
| `FullScreenVideoActivity.onCreate` | `WindowInsetsController.hide(I)` | **guarda** §3 |
| `com.apple.android.music.f.invokeSuspend` (2 refs) | `PackageManager.getInstallSourceInfo`, `InstallSourceInfo.getInstallingPackageName` | `catch (Throwable)` do `C4182g.java:38` (`NoSuchMethodError` é `Error`) — análise anterior, não re-testada em runtime |
| `utils.g$a.onClick` (2 refs) | idem acima | **verificado por dexdump**: a chamada (off `0x0024`) está na faixa `try 0x001c-0x002c`, handler `<any>` em `0x002d` que faz `const/4 v4, 0` e segue (engole `NoSuchMethodError`) — `classes3.dex` |
| `player.fragment.PlayerMainFragment$e.getOutline` | `Outline.setPath` | **guardado**: `PlayerMainFragment.java:247` (`if (!zIsTablet \|\| SDK_INT < 33) setRoundRect ... else setPath`) — e o patch de tablet força `TABLET`, então em API 29 cai no `setRoundRect` |

Nenhum outro `since>28` de `com/apple/**` ficou de fora dos helpers (`ObjectsCompat`,
`ListCompat`, `WifiInfoCompat`, `WindowInsetsControllerCompat`): as refs a
`Objects.requireNonNullElse*` e `List.of` são **0** no APK, e as 5 refs a
`WifiInfo.getWifiStandard`/`WindowInsetsController.*Appearance`/`Behavior` que restam são todas do
wrapper D8 `app/morphe/extension/applemusic/ObjectsCompat$$ExternalSyntheticApiModelOutline0`
(só executam com controller ≠ nulo, isto é, API 30+).

Observação sobre o scan: o total continua **1.237** depois deste patch. Isso é esperado — as
guardas são desvios de fluxo (`if`), não remoção da referência; só os *redirects* para helpers
reduzem a contagem (1.279 → 1.237).

---

## 8. Correção aplicada (o único patch desta rodada)

### 8.1 Decisão

O caminho do Compose (§2.2) é o único que não pôde ser provado morto: a chamada é comprovadamente
sem guarda e o objeto que a dispara é criado por **todo** `ComposeView` do app
(`AndroidComposeView.<init>` → `E1/Q` → `E1/s` → `new SoftwareKeyboardControllerCompat(view)`),
com a stack de texto do Compose compilada no APK. O app **não** tem call site próprio desse
método para guardar (o único é `NewPlaylistFragment`, já guardado), então a guarda foi no ponto
mínimo de biblioteca — mesmo padrão que o patch já usa em `x2/W$a`/`x2/W.a/b/c`.

### 8.2 Diff (`patches/src/main/kotlin/app/morphe/patches/applemusic/dilink/AppleMusicDiLinkPatch.kt`)

```kotlin
private const val V_IMPL20 = "Lx2/v\$a;"   // SoftwareKeyboardControllerCompat.Impl20

internal object SoftwareKeyboardHideFingerprint : Fingerprint(
    definingClass = "Lx2/v\$b;", name = "a", parameters = emptyList(), returnType = "V",
)
internal object SoftwareKeyboardShowFingerprint : Fingerprint(
    definingClass = "Lx2/v\$b;", name = "b", parameters = emptyList(), returnType = "V",
)
...
// no execute {}, depois do bloco do FullScreenVideoActivity:
for ((fingerprint, impl20Method) in listOf(SoftwareKeyboardHideFingerprint to "a", SoftwareKeyboardShowFingerprint to "b")) {
    fingerprint.method.apply {
        val method = implementation ?: error("$impl20Method has no implementation")
        val self = "v${method.registerCount - 1}"          // a(): 6 regs -> v5 ; b(): 4 regs -> v3
        addInstructionsWithLabels(0, """
            sget v0, $SDK_INT
            invoke-static {v0}, $INSETS_COMPAT->isAtLeast30(I)Z
            move-result v0
            if-nez v0, :legacy
            goto :supported
            :legacy
            invoke-super {$self}, $V_IMPL20->$impl20Method()V
            return-void
        """, ExternalLabel("supported", getInstruction(0)))
    }
}
```

Sem `check-cast` para tipo ausente: a guarda só usa `int` + chamada estática pura
(`isAtLeast30`), e o caminho legado é `invoke-super` para `Impl20` (`InputMethodManager`).
Em API ≥ 30 o fluxo é o original, instrução por instrução.

### 8.3 Build

```
$env:JAVA_HOME="C:\Users\anderson\.jdks\jdk-21.0.11+10"; $env:GRADLE_USER_HOME="$PWD\.gradle-user"
$env:GITHUB_ACTOR="andersonlucasg3"; $env:GITHUB_TOKEN=$(gh auth token)
.\gradlew.bat :patches:build :patches:buildAndroid :patches:generatePatchesList "-Pkotlin.compiler.execution.strategy=in-process"
```
→ `BUILD SUCCESSFUL in 6s` / 31 tasks.

### 8.4 Aplicação + `--validate`

```
java -jar tools\morphe-desktop-1.20.0-all.jar patch -p patches\build\libs\patches-1.0.0.mpp \
  -o .pipeline\out.apk --validate --force apks\apple-music-7.0.0\AppleMusic_7.0.0_apkpure.xapk
```
```
INFO: Applied: Apple Music DiLink support
INFO: Changed 25 of 42846 classes to mutable
INFO: Wrote 1 dex files to ...\newDex
INFO: Saved to ...\.pipeline\out.apk
exit=0      (nenhum erro de validação)
```

### 8.5 dexdump do método alterado (`classes5.dex`)

```
027cc8:                                        |[027cc8] x2.v$b.a:()V          (registers=6, ins=1)
027cd8: 6000 7f00                              |0000: sget v0, Landroid/os/Build$VERSION;.SDK_INT:I
027cdc: 7110 d001 0000                         |0002: invoke-static {v0}, Lapp/morphe/extension/applemusic/WindowInsetsControllerCompat;.isAtLeast30:(I)Z
027ce2: 0a00                                   |0005: move-result v0
027ce4: 3900 0300                              |0006: if-nez v0, 0009 // +0003
027ce8: 2805                                   |0008: goto 000d // +0005
027cea: 6f10 7005 0500                         |0009: invoke-super {v5}, Lx2/v$a;.a:()V
027cf0: 0e00                                   |000c: return-void
027cf2: 5450 0202                              |000d: iget-object v0, v5, Lx2/v$b;.b:Landroid/view/View;   <-- corpo original a partir daqui
...
027d04: 6e10 5d01 0000                         |0016: invoke-virtual {v0}, Landroid/view/View;.getWindowInsetsController:()Landroid/view/WindowInsetsController;
...
027d74: 7220 8601 5100                         |004e: invoke-interface {v1, v5}, Landroid/view/WindowInsetsController;.hide:(I)V
```

```
027d84:                                        |[027d84] x2.v$b.b:()V          (registers=4, ins=1)
027d94: 6000 7f00                              |0000: sget v0, Landroid/os/Build$VERSION;.SDK_INT:I
027d98: 7110 d001 0000                         |0002: invoke-static {v0}, ...WindowInsetsControllerCompat;.isAtLeast30:(I)Z
027d9e: 0a00                                   |0005: move-result v0
027da0: 3900 0300                              |0006: if-nez v0, 0009 // +0003
027da4: 2805                                   |0008: goto 000d // +0005
027da6: 6f10 7105 0300                         |0009: invoke-super {v3}, Lx2/v$a;.b:()V
027dac: 0e00                                   |000c: return-void
027dae: 5430 0202                              |000d: iget-object v0, v3, Lx2/v$b;.b:Landroid/view/View;   <-- corpo original
...
027db6: 6001 7f00                              |0011: sget v1, ...SDK_INT:I        (guard original de SDK < 33 preservado)
```

`x2/W$a;-><init>(Window, Lx2/v;)` continua guardado (`0x27900`), então o patch anterior não regrediu.

### 8.6 Badging

```
package: name='com.apple.android.music' versionCode='1614' versionName='7.0.0'
minSdkVersion:'29'
targetSdkVersion:'36'
compileSdkVersion='36'
```

---

## 9. Risco residual (honesto)

| # | Risco | Nível | O que falta / observação |
|---|---|---|---|
| 1 | **Compose**: o elo `BasicTextField` → `E1/Q.f()/d()/a()/b()` → `v$b` não foi provado. A guarda em `v$b` neutraliza o crash **se** ele existir, mas o gatilho é **UNVERIFIED** | baixo (após a guarda) | faltaria: (a) rodar em device API 29 e focar um campo de texto Compose; ou (b) identificar a composable do app que instancia `BasicTextField` (os nomes estão ofuscados: `w0/*`, `b0/*`, `p1/*`) — com logcat bastaria ver se `WindowInsetsControllerCompat`/`SoftKeyboard` é tocado. **Nada disso é possível sem device** |
| 2 | `x2/E$j.c` (`ViewCompat.getWindowInsetsController`) segue **sem guarda**. Hoje é morto porque não há material `SearchView` | baixo, latente | se qualquer tela futura inflar `com.google.android.material.search.SearchView`/`SearchBar`, o crash volta (no `E$j.c`, antes até de `Af/h`). Correção de 1 linha disponível (retornar `null` em SDK < 30, como o androidx original faz) — **não aplicada** por ser caminho não alcançável hoje |
| 3 | `androidx/preference/a$a` segue **sem guarda** | baixo, latente | volta se algum `EditTextPreference` for inflado (ex.: se `debug_settings_preference.xml` passar a ser carregado) |
| 4 | Análise estática, sem runtime | médio | os `NoSuchMethodError` são inferidos de `api-versions.xml`; nenhum crash foi observado. Não há device/emulador nesta sessão |
| 5 | Dispatch virtual aproximado; reflexão/JNI/DataBinding/Epoxy não cobertos pelo parser | baixo | `DolbyAtmosSettingsFragment` usa `Preference.c` (callback por interface) e é chamado pelo adapter genérico — irrelevante para os alvos acima (não há ref de API 30 nesses caminhos) |
| 6 | 3 métodos não decodificam (0,0015%) | baixo | `LZ2/Y.<clinit>`, `Attributes$$serializer.deserialize`, `Attributes.<init>` — sem relação com insets ou teclado |

---

## 10. Artefatos desta análise

| Arquivo | Conteúdo |
|---|---|
| `.pipeline/api-scan/trace.py` | parser DEX + grafo reverso (`build`, `refs`, `up`, `types`, `dump`, `dumpm`, `classes`) |
| `.pipeline/api-scan/callgraph.pkl` | cache do grafo (126.667 alvos de `invoke`, 210.824 corpos, 37.983 refs de tipo) |
| `.pipeline/patched/classes5.dump` | dexdump do dex alterado (contém `x2/v$b` e as guardas) |
| `.pipeline/patched/classes3.dump` | dexdump usado no `try/catch` de `utils.g$a.onClick` |
| `.pipeline/api-scan/dex_refs_patched.jsonl` | 1.237 achados `since>28` do APK patcheado (regerado após este patch) |

---

## 11. Novos pontos encontrados em 2026-11-05 (login)

| Ponto | Onde | Correção |
|---|---|---|
| `IBinder.getSuggestedMaxIpcSizeBytes()` (API 30, estático) | `p507z3.C7059k.<clinit>` (usado por `FPDILicenseRequest`) | redirecionado para `PlatformCompat.getSuggestedMaxIpcSizeBytes()` (1 MiB) |
| `libCoreADI` `-45061` | provisioning Anisette/ADI nativo | **não é API 30**: a lib importa só `libc`/`libdl`; o erro é estado local. Continua em aberto |
| JS ES2020 da Apple | `appleid.cdn-apple.com` / chunks `appleauth` | assets transpilados no build e servidos por `shouldInterceptRequest` (ver `DilinkWebAssetsPatch`) |
