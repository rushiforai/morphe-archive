# Pairip Bypass & Client/Server Boundaries

## Internal Pairip License Check Bypass

- **Dependency name:** `pairipLicenseBypassPatch` (internal, unnamed — hidden from user selection UI)
- **Attached to:** `Unlimited energy`, `Unlock curriculum map`, `MicroG-RE support`
- **Sources:**
  - [`PairipLicenseBypassPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/pairip/PairipLicenseBypassPatch.kt)
  - [`Fingerprints.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/pairip/Fingerprints.kt)

### How It Works

W3Schools bundles a Java-level Pairip wrapper (`Lcom/pairip/licensecheck/LicenseClient;`) that verifies Play Store installation/licensing on launch. Re-signed builds that are not installed directly from Google Play fail this check unless neutralized.

`pairipLicenseBypassPatch` locates:

```text
Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V
```

via `PairipCheckLicenseFingerprint` and prepends `return-void` at index `0` (`methodOrNull?.addInstructions(0, "return-void")`), short-circuiting the license check cleanly so sideloaded builds launch normally. If a future build strips Pairip, `methodOrNull` is a safe no-op.

---

## Client-Side vs. Server-Enforced Features

These patches modify only code and assets executed on-device. Features validated on W3Schools' backend remain unchanged:

| Feature | Enforced Where | Patched Behavior |
|---|---|---|
| Lesson energy (`user-energy` / `decrement`) | Client-side JS chunk | **Unlocked** (`Unlimited energy`) |
| Sequential curriculum map progression | Client-side JS chunk | **Unlocked** (`Unlock curriculum map`) |
| Google Sign-In on re-signed APK | Android DEX / Manifest | **Supported** via `MicroG-RE support` (optional) |
| Play license check on startup | Java Pairip client | **Bypassed** automatically (`pairipLicenseBypassPatch`) |
| Code Duel daily quota | Server API | Remains server-enforced |
| Full Access / Hero subscription & trial | Server account entitlements | Remains server-enforced |
| Certification exams | Server account entitlements | Remains server-enforced |
| League XP boost / Streak Freeze | Server state | Remains server-enforced |
