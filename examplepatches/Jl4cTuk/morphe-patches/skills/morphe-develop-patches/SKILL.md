---
name: morphe-develop-patches
description: >-
  Разработка, исправление и миграция Morphe patches в repository
  morphe-patches: Kotlin patch code, fingerprints, compatibility metadata,
  options, build, apply validation и подготовка staged changes. Использовать
  при добавлении новой пользовательской функции, починке patches после
  обновления APK/R8, изменении существующего patch или подготовке изменения к
  commit review. Анализ APK выполнять через repo-local morphe-analyze-apk, без
  mobile-rasp-* skills.
---

# Разработка Morphe patches

## Начать безопасно

1. Полностью прочитать repository `AGENTS.md`.
2. Убедиться, что работа ведётся на `dev`.
3. Проверить `git status`, текущий staged set и divergence с `origin/dev`.
4. Сохранить пользовательские изменения. Не делать `reset`, `checkout --`,
   stash или очистку без явного запроса.
5. Отделить текущую задачу от уже staged изменений.

Если target ещё не доказан, использовать `$morphe-analyze-apk`. Не подключать
RASP skills для стандартной разработки Morphe.

## Использовать официальную Morphe документацию

Для API и examples сверяться с:

- `morphe-patcher/docs/1_patcher_intro.md`;
- `morphe-patcher/docs/2_2_1_fingerprinting.md`;
- `MorpheApp/morphe-documentation`.

При изменяемой API surface проверять актуальные official sources. Не выводить
несуществующие Fingerprint helpers из памяти.

## Организовать patch

Следовать существующей структуре:

```text
patches/src/main/kotlin/app/template/patches/<app>/<feature>/
├── Fingerprints.kt
└── <PatchName>Patch.kt
```

Хранить package/version compatibility в `<app>/shared/Constants.kt`. Не
расширять compatibility на новую версию до успешного build и apply validation.

Один patch должен иметь ясный user-facing scope. Если несколько UI symptoms
имеют общую upstream initialization/provider точку, отключать её один раз,
вместо накопления несвязанных downstream hooks.

## Проектировать fingerprints

Использовать минимальный набор стабильных constraints:

- exact non-obfuscated class/method names;
- semantic strings и analytics events;
- field access или method call;
- superclass/interface;
- return type и parameter shape;
- class-level fingerprint с последующим method search.

Не hardcode short R8 names и descriptors, если они обфусцированы. Для
obfuscated object parameters использовать `"L"`. Pure opcode patterns
использовать только когда semantic anchors отсутствуют.

Требовать unique match и fail closed. Optional match допустим только если
target действительно optional для заявленной compatibility.

## Вносить bytecode changes

Проверить исходный smali перед injection:

- корректный return opcode для return type;
- доступные registers и wide values;
- instance/static method semantics;
- constructor state;
- multiple modifications одного method.

Для раннего return можно безопасно переиспользовать parameter register только
если исходные parameters больше не нужны. При нескольких edits применять их от
последнего instruction index к первому либо обновлять match.

Предпочитать штатный disabled/no-op object приложения, feature gate или DI
provider. Это обычно безопаснее, чем создавать partial state или скрывать уже
созданный View.

Изменять файлы через `apply_patch`. Не форматировать и не переписывать
несвязанный код.

## Фиксировать неудачные patch targets

Перед porting или повторной починкой patch найти относящиеся к app/feature
записи в [`references/failed-attempts.md`](references/failed-attempts.md).

Если patch успешно собрался и применился, но runtime behavior не изменился,
либо target пришлось удалить после проверки:

1. Добавить запись в этот журнал.
2. Указать app/version, пользовательскую цель, использованные classes/methods,
   наблюдение и runtime/static evidence.
3. Отделить подтверждённую причину от theory.
4. Указать replacement или следующий target и validation status.
5. Удалить неработающий production code, если он больше не нужен. Не хранить
   dead hooks только как историческую справку.

Журнал нужен для porting и не заменяет актуальный patch code.

## Не редактировать generated files

Не менять вручную:

- `patches-list.json`;
- `patches-bundle.json`;
- `CHANGELOG.md`;
- generated patch-list block в `README.md`.

Эти файлы обновляет release workflow.

## Проверить изменение

Минимум:

```bash
git diff --check
./gradlew buildAndroid
```

Build output находится в `patches/build/libs/patches-*.mpp`.

После build отдельно проверить, что нужный patch применяется к оригинальному
APK. Не путать apply validation с installation/runtime validation. Device
root-mount выполнять через `$morphe-test-on-pixel` и только в разрешённом
пользователем scope.

Для version migration проверить все patches целевого app, а не только
изменённый patch. Сохранить per-patch results и не объявлять compatibility,
если обязательный patch падает.

## Подготовить review checkpoint

После implementation:

1. Проверить полный diff и `git diff --check`.
2. Stage только файлы текущего изменения, сохранив уже согласованный staged set.
3. Проверить полный staged diff и status внутренне.
4. Предложить semantic commit message.
5. Остановиться для пользовательского review.

Не выполнять commit или push в тот же turn. Не перечислять staged files или
diff, если пользователь этого не просил.
