package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.addHevalStockPath
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * The call that returns the finished tab list in the bottom bar builder, and the register that
 * holds the list right after it (searched in the current code, since another tab patch may already
 * have inserted its own call after it).
 */
internal class TabListCall(val resultIndex: Int, val listRegister: Int, val itemGetter: MethodReference)

internal fun BytecodePatchContext.findTabListCall(): TabListCall {
    val builder = BottomBarTabsFingerprint.method
    val builderClass = BottomBarTabsFingerprint.classDef
    val instructions = builder.instructions
    val callIndex = instructions.indices.singleOrNull { index ->
        val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        (instructions[index].opcode == Opcode.INVOKE_VIRTUAL || instructions[index].opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            call?.returnType == "Ljava/util/List;" &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Z", FAMILY_MEMBER_ROLE, "I", "I", "I", "Z")
    } ?: throw PatchException("${builderClass.type}->${builder.name} has no single tab list call")
    val moveResult = instructions.getOrNull(callIndex + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
        ?: throw PatchException("${builderClass.type}->${builder.name} does not keep the tab list")
    val register = (moveResult as OneRegisterInstruction).registerA
    if (register > 15) throw PatchException("The tab list register is out of invoke range")
    // The tab item getter: the builder reads each tab's type through it (the no-argument call
    // returning BottomBarButtonType on the tab item base class).
    val getter = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter {
            it.returnType == BOTTOM_BAR_BUTTON_TYPE && it.parameterTypes.isEmpty() &&
                it.definingClass != BOTTOM_BAR_BUTTON_TYPE
        }
        .distinctBy { "${it.definingClass}->${it.name}" }
        .singleOrNull() ?: throw PatchException("${builderClass.type}->${builder.name} has no single tab type getter")
    return TabListCall(callIndex + 1, register, getter)
}

/**
 * Removes the bottom bar tabs whose BottomBarButtonType is one of [types]. A new static helper on
 * the builder class returns a copy of the finished tab list without those tabs, and replaces the
 * list right after the builder gets it from the tab assembler, so the remaining tabs move up. (Up to
 * 26.43.5 the helper nulled entries of the tab array before filterNotNull; the assembler now takes
 * the first five tabs itself, so a hidden tab no longer lets a sixth one move up.)
 * Calls is never removed: it is the tab the app falls back to. Only "Hide Messages tab" can leave
 * fewer than the two tabs BottomBarView requires, and it handles that case itself. Each call adds
 * its own helper, so tab patches work together in any order.
 *
 * With a Heval Controls [featureId], the helper starts with a gate that returns the list unchanged
 * (every tab kept, as in stock) while that feature is off. The gate is in this call's helper only,
 * so other tab patches are not switched with it.
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
    val listCall = findTabListCall()
    val item = listCall.itemGetter
    val itemClass = classDefBy(item.definingClass)
    val invoke = if (AccessFlags.INTERFACE.isSet(itemClass.accessFlags)) "invoke-interface" else "invoke-virtual"

    val helperName = "morpheHideTabs_${types.joinToString("_")}"
    val helper = ImmutableMethod(
        builderClass.type,
        helperName,
        listOf(ImmutableMethodParameter("Ljava/util/List;", null, null)),
        "Ljava/util/List;",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(6),
    ).toMutable().apply {
        addInstructionsWithLabelsChecked(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v1
                :loop
                invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
                move-result v2
                if-eqz v2, :done
                invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v2
                check-cast v2, ${itemClass.type}
                $invoke {v2}, ${itemClass.type}->${item.name}()$BOTTOM_BAR_BUTTON_TYPE
                move-result-object v3
            """ + types.joinToString("\n") { type ->
                """
                    sget-object v4, $BOTTOM_BAR_BUTTON_TYPE->$type:$BOTTOM_BAR_BUTTON_TYPE
                    if-eq v3, v4, :loop
                """
            } + """
                invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                goto :loop
                :done
                return-object v0
            """,
        )
        // v0 is a local (p0 = v5); nothing is live at the helper's entry.
        if (featureId != null) addHevalStockPath(featureId) { "return-object p0" }
    }
    builderClass.methods.add(helper)

    val register = listCall.listRegister
    builder.addInstructionsChecked(
        listCall.resultIndex + 1,
        """
            invoke-static {v$register}, ${builderClass.type}->$helperName(Ljava/util/List;)Ljava/util/List;
            move-result-object v$register
        """,
    )
}
