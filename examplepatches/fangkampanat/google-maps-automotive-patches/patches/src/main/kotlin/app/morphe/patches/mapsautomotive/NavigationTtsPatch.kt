package app.morphe.patches.mapsautomotive

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

// Maps' TTS cache keeps two voices for spoken directions: the head unit's text-to-speech engine (local) and Google's
// online voice. Its server settings choose the local voice only, the online voice only, or both, and while the online
// voice is on, only a prompt the online voice made counts as ready. Where the online voice fails (one BYD Atto 3),
// nothing is ready and Maps falls back to short canned prompts without street names.
// While the navigation_speech switch is on, NavigationSpeech changes two choices:
// - the factory: where Maps would make the online voice only, it makes both, as Maps' own "both" choice does; "local
//   only" stays as it is;
// - the readiness check: a prompt the local voice made counts as ready while the online voice's last result was a
//   failure. The online voice reports each prompt through the completion listener the factory gives it; the
//   listener's result method passes its success flag to NavigationSpeech.onlineResult first.
// So where the online voice works, prompts stay Maps' own (no mixed voices). Maps still takes the online voice's
// prompt first when it has one. Required: every anchor matches one known form.
private const val NAVIGATION_SPEECH_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/NavigationSpeech;"

@Suppress("unused")
val navigationSpeechPatch = bytecodePatch(
    name = "Navigation speech",
    description = "Lets Maps use the head unit's text-to-speech voice for spoken directions when Google's online voice " +
        "has none ready, so you hear street names instead of short canned prompts.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch)

    execute {
        requireExtensionMethod(NAVIGATION_SPEECH_CLASS, "bothVoices", listOf("I"), "Z")
        requireExtensionMethod(NAVIGATION_SPEECH_CLASS, "localReady", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z")
        requireExtensionMethod(NAVIGATION_SPEECH_CLASS, "onlineResult", listOf("Z"), "V")
        patchNavigationTts()
        IncludedFeatures.features += "navigation_speech"
    }
}

private fun Instruction.invokeRegisters(): List<Int>? = when (this) {
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> null
}

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

    /** The one known form whose exact shape is code[from, until); none or several fail. */
    fun <T : TtsForm> form(block: String, forms: List<T>, from: Int, until: Int): T {
        val matched = forms.filter { code.subList(from, until).shape(it.shape) }
        require(matched.size == 1, "$block: ${if (matched.isEmpty()) "no" else "ambiguous"} known R8 form; " +
            "known: ${forms.joinToString { it.name }}")
        return matched.single()
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

/** An accepted R8 form of one provider sub-block; [shape] is its exact opcode sequence. */
private sealed interface TtsForm {
    val name: String
    val shape: String
}

/** Provider selection [gate, create): mode switch, then the e/c/i flags. Indices are relative to the gate. */
private class SelectionForm(
    override val name: String,
    override val shape: String,
    val modeDefault: Int, // if-nez over the move that maps mode 0 to 1
    val toDynamicOnly: Int,
    val toCannedOnly: Int,
    val toFlagI: List<Int>, // a null e config or a clear flag falls through to the i flag
    val flagI: Int,
    val skipDynamic: List<Int>, // a set flag skips the dynamic creation
) : TtsForm

/** Provider creation/merge [create, pairAt + 1]; [result] (relative to create) writes the pair's first argument. */
private class CreationForm(override val name: String, override val shape: String, val result: Int) : TtsForm

private const val SELECTION_HEAD = """
    INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET INVOKE_STATIC MOVE_RESULT CONST_4 IF_NEZ MOVE
    ADD_INT_LIT8 IF_EQZ IF_EQ INVOKE_INTERFACE MOVE_RESULT_OBJECT IGET_OBJECT IF_EQZ
    IGET_BOOLEAN IF_EQZ IGET_BOOLEAN"""
// R8 picks the two sub-block forms independently: 26.36-26.39 goto/direct, 26.41-26.42 if-nez/moved, 26.43 if-nez/direct.
private val selectionForms = listOf(
    // 26.41-26.43: a set e flag branches straight to the canned creation.
    SelectionForm("e-flag if-nez", "$SELECTION_HEAD IF_NEZ IGET_BOOLEAN IF_NEZ", modeDefault = 6, toDynamicOnly = 9,
        toCannedOnly = 10, toFlagI = listOf(14, 16), flagI = 19, skipDynamic = listOf(18, 20)),
    // 26.36-26.39: R8 inverts the e flag and jumps over the i flag with a goto.
    SelectionForm("e-flag if-eqz + goto", "$SELECTION_HEAD IF_EQZ GOTO IGET_BOOLEAN IF_NEZ", modeDefault = 6,
        toDynamicOnly = 9, toCannedOnly = 10, toFlagI = listOf(14, 16, 18), flagI = 20, skipDynamic = listOf(19, 21)),
)
private const val CREATION_TAIL = """
    IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO IGET_OBJECT INVOKE_VIRTUAL MOVE_RESULT_OBJECT GOTO
    INVOKE_VIRTUAL MOVE_RESULT_OBJECT MOVE_OBJECT MOVE_OBJECT MOVE_OBJECT NEW_INSTANCE INVOKE_DIRECT IPUT_OBJECT"""
private val creationForms = listOf(
    // 26.36-26.39 and 26.43: the dynamic result lands in the pair's first argument.
    CreationForm("direct result", "INVOKE_VIRTUAL MOVE_RESULT_OBJECT $CREATION_TAIL", result = 1),
    // 26.41-26.42: R8 moves it there from a temporary.
    CreationForm("moved result", "INVOKE_VIRTUAL MOVE_RESULT_OBJECT MOVE_OBJECT $CREATION_TAIL", result = 2),
)

/**
 * Positions of the provider block that the caller's class-level checks and the hook use: [choiceAt] is the branch to
 * the local-only creation, which tests [choice] (Maps' setting minus one: 0 local only, 1 online only, else its flags).
 */
private class TtsProviderBlock(
    val forms: String,
    val fieldAt: Int,
    val cannedAt: Int,
    val merge: Int,
    val choiceAt: Int,
    val choice: Int,
)

/**
 * Instruction-level recognition of the provider block: each sub-block must match exactly one known form, and every
 * operand, branch and live-register guard takes its positions from those forms. Class-level checks stay with the caller.
 */
private fun recognizeTtsProviderBlock(factory: Method, h: List<Instruction>, gate: Int, create: Int, pairAt: Int): TtsProviderBlock {
    val layout = TtsLayout(factory, h, gate - 1..pairAt + 1)
    val selection = layout.form("provider selection block", selectionForms, gate, create)
    val creation = layout.form("provider creation/merge", creationForms, create, pairAt + 2)
    val dynamicFactory = h[create].call() ?: throw PatchException("Missing dynamic provider factory")
    val resultAt = create + creation.result
    val fieldAt = resultAt + 1
    val cannedAt = fieldAt + 1
    val cannedOnly = cannedAt + 4
    val dynamicOnly = cannedOnly + 3
    val merge = pairAt - 1
    val dynamicRegs = h[create].regs()
    val cannedRegs = h[cannedAt].regs()
    val dynamicResult = h[resultAt].regs().first()
    // The moved form copies the dynamic call's move-result register; the direct form is that register.
    val copied = h.subList(create + 1, resultAt).map { it.regs().single() }
    layout.require(dynamicFactory.parameterTypes.size == 2 && dynamicFactory.returnType.startsWith("L") &&
        dynamicFactory.same(h[dynamicOnly].call()) && dynamicRegs.size == 3 && cannedRegs.size == 5 &&
        dynamicRegs[0] == cannedRegs[0] && dynamicRegs[2] == cannedRegs[2] &&
        h[dynamicOnly].regs() == listOf(dynamicRegs[0], cannedRegs[1], dynamicRegs[2]) &&
        h[fieldAt].regs() == listOf(cannedRegs[4], dynamicRegs[0]) &&
        h[cannedOnly - 1].field() == h[fieldAt].field() && h[cannedOnly].call()?.same(h[cannedAt].call()) == true &&
        h[cannedOnly].regs() == cannedRegs && h[cannedAt + 1].regs() == listOf(dynamicRegs[0]) &&
        h[cannedOnly + 1].regs() == listOf(dynamicRegs[0]) &&
        h[pairAt].regs() == listOf(h[merge].regs().single(), dynamicResult, dynamicRegs[0]) &&
        h[resultAt].regs() == listOf(dynamicResult) + copied &&
        h[dynamicOnly + 1].regs() == listOf(dynamicRegs[0]) &&
        h[dynamicOnly + 2].regs().getOrNull(1) == dynamicResult &&
        h[dynamicOnly + 3].regs() == listOf(dynamicResult, dynamicRegs[0]) &&
        h[dynamicOnly + 4].regs() == listOf(dynamicRegs[0], h[dynamicOnly + 2].regs().first()),
        "provider operands")
    // The skipped block must not initialize any input needed by the both-provider path.
    val live = dynamicRegs + cannedRegs.take(4)
    layout.require(h.subList(gate, create).filter { it.opcode.setsRegister() }.all {
        (it as? OneRegisterInstruction)?.registerA !in live &&
            (!it.opcode.setsWideRegister() || (it as OneRegisterInstruction).registerA + 1 !in live)
    } && (0 until gate).lastOrNull { h[it].opcode.setsRegister() &&
        ((h[it] as? OneRegisterInstruction)?.registerA == dynamicRegs[1] ||
            h[it].opcode.setsWideRegister() && (h[it] as? OneRegisterInstruction)?.registerA == dynamicRegs[1] - 1)
    }?.let { h[it].opcode == Opcode.CONST_4 && (h[it] as NarrowLiteralInstruction).narrowLiteral == 0 } == true,
        "provider live registers")
    layout.require(layout.target(gate + selection.toDynamicOnly) == dynamicOnly &&
        layout.target(gate + selection.toCannedOnly) == cannedOnly - 1 &&
        layout.target(gate + selection.modeDefault) == gate + selection.modeDefault + 2 &&
        selection.toFlagI.all { layout.target(gate + it) == gate + selection.flagI } &&
        selection.skipDynamic.all { layout.target(gate + it) == fieldAt } &&
        layout.target(cannedAt + 2) == merge && layout.target(cannedOnly + 2) == merge,
        "provider branch relationships")
    // The setting: move-result (raw), const/4 one = 1, if-nez raw, move raw = one, add-int/lit8 raw -1, if-eqz raw
    // (local only), if-eq raw one (online only).
    val choiceAt = gate + selection.toDynamicOnly
    val choice = h[choiceAt].regs().single()
    val one = h[gate + 5].regs().single()
    layout.require(h[gate + 4].regs() == listOf(choice) &&
        (h[gate + 5] as NarrowLiteralInstruction).narrowLiteral == 1 && one != choice &&
        h[gate + selection.modeDefault].regs() == listOf(choice) &&
        h[gate + selection.modeDefault + 1].regs() == listOf(choice, one) &&
        h[choiceAt - 1].opcode == Opcode.ADD_INT_LIT8 && h[choiceAt - 1].regs() == listOf(choice, choice) &&
        (h[choiceAt - 1] as NarrowLiteralInstruction).narrowLiteral == -1 &&
        h[gate + selection.toCannedOnly].regs() == listOf(choice, one),
        "provider choice register")
    return TtsProviderBlock("${selection.name}; ${creation.name}", fieldAt, cannedAt, merge, choiceAt, choice)
}

/** Every register an instruction names, the third of a three-register instruction included. */
private fun Instruction.namedRegisters(): List<Int> = when (this) {
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    else -> regs()
}

/**
 * A local register that no instruction from [from] on names, for a value the hook at [from] writes and reads only
 * there; null when there is none. Wide values after [from] are refused, since a pair's second register goes unnamed.
 */
private fun freeRegister(method: Method, code: List<Instruction>, from: Int, layout: TtsLayout): Int {
    val tail = code.drop(from)
    layout.require(tail.none { Regex("wide|long|double").containsMatchIn(it.opcode.toString()) }, "no wide values after the hook")
    val parameters = method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val named = tail.flatMap { it.namedRegisters() }.toSet()
    val free = (0 until method.implementation!!.registerCount - parameters).firstOrNull { it !in named }
    layout.require(free != null, "a free register for the hook")
    return free!!
}

/** Whether a branch in [code] lands on [index], which would skip code inserted there. */
private fun List<Instruction>.branchesTo(index: Int): Boolean = indices.any { i ->
    this[i] is OffsetInstruction && this[i].opcode != Opcode.PACKED_SWITCH && this[i].opcode != Opcode.SPARSE_SWITCH &&
        this[i].opcode != Opcode.FILL_ARRAY_DATA && target(i) == index
}

/** Keep Maps' synthesis, fallback and lookup order; change only which voices it makes and which prompts are ready. */
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
    // The local voice's creation on the both-voices path (no completion listener), where the hook jumps.
    val create = creations.first()
    val factoryLayout = TtsLayout(factory, h, gate - 1..pairAt + 1)
    val block = recognizeTtsProviderBlock(factory, h, gate, create, pairAt)
    val dynamicFactory = h[create].call()!!
    val fieldAt = block.fieldAt
    val cannedAt = block.cannedAt
    val merge = block.merge
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
    val choiceAt = block.choiceAt
    factoryLayout.require(!h.branchesTo(choiceAt), "no branch lands on the voice choice")
    val factoryFree = freeRegister(factory, h, choiceAt, factoryLayout)

    // The prompt type: the one method of the cache that reads a file with File.canRead() returns it.
    val resolver = owner.methods.singleOrNull { method ->
        method.parameterTypes.size == 1 && method.returnType.startsWith("L") &&
            method.implementation?.instructions?.count { it.call()?.toString() == "Ljava/io/File;->canRead()Z" } == 1
    } ?: throw PatchException("Missing unique navigation audio resolver")

    val ready = owner.methods.singleOrNull { method ->
        method.returnType == "Z" && method.parameterTypes.size == 1 && method.implementation?.instructions?.any {
            it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == resolver.returnType
        } == true
    } ?: throw PatchException("Missing unique navigation audio readiness check")
    val f = ready.implementation!!.instructions.toList()
    val readyLayout = TtsLayout(ready, f)
    // R8 may merge the true/false returns: if-ne skips the shared move of true into v0 (26.42).
    val mergedReady = f.shape("""
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT CONST_4 IF_EQZ INVOKE_DIRECT MOVE_RESULT CONST_4 IF_EQZ
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ SGET_OBJECT CHECK_CAST IGET_OBJECT IF_NE MOVE RETURN
    """)
    readyLayout.require(ready.implementation!!.registerCount == 5 && ready.implementation!!.tryBlocks.isEmpty() &&
        (mergedReady || f.shape("""
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT CONST_4 IF_EQZ INVOKE_DIRECT MOVE_RESULT CONST_4 IF_EQZ
        INVOKE_VIRTUAL MOVE_RESULT_OBJECT IF_EQZ SGET_OBJECT CHECK_CAST IGET_OBJECT IF_EQ RETURN RETURN RETURN
    """)), "audio readiness")
    val resolveRequest = owner.methods.single { f[0].call()!!.same(it) }
    val requestBody = resolveRequest.implementation!!.instructions.toList()
    TtsLayout(resolveRequest, requestBody).require(requestBody.shape("IGET_OBJECT INVOKE_DIRECT MOVE_RESULT_OBJECT RETURN_OBJECT") &&
        resolver.same(requestBody[1].call()) && f[1].regs() == listOf(4) && f[3].regs() == listOf(4) &&
        f[2].regs() == listOf(0) && (f[2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        f[6].regs() == listOf(2) && (f[6] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        f[11].regs() == listOf(3) && f[11].field()?.type == f[13].field()?.type &&
        f[13].field()?.definingClass == resolver.returnType && f[13].regs() == listOf(4, 4) &&
        f[14].regs() == listOf(4, 3) && readyLayout.target(14) == 16 && if (mergedReady) {
            // Absent alert and tag mismatch return v0 (false); the other paths reach 15, which moves true into v0.
            readyLayout.target(3) == 16 && readyLayout.target(7) == 15 && readyLayout.target(10) == 15 &&
                f[7].regs() == f[5].regs() && f[10].regs() == f[9].regs() &&
                f[15].regs() == listOf(0, 2) && f[16].regs() == listOf(0) &&
                f.indices.filter { f[it].opcode.setsRegister() &&
                    (f[it] as? OneRegisterInstruction)?.registerA.let { it == 0 || it == 2 } } == listOf(2, 6, 15)
        } else readyLayout.target(3) == 17 &&
            f[15].regs() == listOf(0) && f[16].regs() == listOf(2) && f[17].regs() == listOf(0),
        "readiness result flow", readyLayout)
    // The tag check: the prompt's voice (v4) against the online voice (v3); "ready" is where true is returned.
    val tagCheck = 14
    val readyAt = if (mergedReady) 15 else 16
    readyLayout.require(!f.branchesTo(tagCheck), "no branch lands on the voice tag check")
    val readyFree = freeRegister(ready, f, tagCheck, readyLayout)

    // The completion listener: created before the cache (new-instance into the online creation's second argument, not
    // written again before the gate) and the local creation's first parameter type. Its result method takes the
    // resolver's request type and two flags; it starts with if-eqz on the first flag, and the path for true tells the
    // cache that the prompt is done (check-cast to the cache, a call of its (request)V method, return).
    val listenerRegister = h[cannedAt].regs()[1]
    val listenerNew = (gate - 1 downTo 0).firstOrNull { h[it].opcode.setsRegister() &&
        (h[it] as? OneRegisterInstruction)?.registerA == listenerRegister }
    val listenerType = listenerNew?.let { h[it].getReference<com.android.tools.smali.dexlib2.iface.reference.TypeReference>()?.type }
    factoryLayout.require(listenerNew != null && h[listenerNew].opcode == Opcode.NEW_INSTANCE && listenerType != null &&
        dynamicFactory.parameterTypes[0].toString() == listenerType, "completion listener")
    val requestType = resolver.parameterTypes[0].toString()
    val results = classDefBy(listenerType!!).methods.filter { method ->
        method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map { it.toString() } == listOf(requestType, "Z", "Z")
    }
    if (results.size != 1) throw PatchException("Expected one result method ($requestType, Z, Z) in $listenerType, found ${results.size}")
    val result = results.single()
    val r = result.implementation?.instructions?.toList() ?: throw PatchException("No code in $result")
    val resultLayout = TtsLayout(result, r, 0..minOf(r.size - 1, 8))
    val okRegister = result.implementation!!.registerCount - 2
    resultLayout.require(r.isNotEmpty() && r[0].opcode == Opcode.IF_EQZ && r[0].regs() == listOf(okRegister) &&
        !r.branchesTo(0) && r.target(0).let { failure ->
            failure > 1 && r.subList(1, failure).let { done ->
                done.any { it.opcode == Opcode.CHECK_CAST &&
                    it.getReference<com.android.tools.smali.dexlib2.iface.reference.TypeReference>()?.type == owner.type } &&
                    done.any { it.call()?.let { call -> call.definingClass == owner.type && call.returnType == "V" &&
                        call.parameterTypes.map { p -> p.toString() } == listOf(requestType) } == true } &&
                    done.last().opcode == Opcode.RETURN_VOID
            }
        }, "result method: success first")

    // All discovery and guards finish before mutation. Synchronization, callbacks and cleanup stay as they are.
    mutableClassDefBy(listenerType).methods.single { result.same(it) }.addInstructions(0,
        "invoke-static/range { v$okRegister .. v$okRegister }, $NAVIGATION_SPEECH_CLASS->onlineResult(Z)V")
    factory.addInstructionsWithLabels(choiceAt, """
        invoke-static { v${block.choice} }, $NAVIGATION_SPEECH_CLASS->bothVoices(I)Z
        move-result v$factoryFree
        if-nez v$factoryFree, :both
    """.trimIndent(), ExternalLabel("both", factory.getInstruction(create)))
    ready.addInstructionsWithLabels(tagCheck, """
        invoke-static { v4, v3 }, $NAVIGATION_SPEECH_CLASS->localReady(Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v$readyFree
        if-nez v$readyFree, :ready
    """.trimIndent(), ExternalLabel("ready", ready.getInstruction(readyAt)))
    Logger.getLogger("app.morphe.patches.mapsautomotive.NavigationTtsPatch").info(
        "Navigation speech: factory=$factory; forms=${block.forms}; choice v${block.choice} at $choiceAt, both " +
            "voices at $create (v$factoryFree); ready=$ready at $tagCheck, true at $readyAt (v$readyFree); " +
            "online results=$result (v$okRegister)",
    )
}
