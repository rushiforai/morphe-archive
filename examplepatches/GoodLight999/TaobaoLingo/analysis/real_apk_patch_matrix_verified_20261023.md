# Real Taobao 10.66.30: completed original/control/native patch binary matrix

**2026-10-23, independently executed on the user's exact 77,255,755-byte original ARM64 APK.**

## Result

| Variant | APK SHA-256 | Android apksigner | Method-level comparison |
| --- | --- | --- | --- |
| Original APK | `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd` | v1+v2 **PASS**; original certificate SHA256 `c5e9bc4c5cc7a34482c627cb9a76b88e30b509d0da3ba54a66274200e19c2743` | Baseline |
| Morphe zero-patch STRIP_SAFE control | `3375b89a9b2f19aef095597252a6a3f77728d08fb29fb407311aeaa31265176e` | v1+v2+v3 **PASS** | All source DEX and non-signature app members byte-for-byte identical |
| **Morphe native DinamicX STRIP_SAFE** | **`7b04a538fd27baa19ffa795d27bb32526654dd4283ce5ed52ce98a711cb6fd0b`** | v1+v2+v3 **PASS** | **Exactly four changed methods among 595,518**. Original instructions preserved; other DEX methods and app resources unchanged |
| Experimental FULL native | `bca8a549fbdffa81abce9531ceb97d100d83f1ea1623f32385238d2e366835ca` | v1+v2+v3 **PASS** | **FAIL: 1,183 changed method representations** (including the four targets). Not recommended for runtime testing |

**Control and both patched variants used exactly the same disposable signing certificate** (SHA-256 `ee324f6605a8221baab826158fe00fc738b562c10524f8c797154d2587e72b99`). The diagnostic private key and proprietary APKs remain local and are not committed.

The earlier custom re-signed-only control `1bbfbfd121ff01b7c9ce916b46d458bac4599df7df626860d52a31afba012fe0` also independently passed the official Android `apksigner` v1/v2 validation, but the **Morphe zero-patch control above is preferred** for comparing identical rebuild workflows.

## Toolchain and exact reproduction

- Original source hash is pinned and enforced.
- **Morphe Desktop 1.19.0 stable** (JAR SHA-256 `deb5d931f3899b20a119637473d338c52585f0c561b5d8b2856b916fe90163b5`).
- **Actual production Patcher 2.0 MPP**, SHA-256 `68d6e296c6dffe2da91bcc235fc22ecc9188976593b9e6ea3ddb53d0ffe6f9cb`, from the PR's build branch (which includes the SpannableString fix). No legacy source adaptation.
- Android SDK build-tools 35 `apksigner` (verified original/control/patched all via its separate verifier).
- `STRIP_SAFE` patch with **only** `TaobaoLingo: Native DinamicX English labels (experimental)` enabled, **one applied patch, zero patch failures**. Offline rebuilding took approximately 8 seconds in this environment.
- All variants were built `--unsigned` and signed with the same local disposable test key via `apksigner`, avoiding Morphe's separate PKCS12/BKS keystore-conversion bug.
- Reproduction: `scripts/reproduce_real_apk_safe.sh original.apk morphe-desktop-1.19.0-all.jar patches-0.1.0.mpp output-dir`. Requires Java 21, Android `apksigner`, Python and approximately 4 GiB memory.

## Independent whole-APK verifications

**The 595,518 method audit PASSED** with `tests/VerifyDinamicXNativeLabels.java` against the original and the STRIP_SAFE APK. Only these methods differ:

1. `Ltb/gi6;->setText(Ljava/lang/CharSequence;)V`
2. `Ltb/cx5;->setText(Ljava/lang/CharSequence;)V`
3. `Ltb/gi6;->onSetStringAttribute(JLjava/lang/String;)V`
4. `Ltb/cx5;->onSetStringAttribute(JLjava/lang/String;)V`

The verifier confirms the original method instruction suffixes are unchanged, method register/try counts are preserved, and the TEXT attribute hash guard is present. Comparisons of all 5,985 original ZIP members show the zero-patch control changes **only** V1 signing metadata; the STRIP_SAFE patch changes DEX contents and adds four additional dex members (`classes14.dex`–`classes17.dex`), plus signing metadata. The unrelated non-DEX app resources, bundled templates and `.so` bytes are unchanged.

**FULL is not recommended:** although validly signed, its independent verifier found **1,183 differing method instruction representations** (e.g., across `androidx` and Taobao detail code), whereas STRIP_SAFE changed only four. A differing representation is not necessarily a semantic change, but there is no justification for the extra bytecode transformations in this investigation.

The original APK's DinamicX static call graph was also generated from the real 13-DEX corpus: four target implementations found, 595,518 methods scanned; two target classes inherit `DXWidgetNode`. A distinct constructor/cast scan found **653 references to `Ltb/gi6;`** and **67 to `Ltb/cx5;`**, showing that FastText is referenced by other app code even though exact direct calls to its two patched text methods were not found. This does **not** identify the precise classes used by live My Taobao templates.

## Evidence scope and unresolved problems

**No real Taobao app has yet been installed or executed on an ARM64 Android device in this investigation.** The successful Android 15 emulator execution in [native_fixture_runtime_verified.md](native_fixture_runtime_verified.md) was a *synthetic* app. The real app's screen Englishification, Account button, login acceptance, JNI integrity behavior and network operation remain **unverified**.

The actual source and control APKs now have official signature verification. The real STRIP_SAFE patch APK is signed and independently DEX-audited; this eliminates *build failure, wrong class fingerprint, and broad method corruption in STRIP_SAFE* as explanations for missing text **but does not prove the actual My Taobao text passes the hook**.

**Next decisive causal comparison:** install original (official signer), Morphe zero-patch control and Morphe native STRIP_SAFE patch on a compatible ARM64 test environment (separate installs/app data snapshots as needed). If zero-patch Account/login fails, signing identity or repackaging is implicated independently of translation. If control works but native patch fails, investigate the real patched DEX/class loading and ART/JNI logs. Positive translation requires comparison of a *known originally Chinese* label, not previously English errors or Terms buttons.

No OCR, overlay, proprietary binaries or private signing keys were added to the repository.
