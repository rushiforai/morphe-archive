# TikTok 46.7.3: dev.19 runtime regressions

Baseline: feature `ffac7b473d9ba21872b674820cad8e1efb7e0ec5`, released as
`1.2.0-dev.19`. The September 9 diagnostic report selects `arctic_blue` and records
the TUX resolver, Compose provider and V3.1 guards running. No crash follows the
237 early context-unavailable messages; context is set at 17:49:29.075 UTC.

The supplied images show unreadable pale search backgrounds. The recordings also
show disappearing inbox cards, pale suggested-account sections and profile motion
under the sidebar. No private messages or media are checked into this repository.

## Verified APK evidence

APK SHA-256: `b9e96e64e94ac0f9ea229dd0ba743f1930121a8b6941cf9fd87191604da0129e`.

* `attr/bx` (`0x7f06001c`) is a legacy page background. The report classifies its
  white value as `role=text`. In the APK, `res/b/x.xml` uses it on the search root,
  `res/b/d4l.xml` on search navigation containers, and `res/b/a6y.xml` on the inbox
  root. Styles `z2/z3` set it to `#FF121212`; `z4/zc` set it to white. Android night
  configuration therefore cannot determine this token's role. Both `bx` and the
  modern `a04` page token now have an explicit background role in the TUX resolver.
* `SearchResultActivity` and `MusNotificationDetailActivity` are separate manifest
  activities. MainActivity's observer cannot see their windows. Lifecycle callbacks
  now install the existing guards on each activity, using the fail-open bridge.
* `SessionListBaseVH.Z5(LX/0CcN;I)V` in `classes39.dex` dispatches native inbox binds
  to `w6`. Native holders clear/change their own `itemView` backgrounds. The common
  dispatcher now calls the theme hook at its returns. Exact bound rows are tracked
  through pre-draw so clipping, nesting and late binds do not depend on title or
  row-shape detection. The hook uses a low register after moving `p0` from its high
  register; it does not modify direct-message bubbles.
* `ThemeProfileOverlayGuardV3.findShiftedUnderlay` queued the decor and immediately
  skipped it, without enqueueing children. The fix excludes it only as a candidate.
  Compensation is tracked per window; native animation writes are preserved and a
  completed direct closing translation is not restored to an obsolete negative value.

## Verification and remaining device checks

Acceptance runs `ThemeRuntimeRegressionTest` on Robolectric before patching the
exact APK. Cases cover nested/scrolled profile underlays, drawer position, opening
and closing translations, activity-window installation, clipped/rebound inbox
holders, default passthrough, and Compose palette idempotence/restoration.

The Compose provider and its mapping implementation are unchanged. Runtime guard
logs identify this revision as V3.2. Passing CI confirms the tests and patchability;
the search page, activity recommendations, inbox scrolling and drawer still require
confirmation in a newly patched build on the affected device.

`main` remains stable. PR #6 stays draft. Promotion to `dev` follows only after the
user confirms a feature head whose Acceptance and Fingerprint Discovery both pass.
