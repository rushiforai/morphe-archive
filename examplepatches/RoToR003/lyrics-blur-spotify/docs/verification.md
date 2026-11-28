# Перевірка патчу через Morphe — покроково

Основний шлях — **Morphe Manager** на пристрої (саме застосунок, не CLI).
Опційний гейт без пристрою — §A (Morphe CLI; той самий патчер).
Рівні: **M1** збірка `.mpp` → **M2** джерело в Morphe → **M3** патч + встановлення → **M4** тести → **M5** діагностика.

Критерії приймання (усі обов'язкові):
1. `.mpp` зібраний; у `patches-list.json` є `Lyrics blur`.
2. Morphe: патч **успішно застосований** (немає екрана «Failed to apply Lyrics blur»).
3. Застосунок встановлюється і не падає; lyrics рендеряться.
4. Неактивні рядки розмиті, активний різкий; решта екранів незмінна.
5. Для релізу: `Debug logging` вимкнено.

---

## M0. Що потрібно

- Android-пристрій, **Android 12+** (нижче blur просто не вмикається).
- **Morphe Manager**: https://morphe.software або GitHub — `MorpheApp/morphe-manager/releases` (latest: `v2.8.0`, `morphe-manager-2.8.0.apk`; `.asc` — підпис).
- Spotify **9.2.4.2644** `.apkm` (APKMirror; version code звірте за ім'ям файлу).
- Джава 17+ для збірки `.mpp` (M1). Для лише-встановлення готового `.mpp` збірка не потрібна.
- `adb` (рекомендовано, для logcat) або термінал на ПК.

## M1. Збірка `.mpp`

Варіант 0 — **Remote source (автооновлення)**: цей репозиторій є повноцінним Morphe remote source —
додайте **сам репозиторій** (`https://github.com/RoToR003/lyrics-blur-spotify`) як джерело (див. M2, Спосіб C).
Morphe читає `patches-bundle.json` у корені main-гілки (CI оновлює його при кожній публікації) і тягне бандл з
rolling prerelease **[bundle-latest](https://github.com/RoToR003/lyrics-blur-spotify/releases/tag/bundle-latest)**
(стабільна назва файла — `patches.mpp`, ≈2.5 MB). Пряме посилання:
`https://github.com/RoToR003/lyrics-blur-spotify/releases/download/bundle-latest/patches.mpp`.

Варіант 0-bis — **локально з Releases**: той самий файл `patches.mpp`, додати вручну (M2, Спосіб A/B).
Оновлюється після кожної збірки на main і з ручного запуску workflow.

Варіант 0-bis — **з Actions цього репозиторію**: кожен пуш збирає bundle;
відкрити Actions → останній ЗЕЛЕНИЙ run "Build .mpp" → артефакт `lyrics-blur-spotify-mpp` → завантажити
(всередині кілька `patches-*.mpp`: беріть той, що без `-sources`/`-javadoc`;
workflow сам перевіряє, що `patches-list.json` містить `Lyrics blur`).

Варіант 1 — **локально** (потрібні JDK 21, Android SDK, GitHub-токен `read:packages`):
```
./scripts/build-mpp.sh
```
(скрипт клонує southstar21-patches, копіює цей патч, додає `AppTarget("9.2.4.2644")`, збирає; результат у `./out/`)

Варіант 2 — **вручну в апстрімі**: 3 файли за `docs/integration.md` +
```
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid --no-daemon
```
Очікуємо: `patches/build/libs/patches-<версія>.mpp`.

## M2. Додати джерело в Morphe (один раз)

**Спосіб A — через файловий менеджер (найпростіше):**
1. Перекинути `patches-<версія>.mpp` на телефон.
2. Відкрити його — Morphe запитає: нове джерело → «Add patch source» (довіряєте? → підтвердити);
   оновлення вже доданого джерела → «This is a new version of %s. Update it?».
3. Джерело з'являється у списку (`Sources` на головному екрані).

**Спосіб B — у застосунку:**
1. Morphe → **Sources** → **Add** → «Add patch source».
2. Обрати **Local** → «Select patch source files» → вказати `.mpp` (ім'я обов'язково `.mpp`).

**Спосіб C — Remote (URL самого репозиторію; автооновлення):**
1. Morphe → **Sources** → **Add** → **Remote**.
2. Вставити `https://github.com/RoToR003/lyrics-blur-spotify` (або відкрити deep-link
   `https://morphe.software/add-source?github=RoToR003/lyrics-blur-spotify` — Morphe запитає підтвердження).
3. Готово: Morphe сам читає `patches-bundle.json` з гілки `main` і тягне `patches.mpp` з rolling prerelease
   `bundle-latest`. Оновлення видно, коли змінюється `created_at`/`version` у цьому файлі — CI оновлює їх при
   кожній публікації, тому нові збірки підтягнуться автоматично. (Альтернатива для апстріму — якщо патч
   смерджать у southstar21-patches, там теж Remote source: `https://github.com/southstar21dev/southstar21-patches`.)
4. Зауважте: бандл **не підписаний** (немає `public_key` у `patches-bundle.json`) — підходить як і будь-який
   сторонній неофіційний source; довіра — на вас.

Після додавання переконайтесь:
- у списку з'явився **Spotify 9.2.4.2644** (після `AppTarget("9.2.4.2644")` — як перевірений таргет).
  Якщо `Constants.kt` не редагували, 9.2.4.2644 буде **experimental**: у налаштуваннях джерела
  увімкніть **Enable experimental app versions** («Shows and patches experimental app targets»).
- **Expert mode** (Settings → Patching → Expert mode) НЕ обов'язковий для одного джерела; потрібен
  лише для комбінації з іншими джерелами (як GmsCore для YouTube Music).
- Якщо джерело показує бейдж **Crashed**/**Blocked**/**Key changed** — патч не застосовуйте,
  збережіть текст з підказки і зупиніться.

## M3. Патч і встановлення

1. Видалити встановлений Spotify з Play Store (підпис після патчу інший — поруч не встануть).
2. Головний екран Morphe → **Spotify** → обрати файл APKM (9.2.4.2644).
3. Екран патчів: увімкнути **Lyrics blur**; для першого тесту також **Debug logging**.
   Опції (Options біля патча): **Only for synced lyrics** (дефолт ON), **Debug logging** (дефолт OFF).
4. Кнопка патчингу → «Applying patches» → очікуємо екран успіху → **Install**.
5. Якщо бачите **«Failed to apply Lyrics blur»** — текст помилки і є діагностикою (таблиця M5).
   Оригінальний Spotify при цьому незмінений.

## M4. Перевірка в застосунку

| # | Крок | Очікування |
|---|---|---|
| 1 | Synced-пісня, lyrics на весь екран | неактивні рядки розмиті; активний різкий |
| 2 | Now Playing → lyrics | те саме |
| 3 | Спостерігати 10–15 с | blur «перетікає» ~200 мс за активним рядком, без смикань |
| 4 | Seek у середину пісні | той самий активний рядок — різкий; решта — розмиті |
| 5 | До початку / після кінця | активного рядка нема → усі рядки розмиті (при `Only for synced lyrics` = ON) |
| 6 | Не-timed текст, опція ON (дефолт) | розмиття немає |
| 7 | Те саме, опція OFF → перепатчити | усі рядки розмиті |
| 8 | Home / Search / Library / Now Playing без lyrics | без змін |
| 9 | Скрол lyrics, свайпи | без ANR/фриза |
| 10 | `adb logcat -c` → `adb logcat -s LyricsBlur:D AndroidRuntime:E *:S` | є рядки `line hook: active=false …` і `active=true …` |
| 11 | Офлайн/скачаний контент, звичайні екрани | працюють як до патча |
| 12 | Повний перезапуск застосунку | стабільно |

Логкат має сенс лише при увімкненому **Debug logging**. Без adb — два канали (обидва активні лише з увімкненим прапорцем):
- **Toast**: при першому виклику хука і при кожній зміні комбінації показується короткий тост
  «LB: hook alive sdk=…» / «LB: active=… synced=…» (не більше 12 за запуск). Це найпростіший індикатор:
  якщо тости з'являються — хук працює; якщо нема — composable рядка не викликається;
- **Файл**: `Download/lyricsblur-debug.log` (Android 10+, MediaStore, дозволи не потрібні) —
  **один файл, перезаписується повністю при кожному записі**. Буфер ~6 000 символів з обрізкою по
  межах рядків; рядки `entry` / `anchor` / `bAnchor` пишуться **лише при зміні комбінації** (@#N —
  сумарний лічильник викликів), тож файл лишається малим і його можна надіслати одним вкладенням.
  Реалізація гарантує один файл: URI кешується в пам'яті на процес і зберігається в app
  SharedPreferences (виживає перезапуски, працює навіть якщо запит до Downloads повертає 0 рядків);
  раз за процес старі дублікати `lyricsblur-debug*` з попередніх збірок видаляються (лишається
  найновіший, він же перезаписується); новий файл створюється лише якщо нічого не знайдено;
- **Маркери та трекери патчу** (з увімкненим Debug logging):
  - `LB: enter ksh0.a` / `LB: enter ksh0.b` — один раз за запуск, при першому виклику відповідного composable рядка (`a` — основний, `b` — translate-обгортка з crossfade);
  - `entry @#N p1=… p2=…` — при зміні комбінації (або першому виклику), сире значення двох Z-параметрів метода `a` (`p1`→v63, `p2`→v64, без семантики);
  - `anchor p1=… p2=… @#N` — при зміні комбінації, тільки якщо контроль доходить до точки вставки blur у `a`;
  - `bAnchor p5=… p6=… @#N` — те саме для якоря у `b`;
  - `LB: b anchor regs != v1,v2` / `LB: b anchors=N` — shape метода `b` відрізняється від очікуваного (тоді b не інструментовано, крім enter).

  Як читати: немає `enter` зовсім → жоден з двох composable рядка не викликано (інший шлях/екран). Є `enter ksh0.a`, немає `anchor` — composable викликається, але Compose пропускає тіло (`sw50.Y(...)` == 0 → повторне використання слота dsh0); переходи активного рядка все одно мають дати `anchor`. Є `anchor` з ін'єкцією, а blur немає — дивитись значення `p1`/`p2` (можливо, переплутана семантика active/synced або blur-модифікатор не застосовується). `bAnchor` є, а `anchor` немає → рендерить `b` (translate-обгортка) → blur треба переносити туди.

## M5. Якщо «Failed to apply» / «не працює»

Де читати: екран результату патчу («Failed to apply %s» + details) → у `Sources` бейдж і підказка
джерела → `adb logcat`. Типові випадки:

| Симптом | Значення | Дія |
|---|---|---|
| `PatchException` … метод `Lp/ksh0;` не знайдено | fingerprint не зматчився (інша збірка / `.access flags` ≠ `public static final`) | надіслати `.access flags` і сигнатуру `ksh0.a` з JADX/smali саме цієї збірки |
| `expected one call …, found 0` / `>1` | якір `p.mtc1.f` змінився або переїхав на `/range` | повний smali `ksh0.a` |
| `uses vN, vM, expected v0, v15` | call site перекладено в інші регістри | повний smali `ksh0.a` |
| `VerifyError` при відкритті lyrics | інша регістрова схема | `FATAL EXCEPTION` + smali після патчу |
| Патч успішний, blur немає, логи `synced=false` | не-timed lyrics або невірна семантика p1/p2 | вимкнути «Only for synced lyrics»; якщо не допомогло — logcat + як виглядають lyrics |
| Blur є скрізь, включно з активним рядком | переплутано active/synced | logcat + smali `ksh0.a` (порядок операндів) |
| Джерело «Crashed»/«Blocked» | не та збірка `.mpp` або підроблений файл | перекачати `.mpp`, звірити sha256 з релізом |
| Не встановлюється поверх Play Store Spotify | різний підпис | видалити оригінал |

**Що надсилати при FAIL:** точні `version` + `version code` APKM · текст помилки з Morphe (скрін) ·
`adb logcat` з фільтром вище · smali `ksh0.a` до/після патчу · кроки відтворення.

## A. Опційний гейт без пристрою: Morphe CLI

Той самий патчер, що в Manager (CLI v2.2.0 = morphe-patcher 2.4.0). Використовуйте як CI-перевірку, не замість M3–M4.

```
gh release download v2.2.0 -R MorpheApp/morphe-cli -p '*-all.jar' -D .
mv morphe-desktop-2.2.0-all.jar morphe-cli.jar
java -jar morphe-cli.jar patch \
  -p patches/build/libs/patches-<версія>.mpp \
  -e "Lyrics blur" --continue-on-error \
  -r result.json -o spotify-patched.apk -t tmp/ \
  spotify_9.2.4.2644-*.apkm
jq '{success, applied: .appliedPatches, failed: [.failedPatches[].name]}' result.json
```
Прохід: `success=true`, `applied` містить `Lyrics blur`, `failed` порожній.
Глибокий чек: jadx → `ksh0.a` → перед `mtc1.f` стоять `invoke-static/range { p1 .. p2 } … shouldBlur(ZZ)Z` →
`move-result v2` → `invoke-static { v0, v2 }, Lp/lxs1;->k(Lp/xzo0;Z)Lp/xzo0;` → `move-result-object v0`.

## B. Перед релізом

- M2–M4 пройдені; **Debug logging вимкнено** (або перепатчити з дефолтом `false`).
- PR за конвенціями апстріму (`dev` ← гілка, `feat(Spotify): …`); `CHANGELOG.md`/`patches-list.json` не редагувати.
- У PR вказати version+code перевіреної збірки.
