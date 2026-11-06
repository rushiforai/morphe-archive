# Сборка из исходников

Требования: JDK 21 и токен GitHub (read:packages) для доступа к реестру Morphe
(`gpr.user` / `gpr.key` в `~/.gradle/gradle.properties` или `GITHUB_ACTOR` / `GITHUB_TOKEN`).

```bash
./gradlew buildAndroid
```

Результат: `patches/build/libs/patches-*.mpp`.

Генерируемые файлы (`patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`)
вручную не редактируются — их обновляет `release.yml`.

## Сообщения коммитов

Используются семантические коммиты: `feat:`, `fix:`, `chore:`.
`feat` и `fix` создают новый релиз, `chore` — нет.
