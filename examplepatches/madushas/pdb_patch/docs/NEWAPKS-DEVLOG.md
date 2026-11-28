# New-APKs campaign devlog (apps in `new_patches apk/`)

Append-only. One section per APK. State = shipped in a release / local-only / probe-only / blocked.
Latest bundle: **v0.7.0 published on GitHub; v0.7.1 local-only (not released)** — 13 apps, 80 patches.

## Already shipped (in published bundle)

| APK | Package | Version | Patches | State |
|---|---|---|---|---|
| hutch-app-4-4-1.apk | com.omobio.etisalatone | 4.4.1 | security, ssl-pinning, trackers, ads | shipped v0.5.9+; local 0.7.1 adds ad-route reroute (fixes error banner) — device-verified |
| material-capsule-17-3.xapk | com.pryshedko.mtisland | 17.3 | PairIP bypass, premium, ads, trackers | shipped; device-verified |
| nike-run-club-4-80-0.apk | com.nike.plusgps | 4.80.0 (1717895889) | ads, trackers, tracker components, dark mode | shipped |
| com.nike.plusgps_4.80.1-...apk | com.nike.plusgps | 4.80.1 (1717921629) | same 4 patches — applies clean, +1.17 MB dex — **+ new "Nike obfuscator access-gate bypass"** (default on) | added as 2nd target, local 0.7.1 (memory #75). **Login 500 root cause found + fixed (2026-11-19), see Open issues** |
| com.fitbit.FitbitMobile_5.11.1...apkm | com.fitbit.FitbitMobile | 5.11.1 | ads+telemetry (manifest-only); GmsCore support (default=false) + cert seed | shipped; sign-in fix wired, needs MicroG+account to verify |
| com.runtastic.android_14.4.0...apkm | com.runtastic.android | 14.4.0 | PairIP kill-VM + baked strings/methods, ads, trackers (Lgg/k no-op), dark mode (framework-only) | **works, device-verified 0 fatals** (memory #79). **Login "no connection": open issue** |
| com.runtastic.android_14.12.1.apkm | com.runtastic.android | 14.12.1 | — | **unsupported**: VM-only Application.onCreate, bodies absent from dex → can only crash. Removed from targets |
| TextNow-Call-Text-Unlimited_26.45.0.0_apkcube.apks | com.enflick.android.TextNow | 26.45.0.0 (vc 15780) | ad SDK (GAMInitializer isEnabled + MobileAdsSdkInitializer), ads manifest, AppsFlyer no-op, tracker components; FB init provider KEPT | shipped v0.7.0; device-verified (auth screen, 0 fatals). Note: 6.1.0.1 apk in dir is an ancient build, ignore. Login geo/integrity-limited (US/CA; Credential Manager) |
| Glassdoor+_13.15.1_APKPure.xapk | com.glassdoor.app | 13.15.1 | PairIP kill-VM + baked strings + methods, ads, trackers | shipped; boots to real MainActivity (VM residual: setContentView path VM-only → empty root, documented) |
| Jooble_1.47.0_APKPure.xapk | com.jooble | 1.47.0 | ads, trackers (Flutter AOT; Java-side SDKs only) | shipped; UI renders |
| Shima_+Dynamic+Island_0.5.1_APKPure.xapk | com.piyush.island | 0.5.1 | PairIP-lite bypass, Pro unlock (10 forced sites), ads/trackers (manifest) | shipped; device-verified |
| ProtonVPN-5.20.98.0...apk | ch.protonvpn.android | 5.20.98.0 | was shipped, **removed** — hxReborn community patch is better | dropped |
| Microsoft+Teams_1416...xapk | com.microsoft.teams | 1416 | was shipped (unbloat), **removed** — rushiranpise has full login+premium solution | dropped |

## Probe-only / not patched

| APK | Package | Finding |
|---|---|---|
| com.google.android.apps.bard_1.0.995038376...apkm | com.google.android.apps.bard | **Router shell only** (3 MB, 3 perms, no INTERNET). Launches Gemini inside googlequicksearchbox. Zero patchable surface — do not patch (docs/gemini.md, memory #82) |
| com.google.android.googlequicksearchbox_17.74.20...apkm | Velvet | Real Gemini app (253 MB). Rename patch works (installs beside system app, GoogleAppActivity launches), but **GoogleCertificatesRslt wall** (GMS rejects re-signed pkg; memory #84) + Geller DI crash. default=false, isExperimental. Docs: googleapp.md |

## New batch (phase2/, dropped 2026-11-18, NOT yet processed)

- OferHub_1.0.0_apkcube.apks
- Pluralsight_2026.11.05_apkcube.apks — recon started in docs/phase2-devlog.md (decompile issues, working dir path fixes)
- Skillshare-Online-Classes-App_5.4.81_apkcube.apk
- We-Love-Deals_1.2.0_apkcube.apks
- com.deepseek.chat_2.8.0-298...apkm (DeepSeek)
- com.moonshot.kimichat_3.1.8-388...apkm (Kimi)
- ai.x.grok_1.2.56-release...apkm + ai.x.grok.bot_1.25.0...apkm (Grok ×2)
- com.android.vending_54.1.11...apk (Play Store itself — likely skip; integrity-walled)

## Open issues (login) — handoff in DEVLOG.md "2026-11-18" entry

1. **Nike 4.80.1 login → accounts.nike.com 500 — ROOT CAUSE FOUND, PATCH WRITTEN (2026-11-19).**
   Not a server-side rejection and not remote config: `libnike-obfuscator.so` compares the
   **APK's own signing certificate** against Nike's Play certificate (818-byte DER, the
   `0x332` immediate compiled into the gate) before decrypting the client configuration.
   A re-signed build fails the check, the library returns
   `Invalid Access: Device info reported to Nike.` instead of the OIDC `client_id`
   (`oauth_oidc_app_id`), and the authorize request goes out with that garbage → HTTP 500.
   Fix: new patch `Nike obfuscator access-gate bypass` forces the gate to allow in all four
   ABIs (verified offline: patched library + foreign certificate → the correct client id
   `cdaf4dbcc130faa860b8860aa771b9db`). Device sign-in check still pending.
   Details: `docs/nikerunclub.md` § "OIDC login — the `accounts.nike.com` 500".
2. **adidas 14.4.0 email login → "Network unavailable"** — OAuth2 to idp.adidas.com (Lza/e); no SSL pinning, no NSC; raw network exception. Original app on the test phone goes to Play-Pass paywall instead, so baseline unknown. Untested: logcat during attempt; idp/appws reachability in Brave on phone.
3. Phone adb over wifi drops often — reconnect via Wireless debugging; notes #12/#13.

---

# 2026-11-20/21 — adidas 14.12.1: taken to the device, root-caused the native kill, built the context shield

The adidas 14.12.1 work moved from static analysis to the TLS-connected device
(Lenovo Z2473, Android 15, SDK 35). Everything below is measured on that device
unless marked static. Commits this stretch: `4eef43a` (PairIP VM-alive),
`ecacf67` (tracker re-anchor), `dda1488` (verdict sweep re-form).

## What worked

1. **Install path** — `adb -s <tls-device> install -r` of the Morphe-merged single APK
   works over the TLS connection (streamed install, ~80 MB). The Play-signed original
   was uninstalled first (re-signed install would fail with a signature mismatch).
2. **All six adidas patches apply** to 14.12.1 (previously Disable trackers aborted):
   verdict sweep 5/5, tracker sinks 6/6, native abort bypass applied. The tracker fix
   and the verdict sweep are committed and verified statically.
3. **The crash is fully characterised** — and it is NOT caused by any of our patches:
   * every build dies ~1-2 s after launch with `SIGSEGV / SEGV_MAPERR` at fault address
     **`0x47bbd4133bb50001`**, PC in a `std::string` append calling `memmove` inside
     `libpairipcore.so` (frame `#01 pc 0x8d798`); the wild pointer is the *source*.
   * a **re-sign-only build** (all adidas patches disabled — no dex edits, no abort
     patch, VM untouched) crashes **identically**. So does an alt-key-signed build and
     a build with the original `stamp-cert-sha256` grafted back in.
   * conclusion: PairIP's integrity check fires on **any repack+re-sign**, and the
     poison constant is fixed — not derived from the key, the dex, or any hookable value.
4. **The VM's information flow is mapped (from dex):**
   * `VMRunner.openBaseApk()` resolves "its own APK" as: static `apkPath` field →
     `VMRunner.class.getResource("/AndroidManifest.xml")` →
     `context.getPackageManager().getApplicationInfo(...).sourceDir`, opened as a
     `ZipFile`; programs come from `assets/<key>` inside that file.
   * `VMRunner.invoke` fabricates a context via
     `InitContextProvider.tryToCreateContextForBindingApp()` (reflection into
     `ActivityThread.mBoundApplication`) **when `VMRunner.context` is null** — which is
     exactly the state during the startup program, because `MultiDexApplication.<clinit>`
     runs *before* `attachBaseContext` can call `setContext`.
   * `attachBaseContext` = `setContext` + `verifyIntegrity` + `checkLicense` + super.
   * the interpreter's JNI surface (mapped from disassembly): `FindClass` ×162,
     `GetMethodID` ×35, ~one generic call site per `Call*MethodV` return type, plus
     `FromReflectedMethod` ×19 — the programs call Java reflectively through few sites,
     so class/method names only exist inside the encrypted programs.
   * `libpairipcore.so` contains **no** ZIP/APK-signing-block parsing and no signature
     strings — every integrity check is interpreted-program logic driving JNI.
5. **What was ruled out on device** (each: rebuilt, installed, crashed with the same
   constant): signing key (Morphe vs alt keystore), dex content (re-sign-only),
   `PackageInfo.CREATOR` spoof (GET_SIGNATURES + SigningInfo paths),
   installer-source hooks, `stamp-cert-sha256` graft. Java-layer signature spoofs do
   not reach whatever the check consults.
6. **The counter-design is built and wired** (current tree, not yet committed):
   * `PairIpSpoof.wrap(Context)` — a `ContextWrapper` whose PackageManager is a
     generated 94-method delegator (`SpoofPackageManager`) that fakes
     `hasSigningCertificate` → true, `checkSignatures` → match, and redirects
     `getApplicationInfo(...).sourceDir` to `filesDir/pairip-original.apk` when seeded.
   * wired at **both** context sources: `attachBaseContext` (rebuilt: super → wrap →
     setContext) and `VMRunner.invoke`'s InitContextProvider fallback (wrap inserted
     between move-result and setContext).
   * `VMRunner.<clinit>` pre-seeds `apkPath` to `filesDir/pairip-original.apk`
     (`tryOpen` returns null for a missing file → safe fallback to the stock path).
   * the pristine original base.apk was pushed into the app's `filesDir` over run-as
     (the build is debuggable via a diagnostic patch) — 80,322,203 bytes, exact original.

## What went wrong (and what each cost)

1. **Two smali-wiring bugs cost three build+patch cycles** — both in the new pass-3 code:
   * **Double semicolon**: the `SPOOF` constant already ends with `;`, so writing
     `` `$SPOOF;->wrap` `` produced `PairIpSpoof;;->` and the InlineSmaliCompiler lexer
     failed with `[7,66] Error for input ';': Invalid text`. Lesson: the patcher's
     `addInstructions` wraps fragments in a dummy method
     (`.class LInlineCompiler; ... .method dummyMethod(<real params>)V .registers N`),
     so error line numbers are template-relative (line 7 = fragment line 2) — and the
     repo convention `$EXT_CLASS->method(...)` only works because those constants do
     **not** include the trailing `;`. Fixed by dropping the literal `;` after `$SPOOF`.
   * **Off-by-one in `VMRunner.invoke`**: the move-result register lives at
     `initCallIdx + 1`; I cast instruction `+2` (the setContext invoke) to
     `OneRegisterInstruction` → ClassCastException. Verified against the smali dump
     (`tryToCreate → move-result → setContext`) and fixed.
2. **jdb debugging never landed** — `am start -D` suspends for only a few seconds
   (jdb attach lost the race), `am set-debug-app -w` did not hold the app (it ran and
   crashed at 1.7 s anyway), and every attach ended in "The application has been
   disconnected". Heap-dump (`am dumpheap`) during the crash window was the planned
   fallback but was superseded by the dex-level context-flow analysis above.
3. **CURRENT BLOCKER (found in verification, not yet fixed):** the patched dex references
   `Lapp/template/extension/extension/PairIpSpoof;->wrap` but **the class is missing
   from the output APK** — extension classes only merge when the patch declares
   `extendWith("extensions/extension.mpe")` (as `SpoofSignatureVerificationPatch`,
   `GmsCoreSupportPatch`, `SpoofInstallSourcePatch` and the pdb patches do). Without
   it the build fails at the first `wrap` call — `NoClassDefFoundError` — even earlier
   than the poison crash. Fix is one line (`extendWith("extensions/extension.mpe")` in
   `adidasBypassPairIpPatch`), then rebuild → reinstall → re-seed → relaunch.

## State of play

* dex half of 14.12.x support: committed and verified (`dda1488`).
* native abort bypass: committed, verified in every produced APK (3-byte diff, `ret`).
* context shield (PairIpSpoof + SpoofPackageManager + wiring + apkPath seed): built,
  dex-verified, **blocked only on the missing `extendWith` merge**.
* after that lands: relaunch on device. If the shield clears the poison crash, the app
  should reach onboarding; if it still dies, the remaining suspects are (a) the check
  reading its APK through a path that is *not* the wrapped context (e.g. the
  class-resource route, which reads the real installed file), and (b) checks computed
  from data only the original file provides — in which case the next lever is shipping
  the original APK inside the patched build and extracting it at first run.

---

# 2026-11-22 — adidas 14.12.1 closed as unpatchable (device-proven); We Love Deals next

Full device campaign against 14.12.1 (TLS adb): 9 distinct build configurations
installed and measured (see docs/adidas.md § 2026-11-22 for the table). The PairIP
full-VM startup check binds (a) the APK's cryptographic signature AND (b) running
dexes == file dexes; both together are unforgeable, so any dex patch is fatal and the
VM cannot be killed (Application.onCreate/DI are VM-only). **14.12.1 removed from the
adidas compatibility targets; 14.4.0 (method extraction) remains the target.**

Shipped in the tree despite the verdict (reference for future full-VM targets):
version-branched BypassPairIpPatch (14.12.x = VM-alive + verdict sweep + context
shield + seed), PairIpAbortBypassPatch (3-byte abort@plt→ret), the
PairIpSpoof/SpoofPackageManager extension classes, and a debuggable diagnostic patch.
Commit(s) follow. OferHub is being dropped from the campaign as requested (dumb
sample app). Next: We Love Deals premium work.
