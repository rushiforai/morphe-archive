package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.addHevalStockPath
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Removes the bottom bar tabs whose BottomBarButtonType is one of [types]. A new static helper on
 * the builder class nulls those entries of the tab array right before the builder's
 * filterNotNull, so the remaining tabs move up exactly as when Truecaller leaves a slot empty.
 * Calls is never removed: it is the tab the app falls back to. Only "Hide Messages tab" can leave
 * fewer than the two tabs BottomBarView requires, and it handles that case itself. Each call adds
 * its own helper, so tab patches work together in any order.
 *
 * With a Heval Controls [featureId], the helper starts with a gate that returns at once (every tab
 * kept, as in stock) while that feature is off. The gate is in this call's helper only, so other
 * tab patches are not switched with it.
 */
internal fun BytecodePatchContext.hideBottomBarTabs(vararg types: String, featureId: String? = null) {
    if ("CALLS" in types) throw PatchException("The Calls tab must stay")
    val buttonType = classDefBy(BOTTOM_BAR_BUTTON_TYPE)
    for (type in types) {
        if (buttonType.staticFields.none { it.name == type && it.type == BOTTOM_BAR_BUTTON_TYPE }) {
            throw PatchException("$BOTTOM_BAR_BUTTON_TYPE has no $type")
        }
    }

    val builder = BottomBarTabsFingerprint.method
    val builderClass = BottomBarTabsFingerprint.classDef

    // The filterNotNull call and the tab array it receives (searched in the current code, since
    // another tab patch may already have inserted its call).
    val instructions = builder.instructions
    val filterIndex = instructions.indices.singleOrNull { index ->
        val instruction = instructions[index]
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            call?.returnType == "Ljava/util/List;" &&
            call.parameterTypes.map(CharSequence::toString) == listOf("[Ljava/lang/Object;")
    } ?: throw PatchException("${builderClass.type}->${builder.name} has no single filterNotNull call")
    val arrayRegister = when (val call = instructions[filterIndex]) {
        is FiveRegisterInstruction -> call.registerC
        is RegisterRangeInstruction -> call.startRegister
        else -> throw PatchException("Unexpected filterNotNull call format")
    }
    val newArray = instructions.take(filterIndex).lastOrNull {
        it.opcode == Opcode.NEW_ARRAY && (it as TwoRegisterInstruction).registerA == arrayRegister
    } ?: throw PatchException("${builderClass.type}->${builder.name} does not build the tab array in v$arrayRegister")
    val arrayType = ((newArray as ReferenceInstruction).reference as TypeReference).type
    val itemClass = classDefBy(arrayType.removePrefix("["))
    val getter = itemClass.methods.singleOrNull {
        it.returnType == BOTTOM_BAR_BUTTON_TYPE && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: throw PatchException("${itemClass.type} has no single BottomBarButtonType getter")
    val invoke = if (AccessFlags.INTERFACE.isSet(itemClass.accessFlags)) "invoke-interface" else "invoke-virtual"

    val helperName = "morpheHideTabs_${types.joinToString("_")}"
    val helper = ImmutableMethod(
        builderClass.type,
        helperName,
        listOf(ImmutableMethodParameter(arrayType, null, null)),
        "V",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(5),
    ).toMutable().apply {
        addInstructionsWithLabelsChecked(
            0,
            """
                array-length v0, p0
                const/4 v1, 0x0
                :loop
                if-ge v1, v0, :done
                aget-object v2, p0, v1
                if-eqz v2, :next
                $invoke {v2}, ${itemClass.type}->${getter.name}()$BOTTOM_BAR_BUTTON_TYPE
                move-result-object v2
            """ + types.joinToString("\n") { type ->
                """
                    sget-object v3, $BOTTOM_BAR_BUTTON_TYPE->$type:$BOTTOM_BAR_BUTTON_TYPE
                    if-eq v2, v3, :hide
                """
            } + """
                goto :next
                :hide
                const/4 v2, 0x0
                aput-object v2, p0, v1
                :next
                add-int/lit8 v1, v1, 0x1
                goto :loop
                :done
                return-void
            """,
        )
        // v0 is a local (p0 = v4); nothing is live at the helper's entry.
        if (featureId != null) addHevalStockPath(featureId) { "return-void" }
    }
    builderClass.methods.add(helper)

    builder.addInstructionsAtControlFlowLabel(
        filterIndex,
        "invoke-static/range {v$arrayRegister .. v$arrayRegister}, ${builderClass.type}->$helperName($arrayType)V",
    )
}
