package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Native methods retain their original registers, instructions, menu listeners and cleanup. */
internal fun BytecodePatchContext.patchNativeReaderUi(version: String) {
    if (version in listOf("0.8.10.226 dev", "0.8.10.242 dev")) {
        val editor = mutableClassDefBy("Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;")
        val sites = editor.methods.flatMap { m -> m.implementation?.instructions?.withIndex()?.mapNotNull { site ->
            val ref = (site.value as? ReferenceInstruction)?.reference as? MethodReference
            if (site.value.opcode != Opcode.INVOKE_DIRECT || ref?.name != "<init>" || ref.parameterTypes.size != 3 ||
                ref.parameterTypes[0] != "Landroid/content/Context;" || ref.definingClass == editor.type) null
            else {
                var type: String? = ref.definingClass
                var popup = false
                repeat(5) { if (type == "Landroid/widget/PopupWindow;") popup = true
                    if (!popup && type?.startsWith("Lo/") == true) type = mutableClassDefBy(type!!).superclass }
                if (popup) Triple(m, site.index, (site.value as FiveRegisterInstruction).registerC) else null
            }
        }.orEmpty() }
        check(sites.size == 1) { "$version posting overflow popup constructor changed: ${sites.size}" }
        val (method, index, popup) = sites.single()
        method.addInstructionsWithLabels(index + 1,"invoke-static {v$popup}, Lapp/morphe/extension/chmate/PostingMenuPlacement;->prepare(Landroid/widget/PopupWindow;)V")
    }
    val cacheBinding = when (version) {
        "0.8.10.191 dev" -> Triple("Lo/getLabel;", "b", "Lo/r8lambda4sy1jIZDDj0VvqfE_7RbnJrDAgk;")
        "0.8.10.226 dev" -> Triple("Lo/OpenJSSEPlatformCompanion;", "e", "Lo/zzdY;")
        "0.8.10.242 dev" -> Triple("Lo/getImageView;", "e", "Lo/zzcvx;")
        else -> null
    }
    cacheBinding?.let { (owner, methodName, responseType) ->
        val cached = mutableClassDefBy(owner).methods.single { it.name == methodName && it.parameterTypes == listOf("Ljp/syoboi/a2chMate/client/BBSUrlInfo;") }
        val instructions = cached.implementation!!.instructions.toList()
        val code = mutableClassDefBy(responseType).fields.single { it.type == "I" && (it.accessFlags and 8) == 0 }
        val responseCall = instructions.withIndex().single { site ->
            ((site.value as? ReferenceInstruction)?.reference as? MethodReference)?.returnType == responseType
        }
        val response = (instructions[responseCall.index + 1] as OneRegisterInstruction).registerA
        val modern = version == "0.8.10.242 dev"
        val built = instructions.withIndex().single { site ->
            val ref = (site.value as? ReferenceInstruction)?.reference as? MethodReference
            if(modern) ref?.name == "<init>" && ref.definingClass == cached.returnType
            else ref?.returnType == cached.returnType
        }
        val args = built.value as FiveRegisterInstruction
        val result = if(modern) args.registerC else (instructions[built.index + 1] as OneRegisterInstruction).registerA
        val scratch = if(modern) args.registerD else args.registerC
        check(setOf(response,result,scratch).size == 3) { "Subject cache temporary registers alias" }
        cached.addInstructionsWithLabels(built.index + if(modern) 1 else 2,"""
            check-cast v$response, $responseType
            iget v$scratch, v$response, $code
            invoke-static {v$result, v$scratch}, Lapp/morphe/extension/chmate/NativeSubjectCache;->result(Ljava/lang/Object;I)Ljava/lang/Object;
            move-result-object v$result
            check-cast v$result, ${cached.returnType}
        """.trimIndent())
    }
    if (version in listOf("0.8.10.191 dev", "0.8.10.226 dev")) {
        patchLegacyPatrolErrors(version)
        return
    }
    if (version != "0.8.10.242 dev") return

    val work = mutableClassDefBy("Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;")
    val checkBoards = work.methods.single { it.name == "c" && it.parameterTypes.size == 3 && it.parameterTypes[1] == "Ljava/util/List;" }
    val caught = checkBoards.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.MOVE_EXCEPTION }
    val error = (caught.value as OneRegisterInstruction).registerA
    val boardName = checkBoards.implementation!!.instructions.toList().drop(caught.index).first { i ->
        i.opcode == Opcode.IGET_OBJECT && ((i as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == "Lo/KeJGNk;"
    } as TwoRegisterInstruction
    checkBoards.addInstructionsWithLabels(caught.index + 1,"invoke-static {v${boardName.registerB}, v$error}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->record(Ljava/lang/Object;Ljava/lang/Throwable;)V")
    val run = work.methods.single { it.name == "doWork" }
    val logs = run.implementation!!.instructions.withIndex().filter { site ->
        val ref = (site.value as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/VV;" && ref.name == "d" && ref.parameterTypes == listOf("Landroid/content/Context;", "I", "Ljava/lang/String;", "Ljava/lang/String;")
    }
    check(logs.size == 2) { "242 native patrol event exits changed: ${logs.size}" }
    logs.asReversed().forEach { log ->
    val message = (log.value as FiveRegisterInstruction).registerF
    run.addInstructionsWithLabels(log.index,"""
        invoke-static {v$message}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->append(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$message
    """.trimIndent())
    }
    // Inner throws may still be caught by the native worker and logged. Clear only
    // terminal returns and the final uncaught rethrow, after the native event append.
    val terminalThrow = run.implementation!!.instructions.withIndex().last { it.value.opcode == Opcode.THROW }.index
    run.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT || it.index == terminalThrow }.map { it.index }.reversed().forEach {
        run.addInstructionsWithLabels(it,"invoke-static {}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->end()V")
    }
    run.addInstructionsWithLabels(0,"invoke-static {}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->begin()V")
    mutableClassDefBy("Lapp/morphe/extension/chmate/PatrolErrorDetails;").methods.single { it.name == "subjectMethod" }.replaceInstruction(0, "const-string v0, \"C\"")
}

/** Wrap only the worker's board fetch; preserve the returned object and thrown exception. */
private fun BytecodePatchContext.patchLegacyPatrolErrors(version: String) {
    val legacy = version == "0.8.10.191 dev"
    val work = mutableClassDefBy("Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;")
    val method = work.methods.single { it.name == (if (legacy) "d" else "b") && it.parameterTypes.size == 3 }
    val sites = method.implementation!!.instructions.withIndex().filter { (_, ins) ->
        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == (if (legacy) "Lo/o2;" else "Lo/dispatchTouchEvent\$RemoteActionCompatParcelizer;") &&
            ref.parameterTypes.contains("Ljp/syoboi/a2chMate/client/BBSUrlInfo;") && ref.returnType.startsWith("Lo/")
    }
    check(sites.size == 1) { "$version patrol board fetch changed: ${sites.size}" }
    val (index, ins) = sites.single()
    val ref = (ins as ReferenceInstruction).reference as MethodReference
    val params = (if (legacy) emptyList() else listOf(ref.definingClass)) + ref.parameterTypes.map(CharSequence::toString)
    val words = params.sumOf { if(it == "J" || it == "D") 2 else 1 }
    val info = params.takeWhile { it != "Ljp/syoboi/a2chMate/client/BBSUrlInfo;" }.sumOf { if(it == "J" || it == "D") 2 else 1 }
    val wrapper = MutableMethod(ImmutableMethod(work.type,"haiagaruPatrolBoardFetch",
        params.map { ImmutableMethodParameter(it,emptySet(),null) },ref.returnType,0x1009,emptySet(),emptySet(),
        ImmutableMethodImplementation(words+1,emptyList(),emptyList(),emptyList())))
    wrapper.addInstructions(0,"""
        invoke-${if(legacy) "static" else "virtual"}/range {p0 .. p${words-1}}, $ref
        move-result-object v0
        return-object v0
        move-exception v0
        invoke-static {p$info, v0}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->recordInfo(Ljava/lang/Object;Ljava/lang/Throwable;)V
        throw v0
    """.trimIndent())
    wrapper.implementation!!.let { impl -> impl.addCatch("Ljava/lang/Exception;",impl.newLabelForIndex(0),impl.newLabelForIndex(2),impl.newLabelForIndex(3)) }
    work.methods.add(wrapper)
    val target="${work.type}->${wrapper.name}(${params.joinToString("")})${ref.returnType}"
    method.replaceInstruction(index,when(ins){
        is RegisterRangeInstruction -> "invoke-static/range {v${ins.startRegister} .. v${ins.startRegister+ins.registerCount-1}}, $target"
        is FiveRegisterInstruction -> "invoke-static {${listOf(ins.registerC,ins.registerD,ins.registerE,ins.registerF,ins.registerG).take(ins.registerCount).joinToString(", "){ "v$it" }}}, $target"
        else -> error("Unknown board-fetch invocation")
    })
    val run=work.methods.single { it.name == "doWork" }
    val terminalThrow=run.implementation!!.instructions.withIndex().last { it.value.opcode == Opcode.THROW }.index
    run.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT || it.index == terminalThrow }.map { it.index }.reversed().forEach {
        run.addInstructionsWithLabels(it,"invoke-static {}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->end()V")
    }
    run.addInstructionsWithLabels(0,"invoke-static {}, Lapp/morphe/extension/chmate/PatrolErrorDetails;->begin()V")
    mutableClassDefBy("Lapp/morphe/extension/chmate/PatrolErrorDetails;").methods.single { it.name == "subjectMethod" }
        .replaceInstruction(0,"const-string v0, \"${if(legacy) "i" else "v"}\"")
}
