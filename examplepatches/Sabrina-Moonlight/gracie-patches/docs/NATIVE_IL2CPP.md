# Native IL2CPP follow-up (stronger unlock)

The DEX patch forces every Google Play Purchase object to report PURCHASED + acknowledged.
Unity IAP then fires:
  IAPRemoveAdsComplete
  IAPFullVersionComplete
and the game should set:
  isFullVersion = true
  RemoveAds / remove_ads flags

If a build still gates content in pure C# without re-querying Billing (cached PlayerPrefs = 0),
patch the native side:

1. Extract:
   unzip split_config.arm64_v8a.apk lib/arm64-v8a/libil2cpp.so
   # global-metadata already at assets/bin/Data/Managed/Metadata/global-metadata.dat

2. Il2CppDumper:
   Il2CppDumper libil2cpp.so global-metadata.dat out/
   # open script.json / dump.cs

3. Search dump.cs for:
   isFullVersion
   RemoveAdsBar
   BuyFullVersion
   IAPRemoveAdsComplete
   IAPFullVersionComplete
   kProductIDNonConsumableFullVersion
   kProductIDNonConsumableRemoveAds

4. In the getter for isFullVersion (or equivalent bool property):
   make it always return true (ARM64: MOV W0, #1 ; RET)

5. Same for any RemoveAds / ads-enabled checks used by RemoveAdsBar.

6. Repack split, sign both APKs with same cert, install via adb install-multiple.
