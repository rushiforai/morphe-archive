# Revanced-Patches (anddea fork) — Extended Patterns

443 files. YouTube/Music/Reddit patches with extended utility functions and version-aware patching.

## Named Fingerprint Pairs — Better Error Messages

Instead of bare fingerprints, use named pairs for clear error messages:

```kotlin
// Define as Pair<String, Fingerprint>
val myFingerprint = "MyFingerprint" to Fingerprint(returnType = "Z", ...)

// Usage — throws "Failed to resolve MyFingerprint" on failure
myFingerprint.methodOrThrow().returnEarly(true)
myFingerprint.matchOrThrow().instructionMatches
myFingerprint.mutableClassOrThrow()

// Safe versions
myFingerprint.methodOrNull()
myFingerprint.resolvable()  // boolean check
```

## Version-Aware Patching

Apply different patches based on app version:

```kotlin
// Version flags computed at patch time
val is_2025_06_or_greater = ...

execute {
    if (is_2025_06_or_greater) {
        // New API — use specific fingerprints
        listOf(commentAdViewFingerprint, headerViewFingerprint, viewModelFingerprint)
            .forEach { it.methodOrThrow().hook() }
    } else {
        // Old API — scan all classes
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (method.isCommentAdsMethod()) {
                    mutableClassDefBy(classDef).findMutableMethodOf(method).hook()
                }
            }
        }
    }
}
```

## Method Predicate Scanning — classDefForEach

Find methods by runtime characteristics instead of fingerprints:

```kotlin
val isScreenShotMethod: Method.() -> Boolean = {
    definingClass.startsWith("Lcom/reddit/sharing/screenshot/") &&
    name == "invokeSuspend" &&
    indexOfShowBannerInstruction(this) >= 0 &&
    indexOfBooleanInstruction(this) >= 0
}

var hookCount = 0
classDefForEach { classDef ->
    classDef.methods.forEach { method ->
        if (method.isScreenShotMethod()) {
            mutableClassDefBy(classDef).findMutableMethodOf(method).apply {
                // Patch the method
                hookCount++
            }
        }
    }
}
if (hookCount == 0) throw PatchException("Failed to find hook method")
```

**Key technique:** Define method predicates as extension functions, scan all classes, count hooks for validation.

## Multi-Point Ad Filtering (Reddit)

Three different ad types, three different approaches:

```kotlin
// 1. Old feed ads — filter list by field name
adPostFingerprint.methodOrThrow().apply {
    val index = indexOfFirstInstructionOrThrow { getReference<FieldReference>()?.name == "children" }
    val reg = getInstruction<TwoRegisterInstruction>(index).registerA
    addInstructions(index, """
        invoke-static {v$reg}, $EXT->hideOldPostAds(Ljava/util/List;)Ljava/util/List;
        move-result-object v$reg
    """)
}

// 2. New feed ads — replace ArrayList.add with extension
newAdPostMethod.apply {
    val index = indexOfAddArrayListInstruction(this, startIndex)
    val instr = getInstruction<FiveRegisterInstruction>(index)
    replaceInstruction(index,
        "invoke-static {v${instr.registerC}, v${instr.registerD}}, $EXT->hideNewPostAds(...)V")
}

// 3. Comment ads — hook multiple methods with same pattern
fun MutableMethod.hook() = addInstructionsWithLabels(0, """
    invoke-static {}, $EXT->hideCommentAds()Z
    move-result v0
    if-eqz v0, :show
    return-void
    :show
    nop
""")
```

## Video Information Hooking — Multi-Register State

Track video metadata across multiple hook points:

```kotlin
// Reserve specific registers for video state
private const val REGISTER_CHANNEL_ID = 0
private const val REGISTER_VIDEO_ID = 2
private const val REGISTER_VIDEO_TITLE = 3
private const val REGISTER_VIDEO_LENGTH = 4
private const val REGISTER_VIDEO_IS_LIVE = 6

// Hook player response to extract all video info
// Hook background player for background state
// Hook shorts player for shorts state
// All feed into the same extension class
```

## Patch Status Tracking

Update settings to reflect which patches are active:

```kotlin
execute {
    // ... patch logic ...

    updatePatchStatus("enableGeneralAds", PatchList.HIDE_ADS)
}
```

## Extended Utility Functions

This fork adds utilities beyond the standard library:

```kotlin
// Class name conversion
val className = "Lcom/app/Foo;".className  // → "com.app.Foo"

// Access flags helper
val flags = AccessFlags.PUBLIC or AccessFlags.STATIC  // infix or

// Find methods with better error context
fingerprint.methodOrThrow()  // throws with fingerprint name
fingerprint.mutableClassOrThrow()

// Walker method — navigate to called method
val targetMethod = getWalkerMethod(index)

// Find mutable class by predicate
val cls = findMutableClassOrThrow { it.type.endsWith("/Target;") }

// Add static field to extension class
addStaticFieldToExtension(className, methodName, fieldName, objectClass, smaliInstructions)
```

## Key Takeaways

1. **Named fingerprint pairs** — `"name" to Fingerprint(...)` for clear error messages
2. **Version-aware patching** — different code paths for different app versions
3. **Method predicate scanning** — define `Method.() -> Boolean` predicates for flexible matching
4. **Hook counting** — validate that patches actually found targets
5. **Multi-point ad filtering** — different strategies for different ad types in same app
6. **Register reservation** — pre-assign registers for complex multi-hook state
7. **Patch status tracking** — update settings to reflect active patches
8. **Extended utilities** — `className`, `or` infix, `methodOrThrow`, `findMutableClassOrThrow`
