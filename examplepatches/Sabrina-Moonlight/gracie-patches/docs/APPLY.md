# Apply

Package: com.gamesforkids.animals.puzzles.jigsaw
Files needed: base.apk + split_config.arm64_v8a.apk

## With Morphe Patcher
1. Build this patch into your patches.mpp (same as other Morphe patches).
2. Run patcher on base.apk (billing classes live in base).
3. Sign patched base.apk with the same keystore you will use for the split.
4. adb install-multiple patched-base.apk split_config.arm64_v8a.apk

## Quick test without full Morphe build
Use apktool / smali on base.apk only:

  apktool d base.apk -o smali_out
  # locate smali for com/android/billingclient/api/Purchase.smali
  # replace getPurchaseState and isAcknowledged bodies with:
  #   const/4 v0, 0x1
  #   return v0
  apktool b smali_out -o base-patched.apk
  # zipalign + apksigner, then install-multiple with the original arm64 split

## Product IDs observed in metadata
  kProductIDNonConsumableRemoveAds
  kProductIDNonConsumableFullVersion
  kProductIDNonConsumableUpgradeVersion
  kProductIDNonConsumablePlaypass

## UI strings confirming unlock path
  "Awesome !! No more Ads"
  "Awesome! You just upgraded to full version"
