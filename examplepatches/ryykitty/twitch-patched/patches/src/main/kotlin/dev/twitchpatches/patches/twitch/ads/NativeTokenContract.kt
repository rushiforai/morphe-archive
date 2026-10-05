package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import dev.twitchpatches.patches.twitch.shared.*

internal data class NativeTokenContract(
    val service: ClassDef, val constructor: Method, val params: MethodReference, val absent: FieldReference,
    val paramsMask: Int, val query: MethodReference, val mapper: MethodReference, val parser: FieldReference,
    val mapperArguments: List<Int>, val graphql: MethodReference, val graphqlField: FieldReference,
    val queryFlags: Int, val subscribe: Method, val subscribed: Method, val dispose: Method,
    val result: FieldReference, val serializer: Method, val platformIndex: Int,
    val platformRegister: Int, val paramsRegister: Int,
)

internal fun BytecodePatchContext.resolveNativeTokens(): NativeTokenContract {
    val classes = mutableListOf<ClassDef>().apply { classDefForEach { add(it) } }
    val methods = classes.flatMap { it.methods }
    val source = methods.filter { method -> method.hasStrings("parseStreamAccessTokenResponse") &&
        method.parameterTypes.size == 3 && method.parameterTypes.first().toString() == "Ljava/lang/String;" &&
        method.returnType == "Ljava/lang/Object;" && !AccessFlags.STATIC.isSet(method.accessFlags)
    }.uniqueHook("native stream access-token service")
    val service = classDefBy(source.definingClass)
    val code = source.code()
    val calls = code.withIndex().mapNotNull { (index, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { Triple(index, instruction, it) }
    }
    val paramsCall = calls.filter { (_, instruction, ref) -> ref.name == "<init>" &&
        ref.parameterTypes.size == 3 && ref.parameterTypes[1].toString() == "Ljava/lang/String;" &&
        ref.parameterTypes[2].toString() == "I" && instruction.opcode == Opcode.INVOKE_DIRECT &&
        classDefBy(ref.definingClass).methods.any { method -> method.references().filterIsInstance<StringReference>()
            .any { it.string.startsWith("PlaybackAccessTokenParams(device=") } }
    }.uniqueHook("native playback token parameters")
    val params = paramsCall.third
    val paramsRegisters = invokeRegisters(paramsCall.second)
    val mask = source.literalBefore(paramsCall.first, paramsRegisters.last())
    val absent = code.take(paramsCall.first).filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .filter { classDefBy(it.type).superclass == params.parameterTypes.first().toString() }
        .uniqueHook("native absent token option")
    val query = calls.filter { (_, _, ref) -> ref.name == "<init>" &&
        ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", params.definingClass) &&
        classDefBy(ref.definingClass).methods.any { it.hasStrings("StreamAccessTokenQuery") }
    }.uniqueHook("native stream token query").third
    val mapperCall = calls.filter { (_, _, ref) -> ref.name == "<init>" &&
        ref.parameterTypes.map { it.toString() } == listOf("I", "Ljava/lang/Object;", "Ljava/lang/Class;",
            "Ljava/lang/String;", "Ljava/lang/String;", "I", "I")
    }.uniqueHook("native token mapper")
    val registers = invokeRegisters(mapperCall.second)
    if (registers.size != 8) throw PatchException("Native token mapper must use eight argument words")
    val parser = source.fieldBefore(mapperCall.first, registers[2])
    val mapperArguments = listOf(1, 6, 7).map { source.literalBefore(mapperCall.first, registers[it]) }
    val graphqlCall = calls.filter { (_, instruction, ref) ->
        instruction.opcode == Opcode.INVOKE_STATIC && ref.parameterTypes.size == 4 &&
            ref.parameterTypes[2].toString() == "Lkotlin/jvm/functions/Function1;" && ref.parameterTypes[3].toString() == "I"
    }.uniqueHook("native authorized GraphQL Single")
    val graphRegisters = invokeRegisters(graphqlCall.second)
    val graphqlField = source.fieldBefore(graphqlCall.first, graphRegisters[0])
    if (graphqlField.type != graphqlCall.third.parameterTypes[0].toString() ||
        graphqlField.definingClass != service.type || parser.definingClass != service.type)
        throw PatchException("Native token service fields do not match GraphQL/mapper ownership")
    val constructor = service.methods.filter { it.name == "<init>" &&
        it.parameterTypes.map { p -> p.toString() } == listOf(graphqlField.type, parser.type) &&
        AccessFlags.PUBLIC.isSet(it.accessFlags)
    }.uniqueHook("native token source lifetime")
    val queryFlags = source.literalBefore(graphqlCall.first, graphRegisters[3])
    val subscribe = methods.filter { it.returnType == "V" && it.parameterTypes.size == 1 &&
        it.references().filterIsInstance<StringReference>().any { ref ->
            ref.string.startsWith("The RxJavaPlugins.onSubscribe hook returned a null SingleObserver.") }
    }.uniqueHook("native Single subscription")
    var parent: String? = graphqlCall.third.returnType
    val visited = mutableSetOf<String>()
    while (parent != null && parent != subscribe.definingClass && visited.add(parent)) parent = classDefBy(parent).superclass
    if (parent != subscribe.definingClass) throw PatchException("Token GraphQL result is not the resolved Single type")
    val observer = classDefBy(subscribe.parameterTypes.single().toString())
    if (!AccessFlags.INTERFACE.isSet(observer.accessFlags)) throw PatchException("Token observer is not an interface")
    observer.methods.filter { it.name == "onSuccess" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;") && it.returnType == "V" }
        .uniqueHook("native token observer success")
    observer.methods.filter { it.name == "onError" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Throwable;") && it.returnType == "V" }
        .uniqueHook("native token observer error")
    val subscribed = observer.methods.filter { it.name !in listOf("onSuccess", "onError") && it.parameterTypes.size == 1 && it.returnType == "V" }
        .uniqueHook("native token subscription cancellation")
    val dispose = classDefBy(subscribed.parameterTypes.single().toString()).methods.filter {
        it.name == "dispose" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }.uniqueHook("native token disposal")
    val result = code.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? FieldReference
    }.lastOrNull { it.type == "Ljava/lang/Object;" &&
        "Ljava/io/Serializable;" in classDefBy(it.definingClass).interfaces }
        ?: throw PatchException("Native token result wrapper not found")
    val playerField = classDefBy(params.definingClass).fields.filter { it.type == "Ljava/lang/String;" &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.uniqueHook("token player-type field")
    val serializer = methods.filter { it.hasStrings("platform", "playerType", "android") &&
        it.references().filterIsInstance<FieldReference>().any { ref -> ref.toString() == playerField.toString() }
    }.uniqueHook("token parameter serializer")
    val serialCode = serializer.code()
    val cast = serialCode.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.CHECK_CAST &&
        ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == params.definingClass }
        .uniqueHook("serializer token-parameter cast")
    val android = serialCode.withIndex().filter { (index, instruction) -> index > cast.index &&
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "android" }
        .uniqueHook("token-specific platform literal")
    if (serialCode.getOrNull(android.index + 1)?.opcode != Opcode.INVOKE_VIRTUAL)
        throw PatchException("Token platform serialization does not immediately consume its literal")
    return NativeTokenContract(service, constructor, params, absent, mask, query, mapperCall.third, parser,
        mapperArguments, graphqlCall.third, graphqlField, queryFlags, subscribe, subscribed, dispose, result,
        serializer, android.index, (android.value as OneRegisterInstruction).registerA,
        (cast.value as OneRegisterInstruction).registerA)
}

internal fun invokeRegisters(instruction: Instruction): List<Int> = when (instruction) {
    is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
    is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
        instruction.registerF, instruction.registerG).take(instruction.registerCount)
    else -> throw PatchException("Token invocation has no supported register shape")
}

internal fun Method.literalBefore(index: Int, register: Int): Int {
    val write = code().take(index).asReversed().firstOrNull { writesRegister(it, register) }
    return (write as? NarrowLiteralInstruction)?.narrowLiteral
        ?: throw PatchException("Token constructor literal was overwritten or unresolved for v$register")
}

private fun Method.fieldBefore(index: Int, register: Int): FieldReference {
    val write = code().take(index).asReversed().firstOrNull { writesRegister(it, register) }
    return ((write as? ReferenceInstruction)?.reference as? FieldReference)
        ?.takeIf { write.opcode == Opcode.IGET_OBJECT }
        ?: throw PatchException("Token service field was overwritten or unresolved for v$register")
}

private fun writesRegister(instruction: Instruction, register: Int): Boolean {
    if ((instruction as? OneRegisterInstruction)?.registerA != register) return false
    return instruction.opcode.setsRegister()
}
