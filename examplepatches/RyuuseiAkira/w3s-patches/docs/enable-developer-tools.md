# Enable developer tools

- **Patch name:** `Enable developer tools`
- **Default:** `false` (off by default — enable if you want built-in diagnostics)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`EnableDeveloperToolsPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/debug/EnableDeveloperToolsPatch.kt)

## What It Does

Forces `isDebugToolsEnv` to return `true` while leaving `isDevEnv` and production API endpoints untouched. This exposes W3Schools' hidden diagnostic screens in **Profile → Settings**:

- **Billing Debug (`/billing-debug`):** Inspects resolved `effectivePlan`, `commercePlan`, RevenueCat entitlements, and backend billing signals.
- **Developer Console (`/devconsole`):** Shows live in-app `w3sConsole` logs, safe-area metrics, and pending local reminder schedules.

## How It Works

Locates the chunk exporting `isDebugToolsEnv` under `assets/public/_next/static/chunks/`, matches `function <fn>(<arg>){return"develop"===<arg>||"staging"===<arg>}`, and replaces it with `function <fn>(){return!0}`.
