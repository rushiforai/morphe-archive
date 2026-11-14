# GPS JoyStick — qualification and device-failure investigation

## Current acceptance and supported input
The current candidate exposes one `GPS JoyStick: Premium` patch and automatically selects the qualified Google Play or official Unlocked policy for original ARM64 5.3.4/3031 APKs. The tester reports the delivered automatic candidate works and subsequently confirmed Maps works with the original key (empty override). Replacing the key is therefore optional, not a required fix. Earlier blank-map observations below are historical and do not describe the latest tested setup; their cause was not established. Phone feedback does not separately establish both distributions or any other ABI.

The pre-consolidation official build passed 123 tests and 12 actual-APK cases across both inputs. Keep exact final-head CI and executable-equivalence gates for consolidation/publication. The optional package-rename feature is deferred; no game anti-detection capability is added.

## Current device status and correction
The `cd93de6` candidate **failed device acceptance on both versions**: Pro features did not work, advertisements remained visible, and Maps stayed black with or without the reference key. Offline APK-delta checks did not establish feature behavior. Do not merge/release or describe that candidate as working.

Root cause found for local entitlements: UI feature gates read a cached tier string and cache age through `Lji/b;->z()I` (5.3.3) / `Lii/b;->u()I` (5.3.4), not the two stored subscription Boolean flags. Both return FREE=1, AD_FREE=2, PRO=3. The previous restore callback change also missed this read path.

The correction changes this app-owned local tier read to PRO and overrides only the separate ad-free preference used by Splash, preserving unrelated keys/defaults. It removes the previous restore-callback mutation. Version-owned pins cover tier, preference owner and enum. Actual original DEX tests reproduce free/ad-free/Pro/expired/future/unknown-cache cases and check real UI feature/ad-entry references. Main initialization's Pro branch bypasses ad loaders; Splash has its own ad-free read, which the later Splash billing callback overrides (see the Splash callback section). This remains a candidate until phone acceptance.

Maps is **not fixed** by this entitlement correction. The optional setting is only a value override, not proof of Google Cloud authorization, signer compatibility or tile rendering. The supplied screenshot shows a black basemap with marker/controls and an advertisement. This was an earlier investigation premise, superseded by the tester corrections above; do not request further logs solely on that retracted premise or transplant protected native code.

## Latest phone correction (supersedes earlier Maps failure reports)
The tester corrected the earlier observations: Maps renders with the supplied reference key configured; an empty option leaves the original key and shows only the light/dark background in the tested setup. Earlier statements that both settings fail are retracted. No new native/signature change or further bug report is required solely on that superseded premise. This does not establish universal or long-term validity of the reference key, nor prove a particular Cloud restriction.

Latest follow-up: the automatic candidate also renders Maps with the original key, so the earlier original-key failure must not be generalized. Keep the Maps option configurable and blank by default; do not publish the private reference key. Document that a usable Maps key may be required after patching. Do not force all users to replace an original key that might work in their setup. The tester has now reported the automatic candidate works; the individual feature/distribution matrix was not enumerated. See [detection survey](gps-joystick-detection-survey.md) for separate game-detection limitations.

## Scope and provenance

Static study followed by a candidate implementation; device/runtime acceptance is not claimed. Candidate
source: `com.theappninjas.fakegpsjoystick`, version **5.3.3 (3030)**, minSdk23,
targetSdk36, ARM64 APK. The supplied third-party ANiK555 reference has the same
package/version/build but a different signing certificate. It is not a clean
baseline, this repository's output, or a source of native implementation to transplant. A reference key can be supplied as a private local test setting, never a public default.
Public indexed APKMirror metadata corroborates the source identity, but the
landing page is challenged; direct page/provenance verification remains partial.

## Premium already includes ad-free

The original upgrade controller (`sd/x.c`) maps the Pro monthly SKU to `PRO` and
the remove-ads monthly/yearly SKUs to `AD_FREE`. Its state application method
`sd/x.e(String)` maps none/ad-free/pro to levels1/2/3. It writes
`PRO_SUBSCRIPTION_ACTIVE` (`zd/f0.P0`) using the level3 predicate and writes
`REMOVE_ADS_SUBSCRIPTION_ACTIVE` (`zd/f0.E0`) for either paid level. The restored
state callback `g3/e.e(int)` follows the same rule; `k7/j.c(int)` is exactly the
level3 predicate.

Therefore the proposed installer-facing feature is **one Premium feature that
includes ad-free**, not a second redundant ad-removal option. App-open,
interstitial, banner, self-served and rewarded/Pro-intent gates are validation
coverage, not automatically separate user-facing patches. Identify all relevant
availability readers and restoration paths before implementation; do not modify a
generic R8 utility globally just because it is used by this flow.

Real Google Billing receipt validation (`ReceiptValidationService.validate`) is
separate from local feature availability. No purchase/validation request was sent;
local behavior must not be presented as a real server subscription.

## Maps is a separate capability

The reference changes the literal Google Maps API key, not merely a resource ID.
Only value hashes were compared; key values are not recorded here or hardcoded in the repository.
This is a verified map-related difference, **not proof that the key change alone
fixes maps**. Re-signing, key restrictions and any extra reference hooks require
independent qualification. Do not embed the reference author's key. A supported
Maps path must be investigated independently of Premium.

## Third-party reference is not a minimal patch

| Observation | Source | Third-party reference |
| --- | --- | --- |
| Classes / DEX | 28,062 / 4 | 28,075 / 10 |
| Same app namespace classes | 417 | 417 |
| Original ARM64 native payloads | 3 | Same three payloads, byte-identical |
| Additional packaging | — | ARMv7 variants plus ANiK555, dexprotector and pixel native libraries |

There are16 added and3 removed class names. The reference also adds six manifest
permissions, including privileged location/settings and package-install requests.
A permission declaration is not evidence that Android grants that privilege.
Do not copy the reference manifest/loader/native additions wholesale.

Its protected/obfuscated DEX triggers invalid-array-payload failures in the retained
SDK disassembler. Partial headers/native stubs are available, but an exact donor
method patch list has **not** been established. No third-party binary was executed.
Independent implementation should start from the readable candidate source.

## Shared capability fit and validation frame

- No expected Pairip license class exists in the source, so the current Pairip
  helper must not be selected automatically. The app-owned installer check `bf/a.b()` is called from the setup/overlay-denial
  flow (`bf/e0.invoke`, event `setup_overlay_denial_shown`), not from Pairip.
  It must be evaluated as Android permission/setup behavior, not blindly bypassed
  with the Java license helper; a spoofed installer string does not itself grant
  a system permission.
- Original certificate identity extraction is reusable only when an independently
  traced app adapter needs it. The Firebase header insertion helper is not a
  general Maps fix and must not be relabeled as one.
- Pinned Hoo-dles and Doom repository trees inspected for GPS/joystick/mocklocation
  path names had no dedicated matching paths. This narrow tree-name check is not
  a claim that no other author supports the app.
- Before changing code: qualify input signer/content pins and all local Pro/ad
  readers; design cold-start, restore/reset, offline and normal-usage tests plus
  unsupported/modified/reapplication guards. Premium must imply ad-free without
  forging purchases. Map loading/search/routing and signature/key restrictions
  have a separate success criterion; no native-hook transplantation or public key default.
- Preserve actual APK package identity, label, signing/update continuity and
  unrelated resources/native payloads. UI title wording is not package renaming.

Next implementation should be scoped from these findings. No implementation,
push, merge or release follows merely from this analysis document.

## Initial rejected candidate implementation (historical)

One public **GPS JoyStick Premium** patch. Reuse shared original-input certificate
identity pinning; no Pairip dependency and no injected extension. App-owned pins
qualify package/build/signer, preference reader, local restore consumer and enum
key definitions. The reader returns true only for Pro/ad-free keys and otherwise
branches to the untouched original body. The local restore consumer normalizes
the client status to Pro before its original preference writes/callback. No
Billing SDK, receipt request, token, purchase object, map key, native library,
permission or manifest edit is included.

Validate actual input transformation/DEX roundtrip/inverse and unrelated-pref
fall-through; cold-start/restore consistency; selected/default/no-op applications;
modified/unsupported/wrong-signer/reapplication rejection with no output. Compare
all class/method graphs and non-DEX payloads against a pristine no-policy build.
Phone acceptance must include local features/no ads, restart, map rendering/search,
normal setup/overlay permission flow and ordinary joystick operation. Maps keeps
the original key and is not claimed repaired by this candidate.


## Map configuration and native follow-up

The candidate now exposes an optional `mapsApiKey` setting on the same Premium
patch. A shared raw payload helper checks the complete original manifest and Maps value
hashes before an equal-length replacement, preserving all other bytes. Public source/defaults/artifacts
contain no reference key. Private local validation uses the value supplied within
the reference APK; device test settings are delivered separately. This provides
a falsifiable key-only map test, not a claimed completed Maps backend repair.

ELF inspection confirms `libpixel` exports generated native_jvm MainActivity
implementations, while `libdexprotector` depends on `libANiK555` and that library
exports a JNI wrapper. This establishes Java-to-native/protection roles but is
not a full reconstruction of every extra behavior. The candidate retains the
three original native payloads, which match the reference byte-for-byte.

## Reference feature audit

| Reference claim | Candidate status / evidence |
| --- | --- |
| Pro unlocked / no ads | Initial Boolean/restore candidate failed device acceptance; current correction targets actual cached-tier UI gates plus Splash ad-free read. Phone recheck required. |
| Fix map | Optional key configuration plus original-hash guard; actual service/rendering acceptance pending. No donor native loader copied. |
| Faster opening animation | Not claimed. A five-second splash fallback is visible, but it is not automatically an animation or safe to remove without tracing/measurement. |
| Clean ads/debug code / useless layouts/dialogs / optimized | Not claimed wholesale. Paid gates should disappear through Premium; necessary setup/error dialogs and resources are preserved. |
| Removed force update | No clearly named app-owned force-update/min-version gate found in current bounded scan. Do not disable all update APIs on this claim alone. |
| ARMv7 + ARM64 | Current clean input and metadata qualified for ARM64 only. ARMv7 needs its own original-input qualification, not transplanted donor payloads. |
| Languages | Original resources retained; no language stripping. Individual language UI tests are not claimed. |


### Resource-mode correction

The first full-resource implementation passed unit tests but real APK comparison
showed unnecessary manifest/resource-table rebuilding even with a blank option.
It was rejected. The revised raw-resource dependency leaves blank input untouched
and permits only a39-character key payload replacement in the pinned binary
manifest. Both source and pristine no-policy manifest hashes are identical for
this input. Unit tests cover UTF8/UTF16LE, byte inverse, missing/duplicate literal,
modified manifest/value pin and malformed key; actual AXML is qualified too.

### Raw manifest staging integration
The configured-key APK test caught a second integration defect: raw resource mode stages binary AXML as `AndroidManifest.xml.bin`, while the canonical `get("AndroidManifest.xml")` points at decoded XML, which does not exist in raw mode. Resolve its binary sibling, require it to exist, and retain raw export (the coder maps `.bin` back to the original APK entry). Do not enable full resource decoding as a fallback. Byte-helper unit tests alone do not cover resource-context staging; configured-key APK qualification is mandatory.
Direct raw-context export also established that editing `.bin` alone does not place the replacement in the returned raw payload. Read the pinned binary sibling, then stage replacement through the raw-root `get("./AndroidManifest.xml")` entry. The configured original APK preflight verifies exact exported bytes and absence of resource compilation; blank options stage nothing. Full APK qualification remains the acceptance gate.

## GPS JoyStick 5.3.4 (3031, ARM64) adapter
New user-supplied original APK SHA256: `2a884eff1e6c644fb286b9a0c5d673bd1e7e4dc96f208a72c315a11c20ce7289`. Cryptographic signature verification passes with the same original signer. All three original native libraries and the Maps key value are unchanged; the manifest has a distinct pinned hash.

The upgrade re-obfuscates preference access: `Ln6/k;->m(Lpd/f0;Ljava/lang/Object;)Ljava/lang/Object;` replaces the 5.3.3 getter. The enum keys are now `O0=pro_subscription_active` and `D0=remove_ads_subscription_active`; reusing the old `P0/E0` field names would affect unrelated settings. The original getter still has six registers, reads SharedPreferences and retains the same fallback/NumberFormatException semantics. `Lg3/e;->e(I)V` still has eight registers, sets ad-free for status 2/3 and Premium for status 3 via `Lf2/l1;->b(I)Z`, and preserves callbacks.

A version-owned adapter binds exact version/build pairs to their own getter/enum names, three complete class hashes and manifest hash. Both 5.3.3/3030 and 5.3.4/3031 remain separately qualified; crossed version/build pairs are rejected. Tests exercise emitted control flow for both sets, explicitly treating the other version's field names as unrelated. This initial adapter failed phone acceptance; see current status above.

### Corrected local-tier validation
Actual original DEX interpretation now reproduces ten cache scenarios per version: missing/free/ad-free/Pro tiers, normal/stale/grace-boundary/expired/future timestamps and unknown values. The corrected app-owned tier read returns 3 before any cache access. Main Activity's initialization is traced through the original Pro classifier to the ad-loader skip branch; GPX import/export are confirmed callers. Splash's separate ad-free preference is overridden narrowly; unrelated keys retain the original method/body/default. The receipt/cache write and restore callbacks are no longer mutated. These tests still do not replace phone acceptance or solve Maps.

## Separate 5.3.4 distribution inputs (superseded presentation)
Drop 5.3.3. Expose separate Google Play and Unlocked public patches, both unselected by default because package/version/signer metadata cannot distinguish their inputs. Each adapter owns three distinct class pins, its manifest pin and its ad-free enum field; shared code does not imply compatible inputs.

Original ARM64 APK SHA256 inventory:
- Google Play/APKMirror 5.3.4/3031: `2a884eff1e6c644fb286b9a0c5d673bd1e7e4dc96f208a72c315a11c20ce7289`.
- Official Unlocked 5.3.4/3031: `5f79d33c19066f564cc454a1fc9731ce09b10273997e0f0a2c1df91cc457cfc9`, matching the official download page.

Unlocked uses the same tier resolver signature but different class contents/cache references (age L vs H) and ad-free H0 vs Google Play D0. Its original Maps key equals the Google Play original, not the private reference test key. APK checksums establish qualified source acquisition; patch-time checks use the original certificate, exact version/build, three canonical class hashes and the optional full manifest hash. Do not claim whole-file checksum matching is exposed by the patcher metadata API.

## Single public patch with automatic distribution dispatch (current candidate)
Motivation: two public patches with identical compatibility metadata force a manual choice and guarantee one mismatched branch. The user requests one feature entry. This supersedes the split presentation above, not its independent input qualification.

Expose only `GPS JoyStick: Premium`, selected by default. Its private original-input dependency checks package/version/build/certificate and computes the three original class hashes, accepting exactly one complete policy set. Both known distributions remain supported; mixed, missing, unknown or ambiguous policies reject before mutation. The detected policy is shared with the raw manifest option and the two feature edits; unused policies are data, not failing patch dependencies. Whole-APK checksums remain the acquisition inventory, not a claimed Manager selection API. No package identity changes.

Success criteria/tests: one catalog entry/options set; exact Play and Unlocked content dispatch to their own ad-free field; both actual APKs pass explicit/default/key-configured applications with only intended edits; unselected input unchanged; old or modified input rejects. Unit tests cover unique matching, unknown/missing/mixed hashes and ambiguous duplicate policies. Official exact-head CI, catalog and private-key absence checks remain required before delivery. Phone acceptance remains separate.

## Splash billing callback overrides the ad-free read (v0.6.0 regression)
Motivation/root cause: on v0.6.0 a phone with Pro unlocked still showed an AdMob App-Open ad on every cold start (screen recording: Splash spinner, ad with a continue card, then Main). Splash first reads the ad-free preference into its ad-free field, but Splash can only continue after `Lse/a;->a(Z)V` (the billing-restore result callback invoked by `Lg3/e;->e(I)V`) sets its readiness flag. That callback also assigns the ad-free field from the real purchase level (`level != FREE`), replacing the patched preference value. With no real subscription the field becomes false and Splash loads and shows the App-Open ad. The tier and preference hooks therefore never covered this path.

Fix: a fourth app-owned class pin (`Lse/a;`, one hash per distribution) and one instruction at the start of that callback that forces the received value true. Billing, receipt and preference writes, the tier hook, the preference hook, natives and the Maps option stay unchanged.

Success criteria/tests: only `Lse/a;->a(Z)V` gains the first instruction; wrong owner, flags, parameter shape or register count rejects before mutation; policy pin sets include the callback class and differ per distribution; the actual patched APKs for both distributions differ from the originals in exactly the tier, preference and callback methods; unsupported or modified inputs still reject. Phone acceptance (no Splash ad on cold start) is a separate check.


## Maps key option failed with the current Morphe Patcher (v0.6.1/v0.6.2 regression)
Root cause: bundles built with Patcher 2.3 run with decode-on-first-use behavior. Requesting the decoded `AndroidManifest.xml` path decodes every resource, so the staged `AndroidManifest.xml.bin` sibling never exists and a non-blank Maps key failed with "Missing raw GPS JoyStick manifest". The blank-key path never reached that code, so earlier blank-key regression runs did not show it.

Fix: edit the decoded manifest with the standard `document("AndroidManifest.xml")` API only when a non-blank key is supplied. Exactly one Maps API key element whose literal value matches the app-owned original-value pin is rewritten; missing, duplicate or unexpected values reject before mutation. The raw-manifest hash pin is dropped because the engine no longer stages a binary manifest. Raw-root path variants (`./AndroidManifest.xml`, `.bin` sibling) were tried against the current engine and still failed. Success criteria: the official MPP applies with a non-blank key to both distributions with exactly the key bytes changed, blank-key output unchanged, and blank-key output unchanged. The decoded-manifest patch makes the engine recompile the resource table even for a blank key, so `resources.arsc` bytes differ from the original; the full `aapt2 dump resources` output of the blank-key and key outputs is identical to the original (36101/36055 lines, Google Play/Unlocked), and the non-DEX entries are otherwise unchanged. Attempts to keep blank-key output byte-identical through the raw-resource route (reading `AndroidManifest.xml.bin`, `./AndroidManifest.xml`, or `document()` in a raw patch) all failed with the current engine.
