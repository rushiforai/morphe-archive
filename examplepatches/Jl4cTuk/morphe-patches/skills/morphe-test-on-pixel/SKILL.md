---
name: morphe-test-on-pixel
description: >-
  Локальная проверка Morphe patches на единственном пользовательском Android
  test device: Pixel_10a/stallion с ADB serial 65161XEA39KA85. Использовать для
  подготовки точной CLI command, build/apply validation, Morphe root-mount,
  remount, result JSON и ручного runtime test. Не использовать mobile-lab-* или
  mobile-rasp-* skills и не выполнять device-changing action, если пользователь
  просит только объяснение или команду.
---

# Локальный тест Morphe на Pixel

## Фиксированный device context

Всегда использовать:

```text
ADB serial: 65161XEA39KA85
model: Pixel_10a
device/codename: stallion
```

Не запускать device inventory и не подключать `mobile-lab-devices` или
`mobile-rasp-*`. Для Morphe root-mount считать Morphe CLI/Manager владельцем
mount lifecycle; не применять Magisk/KernelSU/APatch-specific команды без
отдельного запроса пользователя.

## Разделять подготовку и выполнение

Если пользователь просит «дай команду», подготовить exact copy-paste command,
но не запускать её.

Device-changing actions (`--install`, `--mount`, remount, force-stop) выполнять
только по явному запросу выполнить тест. Read-only проверки ADB допустимы в
рамках подготовки.

## Preflight

1. Проверить fixed Pixel:

   ```bash
   adb devices -l
   ```

2. Проверить наличие Morphe CLI JAR. Текущий известный path:

   ```text
   /tmp/morphe-desktop-1.12.0-all.jar
   ```

   Если JAR отсутствует, сообщить об этом. Не скачивать и не обновлять CLI без
   запроса.

3. Определить package name и exact target version.
4. Использовать оригинальный APK:

   ```text
   .local-apks/<app>/<version>/base.apk
   ```

5. Не использовать APK, pulled из mounted `base.apk`, и не брать output
   предыдущего patch run как новый source.

## Build

Выполнить из repository root:

```bash
./gradlew buildAndroid
```

После build определить exact MPP, созданный этим run, в
`patches/build/libs/`. Не выбирать stale bundle только по похожему имени и не
подставлять выдуманную version.

## Apply validation без device

Если требуется только проверить fingerprint/application, запускать Morphe CLI
без `--install` и `--mount`, сохранять output и `--result-file` в temporary
path. Это не подтверждает runtime behavior.

Не выполнять даже такой apply, если пользователь просит сначала только
объяснить workflow.

## Root-mount workflow

Для полного локального теста:

1. Собрать MPP.
2. Force-stop target package:

   ```bash
   adb -s 65161XEA39KA85 shell am force-stop <package>
   ```

3. Запустить CLI с exact absolute paths:

   ```bash
   java -jar /tmp/morphe-desktop-1.12.0-all.jar patch \
     -p <absolute-path-to-mpp> \
     --install=65161XEA39KA85 \
     --mount \
     --result-file=/tmp/<app>-patch-result.json \
     <absolute-path-to-original-apk>
   ```

4. Считать mount успешным только после:

   ```text
   INFO: Installing <package> by mounting
   INFO: Installed the patched APK file
   ```

5. После успешного mount предложить пользователю открыть app вручную. Не
   запускать app автоматически, если это не запрошено.

По умолчанию применять все compatible patches с `default = true`.
`--exclusive` и `--enable` использовать только для явно выбранного subset.
`--force` использовать только для намеренного version-compatibility test.

## Правила сохранности

- Не удалять original app: он нужен как mount target.
- Не очищать app data.
- Не выполнять обычный signed APK update поверх store signature.
- Не перезаписывать `/data/app/.../base.apk` вручную.
- Не выдавать target app root access.
- Не менять root-manager settings без прямой необходимости и разрешённого
  scope.

## Диагностика результата

Если patch не применился:

1. Прочитать `--result-file`.
2. Отделить fingerprint/apply failure от install/mount failure.
3. Перед повторным patching проверить exact APK version и MPP.

Если CLI сообщил successful mount, но app ведёт себя как original:

1. Force-stop app и выполнить Morphe remount/reapply.
2. Проверить, что процесс стартовал после mount.
3. Проверить mount visibility в root manager/Morphe Manager.
4. Только после этого менять fingerprints.

Если app падает:

1. Снять focused `logcat` для package/process.
2. Найти первый relevant exception и changed method.
3. Не маскировать crash повторным mount или очисткой данных.

## Handoff

Сообщать отдельно:

- build result;
- сколько patches applied/failed;
- output APK path;
- mount result;
- result JSON path;
- что осталось проверить вручную.
