# AmpleReVanced — Unique Patterns (856 files)

Spotify, TikTok, Twitter, Tumblr patches with patterns not seen elsewhere.

## Spotify — Native Library URL Redirect + Local Proxy

Redirect API calls by hex-patching URLs in native .so files AND launching a local HTTP proxy:

```kotlin
// 1. Hex-patch the API URL in native library (all architectures)
dependsOn(hexPatch(ignoreMissingTargetFiles = true, block = fun HexPatchBuilder.() {
    listOf("arm64-v8a", "armeabi-v7a", "x86", "x86_64").forEach { arch ->
        "https://clienttoken.spotify.com/v1/clienttoken" to
            "http://127.0.0.1:$port/v1/clienttoken" inFile "lib/$arch/liborbit-jni-spotify.so"
    }
}))

// 2. Launch local proxy server in extension
loadOrbitLibraryFingerprint.method.addInstructions(0, """
    const/16 v0, $requestListenerPort
    invoke-static { v0 }, $EXT->launchListener(I)V
""")

// 3. Spoof user agent and client ID
setUserAgentFingerprint.method.addInstruction(0,
    "const-string p1, \"Spotify/$version iOS/$systemVersion ($hardwareMachine)\"")
setClientIdFingerprint.method.addInstruction(0,
    "const-string p1, \"58bd3c95768941ea9eb4350aaa033eb3\"")

// 4. Disable integrity verification
runIntegrityVerificationFingerprint.method.returnEarly()
```

**Key technique:** Combine hex patching (redirect URL in native code) with extension (local proxy server) for complete API interception.

## Twitter — JSON Stream Hook System

Pluggable JSON hook system that intercepts ALL JSON responses:

```kotlin
// 1. Define hook class
class JsonHook(internal val descriptor: String) {
    internal var added = false
    init {
        // Validate hook class extends BaseJsonHook and has INSTANCE field
    }
}

// 2. Register hooks dynamically
fun addJsonHook(jsonHook: JsonHook) {
    jsonHookPatchFingerprint.method.apply {
        addInstructions(insertIndex, """
            sget-object v1, ${jsonHook.descriptor}->INSTANCE:${jsonHook.descriptor}
            invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        """)
    }
}

// 3. Hook the JSON input stream
jsonInputStreamFingerprint.method.addInstructions(0, """
    invoke-static { p1 }, $PATCH_CLASS->parseJsonHook(Ljava/io/InputStream;)Ljava/io/InputStream;
    move-result-object p1
""")

// 4. Cleanup in finalize block
finalize {
    // Remove dummy hook placeholder
    jsonHookPatchFingerprint.method.removeInstructions(addDummyHookIndex, 2)
}
```

**Key technique:** Pluggable hook system — other patches register their hooks, the system intercepts all JSON and routes to registered handlers.

## Tumblr — Dynamic Feature Flag Override System

Create a helper method that checks feature flags at runtime:

```kotlin
// 1. Create helper method in the configuration class
val helperMethod = ImmutableMethod(configClass, "getValueOverride",
    listOf(ImmutableMethodParameter(featureClass, null, "feature")),
    "Ljava/lang/String;", AccessFlags.PUBLIC or AccessFlags.FINAL,
    null, null, MutableMethodImplementation(4)
).toMutable().apply {
    addInstructions(0, """
        invoke-virtual {p1}, $featureClass->toString()Ljava/lang/String;
        move-result-object v0
        # Overrides will be injected here
        const/4 v0, 0x0
        return-object v0
    """)
}
classDef.methods.add(helperMethod)

// 2. Hook the original getValue method
getFeatureValueFingerprint.method.addInstructionsWithLabels(getFeatureIndex, """
    invoke-virtual {p0, p1}, $configClass->getValueOverride($featureClass)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :is_null
    return-object v0
    :is_null
    nop
""")

// 3. Expose function for other patches to add overrides
addFeatureFlagOverride = { name, value ->
    helperMethod.addInstructionsWithLabels(helperInsertIndex, """
        const-string v1, "$name"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :no_override
        const-string v1, "$value"
        return-object v1
        :no_override
        nop
    """)
}
```

**Key technique:** Dynamic instruction injection — other patches call `addFeatureFlagOverride("flag_name", "value")` and instructions are injected into the helper method at patch time.

## Tumblr — Timeline Object Type Filtering

Filter timeline content by type using a HashSet:

```kotlin
// Expose function for other patches
lateinit var addTimelineObjectTypeFilter: (typeName: String) -> Unit

execute {
    // Setup filter list in extension
    addTimelineObjectTypeFilter = { typeName ->
        method.addInstructionsWithLabels(filterInsertIndex, """
            const-string v$stringReg, "$typeName"
            invoke-virtual { v$listReg, v$stringReg }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
        """)
    }

    // Hook timeline constructors to filter
    mapOf(
        timelineConstructorFingerprint to 1,
        postsResponseConstructorFingerprint to 2,
    ).forEach { (fingerprint, register) ->
        fingerprint.method.addInstructions(0,
            "invoke-static {p$register}, $EXT->filterTimeline(Ljava/util/List;)V")
    }
}

// Other patches use it:
addTimelineObjectTypeFilter("COMMUNITY_PROMO")
addTimelineObjectTypeFilter("BLAZE_CAMPAIGN")
```

## TikTok — Feed Filter Before Return

Hook feed list just before it's returned:

```kotlin
arrayOf(
    feedApiFingerprint.method to "$EXT->filter(Lcom/.../FeedItemList;)V",
    followFeedFingerprint.method to "$EXT->filter(Lcom/.../FollowFeedList;)V"
).forEach { (method, filterSignature) ->
    val returnInstruction = method.instructions.first { it.opcode == Opcode.RETURN_OBJECT }
    val register = (returnInstruction as OneRegisterInstruction).registerA
    method.addInstruction(returnInstruction.location.index,
        "invoke-static { v$register }, $filterSignature")
}
```

## Key Takeaways

1. **Native URL redirect + local proxy** — hex-patch URLs in .so + launch proxy in extension
2. **Pluggable JSON hook system** — register hooks dynamically, intercept all JSON streams
3. **Dynamic feature flag override** — inject comparison instructions at patch time via lambda
4. **Timeline type filtering** — HashSet-based content type blocking
5. **Feed filter before return** — hook just before RETURN_OBJECT to filter lists
6. **Multi-architecture hex patching** — patch same URL in all CPU architectures
7. **Finalize block cleanup** — remove placeholder instructions after all hooks registered
8. **lateinit var functions** — expose patch-time functions for cross-patch communication
