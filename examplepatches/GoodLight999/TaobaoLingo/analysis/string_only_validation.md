# String-only patch: independently verified offline

**Status: experimental, NOT runtime-tested.** The old global Force English UI patch remains known broken; this changes how *one resource lookup* works, not the network/edition language.

## Original APK analysis

- Taobao 10.66.30 original SHA-256: `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`.
- Original APK includes 13 DEX files, 595,518 implemented methods.
- `Localization.q(int)` has **909 invocation instructions from 472 methods**.
- `Localization.q(int)` currently mutates the app's shared Resources configuration before reading a string. The new patch constructs an isolated English `Configuration`, obtains a new context via `createConfigurationContext`, and gets the string from that context only. If its app context is null, it falls through to the original implementation.
- Binary Android resources table contains approximately **3,812 English-locale entries**, compared with approximately **24,253 default entries**. Remote JSON, WebViews, image text and Chinese entries without translations remain unaffected.

## End-to-end Morphe CLI tests

Used Morphe Desktop 1.18.1/Patcher 1.15.1 with a legacy CLI bundle compiled from the project source, with only `TaobaoLingo: English resource strings` enabled.

| Test | Result |
| --- | --- |
| `FULL` APK patch / rebuild / signing | PASS |
| `FULL` count of methods with opcode/reference changes | 1,085 (mostly unrelated DEX re-encoding; undesirable test surface) |
| `STRIP_SAFE` APK patch / rebuild / signing | PASS |
| `STRIP_SAFE` total method definitions | 595,518, unchanged |
| `STRIP_SAFE` methods with opcode/reference changes | **1** — `Localization.q(int)` |
| Inserted instructions and branch | 19 new instructions; conditional fallthrough targets precisely first original instruction |
| `Localization.h()`, `LocalizationManager.d()`, `LocalizationManager.i()` | Unmodified |
| All non-DEX, non-signature ZIP payloads | Same length and CRC |
| APK signature verification | v2 and v3 valid; certificate is **not** Taobao's original certificate |

Signed candidate `TaobaoLingo-StringOnly-Safe-10.66.30.apk`, SHA-256 `c09b5c6d8866863548a2e107070a1f4a45bcf8d93d76b22d6ae7e901b2e249ae`.

## Reproduce without distributing Taobao's APK

```sh
python3 scripts/build_legacy_cli.py --desktop-jar morphe-desktop-1.18.1-all.jar --out /tmp/taobaolingo-legacy.mpp
java -jar morphe-desktop-1.18.1-all.jar patch original.apk \
  --bytecode-mode=STRIP_SAFE --exclusive \
  -p=/tmp/taobaolingo-legacy.mpp -e="TaobaoLingo: English resource strings" \
  -o=/tmp/taobaolingo-string-only.apk
```

This proves a **narrow, structurally valid patch**. It does **not prove** that Taobao accepts a re-signed APK or that login and home work. Signature/device or server checks may still fail. Never assert otherwise.