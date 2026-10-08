# Настройка release signing

Этот файл намеренно не содержит приватных ключей или паролей.

## Required GitHub Actions secrets

```text
ANDROID_KEYSTORE_B64
ANDROID_KEYSTORE_PASSWORD
ANDROID_KEY_ALIAS
ANDROID_KEY_PASSWORD
```

`ANDROID_KEYSTORE_B64` содержит base64-представление постоянного keystore.

## Ожидаемый публичный сертификат

```text
D4:1F:49:2F:0E:2A:2E:39:90:AC:7F:8E:75:CC:5D:4B:
14:89:5F:7B:46:C0:B6:11:3B:78:82:C4:8A:A5:D4:0A
```

Проверка:

```bash
apksigner verify --verbose --print-certs VK-Video-*-patched.apk
```

## Текущая схема APK signing

Перед подписью APK проходит:

```text
zipalign -f -p 4
```

Затем:

```text
v1 = false
v2 = false
v3 = true
v4 = false
```

Эта схема соответствует проверенной рабочей сборке 1.163.

## Backup policy

Держите как минимум две офлайн-копии keystore и отдельно сохранённые credentials.

Если приватный ключ потерян, новый ключ не сможет обновлять уже установленные project APK. Пользователям придётся удалить приложение и установить заново.

Если ключ скомпрометирован, публикацию с ним нужно немедленно остановить и явно объявить migration. Никогда не коммитьте keystore, пароль или base64 keystore в Git, issue, Actions logs или release assets.

## Forks

Fork не получает secrets исходного репозитория. Для публикации APK fork должен создать собственный signing key и явно публиковать свой certificate fingerprint.
