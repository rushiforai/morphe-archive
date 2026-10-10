package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

private fun Instruction.call() = getReference<MethodReference>()
private fun Instruction.field() = getReference<FieldReference>()
private fun Instruction.regs(): List<Int> = invokeRegisters() ?: when (this) {
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}
// Opcode.name is dexlib's lowercase smali mnemonic, not Java Enum.name().
private fun List<Instruction>.shape(expected: String) = map { it.opcode.toString() } == expected.trim().split(Regex("\\s+"))
private fun List<Instruction>.target(index: Int): Int {
    val offset = take(index).sumOf { it.codeUnits } + (this[index] as OffsetInstruction).codeOffset
    var position = 0
    forEachIndexed { i, instruction -> if (position == offset) return i; position += instruction.codeUnits }
    throw PatchException("Invalid TTS branch target: index=$index; code offset=$offset; instructions=${size}")
}

/** Failure-only context; successful matches retain the same layout and value-flow guards. */
private class TtsLayout(
    private val method: Method,
    private val code: List<Instruction>,
    private val inspected: IntRange = code.indices,
) {
    fun target(index: Int): Int = try {
        code.target(index)
    } catch (error: PatchException) {
        fail(error.message ?: "Invalid TTS branch target")
    }

    fun require(value: Boolean, reason: String, related: TtsLayout? = null) {
        if (value) return
        fail(reason, related)
    }

    private fun fail(reason: String, related: TtsLayout? = null): Nothing = throw PatchException(
        "Unrecognized navigation TTS layout: $reason; ${details()}" +
            (related?.let { "; related: ${it.details()}" } ?: ""),
    )

    private fun details(): String {
        val implementation = method.implementation!!
        val details = inspected.filter { it in code.indices }.joinToString("; ") { index ->
            val instruction = code[index]
            buildString {
                append("$index:${instruction.opcode} regs=${instruction.regs()}")
                instruction.getReference<com.android.tools.smali.dexlib2.iface.reference.Reference>()
                    ?.let { append(" ref=$it") }
                (instruction as? NarrowLiteralInstruction)?.let { append(" literal=${it.narrowLiteral}") }
                (instruction as? OffsetInstruction)?.let { append(" branchOffset=${it.codeOffset}") }
            }
        }
        return "method=$method; registerCount=${implementation.registerCount}; " +
            "tryBlocks=${implementation.tryBlocks.size}; instructions=${code.size}; inspected=$inspected; $details"
    }
}
private fun MethodReference.same(other: MethodReference?) = other != null &&
    definingClass == other.definingClass && name == other.name && returnType == other.returnType && parameterTypes == other.parameterTypes

/** Keep Maps' synthesis and fallback implementations; change only their selection. */
internal fun BytecodePatchContext.patchNavigationTts() {
    val factory = uniqueMapsHook(Fingerprint(
        returnType = "V", parameters = emptyList(), strings = listOf("tts-temp"),
        custom = { method, _ -> AccessFlags.PRIVATE.isSet(method.accessFlags) &&
            method.implementation?.instructions?.any {
                it.call()?.toString() == "Landroid/app/Application;->getDir(Ljava/lang/String;I)Ljava/io/File;"
            } == true },
    ), "navigation TTS provider factory")!!
    val owner = mutableClassDefBy(factory.definingClass)
    val h = factory.implementation!!.instructions.toList()
    val gate = h.indices.singleOrNull {
        h[it].call()?.toString() == "Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V"
    }?.plus(1) ?: throw PatchException("Missing unique TTS cache initialization")
    val create = gate + 22
    val factoryLayout = TtsLayout(factory, h, gate - 1..create + 17)
    factoryLayout.require(h.size > create + 18 && h.subList(gate, create).shape("""
        INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET INVOKE_STATIC MOVE_RESULT CONST_4 IF_NEZ MOVE
        ADD_INT_LIT8 IF_EQZ IF_EQ INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET_OBJECT IF_EQZ
        IGET_BOOLEAN IF_EQZ IGET_BOOLEAN IF_EQZ GOTO IGET_BOOLEAN IF_NEZ
    """), "provider selection block")
    val dynamicFactory = h[create].call() ?: throw PatchException("Missing dynamic provider factory")
    factoryLayout.require(h.subList(create, create + 18).shape("""
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO
        IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO INVOKE_VIRTUAL MOVE_RESULT_OBJECT
        MOVE_OBJECT MOVE_OBJECT MOVE_OBJECT NEW_INSTANCE INVOKE_DIRECT IPUT_OBJECT
    """), "provider creation/merge")
    factoryLayout.require(dynamicFactory.parameterTypes.size == 2 && dynamicFactory.returnType.startsWith("L") &&
        dynamicFactory.same(h[create + 10].call()) && h[create].regs() == listOf(0, 2, 5) &&
        h[create + 1].regs() == listOf(2) && h[create + 10].regs() == listOf(0, 1, 5) &&
        h[create + 3].regs() == listOf(0, 1, 5, 3, 4) && h[create + 4].regs() == listOf(0) &&
        h[create + 2].regs() == listOf(4, 0) && h[create + 16].regs() == listOf(1, 2, 0),
        "provider operands")
    // The skipped block must not initialize any input needed by the both-provider path.
    factoryLayout.require(h.subList(gate, create).filter { it.opcode.setsRegister() }.all {
        (it as? OneRegisterInstruction)?.registerA in listOf(4, 6)
    } && h.take(gate).any { it.opcode == Opcode.CONST_4 && it.regs() == listOf(2) &&
        (it as NarrowLiteralInstruction).narrowLiteral == 0 }, "provider live registers")
    factoryLayout.require(factoryLayout.target(gate + 9) == create + 10 && factoryLayout.target(gate + 10) == create + 6 &&
        factoryLayout.target(gate + 19) == create + 2 && factoryLayout.target(gate + 21) == create + 2 &&
        factoryLayout.target(create + 5) == create + 15 && factoryLayout.target(create + 9) == create + 15,
        "provider branch relationships")
    val pairConstructor = h[create + 16].call()!!
    factoryLayout.require(pairConstructor.name == "<init>" && pairConstructor.parameterTypes.size == 2 &&
        pairConstructor.parameterTypes[0] == pairConstructor.parameterTypes[1], "provider pair")
    val providerType = pairConstructor.parameterTypes[0].toString()
    factoryLayout.require(classDefBy(dynamicFactory.returnType).interfaces.contains(providerType), "dynamic provider interface")
    val cacheField = h[create + 17].field()!!
    factoryLayout.require(cacheField.definingClass == owner.type && cacheField.type == pairConstructor.definingClass,
        "cached provider pair")

    val resolver = owner.methods.singleOrNull { method ->
        method.parameterTypes.size == 1 && method.returnType.startsWith("L") &&
            method.implementation?.instructions?.count { it.call()?.toString() == "Ljava/io/File;->canRead()Z" } == 1
    } ?: throw PatchException("Missing unique navigation audio resolver")
    val g = resolver.implementation!!.instructions.toList()
    val resolverLayout = TtsLayout(resolver, g)
    resolverLayout.require(!AccessFlags.STATIC.isSet(resolver.accessFlags) && resolver.implementation!!.registerCount == 8 &&
        resolver.implementation!!.tryBlocks.isEmpty() && g.shape("""
        INVOKE_DIRECT MOVE_RESULT CONST_4 CONST_4 IF_EQZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT CHECK_CAST IGET_OBJECT IGET_OBJECT IGET_OBJECT INVOKE_STATIC
        MOVE_RESULT_OBJECT IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ CONST_4 GOTO MOVE_OBJECT
        IF_NEZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT INVOKE_INTERFACE
        MOVE_RESULT_OBJECT IF_NEZ GOTO INVOKE_VIRTUAL MOVE_RESULT IF_EQZ INVOKE_VIRTUAL MOVE_RESULT IF_EQZ
        IGET_OBJECT IGET_OBJECT NEW_INSTANCE INVOKE_DIRECT RETURN_OBJECT
    """), "audio resolver")
    val dynamicGetter = g[27].call()!!
    val lookup = g[29].call()!!
    val firstField = g[39].field()!!
    val secondField = g[40].field()!!
    val alertConstructor = g[42].call()!!
    resolverLayout.require(dynamicGetter.definingClass == owner.type && dynamicGetter.parameterTypes.isEmpty() &&
        dynamicGetter.returnType == providerType && dynamicGetter.same(g[24].call()) &&
        lookup.definingClass == providerType && lookup.returnType == "Ljava/io/File;" &&
        lookup.parameterTypes == resolver.parameterTypes &&
        alertConstructor.definingClass == resolver.returnType && alertConstructor.name == "<init>" &&
        alertConstructor.parameterTypes.map { it.toString() } == listOf("Ljava/io/File;", firstField.type, secondField.type, "Z") &&
        firstField.definingClass == owner.type && secondField.definingClass == owner.type &&
        g[27].regs() == listOf(6) && g[28].regs() == listOf(0) && g[29].regs() == listOf(0, 7) &&
        g[30].regs() == listOf(0) && g[39].regs() == listOf(7, 6) && g[40].regs() == listOf(6, 6) &&
        g[42].regs() == listOf(1, 0, 7, 6, 2) &&
        g[3].regs() == listOf(2) && (g[3] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        g[20].regs() == listOf(2) && (g[20] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        resolverLayout.target(23) == 31 && resolverLayout.target(26) == 31 && resolverLayout.target(35) == 43 && resolverLayout.target(38) == 43,
        "resolver value flow / canned=true, dynamic=false")
    val getter = owner.methods.single { dynamicGetter.same(it) }
    val getterCode = getter.implementation!!.instructions.toList()
    TtsLayout(getter, getterCode).require(getterCode.shape("INVOKE_DIRECT IGET_OBJECT IGET_OBJECT RETURN_OBJECT") &&
        factory.same(getterCode[0].call()) && getterCode[1].field() == cacheField,
        "dynamic getter initializes this factory")
    val pairMethod = classDefBy(pairConstructor.definingClass).methods.single { pairConstructor.same(it) }
    val pairBody = pairMethod.implementation!!.instructions.toList()
    TtsLayout(pairMethod, pairBody).require(pairBody.any { it.opcode == Opcode.IPUT_OBJECT && it.field() == getterCode[2].field() &&
        it.regs() == listOf(1, 0) }, "first pair component is dynamic")

    val ready = owner.methods.singleOrNull { method ->
        method.returnType == "Z" && method.parameterTypes.size == 1 && method.implementation?.instructions?.any {
            it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == resolver.returnType
        } == true
    } ?: throw PatchException("Missing unique navigation audio readiness check")
    val f = ready.implementation!!.instructions.toList()
    val readyLayout = TtsLayout(ready, f)
    readyLayout.require(ready.implementation!!.registerCount == 5 && ready.implementation!!.tryBlocks.isEmpty() && f.shape("""
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT CONST_4 IF_EQZ INVOKE_DIRECT MOVE_RESULT CONST_4 IF_EQZ
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ SGET_OBJECT CHECK_CAST IGET_OBJECT IF_EQ RETURN RETURN RETURN
    """), "audio readiness")
    val resolveRequest = owner.methods.single { f[0].call()!!.same(it) }
    val requestBody = resolveRequest.implementation!!.instructions.toList()
    TtsLayout(resolveRequest, requestBody).require(requestBody.shape("IGET_OBJECT INVOKE_DIRECT MOVE_RESULT_OBJECT RETURN_OBJECT") &&
        resolver.same(requestBody[1].call()) && f[1].regs() == listOf(4) && f[3].regs() == listOf(4) &&
        readyLayout.target(3) == 17 && f[2].regs() == listOf(0) && (f[2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        f[6].regs() == listOf(2) && (f[6] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        f[13].field()?.definingClass == resolver.returnType && f[13].regs() == listOf(4, 4) &&
        f[14].regs() == listOf(4, 3) && readyLayout.target(14) == 16 &&
        f[15].regs() == listOf(0) && f[16].regs() == listOf(2) && f[17].regs() == listOf(0),
        "readiness result flow", readyLayout)

    // All discovery/guards finish before mutation. Preserve synchronization, callbacks and cleanup.
    factory.addInstruction(gate, BuilderInstruction30t(Opcode.GOTO_32,
        factory.implementation!!.newLabelForIndex(create)))
    resolver.addInstructionsWithLabels(0, """
        invoke-virtual {p0}, $dynamicGetter
        move-result-object v0
        if-eqz v0, :original
        invoke-interface {v0, p1}, $lookup
        move-result-object v1
        if-eqz v1, :original
        invoke-virtual {v1}, Ljava/io/File;->exists()Z
        move-result v2
        if-eqz v2, :original
        invoke-virtual {v1}, Ljava/io/File;->canRead()Z
        move-result v2
        if-eqz v2, :original
        iget-object v3, p0, $firstField
        iget-object v4, p0, $secondField
        const/4 v5, 0x0
        new-instance v2, ${resolver.returnType}
        invoke-direct {v2, v1, v3, v4, v5}, $alertConstructor
        return-object v2
        :original
        nop
    """.trimIndent())
    // Both readable cached sources are ready. Keep their true source tag for playback/metrics.
    ready.replaceInstruction(14, BuilderInstruction30t(Opcode.GOTO_32,
        ready.implementation!!.newLabelForIndex(16)))
    Logger.getLogger("app.morphe.patches.maps.NavigationTtsPatch").info(
        "Navigation TTS: factory=$factory; dynamic=$dynamicFactory; resolver=$resolver; ready=$ready; " +
            "prefer readable synthesized audio; preserve canned fallback and voice selection",
    )
}
