# Piko (Instagram) — Advanced Patching Patterns

158 files patching Instagram with sophisticated techniques. Key patterns not seen in other repos.

## Entity Pattern — Type-Safe App Internals

Piko defines "entity" classes that map to Instagram's internal data structures:

```kotlin
// Define entity matching Instagram's internal class
val mediaDataEntity = bytecodePatch {
    execute {
        // Find Instagram's media data class via fingerprint
        // Extract field references, method names
        // Store as typed entity for other patches to use
    }
}

// Other patches depend on the entity
val downloadMediaPatch = bytecodePatch {
    dependsOn(mediaDataEntity)
    execute {
        // Use entity's typed fields instead of raw register manipulation
    }
}
```

## Download Media — Complex UI Injection

Adds download buttons to Instagram's feed, reels, and stories:

```kotlin
// 1. Find the button enum class
val enumBtnClass = classNameToExtension(EnumButtonClassFingerprint.classDef.type)

// 2. Find the method that adds buttons to the overflow menu
val addingFeedButtonMethodName = classDef.methods.first { it.parameters.size > 1 }.name

// 3. Inject download button into the ArrayList of menu options
AddFeedButtonFingerprint.method.apply {
    val arrayListRegister = ...  // find ArrayList register
    val checkCastRegister = ...  // find the cast register

    addInstructions(checkCastIndex + 1, """
        invoke-static {v$checkCastRegister, v$arrayListRegister},
            $DESCRIPTOR->addFeedButton(Ljava/lang/Object;Ljava/util/ArrayList;)V
    """)
}

// 4. Handle button click — check if it's our download button
FeedButtonOnClickFingerprint.method.apply {
    addInstructionsWithLabels(0, """
        invoke-static {p1}, $DESCRIPTOR->isDownloadButton(...)Z
        move-result v0
        if-eqz v0, :piko
        // Get activity, media object, index
        invoke-static {v5, v2, v4}, $DESCRIPTOR->downloadPost(...)V
        return-void
    """, ExternalLabel("piko", getInstruction(0)))
}
```

**Key technique:** Inject into existing UI by finding the ArrayList of menu items and adding to it.

## Ephemeral Media → Permanent

Make "view once" and "view twice" media permanently viewable:

```kotlin
EphemeralMediaJsonParserFingerprint.apply {
    val strIndex = stringMatches[0].index
    method.apply {
        // Find where view mode string is stored
        val viewModeIPutIndex = indexOfFirstInstruction(strIndex, Opcode.IPUT_OBJECT)
        val viewModeRegister = getInstruction(viewModeIPutIndex).registersUsed[0]

        // Replace view mode with "permanent" via extension
        addInstructions(viewModeIPutIndex, """
            invoke-static {v$viewModeRegister},
                $PREF->unlimitedReplaysOnEphemeralMedia(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$viewModeRegister
        """)
    }
}
```

**Key technique:** Intercept JSON parsing to modify the view mode string before it's stored.

## Hide Suggested Content — JSON Parser Hook

Filter Instagram's feed by hooking the JSON parser:

```kotlin
// Fingerprint uses strings from the JSON parser that identify content types
object FeedItemParseFromJsonFingerprint : Fingerprint(
    strings = listOf(
        "suggested_businesses", "clips_netego", "stories_netego",
        "in_feed_survey", "bloks_netego", "suggested_igd_channels",
        "suggested_top_accounts", "suggested_users",
    ),
    custom = { methodDef, _ -> methodDef.name.lowercase().contains("parsefromjson") },
)

// Hook the parser to filter content
method.apply {
    val moveResultIndex = instructions.last {
        it.opcode == Opcode.MOVE_RESULT_OBJECT && it.location.index < strIndex
    }.location.index
    val register = instruction.registersUsed[0]

    addInstructions(moveResultIndex + 1, """
        ${Constants.JSONPARSER_CHECK_DESCRIPTOR.format(register, register)}
    """)
}
```

**Key technique:** Hook JSON parsing to filter content types before they reach the UI.

## Improve Image Viewing — Override Resolution

Force Instagram to fetch max resolution images:

```kotlin
// Override DPI metrics to request higher resolution
SetDPIMetricsFingerprint.method.apply {
    val iGetInstructions = instructions.filter { it.opcode == Opcode.IGET }.drop(1)
    iGetInstructions.forEach { instruction ->
        val register = instruction.registersUsed[0]
        addInstructions(instruction.location.index + 1, """
            invoke-static/range {v$register}, $PREF->improveImageViewing(I)I
            move-result v$register
        """)
    }
}

// Also override URL resolution parameters
ReturnExtendedImageUrlFingerprint.method.apply {
    val firstIfNe = indexOfFirstInstruction(Opcode.IF_NE)
    val heightReg = getInstruction(firstIfNe).registersUsed[0]
    val widthReg = getInstruction(firstIfNe).registersUsed[1]
    // Override both height and width via extension
}
```

**Key technique:** Override numeric values (DPI, resolution) by intercepting after IGET and replacing with extension call.

## URI Interception — Privacy Features

Intercept all URI navigation to add privacy features:

```kotlin
// interceptUriPatch hooks all URI handling
// Other patches depend on it:
val viewStoriesAnonymouslyPatch = bytecodePatch {
    dependsOn(settingsPatch, interceptUriPatch)
    execute {
        enableSettings("viewStoriesAnonymously")
        // The interceptUriPatch + extension handles the actual logic
    }
}
```

**Key technique:** Create a central URI interceptor that multiple privacy patches can hook into.

## Utility Helpers

Piko has custom utility extensions:

```kotlin
// Change first string constant in a method
fun Fingerprint.changeFirstString(newValue: String) { ... }

// Convert class name formats
fun classNameToExtension(type: String): String  // Lcom/app/Foo; → com.app.Foo
fun extensionToClassName(name: String): String  // com.app.Foo → Lcom/app/Foo;

// Extract field/method references from instructions
fun Instruction.fieldExtractor(): FieldReference
fun Instruction.methodExtractor(): MethodReference

// Get all registers used by an instruction
val Instruction.registersUsed: List<Int>
```

## Key Takeaways

1. **Entity pattern** — define typed wrappers around app internals for type safety across patches
2. **JSON parser hooking** — intercept content at parse time, not render time
3. **UI injection via ArrayList** — add buttons by finding and modifying menu item lists
4. **DPI/resolution override** — intercept numeric values after IGET to force higher quality
5. **Central URI interceptor** — one hook point for multiple privacy features
6. **String format descriptors** — use `Constants.DESCRIPTOR.format(reg, reg)` for reusable smali templates
7. **Custom utility extensions** — `registersUsed`, `fieldExtractor`, `changeFirstString` reduce boilerplate


## Entity System — Deep Dive (Reflection + Patch-Time Name Resolution)

The most sophisticated pattern in any community repo. Solves the problem of accessing obfuscated internal APIs.

### Architecture

```
Patch time (Kotlin):                    Runtime (Java extension):
1. Find obfuscated method name          Entity.java (base class)
   via fingerprint                      ├── getField(name) → reflection
2. changeFirstString() to inject        ├── getMethod(name) → reflection
   real name into extension             └── wraps Object with typed access
3. Extension uses reflection with
   the injected name
```

### Entity Base Class (Java — runs inside app)

```java
public class Entity {
    protected final Object obj;  // wraps any obfuscated object

    public Object getField(String fieldName) throws Exception {
        Field field = obj.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(obj);
    }

    public Object getMethod(String methodName, Object... params) throws Exception {
        // Reflection call with dynamic method name
    }
}
```

### Concrete Entity (Java — placeholder names replaced at patch time)

```java
public class MediaData extends Entity {
    // "className" gets replaced with real class name at patch time
    private Class<?> getHelperClass() throws Exception {
        return Class.forName("className");
    }

    // "fieldName" gets replaced with real obfuscated field name
    private Object getExtendedData() throws Exception {
        return super.getField("fieldName");
    }

    // "methodName" gets replaced with real obfuscated method name
    public String getMediaPkId() throws Exception {
        return (String) super.getMethod("methodName");
    }
}
```

### Patch-Time Name Resolution (Kotlin)

```kotlin
val mediaDataEntity = bytecodePatch {
    execute {
        // 1. Find the helper class via fingerprint
        ReelsInlineQualitySurveryRelatedFingerprint.apply {
            // Inject real class name into extension
            GetHelperClassExtensionFingerprint.changeFirstString(classNameToExtension(classDef.toString()))

            // 2. Find specific methods by signature
            val imageMethod = mutableClassDefBy { it.type == classDef.type }.methods
                .first { it.parameterTypes.first() == "Landroid/content/Context;" && it.returnType == "Ljava/lang/String;" }
            GetPhotoLinkExtensionFingerprint.changeFirstString(imageMethod.name)
        }

        // 3. Find methods by instruction patterns
        ReelsMentionDoubleTapFingerprint.method.apply {
            val secondInvokeStatic = instructions.filter { it.opcode == Opcode.INVOKE_STATIC }[1]
            GetMentionSetExtensionFingerprint.changeFirstString(secondInvokeStatic.methodExtractor().name)
        }
    }
}
```

### changeFirstString() — The Bridge

```kotlin
// Finds the first const-string in the extension fingerprint and replaces it
fun Fingerprint.changeFirstString(value: String) {
    method.instructions.filter { it.opcode == Opcode.CONST_STRING }[0].let { instruction ->
        val register = (instruction as BuilderInstruction21c).registerA
        method.replaceInstruction(instruction.location.index, "const-string v$register, \"$value\"")
    }
}
```

### Utility Functions

```kotlin
// Extract metadata from instructions
fun Instruction.methodExtractor(): MethodFieldMetadata  // name, definingClass, returnType
fun Instruction.fieldExtractor(): MethodFieldMetadata

// Convert between class name formats
fun classNameToExtension(className: String): String  // Lcom/app/Foo; → com.app.Foo
fun extensionToClassName(className: String): String  // com.app.Foo → Lcom/app/Foo;

// Get all registers used by any instruction type
val Instruction.registersUsed: List<Int>

// Convert instruction to readable string (debugging)
fun instructionToString(ins: Instruction): String
```

### Why This Pattern Matters

1. **Survives obfuscation** — names are resolved at patch time, not hardcoded
2. **Type-safe access** — Entity subclasses provide typed methods (getMediaPkId, getUserData)
3. **Separation of concerns** — Kotlin patches find names, Java extensions use them
4. **Reusable** — same entity works across multiple patches (download, stories, mentions)
5. **Fallback support** — backup fingerprints if primary resolution fails
