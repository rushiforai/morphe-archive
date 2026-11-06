# KoPP2 2.21.4 Analysis

Package: `com.paradoxplaza.kopp2`
Version: `2.21.4`, versionCode 243
Engine: Unity IL2CPP
Distribution: APKM with split configs

## Package layout

`projects/com.paradoxplaza.kopp2_2.21.4-243_2arch_..._apkmirror.com.apkm` contains:

```text
base.apk                       102,866,138 bytes
split_config.arm64_v8a.apk      33,265,031 bytes
split_config.armeabi_v7a.apk    31,597,985 bytes
info.json
```

`base.apk` has **no `lib/` directory**. All native libraries are in the split APKs:

```text
split_config.arm64_v8a.apk
  lib/arm64-v8a/libil2cpp.so     88,064,328 bytes
  lib/arm64-v8a/libunity.so      20,505,376 bytes
  plus Firebase/Crashlytics libraries

split_config.armeabi_v7a.apk
  lib/armeabi-v7a/libil2cpp.so   73,715,656 bytes
  ...
```

After Morphe Manager merges the APKM, both libraries are available as normal entries in the
merged APK. The Manager 2.3.0 run reported `split=false` and 26 `lib/` entries.

## Base APK contents

Relevant entries (uncompressed sizes):

```text
assets/bin/Data/Managed/Metadata/global-metadata.dat   13,873,912
assets/bin/Data/data.unity3d                            33,067,859
assets/bin/Data/resources.resource                      37,925,632
assets/bin/Data/Resources/unity default resources        3,743,028
assets/bin/Data/Managed/Resources/*.dll-resources.dat
RuntimeInitializeOnLoads.json
ScriptingAssemblies.json
boot.config
unity_app_guid
```

There is **no** `assets/aa/` directory and no separate `level*` or `globalgamemanagers` entry
in this build. Those are inside `data.unity3d` (a UnityFS bundle), not standalone files.

## IL2CPP metadata

- Metadata version: **31**
- ARM64 dump: `projects/com.paradoxplaza.kopp2/il2cppdump/dump.cs`
- ARMv7 dump: `/tmp/opencode/kopp2-probe/dump-armv7/` (temporary, not committed)
- Dumper: Il2CppDumper 6.7.46, run against `libil2cpp.so` + `global-metadata.dat`
- The ARMv7 dump printed `find JNI_OnLoad` and `ERROR: This file may be protected` warnings,
  but completed and produced usable output.

## Purchase-related types

### `PlayFabDataService`

`KoPP.Backend.PlayFabDataService` is abstract. It has:

```text
FetchOrUpdate
StartFetchOrUpdate
OnFetched
OnFailed
Status
```

It does **not** define `ExecuteAsync`. Subclasses include `SeasonalEventsService`,
`TimerService`, `ItemCatalog`, `FurnitureStore`, `InventoryService`, `StoreService`, and
`ConfigurationService`.

The generic `ExecuteAsync(TRequest, object, Dictionary<string,string>)` belongs to
`KoPP.Backend.PlayFabApiCall<TRequest,TResult>`.

### `StoreService`

`StoreService.PurchaseItem(string itemId, int expectedPrice, Action<bool> callback)` is the
store purchase entry point. It uses:

```text
CloudScriptFunction<PurchaseRequest, PurchaseResponse> PurchaseRequest
```

`Victor.PurchaseRequest` contains `CatalogVersion`, `StoreId`, `ItemId`, and `Price`.
`Victor.PurchaseResponse` and `Victor.FunctionResponse` also exist. There is no
`Victor.Request` class and no `getUrl` method.

### `IAPService` and platform billing

`IAPService` is the platform billing abstraction. Relevant methods:

```text
PurchaseBundle
ProcessPurchase(PurchaseEventArgs)
GrantPurchase
GrantPurchasedItems
CompletePurchase
```

`GooglePlayIAP` and `AppleIAP` extend it. They validate receipts through PlayFab and receive
server-side `Fulfillments`.

`TestingIAP : IAPService` exists. It has `ProcessPurchase` and
`ValidateCall: CloudScriptFunction<SimulatePurchaseRequest, SimulatePurchaseResponse>`.
`SimulatePurchaseRequest` contains `CatalogVersion`, `StoreId`, `ItemId`, `CurrencyCode`, and
`Nullable<uint> PurchasePrice`. This is a simulated purchase path, but it still calls a server
CloudScript.

`IosValidation.PurchaseItem(string receiptData, bool sandbox)` exists around dump.cs line
44637, but it is iOS-specific. The Android path is `GooglePlayIAP`/PlayFab validation, not a
simple `sandbox=true` switch.

### `DMM_PurchaseHandler`

`DMM_PurchaseHandler` handles magazine purchases separately (`Purchase`, `RestorePurchases`,
`GiveContent`).

### `CheatsScreen`

`CheatsScreen` (TypeDefIndex 1362) is an in-game cheat/redeem screen:

```text
UseCheat(string)
Cheat(string)
RedeemCode(string = "")
ParseCheats(string, out object)
SimulateReturningChristmasPlayer
RedeemResult { None, Gold, Item, Cheat, ParameterError, Place }
```

`global-metadata.dat` contains the literal `Your cheat has been used, enjoy.` and strings such
as `monstermanual=increment=`, `gold`, and `item`. This suggests the game already has a
cheat/promo-code system, but it is still implemented in native code and may be gated.

## Server-authority conclusion

`projects/com.paradoxplaza.kopp2/ghidra/analysis.md` concludes:

- Platform IAP validates receipts server-side through PlayFab.
- PlayFab-backed store purchases send a `PurchaseRequest` CloudScript and grant items from the
  `PurchaseResponse`.
- Durable grants are server-side.
- There is **no evidence** in the artifacts that an offline client can authoritatively complete
  a real-money purchase.

The Ghidra pseudocode is partial and warns about function boundaries and PIC handling, so it
should be treated as directional, not a complete decompilation.

## Probed method offsets

KoPP2 2.21.4 only. Re-dump both ABIs for any other version.

| Method | ARM64 RVA | ARM64 file offset | ARMv7 RVA | ARMv7 file offset |
|---|---:|---:|---:|---:|
| `StoreService.PurchaseItem` | `0x251EDBC` | `0x251ADBC` | `0x14A05B0` | `0x14A05B0` |
| `IAPService.GrantPurchase` | `0x2514AE4` | `0x2510AE4` | `0x1493C1C` | `0x1493C1C` |
| `IAPService.GrantPurchasedItems` | `0x2516DF8` | `0x2512DF8` | `0x14964C4` | `0x14964C4` |
| `IAPService.CompletePurchase` | `0x2518608` | `0x2514608` | `0x1498290` | `0x1498290` |
| `IAPService.ProcessPurchase(PurchaseEventArgs)` | `0x25162A4` | `0x25122A4` | `0x1495754` | `0x1495754` |
| `TestingIAP.ProcessPurchase` | `0x251F3F0` | `0x251B3F0` | `0x14A0D68` | `0x14A0D68` |
| `TestingIAP.OnValidateSuccess` | `0x251F618` | `0x251B618` | `0x14A1000` | `0x14A1000` |
| `PlayFabApiCall<object,object>.ExecuteAsync` | `0x2CA7F3C` | `0x2CA3F3C` | `0x1D48E38` | `0x1D48E38` |
| `PlayFabDataService.ExecuteAsync` | absent | absent | absent | absent |

`PlayFabApiCall<object,object>.ExecuteAsync` is a generic instantiation. Patching it affects
every PlayFab API call, not just IAP.
