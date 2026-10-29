# RTL Nieuws development increment

Implements the next app in the approved [sequential rollout](2026-10-28-dutch-app-rollout-design.md).
The user delegated implementation choices and regular dev publication. This
supplement records the implementer's version-specific choices; it does not
expand the request into subscription or account modification.

Target `nl.rtl.rtlnieuws` **12.7.1 / 1558**, minSdk32, original Play APKS.
Publisher signers observed across Android signing schemes:
`80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` and
`862a0a19d90fe0c678bde313d7a8606e3a97a0c209ab0b56626eb8eaf18571f9`.
Original archive SHA256
`36e10532e3c20ae12d87f4e58d8aefa9e92bf3a7456feffe78187e4f7a33aa08`;
base SHA256 `85aacb2b5785c338a9801a57fe71f57f41d47bae1ada56ef19fee9b8520299e4`.

Three controls: Hide ads; Disable tracking (includes ads); Skip consent screens
(includes both). Use separate `patches.rtl` files, the original-input guard and
independent original/selected verification. Preserve every existing app's
catalog and compiled payloads. Main publication remains outside this increment.

RTL's DPG and Bitmovin contracts differ from the newspaper apps. Use native
no-ad inputs and terminal result callbacks before scheduling; preserve actual
layout completion, media token/play/DRM and all account/payment outcomes.
Do not change global ad-free account state/JWT claims or return success from
purchase/acknowledgement operations. A blanket ad-host filter would break
shared news/player/auth services; SDK-name reuse without binary contracts is
also insufficient. Reuse infrastructure and verified control-flow ideas only.

Initial ads scope covers the common DPG placement path and its zero-height
completion, the independent branded GAM route, regular video's existing
AdFree/no-VMAP path and native empty advertising configuration, and separately
reachable native-creative/legacy ad paths where their contracts are established.
Vertical video is already ad-free and must retain ordinary loading. Do not
invent SSAI removal or access to server-withheld media.

Tracking covers app and SDK send/queue/startup/re-enable paths, all three
editorial video analytics configurations and their source/session variants,
optional advertising/profile identifiers and real typed readiness results.
Persisted SDK queues are part of the acceptance boundary. Swrve/Firebase and
privacy/account services have mixed functional roles; preserve genuine push,
configuration, feedback, login and DRM work. Narrow URI policies require proven
roles and retain functional bridges. Disclose remaining/unknown SDK traffic.

Consent distinguishes automatic refresh from explicit manual preferences and
must complete the original busy/ready state transitions without writing a
choice. RTL's native Unit/Continuation and disabled result types are independently
pinned; no Kotlin newspaper descriptor or null/Unit substitute is assumed.

Acceptance: original-negative checks, each individual and combined Desktop FULL
application, signatures, emitted callback/player/queue/state semantics and
retained functional hashes. One fresh review, material RED→GREEN fixes, and a
verified dev release. Promote the existing research-only README section with
domains/purposes/data/effects and exact source-versus-capture labels. Phone
acceptance stays distinct and pending until the user tests it.
