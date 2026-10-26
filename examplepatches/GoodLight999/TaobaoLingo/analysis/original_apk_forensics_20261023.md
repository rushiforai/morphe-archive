# Original Taobao 10.66.30: independently reproduced APK/DEX/native audit

Date: 2026-10-23. Scope: **the actual 77,255,755-byte APK supplied by the user**, not a synthetic fixture. No proprietary APK was committed.

## Provenance and baseline integrity

| Check | Observation |
|---|---|
| SHA-256 | `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd` |
| ZIP entries | 5,985 |
| ZIP CRC test | PASS |
| DEX count | 13 |
| Implemented DEX methods | 595,518 |
| DEX class definitions | 102,873 |
| Disassembly instruction-walk errors | **0** |
| ABI | `arm64-v8a` under `lib/` |

Original APK signing contains V1 metadata `META-INF/CERT.RSA`, `CERT.SF`, and an APK Signature Scheme **v2 block** (ID `0x7109871a`). No v3 ID was found in the original signing block. The v1 embedded signer certificate is `CN=taobao`; SHA-256 fingerprint `c5e9bc4c5cc7a34482c627cb9a76b88e30b509d0da3ba54a66274200e19c2743`. **This was a structural/signing-certificate inspection; Android apksigner validation was not available locally.**

## Exact native DinamicX widget entrypoints

Four implementations in `classes6.dex` are present and all write their respective `text:Ljava/lang/CharSequence;` fields:

| Method | DEX registers | Input registers | Original code units |
|---|---:|---:|---:|
| `Ltb/gi6;->setText(Ljava/lang/CharSequence;)V` | 6 | 2 | 24 |
| `Ltb/gi6;->onSetStringAttribute(JLjava/lang/String;)V` | 7 | 4 | 58 |
| `Ltb/cx5;->setText(Ljava/lang/CharSequence;)V` | 6 | 2 | 24 |
| `Ltb/cx5;->onSetStringAttribute(JLjava/lang/String;)V` | 7 | 4 | 45 |

Both classes derive from `Lcom/taobao/android/dinamicx/widget/DXWidgetNode;`. Both attribute handlers include the exact TEXT identifier `38178040921`. This **validates the four currently targeted signatures**, not their execution for a particular live page.

Whole-APK instruction scanning located **84 exact direct invoke references to these two concrete classes**: 60 to `gi6.onSetStringAttribute`, 24 to `gi6.setText`, and **zero** to either `cx5` method. It also found 153 `DXWidgetNode.onSetStringAttribute` references (237 references to target classes or this superclass combined). **Zero concrete direct references to `cx5` do not imply it is unused:** subclass construction and virtual dispatch, reflection, runtime registration and JNI require separate inspection.

A few concrete `gi6` callers: `DXMsgTextViewWidgetNode`, `DXMPTextViewWidgetNode`, `tb/oe6`, `com/taobao/android/dinamicx/widget/z`, `tb/ee5`. The existing DinamicX patch has an actual target within the original application, but call reachability from the *live My Taobao UI* remains unverified.

## Real My Taobao dynamic template evidence

`assets/mytaobao/mtb_2025.json` declares `mtop.taobao.reborn.mclaren.stream` and six `dinamicx.alibabausercontent.com` remote template URLs. **All six referenced template versions differ from the APK's same-name built-in `presetTemplateInfos.json` version (1):**

| Template | Referenced version | Bundled version |
|---|---:|---:|
| mtb_2025_header | 45 | 1 |
| mtb_2025_equity_vip | 112 | 1 |
| mtb_2026_collection | 24 | 1 |
| mtb_2025_order | 52 | 1 |
| mtb_2026_icon | 22 | 1 |
| mtb_2025_coupon_center | 94 | 1 |

This identifies a meaningful static/dynamic version divergence. It does **not** establish which version the app actually loads for a given session or whether the server-provided strings pass through either patched class. Bundled `main.dx` templates begin with `ALIDX` binary headers; searching for plain Chinese strings in their raw bytes is not a reliable completeness test.

## Native/security packaging and account observations

The original APK has **72 paths ending in `.so`**, counting dynamic asset paths; **60** have ELF headers and **12** are non-ELF by design: nine `7z`-compressed shared-object assets, two ZIP-format nested APK payloads and one version placeholder.

Of particular diagnostic interest:

- `lib/arm64-v8a/libsgmain.so` is a ZIP-format APK payload with its own `classes.dex`, `AndroidManifest.xml` and Alibaba WirelessSecurity X.509 signing identity (SHA-256 `a33c435699ecc229aebb7c241afa844d673905a29a57ed46d2cfa593e48b9799`).
- `lib/arm64-v8a/libfakedexuc.so` is another signed APK-like ZIP, with a UC signer. These are **not malformed ELF files**.
- The top-level app signer, embedded WirelessSecurity payload signer and embedded UC payload signer differ. The actual relevance to account authentication or app-integrity checks has **not** been proven.
- An actual caller of `SystemUtils.getApkPublicKeyDigest()` is `com.ali.user.open.ucc.data.DataRepository.loginByIVToken` (`classes3.dex`).
- `AuthEntranceActivity.y3` calls `MD5Util.getApkPublicKeyDigest(String)` (`classes5.dex`).
- The app also contains many ordinary `PackageManager.getPackageInfo` calls, which must **not** automatically be classified as anti-tamper.

## Newly generated re-sign-only comparison

In the separate local analysis environment, an **experimental re-signed-only control** was built from this exact APK, with no changes in any uncompressed non-signature ZIP member.

- Result SHA-256: `1bbfbfd121ff01b7c9ce916b46d458bac4599df7df626860d52a31afba012fe0`.
- Source/result ZIP entries: **5,985 / 5,985**. Only V1 signing metadata names changed (`CERT.{RSA,SF}` → `DIAGNOST.{RSA,SF}`), and APK ZIP/signing structures necessarily changed.
- V1 signed-JAR verification: cryptographic signature verifies; strict mode reported expected self-signed-certificate and unsigned POSIX-attribute warnings.
- V2 signature: generated and passed an independent-in-process content-chunk digest and RSA signature **self-check**.
- **Not yet validated by Android `apksigner`, installed on Android, or tested for Taobao login.** Custom test signing is not original Taobao identity.
- Neither the proprietary APK nor the diagnostic signing private key is committed to GitHub.

## Next causal decision

1. Validate the re-signed-only control with Android SDK `apksigner` and install it on compatible ARM64 Android.
2. If this **zero-patch control** fails Account/login while original succeeds, focus on signing/package-integrity/native SDK/backend constraints; do not blame DinamicX English injection.
3. If the control works, run a real patch on the *same signing key*, verify changed DEX methods and native library hashes, then compare Account/login and specific Chinese text labels.
4. Use logcat plus targeted template/widget traces to establish whether the displayed text actually passes the four hooks.

**STATUS:** Actual original binary inspected successfully; re-signed-only APK generated but Android validity/runtime unverified; real patched APK and original/patched ARM64 runtime comparison pending. Real Taobao English localization and working login remain unverified.
