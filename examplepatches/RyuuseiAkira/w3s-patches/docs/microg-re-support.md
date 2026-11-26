# MicroG-RE support

- **Patch name:** `MicroG-RE support`
- **Default:** `false` (off by default — enable explicitly if you want Google Sign-In)
- **Installer availability:**
  - `STANDARD` / `SHIZUKU` → `PatchAvailability.DISABLED` (user-selectable, unchecked initially)
  - `MOUNT` → `PatchAvailability.UNAVAILABLE` (root-mounted installs keep the original signature and talk to stock Google Play Services directly)
- **Dependency:** `pairipLicenseBypassPatch`
- **Sources:**
  - [`MicroGRESupportPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/gms/MicroGRESupportPatch.kt)
  - [`Constants.kt` (`GmsConstants`)](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/gms/Constants.kt)
  - [`Fingerprints.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/gms/Fingerprints.kt)

## Why It Exists (and Why It Is Optional)

Re-signed non-root APKs use a custom signing certificate rather than W3Schools' Play Store key (`bc4474...`). Stock Google Play Services refuses OAuth / Credential Manager requests whose caller signature does not match the Play-registered SHA-1 (`30e99cb56f09534acd558f3427bbd15e57dc0db1`).

If you use email/password login or guest mode, you do not need MicroG-RE, so this patch stays **off by default**. Enable it when you want **Sign in with Google** on a non-root re-signed install.

## Prerequisites on Device

1. Install [**MicroG-RE**](https://github.com/MorpheApp/MicroG-RE/releases) (`app.revanced.android.gms`).
2. Add your Google account inside MicroG-RE **before** signing in inside W3Schools.
3. Uninstall any Play Store copy of W3Schools (`com.w3schools.app.prod`) before installing the patched bundle.

## Patch Stages

### 1. Fingerprint Resolution (Ordered Before String Rewrites)

`GooglePlayUtilityFingerprint`, `ServiceCheckFingerprint`, and `TryCreatePostUProviderFingerprint` are resolved **first**, before `replaceStrings` mutates `"com.google.android.gms"` constants in DEX string tables.

### 2. Dalvik Bytecode Stubs

| Target | Original Role | Patched Return / Action | Purpose |
|---|---|---|---|
| `GooglePlayUtilityFingerprint` (`(Landroid/content/Context;I)I`) | `GooglePlayServicesUtil` availability & Play cert check | `const/4 v0, 0x0; return v0` (`ConnectionResult.SUCCESS`) | Reports GMS as available regardless of MicroG signing key |
| `ServiceCheckFingerprint` (`public static (Landroid/content/Context;I)V`) | Throws when GMS check fails (`"GooglePlayServices not available due to error "`) | `return-void` (optional `methodOrNull`) | Prevents Fatal/Availability error exceptions |
| `TryCreatePostUProviderFingerprint` (`Landroidx/credentials/CredentialProviderFactory;->tryCreatePostUProvider()Landroidx/credentials/CredentialProvider;`) | Android 14+ (API 34+) platform Credential Manager provider factory | `const/4 v0, 0x0; return-object v0` (`null`) | Forces Android 14+ devices to fall back to `CredentialProviderPlayServicesImpl`, routing through MicroG-RE |

### 3. DEX String & Authority Rewriting

Uses Morphe Patcher's `replaceStrings` to rewrite GMS identifiers to the `app.revanced` namespace (`GMS_CORE_VENDOR_GROUP_ID = "app.revanced"`, `GMS_CORE_PACKAGE_NAME = "app.revanced.android.gms"`):

- Package strings: `"com.google"` → `"app.revanced"`, `"com.google.android.gms"` → `"app.revanced.android.gms"`
- Permissions (`GmsConstants.PERMISSIONS`): `c2dm`, `AD_ID`, `GOOGLE_AUTH.*`, `GTALK_SERVICE`, `READ_GSERVICES`
- Service actions (`GmsConstants.ACTIONS`): C2DM, GCM, Identity/Sign-In, Auth APIs, FIDO2, Blockstore, Account Settings, Telemetry, Measurement, Phenotype, IID
- Content provider authorities (`GmsConstants.AUTHORITIES`) & `content://` URIs: `com.google.android.gms.{auth.accounts,chimera,fonts,phenotype}`, `com.google.android.gsf.{gservices,subscribedfeeds}`, `com.google.settings`

### 4. `AndroidManifest.xml` Edits

1. Rewrites any attribute value containing `com.google.android.c2dm` to `app.revanced.android.c2dm`.
2. Ensures `<queries>` declares `<package>` entries for:
   - `app.revanced.android.gms`
   - `com.mgoogle.android.gms`
   - `org.microg.gms`
3. Appends spoofing `<meta-data>` entries under `<application>` if absent:
   - `app.revanced.android.gms.SPOOFED_PACKAGE_NAME` = `com.w3schools.app.prod`
   - `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` = `30e99cb56f09534acd558f3427bbd15e57dc0db1`
   - `app.revanced.MICROG_PACKAGE_NAME` = `app.revanced.android.gms`
