# Patch Patterns — Complete Catalog from hoo-dles (78 patches, 42 apps)

Every unique patching pattern found in the largest community repo.

## Pattern: Feature Restriction Bypass (ProtonVPN)

For apps that have a "restricted" boolean in ViewState constructors:

```kotlin
// Find the instruction that sets isRestricted = true
val isRestrictedIndex = fingerprint.instructionMatches.last().index - 1
val register = method.getInstruction<OneRegisterInstruction>(isRestrictedIndex).registerA

// Override to false (unrestricted)
method.replaceInstruction(isRestrictedIndex, "const/4 v$register, 0x0")

// Also remove the "apply restrictions" call
ApplyRestrictionsFingerprint.apply {
    val isPlusUserIndex = instructionMatches.first().index - 1
    method.removeInstruction(isPlusUserIndex)
}
```
Used for: Custom DNS, LAN connections, Split tunneling — same pattern, different fingerprints.

## Pattern: Return Specific String Value (Pandora)

Override a method to return a specific string that changes behavior:

```kotlin
SkipLimitBehaviorFingerprint.method.returnEarly("unlimited")
```

## Pattern: Trial Limit Removal (NomOne)

Set a field value on the returned object to fake purchase status:

```kotlin
// Find the field reference from one fingerprint
val statusField = PurchaseInfoUsageFingerprint.instructionMatches.last()
    .instruction.getReference<FieldReference>()!!

// In the getter method, set the status field before return
GetPurchaseInfoFingerprint.apply {
    val returnMatch = instructionMatches.first()
    val returnReg = returnMatch.getInstruction<OneRegisterInstruction>().registerA
    val valueReg = method.findFreeRegister(returnMatch.index)

    method.addInstructions(returnMatch.index, """
        const/4 v$valueReg, 0x4
        iput v$valueReg, v$returnReg, ${statusField.definingClass}->${statusField.name}:I
    """)
}
```

## Pattern: Remove System.exit() Call (Smart Launcher)

Instead of bypassing a check, just remove the kill instruction:

```kotlin
SignatureCheckFingerprint.apply {
    val exitIndex = instructionMatches.first().index
    method.removeInstruction(exitIndex)
}
```

## Pattern: Hex Patch on Native Library — Flutter/Native (ibisPaint)

Patch ARM64 machine code directly in .so files:

```kotlin
rawResourcePatch {
    dependsOn(hexPatch(block = {
        val libPath = "lib/arm64-v8a/libibispaint.so"

        // Disable anti-tamper: replace branch with return
        "28 AE 00 90 08 55 47 F9 08 FD DF 88 1F 05 00 71" asPatternTo
        "28 AE 00 90 08 55 47 F9 E0 03 1F 2A C0 03 5F D6" inFile libPath

        // Enable prime: replace branch with mov w0, #1
        "02 00 00 14 E0 03 1F 2A" asPatternTo
        "1F 20 03 D5 20 00 80 52" inFile libPath
    }))
}
```

ARM64 opcodes used:
- `C0 03 5F D6` = `ret` (return from function)
- `E0 03 1F 2A` = `mov w0, wzr` (w0 = 0)
- `20 00 80 52` = `mov w0, #1` (w0 = 1)
- `1F 20 03 D5` = `nop` (no operation)

## Pattern: Hex Patch on Flutter — Notification Block (Lingory)

Patch ARM64 to NOP a function call:

```kotlin
rawResourcePatch {
    dependsOn(hexPatch(block = {
        // Replace bl (branch-link) to requestPermission with nop
        "e1 03 00 aa 6f 01 00 94" asPatternTo
        "e1 03 00 aa 1f 20 03 d5" inFile "lib/arm64-v8a/libapp.so"
    }))
}
```

## Pattern: AMOLED Theme (SoundCloud)

Modify XML colors + bytecode for true black theme:

```kotlin
// 1. Bytecode: Set bottom bar background to black
BottomBarCtorFingerprint.method.addInstructionsToEnd("""
    sget p1, Landroid/graphics/Color;->BLACK:I
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V
""")

// 2. Resources: Change color values
document("res/values/colors.xml").use { doc ->
    listOf("dark_mode_surface", "design_dark_default_color_background")
        .forEach { colors.findElementByAttributeValue("name", it)?.textContent = "@color/blackOT" }
}

// 3. Resources: Change drawable gradients to solid black
document("res/drawable/bth_footer_shape.xml").use { doc ->
    // Replace gradient with solid black
}
```

## Pattern: Disable Login Integrity (Duolingo)

Replace Play Integrity signal with empty signal:

```kotlin
// Get the empty signal reference from basic login
val emptySignalRef = BasicLoginFingerprint.method.let {
    it.getInstruction<Instruction21c>(it.indexOfFirstInstruction(Opcode.SGET_OBJECT)).reference
}

// In login state method, replace signal parameter with empty
LoginStateFingerprint.method.apply {
    val signalNullCheckIndex = indexOfFirstInstruction(stringMatches.last().index, Opcode.INVOKE_STATIC)
    val signalParamReg = getInstruction<Instruction35c>(signalNullCheckIndex).registerC
    addInstruction(0, "sget-object v$signalParamReg, $emptySignalRef")
}
```

## Pattern: Enable Debug Mode (Duolingo)

Find obfuscated isDebug field via fingerprint, then set it in constructor:

```kotlin
val isDebugFieldRef = BuildTargetFieldFingerprint.method
    .getInstruction(instructionMatches.first().index + 1)
    .getReference<FieldReference>()!!

val buildConfigClass = mutableClassDefBy { it.type == isDebugFieldRef.definingClass }
buildConfigClass.constructor().addInstructionsToEnd("""
    const/4 v0, 0x1
    iput-boolean v0, p0, ${buildConfigClass.type}->${isDebugFieldRef.name}:Z
""")
```

## Pattern: Boxed Boolean Return (FotMob)

For methods returning `java.lang.Boolean` (boxed, not primitive):

```kotlin
HasActiveSubFingerprint.method.returnBoxedBooleanEarly(value = true)
```

## Pattern: Create Entitlement via Extension (FotMob)

Use extension to construct complex subscription objects:

```kotlin
val entitlementType = EntitlementFingerprint.classDef.type
Fingerprint(filters = listOf(
    checkCast(entitlementType),
    newInstance(LifetimeEntitlementFingerprint.classDef.type)
)).apply {
    val checkCastIndex = method.indexOfFirstInstructionReversed(lifetimeIndex, Opcode.CHECK_CAST)
    val reg = method.getInstruction<OneRegisterInstruction>(checkCastIndex).registerA

    method.addInstructions(checkCastIndex, """
        const-string v$reg, "$entitlementType"
        invoke-static {v$reg}, Lext;->createEntitlement(Ljava/lang/String;)Ljava/lang/Object;
        move-result-object v$reg
    """)
}
```

## Pattern: Shared Signature Spoof (reusable)

Create a reusable spoof function that any app can call:

```kotlin
// In shared/misc/signature/SpoofSignaturePatch.kt
fun spoofSignaturePatch(signature: String) = bytecodePatch { ... }

// In app-specific patch — just pass the certificate
val spoofSignaturePatch = spoofSignaturePatch(SIGNATURE)
```

## Pattern: Force Native Keyboard (Eggbun)

Set a boolean field at end of constructor:

```kotlin
KrKeyboardCtorFingerprint.method.apply {
    addInstructions(instructions.count() - 1, """
        const/4 v0, 0x1
        iput-boolean v0, p0, $class;->isDefaultKeyboard:Z
    """)
}
```

## Pattern: Inline Compatibility (no Constants.kt)

For simple single-version patches, define compatibility inline:

```kotlin
compatibleWith(Compatibility(
    name = "Sofascore",
    packageName = "com.sofascore.results",
    appIconColor = 0x374DF5,
    targets = listOf(AppTarget("25.12.17"))
))
```

## Summary: When to Use Each Pattern

| Situation | Pattern |
|-----------|---------|
| Simple boolean check | `returnEarly(true/false)` |
| Return specific string | `returnEarly("value")` |
| Return zero delay | `returnEarly(0)` |
| Return boxed Boolean | `returnBoxedBooleanEarly(true)` |
| Override field in ViewState | `replaceInstruction` on const before iput |
| Set field on returned object | `addInstructions` before return with iput |
| Remove kill/exit call | `removeInstruction` |
| Disable integrity signal | Replace with empty signal reference |
| Set debug flag | `addInstructionsToEnd` in constructor |
| Native library patch | `hexPatch` with ARM64 opcodes |
| Flutter app patch | `hexPatch` on libapp.so |
| Theme modification | Bytecode + resource XML changes |
| Reusable signature spoof | Shared function with certificate parameter |
| Complex entitlement | Extension + invoke-static |


## Additional Patterns Found in Premium Patches

### Hermes Bytecode Patching (Cake — React Native)
Patch Hermes compiled JavaScript by matching bytecode patterns:
```kotlin
dependsOn(hermesPatch {
    // LoadConstTrue r0 / Ret r0
    val RETURN_TRUE = "78 00 5c 00"

    // Match Hermes bytecode for hasMembership check
    val hasMembership = "29 00 00 2E 00 00 00 37 00 00 01 EB C7 77 01 0E 01 00 01" to RETURN_TRUE
    val hasCake = "32 00 7C 03 2A 00 00 03 37 02 03 01 F0 BF 73 01 F4 1C" to RETURN_TRUE
    setOf(hasMembership, hasCake)
})
```

### JavaScript File Patching (DailyPocket — Hybrid App)
Patch JavaScript in assets for web-based apps:
```kotlin
rawResourcePatch {
    execute {
        var indexFile = get("assets/www/assets").listFiles()!!
            .first { it.name.startsWith("index") && it.extension == "js" }
        var patchedCode = indexFile.readText().replace(
            Regex("""await [a-zA-Z]+\.asyncNativeStorageGetItem\("isPayment"\)==="true""""),
            "true"
        )
        indexFile.writeText(patchedCode)
    }
}
```

### Construct Subscription Object (Wallcraft)
Create a new subscription instance:
```kotlin
method.addInstructions(0, """
    new-instance v0, Lcom/wallpaperscraft/billing/core/InfiniteSubscription;
    invoke-direct {v0}, Lcom/wallpaperscraft/billing/core/InfiniteSubscription;-><init>()V
    return-object v0
""")
```

### Construct Date + Subscription (Webster)
Build a subscription with far-future expiry:
```kotlin
method.addInstructions(0, """
    new-instance v0, Ljava/util/Date;
    const-wide v1, 0x7fffffffffffffffL
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V
    new-instance v1, $SUBSCRIPTION_CLASS
    const-string v2, ""
    const/4 v3, 0x1
    invoke-direct {v1, v2, v0, v2, v3}, $SUBSCRIPTION_CLASS-><init>(...)V
    return-object v1
""")
```

### Multi-Field User Object Patching (Duolingo)
Find fields via toString(), remove FINAL, set in constructor:
```kotlin
val hasPlusField = UserFingerprint.classDef.fieldFromToString("hasPlus")
val subscriberLevelField = UserFingerprint.classDef.fieldFromToString("subscriberLevel")

// Remove final from fields
fields.forEach { classDef.fieldByName(it.name).removeFlags(AccessFlags.FINAL) }

// Set fields in LoggedIn constructor (only affects logged-in user, not friends)
LoggedInStateFingerprint.classDef.constructor().apply {
    addInstructions(instructions.count() - 1, """
        const/4 v0, 0x1
        iput-boolean v0, p1, $userType->${isPaidField.name}:Z
        iput-boolean v0, p1, $userType->${hasPlusField.name}:Z
        sget-object v0, ${subscriberLevelField.type}->PREMIUM:${subscriberLevelField.type}
        iput-object v0, p1, $userType->${subscriberLevelField.name}:${subscriberLevelField.type}
    """)
}
```

### SoundCloud Multi-Point Premium
Override features, consumer plan, downgrade tier, upsell UI, and ads:
```kotlin
// 1. Feature flags via extension
FeatureConstructorFingerprint.method.addInstructions(1, """
    invoke-static {p1, p2}, $EXT->getFeatureEnabled(Ljava/lang/String;Z)Z
    move-result p2
""")

// 2. Override consumer plan strings
UserConsumerPlanConstructorFingerprint.method.addInstructions(0, """
    const-string p1, "high_tier"
    const-string p5, "go-plus"
    const-string p6, "SoundCloud Go+"
""")

// 3. Prevent downgrade screen
GetDowngradeTierFingerprint.method.addInstructions(0, """
    sget-object v0, $Tier->HIGH:$Tier;
    return-object v0
""")

// 4. Hide upsell UI
MapToPlanFingerprint.method.addInstructions(0, """
    sget-object v0, $UpsellType$None->INSTANCE:$UpsellType$None;
    return-object v0
""")

// 5. Disable ads via matchAll
AdPlacementConfigCtorFingerprint.matchAll().forEach { match ->
    val offset = if (match.method.parameterTypes.first() == "I") 1 else 0
    match.method.addInstructions(0,
        listOf(1, 2, 3).joinToString("\n") { "const/4 p${offset + it}, 0x0" })
}
```

### WebView JavaScript Injection (Windy)
Intercept WebView responses to patch JavaScript:
```kotlin
ShouldInterceptRequestFingerprint.method.apply {
    val returnReg = getInstruction<OneRegisterInstruction>(instructions.size - 1).registerA
    addInstructions(instructions.size - 1, """
        invoke-static { p2, v$returnReg }, $EXT->patchAppJavascript(...)V
    """)
}
```

### Navigate to Method via instructionMatches (XRecorder)
Use fingerprint match to navigate to the actual target method:
```kotlin
GetProUsageFingerprint.instructionMatches.first()
    .getInstruction<ReferenceInstruction>()
    .getReference<MethodReference>()!!
    .getMutableMethod()
    .returnEarly(true)
```

### matchAll for Static Field Override (Ventusky)
Override all instances of a method using matchAll:
```kotlin
val premiumField = PremiumCodeCtorFingerprint.instructionMatches.last()
    .getInstruction<ReferenceInstruction>().getReference<FieldReference>()!!

GetPlanStatusFingerprint.matchAll().forEach {
    it.method.addInstructions(0, """
        sget-object v0, $premiumField
        return-object v0
    """)
}
```

### Conditional License State (Solid Explorer)
Set license state only if ads are enabled:
```kotlin
LicenseDetailsCtorFingerprint.method.apply {
    addInstructionsWithLabels(instructions.size - 1, """
        invoke-virtual {p0}, $class->adsEnabled()Z
        move-result v0
        if-eqz v0, :end
        sget-object v0, $LicenseState->PREMIUM_PRO:$LicenseState;
        iput-object v0, p0, $class->a:$LicenseState;
    """, ExternalLabel("end", instructions.last()))
}
```

### Nova Launcher — Bitmask Override
Override a bitmask value for feature flags:
```kotlin
SetPrimeFromPreferencesFingerprint.apply {
    val primeReg = instructionMatches.last().getInstruction<OneRegisterInstruction>().registerA
    method.addInstructions(instructionMatches.last().index + 1, """
        const/16 v$primeReg, 0x200
    """)
}
```
