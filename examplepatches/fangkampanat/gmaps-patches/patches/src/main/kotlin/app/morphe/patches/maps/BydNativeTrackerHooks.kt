package app.morphe.patches.maps

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val TRACKER_EXT = "Lapp/morphe/extension/maps/patches/BydNativeBatteryPatch;"
private fun Instruction.field() = getReference<FieldReference>()
private fun Instruction.call() = getReference<MethodReference>()
private fun Method.code() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing native tracker implementation: $this")
private fun checkTracker(ok: Boolean, reason: String, method: Any) {
    if (!ok) throw PatchException("Unrecognized native tracker layout: $reason in $method")
}

internal class NativeTrackerPlan(val schema: String, private val gates: List<Pair<MutableMethod, String>>) {
    fun inject() {
        gates.forEach { (method, helper) ->
            val code = method.code()
            code.indices.filter { code[it].opcode == Opcode.RETURN }.sortedDescending().forEach { index ->
                val register = (code[index] as OneRegisterInstruction).registerA
                // Keep labels on the replaced return: a branch directly to that
                // exit must execute the wrapper too, rather than bypass an insertion.
                method.replaceInstruction(index,
                    "invoke-static/range { v$register .. v$register }, $TRACKER_EXT->$helper(Z)Z")
                checkTracker(method.code()[index].call()?.toString() == "$TRACKER_EXT->$helper(Z)Z",
                    "gate return replacement", method)
                checkedNativeInsert(method, index + 1, """
                    move-result v$register
                    return v$register
                """.trimIndent(), listOf(Opcode.MOVE_RESULT, Opcode.RETURN))
            }
        }
    }
}

/** Prove Wh setter, balanced clearing inhibition and its executor before changing either gate. */
internal fun BytecodePatchContext.resolveNativeTracker(
    tracker: MutableMethod, startupGate: MethodReference, trackingGate: MethodReference,
): NativeTrackerPlan {
    val cls = classDefBy(tracker.definingClass)
    checkTracker(AccessFlags.PUBLIC.isSet(cls.accessFlags), "public tracker", cls.type)
    val setter = cls.methods.singleOrNull { method -> method.returnType == "V" && method.parameterTypes == listOf("I") &&
        method.code().any { it.getReference<StringReference>()?.string?.contains("Please call inhibitBatteryLevelClearing") == true }
    } ?: throw PatchException("Missing unique battery Wh setter")
    val sc = setter.code()
    val receiver = setter.implementation!!.registerCount - 2
    val parameter = receiver + 1
    checkTracker(sc[0].opcode == Opcode.IGET_OBJECT && sc[1].call()?.toString() == startupGate.toString() &&
        (sc[0] as TwoRegisterInstruction).registerB == receiver && sc[2].opcode == Opcode.MOVE_RESULT &&
        sc[3].opcode == Opcode.IF_EQZ && (sc[2] as OneRegisterInstruction).registerA ==
        (sc[3] as OneRegisterInstruction).registerA, "setter startup gate", setter)
    val counter = sc[4].field()
    checkTracker(sc[4].opcode == Opcode.IGET_OBJECT && counter?.definingClass == cls.type &&
        (sc[4] as TwoRegisterInstruction).registerB == receiver && sc[5].call()?.returnType == "Ljava/lang/Object;",
        "clearing inhibitor counter", setter)
    val seed = sc.indices.singleOrNull { sc[it].opcode == Opcode.NEW_INSTANCE }
        ?: throw PatchException("Missing unique Wh state construction")
    checkTracker(sc[seed + 1].call()?.let { it.name == "<init>" && it.parameterTypes == listOf("I") } == true &&
        sc[seed + 1].invokeRegisters()?.last() == parameter && sc[seed + 2].call()?.parameterTypes == listOf("Ljava/lang/Object;"),
        "Wh parameter reaches tracker state", setter)
    fun counterMethod(delta: Int): Method = cls.methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == "V" && method.code().firstOrNull()?.let {
            it.opcode == Opcode.IGET_OBJECT && it.field()?.toString() == counter.toString()
        } == true && method.code().count { it.opcode == Opcode.ADD_INT_LIT8 &&
            (it as NarrowLiteralInstruction).narrowLiteral == delta } == 1 && method.code().any {
            it.opcode == Opcode.INVOKE_INTERFACE && it.call()?.definingClass == counter?.type && it.call()?.returnType == "Z" &&
                it.call()?.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }
    } ?: throw PatchException("Missing unique balanced inhibitor method ($delta)")
    val inhibit = counterMethod(1)
    val release = counterMethod(-1)
    checkTracker(release.code().any { it.getReference<StringReference>()?.string?.contains("no active inhibitors") == true },
        "inhibitor release warning", release)
    val api = cls.interfaces.singleOrNull { type -> listOf(setter, inhibit, release).all { member ->
        classDefBy(type).methods.any { it.name == member.name && it.parameterTypes == member.parameterTypes && it.returnType == member.returnType }
    } } ?: throw PatchException("Missing unique public tracker battery interface")
    checkTracker(AccessFlags.PUBLIC.isSet(classDefBy(api).accessFlags) &&
        listOf(setter, inhibit, release).all { AccessFlags.PUBLIC.isSet(it.accessFlags) }, "public tracker battery methods", api)
    val ctor = cls.methods.single { it.name == "<init>" }
    val executorType = "Ljava/util/concurrent/ScheduledExecutorService;"
    val stores = ctor.code().filter { it.opcode == Opcode.IPUT_OBJECT && it.field()?.type == executorType }
    checkTracker(stores.size == 1 && ctor.parameterTypes.count { it == executorType } == 1, "unique tracker executor", ctor)
    val executor = stores.single().field()!!
    val executorParam = ctor.implementation!!.registerCount - ctor.parameterTypes.size + ctor.parameterTypes.indexOf(executorType)
    checkTracker((stores.single() as TwoRegisterInstruction).registerA == executorParam && executor.definingClass == cls.type &&
        cls.fields.any { it.name == executor.name && it.type == executorType && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "public executor constructor flow", ctor)
    val implementations = mutableListOf<String>()
    classDefForEach { if (startupGate.definingClass in it.interfaces) implementations.add(it.type) }
    checkTracker(implementations.size == 1 && startupGate.definingClass == trackingGate.definingClass,
        "unique matching gate implementation", startupGate)
    val gateClass = mutableClassDefBy(implementations.single())
    val gates = listOf(startupGate to "allowTrackerStartup", trackingGate to "allowTrackerTracking").map { (ref, helper) ->
        val method = gateClass.methods.single { it.name == ref.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        val code = method.code()
        checkTracker(AccessFlags.PUBLIC.isSet(method.accessFlags) && code.count { it.opcode == Opcode.RETURN } == 2 &&
            code.none { it.opcode in setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } &&
            code.filter { it.opcode == Opcode.RETURN }.all { (it as OneRegisterInstruction).registerA <= 255 },
            "boolean gate exits", method)
        method to helper
    }
    return NativeTrackerPlan(listOf(api.removePrefix("L").removeSuffix(";").replace('/', '.'),
        setter.name, inhibit.name, release.name, executor.name).joinToString(","), gates)
}
