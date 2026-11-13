# De-ReVanced — Advanced Patterns (237 files, 30+ apps)

Ported ReVanced patches to Morphe framework. Contains unique patterns for Strava, ProtonMail, audio processing, and protobuf manipulation.

## Resource Value Override (ProtonMail — free accounts limit)

Override integer resource values to remove limits:

```kotlin
resourcePatch {
    execute {
        document("res/values/integers.xml").use { doc ->
            doc.documentElement.childNodes
                .findElementByAttributeValueOrThrow("name", "core_feature_auth_user_check_max_free_user_count")
                .textContent = Int.MAX_VALUE.toString()
        }
    }
}
```

**Use case:** Apps that store limits in XML resources instead of code.

## Multi-Language String Removal (ProtonMail — "Sent from" signature)

Remove a string across ALL localized strings.xml files:

```kotlin
resourcePatch {
    execute {
        val stringFiles = mutableListOf<File>()
        get("res").walk().forEach { file ->
            if (file.isFile && file.name.equals("strings.xml", ignoreCase = true))
                stringFiles.add(file)
        }

        stringFiles.forEach { filePath ->
            document(filePath.absolutePath).use { doc ->
                val node = doc.documentElement.childNodes
                    .findElementByAttributeValue("name", "mail_settings_identity_mobile_footer_default_free")
                node?.textContent = ""  // Clear the string
            }
        }
    }
}
```

**Use case:** Remove branding/watermark strings that exist in multiple language files.

## Configurable Patch Options (Strava — media upload)

Patches with user-configurable values validated at patch time:

```kotlin
val compressionQuality by intOption(
    key = "compressionQuality",
    title = "Compression quality (percent)",
) { it == null || it in 1..100 }  // Validation

val maxDuration by longOption(
    key = "maxDuration",
    title = "Max duration (seconds)",
) { it == null || it in 1..3600 }

execute {
    // Find class by suffix (works across obfuscation)
    val targetClass = run {
        var found: ClassDef? = null
        classDefForEach { if (it.type.endsWith("/MediaUploadParameters;")) found = it }
        found ?: throw PatchException("Class not found")
    }

    compressionQuality?.let { quality ->
        GetCompressionQualityFingerprint.match(targetClass).method
            .returnEarly(quality / 100f)
    }
}
```

**Key technique:** `classDefForEach` with `endsWith` to find classes by suffix when full name is obfuscated.

## Menu Item Injection with Resource IDs (Strava — media download)

Add download/copy/open buttons to a media viewer using resource IDs:

```kotlin
fun addMenuItem(actionId: String, string: String, color: String, drawable: String) =
    addInstructions(setTrueIndex + 1, """
        new-instance v$reg, $ACTION_CLASS
        sget v${reg+1}, $EXT->$actionId:I
        const v${reg+2}, 0x0
        const v${reg+3}, ${getResourceId(ResourceType.STRING, string)}
        const v${reg+4}, ${getResourceId(ResourceType.COLOR, color)}
        const v${reg+5}, ${getResourceId(ResourceType.DRAWABLE, drawable)}
        invoke-direct/range { v$reg .. v${reg+7} }, $ACTION_CLASS-><init>(...)V
        invoke-virtual { v$registrar, v$reg }, $registrarClass->a($BottomSheetItem)V
    """)

addMenuItem("ACTION_COPY_LINK", "copy_link", "core_o3", "actions_link_normal_xsmall")
addMenuItem("ACTION_OPEN_LINK", "fallback_menu_item_open_in_browser", "core_o3", "actions_link_external_normal_xsmall")
addMenuItem("ACTION_DOWNLOAD", "download", "core_o3", "actions_download_normal_xsmall")
```

**Key technique:** Use `getResourceId()` to reference app's own string/color/drawable resources in injected code.

## DRC Audio Disable — Method Cloning + Helper Injection

Clone a method, add a helper, and hook all return points:

```kotlin
// 1. Clone constructor with extra registers
val cloned = method.cloneParameters()

// 2. Create helper method
val helperMethod = ImmutableMethod(definingClass, "patch_setLoudnessDb", ...).toMutable().apply {
    addInstructionsWithLabels(0, """
        invoke-static {}, $EXT->disableDrcAudio()Z
        move-result v0
        if-eqz v0, :exit
        iget-object v0, p0, $formatField
        const/4 v1, 0x0
        iput v1, v0, $loudnessDbField
        iput-object v0, p0, $formatField
        :exit
        return-void
    """)
}
classDef.methods.add(helperMethod)

// 3. Call helper before every return
findInstructionIndicesReversedOrThrow(Opcode.RETURN_VOID).forEach { index ->
    addInstructionsAtControlFlowLabel(index, "invoke-direct/range { p0 .. p0 }, $helperMethod")
}

// 4. Also override feature flag
method.insertLiteralOverride(instructionMatches.first().index, "$EXT->disableFlag(Z)Z")
```

## Protobuf Library Fix — Add Missing Methods

Add methods to protobuf classes that exist in the app but aren't merged:

```kotlin
// Add getEmptyRegistry() static method
classDef.methods.add(
    ImmutableMethod(definingClass, "getEmptyRegistry", emptyList(),
        "Lcom/google/protobuf/ExtensionRegistryLite;",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null, null, MutableMethodImplementation(2)
    ).toMutable().apply {
        addInstructions(0, """
            new-instance v0, Lcom/google/protobuf/ExtensionRegistryLite;
            invoke-direct {v0}, Lcom/google/protobuf/ExtensionRegistryLite;-><init>()V
            return-object v0
        """)
    }
)

// Clone existing method with different parameters
classDef.methods.add(method.cloneMutable(
    parameters = listOf(ImmutableMethodParameter("Lcom/google/protobuf/CodedOutputStream;", null, null))
))
```

## Key Takeaways

1. **Resource value override** — change integers.xml for limit removal
2. **Multi-language string walk** — iterate all res/values-*/strings.xml
3. **classDefForEach + endsWith** — find obfuscated classes by suffix
4. **Configurable options with validation** — intOption, longOption with range checks
5. **Resource ID injection** — use app's own resources in injected menu items
6. **Method cloning + helper injection** — complex modifications via helper methods
7. **Protobuf method addition** — add missing methods to protobuf classes
8. **invoke-direct/range** — call helper methods on `this` (p0)
