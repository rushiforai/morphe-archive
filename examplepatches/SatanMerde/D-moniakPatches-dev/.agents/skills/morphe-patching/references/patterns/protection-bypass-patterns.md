# Protection Bypass Patterns

How to bypass common app protections — root detection, SSL pinning, integrity checks, anti-tamper, emulator detection.

## Root Detection

### Firebase CommonUtils.isRooted()
```kotlin
classDefBy("Lcom/google/firebase/crashlytics/internal/common/CommonUtils;")
    .methods.first { it.name == "isRooted" }
    .toMutable().addInstructions(0, "const/4 v0, 0x0\nreturn v0")
```

### RootBeer / custom root checks
Search for: `su`, `/system/app/Superuser.apk`, `com.topjohnwu.magisk`, `test-keys`
```bash
rg "isRooted|checkRoot|detectRoot|RootBeer|su_binary" decompiled/ -g "*.java" -l
rg '"/system/app/Superuser' decompiled/ -g "*.java" -l
```
Patch: returnEarly(false) on each check method.

### Xposed Detection
```kotlin
classDefBy("Lcom/app/utils/SecurityUtils;")
    .methods.first { it.name == "showXposedFrameworkDetectionDialog" }
    .toMutable().addInstructions(0, "return-void")
```

## SSL Certificate Pinning

### OkHttp3 CertificatePinner
```kotlin
classDefBy("Lokhttp3/CertificatePinner;")
    .methods.filter { it.name == "check" }
    .forEach { it.toMutable().addInstructions(0, "return-void") }
```

### Legacy OkHttp (com.squareup.okhttp)
```kotlin
runCatching { classDefBy("Lcom/squareup/okhttp/CertificatePinner;") }.getOrNull()?.let {
    it.methods.filter { m -> m.name == "check" }
        .forEach { m -> m.toMutable().addInstructions(0, "return-void") }
}
```

### Custom SSL pinning (Firebase config flag)
```kotlin
classDefBy("Lcom/app/firebase/FirebaseConfig;")
    .methods.first { it.name == "isSslPining" }
    .toMutable().addInstructions(0, "const/4 v0, 0x0\nreturn v0")
```

### TrustManager override
Search for: `X509TrustManager`, `checkServerTrusted`, `SSLContext`
```bash
rg "checkServerTrusted|X509TrustManager|SSLSocketFactory" decompiled/ -g "*.java" -l
```

## Signature Verification

### Simple hash return
```kotlin
SignatureCheckFingerprint.method.returnEarly("original_sha1_hash_here")
```

### Byte array signature
```kotlin
val sig = byteArrayOf("72 80 3C E3 ...")
method.addInstructions(0, """
    const/16 v0, ${sig.size}
    new-array v0, v0, [B
    fill-array-data v0, :array_sig
    return-object v0
    :array_sig
    .array-data 1
        ${sig.joinToString("\n") { "${it}t" }}
    .end array-data
""")
```

### Application class replacement (deepest level)
Replace android:name in manifest → custom Application class that spoofs PackageInfo.signatures.

### PackageManager hook
Search for: `getPackageInfo`, `GET_SIGNATURES`, `signatures[0]`
```bash
rg "getPackageInfo|GET_SIGNATURES|toCharsString" decompiled/ -g "*.java" -l
```

## Anti-Tamper / Integrity Checks

### Simple security check bypass
```kotlin
SecurityCheck1Fingerprint.method.returnEarly()
SecurityCheck2Fingerprint.method.returnEarly()
```

### Play Integrity (Pairip)
```kotlin
ProcessLicenseResponseFingerprint.method.addInstruction(0, "const/4 p1, 0x0")
ValidateLicenseResponseFingerprint.method.returnEarly()
```

### SafetyNet/Play Integrity attestation
Client-side only — cannot bypass server-side validation.
Search for: `SafetyNet`, `PlayIntegrity`, `attestation`

## Emulator Detection

Search for: `isEmulator`, `Build.FINGERPRINT`, `generic`, `sdk`, `goldfish`
```bash
rg "isEmulator|Build.FINGERPRINT|generic|goldfish" decompiled/ -g "*.java" -l
```
Patch: returnEarly(false) on detection methods.

## Anti-Debug

Search for: `isDebuggerConnected`, `Debug.isDebuggerConnected`, `android:debuggable`
```bash
rg "isDebuggerConnected|Debug\\.waitForDebugger" decompiled/ -g "*.java" -l
```
Patch: returnEarly(false) or return-void.

## VPN Detection

Replace IP checker URLs or bypass VPN detection:
```kotlin
VpnCheckerFingerprint.method.apply {
    val index = instructions.indexOfFirst { it.opcode == Opcode.FILLED_NEW_ARRAY_RANGE }
    val reg = getInstruction<RegisterRangeInstruction>(index).startRegister
    replaceInstruction(index, "const-string v$reg, \"$SAFE_IP_CHECKER\"")
}
```

## Update Check Bypass

```kotlin
// Disable auto-update dialog/check
UpdateCheckFingerprint.method.returnEarly()
// Or return-void to skip the check entirely
```

## Search Patterns for Finding Protections

```bash
# All-in-one protection scan
rg "isRooted|checkRoot|RootBeer|isEmulator|CertificatePinner|checkServerTrusted|getPackageInfo|GET_SIGNATURES|SafetyNet|PlayIntegrity|isDebugger|antiTamper|securityCheck" decompiled/ -g "*.java" -l

# APKiD also detects protections
uvx apkid app.apk
```
