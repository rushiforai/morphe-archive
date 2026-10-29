package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import patches.shared.uniqueMatch

private const val SHOW = "${APP}bff/domain/use_cases/screen_visibility/ShowScreenUseCase;"
private const val COROUTINE = "${APP}bff/domain/use_cases/screen_visibility/ShowScreenUseCase\$invoke\$2;"
private const val PRESENTER = "${APP}bff/presentation/content/ScreenPresenterImpl;"
private const val PRESENTER_API = "${APP}bff/domain/ScreenPresenter;"
private const val ENTITY = "${APP}bff/domain/models/screen/ScreenEntity;"
private const val MODEL = "${APP}bff/presentation/models/ScreenPresentationModel;"
private const val CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val ACTION = "${APP}bff/domain/models/actions/Action;"
private const val NAVIGATOR = "${APP}bff/presentation/modal_sheet/ModalSheetNavigator;"
private const val MODAL = "${APP}bff/presentation/modal_sheet/ModalSheetViewModel;"
private const val BY_ID = "${APP}bff/domain/models/screen/ScreenLoadingType\$ById;"
private const val NAV_ACTION = "${APP}bff/domain/models/actions/NavigationAction;"
private const val DISMISS = "${APP}bff/domain/models/actions/NavigationAction\$DismissScreen;"

/** Keep required show acknowledgements/counting; reuse the genuine dismiss route. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun skipOptionalOnboarding() {
    // NU's existing exact() is intentionally left unchanged. New sites explicitly
    // reject zero/multiple descriptor matches before mutating anything.
    val flow = exact(COROUTINE, "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;").uniqueMatch()
    val presenter = exact(PRESENTER, "presentScreen", "Ljava/lang/Object;", ENTITY, CONTINUATION).uniqueMatch()
    exact(ENTITY, "getId", "Ljava/lang/String;").uniqueMatch()
    exact(MODEL, "getCurrentScreenId", "Ljava/lang/String;").uniqueMatch()
    exact(SHOW, "access\$incrementShownCount", "Ljava/lang/Object;", SHOW, CONTINUATION).uniqueMatch()
    val dismiss = exact(DISMISS, "<init>", "V", ACTION, ACTION, "Ljava/util/List;").uniqueMatch()
    val modal = exact(MODAL, "processDismissIntent", "Z").uniqueMatch()
    val navigate = exact(NAVIGATOR, "navigate", "V", NAV_ACTION, "${APP}bff/domain/models/SwipelaneModel;", "${APP}bff/domain/models/actions/BffPresentationMode;", "Lkotlin/jvm/functions/Function1;").uniqueMatch()
    exact(ENTITY, "getBlocks", "Ljava/util/List;").uniqueMatch()
    exact("${APP}bff/domain/models/BlockData;", "getClickAction", ACTION).uniqueMatch()
    exact(BY_ID, "getId", "Ljava/lang/String;").uniqueMatch()
    val nativeDispatch = navigate.method.implementation!!.instructions.withIndex().filter { (_, insn) ->
        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == MODAL && it.name == "processDismissIntent" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        } == true
    }
    check(nativeDispatch.size == 1) { "Expected one NU native modal dismiss dispatch" }
    val nativeArgs = nativeDispatch.single().value as FiveRegisterInstruction
    check(nativeArgs.registerCount == 1 && nativeArgs.registerC == navigate.method.implementation!!.registerCount - 5) { "NU native modal dismiss registers changed" }
    check(flow.classDef.fields.none { it.name == "morpheWelcomeScreenId" } &&
        modal.classDef.fields.none { it.name == "morpheDismissedWelcomeId" } &&
        dismiss.classDef.fields.none { it.name == "morpheWelcomeSourceId" } &&
        flow.classDef.methods.none { it.name.startsWith("morphe") } &&
        presenter.classDef.methods.none { it.name == "morpheClaimWelcome" }) { "NU optional welcome policy already present" }
    val body = flow.method.implementation!!
    check(body.registerCount == 7) { "NU show coroutine register layout changed" }
    fun calls(owner: String, name: String) = body.instructions.withIndex().filter { (_, insn) ->
        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == owner && it.name == name
        } == true
    }
    val present = calls(PRESENTER_API, "presentScreen")
    val count = calls(SHOW, "access\$incrementShownCount")
    val resume = body.instructions.withIndex().filter { (_, insn) ->
        val field = (insn as? ReferenceInstruction)?.reference as? FieldReference
        val registers = insn as? TwoRegisterInstruction
        insn.opcode == Opcode.IGET_OBJECT && field?.definingClass == COROUTINE && field.name == "L\$0" &&
            registers?.registerA == 5 && registers.registerB == 5
    }
    check(present.size == 1 && count.size == 1 && resume.size == 1) { "NU show completion cardinality changed" }
    val presentArgs = present.single().value as FiveRegisterInstruction
    val countArgs = count.single().value as FiveRegisterInstruction
    check(present.single().value.opcode == Opcode.INVOKE_INTERFACE && presentArgs.registerCount == 3 &&
        presentArgs.registerC == 1 && presentArgs.registerD == 6 && presentArgs.registerE == 2 &&
        countArgs.registerCount == 2 && countArgs.registerC == 6 && countArgs.registerD == 2) {
        "NU show completion arguments changed"
    }
    flow.classDef.fields.add(MutableField(ImmutableField(COROUTINE, "morpheWelcomeScreenId", "Ljava/lang/String;", AccessFlags.PRIVATE.value, null, emptySet(), emptySet())))
    modal.classDef.fields.add(MutableField(ImmutableField(MODAL, "morpheDismissedWelcomeId", "Ljava/lang/String;", AccessFlags.PRIVATE.value, null, emptySet(), emptySet())))
    dismiss.classDef.fields.add(MutableField(ImmutableField(DISMISS, "morpheWelcomeSourceId", "Ljava/lang/String;", AccessFlags.PUBLIC.value, null, emptySet(), emptySet())))
    presenter.classDef.methods.add(helper(PRESENTER, "morpheOptionalWelcomeId", "Z", listOf("Ljava/lang/String;"), 2, """
        const-string v0, "eyJ0eXBlIjoiT25ib2FyZGluZ1NjcmVlbiIsImlkIjoiYnJlYWtpbmctbmV3cy1tb2RhbCJ9"
        invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :allow
        const-string v0, "eyJ0eXBlIjoiT25ib2FyZGluZ1NjcmVlbiIsImlkIjoicHJvbW90ZS1sb2dpbi1tb2RhbCJ9"
        invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        :allow
        return v1
    """))
    flow.classDef.methods.add(helper(COROUTINE, "morpheRememberWelcome", "V", listOf(COROUTINE, ENTITY), 4, """
        invoke-virtual {p1}, $ENTITY->getId()Ljava/lang/String;
        move-result-object v0
        iput-object v0, p0, $COROUTINE->morpheWelcomeScreenId:Ljava/lang/String;
        invoke-static {v0}, $PRESENTER->morpheOptionalWelcomeId(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :done
        invoke-virtual {p1}, $ENTITY->getBlocks()Ljava/util/List;
        move-result-object v1
        invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, ${APP}bff/domain/models/BlockData;
        invoke-interface {v2}, ${APP}bff/domain/models/BlockData;->getClickAction()$ACTION
        move-result-object v2
        instance-of v3, v2, $DISMISS
        if-eqz v3, :next
        check-cast v2, $DISMISS
        iput-object v0, v2, $DISMISS->morpheWelcomeSourceId:Ljava/lang/String;
        goto :next
        :done
        return-void
    """))
    presenter.classDef.methods.add(helper(PRESENTER, "morpheClaimWelcome", "Z", listOf(PRESENTER, "Ljava/lang/String;"), 2, """
        invoke-static {p1}, $PRESENTER->morpheOptionalWelcomeId(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :deny
        iget-object v0, p0, $PRESENTER->viewState:$MODEL
        invoke-virtual {v0}, $MODEL->getCurrentScreenId()Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        return v0
        :deny
        const/4 v0, 0x0
        return v0
    """))
    // Source-bind optional manual buttons as well as the automatic action. At
    // native consumption, either ordering can then complete the card only once.
    val dismissCode = """
        monitor-enter p0
        :try_start
        instance-of v0, p1, $DISMISS
        if-eqz v0, :original
        check-cast p1, $DISMISS
        iget-object v1, p1, $DISMISS->morpheWelcomeSourceId:Ljava/lang/String;
        if-eqz v1, :original
        iget-object v2, p0, $MODAL->remainingScreenLoadingTypes:Ljava/util/List;
        invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
        move-result v0
        if-nez v0, :stale
        const/4 v0, 0x0
        invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;
        move-result-object v2
        instance-of v0, v2, $BY_ID
        if-eqz v0, :stale
        check-cast v2, $BY_ID
        invoke-virtual {v2}, $BY_ID->getId()Ljava/lang/String;
        move-result-object v2
        invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :stale
        iget-object v2, p0, $MODAL->morpheDismissedWelcomeId:Ljava/lang/String;
        invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :stale
        iput-object v1, p0, $MODAL->morpheDismissedWelcomeId:Ljava/lang/String;
        :original
        invoke-virtual {p0}, $MODAL->processDismissIntent()Z
        move-result v0
        goto :release
        :stale
        const/4 v0, 0x1
        :try_end
        :release
        monitor-exit p0
        return v0
        :dismiss_error
        move-exception v0
        monitor-exit p0
        throw v0
    """.trimIndent()
    val guardedDismiss = helper(MODAL, "morpheDismissWelcomeIfCurrent", "Z", listOf(MODAL, NAV_ACTION), 3, dismissCode)
    fun labelIndex(name: String) = dismissCode.lineSequence().takeWhile { it.trim() != name }
        .count { it.isNotBlank() && !it.trim().startsWith(":") }
    guardedDismiss.implementation!!.apply {
        addCatch(newLabelForIndex(labelIndex(":try_start")), newLabelForIndex(labelIndex(":try_end")), newLabelForIndex(labelIndex(":dismiss_error")))
    }
    modal.classDef.methods.add(guardedDismiss)
    navigate.method.replaceInstruction(nativeDispatch.single().index, "invoke-static {p0, p1}, $MODAL->morpheDismissWelcomeIfCurrent($MODAL$NAV_ACTION)Z")
    flow.classDef.methods.add(helper(COROUTINE, "morpheFinishWelcome", "V", listOf(CONTINUATION, "Ljava/lang/Object;", "Ljava/lang/Object;"), 3, """
        if-eq p1, p2, :keep
        invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
        check-cast p0, $COROUTINE
        iget-object v0, p0, $COROUTINE->${'$'}presenter:$PRESENTER_API
        instance-of v1, v0, $PRESENTER
        if-eqz v1, :keep
        check-cast v0, $PRESENTER
        iget-object v1, p0, $COROUTINE->morpheWelcomeScreenId:Ljava/lang/String;
        invoke-static {v0, v1}, $PRESENTER->morpheClaimWelcome(${PRESENTER}Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :keep
        new-instance v0, $DISMISS
        const/4 v1, 0x0
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v2
        invoke-direct {v0, v1, v1, v2}, $DISMISS-><init>($ACTION${ACTION}Ljava/util/List;)V
        iget-object v2, p0, $COROUTINE->morpheWelcomeScreenId:Ljava/lang/String;
        iput-object v2, v0, $DISMISS->morpheWelcomeSourceId:Ljava/lang/String;
        iget-object v1, p0, $COROUTINE->${'$'}intentProcessor:Lkotlin/jvm/functions/Function1;
        invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
        :keep
        return-void
    """))
    flow.classDef.methods.add(helper(COROUTINE, "morpheCountAndComplete", "Ljava/lang/Object;", listOf(SHOW, CONTINUATION), 2, """
        invoke-static {p0, p1}, $SHOW->access${'$'}incrementShownCount($SHOW$CONTINUATION)Ljava/lang/Object;
        move-result-object v0
        invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;
        move-result-object v1
        invoke-static {p1, v0, v1}, $COROUTINE->morpheFinishWelcome(${CONTINUATION}Ljava/lang/Object;Ljava/lang/Object;)V
        return-object v0
    """))
    // Replace the original node first, then append its body. Incoming labels
    // remain on the policy prelude, including the label-7 coroutine resume.
    data class Edit(val index: Int, val first: String, val rest: String?)
    listOf(
        Edit(present.single().index, "invoke-static {p0, p1}, $COROUTINE->morpheRememberWelcome($COROUTINE$ENTITY)V", "invoke-interface {v1, p1, v2}, $PRESENTER_API->presentScreen($ENTITY$CONTINUATION)Ljava/lang/Object;"),
        Edit(count.single().index, "invoke-static {p1, v2}, $COROUTINE->morpheCountAndComplete($SHOW$CONTINUATION)Ljava/lang/Object;", null),
        Edit(resume.single().index, "invoke-static {p0, p1, v0}, $COROUTINE->morpheFinishWelcome(${CONTINUATION}Ljava/lang/Object;Ljava/lang/Object;)V", "iget-object p0, p0, $COROUTINE->L${'$'}0:Ljava/lang/Object;"),
    ).sortedByDescending { it.index }.forEach { edit ->
        flow.method.replaceInstruction(edit.index, edit.first)
        edit.rest?.let { flow.method.addInstructions(edit.index + 1, it) }
    }
}
