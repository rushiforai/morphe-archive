package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
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
    // Find the two-provider cache by its constructor/store, then derive both
    // creation branches. R8 may invert a flag branch and move the dynamic result.
    val pairAt = h.indices.singleOrNull { index -> index > gate && h[index].call()?.let {
        it.name == "<init>" && it.parameterTypes.size == 2 &&
            it.parameterTypes[0] == it.parameterTypes[1] &&
            h.getOrNull(index + 1)?.opcode == Opcode.IPUT_OBJECT &&
            h[index + 1].field()?.definingClass == owner.type &&
            h[index + 1].field()?.type == it.definingClass
    } == true } ?: throw PatchException("Missing unique TTS provider pair/store")
    val pairConstructor = h[pairAt].call()!!
    val providerType = pairConstructor.parameterTypes[0].toString()
    val creations = (gate until pairAt).filter { h[it].opcode == Opcode.INVOKE_VIRTUAL &&
        h[it].call()?.let { call -> call.parameterTypes.size == 2 &&
            classDefByOrNull(call.returnType)?.interfaces?.contains(providerType) == true } == true }
    if (creations.size != 2) throw PatchException("Missing unique TTS dynamic creation branches")
    val create = creations.first()
    val compact = create - gate == 21
    val factoryLayout = TtsLayout(factory, h, gate - 1..pairAt + 1)
    factoryLayout.require(h.subList(gate, create).let { selection ->
        if (compact) selection.shape("""
            INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET INVOKE_STATIC MOVE_RESULT CONST_4 IF_NEZ MOVE
            ADD_INT_LIT8 IF_EQZ IF_EQ INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET_OBJECT IF_EQZ
            IGET_BOOLEAN IF_EQZ IGET_BOOLEAN IF_NEZ IGET_BOOLEAN IF_NEZ
        """) else selection.shape("""
        INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET INVOKE_STATIC MOVE_RESULT CONST_4 IF_NEZ MOVE
        ADD_INT_LIT8 IF_EQZ IF_EQ INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET_OBJECT IF_EQZ
        IGET_BOOLEAN IF_EQZ IGET_BOOLEAN IF_EQZ GOTO IGET_BOOLEAN IF_NEZ
        """)
    }, "provider selection block")
    val dynamicFactory = h[create].call() ?: throw PatchException("Missing dynamic provider factory")
    factoryLayout.require(h.subList(create, pairAt + 2).let { creation ->
        if (compact) creation.shape("""
            INVOKE_VIRTUAL MOVE_RESULT_OBJECT MOVE_OBJECT IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO
            IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO INVOKE_VIRTUAL MOVE_RESULT_OBJECT
            MOVE_OBJECT MOVE_OBJECT MOVE_OBJECT NEW_INSTANCE INVOKE_DIRECT IPUT_OBJECT
        """) else creation.shape("""
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO
        IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO INVOKE_VIRTUAL MOVE_RESULT_OBJECT
        MOVE_OBJECT MOVE_OBJECT MOVE_OBJECT NEW_INSTANCE INVOKE_DIRECT IPUT_OBJECT
        """)
    }, "provider creation/merge")
    val fieldAt = create + if (compact) 3 else 2
    val cannedAt = fieldAt + 1
    val cannedOnly = cannedAt + 4
    val dynamicOnly = cannedOnly + 3
    val merge = pairAt - 1
    val dynamicRegs = h[create].regs()
    val cannedRegs = h[cannedAt].regs()
    val dynamicResult = if (compact) h[create + 2].regs().first() else h[create + 1].regs().single()
    factoryLayout.require(dynamicFactory.parameterTypes.size == 2 && dynamicFactory.returnType.startsWith("L") &&
        dynamicFactory.same(h[dynamicOnly].call()) && dynamicRegs.size == 3 && cannedRegs.size == 5 &&
        dynamicRegs[0] == cannedRegs[0] && dynamicRegs[2] == cannedRegs[2] &&
        h[dynamicOnly].regs() == listOf(dynamicRegs[0], cannedRegs[1], dynamicRegs[2]) &&
        h[fieldAt].regs() == listOf(cannedRegs[4], dynamicRegs[0]) &&
        h[cannedOnly - 1].field() == h[fieldAt].field() && h[cannedOnly].call()?.same(h[cannedAt].call()) == true &&
        h[cannedOnly].regs() == cannedRegs && h[cannedAt + 1].regs() == listOf(dynamicRegs[0]) &&
        h[cannedOnly + 1].regs() == listOf(dynamicRegs[0]) &&
        h[pairAt].regs() == listOf(h[merge].regs().single(), dynamicResult, dynamicRegs[0]) &&
        (!compact || h[create + 2].regs() == listOf(dynamicResult, h[create + 1].regs().single())) &&
        (compact || h[create + 1].regs() == listOf(dynamicResult)) &&
        h[dynamicOnly + 1].regs() == listOf(dynamicRegs[0]) &&
        h[dynamicOnly + 2].regs().getOrNull(1) == dynamicResult &&
        h[dynamicOnly + 3].regs() == listOf(dynamicResult, dynamicRegs[0]) &&
        h[dynamicOnly + 4].regs() == listOf(dynamicRegs[0], h[dynamicOnly + 2].regs().first()),
        "provider operands")
    // The skipped block must not initialize any input needed by the both-provider path.
    val live = dynamicRegs + cannedRegs.take(4)
    factoryLayout.require(h.subList(gate, create).filter { it.opcode.setsRegister() }.all {
        (it as? OneRegisterInstruction)?.registerA !in live &&
            (!it.opcode.setsWideRegister() || (it as OneRegisterInstruction).registerA + 1 !in live)
    } && (0 until gate).lastOrNull { h[it].opcode.setsRegister() &&
        ((h[it] as? OneRegisterInstruction)?.registerA == dynamicRegs[1] ||
            h[it].opcode.setsWideRegister() && (h[it] as? OneRegisterInstruction)?.registerA == dynamicRegs[1] - 1)
    }?.let { h[it].opcode == Opcode.CONST_4 && (h[it] as NarrowLiteralInstruction).narrowLiteral == 0 } == true,
        "provider live registers")
    factoryLayout.require(factoryLayout.target(gate + 9) == dynamicOnly && factoryLayout.target(gate + 10) == cannedOnly - 1 &&
        factoryLayout.target(gate + if (compact) 18 else 19) == fieldAt &&
        factoryLayout.target(create - 1) == fieldAt && factoryLayout.target(cannedAt + 2) == merge &&
        factoryLayout.target(cannedOnly + 2) == merge &&
        factoryLayout.target(gate + 6) == gate + 8 &&
        factoryLayout.target(gate + 14) == gate + (if (compact) 19 else 20) &&
        factoryLayout.target(gate + 16) == gate + (if (compact) 19 else 20),
        "provider branch relationships")
    factoryLayout.require(pairConstructor.name == "<init>" && pairConstructor.parameterTypes.size == 2 &&
        pairConstructor.parameterTypes[0] == pairConstructor.parameterTypes[1], "provider pair")
    factoryLayout.require(classDefBy(dynamicFactory.returnType).interfaces.contains(providerType), "dynamic provider interface")
    val cacheField = h[pairAt + 1].field()!!
    factoryLayout.require(cacheField.definingClass == owner.type && cacheField.type == pairConstructor.definingClass &&
        h[merge].getReference<com.android.tools.smali.dexlib2.iface.reference.TypeReference>()?.type == pairConstructor.definingClass &&
        h[pairAt + 1].regs() == listOf(h[merge].regs().single(), factory.implementation!!.registerCount - 1) &&
        h[fieldAt].field()?.definingClass == dynamicFactory.definingClass &&
        h[cannedAt].call()?.let { call -> call.definingClass == dynamicFactory.definingClass &&
            call.parameterTypes.map { it.toString() } == dynamicFactory.parameterTypes.map { it.toString() } +
                listOf(h[gate].call()!!.definingClass, h[fieldAt].field()!!.type) &&
            classDefBy(call.returnType).interfaces.contains(providerType) } == true,
        "cached provider pair")

    val resolver = owner.methods.singleOrNull { method ->
        method.parameterTypes.size == 1 && method.returnType.startsWith("L") &&
            method.implementation?.instructions?.count { it.call()?.toString() == "Ljava/io/File;->canRead()Z" } == 1
    } ?: throw PatchException("Missing unique navigation audio resolver")
    val g = resolver.implementation!!.instructions.toList()
    val resolverLayout = TtsLayout(resolver, g)
    val loggedAudio = g.any { instruction -> instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
        instruction.call()?.let { it.name == "<init>" && it.definingClass == resolver.returnType &&
            it.parameterTypes.size == 5 && it.parameterTypes[0] == "Ljava/io/File;" && it.parameterTypes[3] == "Z" } == true }
    resolverLayout.require(!AccessFlags.STATIC.isSet(resolver.accessFlags) && resolver.implementation!!.tryBlocks.isEmpty() &&
        if (loggedAudio) resolver.implementation!!.registerCount == 11 && g.shape("""
            INVOKE_DIRECT MOVE_RESULT CONST_4 CONST_4 IF_EQZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ
            INVOKE_VIRTUAL MOVE_RESULT_OBJECT CHECK_CAST IGET_OBJECT IGET_OBJECT IGET_OBJECT INVOKE_STATIC
            MOVE_RESULT_OBJECT IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ CONST_4 MOVE GOTO
            MOVE MOVE_OBJECT IF_NEZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT
            INVOKE_INTERFACE MOVE_RESULT_OBJECT MOVE_OBJECT IF_NEZ RETURN_OBJECT INVOKE_VIRTUAL MOVE_RESULT
            IF_EQZ INVOKE_VIRTUAL MOVE_RESULT IF_EQZ IGET_OBJECT IGET_OBJECT IGET_OBJECT NEW_INSTANCE
            INVOKE_DIRECT_RANGE RETURN_OBJECT IGET_OBJECT NEW_INSTANCE SGET_OBJECT INVOKE_DIRECT CONST_STRING
            INVOKE_VIRTUAL RETURN_OBJECT
        """) else resolver.implementation!!.registerCount == 8 && g.shape("""
        INVOKE_DIRECT MOVE_RESULT CONST_4 CONST_4 IF_EQZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT CHECK_CAST IGET_OBJECT IGET_OBJECT IGET_OBJECT INVOKE_STATIC
        MOVE_RESULT_OBJECT IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ CONST_4 GOTO MOVE_OBJECT
        IF_NEZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ INVOKE_VIRTUAL MOVE_RESULT_OBJECT INVOKE_INTERFACE
        MOVE_RESULT_OBJECT IF_NEZ GOTO INVOKE_VIRTUAL MOVE_RESULT IF_EQZ INVOKE_VIRTUAL MOVE_RESULT IF_EQZ
        IGET_OBJECT IGET_OBJECT NEW_INSTANCE INVOKE_DIRECT RETURN_OBJECT
    """), "audio resolver")
    val dynamicAt = if (loggedAudio) 29 else 27
    val lookupAt = dynamicAt + 2
    val fieldsAt = if (loggedAudio) 42 else 39
    val constructorAt = if (loggedAudio) 46 else 42
    val dynamicGetter = g[dynamicAt].call()!!
    val lookup = g[lookupAt].call()!!
    val firstField = g[fieldsAt].field()!!
    val secondField = g[fieldsAt + 1].field()!!
    val eventField = if (loggedAudio) g[fieldsAt + 2].field()!! else null
    val alertConstructor = g[constructorAt].call()!!
    resolverLayout.require(dynamicGetter.definingClass == owner.type && dynamicGetter.parameterTypes.isEmpty() &&
        dynamicGetter.returnType == providerType && dynamicGetter.same(g[dynamicAt - 3].call()) &&
        lookup.definingClass == providerType && lookup.returnType == "Ljava/io/File;" &&
        lookup.parameterTypes == resolver.parameterTypes &&
        alertConstructor.definingClass == resolver.returnType && alertConstructor.name == "<init>" &&
        alertConstructor.parameterTypes.map { it.toString() } ==
            listOf("Ljava/io/File;", firstField.type, secondField.type, "Z") + listOfNotNull(eventField?.type) &&
        firstField.definingClass == owner.type && secondField.definingClass == owner.type &&
        if (loggedAudio) {
            val receiver = resolver.implementation!!.registerCount - 2
            eventField!!.definingClass == owner.type && g[dynamicAt].regs() == listOf(receiver) &&
                g[dynamicAt + 1].regs() == listOf(0) && g[lookupAt].regs() == listOf(0, receiver + 1) &&
                g[lookupAt + 1].regs() == listOf(0) && g[33].regs() == listOf(4, 0) &&
                g[fieldsAt].regs() == listOf(5, receiver) && g[fieldsAt + 1].regs() == listOf(6, receiver) &&
                g[fieldsAt + 2].regs() == listOf(8, receiver) && g[constructorAt].regs() == listOf(3, 4, 5, 6, 7, 8) &&
                g[2].regs() == listOf(1) && (g[2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                g[3].regs() == listOf(2) && (g[3] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                g[20].regs() == listOf(1) && (g[20] as NarrowLiteralInstruction).narrowLiteral == 1 &&
                g[21].regs() == listOf(7, 1) && g[23].regs() == listOf(7, 1) && g[24].regs() == listOf(0, 2) &&
                resolverLayout.target(4) == 23 && resolverLayout.target(7) == 23 && resolverLayout.target(19) == 21 &&
                resolverLayout.target(22) == 25 && resolverLayout.target(25) == 33 && resolverLayout.target(28) == 33 &&
                resolverLayout.target(34) == 36 && resolverLayout.target(38) == 48 && resolverLayout.target(41) == 48 &&
                g[47].regs() == listOf(3) && g[35].regs() == listOf(2) && g[54].regs() == listOf(2)
        } else g[27].regs() == listOf(6) && g[28].regs() == listOf(0) && g[29].regs() == listOf(0, 7) &&
            g[30].regs() == listOf(0) && g[39].regs() == listOf(7, 6) && g[40].regs() == listOf(6, 6) &&
            g[42].regs() == listOf(1, 0, 7, 6, 2) &&
            g[3].regs() == listOf(2) && (g[3] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            g[20].regs() == listOf(2) && (g[20] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            resolverLayout.target(23) == 31 && resolverLayout.target(26) == 31 &&
            resolverLayout.target(35) == 43 && resolverLayout.target(38) == 43,
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
    val prefix = if (loggedAudio) """
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
        iget-object v2, p0, $firstField
        iget-object v3, p0, $secondField
        const/4 v4, 0x0
        iget-object v5, p0, $eventField
        new-instance v0, ${resolver.returnType}
        invoke-direct/range {v0 .. v5}, $alertConstructor
        return-object v0
        :original
        nop
    """ else """
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
    """
    resolver.addInstructionsWithLabels(0, prefix.trimIndent())
    // Both readable cached sources are ready. Keep their true source tag for playback/metrics.
    ready.replaceInstruction(14, BuilderInstruction30t(Opcode.GOTO_32,
        ready.implementation!!.newLabelForIndex(16)))
    Logger.getLogger("app.morphe.patches.maps.NavigationTtsPatch").info(
        "Navigation TTS: factory=$factory; dynamic=$dynamicFactory; resolver=$resolver; ready=$ready; " +
            "prefer readable synthesized audio; preserve canned fallback and voice selection",
    )
}
