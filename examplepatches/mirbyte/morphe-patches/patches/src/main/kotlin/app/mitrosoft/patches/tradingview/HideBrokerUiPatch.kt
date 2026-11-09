package app.mitrosoft.patches.tradingview

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val DISCONNECTED_CLASS =
    "Lcom/tradingview/tradingviewapp/feature/chart/model/TradingButtonState\$Disconnected;"
private const val DISABLED_SGET =
    "sget-object v%d, Lcom/tradingview/tradingviewapp/feature/chart/model/TradingButtonState\$Disabled;->INSTANCE:Lcom/tradingview/tradingviewapp/feature/chart/model/TradingButtonState\$Disabled;"
private const val NATIVE_PANEL =
    "Lcom/tradingview/tradingviewapp/feature/chart/impl/module/chart/presenter/nativepanel/"

private val disconnectedStateClasses = listOf(
    "Lcom/tradingview/tradingviewapp/sheet/more/state/MoreChartPanelViewStateImpl;",
    "Lcom/tradingview/tradingviewapp/sheet/more/state/MoreChartPanelProviderImpl;",
    "Lcom/tradingview/tradingviewapp/feature/chart/impl/module/chart/presenter/nativepanel/delegates/ChartBrokerTradingDelegateImpl;",
    "Lcom/tradingview/tradingviewapp/feature/chart/impl/module/chart/presenter/nativepanel/delegates/ChartBrokerTradingDelegateImpl\$requestConnectionStatus\$1;",
    "Lcom/tradingview/tradingviewapp/feature/chart/impl/module/chart/presenter/nativepanel/ChartNativePanelRegularModeViewState;",
    "Lcom/tradingview/tradingviewapp/feature/chart/impl/module/chart/presenter/nativepanel/ChartNativePanelPresentationItemType\$Trading;",
)

@Suppress("unused")
val hideBrokerUiPatch = bytecodePatch(
    name = "Hide broker UI",
    description = "Hides broker entry points: the Explore Brokers block, the brokers banner and have-account prompt, the More menu's Trade with your broker button, and the trading and up/down arrows buttons below the chart.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        MarketUIBlockFingerprint.method.apply {
            // Mirrors the existing non-Content branch: listOfNotNull(null) is an empty list.
            addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    invoke-static { p0 }, Lkotlin/collections/CollectionsKt;->listOfNotNull(Ljava/lang/Object;)Ljava/util/List;
                    move-result-object p0
                    return-object p0
                """
            )
        }

        BrokersShouldShowHaveAccountFingerprint.method.returnEarly(false)
        BrokersWasBannerClosedFingerprint.method.returnEarly(true)

        TradingButtonBindTradingStateFingerprint.method.apply {
            val registers = getFreeRegisterProvider(0, 2)
            val visibilityRegister = registers.getFreeRegister4Bit()
            val viewRegister = registers.getFreeRegister4Bit()

            addInstructions(
                0,
                """
                    const/16 v$visibilityRegister, 0x8

                    iget-object v$viewRegister, p0, Lcom/tradingview/tradingviewapp/sheet/more/view/TradingButtonView;->connectBroker:Lcom/tradingview/tradingviewapp/core/view/ContentViewRef;
                    invoke-virtual { v$viewRegister }, Lcom/tradingview/tradingviewapp/core/view/ContentViewRef;->getNullableView()Landroid/view/View;
                    move-result-object v$viewRegister
                    if-eqz v$viewRegister, :skip_broker
                    check-cast v$viewRegister, Lcom/tradingview/tradingviewapp/sheet/more/view/BikiniButtonTradingView;
                    invoke-virtual { v$viewRegister, v$visibilityRegister }, Landroid/view/View;->setVisibility(I)V
                    :skip_broker

                    iget-object v$viewRegister, p0, Lcom/tradingview/tradingviewapp/sheet/more/view/TradingButtonView;->connectBrokerSkeleton:Lcom/tradingview/tradingviewapp/core/view/ContentViewRef;
                    invoke-virtual { v$viewRegister }, Lcom/tradingview/tradingviewapp/core/view/ContentViewRef;->getNullableView()Landroid/view/View;
                    move-result-object v$viewRegister
                    if-eqz v$viewRegister, :skip_skeleton
                    check-cast v$viewRegister, Landroid/widget/FrameLayout;
                    invoke-virtual { v$viewRegister, v$visibilityRegister }, Landroid/view/View;->setVisibility(I)V
                    :skip_skeleton

                    return-void
                """
            )
        }

        // Rewrites every Disconnected sget to Disabled by inserting a Disabled sget right after it,
        // which overwrites the same register before any use.
        disconnectedStateClasses.forEach { descriptor ->
            mutableClassDefBy(descriptor).methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                instructions.withIndex()
                    .filter { (_, instruction) ->
                        instruction.opcode == Opcode.SGET_OBJECT &&
                            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                                ?.let { it.definingClass == DISCONNECTED_CLASS && it.name == "INSTANCE" } == true
                    }
                    .map { it.index to (it.value as OneRegisterInstruction).registerA }
                    .asReversed()
                    .forEach { (index, register) ->
                        method.addInstructions(index + 1, DISABLED_SGET.format(register))
                    }
            }
        }

        // Trading and OrderPanel items report invisible. Other item types keep the original flag.
        ChartNativePanelButtonIsVisibleFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, ${NATIVE_PANEL}ChartNativePanelPresentationButtonItem;->type:${NATIVE_PANEL}ChartNativePanelPresentationItemType;
                instance-of v0, v0, ${NATIVE_PANEL}ChartNativePanelPresentationItemType${'$'}Trading;
                if-nez v0, :hidden
                iget-object v0, p0, ${NATIVE_PANEL}ChartNativePanelPresentationButtonItem;->type:${NATIVE_PANEL}ChartNativePanelPresentationItemType;
                instance-of v0, v0, ${NATIVE_PANEL}ChartNativePanelPresentationItemType${'$'}OrderPanel;
                if-eqz v0, :visible
                :hidden
                const/4 v0, 0x0
                return v0
                :visible
            """
        )
    }
}
