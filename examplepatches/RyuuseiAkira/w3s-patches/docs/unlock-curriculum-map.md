# Unlock curriculum map

- **Patch name:** `Unlock curriculum map`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`UnlockCurriculumMapPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/curriculum/UnlockCurriculumMapPatch.kt)

## What It Does

Unlocks sequential lessons, checkpoints, and milestones across the W3Schools curriculum map and removes the `"UNLOCK ALL ACTIVITIES"` upsell button on `/course-overview`.

## How It Works

1. Enumerates `.js` files under `assets/public/_next/static/chunks/` via `listApkEntries`.
2. Selects chunks referencing `resolveCurriculumAvailability` and matches `AVAILABILITY_REGEX`, rewriting `if(!<enforceLockParam>)` to `if(!0)` so every node resolves with `isLocked: () => false` and `isAccessible: () => true`.
3. In the chunk containing `"UNLOCK ALL ACTIVITIES"` (`/course-overview`), matches `OVERVIEW_UPSELL_REGEX` and disables the free-user upsell button guard (`!1&&(0,t.jsx)(I,{})`) while leaving `/course-overview` progress intact.

## Error Handling & Version Resilience

- Captures minified identifiers dynamically (`[A-Za-z_$][\w$]*`).
- Throws `PatchException` if no chunk under `assets/public/_next/static/chunks/` matches `AVAILABILITY_REGEX`.

## Scope & Limitations

- Unlocks client-side sequential map progression gating and overview CTA clutter only.
- Any content or certification exam locked behind server-side **Full Access** entitlement checks remains enforced by W3Schools' API.
