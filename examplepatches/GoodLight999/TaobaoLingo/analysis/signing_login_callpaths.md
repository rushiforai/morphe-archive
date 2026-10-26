# Taobao 10.66.30: signing certificate and login call-path audit

The original APK was statically examined with dexlib2, searching all 13 DEX files. This investigation is motivated by the failure of the **older global-language override**: a black home area, non-working Account button and an English network/login error.

## Evidence

The original APK contains these relevant methods:

- `com.ali.user.mobile.utils.MD5Util.getApkPublicKeyDigest(String)`: obtains PackageManager signing info for an explicitly supplied package and hashes the X.509 public key.
- `com.ali.user.open.core.util.SystemUtils.getApkPublicKeyDigest()`: obtains its own package signature and hashes its certificate public key.
- `com.alipay.security.mobile.alipayauthenticatorservice.fingerprint.util.PackageUtils.getApkKeyHashBytes(Context,String)`: used by Alipay authenticator service fingerprint header construction.

**Direct callers located:**

| Caller | Callee | Notable context |
| --- | --- | --- |
| `com.ali.user.open.ucc.data.DataRepository.loginByIVToken` | `SystemUtils.getApkPublicKeyDigest()` | Invoked while constructing `app_id` as `packageName + "|" + certificate digest` inside a branch dependent on `KernelContext.isMini`. |
| `com.taobao.android.auth.AuthEntranceActivity.y3` | `MD5Util.getApkPublicKeyDigest(packageName)` | Uses the package name from another resolved `ActivityInfo`; does not unambiguously inspect its own Taobao signature. |
| Two `TAInterationV1.getHeader` methods | `PackageUtils.getApkKeyHashBytes` | Alipay biometrics/authentication-related headers. |

These demonstrate **actual use of signing metadata** in specific authentication components, but **do not prove** that the default Taobao home page or ordinary login is rejected when APK is re-signed. Additional native security code may contain integrity checks that this Java/DEX scan cannot resolve.

A previous broad scan found 337 methods *referencing package/signature APIs*; this count must **not** be interpreted as 337 anti-tamper checks.

## Independent failure hypothesis

The older failed patch forced the return of `Localization.h()` to `Language.ENGLISH`. Its 70 direct call instructions include `UtilityImpl.getLanguageTag()` (ACCS messaging) and `EditionApi.g()` (regional switching). The same patch also globally replaced `LocalizationManager.d()` (6 callers). These changes plausibly affected protocol language/edition state, independently of re-signing.

**New patch** changes only `Localization.q(int)` and `Localization.r(String)` to look up English Android resources with isolated contexts; their original callers that communicate protocol/edition locale remain untouched.

## Conclusion

The old runtime regression has **at least two competing explanations**: global locale/protocol side effects and/or different APK signing identity. APK-only analysis cannot decide which caused Taobao's actual device/network behavior.

This is a code-path investigation, **not** proof of a working modified Taobao client.
