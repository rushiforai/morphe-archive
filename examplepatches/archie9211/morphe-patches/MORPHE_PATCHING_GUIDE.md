# 💉 Introduction to Morphe Patcher

To create patches for Android apps, it is recommended to know the basic concept of Morphe Patcher.

## 📙 How it works

Morphe Patcher is a library that allows modifying Android apps by applying patches.
It is built on top of [Smali](https://github.com/google/smali) for bytecode manipulation and [Androlib (Apktool)](https://github.com/iBotPeaches/Apktool)
for resource decoding and encoding.

Morphe Patcher receives a list of patches and applies them to a given APK file.
It then returns the modified components of the APK file, such as modified dex files and resources,
that can be repackaged into a new APK file.

Morphe Patcher has a simple API that allows you to load patches from MPP (JAR or DEX container) files
and apply them to an APK file. Later on, you will learn how to create patches.

```kt
val patches = loadPatchesFromJar(setOf(File("morphe-patches.mpp")))

val patcherResult = Patcher(PatcherConfig(apkFile = File("some.apk"))).use { patcher ->
    // Here you can access metadata about the APK file through patcher.context.packageMetadata
    // such as package name, version code, version name, etc.

    // Add patches.
    patcher += patches

    // Execute the patches.
    runBlocking {
        patcher().collect { patchResult ->
            if (patchResult.exception != null)
                logger.info { "\"${patchResult.patch}\" failed:\n${patchResult.exception}" }
            else
                logger.info { "\"${patchResult.patch}\" succeeded" }
        }
    }

    // Compile and save the patched APK file components.
    patcher.get()
}

// The result of the patcher contains the modified components of the APK file that can be repackaged into a new APK file.
val dexFiles = patcherResult.dexFiles
val resources = patcherResult.resources
```

## ⏭️ What's next

The next page teaches the fundamentals of Morphe Patches.

Continue: [🧩 Introduction to Morphe Patches](2_patches_intro.md)
# 🧩 Introduction to Morphe Patches

Learn the basic concepts of Morphe Patcher and how to create patches.

## 📙 Fundamentals

A patch is a piece of code that modifies an Android application (APK).  
There are multiple types of patches, each targeting different parts of the APK:

- A `BytecodePatch` modifies the Dalvik VM bytecode.
- A `ResourcePatch` modifies decoded resources.
- A `RawResourcePatch` modifies arbitrary files.

Each patch can declare dependencies on other patches. Morphe Patcher ensures these dependencies are 
executed first, allowing patches to work together in a modular way.

The `execute` function is the entry point for a patch. It is called by Morphe Patcher when the patch is executed.
The `execute` function receives an instance of a context object that provides access to the APK.
The patch can use this context to modify the APK.

Each type of context provides different APIs to modify the APK. For example, the `BytecodePatchContext` provides APIs
to modify the Dalvik VM bytecode, while the `ResourcePatchContext` provides APIs to modify resources.

The difference between `ResourcePatch` and `RawResourcePatch` is that Morphe Patcher will decode the resources
if it is supplied a `ResourcePatch` for execution or if any patch depends on a `ResourcePatch`
and will not decode the resources before executing `RawResourcePatch`.
Both, `ResourcePatch` and `RawResourcePatch` can modify arbitrary files in the APK,
whereas only `ResourcePatch` can modify decoded resources. The choice of which type to use depends on the use case.
Decoding and building resources is a time- and resource-consuming,
so if the patch does not need to modify decoded resources, it is better to use `RawResourcePatch` or `BytecodePatch`.

Example of patches:

```kt
@Surpress("unused")
val bytecodePatch = bytecodePatch {
    execute { 
        // More about this on the next page of the documentation.
    }
}

@Surpress("unused")
val rawResourcePatch = rawResourcePatch {
    execute {
        // More about this on the next page of the documentation.
    }
}

@Surpress("unused")
val resourcePatch = resourcePatch {
    execute {
        // More about this on the next page of the documentation.
    }
}
```

> [!TIP]
> To see real-world examples of patches,
> check out the repository for [Morphe Patches](https://github.com/MorpheApp/morphe-patches).

## ⏭️ Whats next

The next page will guide you through creating a development environment for creating patches.

Continue: [👨‍💻 Setting up a development environment](2_1_setup.md)
# 👨‍💻 Setting up a development environment

To start developing patches with Morphe Patcher, you must prepare a development environment.

## 📝 Prerequisites

- A Java IDE with Kotlin support, such as [Android Studio](https://developer.android.com/studio) or [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- Knowledge of Java, [Kotlin](https://kotlinlang.org), and basic understanding of [Dalvik bytecode](https://source.android.com/docs/core/runtime/dalvik-bytecode)
- Android reverse engineering skills and tools such as [jadx](https://github.com/skylot/jadx)

## 🏃 Prepare the environment

Throughout the documentation, [Morphe Patches](https://github.com/MorpheApp/morphe-patches) will be used as an example project.

> [!NOTE]
> To start a fresh project, 
> you can use the [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template).

1. Clone the repository

   ```bash
   git clone https://github.com/MorpheApp/morphe-patches
   cd morphe-patches
   ```

2. Build the project

   ```bash
   ./gradlew buildAndroid
   ```

> [!NOTE]
> If the build fails due to authentication, you need to add github authentication authenticate to your command line environment.
> Create a PAT with the scope `read:packages` [here](https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe) and add your token to ~/.gradle/gradle.properties
>
> Example `gradle.properties` file in your user folder (usually found in `~/.gradle/gradle.properties`)
> ```properties
> gpr.user = github_account_name
> gpr.key = gph_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
> ```
>
> Alternatively, instead of modifying your gradle file, your you can install [GitHub CLI](https://cli.github.com) and login using:
> ```bash
> gh auth
> ```

3. Open the project in your IDE

> [!TIP]
> It is a good idea to set up a complete development environment for Morphe, so that you can also test your patches
> by following the [Morphe documentation](https://github.com/MorpheApp/Morphe-documentation).

## ⏭️ What's next

The next page will go into details about a Morphe patch.

Continue: [🧩 Anatomy of a patch](2_2_patch_anatomy.md)
# 🧩 Anatomy of a Morphe patch

Learn the API to create patches using Morphe Patcher.

## ⛳️ Example patch

The following example patch disables ads in an app.  
In the following sections, each part of the patch will be explained in detail.

```kt
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

// App compatibility declaration. See Compatibility class.
val COMPATIBILITY_XYZ = Compatibility(
  name = "XYZ App",
  packageName = "app.xyz.mobile",
  // App icon background color
  appIconColor = 0xFF3300,
  // Specific app targets. Do not include any app targets to indicate 'any' app version.
  targets = listOf(
    AppTarget(
      version = "2.0.0",
    ),
    AppTarget(
      version = "1.0.42",
    )
  )
)

val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disable ads in the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_XYZ)

    // Patches can depend on other patches, executing them first.
    dependsOn(disableAdsResourcePatch)

    // Merge precompiled DEX files into the patched app, before the patch is executed.
    extendWith("disable-ads.mpe")

    // Business logic of the patch to disable ads in the app.
    execute {
        // Fingerprint to find the method to patch.
        val showAdsFingerprint = Fingerprint(
            // More about fingerprints on the next page of the documentation.
        )

        // In the method that shows ads,
        // call DisableAdsPatch.shouldDisableAds() from the extension (precompiled DEX file)
        // to enable or disable ads.
        showAdsFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, LDisableAdsPatch;->shouldDisableAds()Z
                move-result v0
                return v0
            """
        )
    }
}
```

> [!TIP]
> To see real-world examples of patches,
> check out the repository for [Morphe Patches](https://github.com/MorpheApp/morphe-patches).

### 📝 Replacing all instructions in a method

If you need to replace all instructions in a method, note that `replaceInstructions(String)` is deprecated. Instead, you should clear existing instructions starting from index 0, and then add your new instructions:

```kt
// Remove all existing instructions starting from index 0
isPremiumMethod.removeInstructions(0)
// Add new instructions at index 0
isPremiumMethod.addInstructions(0, """
    const/4 v0, 0x1
    return v0
""")
```

You will need to import these extensions:
```kt
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
```


## 🧩 Patch API

### ⚙️ Patch options

Patches can have options to get and set before a patch is executed.
Options are useful for making patches configurable.
After loading the patches using `PatchLoader`, options can be set for a patch.
Multiple types are already built into Morphe Patcher and are supported by any application that uses Morphe Patcher.

To define an option, use the available `option` functions:

```kt
val patch = bytecodePatch(name = "Patch", default = true) {
    // Add an inbuilt option and delegate it to a property.
    val value by stringOption(name = "Inbuilt option")

    // Add an option with a custom type and delegate it to a property.
    val string by option<String>(name = "String option")

    execute {
        println(value)
        println(string)
    }
}
```

Options of a patch can be set after loading the patches with `PatchLoader` by obtaining the instance for the patch:

```kt
loadPatchesJar(patches).apply {
    // Type is checked at runtime.
    first { it.name == "Patch" }.options["Option"] = "Value"
}
```

The type of an option can be obtained from the `type` property of the option:

```kt
option.type // The KType of the option. Captures the full type information of the option.
```

Options can be declared outside a patch and added to a patch manually:

```kt
val option = stringOption(name = "Option")

bytecodePatch(name = "Patch") {
    val value by option()
}
```

This is useful when the same option is referenced in multiple patches.

### 🧩 Extensions

An extension is a precompiled DEX file merged into the patched app before a patch is executed.
While patches are compile-time constructs, extensions are runtime constructs
that extend the patched app with additional classes.

Assume you want to add a complex feature to an app that would need multiple classes and methods:

```java
public class ComplexPatch {
    public static void doSomething() {
        // ...
    }
}
```

After compiling the above code as a DEX file, you can add the DEX file as a resource in the patches file
and use it in a patch:

```kt
val complexPatch = bytecodePatch(name = "Complex patch", default = true) {
    extendWith("complex-patch.mpe")

    execute {
        fingerprint.method.addInstructions(0, "invoke-static { }, LComplexPatch;->doSomething()V")
    }
}
```

Morphe Patcher merges the classes from the extension into `context.classes` before executing the patch.
When the patch is executed, it can reference the classes and methods from the extension.

#### Adding a variable number of extensions

Sometimes the extensions to merge are not known when the patch is defined — for example, when they
are derived by a resource patch that the bytecode patch depends on. Because `extendWith` is evaluated
when the patch is built, looping over a not-yet-populated list has no effect.

Use `extendWithAll` to register a provider that is evaluated at patch time instead. Because a patch's
dependencies are executed first, the provider sees whatever the dependency produced:

```kt
// Shared between the dependency and the patch.
internal val derivedExtensions = mutableListOf<Supplier<InputStream>>()

val prepareExtensionsPatch = resourcePatch {
    execute {
        // Derive a variable number of DEX files and expose them.
        derivedExtensions += Supplier { openDerivedDexStream() }
    }
}

val complexPatch = bytecodePatch(name = "Complex patch", default = true) {
    dependsOn(prepareExtensionsPatch)

    // Evaluated at patch time, after the dependency has run and populated the list.
    extendWithAll { derivedExtensions }

    execute {
        fingerprint.method.addInstructions(0, "invoke-static { }, LComplexPatch;->doSomething()V")
    }
}
```

> [!NOTE]
>
> The [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template) repository
> is a template project to create patches and extensions.

> [!TIP]
> To see real-world examples of extensions,
> check out the repository for [Morphe Patches](https://github.com/MorpheApp/morphe-patches).

### ♻️ Finalization

Patches can have a finalization block called after all patches have been executed, in reverse order of patch execution.
The finalization block is called after all patches that depend on the patch have been executed.
This is useful for doing post-processing tasks.
A simple real-world example would be a patch that opens a resource file of the app for writing.
Other patches that depend on this patch can write to the file, and the finalization block can close the file.

```kt
val patch = bytecodePatch(name = "Patch", default = true) {
    dependsOn(
        bytecodePatch(name = "Dependency") {
            execute {
                print("1")
            }

            finalize {
                print("4")
            }
        }
    )

    execute {
        print("2")
    }

    finalize {
        print("3")
    }
}
```

Because `Patch` depends on `Dependency`, first `Dependency` is executed, then `Patch`.
Finalization blocks are called in reverse order of patch execution, which means,
first, the finalization block of `Patch`, then the finalization block of `Dependency` is called.
The output after executing the patch above would be `1234`.
The same order is followed for multiple patches depending on the patch.

## 💡 Additional tips

- When using `PatchLoader` to load patches, only patches with a name are loaded.
  Refer to the inline documentation of `PatchLoader` for detailed information.
- Patches can depend on others. Dependencies are executed first.
  The dependent patch will not be executed if a dependency raises an exception while executing.
- A patch can declare compatibility with specific packages and versions,
  but patches can still be executed on any package or version.
  It is recommended that compatibility is specified to present known compatible packages and versions.
    - If `compatibleWith` is not used, the patch is treated as compatible with any package
- If a package is specified with no versions, the patch is compatible with any version of the package
- A patch can raise a `PatchException` at any time of execution to indicate that the patch failed to execute.

## ⏭️ What's next

The next page explains the concept of fingerprinting in Morphe Patcher.

Continue: [🔎 Fingerprinting](2_2_1_fingerprinting.md)
# 🔎 Fingerprinting

In the context of Morphe, a fingerprint is a partial description of a method.
It is used to uniquely match a method by its characteristics.
Fingerprinting is used to match methods with a limited amount of known information.
Methods with obfuscated names that change with each update are primary candidates for fingerprinting.
The goal of fingerprinting is to uniquely identify a method by capturing various attributes, such as the return type,
access flags, instructions, strings, and more. Fingerprints are declared with varying amounts of information,
and the fingerprint matches a method only if _all_ the declared information matches. 

## ⛳️ Example fingerprint

```kt
// Declaring fingerprints as classes is not required, but if a fingerprint fails
// to match then the exception stack trace will include the fingerprint name. 
object AdLoaderFingerprint : Fingerprint(
    // Defining class is matched using StringComparisonType semantics (see class for details).
    definingClass = "Lcom/some/app/ads/AdsLoader;",
    // Exact access flags
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    // Return type is matched using StringComparisonType semantics.
    returnType = "Z",
    // Declared parameters are matched using StringComparisonType semantics.
    // Non obfuscated classes are best declared using the full class name.
    // While obfuscated class names must be declared only using the object type
    // Since obfuscated names change between releases.
    // Last parameter is simply `L` since it's an obfuscated class object.
    parameters = listOf("Ljava/lang/String;", "I", "L"),
    
    // Instruction filters.
    filters = listOf( 
        // Filter 1.
        fieldAccess(
            // Restrict to field get operation.
            opcode = Opcode.IGET,
            // "this" refers to the class the method was declared in.
            // It does not include superclasses or subclasses. 
            definingClass = "this",
            type = "Ljava/util/Map;"
        ),

        // Filter 2.
        string("showBannerAds"),
      
        // Filter 3.
        methodCall(
            definingClass = "Ljava/lang/String;",
            name = "equals",
        ),

        // Filter 4.
        // MatchAfterImmediately() means this must match immediately after the last filter.
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),

        // Filter 5.
        literal(1337),
        
        // Filter 6.
        opcode(Opcode.IF_EQ)
    )
)
```

## 🔎 Example target app in Java and Smali

```java
package com.some.app.ads;

class AdsLoader {
  private final static Map<String, String> m = new HashMap<>();

  // Method to fingerprint.
  public final boolean obfuscatedMethod(String parameter1, int parameter2, ObfuscatedClass parameter3) {
    // Filter 1 target instruction.
    String string = m.get(parameter1);

    unrelatedMethod(string);

    // Filter 2, 3, 4 target instructions, and the instructions to modify.
    if ("showBannerAds".equals(string)) {
      showBannerAds();
    }

    // Filter 5 and 6 target instructions.
    return parameter2 != 1337;
  }

  private void showBannerAds() {
    // ...
  }

  private void unrelatedMethod(String parameter) {
    // ...
  }
}
```

```asm
# Method to fingerprint.
.method public final obfuscatedMethod(Ljava/lang/String;ILObfuscatedClass;)Z
    .registers 4

    # Filter 1 target instruction.
    sget-object v0, Lcom/some/app/ads/AdsLoader;->a:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/some/app/ads/AdsLoader;->unrelatedMethod(Ljava/lang/String;)V

    # Filter 2 target instruction.
    const-string v0, "showBannerAds"

    # Filter 3 target instruction.
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    # Filter 4 target instruction.
    move-result p1

    if-eqz p1, :cond_16

    invoke-direct {p0}, Lcom/some/app/ads/AdsLoader;->showBannerAds()V

    # Filter 5 target instruction.
    :cond_16
    const/16 p1, 0x539

    # Filter 6 target instruction.
    if-eq p2, p1, :cond_1c

    const/4 p1, 0x1

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    return p1
.end method
```

  Notice the fingerprint filters do not declare every instruction in the target method, and between
  each filter, zero or more other instructions can exist.  Instruction filters must be declared in
  the same order as the instructions appear in the target method.

  If the distance between each instruction declaration can be approximated, then the `instructionLocation`
  parameter can be used with `MatchAfterWithin(int)` to restrict the instruction match to a maximum
  distance from the last instruction. To restrict matching to the first instruction of a method use
  `MatchFirst()`.

  If a single instruction varies slightly between different app targets but otherwise the fingerprint
  is still the same, the `anyInstruction()` filter can be used to specify the different expected
  instruction. Such as:
  ```kt
  anyInstruction(
      string("string in early app target, but not found in later target"),
      string("updated string in latest app target, but not found in earlier target")
  )
  ```

  To simplify some filter declarations, `methodCall` and `fieldAccess` can be declared using
  copy-pasted un-obfuscated smali statements. Such as: 
  ```kt
  methodCall(smali = "Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;")
  fieldAccess(smali = "Landroid/os/Build;->MODEL:Ljava/lang/String;")
  ```

  #### String declarations
  
  There are two ways to declare strings in fingerprints. The first and preferred way is using a
  string filter declaration such as `filters = listOf(string("foo"), string("bar"), /* other filters if desired */ )`
  where the order of the strings declared in the fingerprint must be the same as the order the strings appearing in
  the target method (the example above "foo" must appear _before_ "bar").
  
  The second is using the `strings = listof("foo", "bar")` declaration, where the strings are unordered and will
  match in any order of the target method. Generally, the `strings = listOf()` declaration is only useful for 
  matching methods with a large number of strings and they may appear randomly such as enum name types in an Enum
  initialization method. If you are unsure which to use, then use `filter = listOf(string("foo"))`.
  If you need the indices of this second matching type they are not found in `instructionMatches` but instead in
  their own legacy matching result. Please see the Fingerprint javadoc for more details on this second string declaration.

  #### Pure opcode matching

  If a method cannot be uniquely identified using the built in filters, but a fixed pattern of
  opcodes can identify the method, then the opcode pattern can be defined using the fingerprint
  `filters = OpcodesFilter.opcodesToFilters(Opcode...)` declaration.  Opcode patterns do not allow 
  variable spacing between each opcode, and all opcodes all must appear exactly as declared. Opcode 
  patterns should be avoided whenever possible due to their fragility and possibility of matching
  completely unrelated code.

> [!TIP]
> A fingerprint should contain information about a method that is unlikely to change between updates.
> Obfuscated class and method names should never be used.

## 🔨 How to use fingerprints

After declaring a fingerprint it can be used in a patch to find the method it matches to:

```kt
execute {
    AdLoaderFingerprint.let {
        // Changes the target code to:
        // if (false) {
        //    showBannerAds();
        // }
        val filter4 = it.instructionMatches[3]
        val moveResultIndex = filter3.index
        val moveResultRegister = filter3.getInstruction<OneRegisterInstruction>().registerA

        it.method.addInstructions(moveResultIndex + 1, "const/4 v$moveResultRegister, 0x0")
    }
}
```

Be careful if making more than 1 modification to the same method.  Adding/removing instructions to
a method can cause fingerprint match indexes to no longer be correct. The simplest solution is
to modify the target method from the last match index to the first.  Another solution is after modifying
the target method to then call `clearMatch()` followed by `match()`, and then the instruction match indexes
are up to date and correct.

Modifying the example above to also change the code `return parameter2 != 1337;` into: `return false;`: 

```kt
execute {
    AdLoaderFingerprint.let {
        // Modify method from last indexes to first to preserve the correct fingerprint indexes.

        // Remove conditional branch and always return false.
        val filter6 = it.instructionMatches[5]
        it.method.removeInstruction(filter6.index)

        // Changes the target code to:
        // if (false) {
        //    showBannerAds();
        // }
        val filter4 = it.instructionMatches[3]
        val moveResultIndex = filter3.index
        val moveResultRegister = filter3.getInstruction<OneRegisterInstruction>().registerA

        it.method.addInstructions(moveResultIndex + 1, "const/4 v$moveResultRegister, 0x0")
    }
}
```

For performance reasons, a fingerprint will always match only once (unless `clearMatch()` is called).
This makes it useful to share fingerprints between multiple patches, and the fingerprint matches on
the first usage of it.

```kt
val mainActivityPatch1 = bytecodePatch {
    execute {
        mainActivityOnCreateFingerprint.method.apply {
            // Modifications made here.
        }
    }
}

val mainActivityPatch2 = bytecodePatch {
    execute {
        mainActivityOnCreateFingerprint.method.apply {
            // More modifications made here.
            // Fingerprint does not match again, and the match result indexes are still the same as
            // found in mainActivityPatch1.  
        }
    }
}
```


Using methods found with one fingerprint in a different fingerprint:

Fingerprints can be declared as local variables (and not classes as above),
which is useful if a fingerprint requires information found with prior fingerprints.

```kotlin
val complexPatch = bytecodePatch(name = "Complex patch") {
    execute {
        val showAdFingerprint = Fingerprint(
            returnType = "Z",
            parameters = listOf("Ljava/lang/String;"),
            filters = listOf(
                methodCall(
                    name = "shouldShowAds",
                    returnType = "Z",
                    // Use class found with fingerprint declared earlier. 
                    definingClass = AdLoaderFingerprint.originalClassDef.type
                ),
                opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
            )
        )

        showAdFingerprint.let {
            val shouldShowAdsFilterMatch = it.instructionMatches[1]
            val register = shouldShowAdsFilterMatch.getInstruction<OneRegisterInstruction>().registerA

            // Override method call return value of "shouldShowAds" with false.
            it.method.addInstructions(
                shouldShowAdsFilterMatch.index,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
```

> [!WARNING]
> If the fingerprint can not be matched to any method,
> accessing certain properties of the will raise an exception.
> If no match existing is a normal use case, instead use the `orNull` properties such as `matchOrNull`.

The following properties can be accessed in a fingerprint:

- `originalClassDef`: The immutable class definition the fingerprint matches to. If no match is found, an exception is raised.
- `originalClassDefOrNull`: The immutable class definition the fingerprint matches to, or null.
- `originalMethod`: The immutable method the fingerprint matches to. If no match is found, an exception is raised.
- `originalMethodOrNull`: The immutable method the fingerprint matches to, or null.
- `classDef`: The mutable class the fingerprint matches to. If no match is found, an exception is raised.
- `classDefOrNull`: The mutable class the fingerprint matches to, or null.
- `method`: The mutable method the fingerprint matches to. If no match is found, an exception is raised.
- `methodOrNull`: The mutable method the fingerprint matches to, or null.

The difference between the `original` and non-`original` properties is that the `original` properties return the
original class or method definition, while the non-`original` properties return a mutable copy of the class or method.
The mutable copies can be modified. They are lazy properties, so they are only computed
and only then will effectively replace the `original` method or class definition when accessed.

> [!TIP]
> If only read-only access to the class or method is needed, the `originalClassDef` and
> `originalMethod` properties should be used, to avoid making a mutable copy of the class or method.


## Finding all methods a fingerprint matches

Fingerprints support finding all methods that match. A common usage is to change all 
const-string instructions to a different string literal. 

```kt

// Replace a specific bytecode string in all const-string instructions.
val stringFilter = string("exact string literal")
Fingerprint(
    filters = listOf(stringFilter)
).matchAllOrNull()?.forEach { match ->
    match.method.apply { 
        // See Morphe ByteCodeUtils for findInstructionIndicesReversedOrThrow()
        findInstructionIndicesReversedOrThrow(stringFilter).forEach { index ->
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            replaceInstruction(index, "const-string v$register, \"$toString\"")
        }
    }
}
```

## 🏹 Manually matching fingerprints

By default, a fingerprint is matched automatically against all classes when one of the
fingerprint's properties is accessed.

Instead, the fingerprint can be matched manually using various overloads of a fingerprint's `match` function:

- In a **list of classes**, if the fingerprint can match in a known subset of classes

  If you have a known list of classes you know the fingerprint can match in, you can match the
  fingerprint on the list of classes:

  ```kt
  execute {
      val match = ShowAdsFingerprint.match(classes)
  }
  ```

- In a **single class**, if the fingerprint can match in a single known class

  If you know the fingerprint can match a method in a specific class, you can match the fingerprint
  in the class:

  ```kt
  execute { 
      val adsLoaderClass = classBy("Lcom/some/app/ads/Loader;")

      val match = showAdsFingerprint.match(adsLoaderClass)
  }
  ```

  Another common use case is to find the class of the target code by finger printing an easy
  to identify method in that class (especially a method with string constants), then use the class
  found to match a second fingerprint that finds the target method. 

  ```kt
  execute {
      // Match showAdsFingerprint to the class of the ads loader found by adsLoaderClassFingerprint.
      val match = showAdsFingerprint.match(adsLoaderClassFingerprint.originalClassDef)
  }
  ```
  
  This can be declared as part of the fingerprint itself, using the `classFingerprint` field:
- ```kt
    val showAdFingerprint = Fingerprint(
        // Find class using another fingerprint, such as a method that contains unique strings.
        classFingerprint = Fingerprint(name = "toString", strings = listOf("classField=")),
        returnType = "Z",
        parameters = listOf("Ljava/lang/String;"),
        filters = listOf(
            methodCall(
                name = "getValue",
                returnType = "Z",
            ),
            opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
        )
    )
  ```

> [!TIP]
> To see real-world examples of fingerprints,
> check out the repository for [Morphe Patches](https://github.com/MorpheApp/morphe-patches).

## ⏭️ What's next

The next page discusses the structure and conventions of patches.

Continue: [📜 Project structure and conventions](3_structure_and_conventions.md)
# 📜 Project structure and conventions

Over time, a specific project structure and conventions have been established.

## 📁 File structure

Patches are organized in a specific way. The file structure looks as follows:

```text
📦your.patches.app.category
 ├ 🔍Fingerprints.kt
 └ 🧩SomePatch.kt
```

> [!NOTE]
> Moving fingerprints to a separate file isn't strictly necessary, but it helps the organization when a patch uses multiple fingerprints.

## 📙 Conventions

- 🔥 Name a patch after what it does. For example, if a patch removes ads, name it `Remove ads`.
  If a patch changes the color of a button, name it `Change button color`
- 🔥 Write the patch description in the third person, present tense, and end it with a period.
  If a patch removes ads, the description can be omitted because of redundancy,
  but if a patch changes the color of a button, the description can be _Changes the color of the resume button to red._
- 🔥 Name fingerprints with a best guess of what the target method does.
- 🔥 Write patches with modularity and reusability in mind. Patches can depend on each other,
  so it is important to write patches in a way that can be used in different contexts.
- 🔥🔥 Keep patches as minimal as possible. This reduces the risk of failing patches.
  Instead of involving many abstract changes in one patch or writing entire methods or classes in a patch,
  you can write code in extensions. An extension is a precompiled DEX file that is merged into the patched app 
  before this patch is executed.
  Patches can then reference methods and classes from extensions.
  A real-world example of extensions can be found in the [Morphe Patches](https://github.com/MorpheApp/morphe-patches) repository
- 🔥🔥🔥 Do not overload a fingerprint with information about a method that's likely to change.
  In the example of an obfuscated method, it's better to fingerprint the method by its return type
  and parameters rather than its name because the name is likely to change. An intelligent selection
  of an instructions filters in a method can result in a strong fingerprint dynamic to app updates.
- 🔥🔥🔥 Document your patches. Patches are abstract, so it is important to document parts of the code
  that are not self-explanatory. For example, explain why and how a certain method is patched or 
  large blocks of instructions that are modified or added to a method.

## ⏭️ What's next

The next page discusses useful APIs for patch development.

Continue: [💪 Advanced APIs](4_apis.md)
# 💪 Advanced APIs

A handful of APIs are available to make patch development easier and more efficient.

## 📙 Overview

1. 🔍 Find immutable classes with `classDefBy(String)`
2. 🔄️️ Change immutable classes to mutable with `mutableClassDefBy(ClassDef)
3. 💾 Read and write resource files with `get(String, Boolean)` and `delete(String)`
4. 📃 Read and write DOM files using `document(String)` and  `document(InputStream)`

### 🧰 APIs

#### 🔍 `classDefBy(String)`

The `classDefBy(String)` function is an alternative to finding immutable classes
from a constant string or from a String field of a fingerprint match. 

```kt
execute {
    // Find the superclass of a fingerprint return type
    val superClassOfReturnType = classDefBy(match().originalMethod.returnType).superclass
}
```

#### 🔄️ `mutableDefClassBy(ClassDef)`

By default, the classes are immutable and they cannot be modified.
To make a class mutable use the `mutableClassDefBy(ClassDef)` function.
Accessing the property will replace the original class definition with the mutable copy,
thus allowing you to make changes to the class. Subsequent accesses will return the same mutable copy.

```kt
execute {
    // Find a class by the return type of a fingerprint
    val superClassOfReturnType = classDefBy(match().originalMethod.returnType).superclass

    val mutableClass = mutableClassDefBy(superClassOfReturnType)
    mutableClass.methods.add(Method())
}
```

<!-- TODO show getting a method/field using `getMethodCalled()` -->

#### 💾 `get(String, Boolean)` and `delete(String)`

The `get(String, Boolean)` function returns a `File` object that can be used to read and write resource files.

```kt
execute {
    val file = get("res/values/strings.xml")
    val content = file.readText()
    file.writeText(content)
}
```

The `delete` function can mark files for deletion when the APK is rebuilt.

```kt
execute {
    delete("res/values/strings.xml")
}
```

#### 📃 `document(String)`  and  `document(InputStream)`

The `document` function is used to read and write DOM files.

```kt
execute {
    document("res/values/strings.xml").use { document ->
        val element = doc.createElement("string").apply {
            textContent = "Hello, World!"
        }
        document.documentElement.appendChild(element)
    }
}
```

You can also read documents from an `InputStream`:

```kt
execute {
    val inputStream = classLoader.getResourceAsStream("some.xml")
    document(inputStream).use { document ->
        // ...
    }
}
```

## 🎉 Afterword

Morphe Patcher is a powerful library to patch Android applications, offering a rich set of APIs to
develop patches that outlive app updates. Patches make up Morphe; without you, the community of
patch developers, Morphe would not be what it is today. We hope that this documentation has been
helpful to you and are excited to see what you will create with Morphe Patcher.
