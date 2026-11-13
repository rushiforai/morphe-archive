# Advanced Patching Techniques — Deep Dive

Detailed code patterns learned from community repos. Each section includes real code examples.

## 1. SmaliTemplates Pattern (morphe-patches_4)

Centralized smali instruction builders for consistency:

```kotlin
object SmaliTemplates {
    fun returnVoid() = "return-void"
    fun returnBoolean(value: Boolean): String {
        val flag = if (value) "0x1" else "0x0"
        return "const/4 v0, $flag\nreturn v0"
    }
    fun returnFalseObject(): String =
        "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0"
    fun returnNullObject(): String =
        "const/4 v0, 0x0\nreturn-object v0"
    fun returnStaticField(fieldType: String, fieldName: String): String =
        "sget-object v0, $fieldType->$fieldName:$fieldType\nreturn-object v0"
    fun sputBoolean(classType: String, fieldName: String, value: Boolean): String {
        val flag = if (value) "0x1" else "0x0"
        return "const/4 v0, $flag\nsput-boolean v0, $classType->$fieldName:Z"
    }
}
```

**Takeaway:** We already have `returnEarly()` from BytecodeUtils which is better, but `returnStaticField()` and `sputBoolean()` are useful additions.

## 2. JSON Field Replacement (morphe-patches_2 / Instagram)

Replace JSON keys with bogus values so the parser ignores them:

```kotlin
fun MutableMethod.replaceJsonFieldWithBogus(key: String) {
    val targetStringIndex = indexOfFirstStringInstructionOrThrow(key)
    val targetStringRegister = getInstruction<OneRegisterInstruction>(targetStringIndex).registerA
    replaceInstruction(targetStringIndex, "const-string v$targetStringRegister, \"BOGUS\"")
}
```

**Use case:** Hide Instagram feed items, disable features by breaking their JSON parsing. The app silently ignores unknown JSON keys.

## 3. Client ID / API Key Spoofing (patcheddit / Reddit)

Replace OAuth client IDs and redirect URIs across all matches:

```kotlin
fun List<Match>.replaceWith(string: String, getIndex: List<Match.StringMatch>.() -> Int) =
    forEach { match ->
        match.method.apply {
            val index = match.stringMatches.getIndex()
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            replaceInstruction(index, "const-string v$register, \"$string\"")
        }
    }

// Usage
buildAuthorizationStringFingerprint.matchAll().replaceWith(clientId!!) { first().index + 4 }
basicAuthorizationFingerprint.matchAll().replaceWith("$clientId:") { last().index + 7 }
```

**Use case:** Spoof Reddit API client credentials for third-party clients.

## 4. Method Injection — Creating New Methods (hoo-dles / AdGuard)

Create a completely new static method and add it to a class:

```kotlin
val newMethod = ImmutableMethod(
    classDef.type,           // defining class
    "getPaidLicense",        // method name
    null,                    // parameters
    returnType,              // return type
    AccessFlags.STATIC.value,
    null, null,
    MutableMethodImplementation(7)  // register count
).toMutable().apply {
    addInstructions(0, """
        new-instance v0, ${LicenseClass.type}
        const-string v1, ""
        sget-object v2, $licenseTypeClass->Personal:$licenseTypeClass
        sget-object v3, $lifetimeDurationInstance
        const/4 v4, 0x1
        invoke-direct/range {v0 .. v6}, ${LicenseConstructor}
        return-object v0
    """)
}
classDef.methods.add(newMethod)

// Redirect original method to call the new one
originalMethod.addInstructions(0, """
    invoke-static {}, $newMethod
    move-result-object v0
    return-object v0
""")
```

**Use case:** When you need to return a complex constructed object (not just true/false).

## 5. Facebook Sponsored Content Removal (morphe-meta-patches)

Advanced pattern — create helper method, inject type checking:

```kotlin
// Create static helper that checks if story has sponsored data
val helperMethod = ImmutableMethod(
    classDef.type, "getSponsoredData",
    listOf(ImmutableMethodParameter(storyClass, null, null)),
    baseModelType, AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
    null, null, MutableMethodImplementation(4)
).toMutable().apply {
    addInstructions(0, """
        const-class v2, $baseModelType
        const v1, $storyTypeId
        const v0, $sponsoredDataTypeId
        invoke-virtual {p0, v2, v1, v0}, $mapperMethod
        move-result-object v0
        return-object v0
    """)
}
classDef.methods.add(helperMethod)

// Inject check at visibility method
method.addInstructionsWithLabels(insertionIndex, """
    instance-of v0, p0, $storyClass
    if-eqz v0, :resume_normal
    invoke-static {p0}, $helperMethod
    move-result-object v0
    if-eqz v0, :resume_normal
    const-string v0, "GONE"
    return-object v0
    :resume_normal
    nop
""")
```

**Use case:** Complex ad filtering where you need to check object types and call internal APIs.

## 6. Bulk Telemetry Blocking (morphe-patches_4 / Pinterest)

Block multiple analytics tags by generating conditional smali:

```kotlin
val tagsToBlock = listOf(
    "TAG_CRASH_REPORTING", "TAG_APPSFLYER_INIT",
    "TAG_FIREBASE_ANALYTICS_INIT", "TAG_GOOGLE_ENGAGE_INIT",
    "TAG_ADS_GMA_MANAGER_INIT", "TAG_TRACKING_REQUESTS", ...
)

val sb = StringBuilder()
sb.append("move-object/from16 v2, p0\n")
sb.append("iget-object v1, v2, Lg10/n4;->b:Lg10/w;\n")
tagsToBlock.forEachIndexed { i, tag ->
    sb.append("sget-object v0, Lg10/w;->$tag:Lg10/w;\n")
    sb.append("if-ne v1, v0, :cond_next_$i\n")
    sb.append("return-void\n")
    sb.append(":cond_next_$i\n")
}
sb.append("nop\n")
method.addInstructions(0, sb.toString())
```

**Use case:** Block many analytics/telemetry tasks in one patch by generating conditional branches.

## 7. Device ID Spoofing (De-ReVanced / Photomath)

Randomize device ID to prevent bans:

```kotlin
GetDeviceIdFingerprint.method.returnEarly(Random.nextLong().toString(16))
```

**Use case:** Apps that ban devices by ID after detecting patching.

## 8. Complete Method Replacement (morphe-patches_4 / Pinterest)

Remove ALL instructions and replace with new ones:

```kotlin
method.apply {
    implementation?.let { impl ->
        removeInstructions(0, impl.instructions.count())
        addInstructions(0, SmaliTemplates.returnBoolean(false))
    }
}
```

**Use case:** When you want to completely gut a method, not just prepend instructions.

## 9. Extension-Based Ad Skipping (hoo-dles / Prime Video)

For complex ad logic, delegate to Java extension:

```kotlin
dependsOn(sharedExtensionPatch)

method.apply {
    // Find the video player register
    val playerIndex = indexOfFirstInstructionOrThrow {
        opcode == Opcode.INVOKE_VIRTUAL &&
        getReference<MethodReference>()?.name == "getPrimaryPlayer"
    }
    val playerRegister = getInstruction<OneRegisterInstruction>(playerIndex + 1).registerA

    // Make private method public for extension access
    DoTriggerFingerprint.method.accessFlags = AccessFlags.PUBLIC.value

    // Redirect to extension
    addInstructions(playerIndex + 2, """
        invoke-static { p0, p1, v$playerRegister },
            Lext/ads/SkipAdsPatch;->enterAdBreakState(...)V
        return-void
    """)
}
```

**Use case:** Video ad skipping that needs to seek the player, calculate ad break duration, etc.

## 10. Signature Byte Array Spoofing (hoo-dles / MacroFactor)

Return raw signature bytes for Firebase app check:

```kotlin
val signature = byteArrayOf("72 80 3C E3 0B 7F 47 E8 ...")

GetSignatureFingerprint.method.apply {
    addInstructions(0, """
        const/16 v0, ${signature.size}
        new-array v0, v0, [B
        fill-array-data v0, :array_sig
        return-object v0
        :array_sig
        .array-data 1
            ${signature.joinToString("\n") { "${it}t" }}
        .end array-data
    """)
}
```

**Use case:** Apps that validate raw signature bytes (not just hash string).

## 11. Application Class Replacement (hoo-dles / shared signature spoof)

Replace the app's Application class to intercept signature checks at the deepest level:

```kotlin
// 1. Modify manifest to use spoof Application class
resourcePatch {
    document("AndroidManifest.xml").use { document ->
        val application = document.getNode("application") as Element
        applicationPath = application.getAttribute("android:name")
        application.setAttribute("android:name", Constants.SPOOF_CLASS_JAVA_NAME)
    }
}

// 2. Make spoof class extend original Application
GetSignatureFingerprint.classDef.setSuperClass(originalApplicationClassName)

// 3. Fix constructor and attachBaseContext
ConstructorFingerprint.method.replaceInstruction(0,
    "invoke-direct {p0}, $originalApplicationClassName-><init>()V")
AttachBaseContextFingerprint.method.replaceInstruction(1,
    "invoke-super {p0, p1}, $originalApplicationClassName->attachBaseContext(...)V")

// 4. Remove FINAL from original attachBaseContext so we can override
mutableClassDefBy(originalApplicationClassName).apply {
    methods.firstOrNull { it.name == "attachBaseContext" }?.removeFlags(AccessFlags.FINAL)
}
```

**Use case:** Most thorough signature spoofing — intercepts at Application level before any SDK initializes.

## 12. matchAll() for Bulk String Replacement (patcheddit)

Replace strings across ALL occurrences in ALL classes:

```kotlin
fingerprint.matchAll().forEach { match ->
    match.method.apply {
        match.stringMatches.forEach { stringMatch ->
            val register = getInstruction<OneRegisterInstruction>(stringMatch.index).registerA
            replaceInstruction(stringMatch.index, "const-string v$register, \"$newValue\"")
        }
    }
}
```

**Use case:** Replace API endpoints, client IDs, or any string that appears in multiple places.

## 13. Piko Entity Pattern (piko / Instagram)

Define data classes that map to app's internal entities:

```kotlin
// Define entity matching the app's internal class
data class MediaDataEntity(val method: MutableMethod, val matchIndex: Int, val isStringMatch: Boolean)

// Use fingerprints to find and create entity instances
// Then operate on entities instead of raw methods
```

**Use case:** Complex apps with many interrelated classes — entities provide type-safe access.

## 14. Conditional Settings Integration (piko / Instagram)

Patches that can be toggled via settings:

```kotlin
execute {
    DisableAdsFingerprint.method.apply {
        addInstructions(0, """
            ${Constants.PREF_CALL_DESCRIPTOR}->disableAds()Z
            move-result v0
            return v0
        """)
        enableSettings("disableAds")
    }
}
```

**Use case:** User-toggleable patches that check SharedPreferences at runtime.
