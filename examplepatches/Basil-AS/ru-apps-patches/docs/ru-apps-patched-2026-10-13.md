# RUStore apps: patched APK artifact report (2026-10-13)

## Result and limits

Morphe completed the patch/rebuild/signing pipeline for all 24 matrix targets. Every generated output passed an independent check of SHA-256 against the manifest, `apksigner verify`, `aapt dump badging` (package, version name and version code), and `unzip -t`.

This is **not** a claim that all apps install or launch without errors. No Android emulator/AVD was available, and no app was installed on a physical device. Eight RuStore downloads are split APK sets: only their base APK was patched; those eight outputs are not complete installable packages. All patched APKs have a Morphe signing certificate rather than the original RuStore developer certificate, so they cannot update an official installation in place. Installing one as a fresh app may require uninstalling the official version and can lose its local data; this was not attempted.

Artifact directory on the workstation: `/var/mnt/data/ru-apps-patched-20261012/`. The APKs and detailed Morphe JSON/logs are local binary artifacts and are **not committed to GitHub**. Per-app reports and `manifest_draft.json` in that directory are the source of truth for individual patch steps and hashes.

Convenience archive with all 24 APK outputs, per-app JSON/logs, manifest, batch report, and this table: `/var/mnt/data/ru-apps-patched-20261012/ru-apps-patched-20261012.zip` (ZIP integrity test passed; 24 APK entries). It contains the eight patched split bases as clearly named above; it does not turn them into complete split installation bundles.

## Patches selected

The run used Morphe `--exclusive` and this explicit privacy-only allowlist:

- `Disable AppsFlyer`
- `Disable analytics libraries`
- `Disable analytics manifest components`
- Sber only: `Disable Sberbank advertising ID`
- T-Bank only: `Disable telemetry worker`

No root-detection or anti-tamper bypass, device/network spoofing, ad-removal, or payment-flow patch was selected. The report lists the three shared patch names for every package. The AppsFlyer manifest step logged one component disabled in seven outputs and zero in the other 17; a zero count means no matching manifest component was removed. Morphe's “applied” status and static APK checks do not establish that every analytics SDK is inactive at runtime.

## Per-app result and checksum

`patched-base.apk` means just that: the base APK from the split set was patched. It must not be treated as a complete app download.

| Приложение | Package | Версия / versionCode | Что применено | Артефакт | Установочный комплект | SHA-256 patched APK |
|---|---|---|---|---|---|---|
| Яндекс Музыка | `ru.yandex.music` | `2026.09.5 #167.1rur` / `24026502` | AppsFlyer; analytics libraries; analytics manifest components | `ru.yandex.music.apk` | Один APK; запуск не проверен | `dc3e933b5fc6d22462972a21c944d9f09d6fcb682afb68c89e169f4febef9c46` |
| Яндекс Карты | `ru.yandex.yandexmaps` | `31.1.3` / `739706910` | AppsFlyer; analytics libraries; analytics manifest components | `ru.yandex.yandexmaps.apk` | Один APK; запуск не проверен | `1e745043d991d6adc0119f1ea676021b3583d222556eb5e651373ef542547e8b` |
| Яндекс Go | `ru.yandex.taxi` | `5.98.0` / `30128554` | AppsFlyer; analytics libraries; analytics manifest components | `ru.yandex.taxi.apk` | Один APK; запуск не проверен | `762c684021f9237db2b855742ea37726dc224b1350ba9c1d8b0cb74c84d6ccf6` |
| Яндекс Расписания | `ru.yandex.rasp` | `3.73.0` / `35000063` | AppsFlyer; analytics libraries; analytics manifest components | `ru.yandex.rasp.apk` | Один APK; запуск не проверен | `dc3bd1dddf5067c24fbc78b11e64ff54c239e15c8e3c2da1a23cbdfa96cb8785` |
| Яндекс Пэй | `com.yandex.bank` | `0.243.0` / `11920` | AppsFlyer; analytics libraries; analytics manifest components | `com.yandex.bank.apk` | Один APK; запуск не проверен | `26351155292cdf04ff6b2fe6202370dcd1dfcd7171b3caf0b9f8ea33d39584e1` |
| СберБанк | `ru.sberbankmobile` | `17.13.0` / `2026062316` | AppsFlyer; Sberbank advertising ID; analytics libraries; analytics manifest components | `ru.sberbankmobile.patched-base.apk` | **Не полный комплект:** 2 исходных split APK; запуск не проверен | `0e2b88fd0e5a2861a079503e40c29d387549ca6e6eb357915534b30c1947c682` |
| Альфа-Банк | `ru.alfabank.mobile.android` | `12.60.07` / `2042600700` | AppsFlyer; analytics libraries; analytics manifest components | `ru.alfabank.mobile.android.apk` | Один APK; запуск не проверен | `b53c42ccf2a8ecb291cdb1c093fc552085b19ae95d5e6823016688519dab57ae` |
| ВТБ Онлайн | `ru.vtb24.mobilebanking.android` | `20.18.1.3` / `2090141585` | AppsFlyer; analytics libraries; analytics manifest components | `ru.vtb24.mobilebanking.android.apk` | Один APK; запуск не проверен | `6658a3fa05a4bddbadd5294e7e6ffedb59115d8b4e4af926ff1395d52169585c` |
| 2ГИС | `ru.dublgis.dgismobile` | `7.29.1.632.4` / `282010632` | AppsFlyer; analytics libraries; analytics manifest components | `ru.dublgis.dgismobile.apk` | Один APK; запуск не проверен | `7e6cfe2d1de80e11f62f191d9fa8ad171e0a82827da0c9a11e09bc460680627d` |
| Звук | `com.zvooq.openplay` | `4.117.0rs` / `511700129` | AppsFlyer; analytics libraries; analytics manifest components | `com.zvooq.openplay.apk` | Один APK; запуск не проверен | `9538c10fb20000adb698eb82e9326daa530d620f5ca7052bee97e54e8181d6c7` |
| MAX | `ru.oneme.app` | `26.35.0` / `6861` | AppsFlyer; analytics libraries; analytics manifest components | `ru.oneme.app.patched-base.apk` | **Не полный комплект:** 3 исходных split APK; запуск не проверен | `fe3fa3e5006a553f0cfe59212268d043cbbb8ee77a2d990d29310cb1816e7574` |
| Госуслуги | `ru.rostel` | `27.1.0.9876-rustore` / `9876` | AppsFlyer; analytics libraries; analytics manifest components | `ru.rostel.patched-base.apk` | **Не полный комплект:** 2 исходных split APK; запуск не проверен | `a679881fbbef52969dfc4d75cfd77a53ebc3a167a4863135d938f99c79678d5e` |
| Ozon | `ru.ozon.app.android` | `19.38.0` / `2721` | AppsFlyer; analytics libraries; analytics manifest components | `ru.ozon.app.android.patched-base.apk` | **Не полный комплект:** 3 исходных split APK; запуск не проверен | `bf1f4f63a138797f8b50a469e229647f9cfb887dcf7b0202d339ff62cea70813` |
| Wildberries | `com.wildberries.ru` | `7.8.3002-rustore` / `61085` | AppsFlyer; analytics libraries; analytics manifest components | `com.wildberries.ru.apk` | Один APK; запуск не проверен | `c590816ff1db55f08ad8836f337d67e2f9d3a408ef90cfb34565db32d58a82d6` |
| Авито | `com.avito.android` | `234.5` / `3561` | AppsFlyer; analytics libraries; analytics manifest components | `com.avito.android.apk` | Один APK; запуск не проверен | `0b1d9634dd74980c6b963b698afa3453a628437c5088a3e63e70e1ab3d83356c` |
| AliExpress Россия | `ru.aliexpress.buyer` | `8.89.1.3597464` / `844` | AppsFlyer; analytics libraries; analytics manifest components | `ru.aliexpress.buyer.patched-base.apk` | **Не полный комплект:** 3 исходных split APK; запуск не проверен | `23e444a8dab07394518e787a573c17df8967d4c7d8e8f2b6d051112a25857588` |
| Перекрёсток | `ru.perekrestok.app` | `3.99.0` / `4128` | AppsFlyer; analytics libraries; analytics manifest components | `ru.perekrestok.app.apk` | Один APK; запуск не проверен | `20634d304fc3d4e73963ee191553177172779c80e35e005d1965321bcd83d540` |
| Whoosh | `com.punicapp.whoosh` | `4.0.0` / `418060` | AppsFlyer; analytics libraries; analytics manifest components | `com.punicapp.whoosh.patched-base.apk` | **Не полный комплект:** 4 исходных split APK; запуск не проверен | `1eb5a2ac08c68a61b92f80f698f3c6400ee04e60975bf9cc376b8516686676dd` |
| Mir Pay | `ru.nspk.mirpay` | `1.64.5.350` / `405` | AppsFlyer; analytics libraries; analytics manifest components | `ru.nspk.mirpay.apk` | Один APK; запуск не проверен | `554590e1053e1f0cb3524ab5b13d1b1843df33714efdacd41d62bf8423d64c33` |
| Т-Банк | `com.idamob.tinkoff.android` | `8.4.2` / `13282` | AppsFlyer; analytics libraries; analytics manifest components; telemetry worker | `com.idamob.tinkoff.android.apk` | Один APK; запуск не проверен | `0753901bdd0b6a5673e055f855572d0dc6b641799f3701f1ba40400476d4bca4` |
| Яндекс Почта | `ru.yandex.mail` | `9.30.1` / `125935` | AppsFlyer; analytics libraries; analytics manifest components | `ru.yandex.mail.apk` | Один APK; запуск не проверен | `959a2f1a0a567a48458ac79b2df6b278806152162ec64fb53d47ca437f15a037` |
| билайн | `ru.beeline.services` | `5.48.5` / `4391` | AppsFlyer; analytics libraries; analytics manifest components | `ru.beeline.services.patched-base.apk` | **Не полный комплект:** 3 исходных split APK; запуск не проверен | `27ecbed8cb335cc1744724db4db4bb4fa576cb823d6eb52d55b86ea3a3bf52e7` |
| Мой МТС | `ru.mts.mymts` | `6.77` / `150770030` | AppsFlyer; analytics libraries; analytics manifest components | `ru.mts.mymts.patched-base.apk` | **Не полный комплект:** 4 исходных split APK; запуск не проверен | `2c600c40a780f436f15590ed8f91fbba49cbd29b91c973d74e7b054f239af00e` |
| МегаФон | `ru.megafon.mlk` | `4.69.0` / `42400548` | AppsFlyer; analytics libraries; analytics manifest components | `ru.megafon.mlk.apk` | Один APK; запуск не проверен | `23cade3014a4f77bef4d703ea5ff2a94a8f39b5455bcf0c58f3c0270b005138c` |

## Verification evidence

- Source matrix: `research/ru_apps_expansion.tsv`; original APKs downloaded via `Basil-AS/rustore-downloader` to `/var/home/basil/ru-apps-downloads-20261012`.
- Morphe JSON for each target records matching package/version and successful `PATCHING`, `REBUILDING`, and `SIGNING`; `failedPatches` is empty.
- Independently rechecked all 24 outputs against manifest SHA-256, `apksigner verify`, `aapt dump badging` package/version/versionCode, and ZIP integrity.
- Signature comparison example (Yandex Music): original RuStore signer SHA-256 `aca405ded8b25cb2e8c6da69425d2b4307d087c1276fc06ad5942731ccc51dba`; patched Morphe signer SHA-256 `41387dda63f1be405308a2d95e0f6ee6894c623e2d5859aa3f4525f686e9606c`.
- Runtime install, first launch, login, maps/routes, payments, order flows, notifications and deep links are **not tested**. Do not install the banking/payment variants as replacements for official apps on a primary device.
