# TikTok hook discovery and update workflow

## What is automatic

Every TikTok `Fingerprint` declaration now participates in the shared hook inventory.
Its normal Morphe matching rules are preserved. The full-catalog acceptance run emits
`tiktok-hook-report.json`: semantic hook identity, resolved owner/method/signature,
register count, declared strings and a normalized bytecode signature. Extension-only
methods and unresolved optional legacy hooks are recorded without an APK signature.

`rediscover_hooks.py` can compare this inventory against another APK without modifying
that APK. It scans all DEX files and produces exact structural candidates, including
relocated obfuscated classes/methods. It distinguishes unique candidates, ambiguous
matches, changed/missing methods and already unresolved baseline hooks. Register numbers,
obfuscated member names and numeric literals do not determine the structural signature;
framework member names, string constants, parameter shapes, opcodes and stable types do.
A structural candidate is evidence for an update, not permission to inject into an
untested version: constants, register liveness, fields and behavior can still change.

The theme patch additionally discovers these hooks during patching:

* TUX direct, generic, semantic and styled resolvers from framework APIs and the resolver
  family, with exactly-one-match checks. It distinguishes TypedValue.data from resourceId.
* The Compose color table (including its object-valued state slots) and its composition-local provider from their structural
  contracts. The existing palette mapper is unchanged.
* The common Inbox bind dispatcher from its signature and native dispatch behavior.
* Bottom-bar initialization from the native showBottomTab getter, separately from the
  sh()/rc() separator writers, using resolved fields and actual instruction registers.
* Fragment roots from framework lifecycle signatures; return registers are read from
  the APK rather than assumed to be v2/v5. Named component classes remain scope anchors.

## Using a new APK

Download the two hook JSON files from a successful acceptance run. Artifacts are retained
for 30 days; keep a baseline with the APK evidence when beginning an update.

```sh
python3 -m pip install -r scripts/tiktok/requirements.txt
python3 scripts/tiktok/rediscover_hooks.py tiktok-hook-report.json newer-tiktok.apk \
  --output newer-hook-migration.json
```

The `TikTok candidate hook discovery` manual workflow accepts the candidate HTTPS URL,
exact SHA-256 and a successful acceptance run ID. It fetches that run's inventory and
publishes the comparison without modifying the APK, branches or version allowlist.

Review `relocated` candidates and concentrate manual inspection on `ambiguous` and
`missing-or-changed`. Never select the first ambiguous candidate. Then verify injection
contracts and run the full catalog against that exact APK and SHA-256 before extending
`AppCompatibilities`. Existing versions keep their acceptance fixtures.

Acceptance also runs this comparison against its own original APK (`--verify-baseline`)
so broken/incomplete evidence cannot silently become the next update baseline. That
check requires the original method to be among the candidates; it does not conceal
structural ambiguity by preferring an unchanged obfuscated name.

This is patch-time discovery, not a runtime DEX scanner. The app receives concrete,
verified hooks. It does not scan its classes on startup or infer hooks from visible UI
labels/geometry. Other fingerprints retain their existing contracts; the report makes
remaining pinned owners and injection assumptions reviewable. This change does not
claim support for an untested TikTok version.

## dev.20 visual corrections

The supplied dev.20 recording and diagnostics show an unstyled FYP bottom bar, an opaque
drawer, a profile snap, partial message-row cards and stock-dark search suggestions.
The old drawer guard logged repeated movement of VideoSeekBarMaskView, demonstrating
that screen-wide candidate selection was unreliable.

Native lifecycle hooks now register I18nMyProfileFragment, both sidebar fragments,
AbstractSearchIntermediateFragmentNew and BaseChatRoomFragment roots. Only the registered
profile page is compensated during native scrolling; no displaced intermediate value is
written before the corrected one. Sidebar page fills use one translucent layer. Search
page fills are mapped within the registered middle-page subtree, including late children.
Chat roots exclude the broad card styler and list guards, preserving native message bubbles.
Bottom-bar initialization and rc(boolean) are covered in addition to the old writers.
Color changes retain native drawable snapshots for returning to TikTok Default. Compose
palette mapping, avatars, images and media drawables are not replaced by view recoloring.

The existing Activity/Inbox guards remain for their working paths; the broad profile
candidate guards are no longer installed. Real-device confirmation remains required.

## dev.21 follow-up: native bar versus separator

The 19959.mp4 recording exposed two incorrect target assumptions. In the exact APK's
res/b/c7y.xml and c7z.xml, MainPageBusinessAssem's LLJILJILJ / id ckw is a 0.5dp
separator, not the bar background. LLJILLL / id oem is the actual X.05ou tab bar.
The resolved showBottomTab getter now supplies the translucent theme surface;
sh()/rc() only style the separator. Neutral child fills within the native bar are
cleared so they cannot hide that surface. Default restores their native backgrounds.

The profile lifecycle hook now binds I18nMyProfileFragment.onCreateView (both v3
returns in 46.7.3), rather than MainPageFragment. Generic card styling skips this
registered profile subtree; native TUX/Compose colors remain active. Compensation
moves only the profile root. Clipping along its native ancestry up to the common
sidebar ancestor is temporarily disabled while the drawer overlaps, so the corrected
profile can actually render behind its translucent fill. Closing/detaching restores
clipping. No avatar arrangement, padding, grid sizing or native drawer lifecycle is
rewritten. Device confirmation is still required; the video alone does not establish
whether TikTok's profile-header arrangement changed through a native experiment.
