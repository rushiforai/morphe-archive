# Taobao 10.66.30: two resource lookup patches, binary verification

## Ground truth

Source APK: `com.taobao.taobao` 10.66.30 ARM64, size **77,255,755 bytes**, SHA-256:

```text
3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd
```

The source DEX contains **595,518 implemented methods** across 13 DEX files.

The original `Localization.q(int)` has 909 direct invokes from 472 methods. `Localization.r(String)` has 7 direct invokes from 7 methods. Both originally update shared Android Resources according to `Localization.h()`, which also participates in network/region logic.

## What changed

The experimental code uses `Context.createConfigurationContext(Configuration(English))` to perform resource lookups without changing the installed app's global language/region or its protocol-facing getters.

- `Localization.q(int)`: 19 inserted instructions, retains the complete original implementation after the injected prefix.
- `Localization.r(String)`: 25 inserted instructions, with original implementation retained as the fallback when the named key is unavailable.
- Zero other methods intentionally altered.

A separate CLI compatibility proof used Morphe Desktop **1.18.1**, Patcher **1.15.1**, `STRIP_SAFE` and a single patch that applies the same two method bodies in one `execute` block. This proof uses the same method-level operations as the Morphe 2.0 source. The normal GitHub Actions build uses Morphe Patcher **2.0**.

## Observed offline results

| Check | Outcome |
| --- | --- |
| CLI recognized exactly one combined English string patch | PASS |
| Executed patch with zero failed patches | PASS |
| Rebuilt APK in STRIP_SAFE mode | PASS |
| Re-signed output | PASS |
| All 595,518 method IDs retained | PASS |
| Only modified methods: `Localization.q(int)`, `Localization.r(String)` | PASS |
| Original instructions retained following 19/25-instruction prefixes | PASS |
| Method register and try-block counts unchanged | PASS |
| Networking/edition locale methods unchanged | PASS |
| All non-DEX, non-signature ZIP payload size and CRC unchanged | PASS |
| ZIP integrity | PASS |
| Android APK v2 and v3 signature verification | PASS |

Tested APK size: **81,065,275 bytes**. Its SHA-256:

```text
d9485f03d6ba214e2a14e6f1ccf401df0136d08cefa400a01ab1e951fb8545e6
```

The source `tests/VerifyLocalizedResources.java` contains an independent dexlib2/apksig verifier (for the original version and new candidate). The source and emitted APK were also checked using a separate local verifier which yielded exactly the two expected modified methods and valid v2/v3 signatures.

## Limitations

**This is not a runtime pass.** The output's valid new signing certificate does not equal Taobao's original signing certificate, so it may still break login, server communication, or integrity checks. Taobao ARM64 execution and server responses were not reproduced in this verification.

The patch covers Android string resources only; English strings embedded in remote pages, APIs, WebViews and product data are outside its reach. It does not implement Japanese resources.

Older global-language-patching code previously failed visibly on a physical phone; it has been removed from the published patch bundle. Taobao's signing/repackaging sensitivity remains an unresolved independent problem.

No proprietary Taobao code or APK binary is committed to GitHub.
