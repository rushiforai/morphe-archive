package app.patches.tg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.smali.LexerErrorInterface
import com.android.tools.smali.smali.smaliFlexLexer
import com.android.tools.smali.smali.smaliParser
import com.android.tools.smali.smali.smaliTreeWalker
import org.antlr.runtime.CommonTokenStream
import org.antlr.runtime.TokenSource
import org.antlr.runtime.tree.CommonTreeNodeStream
import java.io.InputStreamReader

/**
 * Shared helpers for the Telegram patch set.
 *
 * Rules:
 *  - Targets are resolved by class descriptor + method signature (never file offsets).
 *  - A missing target throws [PatchException]; a patch can never silently no-op.
 *  - Edits are idempotent (a second run finds nothing left to change).
 *  - Scans read the immutable dex view; a class is only made mutable when it actually needs an
 *    edit. This matters because touching [BytecodePatchContext.mutableClassDefByOrNull] marks the
 *    class as modified and forces it to be rewritten into the output DEX.
 */
/**
 * Telegram packages this patch set targets.
 *
 * Two things matter here:
 *
 *  1. Declaring concrete (non-universal) targets keeps the patches `default = true` — Morphe
 *     forcibly downgrades universal patches (compatibility == null, or a target with a null
 *     package name) to `default = false` at build time (PatchBuilder.resolveDefaultValue).
 *
 *  2. Declaring a concrete *version* is what makes Morphe Manager treat this source as compatible
 *     with the user's APK. With only an "any version" target the source reports `Any` and the
 *     Manager falls back to expert mode with its own built-in universal patches instead of these.
 *
 * The verified build is Telegram **12.10.1 (versionCode 70389)**. Other versions are listed as an
 * *experimental* target (null version), so they stay reachable without pretending to be verified —
 * every patch is fingerprint-based and fails loudly instead of silently mis-patching.
 */
const val TELEGRAM_VERIFIED_VERSION = "12.10.1"

private fun telegramTargets(): List<AppTarget> = listOf(
    AppTarget(
        version = TELEGRAM_VERIFIED_VERSION,
        description = "Verified build — all patches checked against this version.",
    ),
    AppTarget(
        version = null,
        isExperimental = true,
        description = "Unverified version. Patches are fingerprint based: unsupported targets fail " +
            "loudly instead of patching the wrong code.",
    ),
)

val TG_COMPATIBILITY: Array<Compatibility> = arrayOf(
    Compatibility(
        packageName = "org.telegram.messenger.web",
        name = "Telegram",
        targets = telegramTargets(),
    ),
    Compatibility(
        packageName = "org.telegram.messenger",
        name = "Telegram",
        targets = telegramTargets(),
    ),
    Compatibility(
        packageName = "org.telegram.messenger.beta",
        name = "Telegram Beta",
        targets = telegramTargets(),
    ),
)

object TgSupport {

    /** "org/telegram/messenger/UserConfig" -> "Lorg/telegram/messenger/UserConfig;". */
    fun desc(internalName: String): String = "L$internalName;"

    /** Registers occupied by a method's parameters (including `this` for instance methods). */
    fun parameterRegisterCount(method: Method): Int {
        var count = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
        for (type in method.parameterTypes) {
            val t = type.toString()
            count += if (t == "J" || t == "D") 2 else 1
        }
        return count
    }

    fun MutableClass.methodOrNull(name: String, parameters: List<String> = emptyList()): MutableMethod? =
        methods.firstOrNull { method ->
            method.name == name && method.parameterTypes.map { it.toString() } == parameters
        }

    fun BytecodePatchContext.mutableClassOrThrow(classType: String): MutableClass =
        mutableClassDefByOrNull(classType)
            ?: throw PatchException("Target class not found: $classType")

    /** Find a method by name (+ parameters) anywhere in the app. Throws when nothing matches. */
    fun BytecodePatchContext.methodAnywhereOrThrow(
        name: String,
        parameters: List<String> = emptyList(),
        classFilter: (String) -> Boolean = { true },
    ): MutableMethod = methodsAnywhere(name, parameters, classFilter).firstOrNull()
        ?: throw PatchException("No method matching $name(${parameters.joinToString()}) was found")

    /** All methods matching [name]/[parameters] anywhere (used when several overloads must be patched). */
    fun BytecodePatchContext.methodsAnywhere(
        name: String,
        parameters: List<String> = emptyList(),
        classFilter: (String) -> Boolean = { true },
    ): List<MutableMethod> {
        // Collect the defining types first (immutable scan), then materialise only those classes.
        val types = ArrayList<String>(4)
        classDefForEach { classDef ->
            if (!classFilter(classDef.type)) return@classDefForEach
            if (classDef.methods.any { it.name == name && it.parameterTypes.map { p -> p.toString() } == parameters }) {
                types += classDef.type
            }
        }
        return types.mapNotNull { type ->
            mutableClassDefByOrNull(type)?.methodOrNull(name, parameters)
        }
    }

    /** Snapshot of every class descriptor (immutable scan; does not force rewrites). */
    fun BytecodePatchContext.allClassTypes(): List<String> {
        val types = ArrayList<String>(4096)
        classDefForEach { types += it.type }
        return types
    }

    /**
     * Replace the whole body of [method] with [body]. [locals] is the `.locals` count from the
     * reference smali; parameter registers are appended automatically.
     */
    fun replaceBody(clazz: MutableClass, method: MutableMethod, locals: Int, body: String) {
        val registers = locals + parameterRegisterCount(method)
        val implementation = MutableMethodImplementation(registers)
        val replacement = ImmutableMethod(
            method.definingClass,
            method.name,
            method.parameters as Iterable<MethodParameter>,
            method.returnType,
            method.accessFlags,
            method.annotations,
            method.hiddenApiRestrictions,
            implementation,
        ).toMutable()

        clazz.methods.remove(method)
        clazz.methods.add(replacement)
        replacement.addInstructions(0, body)
    }

    /** Resolve a method, then replace its body. */
    fun BytecodePatchContext.replaceMethodBody(
        classType: String,
        name: String,
        parameters: List<String> = emptyList(),
        locals: Int,
        body: String,
    ) {
        val clazz = mutableClassOrThrow(classType)
        val method = clazz.methodOrNull(name, parameters)
            ?: throw PatchException("Target method not found: $classType->$name(${parameters.joinToString()})")
        replaceBody(clazz, method, locals, body)
    }

    /** An immutable-scan hit for a field read. */
    private data class FieldReadHit(
        val classType: String,
        val methodName: String,
        val parameterTypes: List<String>,
        val index: Int,
        val destination: Int,
    )

    private fun BytecodePatchContext.fieldReadHits(
        opcodes: Set<Opcode>,
        fieldName: String,
        fieldType: String?,
        classFilter: (String) -> Boolean,
        fieldClassFilter: (String) -> Boolean,
    ): List<FieldReadHit> {
        val hits = ArrayList<FieldReadHit>()
        classDefForEach { classDef ->
            if (!classFilter(classDef.type)) return@classDefForEach
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                impl.instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in opcodes) return@forEachIndexed
                    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                        ?: return@forEachIndexed
                    if (ref.name != fieldName) return@forEachIndexed
                    if (fieldType != null && ref.type != fieldType) return@forEachIndexed
                    if (!fieldClassFilter(ref.definingClass)) return@forEachIndexed
                    val dest = (instruction as? OneRegisterInstruction)?.registerA ?: return@forEachIndexed
                    hits += FieldReadHit(
                        classDef.type,
                        method.name,
                        method.parameterTypes.map { it.toString() },
                        index,
                        dest,
                    )
                }
            }
        }
        return hits
    }

    /**
     * Force the value observed by every read of a boolean field: inserts [constRead] (built from
     * the destination register) directly after each read. Throws if fewer than [minimum] reads exist.
     */
    fun BytecodePatchContext.forceFieldReads(
        opcodes: Set<Opcode>,
        fieldName: String,
        constRead: (dest: Int) -> String,
        fieldType: String = "Z",
        classFilter: (String) -> Boolean = { true },
        fieldClassFilter: (String) -> Boolean = { true },
        minimum: Int = 1,
    ): Int {
        val hits = fieldReadHits(opcodes, fieldName, fieldType, classFilter, fieldClassFilter)
        if (hits.size < minimum) {
            throw PatchException("Expected >= $minimum read(s) of field $fieldName but found ${hits.size}")
        }
        hits.groupBy { Triple(it.classType, it.methodName, it.parameterTypes) }
            .forEach { (key, group) ->
                val (classType, methodName, parameterTypes) = key
                val method = mutableClassDefByOrNull(classType)?.methodOrNull(methodName, parameterTypes)
                    ?: return@forEach
                group.sortedByDescending { it.index }.forEach { hit ->
                    method.addInstructions(hit.index + 1, constRead(hit.destination))
                }
            }
        return hits.size
    }

    /** Literal of any const-like instruction (const/4, const/16, const, const/high16, or-int/lit16, ...). */
    fun constLiteral(instruction: Instruction): Long? =
        (instruction as? WideLiteralInstruction)?.wideLiteral

    /** Recompile a single instruction against [method] and store it at [index]. */
    fun MutableMethod.replaceWithSmali(index: Int, smali: String) = replaceInstruction(index, smali)

    fun hex(value: Long): String =
        if (value < 0) "-0x${(-value).toString(16)}" else "0x${value.toString(16)}"

    /** smali text for a const-like instruction with [value]. */
    fun constSmali(opcode: Opcode, register: Int, value: Long): String = when (opcode) {
        Opcode.CONST_4 -> "const/4 v$register, ${hex(value)}"
        Opcode.CONST_16 -> "const/16 v$register, ${hex(value)}"
        Opcode.CONST -> "const v$register, ${hex(value)}"
        Opcode.CONST_HIGH16 -> "const/high16 v$register, ${hex(value)}"
        else -> throw PatchException("Unsupported const opcode: $opcode")
    }

    /** Replace every `const` of [opcode] whose literal equals [from] with literal [to]. Returns edit count. */
    fun replaceConst(method: MutableMethod, opcode: Opcode, from: Long, to: Long): Int {
        val impl = method.implementation ?: return 0
        var edits = 0
        impl.instructions.forEachIndexed { index, instruction ->
            if (instruction.opcode != opcode || constLiteral(instruction) != from) return@forEachIndexed
            val register = (instruction as OneRegisterInstruction).registerA
            method.replaceWithSmali(index, constSmali(opcode, register, to))
            edits++
        }
        return edits
    }

    /**
     * Rewrite `or-int/lit16 vA, vB, [from]` into `or-int/lit16 vA, vA, [to]`, matching the
     * reference patcher's regex substitution.
     */
    fun replaceOrIntLit16(method: MutableMethod, from: Long, to: Long): Int {
        val impl = method.implementation ?: return 0
        var edits = 0
        impl.instructions.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.OR_INT_LIT16 || constLiteral(instruction) != from) return@forEachIndexed
            val register = (instruction as TwoRegisterInstruction).registerA
            method.replaceWithSmali(index, "or-int/lit16 v$register, v$register, ${hex(to)}")
            edits++
        }
        return edits
    }

    /** Does [classDef] reference any `Landroid/view/Window;->*Flags` member? */
    fun referencesWindowFlags(classDef: ClassDef): Boolean = classDef.methods.any { method ->
        method.implementation?.instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            val pair = when (reference) {
                is MethodReference -> reference.definingClass to reference.name
                is FieldReference -> reference.definingClass to reference.name
                else -> null
            }
            pair != null && pair.first == "Landroid/view/Window;" && pair.second.endsWith("Flags")
        } == true
    }

    /** Assemble one or more smali class files into a single in-memory DEX. */
    fun assembleDex(smaliClasses: Collection<String>, opcodes: Opcodes = Opcodes.getDefault()): ByteArray {
        val dexBuilder = DexBuilder(opcodes)
        for (text in smaliClasses) {
            val reader = InputStreamReader(text.byteInputStream(Charsets.UTF_8), Charsets.UTF_8)
            val lexer = smaliFlexLexer(reader, 15) as LexerErrorInterface
            val tokens = CommonTokenStream(lexer as TokenSource)
            val parser = smaliParser(tokens)
            val result = parser.smali_file()
            if (parser.numberOfSyntaxErrors > 0 || lexer.numberOfSyntaxErrors > 0) {
                throw PatchException(
                    "smali assembly failed: ${parser.numberOfSyntaxErrors} parser " +
                        "and ${lexer.numberOfSyntaxErrors} lexer syntax errors",
                )
            }
            val treeStream = CommonTreeNodeStream(result.tree)
            treeStream.tokenStream = tokens
            smaliTreeWalker(treeStream).apply { setDexBuilder(dexBuilder) }.smali_file()
        }
        val store = MemoryDataStore()
        dexBuilder.writeTo(store)
        return store.data
    }
}
