# Дослідження: Lyrics blur у Spotify 9.2.4.2644

**Мета:** розмивати неактивні рядки lyrics; активний лишати різким. Розмиття — плавне (tween 200 мс, 0↔12 px).
**Ціль:** Spotify Android 9.2.4.2644 (APKM) · Morphe · southstar21-patches v1.4.0 (`30af566`)
**Дата аудиту:** 2026-11-27
**Статус:** код рев'юнуто, синтаксис валідовано, API звірено з пінами апстріму. На пристрої не перевірено.
**Оновлення 2026-11-27 (вечер):** повний статичний розбір APKM 9.2.4.2644 (androguard, 848 інструкцій `ksh0.a`, CFG) — розділи 1, 3, 6, 7 оновлено. Виправлено критичний регістровий баг (`p1` — reference, не boolean).

---

## 1. Механізм

- Екран lyrics = Jetpack Compose, обфускація в `p.*`.
- Один рядок = `p.ksh0.a(...)` (composable). Порядок і типорозкид параметрів — розділ 3.
- Вставка перед якорем `p.mtc1.f(v0, 1.0f)` (виклик типу `Modifier.fillMaxWidth(1f)`):
  `v0 := p.lxs1.k(v0, LyricsBlurPatch.shouldBlur(p1, p2))`
- `p.lxs1.k(Modifier, Z)` = `composed(modifier, ix70(1, flag))`; всередині — animated blur
  (tween 200 мс, 0↔12 px); no-op на API < 31.
- `ksh0.a` викликають `kk1.I` (classes4 — items-content lambda lazy-list lyrics), `dsh0.invoke`
  (classes9, службова restart-lambda) та `f0o.h` (classes11). А `p.ksh0.b(...)` —
  translate-обгортка (translationCrossfade між оригіналом і перекладом рядка) зі **своїм** викликом
  `p.mtc1.f` (v1, 1.0f); можливо, саме `b` рендерить повноекранний lyrics-екран (на скріншоті користувача
  видно кнопку «Перекласти»). Який саме з двох composable реально малює рядок — відкрите питання;
  діагностичний білд логує обидва (розділ 11).
- **Тіло `ksh0.a` compose-skippable**: інструкція 186 `if-eqz v2` → перехід на 820 (шлях без content),
  коли `sw50.Y(bits, force)` повертає 0 («нічого не змінилося»). Це єдиний обхід якоря (616) крім
  недосяжних NoWhenBranch-виходів (449/493/813–819; `p.af.n()` = `NoWhenBranchMatchedException`).
  Тобто якір виконується лише при реальному перекомпонуванні рядка (напр., перехід активного рядка),
  не на кожному recomposition. Маркери `anchor`/`bAnchor` + toggle `entry` відрізняють ці випадки.
- Вставка — до якоря (`addInstructions(index, …)`), тож якір споживає вже розмитий `v0`.

## 2. Якорі (smali, JADX → Smali view)

| Об'єкт | Роль |
|---|---|
| `p.ksh0.a` | composable рядка lyrics — ціль патчу |
| `p.lxs1.k` (`lp/lxs1;->k(Lp/xzo0;Z)Lp/xzo0;`) | готовий animated blur modifier |
| `p.mtc1.f` (`Lp/mtc1;->f(Lp/xzo0;F)Lp/xzo0;`) | якір вставки; перевірити на кількість (1) і регістри (v0, v15) |
| `p.ix70` (case `a=1`) | реалізація 12 px/200 мс blur, API ≥ 31 |
| `p.ksh0.<clinit>` (`LyricsLineActive`) | підтвердження, що клас — рядок lyrics |
| JADX text search | `lyrics line scale` |

## 3. Регістри `ksh0.a`

- `.registers 80`, `ins 18` (static) → smali `pN` 0-based: `p0..p17` = `v62..v79`.
- `p0` = `v62` = `psh0` (**reference**), `p1` = `v63` (Z), `p2` = `v64` (Z), `p3` = `v65` (F).
- **`p1` = `v63` — це перший Z-параметр**; вставка передає лише `{ p1 .. p2 }` (обидва Z).
  В оригінальній версії патчу діапазон був той самий — валідний; плутанина була лише в нотатках.
- `p1` (`v63`) — за аналізом виклику (`kk1.I @346`: `sit1.v(mzh0, index)`) = «цей рядок — активний»
  (для `izh0`/`lzh0`: `index == activeIndex`; для `kzh0`/`jzh0`: завжди true).
- `p2` (`v64`) — `tzh0.b ← czh0.i` — семантика статично не встановлена (презумпція: прапор
  synced-режиму, бо `tzh0` будується лише у гілці `byh0` = synced-lyrics).
- `p6` (Modifier) у методі = `v0` до якіра.
- `v2` — тимчасовий: наступна після якоря `iget v2, …psh0->a` перезаписує його до першого читання;
  наші `move-result v2` → `invoke-static {v0, v2}` виконуються до того.
- `v63`/`v64` — виключно джерела (ніде не перезаписуються до якірного місця) — безпечно читати на якорі.
- `pN` у вставленому smali розв'язує `InlineSmaliCompiler` справжнім ANTLR-парсером smali
  за `registerCount` і параметрами цільового методу.
- Вставлений блок:
  ```smali
  invoke-static/range { p1 .. p2 }, Lapp/southstar21/extension/spotify/lyricsblur/LyricsBlurPatch;->shouldBlur(ZZ)Z
  move-result v2
  invoke-static { v0, v2 }, Lp/lxs1;->k(Lp/xzo0;Z)Lp/xzo0;
  move-result-object v0
  ```
- Якір: 848 інструкцій (androguard), 16→186 — побудова бітмаску recomposition-флагів,
  186 `if-eqz v2 → 820` — **skip-шлях** (тіло не виконується, `dsh0` перевикористовується замість
  повторного виклику `vy7.b`); 590–616 — `“lyrics line color”` → `mtc1.f` (якір),
  612 `const/high16 v15, 1065353216` (1.0f).
- `sw50.Y(I Z)Z` (classes.dex): біт-0 аргумента ≠ 0 → `return 1` (перекомпонувати); інакше перевірка
  стану Composer (`sw50#S/#y/#P/#D/#b`), біти `qd41.b` 1/512 → `return 1`; інакше нотифікація
  спостерігачів і `return 0` (**пропустити тіло**). У skip-шляху на 820 будується лише `dsh0`
  (повторне використання слота composable), без жодного `mtc1.f` → якір не досягається.
- Callers `ksh0.a`: `kk1.I` (classes4, items-content lambda lyric-lazy-list),
  `dsh0.invoke` (classes9, synthetic restart-lambda), `f0o.h` (classes11).
- `p.ksh0.b` (translate-обгортка): 161 інструкція; власний `if` на skip (~67 → 144), власний якір
  `mtc1.f` @119 з регістрами `v1`/`v2` (1.0f); параметри `pN` 0-based: `p5`=`v17` (Z), `p6`=`v18` (Z).

## 4. Файли патчу

| Файл | Призначення |
|---|---|
| `extensions/…/lyricsblur/LyricsBlurPatch.java` | `shouldBlur(active, synced)`: API≥31 ∧ `requireSynced ? synced : 1` ∧ `!active`; `catch Throwable → false`. Плюс не використовуваний Compose-патчем View-шлях (`setViewBlur`) |
| `patches/…/lyricsblur/LyricsBlurPatch.kt` | `bytecodePatch("Lyrics blur", default = true)`; опції `requireSynced` (true), `debugLogging` (false); перевірка якоря (1 виклик, v0/v15); `dependsOn(spotifySharedExtensionPatch)` |
| `patches/…/lyricsblur/LyricsBlurFingerprints.kt` | `LyricsLineFingerprint`: `Lp/ksh0;->a`, `public static final`, 18 параметрів, returnType V |

`SpotifyHooks` не потрібен (виклик extension — прямо зі smali). `isIncluded()` не потрібен.

## 5. Перевірено (read-only аудит, без збірки)

Піни апстріму: morphe-patcher `v2.4.0` (`0aed87c`, з `libs.versions.toml`) · main `v2.6.0` (`0ddca86`) ·
smali `pin/4220ae75f7` (`4220ae7`, jitpack-піна) · morphe-patches-gradle-plugin main (`855f27f`).

| # | Перевірка | Джерело | Результат |
|---|---|---|---|
| 1 | `bytecodePatch/booleanOption/dependsOn/compatibleWith` — існують, сигнатури збігаються | morphe-patcher `v2.4.0` `Patch.kt:861`, `Option.kt:312` | OK |
| 2 | `Fingerprint(definingClass, name, accessFlags, returnType, parameters)`; `Fingerprint.method` → `PatchException` якщо немає збігу | `Fingerprint.kt:2484` (v2.4.0) і main | OK |
| 3 | `InstructionExtensions.addInstructions(Int, String)` на `MutableMethod` | `InstructionExtensions.kt:143` | OK |
| 4 | `Opcode.INVOKE_STATIC` (0x71, 35c); 35c = `FiveRegisterInstruction`+`ReferenceInstruction`; `registerC/D` = 1-й/2-й аргументи (low/high nibble 4-го байта) | smali `pin/4220ae75f7`, `DexBackedInstruction35c` | OK |
| 5 | `DexFormatter.INSTANCE.getMethodDescriptor` ≡ `ReferenceUtil.getMethodDescriptor` (`class->name(params)return`) | `DexFormattedWriter.java:81-91` | OK; `ReferenceUtil` deprecated → замінено |
| 6 | `accessFlags`-fingerprint порівнює УСІ біти (`accessFlagsMask = -1`; `(method.accessFlags and mask) != value → null`) | `Fingerprint.kt:1181`, `:1622` | OK, але тендітно — розділ 7 |
| 7 | Extension: `compileSdk=36`, `minSdk=23` ⇒ `VERSION_CODES.S`, `RenderEffect` доступні; `@SuppressLint("NewApi")` + `SDK_INT >= S` — патерн як в upstream (`EdgeBlurView.java`) | ExtensionPlugin.kt:57-60 | OK |
| 8 | Колізії імен (`spotifyLyricsBlurPatch`), issues/PR «lyrics»/«blur» в upstream — відсутні | GitHub search 2026-11-27 | OK |
| 9 | `patches-list.json`, `CHANGELOG.md` — автогенеруються (semantic-release), руками не редагувати | upstream repo root | OK |
| 10 | Синтаксис Kotlin (обидва файли): WASM-парсер `kotlin-parser` 0.0.12, error nodes = 0 | локальний прогін | OK |
| 11 | Синтаксис Java: `java-parser` 3.0.1 (chevrotain) | локальний прогін | OK |
| 12 | `INLINE`-вставка smali компілюється реальним smali-парсером, регістри `pN` розв'язуються за контекстом цільового методу | `InlineSmaliCompiler.kt` | OK |

## 6. Не перевірено (потрібні APK і/або пристрій)

- Smali-якорі, регістри (`.registers 80`, `ins=18`, `v0/v15`, `p1/p2`), `.access flags` —
  тільки з аналізу автора в JADX + smali view. APK 9.2.4.2644 у середовищі немає.
- `./gradlew build` / `.mpp` — немає JDK, Android SDK, доступу до jitpack/google maven.
- Поведінка на пристрої: розмиття, tween, logcat, Now Playing/fullscreen, Android 12/13/17.

## 7. Рев'ю коду

| Знахідка | Рішення |
|---|---|
| `ReferenceUtil.getMethodDescriptor` — `@Deprecated` | Виправлено → `DexFormatter.INSTANCE.getMethodDescriptor` (вихідний рядок незмінний) |
| `accessFlags=[PUBLIC,STATIC,FINAL]` — exact-compare усіх бітів; зайвий `ACC_SYNTHETIC` → `PatchException` до запису APK | Залишено (автор бачив саме ці біти); тендітність задокументовано |
| `const/4 v0, 1/0` перед тілом `requireSynced()`/`debugLogging()`; оригінальне тіло стає недосяжним | OK (патерн upstream Liquid Glass) |
| `catch Throwable → false` в `shouldBlur` | OK |
| `patches-list.json`/`CHANGELOG.md` руками не редагувати | Дотримано (не чіпаємо) |

## 8. Режими відмови (усі безпечні: abort до запису APK або no-op)

| Симптом | Причина |
|---|---|
| `PatchException` (fingerprint miss) | інша збірка / інші `.access flags` |
| `expected one call …, found 0|2+` | якір змінився / виклик переїхав на `/range` |
| `uses vN, vM, expected v0, v15` | call site перекладено |
| `VerifyError` на відкритті lyrics | невірні регістри для цієї збірки |
| Android < 12 | no-op за дизайном |
| До/після пісні (активного рядка нема) | всі рядки розмиті при `synced=true` |

## 9. COMPATIBILITY_SPOTIFY (апстрім, стан на `30af566`)

`Constants.kt`: `AppTarget("9.2.0.2053")` + `AppTarget(version = null, isExperimental = true)` — catch-all.
⇒ Manager запропонує патч для 9.2.4.2644 як **experimental** і без змін.
⇒ Додати `AppTarget("9.2.4.2644")` = позначити версію перевіреною (1 рядок, див. `docs/integration.md`).

## 10. Prior art

- `southstar21dev/southstar21-patches` — ціль інтеграції; lyrics-патчу немає.
- `MorpheApp/morphe-patches` — lyrics-патчі лише YouTube Music (`extensions/music/…/lyrics/*`); Spotify відсутній.
- Spicetify — інша платформа (десктоп), не перетин.

## 11. Чекліст (скорочено)

1. Машина з JDK 17+ / Android SDK: `./gradlew build` (→ `.mpp`).
2. Morphe Manager → Spotify 9.2.4.2644 (APKM) → **Lyrics blur** (+ **Debug logging** для першого тесту) → Patch → Install.
3. `adb logcat -s LyricsBlur:D AndroidRuntime:E *:S` при відтворенні synced-пісні; очікуємо обидві комбінації active true/false.
4. fullscreen + Now Playing. Неактивні розмиті, активний різкий.
5. Реліз: `debugLogging` вимкнено (уже дефолт).
