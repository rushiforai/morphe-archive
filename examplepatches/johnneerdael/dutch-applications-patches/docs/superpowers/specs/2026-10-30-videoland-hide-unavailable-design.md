# Hide subscription-unavailable Videoland content

Status: approved by the user on 30 October 2026. Implement the recommended subscription-only scope.

## Intent

Make the free-tier catalogue useful by removing content that the current account is explicitly told requires a subscription. Keep the app’s real availability decisions and playback checks intact. This is a separate patch from experimental subscription routing.

## Proposed behavior

- Add an independent **Hide unavailable content** Morphe selection, initially default-off during validation, targeting the inspected TV 1.117.0/code 1622 input.
- Filter subscription-unavailable content cards from home/recommendation collections, search/catalogue results and episode lists before rendering.
- Use the server-supplied primary activation target and its retained lock chain. A `RequireSubscriptionLock` is the positive subscription-unavailability signal. Do not infer availability from artwork, age, a generic icon, or a failed request from an earlier attempt.
- Apply the predicate to each current account’s payload. Unlocked content remains visible without needing a fragile free/paid tier-name check. Do not mutate account products or authorization state.
- Retain programme/series navigation that is not itself subscription-locked. Do not remove a series because some of its episodes are locked; show its usable episodes.
- Preserve programme information, structural navigation, forms and chronological TV-guide browsing. This first scope does not hide content solely for login, parental, geographic or other non-subscription restrictions.
- Collapse content rows that become empty once their source is exhausted. A filtered-empty page must not prevent loading a later page containing available items. Retain the app’s normal empty-screen behavior and usable remote-control focus.
- Unknown availability stays visible. An unmarked item whose stream later fails cannot reliably be classified without opening it; do not promise advance removal of every backend failure.

## Approaches

1. **Presentation-list filtering — recommended.** Build visible list copies at shared rendering/paging handoff points. Preserve cached original models, raw pagination metadata, stable item identity and normal account refresh. This supports compact layouts without losing source data.
2. **Filter deserialized/domain models globally.** Fewer interception points, but cached content and pagination counts can become permanently filtered. It also reaches player, guide and informational models beyond the intended catalogue scope. Reject unless investigation proves equivalent preservation.
3. **Hide lock icons or bound views.** Does not remove unusable entries reliably, can confuse different lock reasons and can leave blank/focusable cells. Reject.

The actual APK exposes a common `Item.o():Action` accessor, `Action.P:Target`, and retained targets on both regular and optional locks. Item collections are carried by `LayoutBlockContent.Q`, with pagination stored separately. Presentation and paging consumers must be checked before choosing exact insertion seams; the design does not assume the domain constructor is safe to modify.

## Implementation constraints

- Reuse the pinned patcher 2.0.1/repository wrapper and original-input preflight. Resolve every exact bytecode contract before mutation; record real flags, registers, instruction counts and surrounding references.
- Keep diagnostics and any availability probes out of the functional dependency chain. Do not depend on ads, tracking or experimental routing.
- Preserve the original item/action/target objects and source collections. Use copied visible lists; avoid extra per-card API requests and persistent hidden-item caches.
- Detect malformed/cyclic chains conservatively and keep unknown items. Do not let a bad item crash an otherwise usable catalogue.
- Keep streaming, asset selection, token/licence processing and genuine error reporting unchanged.

## Acceptance

1. Ordinary and unlocked items retain their identity/order; direct and nested subscription locks are filtered.
2. A subscription lock in an unrelated secondary action does not hide an otherwise usable primary item.
3. A mixed series such as Bureau Groningen remains discoverable, with the available episode retained and subscription-locked episode cards removed.
4. Login/parental-only items and informational/TV-guide structures retain their ordinary behavior.
5. A wholly filtered page can still reach a later usable page; exhausted empty collections leave no blank focus targets.
6. Reloading an unlocked account payload restores those items; original cached/source data has not been destroyed.
7. Independent emitted-bytecode checks permit only owned filtering additions. Actual candidate DEX tests exercise filtering, pagination and preservation; TV checks cover home, search and episode lists, Back/focus and available playback.
8. Build and expose the independent MPP selection, with tested scope and any remaining coverage limits stated accurately.

## Accepted follow-up

After confirming the filter works on the TV, the user requested removal of the “Abonneren op Videoland” button on free accounts. Hide an offered subscription-required action through the native absent-action presentation result; retain available play/login/info controls and original account/action/target data.
