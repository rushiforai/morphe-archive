package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HELPER = "Lapp/local/extension/curve/HideFlex;"
private const val SETTINGS = "Lapp/local/extension/curve/PatchSettings;"
private const val CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val SOURCE = "Lcom/curve/wallet/api/model/WalletFundingSource;"
private const val SUCCESS = "Lcom/curve/wallet/api/model/GetWalletFundingSourcesResponse\$Success;"

private fun BytecodePatchContext.uiMethod(
    type: String, name: String, returnType: String, vararg parameters: String
) = Fingerprint(
    definingClass = type, name = name, returnType = returnType,
    parameters = parameters.toList(), isStatic = false
).matchSingle().method

private fun MutableMethod.filterListReturn() {
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    check(returns.isNotEmpty()) { "No list return in $this" }
    for ((index, instruction) in returns.reversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        addInstructions(index, """
            invoke-static/range {v$register .. v$register}, $HELPER->filterItems(Ljava/util/List;)Ljava/util/List;
            move-result-object v$register
        """)
    }
}

private fun MutableMethod.filterFlagReturn() {
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
    check(returns.isNotEmpty()) { "No boolean return in $this" }
    for ((index, instruction) in returns.reversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        addInstructions(index, """
            invoke-static/range {v$register .. v$register}, $HELPER->filterFlag(Z)Z
            move-result v$register
        """)
    }
}

private fun MutableMethod.filterEntryReturn() {
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    check(returns.isNotEmpty()) { "No object return in $this" }
    for ((index, instruction) in returns.reversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        addInstructions(index, """
            invoke-static/range {v$register .. v$register}, $HELPER->filterEntry(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $returnType
        """)
    }
}

private fun MutableMethod.filterFundingSourceResults(expectedCount: Int) {
    val calls = implementation!!.instructions.withIndex().filter {
        val reference = (it.value as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == SUCCESS && reference.name == "getFundingSources" &&
            reference.returnType == "Ljava/util/List;" && reference.parameterTypes.isEmpty()
    }
    check(calls.size == expectedCount) { "Unexpected funding-source reads in $this" }
    for ((index) in calls.reversed()) {
        check(getInstruction(index + 1).opcode == Opcode.MOVE_RESULT_OBJECT)
        val register = getInstruction<OneRegisterInstruction>(index + 1).registerA
        addInstructions(index + 2, """
            invoke-static/range {v$register .. v$register}, $HELPER->filterItems(Ljava/util/List;)Ljava/util/List;
            move-result-object v$register
        """)
    }
}

internal fun BytecodePatchContext.hideFlexUi() {
    for ((type, name) in listOf(
        "Lcom/curve/wallet/banner/ui/BannerState;" to "getInfoBanners",
        "Lcom/curve/launchpad/ui/LaunchpadState\$Loaded\$BannersState;" to "getBanners",
        "Lcom/curve/launchpad/ui/LaunchpadState\$Loaded\$ButtonsState\$Available;" to "getButtons"
    )) uiMethod(type, name, "Ljava/util/List;").filterListReturn()

    // Filter after Launchpad loading so a Flex-only response becomes an empty UI, not a server error.
    uiMethod(
        "Lcom/curve/wallet/header/ui/WalletHeadersViewModel;", "buildHeadersFor", "Ljava/util/List;",
        SOURCE, "Lcom/curve/domain/entity/common/Currency;",
        "Lcom/curve/wallet/api/model/WalletFundingSourceBalance;",
        "Lcom/curve/wallet/api/model/WalletFundingSource\$MonetaryAmount;"
    ).filterListReturn()

    for ((type, name) in listOf(
        "Lcom/curve/settings/ui/main/SettingsMainState\$Settings;" to "getShowPayIn3EntryPoint",
        "Lcom/curve/transactions/list/model/TransactionsListItem\$TransactionItem;" to "getSwipeEnabled"
    )) uiMethod(type, name, "Z").filterFlagReturn()

    // Eligibility also drives the promotional amount subtitle independently of swipe actions.
    Fingerprint(
        definingClass = "Lcom/curve/transactions/list/ui/TransactionListItemMapperKt;",
        name = "amountSubtitle", isStatic = true,
        returnType = "Lcom/curve/transactions/list/model/TransactionsListItem\$TransactionItem\$Amount;",
        parameters = listOf("Lcom/curve/transactions/api/model/Transaction;", "Z")
    ).matchSingle().method.addInstructions(0, """
        invoke-static/range {p1 .. p1}, $HELPER->filterFlag(Z)Z
        move-result p1
    """)

    for ((name, returnType) in listOf(
        "flexRow" to "Lcom/curve/transaction/details/TransactionPresentationDetails\$FlexRow;",
        "payInXRow" to "Lcom/curve/transaction/details/TransactionPresentationDetails\$PayInXRow;"
    )) uiMethod("Lcom/curve/transaction/details/TransactionDetailsMapper;", name, returnType)
        .filterEntryReturn()
    uiMethod(
        "Lcom/curve/transactions/list/ui/TransactionsListState\$Loaded;", "getSwipeHint",
        "Lcom/curve/transactions/list/ui/TransactionsListState\$Loaded\$SwipeHint;"
    ).filterEntryReturn()

    // Keep complete adapter lists: reorder and backup saves must retain hidden IDs.
    val walletRow = uiMethod(
        "Lcom/curve/wallet/list/views/viewholders/WalletListItemViewHolder;", "bind", "V",
        "Lcom/curve/wallet/list/models/WalletListModel;", "Z", "Landroid/view/View\$OnClickListener;"
    )
    check(walletRow.implementation!!.registerCount >= 6)
    walletRow.addInstructions(0, """
        invoke-virtual {p1}, Lcom/curve/wallet/list/models/WalletListModel;->isFlexCard()Z
        move-result v0
        iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
        invoke-static {v1, v0}, $HELPER->bindRow(Landroid/view/View;Z)V
    """)
    uiMethod(
        "Lcom/curve/backup_card/usecase/GetBackupCards;", "mapToValidCard",
        "Lcom/curve/backup_card/model/ValidCard;", SOURCE
    ).addInstructions(0, "invoke-static {p1}, $HELPER->rememberFlexSource(Ljava/lang/Object;)V")
    val backupRow = uiMethod(
        "Lcom/curve/backup_card/ui/adapter/BackupCardItemViewHolder;", "bind", "V",
        "Lcom/curve/backup_card/model/BackupCard;", "Lkotlin/jvm/functions/Function1;", "Z"
    )
    check(backupRow.implementation!!.registerCount >= 6)
    backupRow.addInstructions(0, """
        invoke-static {p1}, $HELPER->isFlexBackup(Ljava/lang/Object;)Z
        move-result v0
        iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
        invoke-static {v1, v0}, $HELPER->bindRow(Landroid/view/View;Z)V
    """)
    uiMethod(
        "Lcom/curve/fundingcard/select/usecase/GetFundingSources;", "invoke", "Ljava/lang/Object;",
        "Lcom/curve/navigation/fundingcard/selectfundingcard/SelectFundingSourceContract\$Params;", CONTINUATION
    ).filterFundingSourceResults(2)

    val quickWallet = uiMethod(
        "Lcom/curve/wallet/tile/CurveQuickAccessWalletService;", "successResponseFor", "Ljava/lang/Object;",
        SUCCESS, "Landroid/service/quickaccesswallet/GetWalletCardsRequest;", CONTINUATION
    )
    val noSelection = quickWallet.implementation!!.instructions.withIndex().filter {
        (it.value as? WideLiteralInstruction)?.wideLiteral == -1L
    }.single()
    val selectionRegister = (noSelection.value as OneRegisterInstruction).registerA
    // Android's selected UI index must remain nonnegative when selected Flex is hidden.
    quickWallet.addInstructions(noSelection.index + 1, """
        invoke-static/range {v$selectionRegister .. v$selectionRegister}, $HELPER->quickWalletFallback(I)I
        move-result v$selectionRegister
    """)
    quickWallet.filterFundingSourceResults(1)

    val menu = Fingerprint(
        definingClass = "Lyk7;", name = "invokeSuspend", returnType = "Ljava/lang/Object;",
        parameters = listOf("Ljava/lang/Object;"), filters = listOf(literal(0x7f0f0001))
    ).matchSingle()
    val menuInstruction = menu.instructionMatches.single()
    val menuRegister = menuInstruction.getInstruction<OneRegisterInstruction>().registerA
    // The existing alternate menu has identical items except the Flex It tab.
    menu.method.addInstructions(menuInstruction.index + 1, """
        invoke-static/range {v$menuRegister .. v$menuRegister}, $HELPER->menuResource(I)I
        move-result v$menuRegister
    """)

    val mainActivity = "Lcom/imaginecurve/curve/main/MainActivity;"
    val navigate = uiMethod(mainActivity, "k", "V", "Lio/uniflow/core/flow/data/UIEvent;")
    check(navigate.implementation!!.registerCount >= 3)
    navigate.addInstructions(0, """
        invoke-static {p1}, $HELPER->isFlexEvent(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :original_navigation
        return-void
        :original_navigation
        nop
    """)
    val selectTab = uiMethod(mainActivity, "m", "V", "Lcom/curve/common/ui/HomeTab;")
    check(selectTab.implementation!!.registerCount >= 3)
    selectTab.addInstructions(0, """
        invoke-static {}, $SETTINGS->isFlexHidden()Z
        move-result v0
        if-eqz v0, :original_tab
        sget-object v0, Lcom/curve/common/ui/HomeTab;->CREDIT:Lcom/curve/common/ui/HomeTab;
        if-ne p1, v0, :original_tab
        return-void
        :original_tab
        nop
    """)
    val openFlex = uiMethod(
        "Lcom/curve/launchpad/ui/LaunchpadViewModel;", "openFlex", "V", "Ljava/util/List;", "Ljava/util/Map;"
    )
    check(openFlex.implementation!!.registerCount >= 4)
    openFlex.addInstructions(0, """
        invoke-static {}, $SETTINGS->isFlexHidden()Z
        move-result v0
        if-eqz v0, :original_open_flex
        return-void
        :original_open_flex
        nop
    """)
}
