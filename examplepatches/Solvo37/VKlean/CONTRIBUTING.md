# Contributing

Contributions приветствуются, особенно если они делают fingerprints и release pipeline устойчивее к новым версиям VK Видео.

## Что полезно

- обновление fingerprints под новую версию;
- замена хрупких R8-name fingerprints на semantic anchors;
- обновление ARM64 native signature-check pattern;
- исправления ad/privacy патчей с минимальным побочным эффектом;
- CI/release validation;
- документация и воспроизводимые bug reports.

## Правила совместимости

При обновлении VK Видео:

1. зафиксируйте `versionName` и `versionCode`;
2. проверьте package и оригинальный сертификат VK;
3. сравните bytecode/native call site со старой версией;
4. предпочитайте semantic fingerprints строкам и голым R8 class names;
5. каждый патч должен менять минимально необходимый участок;
6. native pattern должен быть уникальным; нельзя переносить raw offset вслепую;
7. соберите `.mpp` и реально примените его к APK;
8. проверьте запуск на реальном ARM64-устройстве;
9. обновите `docs/reverse-engineering-*.md`.

Не коммитьте proprietary APK VK Видео в репозиторий.

## Native patch safety

`Bypass native signature check` — обязательный patch для project-signed 1.163.

Изменение native-патча должно быть fail-closed:

- проверять ожидаемый byte pattern;
- требовать однозначное совпадение;
- падать с понятной ошибкой при несовместимости;
- не патчить неизвестную библиотеку по фиксированному offset без проверки содержимого.

## Build

Нужна Java 21.

```bash
export GITHUB_ACTOR="<github-user>"
export GITHUB_TOKEN="<token-with-read-packages>"
gradle :patches:buildAndroid
```

Результат:

```text
patches/build/libs/*.mpp
```

## Pull request

Укажите:

- версию и versionCode VK Видео;
- какой patch изменён;
- почему старый fingerprint/pattern больше не подходит;
- новый semantic/native anchor;
- результат CI;
- запускался ли итоговый APK;
- проверялась ли целевая функция (видео, реклама, update flow и т. д.).

Не смешивайте несвязанные изменения в одном PR.
