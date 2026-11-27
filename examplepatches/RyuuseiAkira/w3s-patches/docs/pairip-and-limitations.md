# Pairip Bypass & Client/Server Boundaries

## Internal Pairip License Check Bypass

- **Dependency name:** `pairipLicenseBypassPatch` (internal, unnamed — hidden from user selection UI)
- **Attached to:** `Unlimited energy`, `Unlock curriculum map`, `Bypass forced updates`, `Disable tracking and analytics`, `Hide upgrade prompts`, `Enable developer tools`, `MicroG-RE support`
- **Sources:**
  - [`PairipLicenseBypassPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/pairip/PairipLicenseBypassPatch.kt)
  - [`Fingerprints.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/pairip/Fingerprints.kt)

### How It Works

W3Schools bundles a Java-level Pairip wrapper (`Lcom/pairip/licensecheck/LicenseClient;`) that verifies Play Store installation/licensing on launch. Re-signed builds that are not installed directly from Google Play fail this check unless neutralized.

`pairipLicenseBypassPatch` locates:

```text
Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V
```

via `PairipCheckLicenseFingerprint` and prepends `return-void` at index `0` (`methodOrNull?.addInstructions(0, "return-void")`), plus optional `initializeLicenseCheck()` and `connectToLicensingService()` fallback stubs for newer Pairip variants, short-circuiting the license check cleanly so sideloaded builds launch normally. If a future build uses different methods or strips Pairip, `methodOrNull` is a safe no-op.

---

## Client-Side vs. Server-Enforced Features

These patches modify only code and assets executed on-device. Features validated on W3Schools' backend remain unchanged:

| Feature | Enforced Where | Patched Behavior |
|---|---|---|
| Lesson energy (`user-energy` / `decrement`) & energy UI | Client-side JS chunks | **Unlocked** + infinity UI (`Unlimited energy`) |
| Sequential curriculum map progression & overview upsell | Client-side JS chunks | **Unlocked** (`Unlock curriculum map`) |
| `minimumClientBuild` update lockout & Play review prompts | Client-side JS chunk | **Bypassed** (`Bypass forced updates`) |
| Meta AppEvents, AAID, AdServices, RC diagnostics | Android DEX / XML / Manifest | **Disabled** (`Disable tracking and analytics`) |
| Google Sign-In on re-signed APK | Android DEX / Manifest | **Supported** via `MicroG-RE support` (optional) |
| Play license check on startup | Java Pairip client | **Bypassed** automatically (`pairipLicenseBypassPatch`) |
| Avatar customization (`PUT /user/profile`) | Server asset ownership | Rejects unclaimed items (`"Asset is not claimed"`) |
| Code Duel daily quota | Server API | Remains server-enforced |
| Full Access / Hero subscription & trial | Server account entitlements | Remains server-enforced |
| Certification exams | Server account entitlements | Remains server-enforced |
| League XP boost / Streak Freeze | Server state | Remains server-enforced |
| Daily Quests unlocked view | Static placeholder in APK | Mock UI only in `1.0.8` (unpatched) |
