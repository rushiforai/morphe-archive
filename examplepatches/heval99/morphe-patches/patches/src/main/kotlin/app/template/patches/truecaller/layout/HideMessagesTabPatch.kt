package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.addHevalStockPath
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CALLS = "$BOTTOM_BAR_BUTTON_TYPE->CALLS:$BOTTOM_BAR_BUTTON_TYPE"
private const val MESSAGES = "$BOTTOM_BAR_BUTTON_TYPE->MESSAGES:$BOTTOM_BAR_BUTTON_TYPE"
private const val SHOW_BAR_HELPER = "morpheShowBottomBarWithTwoTabs"
private const val SAVED_MIN_HEIGHT = "morpheSavedMinHeight"
private const val FEATURE = "truecaller.hide_messages_tab"

// A Heval Controls feature: every site below (the tab helper, the default tab, the tab switch and
// the bar helper) runs its patched code only while it is on, and stock code while it is off. The
// bottom bar is built at launch, hence the restart.
@Suppress("unused")
val hideMessagesTabPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide Messages tab",
        description = "Hides the Messages tab from the bottom navigation bar.",
        category = TruecallerControlsCategory.TABS,
        restartRequired = true,
    ),
    default = false,
) {
    // 1. Remove the tab.
    hideBottomBarTabs("MESSAGES", featureId = FEATURE)

    // 2. The default tab is always Calls, also when the user had made Messages the default
    // (long press on the tab). Otherwise the back button keeps "returning" to the missing
    // Messages tab instead of leaving the app.
    DefaultTabFingerprint.method.addHevalGate(FEATURE) { v ->
        """
            sget-object $v, $CALLS
            return-object $v
        """
    }

    // 3. Every programmatic switch to Messages (launch tab, SMS notifications and deep links
    // that open the inbox, then stack the conversation on top) selects Calls instead. Left
    // alone, selecting the missing tab on a fresh start would leave the screen empty.
    // The gate's v0 is a local: the method has registers besides this, the type and the flag.
    SelectTabFingerprint.method.addHevalGate(FEATURE) { v ->
        """
            sget-object $v, $MESSAGES
            if-ne p1, $v, :heval_stock
            sget-object p1, $CALLS
        """
    }

    // 4. BottomBarView needs two tabs: with fewer it keeps an empty bar. A new helper collapses
    // the bar in that case (only Calls left, e.g. with every other tab patch) and restores it
    // otherwise. It is called right where the builder casts its bar to BottomBarView, with the
    // final tab list. The bar is not set GONE: TruecallerInit draws edge to edge, and the bar
    // (Material BottomNavigationView) is the only view that pads for the navigation bar inset.
    // The content area, with the Calls pill and dial pad FAB, ends at the bar's top (a layout
    // barrier), so a GONE bar left them behind the 3-button navigation bar (issue #61).
    // Collapsing keeps the bar's own inset listener: its tab menu (its only child) goes GONE
    // and its minimum height (from its style) drops to 0, leaving just the inset padding as its height. The
    // minimum height is saved in a new field (null while the bar is not collapsed). While the
    // feature is off the helper returns at once (stock), unless this process collapsed the bar
    // earlier: then it runs, and with the Messages tab back it restores the bar.
    mutableClassDefBy(BOTTOM_BAR_VIEW).fields.add(
        ImmutableField(BOTTOM_BAR_VIEW, SAVED_MIN_HEIGHT, "Ljava/lang/Integer;", AccessFlags.PUBLIC.value, null, null, null)
            .toMutable(),
    )
    val builder = BottomBarTabsFingerprint.method
    val builderClass = BottomBarTabsFingerprint.classDef
    val instructions = builder.instructions
    val take = instructions.indices.singleOrNull { index ->
        val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode == Opcode.INVOKE_STATIC && call?.definingClass == "Lkotlin/collections/CollectionsKt;" &&
            call.returnType == "Ljava/util/List;" &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Iterable;", "I")
    } ?: throw PatchException("${builderClass.type}->${builder.name} has no single take(Iterable, I) call")
    val listResult = instructions.getOrNull(take + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
        ?: throw PatchException("${builderClass.type}->${builder.name} does not keep the tab list")
    val listRegister = (listResult as OneRegisterInstruction).registerA
    val cast = (take + 2 until instructions.size).firstOrNull { index ->
        instructions[index].opcode == Opcode.CHECK_CAST &&
            ((instructions[index] as ReferenceInstruction).reference as TypeReference).type == BOTTOM_BAR_VIEW
    } ?: throw PatchException("${builderClass.type}->${builder.name} does not cast to $BOTTOM_BAR_VIEW")
    val barRegister = (instructions[cast] as OneRegisterInstruction).registerA
    val listOverwritten = (take + 2 until cast).any { index ->
        instructions[index].opcode.setsRegister() && (instructions[index] as? OneRegisterInstruction)?.registerA == listRegister
    }
    if (listOverwritten || barRegister == listRegister) {
        throw PatchException("${builderClass.type}->${builder.name} no longer holds the tab list at the BottomBarView cast")
    }
    if (barRegister > 15 || listRegister > 15) throw PatchException("Bottom bar registers are out of invoke range")

    builderClass.methods.add(
        ImmutableMethod(
            builderClass.type,
            SHOW_BAR_HELPER,
            listOf(
                ImmutableMethodParameter(BOTTOM_BAR_VIEW, null, null),
                ImmutableMethodParameter("Ljava/util/List;", null, null),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructionsWithLabelsChecked(
                0,
                """
                    const/4 v0, 0x0
                    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                    iget-object v1, p0, $BOTTOM_BAR_VIEW->$SAVED_MIN_HEIGHT:Ljava/lang/Integer;
                    invoke-interface {p1}, Ljava/util/List;->size()I
                    move-result v2
                    const/4 v3, 0x2
                    if-lt v2, v3, :collapse
                    if-eqz v1, :done
                    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
                    move-result v2
                    invoke-virtual {p0, v2}, Landroid/view/View;->setMinimumHeight(I)V
                    const/4 v1, 0x0
                    iput-object v1, p0, $BOTTOM_BAR_VIEW->$SAVED_MIN_HEIGHT:Ljava/lang/Integer;
                    goto :children
                    :collapse
                    if-nez v1, :hide_children
                    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I
                    move-result v2
                    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v1
                    iput-object v1, p0, $BOTTOM_BAR_VIEW->$SAVED_MIN_HEIGHT:Ljava/lang/Integer;
                    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V
                    :hide_children
                    const/16 v0, 0x8
                    :children
                    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
                    move-result v2
                    const/4 v3, 0x0
                    :loop
                    if-ge v3, v2, :done
                    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
                    move-result-object v1
                    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
                    add-int/lit8 v3, v3, 0x1
                    goto :loop
                    :done
                    return-void
                """,
            )
            // v0 is a local (p0 = v4); nothing is live at the helper's entry.
            addHevalStockPath(FEATURE) { v ->
                """
                    iget-object $v, p0, $BOTTOM_BAR_VIEW->$SAVED_MIN_HEIGHT:Ljava/lang/Integer;
                    if-nez $v, :heval_stock
                    return-void
                """
            }
        },
    )
    builder.addInstructionsChecked(
        cast + 1,
        "invoke-static {v$barRegister, v$listRegister}, ${builderClass.type}->$SHOW_BAR_HELPER(${BOTTOM_BAR_VIEW}Ljava/util/List;)V",
    )
}
