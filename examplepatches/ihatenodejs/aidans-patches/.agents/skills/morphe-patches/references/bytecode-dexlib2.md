# Dexlib2 Bytecode Manipulation & Smali Reference

This reference covers navigating Dexlib2 AST structures, locating classes and methods, using standard bytecode neutralizers, injecting Smali instructions, observing Dalvik register width limits, and validating control-flow integrity.

---

## 1. Dexlib2 AST Navigation

Inside a `bytecodePatch` or `compositeFeaturePatch`'s `execute { ... }` block, the receiver is `BytecodePatchContext`.

### Class Discovery

Always prefer safe resolution with explicit error throwing over unsafe operations:

```kotlin
// Safe resolution with diagnostic error
val classDef = mutableClassDefByOrNull("Lcom/example/analytics/Tracker;")
    ?: throw PatchException("Failed to find class Lcom/example/analytics/Tracker;")

// Optional resolution for version-dependent classes
val optionalDef = mutableClassDefByOrNull("Lcom/example/beta/FeatureFlag;")
if (optionalDef == null) {
    // Graceful continuation when explicitly version-optional
    return@execute
}
```

### Method Discovery & Anchoring

Avoid matching on broad names alone (e.g. `init` or `onClick`). Anchor methods using:

1. Exact method name.
2. Parameter types (list of descriptors).
3. Return type descriptor (`"V"` for void, `"Z"` for boolean, `"I"` for int, `"Ljava/lang/String;"`, etc.).
4. Presence of concrete implementation (`implementation != null`).
5. Distinctive instruction reference (string literal, called method, field access).

```kotlin
val targetMethod = classDef.methods.firstOrNull { method ->
    method.name == "onCreate" &&
        method.parameterTypes == listOf("Landroid/os/Bundle;") &&
        method.returnType == "V" &&
        method.implementation != null
} ?: throw PatchException("Could not find onCreate(Bundle)V in ${classDef.type}")
```

### Locating Instruction Anchors

Inspect `implementation.instructions` to anchor edits to specific opcodes or references:

```kotlin
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val instructions = targetMethod.implementation!!.instructions.toList()

// Find instruction by string reference
val anchorIndex = instructions.indexOfFirst { inst ->
    inst.opcode == Opcode.CONST_STRING &&
        (inst as? ReferenceInstruction)?.reference?.let { ref ->
            (ref as? StringReference)?.string == "enable_tracking"
        } == true
}
if (anchorIndex == -1) {
    throw PatchException("Anchor string 'enable_tracking' not found in ${targetMethod.name}")
}

// Find instruction by method invocation reference
val invokeIndex = instructions.indexOfFirst { inst ->
    (inst as? ReferenceInstruction)?.reference?.let { ref ->
        val mRef = ref as? MethodReference
        mRef?.name == "sendEvent" && mRef.definingClass == "Lcom/tracker/Analytics;"
    } == true
}
```

---

## 2. Standard Bytecode Neutralizers

Before writing custom Smali injection, check whether existing neutralizers from `app.aidan.patches.shared.BytecodeNeutralizers` can fulfill the requirement. These utilities handle class/method resolution and void-method early-return guards; they do **not** all guard against prior application.

```kotlin
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.disableRequiredVoidMethodsByName
import app.aidan.patches.shared.returnOptionalBoolean
import app.aidan.patches.shared.returnRequiredBoolean
import app.aidan.patches.shared.returnOptionalNullObject
import app.aidan.patches.shared.returnRequiredNullObject
import app.aidan.patches.shared.returnOptionalString
import app.aidan.patches.shared.returnOptionalUnit
import app.aidan.patches.shared.returnRequiredUnit
```

### Neutralizer Catalog & Semantics

| Helper Method | Required / Optional | Semantics |
|---|---|---|
| `disableRequiredVoidMethods(classDescriptor, *methodNames)` | **Required** | Class must exist. At least one of the named void methods must be present; every match gets `return-void` at index 0 unless it already starts with `return-void`. |
| `disableRequiredVoidMethodsByName(classDescriptor, *methodNames)` | **Required** | Class must exist. **Every** named method must be present; every match gets the same guarded `return-void`. |
| `disableOptionalVoidMethods(classDescriptor, *methodNames)` | Optional | If the class exists, all matching implemented void methods are neutralized with `return-void` (guarded). Missing class or method names do not throw. |
| `returnRequiredBoolean(classDescriptor, methodName, value)` | **Required** | Class and at least one matching implemented boolean method must exist. Prepends `const/4 v0, <0x0\|0x1>` and `return v0` to **all** matches. No idempotency check. |
| `returnOptionalBoolean(classDescriptor, methodName, value)` | Optional | Missing class/method succeeds silently; otherwise same prepend behavior. |
| `returnRequiredNullObject(classDescriptor, methodName)` | **Required** | Class and at least one matching implemented object/array-returning method must exist. Prepends `const/4 v0, 0x0` and `return-object v0`. No idempotency check. |
| `returnOptionalNullObject(classDescriptor, methodName)` | Optional | Same prepend behavior, but missing class/method is ignored. |
| `returnOptionalString(classDescriptor, methodName, value)` | Optional | If a matching `String`-returning method exists, prepends `const-string v0, "<escaped>"` and `return-object v0`. No idempotency check. |
| `returnRequiredUnit(classDescriptor, *methodNames)` | **Required** | Class and at least one matching object-returning method must exist. Prepends `sget-object v0, Lkotlin/Unit;->INSTANCE` and `return-object v0`. No idempotency check. |
| `returnOptionalUnit(classDescriptor, *methodNames)` | Optional | Same prepend behavior, silently ignores missing targets. |

**Idempotency caveat:** only the `disable*VoidMethods` helpers inspect the first instruction. The `return*` helpers always prepend, so applying the same helper twice to the same method duplicates the early return. Call each helper once per target per patch execution; if a patch can run twice, add an explicit check for the injected replacement (see §3).

### Example: Disabling Analytics & Telemetry

```kotlin
execute {
    // Required: crash reporter class must be present
    disableRequiredVoidMethodsByName(
        "Lcom/example/analytics/Tracker;",
        "trackEvent",
        "logException",
        "flushQueue"
    )

    // Optional: in-app survey prompt might not exist in all versions
    returnOptionalBoolean(
        "Lcom/example/features/SurveyGate;",
        "shouldDisplaySurvey",
        false
    )
}
```

---

## 3. Custom Smali Instruction Injection

When neutralizers are insufficient (e.g. conditional branches, bridge invocations, state updates), use `addInstructions` or `replaceInstruction`.

```kotlin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
```

### Register Allocation & Parameter Registers

1. **Local vs Parameter Registers**:
   - In Smali, parameters use `p0`, `p1`, `p2`, etc.
   - For **instance (virtual/direct)** methods:
     - `p0` is `this`.
     - `p1` is the 1st parameter.
   - For **static** methods:
     - `p0` is the 1st parameter.
     - `p1` is the 2nd parameter.
   - Local registers use `v0`, `v1`, etc.
   - `pN` is an alias resolved against `implementation.registerCount`; it can point above `v15`. Wide parameters (`J`, `D`) occupy two registers.
2. **Register Count**:
   - `addInstructions` inserts Smali text. If injecting local registers (e.g. `v0`, `v1`), ensure they do not clobber live variables needed by subsequent instructions. Prefer a register that is provably dead or immediately overwritten; do not assume `v0` is free.
3. **Instruction-Format Register Widths**:
   - Register width is defined per instruction format by the DEX specification, not per opcode family:

| Format | Examples | Register operand width | Practical consequence |
|---|---|---|---|
| `22c` | `instance-of vA, vB, type@CCCC`, `iget*`, `iput*` | Two 4-bit registers (`v0..v15`) | `v16` cannot be encoded; move to a low register first. |
| `21c` | `check-cast`, `new-instance`, `const-string`, `sget*`, `sput*`, `const-class` | One 8-bit register (`v0..v255`) | `v16` is legal. |
| `11n` | `const/4` | One 4-bit register; signed 4-bit literal (`-8..7`) | Literal and register both constrained. |
| `21s` | `const/16` | One 8-bit register; signed 16-bit literal | — |
| `35c` | `invoke-*` | Up to five 4-bit registers (`v0..v15`) | Use a `/range` form or move arguments to low registers when needed. |
| `3rc` | `invoke-*/range` | 16-bit start register + 8-bit count | — |

- A width violation is normally caught by the Smali assembler, by dexlib2's `Preconditions` during `BuilderInstruction` construction, or by `apk-lab validate-smali` **before** output is written.
- A runtime `VerifyError` is a separate verification failure and is not a reliable detector: malformed code may fail during assembly, encoding, or DEX writing first, and `dexdump -c` verifies only the checksum. Do not rely on device crashes to find width mistakes.

### Example: Calling a Java Extension Bridge

```kotlin
// Inject at method entry (index 0).
// p0 is the Activity instance in an instance method.
// Verify p0's absolute index is <= 15 for a 35c invoke; otherwise move it first.
targetMethod.addInstructions(
    0,
    """
    invoke-static {p0}, Lapp/aidan/extension/sezzle/ConsentGate;->maybeShow(Landroid/app/Activity;)V
    """.trimIndent()
)
```

### Example: Replacing a Branch with an Idempotency Guard

This example forces a boolean gate to its permissive path by replacing `if-eqz` with `goto/32` to the same label. It does not insert instructions, does not clobber the branch's register, and is idempotent because the injected `goto/32` is the exact post-patch shape. Replace the descriptors with values verified for the exact target version.

```kotlin
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val impl = targetMethod.implementation
    ?: throw PatchException("Missing implementation for ${targetMethod.name}")
val instructions = impl.instructions.toList()

// 1. Anchor on a call that survives the transformation.
val anchors = instructions.withIndex().filter { (_, inst) ->
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    ref != null &&
        ref.definingClass == "Lcom/example/auth/Session;" &&
        ref.name == "isLoggedIn" &&
        ref.parameterTypes.isEmpty() &&
        ref.returnType == "Z"
}
if (anchors.isEmpty()) {
    throw PatchException(
        "Missing anchor Lcom/example/auth/Session;->isLoggedIn()Z in ${targetMethod.name}"
    )
}
if (anchors.size > 1) {
    throw PatchException(
        "Ambiguous anchor isLoggedIn()Z (${anchors.size} calls) in ${targetMethod.name}; refusing to guess"
    )
}

val anchorIndex = anchors.single().index
val moveResult = instructions.getOrNull(anchorIndex + 1)
val branch = instructions.getOrNull(anchorIndex + 2)
if (moveResult?.opcode != Opcode.MOVE_RESULT || branch == null) {
    throw PatchException(
        "Unexpected shape after anchor at index $anchorIndex: expected move-result + branch"
    )
}
val gateRegister = (moveResult as OneRegisterInstruction).registerA

if (branch.opcode == Opcode.GOTO_32) {
    // Already patched: the exact injected shape is anchor + move-result + goto/32.
} else {
    if (branch.opcode != Opcode.IF_EQZ) {
        throw PatchException(
            "Unexpected ${branch.opcode} after anchor at index $anchorIndex; expected IF_EQZ or GOTO_32"
        )
    }
    val branchRegister = (branch as OneRegisterInstruction).registerA
    if (branchRegister != gateRegister) {
        throw PatchException(
            "Branch reads v$branchRegister but anchor result is v$gateRegister in ${targetMethod.name}"
        )
    }

    // Verify the target label is the permissive path before forcing it.
    val target = (branch as BuilderOffsetInstruction).target
    targetMethod.replaceInstruction(
        anchorIndex + 2,
        BuilderInstruction30t(Opcode.GOTO_32, target)
    )
}
```

If the unpatched app can legitimately produce the same anchor + `move-result` + `goto/32` shape, this is not a distinctive enough invariant: add a stronger marker (for example, verify the target block's instructions) before treating it as already patched.

If every occurrence must be patched, iterate `anchors` only after proving each occurrence has the same shape; never silently patch only the first candidate.

---

## 4. Pre-Validation with APK Lab

Before building the full bundle, statically validate register widths, Smali opcodes, literal bounds, and control-flow graphs using `apk-lab validate-smali`:

```bash
# Validate a Smali instruction snippet (no .class/.method directives).
# --locals is required; --params counts single-width parameters.
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- validate-smali \
  --snippet "const/4 v0, 0x1
return v0" \
  --locals 1 --params 0

# Validate with exact parameter widths (J/D consume two registers).
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- validate-smali \
  --snippet "invoke-static {v0, v1}, Lcom/example/Foo;->bar(J)V" \
  --locals 2 \
  --descriptor "(J)V" \
  --is-static
```

`apk-lab validate-smali` verifies:

- `22c` register bounds (`v0..v15`) and `21c` bounds (`v0..v255`).
- `35c` register-list bounds and `const/4` literal range.
- Target label existence and duplicate labels for branch instructions.
- Method descriptor parsing, including `J`/`D` register widths.
- That the pinned Smali assembler accepts the snippet.

It is a static preflight, not the Android runtime verifier: it cannot prove type safety, reachable control flow, or absence of a runtime `VerifyError`.

---

## 5. Early Return & Control-Flow Safety Rules

1. **Clean Method Entry Neutralization**:
   - When injecting an early return (`return-void`, `return v0`, etc.) at index 0, ensure no side effects (such as critical superclass constructors `invoke-direct {p0}, Ljava/lang/Object;-><init>()V`) are bypassed in `<init>` methods.
   - In `<init>` or `<clinit>` constructors, never inject an early return before the superclass constructor call.
2. **Try/Catch Boundary Preservation**:
   - Inserting instructions at index 0 shifts subsequent instruction indices.
   - Dexlib2 automatically adjusts try-catch block offsets when using `addInstructions`, but avoid splitting an instruction pair that assumes adjacent execution (such as `packed-switch` or `fill-array-data` payloads).
3. **Double Patching Protection**:
   - Always check `instructions` to determine if the target instruction or bridge call already exists before injecting.
