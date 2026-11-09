# Dutch App Patches — Google Maps 26.44 Android Auto 修正

本資料夾是 [Dutch App Patches](https://codeberg.org/JohninNL/nl-morphe-patches)(作者 JohninNL,GPLv3,GitLab 鏡像 <https://gitlab.com/johninnld/nl-morphe-patches>)的修正。

Dutch App Patches v1.53.9 的 `Native navigation for Gearslip and Android Auto` 在 Google Maps **26.44.06.1006895251** 上,車機轉接器(`extensions/maps-gearslip`)仍寫死數個 26.43 的混淆名稱,導致車機無法顯示。這兩個 patch 修正它們:

| Patch | 修正內容 |
|---|---|
| `0001-fix-Maps-native-car-navigation-on-26.44.patch` | 導航 provider binder `lur` → `lvp`(修正 `SecurityException: Maps navigation provider is not local`);`NativeGuidance` 失敗時略過而非結束車機 session |
| `0002-fix-Maps-native-car-renderer-surface-and-new-intent-.patch` | Surface 接收者 `controller.k.h` → `controller.k.j`(修正 `NoSuchMethodException: GmmCarProjectionService.f(Surface)`);新導航 Intent `B(Intent)` → `C(Intent)` |

## 修好的 bundle

Release 裡的 `patches-1.53.9-aa-fix2.mpp`,是 Dutch 官方發布的 v1.53.9 `.mpp`,只把 `extensions/maps-gearslip.mpe` 換成套用上述兩個 patch 後重新編譯的版本,並移除已失效的原簽章(內容變更後簽章必然失效)。其餘內容與官方發布完全相同。

整包無法從原始碼重建:Dutch 的建置需要其私有的 `SHARED_MAPS_API_KEY`(用於 `Bypass Play Services checks`),本專案沒有、也不會取得這把 key。

## 自行重現

```bash
git clone https://gitlab.com/johninnld/nl-morphe-patches.git
cd nl-morphe-patches
git checkout v1.53.9
git am /path/to/0001-*.patch /path/to/0002-*.patch
./gradlew :extensions:maps-gearslip:assembleRelease   # 需 Android SDK(local.properties 的 sdk.dir)
# 產物:extensions/maps-gearslip/build/intermediates/dex/release/mergeDexRelease/classes.dex
# 把它取代官方 patches-1.53.9.mpp 裡的 extensions/maps-gearslip.mpe,並清空 zip comment(原簽章)
```

授權:GPLv3,與 Dutch App Patches 相同。修正歡迎回饋上游。
