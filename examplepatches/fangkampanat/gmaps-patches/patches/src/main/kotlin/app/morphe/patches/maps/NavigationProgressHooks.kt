package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val NAVIGATION_LISTENER_LABEL = "NotificationController.onNavigationStateChangedInternal"
private const val SCRATCH_REGISTERS = 9
private val staticInvokes = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val virtualInvokes = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val fieldReads = setOf(
    Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT,
)

/** Proven navigation-state and progress accessors shared by the native battery hooks. */
internal class NavigationProgressHook(
    val listener: MutableMethod,
    val state: FieldReference,
    val guiding: FieldReference,
    val guided: MethodReference,
    val progressGetter: MethodReference,
)

internal fun BytecodePatchContext.resolveNavigationProgress(): NavigationProgressHook {
    val listener = uniqueMapsHook(
        Fingerprint(returnType = "V", parameters = listOf("L"), strings = listOf(NAVIGATION_LISTENER_LABEL)),
        "navigation state listener",
    )!!
    if (AccessFlags.STATIC.isSet(listener.accessFlags)) {
        throw PatchException("Expected an instance navigation state listener: $listener")
    }
    val stateType = listener.parameterTypes.single().toString()
    val calls = listener.implementation!!.instructions.mapNotNull { instruction ->
        instruction.getReference<MethodReference>()?.let { instruction.opcode to it }
    }

    // The listener derives the guided-navigation state from its argument through one static getter.
    val guided = calls.filter { (opcode, call) ->
        opcode in staticInvokes && call.parameterTypes.map { it.toString() } == listOf(stateType) &&
            call.returnType.startsWith("L")
    }.map { it.second }.distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Expected one guided-state getter in $listener")
    val (state, guiding) = resolveGuidingGate(listener, stateType, guided)

    // ...and the current route progress from that state, identified by its labelled fields.
    val progressGetter = calls.filter { (opcode, call) ->
        opcode in virtualInvokes && call.definingClass == guided.returnType && call.parameterTypes.isEmpty() &&
            toStringLabels(call.returnType).containsAll(listOf("metersRemaining", "combinedSecondsRemaining"))
    }.map { it.second }.distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Expected one route progress getter in $listener")
    val progress = progressGetter.returnType

    val meters = labelledField(progress, "metersRemaining", "I")
    val metersNext = labelledField(progress, "metersRemainingToNextDestination", "I")
    val fromStart = labelledField(progress, "metersFromStart", "D")
    val onRoute = labelledField(progress, "isOnRoute", "Z")
    val completed = labelledField(progress, "routeCompletedSuccessfully", "Z")
    val seconds = labelledField(progress, "combinedSecondsRemaining", null)
    if (!seconds.type.startsWith("L")) throw PatchException("Unexpected remaining-time holder: $seconds")

    // Copy Maps' own seconds conversion instead of assuming the Duration type or getter name.
    val converters = classDefBy(progress).methods.filter { method ->
        method.parameterTypes.isEmpty() && method.returnType == "I" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation?.instructions?.toList()?.let { body ->
                body.map { it.opcode } == listOf(
                    Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL,
                    Opcode.MOVE_RESULT_WIDE, Opcode.LONG_TO_INT, Opcode.RETURN,
                ) && body[0].getReference<FieldReference>() == seconds
            } == true
    }
    val converter = converters.singleOrNull()
        ?: throw PatchException("Expected one remaining-seconds conversion in $progress, found ${converters.size}")
    val body = converter.implementation!!.instructions.toList()
    val holderGetter = body[1].getReference<MethodReference>()!!
    val toSeconds = body[3].getReference<MethodReference>()!!
    val holderRegister = (body[0] as TwoRegisterInstruction).registerA
    val durationRegister = (body[2] as OneRegisterInstruction).registerA
    if (holderGetter.definingClass != seconds.type || holderGetter.parameterTypes.isNotEmpty() ||
        body[1].invokeRegisters() != listOf(holderRegister) || body[3].invokeRegisters() != listOf(durationRegister) ||
        toSeconds.name != "toSeconds" || toSeconds.returnType != "J" || toSeconds.parameterTypes.isNotEmpty() ||
        toSeconds.definingClass != holderGetter.returnType
    ) {
        throw PatchException("Unexpected remaining-seconds conversion: $converter")
    }

    val implementation = listener.implementation!!
    val parameterRegisters = 1 + listener.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    if (implementation.registerCount - parameterRegisters < SCRATCH_REGISTERS) {
        throw PatchException("Not enough free registers in $listener for navigation progress")
    }
    val caller = listener.definingClass
    requireAccessibleField(caller, state)
    requireAccessibleField(caller, guiding, static = true)
    requireAccessibleMethod(caller, guided, static = true)
    requireAccessibleMethod(caller, progressGetter, static = false)
    requireAccessibleMethod(caller, holderGetter, static = false)
    listOf(meters, metersNext, fromStart, onRoute, completed, seconds).forEach { requireAccessibleField(caller, it) }

    return NavigationProgressHook(
        listener, state, guiding, guided, progressGetter,
    )
}

/** True when the instruction stores into [register], including the high half of a wide value. */
private fun Instruction.writes(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || (opcode.setsWideRegister() && target + 1 == register))
}

/**
 * Maps reads the guided state only after `if-ne state, GUIDING`. Resolve that enum field and
 * constant from the comparison guarding the getter, and confirm the constant's declared name.
 */
private fun BytecodePatchContext.resolveGuidingGate(
    listener: MutableMethod,
    stateType: String,
    guided: MethodReference,
): Pair<FieldReference, FieldReference> {
    val code = listener.implementation!!.instructions.toList()
    val first = code.indexOfFirst { it.getReference<MethodReference>()?.toString() == guided.toString() }
    val compare = code.getOrNull(first - 1)
    if (first < 1 || compare?.opcode != Opcode.IF_NE) {
        throw PatchException("Expected a state comparison before $guided in $listener")
    }
    val registers = (compare as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }
    val writers = registers.map { register ->
        (first - 2 downTo 0).map { code[it] }.firstOrNull { it.writes(register) }
    }
    val state = writers.singleOrNull { it?.opcode == Opcode.IGET_OBJECT }?.getReference<FieldReference>()
    val guiding = writers.singleOrNull { it?.opcode == Opcode.SGET_OBJECT }?.getReference<FieldReference>()
    if (state == null || guiding == null || state.definingClass != stateType ||
        state.type != guiding.type || guiding.definingClass != guiding.type
    ) {
        throw PatchException("Cannot prove the navigation state gate in $listener: $state / $guiding")
    }
    val enumClass = classDefBy(guiding.type)
    val clinit = enumClass.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
    if (enumClass.superclass != "Ljava/lang/Enum;" || clinit == null) {
        throw PatchException("Navigation state is not an enum: ${guiding.type}")
    }
    val nameIndex = clinit.indices.singleOrNull { clinit[it].getReference<StringReference>()?.string == "GUIDING" }
        ?: throw PatchException("Missing GUIDING constant in ${guiding.type}")
    val nameRegister = (clinit[nameIndex] as OneRegisterInstruction).registerA
    val construct = (nameIndex + 1 until clinit.size).firstOrNull { k ->
        clinit[k].opcode == Opcode.INVOKE_DIRECT && clinit[k].invokeRegisters()?.getOrNull(1) == nameRegister
    } ?: throw PatchException("Missing GUIDING construction in ${guiding.type}")
    val instance = clinit[construct].invokeRegisters()!!.first()
    val named = (construct + 1 until clinit.size).map { clinit[it] }.firstOrNull {
        it.opcode == Opcode.SPUT_OBJECT && (it as OneRegisterInstruction).registerA == instance
    }?.getReference<FieldReference>()
    if (named?.toString() != guiding.toString()) {
        throw PatchException("Navigation gate $guiding is not GUIDING ($named)")
    }
    return state to guiding
}

internal fun BytecodePatchContext.toStringLabels(type: String): Set<String> =
    classDefByOrNull(type)?.methods?.singleOrNull {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }?.implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }?.toSet()
        ?: emptySet()

/**
 * Field whose value toString passes to the formatter together with [label]. The value
 * register must come straight from an instance read of [type], with no other write between.
 */
internal fun BytecodePatchContext.labelledField(type: String, label: String, expectedType: String?): FieldReference {
    val method = classDefBy(type).methods.singleOrNull {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("Missing toString in $type")
    val code = method.implementation!!.instructions.toList()
    val labels = code.indices.filter { code[it].getReference<StringReference>()?.string == label }
    val index = labels.singleOrNull()
        ?: throw PatchException("Expected one '$label' label in $method, found ${labels.size}")
    val labelRegister = (code[index] as OneRegisterInstruction).registerA
    val call = (index + 1 until code.size).firstOrNull { code[it].invokeRegisters() != null }
        ?: throw PatchException("Missing '$label' formatter call in $method")
    val operands = code[call].invokeRegisters()!!
    if (operands.size < 3 || operands[1] != labelRegister) {
        throw PatchException("Unexpected '$label' formatter operands in $method: $operands")
    }
    val valueRegister = operands[2]
    val read = (call - 1 downTo maxOf(0, index - 3)).firstOrNull { k ->
        k != index && code[k].writes(valueRegister)
    }?.let { code[it] }
    val field = read?.takeIf { it.opcode in fieldReads }?.getReference<FieldReference>()
    if (field == null || field.definingClass != type || (expectedType != null && field.type != expectedType)) {
        throw PatchException("Cannot prove the '$label' field of $type from toString value flow: ${read?.opcode}")
    }
    return field
}

private fun BytecodePatchContext.requireAccessibleMethod(caller: String, reference: MethodReference, static: Boolean) {
    val owner = classDefBy(reference.definingClass)
    val method = owner.methods.singleOrNull {
        it.name == reference.name && it.returnType == reference.returnType &&
            it.parameterTypes.map { type -> type.toString() } == reference.parameterTypes.map { type -> type.toString() }
    } ?: throw PatchException("Missing declaration for $reference")
    if (AccessFlags.STATIC.isSet(method.accessFlags) != static || AccessFlags.INTERFACE.isSet(owner.accessFlags) ||
        !accessible(caller, owner.type, owner.accessFlags, method.accessFlags)
    ) {
        throw PatchException("Navigation progress cannot call $reference from $caller")
    }
}

internal fun BytecodePatchContext.requireAccessibleField(
    caller: String,
    reference: FieldReference,
    static: Boolean = false,
) {
    val owner = classDefBy(reference.definingClass)
    val field = owner.fields.singleOrNull { it.name == reference.name && it.type == reference.type }
        ?: throw PatchException("Missing declaration for $reference")
    if (AccessFlags.STATIC.isSet(field.accessFlags) != static ||
        !accessible(caller, owner.type, owner.accessFlags, field.accessFlags)
    ) {
        throw PatchException("Navigation progress cannot read $reference from $caller")
    }
}

private fun accessible(caller: String, owner: String, classFlags: Int, memberFlags: Int): Boolean {
    if (AccessFlags.PRIVATE.isSet(memberFlags)) return false
    val samePackage = caller.substringBeforeLast('/', "") == owner.substringBeforeLast('/', "")
    return (AccessFlags.PUBLIC.isSet(classFlags) || samePackage) &&
        (AccessFlags.PUBLIC.isSet(memberFlags) || samePackage)
}

