# Official Morphe Patches — Advanced Patterns

Techniques from the official MorpheApp/morphe-patches repo (YouTube, Music, Reddit). These are the most sophisticated patches in the ecosystem.

## 1. Litho Component Filtering (YouTube ads/layout)

YouTube uses a Litho-based UI framework. Ads and UI elements are rendered as "components" parsed from protobuf bytes. The Litho filter system hooks the parser to filter components before rendering.

**Architecture:**
```
Protobuf bytes → ComponentContext parser → Litho filter hook → Extension filters → Render/Hide
```

**Key pattern — dynamic filter registration:**
```kotlin
// Each patch registers its filter class
fun addLithoFilter(classDescriptor: String) {
    helperMethod.addInstructions(0, """
        new-instance v0, $classDescriptor
        invoke-direct { v0 }, $classDescriptor-><init>()V
        const/16 v1, ${filterCount++}
        aput-object v0, v2, v1
    """)
}

// Usage in ad patch
addLithoFilter("Lapp/morphe/extension/youtube/patches/components/AdsFilter;")
```

**Takeaway:** For apps with component-based UIs, hook the component parser rather than individual UI elements.

## 2. Settings Framework Integration

Official patches have a full settings UI system:

```kotlin
val myPatch = bytecodePatch(name = "My Feature") {
    dependsOn(sharedExtensionPatch, settingsPatch)
    execute {
        PreferenceScreen.ADS.addPreferences(
            SwitchPreference("morphe_hide_video_ads"),
        )
        // Extension checks the preference at runtime
        fingerprint.method.addInstructionsWithLabels(0, """
            invoke-static { }, $EXTENSION->isEnabled()Z
            move-result v0
            if-eqz v0, :disabled
            return-void
            :disabled
            nop
        """)
    }
}
```

**Takeaway:** For toggleable patches, use extension + SharedPreferences. The setting is checked at runtime so users can enable/disable without repatching.

## 3. GmsCore Support (Google login without root)

The most complex shared patch — enables Google login on patched apps by redirecting to MicroG:

**What it does:**
1. Changes package name (so it can coexist with original app)
2. Replaces all Google Play Services references with MicroG equivalents
3. Transforms string references across ALL classes
4. Patches manifest permissions, authorities, actions
5. Redirects prime method to MicroG

**Key technique — bulk string transformation:**
```kotlin
fun transformStringReferences(transform: (str: String) -> String?) =
    getAllClassesWithStrings().forEach { classDef ->
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                if (instruction.opcode == Opcode.CONST_STRING) {
                    val original = (instruction as Instruction21c).reference as StringReference
                    val replacement = transform(original.string) ?: return@forEachIndexed
                    mutableMethod.replaceInstruction(index,
                        BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(replacement)))
                }
            }
        }
    }

// Replace all "com.google.android.gms" with MicroG package
transformStringReferences { str ->
    if (str.contains("com.google.android.gms")) str.replace("com.google.android.gms", MICROG_PACKAGE)
    else null
}
```

**Takeaway:** `getAllClassesWithStrings()` + bulk string replacement is powerful for package-level changes.

## 4. Video Stream Spoofing

Spoofs the client type to get different video streams (fixes playback issues):

**Architecture:**
- Intercepts protobuf requests
- Modifies client info fields
- Includes JavaScript solver for challenge tokens
- Copies JS resources into the APK

```kotlin
spoofVideoStreamsPatch(
    extensionClass = EXTENSION_CLASS,
    mainActivityOnCreateFingerprint = ...,
) {
    execute {
        // Hook protobuf request builder
        // Modify client type field
        // Add JS solver resources
    }
}
```

**Takeaway:** For apps with protobuf-based APIs, you can intercept and modify the request/response at the serialization layer.

## 5. Background Playback — Multi-Point Patching

Background playback requires patching MULTIPLE methods across different classes:

```kotlin
// 1. Override all return statements in playback manager
fingerprint.method.apply {
    findInstructionIndicesReversedOrThrow(Opcode.RETURN).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(index, """
            invoke-static { v$register }, $EXTENSION->isAllowed(Z)Z
            move-result v$register
        """)
    }
}

// 2. Hook feature flags
fingerprint.method.insertLiteralOverride(
    instructionMatches.first().index,
    "$EXTENSION->enableFeatureFlag(Z)Z"
)

// 3. Hook settings boolean
booleanCalls[1].getReference<MethodReference>()!!
    .getMutableMethod().addBackgroundPlaybackIsPatchEnabledHook()

// 4. Force kids video background play
KidsBackgroundPlaybackFingerprint.method.addBackgroundPlaybackIsPatchEnabledHook()
```

**Takeaway:** Complex features often need 4-6 patch points across different classes. Use helper functions to keep code DRY.

## 6. Endpoint Hooking (Client Context)

Hook specific API endpoints to modify requests:

```kotlin
setOf(
    Endpoint.GET_WATCH,
    Endpoint.PLAYER,
    Endpoint.REEL,
).forEach { endpoint ->
    addOSNameHook(endpoint, "$EXTENSION->modify(Ljava/lang/String;)Ljava/lang/String;")
}
```

**Takeaway:** For apps with multiple API endpoints, create a hook system that can intercept any endpoint.

## 7. Version-Conditional Patching

Apply different patches based on app version:

```kotlin
if (is_20_29_or_greater) {
    NewPlayerTypeEnumFeatureFlag.addBackgroundPlaybackFeatureFlagHook(false)
}
```

**Takeaway:** Use version checks when patches need to handle different app versions differently.

## 8. Free Register Provider (Advanced)

When injecting code that needs temporary registers:

```kotlin
val freeRegProvider = method.getFreeRegisterProvider(index, 2, listOf(usedReg1))
val tempReg = freeRegProvider.getFreeRegister()
// Use tempReg in injected code without conflicting with existing registers
```

**Takeaway:** For complex injections, use FreeRegisterProvider instead of hardcoding register numbers.

## 9. Patch Dependencies Chain

Official patches have deep dependency chains:

```
videoAdsPatch
├── sharedExtensionPatch (loads extension DEX)
├── settingsPatch (adds settings UI)
└── clientContextHookPatch (hooks API endpoints)
    └── sharedExtensionPatch
```

**Takeaway:** Design patches as composable units. Shared functionality (extension loading, settings, hooks) should be separate patches that others depend on.

## 10. Resource Copying

Copy custom resources into the patched APK:

```kotlin
resourcePatch {
    execute {
        copyResources("spoof", ResourceGroup("raw",
            "solver.js", "polyfill.js", "wrapper.js"
        ))
    }
}
```

**Takeaway:** For patches that need custom assets (JS, images, XML), use `copyResources()` in a resource patch dependency.

## Key Differences: Official vs Simple Patches

| Aspect | Simple patches (ours) | Official YouTube patches |
|--------|----------------------|-------------------------|
| Complexity | 1-3 fingerprints | 10-50+ fingerprints |
| Extensions | Rarely needed | Always used |
| Settings | None | Full preferences UI |
| Dependencies | 0-1 | 5-10 patch dependencies |
| Version handling | Single version | Multiple version ranges |
| Approach | Return override | Hook + extension logic |
