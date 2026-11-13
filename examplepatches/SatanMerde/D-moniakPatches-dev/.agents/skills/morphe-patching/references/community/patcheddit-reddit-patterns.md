# Patcheddit (Reddit) — Advanced Patterns

108 files patching 9 Reddit clients. Most sophisticated HTTP interception and data model modification patterns.

## OkHttp Interceptor Installation

Hook into OkHttp client builder to add custom interceptors:

```kotlin
installOkHttpInterceptorFingerprint.method.apply {
    val index = indexOfFirstInstructionReversed(Opcode.INVOKE_VIRTUAL)
    addInstructions(index, """
        invoke-static { }, $EXT->init()V
        invoke-static { p0 }, $EXT->installInterceptor(Lokhttp3/OkHttpClient${'$'}Builder;)Lokhttp3/OkHttpClient${'$'}Builder;
        move-result-object p0
    """)
}
```

**Use case:** Intercept ALL HTTP requests/responses to modify API calls, undelete content, add archive links.

## Data Model Extension — Adding Fields to Parcelable

Add a new field to an existing Parcelable class and wire up serialization:

```kotlin
// 1. Add field to class
contributionModelClass.fields.add(
    ImmutableField(type, "extraEmoji", "Ljava/lang/String;",
        AccessFlags.PROTECTED.value, null, null, null).toMutable()
)

// 2. Add getter method
contributionModelClass.methods.add(
    ImmutableMethod(type, "getExtraEmoji", emptyList(), "Ljava/lang/String;",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)
    ).toMutable().apply {
        addInstructions(0, """
            iget-object v0, p0, $type->extraEmoji:Ljava/lang/String;
            return-object v0
        """)
    }
)

// 3. Wire up Parcel deserialization (constructor)
constructorMethod.addInstructions(instructions.lastIndex, """
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, $type->extraEmoji:Ljava/lang/String;
""")

// 4. Wire up Parcel serialization (writeToParcel)
writeToParcelMethod.addInstructions(instructions.lastIndex, """
    iget-object v0, p0, $type->extraEmoji:Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
""")
```

**Use case:** Extend app's data models with extra fields that survive serialization/deserialization.

## JSON Model Data Extraction

Extract data from JSON models during deserialization:

```kotlin
arrayOf(submissionModelFingerprint, commentModelFingerprint).forEach {
    it.method.apply {
        val index = indexOfFirstInstruction(Opcode.INVOKE_VIRTUAL)
        addInstructions(index, """
            const-string v1, "extraEmoji"
            invoke-virtual {p0, v1}, Lnet/dean/jraw/models/JsonModel;->data(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            iput-object v1, v0, $ContributionModel->extraEmoji:Ljava/lang/String;
        """)
    }
}
```

## WebView URL Interception — matchAll() Across All Classes

Replace ALL WebView.loadUrl calls with extension that modifies URLs:

```kotlin
Fingerprint(
    filters = listOf(methodCall(definingClass = "Landroid/webkit/WebView;", name = "loadUrl")),
    custom = { _, classDef -> !classDef.type.startsWith("Lapp/morphe/") }  // exclude our code
).matchAll().forEach { match ->
    val index = match.instructionMatches[0].index
    val regs = match.instructionMatches[0].instruction.registersUsed

    if (regs.size == 2) {
        match.method.replaceInstruction(index,
            "invoke-static { v${regs[0]}, v${regs[1]} }, $EXT->loadUrl(Landroid/webkit/WebView;Ljava/lang/String;)V")
    } else {
        match.method.replaceInstruction(index,
            "invoke-static { v${regs[0]}, v${regs[1]}, v${regs[2]} }, $EXT->loadUrl(Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/Map;)V")
    }
}
```

**Key technique:** `matchAll()` + `custom` filter to find ALL occurrences across the entire app, excluding your own extension code.

## Context Menu Injection — Archive Links

Add custom menu items and handle their clicks:

```kotlin
// 1. Add menu items to list
linkBuildContextMenuFingerprint.method.apply {
    addInstructions(index, """
        invoke-static {v0}, $EXT->addMenuOptions(Ljava/util/List;)V
    """)
}

// 2. Handle custom menu item clicks
onClickContextMenuFingerprint.method.apply {
    addInstructionsWithLabels(index, """
        const/16 v1, 101
        if-eq v0, v1, :wayback
        const/16 v1, 102
        if-eq v0, v1, :archive
        goto :continue
        :wayback
        const-string v0, "https://web.archive.org/web/"
        goto :action
        :archive
        const-string v0, "https://archive.is/"
        :action
        iget-object p1, p0, $dialogClass->a:Landroid/content/Context;
        iget-object v1, p0, $dialogClass->c:Ljava/lang/String;
        invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        invoke-static {p1, v0}, $navClass->openUri(Landroid/content/Context;Ljava/lang/String;)V
        return-void
    """, ExternalLabel("continue", getInstruction(index)))
}
```

## S-Link Resolution

Fix Reddit short links (s.reddit.com) by intercepting navigation:

```kotlin
handleNavigationFingerprint.method.apply {
    addInstructionsWithLabels(0, """
        invoke-static { p1 }, $EXT->resolveSLink(...)Z
        move-result v1
        if-eqz v1, :continue
        return v1
    """, ExternalLabel("continue", getInstruction(0)))
}

// Also capture OAuth token for API calls
getOAuthAccessTokenFingerprint.method.addInstruction(3,
    "invoke-static { v0 }, $EXT->setAccessToken(Ljava/lang/String;)V")
```

## Reusable Patch Factories

Create parameterized patch functions for multiple Reddit clients:

```kotlin
// Shared factory
fun modifyWebViewPatch(extensionPatch: Array<Patch<*>>, compatible: Array<Compatibility>) =
    bytecodePatch(name = "Modify login WebView") {
        compatibleWith(*compatible)
        dependsOn(*extensionPatch)
        execute { /* shared logic */ }
    }

// Per-client usage
val modifyWebViewPatch = modifyWebViewPatch(
    extensionPatch = arrayOf(sharedExtensionPatch),
    compatible = BoostCompatible
)
```

## Key Takeaways

1. **OkHttp interceptor injection** — most powerful HTTP hooking pattern
2. **Parcelable field extension** — add fields to existing data models with full serialization
3. **matchAll() with custom filter** — find and replace patterns across entire app
4. **Context menu injection** — add custom actions to existing menus
5. **Patch factories** — reusable parameterized patches for multiple app variants
6. **JSON model extraction** — pull extra data during deserialization
7. **Navigation interception** — hook URL handling for link resolution
