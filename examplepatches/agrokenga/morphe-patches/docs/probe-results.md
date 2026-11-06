# Native Probe Results

These are the results from the working `IAP Native Probe` run in Morphe Manager 2.3.0 against
KoPP2 2.21.4 on an ARM64 device.

## Run summary

```text
Manager: 2.3.0
Patcher: 2.1.0
Package: com.paradoxplaza.kopp2
Version: 2.21.4
Input size: 167,699,719 bytes
split=false
lib/ entries: 26 (arm64-v8a and armeabi-v7a)
```

The Manager had already merged the APKM splits into one APK. Both ABI copies of
`libil2cpp.so` were present.

## Library hashes

| ABI | Size | SHA-256 |
|---|---:|---|
| `arm64-v8a` | 88,064,328 | `c66bcb0e5d890e36652b462b0552f423340900c53c3a49edc0c144f5cc2b4349` |
| `armeabi-v7a` | 73,715,656 | `8acd47ef9f9800b5bb8e5298d58e8eee94f6c68ec0723e820a6c3206ebc9db3b` |

## ELF headers

| ABI | Class | Machine | PT_LOAD segments |
|---|---|---|---:|
| `arm64-v8a` | ELF64 | `0xb7` (AArch64) | 10 |
| `armeabi-v7a` | ELF32 | `0x28` (ARM) | 9 |

## Target results

Every present target mapped into an executable `PT_LOAD` segment, `match=true`, with plausible
first bytes. That is 8 methods x 2 ABIs = 16 successful checks.

| Target | ARM64 mapped | ARMv7 mapped | Notes |
|---|---|---|---|
| `StoreService.PurchaseItem` | yes | yes | executable, plausible |
| `IAPService.GrantPurchase` | yes | yes | executable, plausible |
| `IAPService.GrantPurchasedItems` | yes | yes | executable, plausible |
| `IAPService.CompletePurchase` | yes | yes | executable, plausible |
| `IAPService.ProcessPurchase(PurchaseEventArgs)` | yes | yes | executable, plausible |
| `TestingIAP.ProcessPurchase` | yes | yes | executable, plausible |
| `TestingIAP.OnValidateSuccess` | yes | yes | executable, plausible |
| `PlayFabApiCall<object,object>.ExecuteAsync` | yes | yes | executable, plausible |
| `PlayFabDataService.ExecuteAsync` | absent | absent | not defined in either dump |

Representative first bytes:

```text
ARM64 StoreService.PurchaseItem:
  fe0f1cf8 f85f01a9 f65702a9 f44f03a9

ARMv7 StoreService.PurchaseItem:
  f04b2de9 f4519fe5 0040a0e1 0360a0e1
```

The ARMv7 prologues consistently begin with `f04b2de9` (`push`), which is an ARM-mode
instruction. This matters: a Thumb patch would not be correct there.

## ARMv7 `exec=false` bug

The first probe version read `p_flags` at offset 4 for both ELF classes. That is correct for
ELF64 but wrong for ELF32:

- ELF64: `p_flags` at offset 4
- ELF32: `p_flags` at offset 24

As a result, the ARMv7 targets were reported as non-executable even though they were inside a
valid executable segment. Fixed in `f2a68bd`, later rebased to `d39d9aa`.

## Write-back verification

The probe appended one byte to both libraries to force the patcher to rewrite and re-align the
entries:

| ABI | Before | After | New SHA-256 |
|---|---:|---:|---|
| `arm64-v8a` | 88,064,328 | 88,064,329 | `36128cf8d79641b97386774ba96d2230a6f29481b3da4e0e1414c4b47e919ee4` |
| `armeabi-v7a` | 73,715,656 | 73,715,657 | `ea961af2c4e7b97141c28d9c69bbbf4f7cce89719bcbb6e06682774ab93fbd0f` |

The patcher rebuilt and signed the APK:

```text
output size: 173,126,892 bytes
elapsed: 10,498 ms (one run), 9,103 ms (another run)
```

This confirms the full pipeline:

```text
extract libil2cpp.so -> edit bytes -> write back -> align -> rebuild -> sign
```

## What this proves and what it does not

Proves:

- the patcher can reach `lib/` entries in the merged APK;
- both ABIs can be extracted and modified;
- changed native libraries are included in the rebuilt, signed APK;
- the offsets from Il2CppDumper map to the expected file offsets.

Does not prove:

- that patching those methods changes purchase behavior;
- that the client can grant entitlements without server validation;
- that the chosen instruction patch is semantically correct;
- that the app has no integrity or anti-tamper checks.

## Reproducing

The last known-good probe is in commit `d39d9aa`:

```bash
git show d39d9aa:patches/src/main/kotlin/io/agrokenga/patches/iap/IAPNativeProbePatch.kt
```

The current working-tree file is a broken experimental rewrite; restore the committed version
before trying to run the probe again.

The ARMv7 dump used:

```text
/tmp/opencode/kopp2-probe/split_config.armeabi_v7a.apk
/tmp/opencode/kopp2-probe/base.apk  (global-metadata.dat)
Il2CppDumper 6.7.46
output: /tmp/opencode/kopp2-probe/dump-armv7/
```

Offsets are version-specific. Re-dump both ABIs for a new version.
