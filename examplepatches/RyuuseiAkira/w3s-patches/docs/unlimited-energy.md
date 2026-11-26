# Unlimited energy

- **Patch name:** `Unlimited energy`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`UnlimitedEnergyPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/energy/UnlimitedEnergyPatch.kt)

## What It Does

Bypasses client-side energy consumption in the bundled Next.js frontend and always reports a full `3/3` energy snapshot.

## How It Works

1. Enumerates `.js` files under `assets/public/_next/static/chunks/` via `listApkEntries`.
2. Selects chunks containing the `/competency-api/user-energy` endpoint string.
3. Matches the adjacent minified `getEnergy` and `consumeEnergy` async functions using `ENERGY_FUNCTIONS_REGEX`:
   - Capture group `1`: `getEnergy` function name (reads `.userEnergy` from `apiRequest` and wraps it with the snapshot converter).
   - Capture group `2`: snapshot normalization helper (`toSnapshotFn`).
   - Capture group `5`: `consumeEnergy` function name (normally sends `POST .../decrement` via `apiRequest` and returns `{success:!0,snapshot:...}`).
4. Replaces both function bodies in-place so neither makes a network request:

```js
// Full charge object constructed via the bundle's own snapshot helper:
const fullSnapshot = toSnapshotFn({
  totalEnergy: 3,
  currentEnergy: 3,
  nextRechargeAt: null,
  rechargeIntervalMinutes: 480,
});

async function getEnergy() {
  return fullSnapshot;
}

async function consumeEnergy() {
  return { success: true, snapshot: fullSnapshot };
}
```

Using the module's existing converter (`toSnapshotFn`) preserves whatever client-side field formatting or derived flags the React UI expects, while eliminating `POST .../decrement` calls.

## Error Handling & Version Resilience

- The regex matches arbitrary minified identifiers (`[A-Za-z_$][\w$]*`) rather than hardcoded short names like `e` or `t`, so chunk minifier renames between builds do not immediately break matching.
- Throws `PatchException` if a chunk contains `/competency-api/user-energy` without matching `ENERGY_FUNCTIONS_REGEX`, or if zero chunks in `assets/public/_next/static/chunks/` match at all.

## Scope & Limitations

- Only client-side lesson energy checks and decrements are patched.
- Separate server-enforced rate limits (such as **Code Duel** daily quota or paid **Full Access** / **Hero** membership endpoints) are unaffected by this patch.
