---
name: morphe-analyze-apk
description: >-
  Статический анализ Android APK для разработки и миграции Morphe patches через
  JADX/JADX MCP: поиск patch targets, call chains, SDK initialization, Java/Kotlin
  и smali, проверка signatures и подбор устойчивых fingerprints при R8
  reobfuscation. Использовать при разборе новой версии APK, диагностике
  неприменившегося patch, поиске рекламы/попапов/feature flags и оценке
  совместимости patches. Для обычной Morphe-разработки не использовать
  mobile-rasp-* skills.
---

# Анализ APK для Morphe

## Границы

Вести обычный patch-oriented static analysis самостоятельно через JADX. Не
подключать `mobile-rasp-triage`, `mobile-rasp-static`,
`mobile-rasp-dynamic`, `mobile-lab-*` и другие RASP skills.

Анализировать native `.so` только в редком случае, когда целевая логика реально
находится в native code. Не искать RASP/anti-analysis механизмы без прямого
запроса пользователя.

## Выбрать правильный APK

1. Определить package name, version name и version code целевой версии.
2. Предпочитать оригинальный APK из
   `.local-apks/<app>/<version>/base.apk`.
3. Не считать `adb pull $(pm path ...)` оригиналом, если активен Morphe
   root-mount: такой path может возвращать уже patched APK.
4. Не анализировать patched output вместо оригинала, если задача касается
   совместимости или поиска исходного target.
5. Если рядом с APK есть `<apk>.jadx`, открывать project; иначе открывать APK.

## Работать через JADX

Использовать `jadx-gui` с активным JADX MCP. Java/Kotlin и smali смотреть через
`mcp__jadx` tools. Не заменять JADX массовой filesystem-декомпиляцией, `apktool`
или случайным `rg` по dump, когда JADX MCP доступен.

Перед анализом:

1. Проверить, какой APK открыт в текущей JADX session.
2. Если открыт другой APK, закрыть только созданную для задачи JADX session и
   открыть правильный input.
3. Проверить MCP лёгким orientation call.
4. Если MCP не отвечает, запустить `jadx-gui` с правильным input. Если это
   невозможно, попросить пользователя открыть APK в JADX-GUI.

## Найти target

Идти от наблюдаемого поведения к минимальной точке отключения:

1. Зафиксировать UI/behavior: экран, trigger, частоту, server-driven признаки,
   текст, icon, deeplink и lifecycle.
2. Проверить существующий patch и доказать, какую точку он уже меняет.
3. Искать stable anchors:
   - non-obfuscated package/class names;
   - Kotlin metadata и semantic method names;
   - stable strings, analytics events и feature flag names;
   - framework/domain method calls;
   - DTO/VO/state types;
   - superclass/interface;
   - return type и parameter shape.
4. Открыть candidate source, затем проверить smali, если decompile неполный,
   содержит unreachable blocks или сомнительные types.
5. Найти все альтернативные paths к одному UI: другие managers, mappers,
   providers, overloads, SDK hosts и server-selected variants.
6. Проследить initialization/call chain до безопасной upstream-точки.

Для server-driven текста не ожидать literal внутри APK. Искать DTO, renderer,
host, polling, listener, analytics event и navigation action.

## Разбирать SDK initialization

При подозрении на SDK:

1. Найти host/interface и реальную implementation.
2. Найти DI provider/factory и feature flag, выбирающий enabled/disabled mode.
3. Найти точку `init`, lazy initialization, polling/request scheduling и
   rendering container.
4. Проверить, есть ли штатная no-op/disabled implementation.
5. Предпочитать переключение на встроенный disabled mode вместо patch каждого
   popup или текста.
6. Отделить in-app UI channel от Android system notifications и других
   независимых subsystems.

## Устойчивость к R8

Не использовать короткие obfuscated class/method names как единственный anchor.
Для обфусцированных object types использовать wildcard `"L"` или не указывать
volatile parameters.

Предпочитать сочетание двух-трёх независимых semantic anchors. Fingerprint
должен давать ровно один target; при `0` или `>1` matches завершать patch с
понятной ошибкой, а не выбирать случайный method.

Non-obfuscated first-party class/method names можно использовать напрямую.
Generated Compose methods, coroutine inner classes и полностью obfuscated
signatures считать хрупкими targets; по возможности переносить patch на
ViewModel, repository, mapper, DI provider или feature gate.

## Редкий native path

Переходить к `.so` только при наличии evidence: `native` method,
`System.loadLibrary`, JNI bridge или target logic отсутствует в DEX.

Использовать IDA MCP/idalib для выбранной `arm64-v8a` library. Фиксировать
library, symbol/offset, referenced strings и call chain. Не подключать RASP
skills только из-за наличия `.so`.

## Результат анализа

Перед implementation выдать:

- подтверждённый target и точную signature;
- альтернативные paths, которые тоже требуется закрыть;
- почему выбранная точка безопаснее downstream UI patch;
- стабильные anchors для fingerprint;
- ожидаемый side effect и что patch намеренно не затрагивает;
- remaining uncertainty, которую можно проверить локальным apply/runtime test.
