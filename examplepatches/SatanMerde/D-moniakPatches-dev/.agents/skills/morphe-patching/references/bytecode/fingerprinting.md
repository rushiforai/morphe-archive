# Morphe Fingerprinting — Official Reference

> ⚠️ Pinned source: morphe-patcher `6f189f9`. Official docs may lag the source — the pinned
> source wins if anything contradicts this file.

A fingerprint is a partial description of a method used to uniquely match it by stable
characteristics that survive app updates. Obfuscated names change every release — fingerprints
match on return type, access flags, parameters, and instruction patterns instead.

## Fingerprint Declaration — Preferred Style

Declare as **`object` classes** — this gives named stack traces when a fingerprint fails to match:

```kotlin
object MyFingerprint : Fingerprint(
    definingClass = "Lcom/example/Class;",   // StringComparisonType semantics
    name = "methodName",                      // Only for non-obfuscated methods
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "I", "L"),  // "L" for obfuscated classes

    // Ordered instruction filters (must appear in same order as target method)
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET, definingClass = "this", type = "Ljava/util/Map;"),
        string("showBannerAds"),
        methodCall(definingClass = "Ljava/lang/String;", name = "equals"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        literal(1337),
        opcode(Opcode.IF_EQ),
    ),

    // Unordered string matching (for methods with many strings in random order)
    strings = listOf("unordered1", "unordered2"),

    // Custom predicate
    custom = { method, classDef -> classDef.type == "Lcom/target/Class;" },

    // Find class via another fingerprint first
    classFingerprint = AnotherFingerprint,
)
```

The old DSL builder (`fingerprint { … }`) is deprecated. Always use `object X : Fingerprint(…)`.

## Access Flags — Exact Bitmask

`accessFlags` matches the **exact** bitmask. Every flag present in the method must be listed:

```kotlin
// ✅ Public static — list both
accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)

// ✅ Public static final — list all three
accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)

// ❌ Wrong — won't match a "public static final" method
accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
```

Always verify the exact flags from smali. The common ones:

| AccessFlags value | Smali keyword |
|-------------------|---------------|
| `PUBLIC` | `public` |
| `PRIVATE` | `private` |
| `PROTECTED` | `protected` |
| `STATIC` | `static` |
| `FINAL` | `final` |
| `ABSTRACT` | `abstract` |
| `CONSTRUCTOR` | constructor (`<init>`) |
| `SYNTHETIC` | `synthetic` |

## Filter Types

| Filter | Usage |
|--------|-------|
| `string("text")` | Match const-string instruction (EQUALS by default) |
| `string("text", StringComparisonType.CONTAINS)` | Match string with custom comparison |
| `methodCall(definingClass, name, parameters, returnType)` | Match invoke-* instruction |
| `methodCall(smali = "Landroid/net/Uri;->parse(...)Landroid/net/Uri;")` | Smali shorthand |
| `fieldAccess(opcode, definingClass, name, type)` | Match field get/put |
| `fieldAccess(smali = "Landroid/os/Build;->MODEL:Ljava/lang/String;")` | Smali shorthand |
| `opcode(Opcode.X)` | Match specific opcode |
| `literal(value)` | Match const literal (Long, Int, Double, Float, or `() -> Long?` lambda) |
| `resourceLiteral(ResourceType.ID, "view_name")` | Match resource ID literal |
| `newInstance("Lcom/example/Foo;")` | Match `new-instance` / `new-array` |
| `instanceOf("Lcom/example/Foo;")` | Match `instance-of` |
| `checkCast("Lcom/example/Foo;")` | Match `check-cast` |
| `anyInstruction(f1, f2)` | Match any alternative (for version differences) |

For `methodCall`, `fieldAccess`, `newInstance`, `instanceOf`, and `checkCast`, the comparison
type is inferred from the type declaration: exact types (e.g. `Lcom/Foo;`) use EQUALS, prefixes
(e.g. `Lcom/`) use STARTS_WITH, and suffixes (e.g. `/Foo;`) use ENDS_WITH.

## InstructionLocation Options

| Location | Description |
|----------|-------------|
| `MatchAfterAnywhere()` | Default — match anywhere after previous filter |
| `MatchAfterImmediately()` | Must be immediately after previous filter (MOVE_RESULT etc.) |
| `MatchAfterWithin(n)` | Within n unmatched instructions of previous filter |
| `MatchFirst()` | First instruction of method; only valid for first filter |
| ~~`MatchAfterAtLeast`~~ | **Deprecated** — avoid; will be removed |
| ~~`MatchAfterRange`~~ | **Deprecated** — avoid; will be removed |

## String Declarations — Two Ways

1. **Preferred — ordered via filters**: `filters = listOf(string("foo"), string("bar"))` — order must match target method
2. **Unordered via strings**: `strings = listOf("foo", "bar")` — matches in any order, useful for enums with many strings

## Using Fingerprints in Patches

```kotlin
execute {
    // Auto-matches on first access, cached for reuse
    MyFingerprint.method.addInstructions(0, "...")

    // Access instruction match indices (only when filters are declared)
    val index = MyFingerprint.instructionMatches[0].index
    val reg = MyFingerprint.instructionMatches[0].getInstruction<OneRegisterInstruction>().registerA

    // Null-safe instructionMatches — doesn't throw if no filters
    val matchesOrNull = MyFingerprint.instructionMatchesOrNull

    // Navigate to called method from a methodCall filter match
    val calledMethod = MyFingerprint.instructionMatches[0].getMethodCalled()

    // Navigate to accessed field from a fieldAccess filter match
    val field = MyFingerprint.instructionMatches[1].getFieldAccessed()

    // Access class
    val classDef = MyFingerprint.originalClassDef

    // Null-safe access
    val methodOrNull = MyFingerprint.methodOrNull

    // Match all occurrences — with optional count range
    Fingerprint(filters = listOf(string("target"))).matchAll()
        .forEach { match -> match.method.apply { /* modify */ } }

    // Match all, require exactly 2–4 matches
    MyFingerprint.matchAll(2..4).forEach { /* … */ }

    // Manual matching in specific class
    MyFingerprint.match(SomeOtherFingerprint.originalClassDef)
}
```

## Fingerprint Properties

| Property | Returns | On no match |
|----------|---------|-------------|
| `originalClassDef` | Immutable class | Exception |
| `originalClassDefOrNull` | Immutable class | null |
| `originalMethod` | Immutable method | null |
| `classDef` | Mutable class (replaces original) | Exception |
| `method` | Mutable method (replaces original) | Exception |
| `methodOrNull` | Mutable method | null |
| `instructionMatches` | `List<InstructionMatch>` | Exception if no filters |
| `instructionMatchesOrNull` | `List<InstructionMatch>?` | null |

Use `original*` for read-only access (avoids creating mutable copy).

## Class-Based Fingerprint Chaining

Find class via one fingerprint, then find method within it:

```kotlin
object AdClassFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("classField="),
)

object ShowAdFingerprint : Fingerprint(
    classFingerprint = AdClassFingerprint,
    returnType = "Z",
    filters = listOf(
        methodCall(name = "getValue", returnType = "Z"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
    )
)
```

## Dynamic Fingerprints (using prior match results)

```kotlin
execute {
    val dynamicFingerprint = Fingerprint(
        definingClass = SomeFingerprint.originalClassDef.type,
        returnType = "V",
        filters = listOf(fieldAccess(opcode = Opcode.IPUT_BOOLEAN, reference = someField))
    )
    dynamicFingerprint.method.apply { /* modify */ }
}
```

## Multiple Modifications — Index Safety

When modifying multiple instructions, work from last index to first:

```kotlin
AdLoaderFingerprint.let {
    // Last filter first
    val filter6 = it.instructionMatches[5]
    it.method.removeInstruction(filter6.index)

    // Then earlier filter
    val filter4 = it.instructionMatches[3]
    val reg = filter4.getInstruction<OneRegisterInstruction>().registerA
    it.method.addInstructions(filter4.index + 1, "const/4 v$reg, 0x0")
}
```

Or use `clearMatch()` + `match()` to refresh indices after modifications.

## Critical Rules

- NEVER use obfuscated class/method names (`a`, `b`, `H`)
- Non-obfuscated names (`isPremium`, `getEntitlements`) are safe
- Filters must appear in same order as target method instructions
- Declare as `object` classes for named stack traces on match failure — **preferred**
- Always verify against smali bytecode, not jadx Java output
- Fingerprints match once and cache — safe to share between patches
- Use `"L"` for obfuscated parameter types
- Use `definingClass = "this"` for self-referencing fields
- `accessFlags` is an **exact bitmask** — list every flag present in smali
- Do not use `MatchAfterAtLeast` or `MatchAfterRange` — both deprecated
- `parametersStartsWith` is renamed to `parametersMatch` — use the new name
