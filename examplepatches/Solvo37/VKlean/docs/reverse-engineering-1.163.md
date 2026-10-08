# VK Видео 1.163 — reverse-engineering notes

## Target

```text
package:      com.vk.vkvideo
versionName:  1.163
versionCode:  51920
APK SHA-256:  61d8c2b0837704d2d197a35b75f5c07872927e77d8861b61ce78ba0c5626c1c8
VK cert SHA-256:
057d974412032066f1b5edb1fdb550f71854189815c806b27c4d486fb4f1ef32
```

## Native anti-tamper / signature check

Главная причина раннего краша переподписанных тестовых APK оказалась не в рекламных bytecode-патчах.

В `lib/arm64-v8a/libvkcore.so` есть native-ветка проверки, после которой при неуспехе процесс завершается. На переподписанном APK это проявлялось как мгновенное закрытие приложения без полезного Java exception.

Рабочий patch меняет условный переход в одном проверенном binary pattern:

```text
before:
1f 1c 00 72 e8 07 00 f9 00 05 00 54

after:
1f 1c 00 72 e8 07 00 f9 00 04 00 54
```

Патч намеренно требует ровно одно совпадение исходного pattern. Для будущей версии нельзя автоматически переносить offset без повторной проверки.

## Coexistence с обычным VK

Оригинальные VK-приложения подписаны одним vendor key и могут объявлять общие signature permissions.

После переподписи VK Видео проектным ключом Android не разрешал установку рядом с обычным VK из-за конфликтующих permission declarations:

```text
com.vkontakte.android.permission.ACCESS_DATA
com.vkontakte.android.permission.APP_REDIRECT
```

Compatibility patch убирает конфликтующие declarations из VK Видео, сохраняя обычный VK владельцем этих permissions.

## In-app update

В 1.163 bootstrap in-app update определяется fingerprint-ом метода:

```text
parameters:
Lcom/vk/video/screens/main/MainActivity;

return:
V

semantic anchor:
constructor call to Lcom/vk/update/core/a;
```

Patch возвращается из bootstrap до запуска update flow.

## Video ads

Feature enum:

```text
Lcom/vk/toggle/features/VideoFeatures;
```

Используются:

- `VIDEO_INSTREAM_ADS_OFF` → forced true
- `VIDEO_OVERLAY_AD` → forced false
- `VIDEO_MOTION_AD_ENABLED` → forced false

Общий boolean evaluator патчится только для этих enum values; остальные video feature toggles продолжают использовать оригинальную логику.

### Server-driven video ad payload

В 1.163 отдельно присутствует серверный рекламный DTO:

```text
Lcom/vk/api/generated/video/dto/VideoGetAdsResponseDto;
```

Его основной constructor принимает четыре рекламных payload:

- `VideoVideoAdsInstreamDto`;
- `VideoVideoAdsSportDto`;
- `VideoVideoAdsMobileDto`;
- `VideoVideoAdsBannersDto`.

Patch обнуляет все четыре параметра до записи в поля объекта. Дополнительно constructor
`VideoVideoAdsInstreamSectionsDto(List, List, List)` получает `null` вместо трёх списков:
`preroll`, `midroll`, `postroll`. Это закрывает второй путь, который может активироваться
серверной/аккаунтной конфигурацией независимо от трёх `VideoFeatures`.

## Clips ads

Клипы используют отдельный рекламный стек. В 1.163 найдены отдельные типы short-video feed,
MyTarget SDK и Clips feature/config параметры. **Remove clip ads**:

- forced-false для рекламных значений `ClipsFeatures`;
- forced-disabled значения в конкретном R8 provider `Lyo0/g;`;
- `ClipVideoFileAdapter.A3()` возвращает `null` вместо `SdkClipsAdsFeaturesParams`.

Патч намеренно не отключает весь MyTarget component или DI/auth bootstrap: это уменьшает риск
затронуть вход, нерекламные зависимости или обычное воспроизведение.

### Runtime MIDROLL gate

The remaining interactive mid-video ad path is started by `VideoAutoPlay` through:

```text
Ln33/t;.run()
  -> Lx13/e;.b(AdSection.MIDROLL, Float)
  -> request_midroll
  -> Lno/w5; (InstreamAdEngine)
```

`x13.e.b(AdSection, Float)` has five local registers in 1.163. Returning `true` for
`AdSection.MIDROLL` makes the caller exit before the main player is paused/reconfigured
for the ad engine. **Block midroll ads** applies this gate while leaving other ad-section
logic untouched.

### Server-provided Clips feed ads

The short-video API can return dedicated polymorphic feed DTOs independently from
the earlier `ClipsFeatures`/provider configuration:

- `ShortVideoFeedItemShortVideoStaticAdDto`;
- `ShortVideoFeedItemShortVideoMarketAdDto`;
- `ShortVideoFeedItemShortVideoFloatingAdDto`;
- `ShortVideoFeedItemShortVideoMytargetSdkAdDto`;
- `...MytargetSdkStaticDto`;
- `...MytargetSdkVideoDto`;
- `...MytargetSdkCarouselDto`;
- `...MytargetSdkPromoDto`.

`Lee1/j;.a(ShortVideoGetRecomResponseDto, ve1.q)` (`ClipsRecomResponseAdapter`) maps
these DTOs into SDK feed items. For StaticAd/MarketAd it constructs `SdkActionLink`
using the server title, URL, app deeplink and app package name — the path behind CTA
buttons such as “Установить”.

**Filter clip feed ads** removes those eight DTO variants from the mutable API feed list
before the original mapper runs. Ordinary short-video/full/questionnaire/shop feed items
are left untouched.

## Promoted banner

DTO:

```text
Lcom/vk/api/generated/video/dto/VideoDiscoverAdsDto;
```

Getter `canShowAdBanner` принудительно возвращает `Boolean.FALSE`.

## Ad pixel tracking

В 1.163 `PixelStatsTrackerImpl` R8-обфусцирован как `Ltq/d;`.

Два метода dedicated ad pixel tracking — одиночный URL и batch Iterable — возвращают `EmptyDisposable.INSTANCE` до сетевой отправки.

## Почему STRIP_FAST

Ранние тесты использовали полную переразкладку bytecode. Финальная рабочая сборка использует `STRIP_FAST`, чтобы Morphe переписывал только действительно затронутые классы/DEX и минимизировал изменения APK.

После этого APK проходит `zipalign` и v3-only signing.

## Future versions

R8 names, feature classes и native-код могут измениться в любом релизе.

Новая версия считается совместимой только если:

- package/certificate проверены;
- все bytecode fingerprints совпали;
- native signature pattern совпал ровно один раз;
- APK успешно собран и подписан;
- после изменения fingerprints/native patch выполнен реальный launch test.
