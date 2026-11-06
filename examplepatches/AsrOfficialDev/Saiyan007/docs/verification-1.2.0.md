# Saiyan007 1.2.0 verification

Built with the repository's `build-local.ps1`, targeting Morphe Patcher **2.1.0**.
All three patches were applied using Morphe Desktop **1.20.0** with `--validate`.

## Supplied app versions

| App | Package | Version / code | Minimum Android API | Input |
| --- | --- | --- | --- | --- |
| SevenGrid | `app.sevengrid` | `1.5.2` / `80` | 24 | XAPK: base, ARM64, and MDPI splits |
| Sensu | `com.piyush.pie` | `0.1.1` / `3` | 32 | APK |
| Shima | `com.piyush.island` | `0.4.0` / `7` | 32 | XAPK: base and MDPI split |

## Results

- All patch applications succeeded. Each resulting standalone APK passed
  Android APK v2 signature verification and retained its package, version,
  version code, and minimum API.
- All three patches have discoverable JVM and Android DEX entry points, are
  selected by default, and include the shared installer-source dependency.
- Compatibility metadata has no app-version or version-code restrictions.
  Structural fingerprints and Hermes format checks reject incompatible layouts.
- All referenced resource files resolve in the rebuilt APKs: **896** in
  SevenGrid, **903** in Sensu, and **1,327** in Shima.

### SevenGrid Pro

- Preserved **45,699** DEX classes and **284,887** method signatures. Exactly
  three native Android methods changed, all installer-source lookups.
- Independently decoded the original and patched Hermes **v96** bundle.
  Its **6,120,312-byte** length, **36,401** function headers, string tables, and
  pooled literals are preserved. The updated SHA-1 footer verifies.
- Exactly four JavaScript function bodies changed: the Pro-store initializer,
  `setPro`, `proStatusFromCustomerInfo`, and a negative restore-state literal.
  Instruction boundaries and branch destinations remain valid.
- Isolated bytecode-flow simulations exercised startup, setter callbacks,
  customer-info refresh, and the successful-customer-info handler with five
  inputs: null, empty customer info, absent active entitlements, an empty active
  entitlement set, and an active lifetime entitlement. Pro remains enabled,
  pending/loading flags clear, and existing state-update callbacks execute.
- All **26** ARM64 native libraries, **896** app resource files, and **14** other
  assets retain their payloads. Native libraries are stored uncompressed and
  page-aligned. The split merger normalizes redundant API resource qualifiers
  and removes the obsolete split index and its manifest references.

### Sensu Pro

- Preserved **2,743** DEX classes and **13,751** method signatures.
- Exactly **14** method bodies changed: the observable product-set refresh,
  **11** feature methods containing **34** gates, and two installer-source methods.
- Independently checked every gate's destination register, constant value,
  instruction width, and surrounding instruction stream. The refresh seeds its
  set from the complete product catalog and retains the original state and
  listener-update logic.

### Shima regression

- Preserved **3,287** DEX classes and **17,905** method signatures.
- Exactly the expected **12** method bodies changed: Pro initialization,
  Pro refresh, six local feature methods, and four installer-source methods.
- The existing Shima artifact verifier passed against the complete 1.2.0 bundle.

## Device status

No online Android device was available. The flow simulations are isolated
bytecode checks; installation, UI interaction, and live billing behavior have
not been tested on a device. Only the app versions listed above were verified.
