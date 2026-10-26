# Japanese locale selection: verified offline patch (Taobao 10.66.30)

## Bug uncovered and corrected

The APK bundles 23 country entries under `countryInfo`, while its initial `currentCountryInfo.site` is **GLOBAL**, not JP. An early experimental callback patch edited `currentCountryInfo` **only**, so it could miss the Japan row entirely when the user opened the country selector. It has been replaced with a callback that:
1. Iterates the server-provided `countryInfo` list and finds the **JP** entry.
2. Adds a non-default `en_US` `LangModel` if absent.
3. Separately checks `currentCountryInfo` and adds English if this is also JP.
4. Keeps other regions and their existing language entries unchanged.
5. Leaves protocol-facing `Localization.h()` and region/edition language getters unchanged.

The bytecode injection is anchored immediately after `LocaleModel.reqData` is populated; the Morphe 2.0 patch now fails closed if the expected assignment at index 86 is absent.

A register-aliasing bug in an intermediate patch temporarily overwrote its language-list iterator. Fixed by keeping the iterator in `v14` and using `v15` solely for a transient comparison string. The latest source build is at commit `e0372f4ad6fc9832935af2ea7aaa721bb5186f1b` (Morphe CI [success](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39894410670)).

## Direct test against original APK (offline)

Source APK: `com.taobao.taobao` 10.66.30, SHA-256 `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`.

Morphe Desktop 1.18.1 / Patcher 1.15.1 was used with an adapted legacy test bundle containing the same locale-patching smali body. The test explicitly enabled **both**:

- `TaobaoLingo: Show English in Japan locale picker (fallback)`
- `TaobaoLingo: Enable English for Japan picker (experimental)`

**Important:** With `--exclusive`, `dependsOn` alone did not cause the disabled fallback resource patch to be applied; only one patch appeared in the CLI log. A second run with two explicit `-e` arguments was required. Both were applied in the passing run.

The final two-patch output:

- Patching, rebuild, signing: **PASS**; zero failed patches
- DEX verification with a dedicated dexlib2 harness: **595,518** implemented methods retained, and **only `EditionApi$1.onSuccess` changed**
- Java registers and try-block counts for the modified method: unchanged
- All unrelated DEX method opcode/reference/register CRCs: identical
- Only changed non-DEX, non-signature ZIP payload: `assets/boarding/data.json`
- Bundled JP entry: retains default `zh_CN`, adds non-default `en_US`
- Other 22 country entries: unchanged
- ZIP integrity and Android APK v2/v3 signature: **PASS**
- Final experimental APK SHA-256: `4460481c7a1adfad6688040e2c78786c966dd6e201c1f3adbfded3c3d4e1b363`

Run the repository verifier:

```sh
python3 scripts/verify_japan_picker.py original.apk patched.apk --report japan-both-v2-result.json
javac -cp morphe-desktop-1.18.1-all.jar tests/VerifyJapanPicker.java
java -cp tests:morphe-desktop-1.18.1-all.jar VerifyJapanPicker original.apk patched.apk
```

## Critical limitation

**This does not prove a usable Taobao app.** Morphe's APK repackaging **re-signs** the app; Taobao may reject the new certificate or fail authentication for other reasons. The **server** may separately reject a Japan + English selection even if the UI offers it. Full screen language coverage, account login, shopping region persistence, and network responses are **not runtime-tested**.

These experiments keep protocol-facing language getters unchanged and are separate from the older broken global-language override. The raw English resource-string patch is a third, independent option, not automatically required to test the locale selector.

## Post-verification: anchored callback build

The strict instruction-86 precondition was also compiled against the older Morphe Desktop patch API, executed on the original APK with **both** patches enabled, and verified with the independent 595,518-method DEX comparator. All checks passed.

- Anchored experiment APK SHA-256: `a487d293743ee1f4ddc0316cf5cbe6849f1d715150c40317109789699820bab2`.
- Compared with the earlier non-anchored APK, every ZIP entry excluding signing metadata has **identical uncompressed bytes**; the different overall hashes reflect separate signing output.
- This confirms the anchor check is applied and has no effect on the actual patched code when the input matches the expected version.

The signed APK was generated for offline validation only and is not committed to GitHub.
