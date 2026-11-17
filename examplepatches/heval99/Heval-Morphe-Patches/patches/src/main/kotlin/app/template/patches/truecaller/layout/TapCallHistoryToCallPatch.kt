package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val FEATURE = "truecaller.tap_call_history_to_call"
private const val STRING = "Ljava/lang/String;"

// The revamped call log reports every row event (ItemClick, LongClick, DeleteClick, PrimaryActionClick,
// AvatarClick, ...) to one R8-merged Function1 dispatcher. Its ItemClick case reads the row id, asks the
// view model whether the list is in selection mode (a (String)Z method; true ends the case), then looks
// the row up and builds ViewProfile(number) to open the profile. While the feature is on, a tap that
// is not in selection mode calls the view model's call method instead, the one the call button uses,
// with (id, false) for a voice call: that method looks the row up again, starts the call through
// InitiateCallHelper (the same SIM choice as the call button) and does nothing for a row without an
// entry or a number, which is also what the stock case does for them. The case then ends as if the
// selection check had answered true, so ViewProfile is never built. Long press, swipe, selection mode,
// the call button and the avatar are other cases and stay stock. The switch is read on each tap.
@Suppress("unused")
val tapCallHistoryToCallPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Tap call history to call",
        description = "Tapping a call in the new call log calls the number instead of opening the profile.",
        category = TruecallerControlsCategory.CALL_LOG,
        default = false,
    ),
    default = false,
) {
    // 1. The tap event, the view model's call method and the profile-open events.
    val itemClick = CallLogItemClickToStringFingerprint.classDef.type
    val callFingerprint = CallLogCallMethodFingerprint
    val callMethod = callFingerprint.method
    val viewModel = callFingerprint.classDef.type
    if (AccessFlags.STATIC.isSet(callMethod.accessFlags)) {
        throw PatchException("$viewModel->${callMethod.name} is static, expected an instance method")
    }
    val viewProfiles = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.name == "toString" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any { it.string()?.startsWith("ViewProfile(normalisedNumber=") == true } == true
            }
        ) {
            viewProfiles += classDef.type
        }
    }
    if (viewProfiles.isEmpty()) throw PatchException("No class prints \"ViewProfile(normalisedNumber=\"")

    // 2. The dispatcher: the (Object)Object invoke that tests for ItemClick and builds a ViewProfile.
    // Collect first: mutating classes while iterating them is not allowed.
    val candidates = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.methods.any { it.isDispatcherOf(itemClick, viewProfiles) }) candidates += classDef
    }
    val dispatcherClass = candidates.singleOrNull()
        ?: throw PatchException("Expected one call log event dispatcher, found ${candidates.map { it.type }}")
    val dispatchers = mutableClassDefBy(dispatcherClass).methods.filter { it.isDispatcherOf(itemClick, viewProfiles) }
    val dispatcher = dispatchers.singleOrNull()
        ?: throw PatchException("${dispatcherClass.type} has ${dispatchers.size} call log event dispatchers, expected one")
    val where = "${dispatcherClass.type}->${dispatcher.name}"

    // 3. The ItemClick case: instance-of ItemClick, then (before the next event type is tested)
    // id = itemClick.id, selection = viewModel.check(id), if-eqz selection -> row lookup, and the
    // ViewProfile construction after that.
    val instructions = dispatcher.instructions.toList()
    val tests = instructions.indices.filter { instructions[it].opcode == Opcode.INSTANCE_OF && instructions[it].type() == itemClick }
    val test = tests.singleOrNull() ?: throw PatchException("$where tests for ItemClick ${tests.size} times, expected once")
    val caseEnd = (test + 1 until instructions.size).firstOrNull { instructions[it].opcode == Opcode.INSTANCE_OF } ?: instructions.size
    val check = (test + 1 until caseEnd).firstOrNull { index ->
        val call = instructions[index].call()
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.definingClass == viewModel &&
            call.returnType == "Z" && call.parameterTypes.map(CharSequence::toString) == listOf(STRING)
    } ?: throw PatchException("$where: the ItemClick case does not call a $viewModel (String)Z selection check")
    val result = instructions.getOrNull(check + 1)
    val branch = instructions.getOrNull(check + 2)
    if (result?.opcode != Opcode.MOVE_RESULT || branch?.opcode != Opcode.IF_EQZ ||
        (result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA
    ) {
        throw PatchException("$where: the selection check result is not branched on right away (${result?.opcode}, ${branch?.opcode})")
    }
    val profile = (check + 3 until caseEnd).firstOrNull {
        instructions[it].opcode == Opcode.NEW_INSTANCE && instructions[it].type() in viewProfiles
    } ?: throw PatchException("$where: the ItemClick case builds no ViewProfile after the selection check")
    if (profile <= check + 3) throw PatchException("$where: ViewProfile is built before the case looks the row up")

    // The check's arguments: the view model (this) and the id, which the case read from the ItemClick.
    val invoke = instructions[check] as FiveRegisterInstruction
    if (invoke.registerCount != 2) throw PatchException("$where: the selection check takes ${invoke.registerCount} registers, expected 2")
    val model = invoke.registerC
    val id = invoke.registerD
    val selection = (result as OneRegisterInstruction).registerA
    val idRead = (test + 1 until check).lastOrNull { instructions[it].writesRegister(id) }
        ?.let { instructions[it] }
    val idField = (idRead as? ReferenceInstruction)?.reference as? FieldReference
    if (idRead?.opcode != Opcode.IGET_OBJECT || idField?.definingClass != itemClick || idField.type != STRING) {
        throw PatchException("$where: the selection check's id (v$id) is not ItemClick's String field")
    }
    if (listOf(model, id, selection).any { it > 15 } || setOf(model, id, selection).size != 3) {
        throw PatchException("$where: registers v$model / v$id / v$selection do not fit a 4-bit invoke")
    }
    dispatcher.requireNoBranchTargetAt(check + 2, "Tap call history to call")

    // 4. Before the branch on the selection result: in selection mode (true) the stock branch runs
    // unchanged. Otherwise, while the feature is on, call (id, false) and jump to the instruction
    // after the branch, the same one the stock case runs when the selection check answers true. The
    // result register is a local the case sets anew (it holds 0, "not selecting", at the stock branch
    // on both paths, as isEnabled answers false when the feature is off).
    val done = dispatcher.getInstruction(check + 3)
    // That instruction must be the case's plain exit (a goto to the shared "handled" return), so the
    // switched-on path cannot run code a later build puts there after placing the call.
    if (done.opcode !in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) {
        throw PatchException("$where: the instruction after the selection branch is ${done.opcode}, not the case's goto exit")
    }
    dispatcher.addInstructionsWithLabelsChecked(
        check + 2,
        """
            if-nez v$selection, :heval_stock
            const-string v$selection, "$FEATURE"
            invoke-static/range { v$selection .. v$selection }, $HEVAL_SETTINGS_CLASS->isEnabled(Ljava/lang/String;)Z
            move-result v$selection
            if-eqz v$selection, :heval_stock
            const/4 v$selection, 0x0
            invoke-virtual { v$model, v$id, v$selection }, $viewModel->${callMethod.name}(${STRING}Z)V
            goto/16 :heval_done
        """,
        ExternalLabel("heval_stock", dispatcher.getInstruction(check + 2)),
        ExternalLabel("heval_done", done),
    )
}

/** An `invoke(Object)Object` method that tests for [itemClick] and builds one of [viewProfiles]. */
private fun Method.isDispatcherOf(itemClick: String, viewProfiles: Set<String>): Boolean {
    if (name != "invoke" || returnType != "Ljava/lang/Object;" || parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;")) {
        return false
    }
    val code = implementation?.instructions ?: return false
    var tested = false
    var builds = false
    for (instruction in code) {
        when (instruction.opcode) {
            Opcode.INSTANCE_OF -> if (instruction.type() == itemClick) tested = true
            Opcode.NEW_INSTANCE -> if (instruction.type() in viewProfiles) builds = true
            else -> {}
        }
    }
    return tested && builds
}

private fun Instruction.type() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}
