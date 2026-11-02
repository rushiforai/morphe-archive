# 2dehands 16.19.0: Marktplaats patch compatibility

Inspected 2026-11-01 using leanrea, JADX 1.5.6, Apktool and Android
`apksigner`. This is original-artifact research and a proposed port design;
it is not a supported-app declaration or a claim of runtime privacy.

## Result

**A port is feasible, but the existing Marktplaats patches cannot be applied
unchanged.** Both apps use Horizon and expose equivalent advertising, analytics,
consent and security-profiling paths. Their compiled code and publisher identity
differ. Adding the Belgian package to the Dutch compatibility list would leave
wrong method bindings and would not meet the requested complete removal of ads,
tracking and consent forms.

At the end of this initial audit, Belgian patches, rebuilt output and runtime
acceptance had not yet been produced. Implementation subsequently proceeded with
user approval; see the [development controls and validation record](../../privacy/2dehands/README.md).

## Original artifact identity — seen

| Property | Inspected value |
| --- | --- |
| Input | `2dehands-be-16-19-0.xapk` |
| Package | `be.tweedehands.m` |
| Version / code | `16.19.0` / `633464` |
| Minimum / target SDK | `32` / `37` |
| Application | `com.horizon.android.HorizonApplication` |
| Base APK SHA-256 | `ad0dcf64e7b4e1a85bf908d821b854be79566f919496fd2576f517494967f6b1` |
| Publisher certificate SHA-256 | `7c2c46aca6a23f0523b69cac1a21f03078be6fd41b3811874c4be1344c23ba47` |
| Publisher certificate SHA-1 | `5bfb2470c28371c4273ca0232a57c120977619d3` |
| Archive | Base, `alertscentercompose`, ARM64/ARMv7 and four density APKs |

All eight APKs passed `apksigner verify --print-certs` and share the above
publisher certificate. The base contains six DEX files; the Notifications
feature contains another DEX. ThreatMetrix native profiling libraries are in
both ABI splits. See [the hashed inventory](inventory.json).

## Exact-binding comparison — seen

Compared `tests/marktplaats_1619_contracts.json` with the Belgian base decoded
using Apktool. Method bodies were normalized with the repository's
`brabant_smali.canonical` and compared using its code/switch/handler/array digest.

| Existing Dutch audited method bindings | Count |
| --- | ---: |
| Same owner/signature and identical canonical instruction digest | 16 |
| Same owner/signature, different canonical instruction digest | 33 |
| Owner/signature not present at that Dutch binding | 56 |
| Total | 105 |

These are binding checks, not a percentage of app behavior covered. Missing
bindings can be renamed equivalents; different digests can include renamed
references rather than changed semantics. Neither category is safe to reuse
without auditing. [Each binding and result](binding-comparison.json) is recorded.

Six additional entries in the translation table are field references, not method
bindings, and are excluded from the method count above.

Across the broader 1,968 Dutch retained-method contracts, 802 canonical digests
match, 305 differ and 861 methods are missing at their Dutch names. All six raw
base DEX payloads differ from the inspected Dutch 16.19.0 API32 original.

Examples: the Dutch consent client `Ltm3;` is `Lhl3;` in Belgium; its controller
`Lum3;` is `Lil3;`. The Dutch analytics hub `Lffa;` corresponds to Belgian
`Ln7a;`. Adjust's inspected entry methods retain exact bodies. The public
Marktplaats compatibility guard accepts only `nl.marktplaats.android` and its
different certificate, so it correctly rejects this input.

## Controls and gaps

| Area | Original-artifact evidence — seen | Implication — inferred |
| --- | --- | --- |
| Display/native advertising | Horizon advertising repositories, Google NextGen initializer, OpenWrap/Prebid consumers, `SearchResultItemType.SRP_HEADER_NATIVE_AD`, `SRP_LIST_NATIVE_AD`, `DISPLAY_BANNER`, and `VipContentSection.DISPLAY_BANNER` exist. | Reuse the Dutch removal strategy after auditing Belgian bindings and callback completion. |
| Publisher advertising measurement | `Lbog;->d()` configures `https://www.2dehands.be/metrics`; the same provider configures Belgian functional API roots separately. | Stop the ad/metrics consumers without blocking all publisher API traffic. |
| Analytics/marketing | Belgian `Ln7a;` is wired to Firebase, page/event/property commands and Gemius. Adjust, Braze, Facebook, Datadog, Firebase and UserZoom code/integrations are present. | Port admission, initialization, lifecycle, queue/upload and re-enable controls; SDK presence alone does not establish an observed transmission. |
| **Gemius/CIM** | `Lr03;->a()` configures `app_2dehands` and `https://gabe.hit.gemius.pl`; `b(Z)` calls `Config.setUserTrackingEnabled`. `Ln7a;->m(...)` builds and sends `AudienceEvent` for tenant `TWH` when `BNL4446` is enabled. Consent callbacks also initialize/configure it. | Add explicit Gemius initialization, event and buffered-send blocking. Denied identifiers alone is insufficient evidence of no measurement. Current Dutch patch source has no explicit Gemius control. The original feature-switch value on a live account is unknown. |
| Consent | `Lhl3;->onUIReady(View)` calls `showView` and focus/accessibility methods. `b` distinguishes options/manual behavior. Sourcepoint exposes `rejectAll(GDPR)`, with native asynchronous result/error paths. | Port real rejection and closure handling. The current Dutch patch intentionally retains manual privacy screens and falls back to native display when its library is unavailable, so copying it does not prove **all** forms are removed. |
| ThreatMetrix | Horizon's wrapper configures `faas.2dehands.be`, and both ABI splits contain `libTMXProfiling-7.7-71-jni.so`. | Port initialization and header/profile-wait blocking. Original backend acceptance without profiling is unknown. |
| Paid/promoted content | Dutch `AdSlots.kt` removes three display/native search item types and the VIP banner. Dutch privacy documentation explicitly retains promoted seller listings and business subscriptions. | A complete ad-free target needs an additional audit/filter for paid placements and promotional surfaces; inheriting the Dutch policy would preserve advertising. Ordinary classifieds must remain usable. |
| Payments | Existing Dutch SDK telemetry policy retains the initial Adyen setup/attempt-ID exchange. | Audit Belgian setup payloads and optional fields separately; existing optional-event suppression does not establish zero checkout telemetry. Preserve real transaction results. |
| Split feature | The supplied archive includes `alertscentercompose.apk`. | Merge all applicable splits, retain the feature ABI and fused-module registration, and reject incomplete inputs. |

Evidence symbols above are from the decoded Belgian base, except where explicitly
identified as Dutch source/documentation. `JADX` may alias names in its Java
output; exact descriptors were taken from decoded smali. The full extraction is
under `$TMPDIR/re/2dehands-16.19.0/` (`decoded`, `jadx`, `audit.json`).

## Proposed implementation design

Use dedicated Belgian compatibility and patch entry points with separately
audited method/type/field bindings and input hashes. Share the established
Horizon operations where their semantics match. Keep app-specific additional
controls explicit. A package-only compatibility extension is ruled out by the
binding and policy gaps above. Copying the entire Dutch implementation would
also duplicate future maintenance while retaining those policy gaps.

For the requested target, enable removal of advertising, optional tracking,
Gemius, ThreatMetrix and consent UI by default. Cover startup and manually opened
Sourcepoint forms, repeat callbacks, missing-library/error paths and previous
stored grants. Use genuine reject-all state/callbacks where necessary; never
fabricate consent, payment, authentication or security success. Audit promoted
placements rather than silently treating the existing Dutch slot list as the
complete definition of advertising.

Retain functional listings, search, chat, seller operations, notifications,
authentication and payments insofar as the backend permits them without optional
profiling. Functional data supplied to these services and their ordinary IP-level
visibility still exist; this is not proof of an anonymous marketplace protocol.

## Acceptance required before completion

| Requirement | Authoritative evidence still needed |
| --- | --- |
| Correct Belgian input and complete Notifications module | Production package/certificate/version/split guards; reject changed and incomplete inputs; inspect merged original and rebuilt declarations. |
| Advertising removed across surfaces | Audited Belgian request/admission/slot/metrics edits and rebuilt-output verification; device checks for home, search, listing, related items and promotions. |
| Optional tracking and profiling stopped | Rebuilt admission/lifecycle/queue/re-enable checks including Gemius and ThreatMetrix; runtime network evidence across startup, browsing, background/resume and stored-grant states. |
| All app consent forms removed | Verify startup, settings/manual routes, repeated callbacks, previous decisions, configuration/network errors and missing-library behavior on device; verify rejection semantics independently of UI closure. |
| Usable marketplace | Startup/search/listing/chat/Notifications and account flow acceptance; explicitly bound payment and protected-action results to what was actually tested. |
| Installable deliverable | Build, signature verification, complete feature/native-library inventory and actual install/launch evidence for the tested device. |
| Dutch behavior preserved | Existing original/rebuilt Marktplaats contract checks against genuine fixtures after any shared-code change. |

No installation, account action, transaction, decrypted traffic capture, source
patch, commit, push or release was performed in this research pass. Runtime
destinations, server behavior and exhaustive tracking freedom remain unknown.
