package anxyis.morphe.patches.pure.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.lang.reflect.ParameterizedType

/**
 * Shared mutation helpers for the Pure Motion patch source.
 *
 * Policy (matches the version-lock contract in Constants.kt): every helper
 * that locates code asserts EXACTLY-once matches and throws PatchException
 * otherwise. A silent partial patch is worse than a failed run — Morphe
 * aborts the run on PatchException, which is what we want on a wrong base.
 *
 * Only two dexlib2 mutation primitives are used (both observed in working
 * third-party Morphe patch sources):
 *  - index, smali): insert parsed smali before index.
 *  - index, count): delete a contiguous range.
 * Whole-method replacement = clearBody() + 0, body).
 * Mid-method const forcing = after move-result, const).
 */

// ---------------------------------------------------------------------------
// Method location
// ---------------------------------------------------------------------------

/** Require a class to exist; fail fast with the exact missing type. */
fun BytecodePatchContext.requireClass(type: String) =
    mutableClassDefByOrNull(type)
        ?: throw PatchException("Pure: class not found: $type (wrong base? locked to 5.0.270)")

/**
 * Require exactly one method by name + signature. Overloads are common in
 * this app (Ud, b2, kB...), so parameters + return type are mandatory.
 */
fun BytecodePatchContext.requireMethod(
    type: String,
    name: String,
    parameters: List<String>,
    returnType: String,
) = requireClass(type).methods.singleOrNull {
    it.name == name && it.parameterTypes == parameters && it.returnType == returnType
} ?: throw PatchException(
    "Pure: method not found exactly once: $type->$name(${parameters.joinToString(",")}):$returnType",
)

// ---------------------------------------------------------------------------
// Body wiping / register growth (reflection on dexlib2 internals; the field
// shapes below are the standard dexlib2 layout also relied upon by other
// Morphe patch sources)
// ---------------------------------------------------------------------------

private val tryBlocksField = runCatching {
    MutableMethodImplementation::class.java.declaredFields
        .first { f ->
            (MutableList::class.java.isAssignableFrom(f.type) ||
                List::class.java.isAssignableFrom(f.type)) &&
                (f.genericType as? ParameterizedType)?.actualTypeArguments
                    ?.firstOrNull()?.typeName
                    ?.contains("BuilderTryBlock") == true
        }
        .apply { isAccessible = true }
}.getOrNull()

private val registerCountField = runCatching {
    MutableMethodImplementation::class.java.declaredFields
        .first { it.type == Int::class.javaPrimitiveType }
        .apply { isAccessible = true }
}.getOrNull()

/** Drop every instruction AND every try/catch range (stale ranges = VerifyError). */
fun MutableMethod.clearBody() {
    val impl = implementation ?: return
    val field = tryBlocksField
        ?: throw PatchException("Pure: MutableMethodImplementation try-block field not found")
    @Suppress("UNCHECKED_CAST")
    (field.get(impl) as MutableList<*>).clear()
    val n = impl.instructions.toList().size
    repeat(n) { impl.removeInstruction(0) }
}

/**
 * Grow registerCount to [needed] when the replacement body needs more locals
 * than the stock method declares. Increasing the count pushes p-regs up, so
 * existing parameter references stay correct (ART derives p-regs from count).
 * Must be called BEFORE addInstructions.
 */
fun MutableMethod.ensureRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount >= needed) return
    val field = registerCountField
        ?: throw PatchException("Pure: MutableMethodImplementation registerCount field not found")
    field.setInt(impl, needed)
}

/** Total registers a body with [locals] extra locals needs (this + params). */
fun MutableMethod.registersFor(locals: Int): Int {
    val params = parameterTypes.size
    val hasThis = (accessFlags and AccessFlags.STATIC.value) == 0
    return locals + params + if (hasThis) 1 else 0
}

// ---------------------------------------------------------------------------
// Whole-method replacement (bodies stored verbatim under resources/)
// ---------------------------------------------------------------------------

/**
 * Replace a method body with smali [body] containing INSTRUCTIONS ONLY
 * (no .method/.locals/.line directives; labels defined inside the body are
 * fine). Bodies are the Tanryu-side method texts with brand literals
 * reverted to stock form — see tools/extract_bodies.py which produced them.
 */
fun BytecodePatchContext.replaceBody(
    type: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    locals: Int,
    body: String,
) {
    val m = requireMethod(type, name, parameters, returnType)
    m.ensureRegisters(m.registersFor(locals))
    m.clearBody()
    m.addInstructions(0, body)
}

/** Prepend `const; return` so the original body becomes dead code. */
fun BytecodePatchContext.prependReturn(
    type: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    constSmali: String,
    returnSmali: String,
    regs: Int = 1,
) {
    val m = requireMethod(type, name, parameters, returnType)
    if (constSmali.isNotEmpty()) {
        m.ensureRegisters(maxOf(m.implementation?.registerCount ?: 0, regs))
        m.addInstructions(0, "$constSmali\n$returnSmali")
    } else {
        m.addInstructions(0, returnSmali)
    }
}

// ---------------------------------------------------------------------------
// Intra-method anchors (mid-method const forcing / single-invoke removal)
// ---------------------------------------------------------------------------

/** All instruction indices invoking [targetClass]->[targetName]. */
fun MutableMethod.findInvokes(targetClass: String, targetName: String): List<Int> {
    val impl = implementation ?: return emptyList()
    return impl.instructions.mapIndexedNotNull { idx, insn ->
        if (!insn.opcode.name.startsWith("INVOKE", ignoreCase = true)) return@mapIndexedNotNull null
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (ref.definingClass == targetClass && ref.name == targetName) idx else null
    }
}

/** The single invoke site of [targetClass]->[targetName]; fail unless exactly one. */
fun MutableMethod.singleInvoke(targetClass: String, targetName: String): Int {
    val hits = findInvokes(targetClass, targetName)
    if (hits.size != 1) throw PatchException(
        "Pure: expected 1 $targetClass->$targetName call in ${this.name}, found ${hits.size}",
    )
    return hits[0]
}

/**
 * Remove one void invoke (e.g. LicenseClientV3.onActivityCreate): assert the
 * instruction at [index] is the expected invoke and delete exactly it.
 */
fun MutableMethod.removeInvokeAt(index: Int, targetClass: String, targetName: String) {
    val impl = implementation ?: throw PatchException("Pure: no implementation for ${this.name}")
    val insn = impl.instructions.toList().getOrNull(index)
        ?: throw PatchException("Pure: no instruction at $index in ${this.name}")
    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
    if (ref?.definingClass != targetClass || ref.name != targetName) {
        throw PatchException("Pure: instruction at $index in ${this.name} is not $targetClass->$targetName")
    }
    removeInstructions(index, 1)
}

/**
 * Force the move-result register of the invoke at [invokeIdx] to a constant:
 * insert `const <sameReg>, <value>` immediately after the move-result, which
 * must directly follow the invoke (Dalvik construction). Semantically
 * identical to Tanryu's in-place move-result replacement.
 *
 * Register-width safety: const/4 only encodes v0..v15. [constKind] carries
 * Tanryu's textual kind ("4"/"16"/""), but when the target register exceeds
 * the const/4 range we widen to `const` automatically (same value, always
 * assemblable — verified: the v20 Cg/NpA site fails with const/4).
 */
fun MutableMethod.forceResultConst(invokeIdx: Int, constKind: String, constValue: String) {
    val impl = implementation ?: throw PatchException("Pure: no implementation for ${this.name}")
    val insns = impl.instructions.toList()
    val move = insns.getOrNull(invokeIdx + 1)
    if (move == null || move.opcode !in setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE)) {
        throw PatchException("Pure: no move-result after invoke at $invokeIdx in ${this.name}")
    }
    val reg = (move as OneRegisterInstruction).registerA
    val kind = if (constKind == "const/4" && reg > 15) "const" else constKind
    addInstructions(invokeIdx + 2, "$kind v$reg, $constValue")
}

/** Move-result register index of the invoke at [invokeIdx] (validated). */
fun MutableMethod.resultRegister(invokeIdx: Int): Int {
    val impl = implementation ?: throw PatchException("Pure: no implementation for ${this.name}")
    val move = impl.instructions.toList().getOrNull(invokeIdx + 1)
    if (move == null || move.opcode !in setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE)) {
        throw PatchException("Pure: no move-result after invoke at $invokeIdx in ${this.name}")
    }
    return (move as OneRegisterInstruction).registerA
}

/** Narrow literal value of a const instruction (for anchor verification). */
fun MutableMethod.narrowLiteralAt(index: Int): Long? {
    val impl = implementation ?: return null
    val insn = impl.instructions.toList().getOrNull(index) ?: return null
    return (insn as? NarrowLiteralInstruction)?.narrowLiteral?.toLong()
}

/** String literal of a const-string at [index], or null. */
fun MutableMethod.stringAt(index: Int): String? {
    val impl = implementation ?: return null
    val insn = impl.instructions.toList().getOrNull(index) ?: return null
    return ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
}

// ---------------------------------------------------------------------------
// <clinit> string-holder restoration (PairIP-era R8 string consolidation)
// ---------------------------------------------------------------------------

/**
 * Create a `<clinit>` that assigns [pairs] (field name -> string value) on
 * [type], which must NOT already have one (stock 5.0.270 never does for
 * these 32 holder classes — PairIP's StartupLauncher.restoreString did it
 * at runtime instead). Smali-escapes values.
 */
fun BytecodePatchContext.bakeStringClinit(type: String, pairs: List<Pair<String, String>>) {
    val holder = requireClass(type)
    if (holder.methods.any { it.name == "<clinit>" }) {
        throw PatchException("Pure: $type already has <clinit> (wrong base?)")
    }
    val sb = StringBuilder()
    for ((field, value) in pairs) {
        // Full smali string escaping: const-string must be single-line.
        val esc = value
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")
            .replace("\n", "\\n")
            .replace("\r", "\\r")
            .replace("\t", "\\t")
        sb.append("const-string v0, \"$esc\"\n")
        sb.append("sput-object v0, $type->$field:Ljava/lang/String;\n")
    }
    sb.append("return-void")
    val clinit = ImmutableMethod(
        type,
        "<clinit>",
        emptyList(),
        "V",
        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
        null, null,
        ImmutableMethodImplementation(1, emptyList(), null, null),
    ).toMutable()
    holder.methods.add(clinit)
    clinit.addInstructions(0, sb.toString())
}

/** Read a bundled text resource (resources/pure-bundle/...) as a string. */
fun bundledText(path: String): String =
    object {}.javaClass.classLoader.getResourceAsStream(path)?.bufferedReader()?.readText()
        ?: throw PatchException("Pure: bundled resource missing: $path")

/**
 * Replace a method body with a bundled body file (INSTRUCTIONS ONLY, no
 * .method/.locals/.registers directives; first line may be `#locals N` to
 * declare the register count — required, asserted >= stock count... in
 * practice bodies mirror Tanryu's .locals which are >= stock).
 */
fun BytecodePatchContext.replaceBodyFromBundle(
    type: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    bundlePath: String,
) {
    val raw = bundledText(bundlePath)
    val lines = raw.lineSequence().toList()
    val localsLine = lines.firstOrNull()?.trim() ?: ""
    if (!localsLine.startsWith("#locals ")) {
        throw PatchException("Pure: body $bundlePath missing '#locals N' header")
    }
    val locals = localsLine.removePrefix("#locals ").trim().toIntOrNull()
        ?: throw PatchException("Pure: bad #locals header in $bundlePath")
    val body = lines.drop(1).joinToString("\n")
    if ("`.method" in body || ".locals" in body || ".registers" in body) {
        throw PatchException("Pure: body $bundlePath must be instructions-only")
    }
    val m = requireMethod(type, name, parameters, returnType)
    m.ensureRegisters(m.registersFor(locals))
    m.clearBody()
    m.addInstructions(0, body)
}

// ---------------------------------------------------------------------------
// Fingerprint single-match (mirrors the helper other Morphe sources define)
// ---------------------------------------------------------------------------

/** Exactly one match; throws PatchException on zero or multiple matches. */
context(_: BytecodePatchContext) fun Fingerprint.matchSingle() = matchAll(1..1).first()
