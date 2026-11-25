# Capture-fault snapshot acknowledgement loop

## Observed product failure

Run56 used the unchanged signed Waze27/Vela02 cohort and existing observer.
Native Vela car settings and its provider selector were reachable through real
AA17 UI. Selecting De-Waze started a new observed Waze process; the UI reported
warning API connected, engine running/provider muted and fresh data, but
incomplete warning capture and unreviewed output. No warning playback was
accepted from that state.

The final failure was observer-budget-exhausted, not process death. Waze PID10322
made 5,183 RESUME and 5,115 ACK calls in roughly61seconds, reaching the existing
12,000-event observation cap. The late tall-profile keyboard capture crossed
that coverage boundary and is excluded. The earlier settings/selector captures
remain qualified evidence. Actual APK inspection confirms NativeWarnings.bound()
returns true; this was not an unbound-marker workaround.

The provider's deliver() invalidated any synchronized registration whenever its
sticky captureFault was true. A receiver fetched and acknowledged a snapshot
showing that fault, then ACK immediately called deliver(), which sent the same
invalidation again. Receiver resynchronization repeated the cycle without new
source data. This is a product control-plane feedback loop, not justification
to increase the frozen observer budget.

## Correction and safety boundary

Each frozen view now records the capture-fault state it contains. ACK retains
that state per registration. A new fault still causes invalidation, but an
acknowledged fault alone does not invalidate the same state again. Genuine
journal gaps continue to require resynchronization, and valid later records
can still be delivered. A healthy view frozen before a fault cannot acknowledge
the newer fault. The wire protocol is unchanged.

The source capture fault remains sticky. Capture completeness stays false and
new audio claims/attempts remain blocked by the existing overflow fence. The
change does not manufacture capture completeness, discard uncertainty, reset
the durable output ledger or change native results/policy. Its initial cause
remains to be identified during native acceptance.

Normal application error logging now records only the first bounded fault
reason: native-capture overflow, ingress/callback queue overflow, journal
overflow or an invalid-event code/field name. It excludes native packet dumps,
messages and coordinates. No observer, probe, fixture, runner or validation
framework was changed.

## Grouped verification

The two transport regressions first ran against the previous endpoint in the
isolated checkpoint30 workspace. Both failed at repeated-invalidation
assertions, with no test setup errors. The fixed endpoint then passed the
complete canonical verify.cjs set, including all Android modules, Python,
release/identity/history, Medium and strict bilingual documentation checks.
The regressions also require the audio claim to stay OVERFLOW and later valid
records to arrive, and cover a fault that appears after a healthy view freezes.

The same built/signed MPP passed actual Waze21-selection and FM15 nine-selection
patching in FULL/validate mode, test signing, certificate verification and
alignment. Input APKMs were staged inside owned job storage before the existing
Morphe CLI performed its normal split merge. Temporary inputs, patching scratch,
unsigned APKs and the isolated build checkout were removed after owned-process
and storage quiescence proof. CleanupRequired=false. Exact input, bundle and
APK hashes, expected before-fix failures and final test records are retained in
the private checkpoint30 receipt. Signed engineering MPP SHA-256:
`d4e9fdcafb30bb2b8beefec2eeb47c5f8d062ff4b99c95369581c71e0b7c2e91`.

Native acceptance of the correction remains pending. Preserve already accepted
receiver route/rendering/speech and API-owned expiry evidence where unaffected;
do not claim the remaining profile/DPI/controls or external-warning modes are
closed. Run56's baseline APKs/audio/debug/role/GPS were verified restored, its
owned runtime/server/forwards stopped, and scratch archived/removed. No physical
phone was touched and no stable release or main promotion occurred.


## Native acceptance and initial journal pressure

Run57 kept the snapshot correction observed without exhausting the unchanged
budget. Its exact181.7-second RPC window recorded562 requests, about3.09/s,
versus about169.28/s in the earlier faulty window. This is a functional trace
comparison with live native data, not an uninstrumented benchmark. The passive
sample exceeded its intended60seconds; app/overall hard deadlines and full
coverage/restoration/cleanup passed. The remaining capture fault was identified
by normal application logging as JOURNAL_OVERFLOW.

Only seven warning IDs had emitted259 records in17.671seconds before that
fault:126 CLEARs and133 display-only UPSERTs. The adapter cleared an already
invalid/silent warning on every repository refresh and immediately re-added
it as display-only. The journal legitimately retained those revocations; this
unnecessary churn exhausted history even with only a few current warnings.

The Waze adapter now clears prior authority only when entering display-only
state, preserving ordinary removals and true demotions. Repeated display-only
updates refresh state without another CLEAR. Journal limits, retention, gap
handling, native validity/silence decisions and audio grant rules are unchanged.
A later valid snapshot still cannot resurrect the cleared old sound authority;
a fresh original native sound decision can create a newer authority.

The two adapter regressions fail on the prior code at repeated-clear count and
actual journal overflow. The correction passes the canonical Android build/test
component and real Waze21-selection FULL/validate patching, signing/certificate
and alignment in checkpoint31. Unchanged non-Android checks are retained from
complete checkpoint30; the final complete verification gate remains pending.
Other navigation extension payloads are byte-identical to checkpoint30, so
unaffected receiver and FM input evidence stays reusable. No new observation
or validation framework was introduced.

Run59 then observed376 repeated UPSERTs over93.13seconds from the first native
emission, across four live warning IDs, with zero CLEARs, no selected-process
capture-fault log and full unchanged-observer coverage. The native Vela provider
page showed Warning bridge connected without the incomplete-capture warning,
engine running/provider muted and data connected/receiving. Output choices were
still unreviewed, so no warning playback is inferred. The passive sample ended
after the intended60seconds; the exact duration, met app/overall deadlines and
limits are preserved. Baseline APKs/audio/debug/role/GPS were verified restored;
owned server/forwards/snapshot/runtime stopped or removed and scratch archived.
CleanupRequired=false. Phone untouched.

The first run58 startup had been rejected before any app operations because
the Mac had insufficient disk space. It remains a failed startup, separately
archived. Audited retirement of the task's obsolete3.96GB lavapipe quickboot
cache preserved the newer verified AA51 snapshot, current userdata/image,
source work and every original/current APK path. No unrelated worktree, AVD,
cache or phone artifact was deleted. No rebuild was needed for the retry.

Private receipts are source-snapshot-native57.json,
waze-display-demotion-verification31.json and source-journal-native59.json.
Current signed engineering MPP SHA-256:
`0ca8820a096a3751a6996de103946179ae2b603c2a57cc548a6515ea088d4019`.
The remaining profile/DPI/control and external-warning output gates and final
complete verification are still required; no stable release/main promotion
occurred.
