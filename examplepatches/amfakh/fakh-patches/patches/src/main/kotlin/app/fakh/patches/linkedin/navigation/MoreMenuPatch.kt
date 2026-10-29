package app.fakh.patches.linkedin.navigation

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/MoreMenu;"

/** HomeNavTabsManager.getHomeNavTabs(): the tabs of the bottom bar. */
private object HomeNavTabsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/HomeNavTabsManager;",
    name = "getHomeNavTabs",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

/**
 * The HomeNavPanelFeature lambda that builds the list at the bottom of the Me panel: a divider put first, then
 * "Settings & Privacy" and the Premium row.
 */
private object NavPanelFooterFingerprint : Fingerprint(
    name = "invoke",
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelAggregateResponse;",
            name = "upsellSlotContent",
        ),
        methodCall(definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelDividerViewData;", name = "<init>"),
        methodCall(name = "addItem"),
    )
)

/** HomeNavPanelSectionV2Presenter.onBind(ViewDataBinding): sets the section's click listener. */
private object NavPanelSectionBindFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/navpanel/presenter/HomeNavPanelSectionV2Presenter;",
    name = "onBind",
    returnType = "V",
    parameters = listOf("Landroidx/databinding/ViewDataBinding;"),
)

@Suppress("unused")
val moreMenuPatch = bytecodePatch(
    name = "More tab",
    description = "Lets you hide items of the More tab (Puzzle games, Groups, Events, Newsletters), or move them " +
        "to the bottom of the profile menu and remove the tab.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    // The More screen's items are read and hidden as they pass through the SDUI filter.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isMoreMenuIncluded")

        // Each return is replaced in place (rather than code inserted before it) because branches
        // may jump straight to the return instruction and would skip inserted code.
        HomeNavTabsFingerprint.method.wrapReturns(
            "$EXTENSION_CLASS->filterTabs(Ljava/util/List;)Ljava/util/List;"
        )

        // Right after the divider goes into the footer list, so the items are added above it.
        NavPanelFooterFingerprint.let {
            val index = it.instructionMatches.last().index
            val list = it.method.getInstruction<FiveRegisterInstruction>(index).registerC
            it.method.addInstruction(
                index + 1,
                "invoke-static { v$list }, $EXTENSION_CLASS->addToFooter(Ljava/lang/Object;)V"
            )
        }

        // Point the items' clicks at their pages, after the presenter sets its own listener.
        NavPanelSectionBindFingerprint.method.apply {
            returnIndices(Opcode.RETURN_VOID).forEach { index ->
                replaceInstruction(
                    index,
                    "invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->onSectionBind(Ljava/lang/Object;Ljava/lang/Object;)V"
                )
                addInstruction(index + 1, "return-void")
            }
        }
    }
}

/** Passes the value of every return-object through the static extension method. */
private fun MutableMethod.wrapReturns(method: String) {
    returnIndices(Opcode.RETURN_OBJECT).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        replaceInstruction(index, "invoke-static/range { v$register .. v$register }, $method")
        addInstructions(
            index + 1,
            """
                move-result-object v$register
                return-object v$register
            """
        )
    }
}

/** Indices of all instructions with the opcode, last first so edits keep earlier indices valid. */
private fun MutableMethod.returnIndices(opcode: Opcode) =
    implementation!!.instructions.withIndex().filter { it.value.opcode == opcode }.map { it.index }.reversed()
