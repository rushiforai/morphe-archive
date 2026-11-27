# Unlimited energy

- **Patch name:** `Unlimited energy`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`UnlimitedEnergyPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/energy/UnlimitedEnergyPatch.kt)

## What It Does

Bypasses client-side energy consumption in the bundled Next.js frontend, always reports a full `3/3` energy snapshot, and updates energy UI surfaces to display the unlimited infinity state without mutating global `isFreeUser`.

## How It Works

### 1. API Module Stubs (`/competency-api/user-energy`)

1. Enumerates `.js` files under `assets/public/_next/static/chunks/` via `listApkEntries`.
2. Selects the chunk containing `/competency-api/user-energy` and matches `ENERGY_FUNCTIONS_REGEX` (`getEnergy` and `consumeEnergy`).
3. Rewrites both functions so neither calls `/competency-api/user-energy` or `POST .../decrement`, returning a full `3/3` snapshot via the bundle's existing snapshot converter (`toSnapshotFn({totalEnergy:3,currentEnergy:3,nextRechargeAt:null,rechargeIntervalMinutes:480})`) and `{success:!0,snapshot:...}`.

### 2. Unlimited Energy UI Surfaces

Without changing global `isFreeUser` (which would cause unrelated server-gated UI like Code Duel or League boosts to misreport free accounts as paid), the patch updates each energy UI widget directly:

- **`/energy` page (`ENERGY_PAGE_REGEX`):** Forces the `/energy` route component (`Get unlimited energy!` chunk) to take the unlimited infinity view (`You have unlimited energy`) with polling disabled.
- **`AppTopBar` (`TOPBAR_ENERGY_REGEX`):** Replaces numeric `currentEnergy` / loading skeleton with `BatteryIcon` + `InfinityIcon`.
- **Curriculum player header (`CURRICULUM_HEADER_ENERGY_REGEX`):** Switches the lesson header energy badge to `BatteryIcon` + `InfinityIcon`.
- **Profile stats tile (`PROFILE_ENERGY_REGEX`):** Displays `InfinityIcon` in the `"Energy charges"` card once loaded.

## Error Handling & Version Resilience

- All regexes capture minified identifiers dynamically (`[A-Za-z_$][\w$]*`).
- Throws `PatchException` if `/competency-api/user-energy` is missing or fails to match `ENERGY_FUNCTIONS_REGEX`. UI-polish regexes degrade cleanly if a UI chunk layout changes.

## Scope & Limitations

- Only client-side lesson energy checks, decrements, and energy UI views are patched.
- Separate server-enforced rate limits (such as **Code Duel** daily quota or paid **Full Access** / **Hero** membership endpoints) are unaffected.
