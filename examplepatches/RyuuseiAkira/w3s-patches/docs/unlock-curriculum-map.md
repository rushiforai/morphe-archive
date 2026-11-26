# Unlock curriculum map

- **Patch name:** `Unlock curriculum map`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`UnlockCurriculumMapPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/curriculum/UnlockCurriculumMapPatch.kt)

## What It Does

Unlocks sequential lessons, checkpoints, and milestones across the W3Schools curriculum map without requiring prior nodes to be completed first.

## How It Works

1. Enumerates `.js` files under `assets/public/_next/static/chunks/` via `listApkEntries`.
2. Selects chunks referencing `resolveCurriculumAvailability`.
3. Matches the availability helper signature using `AVAILABILITY_REGEX`:

```js
function resolveCurriculumAvailability(items, boundary, enforceLock) {
  let normalized = Math.max(0, Math.floor(boundary));
  if (!enforceLock)
    return {
      sequentialBoundaryIndex: normalized,
      bonusUnlockedIndex: null,
      isLocked: () => false,
      isAccessible: () => true,
    };
  ...
}
```

4. Rewrites the guard condition `if(!<enforceLockParam>)` to `if(!0)` (i.e. `if (true)`), forcing `resolveCurriculumAvailability` to immediately take the unlocked return path on every call.

Every node inspected through `resolveCurriculumAvailability` then receives `isLocked: () => false` and `isAccessible: () => true` while retaining a clamped numeric `sequentialBoundaryIndex` and `bonusUnlockedIndex: null`.

## Error Handling & Version Resilience

- Because `AVAILABILITY_REGEX` captures function and parameter identifiers dynamically (`[A-Za-z_$][\w$]*`), minified variable renames across releases continue to match as long as the early-return object structure stays intact.
- Throws `PatchException` if no chunk under `assets/public/_next/static/chunks/` matches `AVAILABILITY_REGEX`.

## Scope & Limitations

- Unlocks client-side sequential map progression gating only.
- Any content or certification exam locked behind server-side **Full Access** entitlement checks remains enforced by W3Schools' API.
