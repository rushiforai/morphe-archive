# Changelog

## 0.2.6 — 2026-09-23

Profile cleanup after real-device validation of 1.163.5-rc1:

- added **Hide profile ad-free promo** for the remaining «Отключить рекламу / бесплатно на 14 дней» card on the «Моё» screen;
- the patch short-circuits `wc6.q.i(ArrayList)` (`ProfileMenuDataProvider.kt`), whose only job is to append `ProfileMenuItemType.AD_FREE_SUBSCRIPTION`;
- the card is therefore omitted before RecyclerView/holder creation; other profile items, downloads and the already-working Clips/video ad blockers are untouched;
- keeps the 0.2.5 startup-crash fix for the Home showcase blocker.

## 0.2.5 — 2026-09-23

Startup-crash hotfix for the 0.2.4 home-ad blocker:

- fixed **Hide home showcase ads** to return a new `EmptyVh` directly at the native showcase branch instead of reusing `p2` as `CatalogViewType`;
- reverse-engineering of the real 1.163 factory shows the active view type is already held in a local register at that branch, so the old `p2` assumption could produce verifier/type failure during home-screen construction;
- **Disable video ad repository** remains unchanged and continues to route video advertising through VK's built-in no-op `VideoAdvertisementsComponent.STUB`;
- 1.163.4 is marked broken and 1.163.3 restored as stable while this fix is validated.

## 0.2.4 — 2026-09-23

Home/player ad removal after real-account screenshots from 1.163.3:

- added **Hide home showcase ads** for the native MyTarget showcase card on the VK Video home catalog (the AdShowCaseBannerVh / UiBlockAdBanner surface with CTA such as «Перейти»); the catalog factory returns VK's own EmptyVh before the ad holder is created;
- added **Disable video ad repository**: the real VideoAdvertisementsComponentImpl.Q6() repository is replaced with VK's built-in no-op VideoAdvertisementsComponent.STUB, which returns no ad sessions instead of chasing individual midroll/start paths;
- production auto-build now requires the lower 0.2.3 Clips/deep-midroll blockers as well as the new 0.2.4 blockers, preventing future automated releases from silently dropping them.

## 0.2.3 — 2026-09-22

Lower-layer ad blocking for VK Видео 1.163 after real-account testing of 1.163.2:

- added **Filter Clips SDK ads** below the server response mapper: the app's own `c01.c.f(video)` ad predicate now causes `r11.d.g(...)` and its default/MyTarget overload to return `null`, which existing callers already skip;
- the same patch filters `k01.e$d` (StaticAds) and `k01.e$b` (MarketAds) before `r11.d.f(...)` can turn them into final Clips SDK feed items / install CTAs;
- added **Block deep midroll ads**: the dedicated `request_midroll` Runnable `n33.t.run()` exits immediately before the main player is paused or handed to InstreamAdEngine;
- midpoint configuration in `xo.a.d(float)` is disabled, and direct `xo.a.c("midroll")` starts are rejected as defense in depth;
- these are separate delta patches so the signed 1.163.2 build can be upgraded without reapplying earlier bytecode changes.

## 0.2.2 — 2026-09-22

Runtime ad removal hardening for VK Видео 1.163:

- added **Filter clip feed ads**: server-provided `StaticAd`, `MarketAd`, `FloatingAd` and MyTarget short-video feed DTOs are removed before `ClipsRecomResponseAdapter` can turn them into SDK feed items or an install/action CTA;
- added **Block midroll ads**: `AdSection.MIDROLL` is rejected in the `x13.e.b(...)` runtime gate before `VideoAutoPlay` pauses/switches the main player into `InstreamAdEngine`;
- both patches are separate from the earlier feature/config suppression so they can be safely applied as a delta over the 1.163.1 project-signed build;
- fixed the production Morphe JSON gate for the current report format (`patchingSteps[].success` instead of the obsolete top-level `.success`).

## 0.2.1 — 2026-09-22

Расширенное удаление рекламы для VK Видео 1.163:

- **Remove video ads** теперь не ограничивается тремя `VideoFeatures`: рекламные поля `instream`, `mobileInstream`, `sport` и `banners` обнуляются в `VideoGetAdsResponseDto`;
- списки `preroll`, `midroll` и `postroll` дополнительно обнуляются в `VideoVideoAdsInstreamSectionsDto`;
- добавлен отдельный **Remove clip ads** для рекламного стека VK Клипов: Clips feature gates, конкретный provider/config слой и `SdkClipsAdsFeaturesParams`;
- patch profile остаётся fail-closed: несовпавший fingerprint останавливает публикацию вместо молчаливого пропуска;
- изменение patch profile на `main` теперь принудительно создаёт новый immutable APK revision для того же upstream versionCode вместо пропуска как уже опубликованной версии.

## 0.2.0 — 2026-09-22

Release-pipeline hardening on the road to 1.0:

- all available upstream sources are evaluated and the highest verified `versionCode` wins;
- baseline can be resolved from the latest stable release metadata with repository fallback;
- split APKs are merged before Morphe so ARM64 native libraries are patchable;
- added machine-readable `upstream.json`, `build-metadata.json` and Morphe reports;
- added fail-closed manifest, multidex, native-pattern and v1-signature static gates;
- required patch names are verified against Morphe `appliedPatches`;
- final project certificate and zip alignment are verified before publishing;
- same-`versionName` / newer-`versionCode` builds get distinct release tags;
- patch-only releases are prereleases and the newest bundle is also attached to the latest stable app release;
- GitHub Actions dependencies are pinned to immutable commits;
- added `ROADMAP.md` with explicit 1.0 exit criteria.


## 0.1.2 — 2026-09-22

Рабочий production-профиль для VK Видео 1.163:

- добавлен обязательный **Bypass native signature check** для `lib/arm64-v8a/libvkcore.so`;
- подтверждено, что мгновенный exit переподписанного APK происходил в native signature/anti-tamper path;
- добавлен fail-closed binary pattern check для native patch;
- финальная сборка переведена на **Morphe STRIP_FAST**;
- добавлены `zipalign` и **APK Signature Scheme v3 only**;
- подтверждена совместная установка с обычным VK;
- подтверждён реальный запуск полной конфигурации патчей;
- опубликован исправленный APK release `1.163`;
- автоматический upstream: RuStore → Google Play/gplaydl → APKPure;
- bundle `patches-v0.1.2` опубликован отдельно от APK release.

## 0.1.1 — 2026-09-19

- добавлен **Fix install conflict with stock VK**;
- устранён `INSTALL_FAILED_DUPLICATE_PERMISSION / STATUS_FAILURE_CONFLICT` при установленном обычном VK;
- добавлен постоянный project signing key и Obtainium release flow;
- добавлены проверки upstream package/signature и защита от downgrade.

## 0.1.0 — 2026-09-19

Первый публичный patch set для VK Видео 1.163 / 51920:

- Disable in-app update
- Remove video ads
- Hide promoted banner content
- Disable ad pixel tracking
- CI build Morphe `.mpp`
- scheduled upstream compatibility checks
