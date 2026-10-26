# Native DinamicX four-hook Android runtime verification — 2026-10-23

## Verified result (synthetic fixture, **not Taobao**)

- [GitHub Actions run 39945857529](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39945857529): **SUCCESS**
- Tested code commit: `b6fe017c3b0e513fbe79cf2da44fa5396ee9aa6c`.
- [Run artifacts: control/patched UI trees, raw filtered logcat, screenshot, static verifier, signer output and callpaths](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39945857529/artifacts/12498177699).
- Android 15 Google APIs **x86_64** emulator, launched through ADB.
- Production source Morphe **Patcher 2.0 .mpp** was built, then loaded and **successfully applied** via Morphe Desktop **1.19.0 stable** in `STRIP_SAFE` mode.
- APK was signed separately with Android debug signing because Morphe CLI's PKCS12→BKS signing path rejected the correct alias. `apksigner verify` reported **v1/v2/v3 valid**.
- Independent DEX comparison passed: exactly four synthetic target text-binding methods changed; original instructions retained, TEXT attribute guard present, non-DEX members unchanged.
- Emulator installed and launched both untouched and patched fixtures; both displayed and logged their expected output, with no crash.

## Observed logcat differences

| Actual synthetic call path | Unpatched | Patched |
| --- | --- | --- |
| `tb.gi6.setText(String)` | `BUTTER_SET=我的淘宝` | `BUTTER_SET=My Taobao` |
| `tb.gi6.setText(SpannableString)` | `BUTTER_SPANNABLE= 我的淘宝` | `BUTTER_SPANNABLE= My Taobao` |
| `tb.gi6.onSetStringAttribute(TEXT, String)` | `BUTTER_ATTR=我的订单` | `BUTTER_ATTR=My Orders` |
| `tb.cx5.setText(String)` | `FAST_SET=搜索` | `FAST_SET=Search` |
| `tb.cx5.setText(SpannableString)` | `FAST_SPANNABLE= 搜索` | `FAST_SPANNABLE= Search` |
| `tb.cx5.onSetStringAttribute(TEXT, String)` | `FAST_ATTR=购物车` | `FAST_ATTR=Cart` |
| `tb.gi6.onSetStringAttribute(OTHER, String)` | — | `BUTTER_OTHER=搜索` (unchanged) |
| `tb.cx5.onSetStringAttribute(OTHER, String)` | — | `FAST_OTHER=设置` (unchanged) |
| Unmapped label | — | `UNMAPPED=未收录的专有名词` (unchanged) |
| Null `CharSequence` | — | `NULL=null` (unchanged) |

Every value above is sourced from the successful job's `TaobaoLingoFixture` logcat, not inferred from the binary verifier. The test app reports these values after the real patched methods have executed, and its `MainActivity` presents the same values through Android `TextView`.

## Diagnosed build/tooling failures and fixes

1. Gradle 9.8.1 cannot run Android Gradle Plugin 8.11.1 due to removed internal Gradle API: updated **fixture only** to AGP 9.3.0.
2. Android SDK setup prepended Java 17 to PATH, while Morphe 1.19 requires Java 21: invoke `$JAVA_HOME/bin/java`.
3. Desktop **1.19.0-dev.4** failed loading the Patcher 2.0 `.mpp` with `NoSuchMethodError` on `Compatibility.<init>`: use **1.19.0 stable**, which loaded and applied the exact current source patch.
4. Morphe's PKCS12→BKS signing conversion rejected the generated `Morphe` entry: patch with `--unsigned`, use Android's `apksigner` with a stable test key, and validate signatures independently.

## Important limits

**No native English Taobao UI has yet been demonstrated.** The fixture deliberately mimics the package name, version and four concrete widget method signatures, but does not contain Taobao's other DEX code, real DinamicX rendering, JNI/native security SDKs, dynamic templates or Account/login. It proves the patch *can* transform displayed native Android text in a controlled environment; it does not prove the real Taobao app reaches these methods.

The actual source APK for prior offline tests is not mounted in the current execution environment. The three-way original/re-signed-only/patched **real Taobao** runtime comparison, real Account interaction, login and remote server behavior remain **unverified/unresolved**.

No screenshots, OCR, overlays or translation layers are used to implement the patch itself. The fixture screenshot and UI hierarchy are *test evidence only*.
