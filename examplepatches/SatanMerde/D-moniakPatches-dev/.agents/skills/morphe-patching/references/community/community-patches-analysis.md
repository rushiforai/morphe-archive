# Community Patches — Techniques & Patterns Learned

Analysis of 18 community patch repos from MorpheApp/custom-repo/.

## Repos Analyzed

| Repo | Author | Apps | Key Techniques |
|------|--------|------|----------------|
| morphe-patches | hoo-dles | 42 apps (AdGuard, Prime Video, WPS, Nova, etc.) | Method injection, signature spoof, anti-tamper, extensions, GmsCore, Pairip bypass |
| fluffy-patches | rabilrbl | JioTV | Root detection bypass, SSL pinning removal, emulator detection bypass |
| piko | crimera | Instagram | Entity-based patching, ad filtering, privacy patches, link sanitization |
| max-patches | RealCyberwash | ChMax | VPN check bypass, IP checker replacement |
| De-ReVanced | RookieEnough | YouTube/Music | ReVanced-style patches ported to Morphe |
| patcheddit | wchill | Reddit | Reddit-specific patches |
| patched-up | docbt | Various | General purpose patches |
| adobo | jkennethcarino | Various | Filipino dev community patches |
| Gboard-patches | jasonwu1994 | Gboard | Keyboard customization |
| morphe-patches_2-6 | Various | Various | Community contributions |

## Patching Techniques Found

### 1. Simple Return Override (Most Common)
Used by: ALL repos
```kotlin
method.returnEarly(true)    // unlock premium
method.returnEarly(false)   // disable check
method.returnEarly()        // skip method (return-void)
```

### 2. Method Injection (Advanced — hoo-dles/AdGuard)
Create a NEW method at runtime and inject it into a class:
```kotlin
val newMethod = ImmutableMethod(
    classDef.type, "getPaidLicense", null, returnType,
    AccessFlags.STATIC.value, null, null,
    MutableMethodImplementation(7)
).toMutable().apply {
    addInstructions(0, """
        new-instance v0, ${PaidLicenseFingerprint.classDef.type}
        // ... construct license object
        return-object v0
    """)
}
classDef.methods.add(newMethod)
// Then redirect original method to call the new one
```
Use when: Need to return a complex object (not just true/false).

### 3. Signature Spoofing (hoo-dles, macrofactor)
Two approaches:

**a) Return string hash:**
```kotlin
method.returnEarly(Constants.SIGNATURE)  // return SHA1 string
```

**b) Return byte array (for raw signature):**
```kotlin
method.addInstructions(0, """
    const/16 v0, ${signature.size}
    new-array v0, v0, [B
    fill-array-data v0, :array_sig
    return-object v0
    :array_sig
    .array-data 1
        ${signature.joinToString("\n") { "${it}t" }}
    .end array-data
""")
```

**c) Application class replacement (full spoof):**
Replace the app's Application class with a custom one that returns spoofed signature:
```kotlin
// In manifest: replace android:name with spoof class
// Spoof class extends original Application
// Override getPackageInfo to return fake signature
```

### 4. Anti-Tamper / Security Check Bypass (hoo-dles/WPS Office)
```kotlin
SecurityCheck1Fingerprint.method.returnEarly()
SecurityCheck2Fingerprint.method.returnEarly()
```
Simple — just skip the security check methods entirely.

### 5. Root Detection Bypass (fluffy-patches/JioTV)
Target known root detection methods by class name:
```kotlin
classDefBy("Lcom/google/firebase/crashlytics/internal/common/CommonUtils;")
    .methods.first { it.name == "isRooted" }
    .toMutable()
    .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
```
Also bypass: Xposed detection, build validation, version checks.

### 6. SSL Certificate Pinning Removal (fluffy-patches/JioTV)
Target OkHttp's CertificatePinner:
```kotlin
classDefBy("Lokhttp3/CertificatePinner;")
    .methods.filter { it.name == "check" }
    .forEach { method ->
        method.toMutable().addInstructions(0, "return-void")
    }
```
Also handle legacy OkHttp (`com.squareup.okhttp`).

### 7. Pairip License Check Bypass (hoo-dles — universal)
Google Play Integrity API client-side bypass:
```kotlin
// Set responseCode to 0 (success)
ProcessLicenseResponseFingerprint.method.addInstruction(0, "const/4 p1, 0x0")

// Disable repeated check flag
RepeatedCheckFingerprint.matchOrNull(originalMethod)?.apply {
    val reg = instructionMatches.first().getInstruction<OneRegisterInstruction>().registerA
    method.replaceInstruction(index + 1, "const/4 v$reg, 0x0")
}

// Short-circuit validation
ValidateLicenseResponseFingerprint.method.returnEarly()
```

### 8. Ad Skipping with Extension (hoo-dles/Prime Video)
For complex ad logic, use Java extension code:
```kotlin
dependsOn(sharedExtensionPatch)

EnterAdBreakStateFingerprint.method.apply {
    // Find video player register
    val playerIndex = indexOfFirstInstructionOrThrow {
        opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.name == "getPrimaryPlayer"
    }
    val playerRegister = getInstruction<OneRegisterInstruction>(playerIndex + 1).registerA

    // Redirect to extension that seeks past the ad break
    addInstructions(playerIndex + 2, """
        invoke-static { p0, p1, v$playerRegister }, Lext;->skipAd(...)V
        return-void
    """)
}
```

### 9. Feature Flag Override (hoo-dles/Prime Video speed)
Many apps use feature flags — just return true:
```kotlin
IsPlaybackSettingsV2EnabledFingerprint.method.returnEarly(true)
IsPlaybackSpeedFeatureEnabledFingerprint.method.returnEarly(true)
```

### 10. Hide App Icon (hoo-dles — universal, resourcePatch)
Modify AndroidManifest.xml to change launcher category:
```kotlin
resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            // Find LAUNCHER category in intent-filters
            // Change to DEFAULT category
            launcherCategory.setAttribute("android:name", "android.intent.category.DEFAULT")
        }
    }
}
```

### 11. Change Package Name (hoo-dles — universal, resourcePatch)
Rename package in manifest with options for permissions and providers:
```kotlin
resourcePatch {
    val packageName by stringOption(key = "packageName", default = "Default")
    finalize {
        document("AndroidManifest.xml").use { document ->
            manifest.setAttribute("package", newPackageName)
            // Optionally update permissions and providers
        }
    }
}
```

### 12. VPN Check Bypass (max-patches)
Replace IP checker URLs:
```kotlin
VpnCheckerFingerprint.method.apply {
    val targetIndex = instructions.indexOfFirst { it.opcode == Opcode.FILLED_NEW_ARRAY_RANGE }
    val startReg = getInstruction<RegisterRangeInstruction>(targetIndex).startRegister
    replaceInstruction(targetIndex, "const-string v$startReg, \"$IP_CHECKER\"")
}
```

### 13. Access Flag Modification (hoo-dles/Prime Video)
Make private methods public for extension access:
```kotlin
DoTriggerFingerprint.method.accessFlags = AccessFlags.PUBLIC.value
```

### 14. GmsCore/MicroG Support (hoo-dles — shared)
Enable Google login on patched apps via MicroG:
- Replace Google Play Services package references
- Spoof signature for Google APIs
- Redirect auth to MicroG

### 15. Emulator Detection Bypass (fluffy-patches)
Similar to root detection — find and skip emulator check methods.

## Key Takeaways

1. **`returnEarly()` handles 70%+ of patches** — premium, feature flags, security checks
2. **Signature spoofing is essential** for apps that validate their own signature (Firebase, API auth)
3. **Extensions are needed** for complex logic (ad skipping, conditional features)
4. **Universal patches** (Pairip, hide icon, change package) are reusable across apps
5. **`classDefBy()` + `toMutable()`** is used when you know the exact class name (non-obfuscated)
6. **Resource patches** are needed for manifest modifications (icon, package name)
7. **Nested fingerprint matching** (`matchOrNull(originalMethod)`) for finding sub-patterns
8. **Access flag modification** to make private methods callable from extensions
