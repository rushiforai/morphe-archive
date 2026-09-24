# Security policy

## Проверка APK

Перед установкой project release проверьте certificate fingerprint.

Ожидаемый SHA-256:

```text
D4:1F:49:2F:0E:2A:2E:39:90:AC:7F:8E:75:CC:5D:4B:
14:89:5F:7B:46:C0:B6:11:3B:78:82:C4:8A:A5:D4:0A
```

Проверка:

```bash
apksigner verify --verbose --print-certs VK-Video-*-patched.apk
```

Checksum подтверждает конкретный файл, а certificate fingerprint — цепочку обновлений проекта. Для APK update критичен именно постоянный signing certificate.

## Native signature bypass

Проект намеренно отключает одну native anti-tamper проверку оригинальной подписи VK в `libvkcore.so`, потому что модифицированный APK должен быть переподписан project key.

Следствие: после установки project build нельзя полагаться на встроенную VK signature check как на гарантию происхождения APK. Проверяйте release source и project certificate.

## Secrets

Никогда не публикуйте:

- Android signing keystore;
- `ANDROID_KEYSTORE_B64`;
- keystore/key passwords;
- `GPLAYDL_API_KEY`;
- Google auth/session tokens;
- другие CI credentials.

Secrets должны находиться только в GitHub Actions Secrets или в офлайн-backup.

## Reporting

Проблемы в patch code, CI, release process или trust model можно сообщать через GitHub Issues, если отчёт не раскрывает активный secret.

Если для воспроизведения нужно показать действующий token/key/password, не публикуйте его в issue. Сначала отзовите/смените secret или свяжитесь с владельцем репозитория приватно.
