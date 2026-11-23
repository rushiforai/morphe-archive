# Firefox 160.0 target audit

Audit input: official APK named `org.mozilla.firefox_160.0-2016194410_minAPI26(arm64-v8a)(nodpi)_apkmirror.com.apk` supplied for this patch.

- Package: `org.mozilla.firefox`
- Version name: `160.0`
- Version code: `2016194410`
- DEX files: `classes.dex`, `classes2.dex`, `classes3.dex`
- APK SHA-256: `0d0c677a87633f9dd14b3dd1bcd7530874d59c7e2d042d1cd340f4fe215f692d`

## Fingerprint targets

Both target methods are defined in `classes2.dex` on `Lmozilla/components/browser/engine/gecko/GeckoEngine;`.

### Disable

```text
Lmozilla/components/browser/engine/gecko/GeckoEngine;->disableWebExtension(
  Lmozilla/components/concept/engine/webextension/WebExtension;
  Lmozilla/components/concept/engine/webextension/EnableSource;
  Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda4;
  Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda5;
)V
```

- Access flags: public final
- Register count: 6
- Incoming registers: 5
- The final parameter (`p4`) is the existing failure callback. The patch invokes it as `Function1.invoke(Throwable)`.

### Uninstall

```text
Lmozilla/components/browser/engine/gecko/GeckoEngine;->uninstallWebExtension(
  Lmozilla/components/concept/engine/webextension/WebExtension;
  Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda10;
  Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda11;
)V
```

- Access flags: public final
- Register count: 5
- Incoming registers: 4
- The final parameter (`p3`) is the existing failure callback.

## Verified uninstall callback contract

`GeckoEngine$$ExternalSyntheticLambda1.onException(Throwable)` reads `f$1` (a `WebExtension`), reads `WebExtension.id` (`String`), then calls `AddonManager$$ExternalSyntheticLambda11.invoke(Object, Object)`. The DEX invoke register list is `[v1, v0, v2]`: receiver `v1`, extension ID `v0`, and original `Throwable` `v2`. The audit also confirms that `AddonManager$$ExternalSyntheticLambda11` implements `kotlin.jvm.functions.Function2` and that the disable callback adapter `AddonManager$$ExternalSyntheticLambda5` implements `kotlin.jvm.functions.Function1`. Therefore the inserted callback invocations match the actual callback interface types and argument order.

`WebExtension.id` is a `String` field in `Lmozilla/components/concept/engine/webextension/WebExtension;`.

## Patch safety choices

- Both fingerprints are resolved before either method is mutated.
- Only the exact LeechBlock NG add-on ID is matched.
- The non-LeechBlock path branches to the original method body.
- The patch does not add registers or modify the success callback.
- The patch is not designed to block clearing Firefox data, uninstalling Firefox, or replacing the APK.

The generated fixture [`../tests/fixtures/firefox-160.0-layout.json`](../tests/fixtures/firefox-160.0-layout.json) is the machine-readable audit report. The original 130 MB APK is deliberately not included in this repository ZIP.
