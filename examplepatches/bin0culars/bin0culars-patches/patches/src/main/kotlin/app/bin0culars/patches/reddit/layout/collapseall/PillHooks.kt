package app.bin0culars.patches.reddit.layout.collapseall

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun wasLastSetByCommentSlot(
    method: MutableMethod,
    invokeIndex: Int,
    slotReg: Int,
    commentSlotField: FieldReference,
): Boolean {
    val start = maxOf(0, invokeIndex - 8)
    return (start until invokeIndex).any { i ->
        val instr = method.instructions[i]
        val isSget = instr.opcode == Opcode.SGET_OBJECT
        val regMatches = (instr as? OneRegisterInstruction)?.registerA == slotReg
        val fieldRef = (instr as? ReferenceInstruction)?.reference as? FieldReference
        val fieldMatches = fieldRef?.definingClass == commentSlotField.definingClass &&
            fieldRef?.name == commentSlotField.name
        isSget && regMatches && fieldMatches
    }
}

internal fun findCommentSlotField(): FieldReference {
    val clinitMethod = ActionBarButtonsFingerprint.method
    val buttonStringIndex = ActionBarButtonsFingerprint.instructionMatches.first().index
    return clinitMethod.instructions
        .drop(buttonStringIndex + 1)
        .firstOrNull { it.opcode == Opcode.SPUT_OBJECT }
        ?.let { (it as? ReferenceInstruction)?.reference as? FieldReference }
        ?: throw PatchException("Could not find sput-object after 'actionBar_comment_button'")
}

internal fun findPillMethod(pillClass: MutableClass, slotField: FieldReference): MutableMethod {
    val pillMethods = pillClass.methods.filter { method ->
        (method.accessFlags and AccessFlags.STATIC.value) != 0 &&
            method.returnType == "V" &&
            method.parameterTypes.size == 8 &&
            method.parameterTypes[3].toString() == slotField.type
    }
    if (pillMethods.size != 1) {
        throw PatchException("Expected exactly one pillMethod, found ${pillMethods.size}")
    }
    return pillMethods.first()
}

private fun isHookedSite(
    method: MutableMethod,
    index: Int,
    pillMethod: MutableMethod,
    slotField: FieldReference,
): Boolean {
    val instr = method.instructions[index]
    val isInvoke = instr.opcode == Opcode.INVOKE_STATIC || instr.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
    val matchesMethod = isInvoke && ref?.definingClass == pillMethod.definingClass && ref?.name == pillMethod.name
    val registers = instr.registersUsed
    return matchesMethod && registers.size >= 4 && wasLastSetByCommentSlot(method, index, registers[3], slotField)
}

internal fun findHookedSites(
    pillClass: MutableClass,
    pillMethod: MutableMethod,
    slotField: FieldReference,
): MutableMap<MutableMethod, MutableList<Int>> =
    pillClass.methods.asSequence()
        .mapNotNull { method ->
            val sites = method.instructions.indices
                .filter { i -> isHookedSite(method, i, pillMethod, slotField) }
                .toMutableList()
            if (sites.isNotEmpty()) method to sites else null
        }
        .toMap()
        .toMutableMap()

private fun pillSmaliFor(instr: Instruction): String =
    if (instr.opcode == Opcode.INVOKE_STATIC_RANGE) {
        val start = instr.registersUsed.first()
        val end = instr.registersUsed.last()
        "invoke-static/range { v$start .. v$end }, $EXTENSION_CLASS->drawCollapsePill(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V"
    } else {
        val regList = instr.registersUsed.joinToString(", ") { "v$it" }
        "invoke-static { $regList }, $EXTENSION_CLASS->drawCollapsePill(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V"
    }

private fun insertPillCalls(hookedSitesByMethod: Map<MutableMethod, List<Int>>) {
    for ((method, indices) in hookedSitesByMethod) {
        for (index in indices.reversed()) {
            method.addInstructions(index + 1, pillSmaliFor(method.instructions[index]))
        }
    }
}

internal fun hookComposerGroupsAndPills(
    pillClass: MutableClass,
    pillMethod: MutableMethod,
    hookedSitesByMethod: MutableMap<MutableMethod, MutableList<Int>>,
) {
    val firstEntry = hookedSitesByMethod.entries.first()
    val composerGroups = findComposerGroupNames(firstEntry.key, firstEntry.value.first())

    val pillOwnerName = pillClass.type.removePrefix("L").removeSuffix(";").replace('/', '.')
    fillPlaceholder("startGroupName", composerGroups.startGroupName)
    fillPlaceholder("endGroupName", composerGroups.endGroupName)
    fillPlaceholder("pillOwner", pillOwnerName)
    fillPlaceholder("pillName", pillMethod.name)

    insertPillCalls(hookedSitesByMethod)
}
