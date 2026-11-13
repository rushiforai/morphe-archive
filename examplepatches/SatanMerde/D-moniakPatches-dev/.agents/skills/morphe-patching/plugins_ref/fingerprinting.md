# Morphe Fingerprinting (Patcher `6f189f9`)

Read `upstream-baseline.md` first. Decompiled Java explains behavior; exact smali is the source of
truth for descriptors, flags, registers, filter order, and patch points.

## Preferred declaration

```kotlin
object EntitlementFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/vendor/CustomerInfo;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/vendor/CustomerInfo;",
            name = "getEntitlements",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, InstructionLocation.MatchAfterImmediately()),
        methodCall(name = "getActive", returnType = "Ljava/util/Map;"),
    ),
)
```

Named objects produce useful failure stack traces. The old `fingerprint { ... }` builder DSL is
deprecated.

## Method fields

- `definingClass`, `returnType`, and parameter descriptors use `StringComparisonType` inference.
- `name` is exact; never use an obfuscated app method name.
- `accessFlags` is an exact bitmask. A `public static final` method requires all three flags.
- Parameter lists must have the same count. Use `"L"` for an obfuscated object type.
- `filters` are ordered. `strings` are legacy unordered string declarations.
- `custom` receives the immutable method and class.
- `classFingerprint` restricts a second fingerprint to the first fingerprint's class.

Type inference: primitives and complete `L...;`/object-array descriptors are exact; `Lprefix`
uses starts-with, `/Suffix;` uses ends-with, and other partial declarations use contains.

## Built-in filters

| Filter | Purpose |
|---|---|
| `string(value, comparison, location)` | const-string, exact by default |
| `methodCall(...)` / `methodCall(smali = ...)` | invoke reference |
| `fieldAccess(...)` / `fieldAccess(smali = ...)` | field get/put reference |
| `opcode(Opcode.X, location)` | one opcode |
| `OpcodesFilter.opcodesToFilters(...)` | contiguous opcode pattern; fragile |
| `literal(Int/Long/Float/Double/lambda, ...)` | numeric literal |
| `resourceLiteral(ResourceType.ID, name, exceptionIfResourceNotFound, location)` | APK resource-ID literal |
| `newInstance(type, location)` | `new-instance` or `new-array` |
| `instanceOf(type, location)` | `instance-of` |
| `checkCast(type, location)` | `check-cast` |
| `anyInstruction(filters..., location)` | logical OR for version differences |

For optional version-specific resources inside `anyInstruction`, set
`exceptionIfResourceNotFound = false` so absence produces no match instead of an exception.

## Locations

- `MatchAfterAnywhere()` (default)
- `MatchAfterImmediately()`
- `MatchAfterWithin(n)` where `n` is unmatched-instruction distance
- `MatchFirst()` for the first filter only

`MatchAfterAtLeast` and `MatchAfterRange` are deprecated.

## Match access

```kotlin
val immutableClass = MyFingerprint.originalClassDef
val immutableMethod = MyFingerprint.originalMethod
val mutableClass = MyFingerprint.classDef
val mutableMethod = MyFingerprint.method
val optionalMethod = MyFingerprint.methodOrNull
val match = MyFingerprint.match()
val classMatch = MyFingerprint.match(OtherFingerprint.originalClassDef)
val methodMatch = MyFingerprint.match(method)
val all = MyFingerprint.matchAll()
val exactlyTwoToFour = MyFingerprint.matchAll(2..4)
val optionalAll = MyFingerprint.matchAllOrNull()
```

`original*OrNull`, `classDefOrNull`, and `methodOrNull` avoid exceptions. Prefer immutable
properties when no mutation is needed.

`instructionMatches` exists only when `filters` is declared; use `instructionMatchesOrNull` for
nullable access. Each `InstructionMatch` has `index`, `instruction`, typed `getInstruction<T>()`,
`getMethodCalled()`, and `getFieldAccessed()`.

`stringMatches` is only for legacy `strings = listOf(...)` declarations. A fingerprint may declare
both strings and filters, but their result lists remain separate.

## Class chaining and dynamic matching

```kotlin
object ModelClassFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("SubscriptionState("),
)

object TargetFingerprint : Fingerprint(
    classFingerprint = ModelClassFingerprint,
    returnType = "Z",
    filters = listOf(methodCall(name = "getValue", returnType = "Z")),
)
```

A dynamic fingerprint can use a descriptor/reference discovered earlier, and fingerprints can be
matched manually against a class or method. `parametersStartsWith` was renamed to
`parametersMatch`; use the current function.

## Index safety and multiplicity

Fingerprint matches are cached. When editing several matched indexes, modify from highest to
lowest. Otherwise call `clearMatch()` and rematch before reusing indexes.

Use `matchAll()` only when transforming every occurrence intentionally. Count expected matches
with an `IntRange` and exclude extension classes in `custom` when scanning globally.

## Required evidence

Before implementation, record the DEX directory, smali file, complete `.method` line, exact flags,
parameters/return type, `.registers`/`.locals`, ordered relevant instructions, intended patch point,
uniqueness rationale, and limitations. A Java-only candidate is not ready.
