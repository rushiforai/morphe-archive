# MicroG sign-in

The optional **MicroG sign-in** patch connects Chrome's account interface to
[Morphe MicroG](https://github.com/MorpheApp/MicroG-RE), package
`app.revanced.android.gms`, version **7.1.1 or newer**. It is separate from **Chrome customization** because
it changes the account provider. The phone can retain its ordinary Google Play
Services and stock Chrome installation.

After patching with this option, open **Settings → Morphe settings → Allow account
access**. Android groups account enumeration under the Contacts permission. Then
return to Chrome settings and choose **Sign in**. Accounts must be available in
MicroG; an account in ordinary Google Play Services is not automatically shared.
Chrome's **Add account** opens the MicroG authenticator. Complete login and consent
on the device. Do not remove an existing Google account to work around the
"already exists" message from an older build.

## Implementation boundary

- Account enumeration calls MicroG's `auth.accounts` provider with `get_accounts`
  and account type `app.revanced`. Chromium still receives its expected
  `com.google` account objects. Android authenticator operations are converted
  back to the MicroG type.
- Capability requests also use the MicroG account type because MicroG reads its
  account cache through Android AccountManager. Responses remain the provider's
  allowed/denied/unknown results; eligibility and policy are not overridden.
  Version 7.1.1 is enforced before account enumeration, token requests and
  capability queries. Version 6.1.1 returned true for every capability, including
  parental controls, and must never be used for Chrome sign-in.
  On the test device, 7.1.1 returned an unknown parental-control result. Chrome
  retained the earlier incorrect cached state until account access was reset;
  the recovery below restored Incognito without changing native policy checks.
- Token requests explicitly bind MicroG's `com.google.android.gms.auth.GetToken`
  component. Chrome's original binder callbacks retain token parsing, expiration,
  invalidation, scopes, real Gaia account IDs, and recoverable consent errors.
- Service binding runs on Chrome's account worker threads, has a 15-second
  connection deadline, and unbinds on success, failure or interruption.
- `MigrateAccountManagerDelegate` stays disabled: MicroG implements the legacy
  account protocol, while its newer AANG account methods are unimplemented.
  Other Chrome feature flags retain their original behavior.
- A provider failure becomes the `RemoteException` Chrome already retries; it
  does not become an empty account list that could be mistaken for account removal.
- Chrome's Trusted Vault client binds MicroG's key-retrieval service directly.
  The original `chromesync` security domain, shared-key validation, recovery UI
  and disabled reset offer are preserved. MicroG 6.1.1 lacks this service and
  cannot complete the encrypted-data verification step.
- MicroG receives original Chrome package/certificate metadata through its
  documented patch integration mechanism. This does not change Android's APK
  signature or grant trust in stock Google Play Services.
- No global Google service rewrite, generated account IDs, token persistence,
  token logging, or changes to Incognito authentication are introduced.

This adapter was independently written for this repository. Protocol references:
[MicroG AccountContentProvider](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/java/org/microg/gms/auth/AccountContentProvider.java),
[MicroG AuthManagerServiceImpl](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/java/org/microg/gms/auth/AuthManagerServiceImpl.java),
[MicroG KeyRetrievalService](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/kotlin/org/microg/gms/auth/folsom/KeyRetrievalService.kt),
and the actual supported Chrome APK's account delegate and binder callbacks.
Upstream code is not bundled here.

## Acceptance

Account visibility, successful Chrome sign-in and actual Chrome Sync are separate
checks. The S26 user confirmed successful sign-in, encrypted-data verification
and existing bookmarks appearing with MicroG 7.1.1. Custom Sync passphrases,
supervised accounts, managed accounts and recovery on
another device still require their own acceptance; no policy/capability result
is fabricated to enable them. See [device testing](TESTING.md).

**Google Password Manager:** MicroG 7.1.1's own
[PasswordManagerActivity](https://github.com/MorpheApp/MicroG-RE/blob/7.1.1/play-services-core/src/main/kotlin/com/google/android/gms/credential/manager/PasswordManagerActivity.kt)
opens `passwords.google.com`; it does not supply the native Google Password Manager
interface. Since source 0.3.0, Chrome Morphe's button also offers **Android
settings → Google → Google Password Manager**. Android Settings opens Google's
protected native interface under its own authority. On the S26, the user
confirmed viewing the disposable password and deleting that test entry. Google's
website remains available inside Chrome Morphe, honoring the remembered-mode
setting; a separate website login may be required.

The optional **Android autofill** patch enables Google's system service for
regular-tab saving and filling while retaining MicroG sign-in. Select **Autofill
using another service** in Chrome's autofill settings. Incognito cannot use this
route: its Android provider is disabled to prevent private login save prompts.
The system provider uses its own Google account selection, separate from
MicroG. See [Android autofill setup and acceptance](ANDROID_AUTOFILL.md).

**Account-state regression:** after initial sign-in with MicroG 6.1.1, the test
S26 lost Incognito and homepage articles, and its Wallet account-data switch was
disabled. The 6.1.1 capability stub is confirmed in both source and APK bytecode.
Upgrading MicroG alone did not clear Chrome's previously cached account state.
After resetting account access for Chrome Morphe and signing in again, the user
confirmed that Incognito, bookmarks and homepage articles worked together.
The released patch blocks account operations with the older provider.
The Wallet account-data switch also became enabled after recovery; actual Wallet
synchronization remains untested. Native policies are not overridden.

## Recovery from the earlier MicroG 6.1.1 test build

Only use this procedure if Chrome Morphe was already signed in through MicroG
6.1.1 and Incognito or homepage articles disappeared. Signing out can remove
Chrome Morphe's local copies of account data; first preserve anything that has
not synchronized. Do not remove the Google or MicroG account from the phone.

1. Update Morphe MicroG to **7.1.1 or newer** and patch Chrome with source **0.2.0
   or newer**, selecting **MicroG sign-in**.
2. In Android's app settings for **Chrome Morphe**, deny its **Contacts**
   permission, force-stop Chrome Morphe, then reopen it. This makes its account
   list empty so Chrome can clear the stale signed-in state. Confirm Chrome
   settings shows **Sign in**.
3. Restore account access through **Morphe settings → Allow account access**.
   Force-stop and reopen Chrome Morphe, then choose **Settings → Sign in** and
   complete any verification yourself.
4. Check Incognito, synchronized bookmarks and homepage articles again.

On the test device, the permission change was performed with ADB for Chrome
Morphe's `android.permission.GET_ACCOUNTS` only. No app data was cleared and no
Google or MicroG account was removed. The user confirmed successful recovery.

When debugging, inspect only Chrome's process and redact account identifiers.
Do not collect MicroG logs: upstream authentication logging can include tokens.
