# rareMaxim UAKino Patches

Патчі [Morphe](https://github.com/MorpheApp) для Android-додатку **UAKino** (`ua.kino`).
Перевірено на версії **1.15**.

> Неофіційний проєкт. Не пов'язаний ні з UAKino, ні з Morphe.
> Тут лише патчі: APK самого додатку тут не розповсюджується.

## Як користуватися

Додайте цей репозиторій як джерело патчів у Morphe Manager:
`https://github.com/rareMaxim/uakino-morphe-patches`

<a href="https://morphe.software/add-source?github=rareMaxim/uakino-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Або через [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):
```
java -jar morphe-desktop-*-all.jar patch -p patches-*.mpp UAKino.apk
```

### ⚠️ Вхід через Google не працює

Пропатчений APK підписано іншим ключем, а Google прив'язує вхід у додатку до підпису оригінального APK.
Входьте **логіном і паролем акаунта сайту UAKino**. Якщо ви реєструвалися через Google, спершу задайте пароль на сайті.
Перед установкою видаліть оригінальний UAKino.

## 🩹 Патчі

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/rareMaxim/uakino-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**UAKino**](PATCHES.md#uakino-uakino) | 1 | `1.15` | [`ua.kino`](https://play.google.com/store/apps/details?id=ua.kino) |
<!-- PATCHES_END -->

## Як працює «Disable ads»

Код UAKino обфускований R8, тому fingerprints шукають класи за рядками, а не за назвами.
Назви класів нижче — з версії 1.15:

- `AdsTier(group, adFree)` (`uk/dd`): у конструкторах примусово ставиться `adFree = true`, і плеєр сам пропускає VAST preroll.
- Репозиторій банерів (`uk/br0`, знаходиться за рядками `"ad_platform"` і `"ad_impression"`):
  - `d(placement): List` → `Collections.emptyList()`;
  - `c(placement): Flow` → делегує до вбудованої порожньої реалізації того ж інтерфейсу (`uk/f9`).

## 🛠️ Розробка

### Вимоги
- JDK 21 або новіший.
- GitHub PAT (classic) з правом `read:packages`, записаний у `%USERPROFILE%\.gradle\gradle.properties`:
  ```properties
  gpr.user=ВАШ_ЛОГІН
  gpr.key=ВАШ_ТОКЕН
  ```

### Збірка
```
./gradlew buildAndroid
```
Результат: `patches/build/libs/patches-*.mpp`.

### Релізи
- Уся розробка йде в гілці `dev`, а стабільні релізи виходять з `main` (merge, без squash).
- Повідомлення комітів пишуться у форматі semantic commits: `feat:` і `fix:` створюють реліз, `chore:` — ні.
- Релізи створює лише `release.yml`. Не завантажуйте їх вручну і не редагуйте `patches-list.json`, `patches-bundle.json` та `CHANGELOG.md`.

## 📜 Ліцензія

[GNU General Public License v3.0](LICENSE)
