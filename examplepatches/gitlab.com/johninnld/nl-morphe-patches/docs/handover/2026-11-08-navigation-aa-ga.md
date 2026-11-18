# Navigation Android Auto: GA decision and post-GA handover

Updated 8 November 2026.

Owner UI revision216 supersedes the earlier visible fallback/average captions described below: the shared renderer now uses the supplied numeric/icon-only mockup pack, with the same average icon switching from entry metres to average km/h and an independent section bar. New256px icon provenance is in the current catalogue. Canonical renderer/build checks pass; the signed engineering artifact and deferred original-AA capture are tracked in `.analysis/numeric-warning-pills-216/receipt.json`. Prior drive images retain data/lifecycle proof but do not show this revised shape. The shortened-text defect is removed in the revised source rather than left as a post-GA styling task.
 Owner requested a quota-conscious wrap-up: retain major user-impacting findings, defer the remaining validation and quality-of-life work. Deferred means unverified, not passed. No new APK, main promotion or release was produced by this closeout.

## Product-owner answer

The approved speedometer, separate alert pill and separate average-speed panel are implemented in Maps and Vela. Real original-Android-Auto driving captures show the current/maximum speed and average panel together without collision at the owner's 1280×480 viewport. Vela also has a genuine FM zone-end alert-pill capture. There is no demonstrated remaining major overlap in those retained frames.

That does not close every UI case: the latest Vela density change has not been inspected live, expanded player/host-overlay reflow is not fully accepted, and current Waze-to-Maps/Vela driving has no equivalent accepted proof. These are coverage gaps, not proof of a current rendering defect. Do not advertise those cases as fully validated.

DriveDeck is not required. Original AA renders the standard directions/ETA/actions. The custom speed/warning/average indicators respond to AA surface-area callbacks; there is no arbitrary public template slot for our exact custom widgets. The current source implementation replaces the historical DriveDeck-only handover proposal.

## Evidence matrix

| Receiver / provider | Current and maximum speed | Extra warning pill | Average-speed panel | Honest closure |
|---|---|---|---|---|
| Maps + FM15 | Real 100/100 during the full A4 drive; final speed0 | Generic design approved; genuine approach state also captured; all19 original icons packaged | Real99→100km/h, progress approximately40→73%, remaining2.5→1.1km; clears after exit | Core1280×480 rendering demonstrated on current executablec1a8a90e. Dynamic host-overlay placement remains unaccepted. |
| Vela + FM15 | Real100/100 during A4 navigation | Real native zone-end event rendered above speed; generic complete design approved | Real98→99km/h, progress approximately20→62%, remaining3.4→1.6km, then clear | Demonstrated by185/sourcefeab48a5. Later4c571859 host-density adjustment built and patched successfully but has no new live Vela capture. |
| Maps + Waze5.27.0.1 | Consumer speed/limit path and Waze build admission exist | Uses the same receiver/shared pill renderer and normalized event contract | Correlated native segment/telemetry path exists | Current natural-feed AA driving coverage incomplete. FM proof does not prove Waze delivery, values or clearing. |
| Vela + Waze5.27.0.1 | Consumer speed/limit path and Waze build admission exist | Same common glyphs/pill semantics as FM | Same common visual panel, provider-specific data qualification | Same Waze coverage gap; no basis to assert a provider-specific layout bug or complete acceptance. |

The ordinary alert and average panel are separate states, not duplicate speedometers. Unknown distance/average/direction is withheld or shown as native text; missing source values must not become invented0m,130km/h or Behind. A19-icon vocabulary is not19 naturally observed event families.

## Known problems and what users notice

| Priority | Issue and current evidence | User impact | Next work; disposition |
|---|---|---|---|
| High, functional | Maps End navigation did not leave guidance in210/213.213 proved the trusted AA Exit callback reached native modelrvp.d and returned normally. Earlier193 End succeeded on an older input. | A user can press Exit and remain in navigation. This is a real unresolved functional failure, not a cosmetic issue. | Trace the original End request and native GUIDING→CRUISING propagation. Do not remove cards optimistically or force native state. Retain as a prominent GA known issue if shipping before correction. |
| High, alerting | Maps/FM entry speech started and then lost audio focus in210; exit speech completed. | The beginning-of-zone announcement may be cut short, although visual zone progress remains visible. | Attribute the existing2-argument focus-request hook to its native caller and coordinate native voice without altering grants/eligibility. Record as a GA known issue if deferred. |
| Unverified UI risk | Expanded player/dock/host-overlay movement and full Vela latest-DPI rendering not accepted. | On an untested layout, a custom pill/speed card might be clipped or overlap a reserved area. The checked1280×480 frames do not show that defect. | One focused original-AA overlay/DPI check per receiver when work resumes. Do not rebuild a design gallery or repeat the full passing drive. Deferred by owner; not marked fixed or passing. |
| Unverified provider risk | Current Waze natural warning/speed/average data on both receivers lacks matched final AA proof. Historical104 rejection of5.27 was corrected: current runtime admission accepts5.27.0.1/1030748. | A Waze-sourced indicator could be absent, stale or incomplete despite a correct shared renderer; current evidence does not establish that it happens. | One real Waze camera/segment scenario per receiver before claiming full Waze AA acceptance. Deferred validation; do not substitute artificial UI or FM data. |
| Low, visual | When a genuine event has no qualified distance, compact native fallback text can ellipsize, e.g. “End of ave...” in Vela185. | Less readable event wording; does not alter current speed, limit or numeric zone progress. | Review a shorter localized semantic label later; retain fixed approved pill dimensions. Post-GA. |
| Coverage only | Other resolution/DPI combinations, long-session reconnect/teardown, scroll/rotary reachability, full event catalogue and independent speech transcription are incomplete. | Unknown compatibility outside proved cases; no newly observed defect inferred from missing coverage. | Post-GA targeted checks, retaining actual failures as separate bugs. No claim of complete end-to-end certification. |

The Maps camera regression is closed for the matched full A4 drive: native voice recovery now avoids INSPECT_STEP.210 recorded one voice-only recovery, zero step-inspection calls and the blue current-position arrow on A4 throughout the288-point drive. Reuse that passing proof.

## Review the actual captures

The owner-facing copy in Downloads embeds the following unchanged SDK PNGs. They are1280×720 encoded images with native120px top/bottom margins, presenting1280×480 at160dpi. Only GPS was simulated for these real-feed captures.

- `~/Downloads/Android-Auto-Functional-Review/Voice-Recovery-210/zone-progress-1280.png`: current Maps/FM speed and average UI.
- `~/Downloads/Android-Auto-Functional-Review/vela-fm-zone-progress-185.png`: real Vela/FM speed and average UI, before latest density change.
- `~/Downloads/Android-Auto-Functional-Review/vela-fm-zone-end-185.png`: real Vela/FM extra warning pill.
- `Voice-Recovery-210.md`, `Vela-FM-real-drive-185.md` and their provenance/receipts explain precise limits.
- `Voice-Recovery-210/audio-manifest.json` identifies actual source8 PCM WAV excerpts. Their linguistic content was not independently transcribed. Do not autoplay them.

## Engineering resume state

Worktree: `/Users/jneerdael/Scripts/nl-morphe-patches/.tools/worktrees/navigation-startup`; branch `feat/waze-native-warnings-v138`.
Executable source: `c1a8a90eee91de15e40bc7c16a8de781783ab870`; responsive UI source: `4c571859f18299232c871ffe7e5eec5c81af8b9d`. Baseline documentation commit before this closeout: `757a6e5b3d487bc5a6bb1d0764db36c287018473`.
Fresh read-only GitLab main fetch during closeout215: `f7b2bc50390501b3e38a83dff58902d99d54eef4` (v1.53.10), already an ancestor of this branch. No new upstream integration is needed; history was not rewritten merely to change its ancestry shape.

Signed engineering MPP: `~/Downloads/nl-morphe-navigation-c1a8a90eee91.mpp`, review version `1.53.10+review.c1a8a90eee91`, existing Morphe signing identity. It is not a published GA release. Current per-app signed inputs/hashes are in `~/.local/state/nl-morphe-patches/emulator-baselines/navigation-api34/inputs/acceptance-inputs.json`; source APKs remain under that baseline's `inputs/source-apks/`.

Required canonical build/real-original patch checks passed204/208, with unchanged gates explicitly reused; documentation checkpoint212 passed. Do not rerun unchanged full builds solely for this handover. No maintained validation tooling, fixture or framework changed in this closeout.

Useful source: `extensions/extension/.../CarSpeedPlacement.java`, `ExternalTelemetry.java`, `CompactSpeedView.java`; `extensions/vela/.../CarUi.java`; shared `CarWarningPills`; `extensions/maps-gearslip/.../NativeGuidance.java`, `NativeCarService.java`, `NativeCarContent.java`. Read the current navigation-indicators and car-navigation-widgets contracts before changes. The November7 layout plan contains historical DriveDeck-extension statements; its new supersession note points to the current contract.

Private evidence: `.analysis/maps-voice-recovery-acceptance-210/`, `.analysis/maps-End-focus-acceptance-213/`, `.analysis/maps-End-chain-diagnostic-214/`.214 armed the native End trace but did not reach the End action: native phone navigation welcome/data notices held URI startup. It is setup evidence only. Owner wrap-up stopped the session; it does not close or contradict213.

When resuming End diagnosis, the original static chain is `rvp.d → rdn.run(case14) → bmxc.j → rni.g/sB → ryt.n/k → ryq.d → blys.f(FREE_NAV)`. Actual branch/request execution still needs observation. Reuse214's bounded private read-only chain probe and211's distinct focus probe; preserve native results. Avoid another long decompilation or general observer project.

## Stop and cleanup state

214 DHU, all seven Frida clients, owned guest server and emulator terminated with exit0. Owned8559/58277 ports are closed; guest executable, private auth header and forward removed; no moving GPS replay ran. Exact Maps installed hash was verified before stimuli. The reusable canonical AVD/backing disks, source, signed inputs and compact evidence are retained. Other emulator5556 and physical USB devices were not operated. No release/push or physical-phone installation occurred.

Resume only the selected high-impact work. Additional UI variants,19-event galleries and full-drive repetition are outside this quota-conscious closeout. The deferred checks remain an explicit post-GA backlog, not completed acceptance.
