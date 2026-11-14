package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val DETAILS = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmExtraDetailsFragment;"
private const val MODEL = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmViewModel;"
private const val BINDING = "Lcom/letterboxd/letterboxd/databinding/FragmentFilmExtraDetailsBinding;"
private const val TABS = "Lcom/google/android/material/tabs/TabLayout;"
private const val TAB = "Lcom/google/android/material/tabs/TabLayout\$Tab;"
private const val TRIVIA = "Lapp/template/extension/trivia/ImdbTrivia;"

private const val TRIM_TABS = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmExtraDetailsFragment\$onViewCreated\$5;"

private val triviaDetailsView = Fingerprint(
    definingClass = DETAILS,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)
private val triviaTrimTabs = Fingerprint(
    definingClass = TRIM_TABS,
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)
private val triviaSelectTab = Fingerprint(
    definingClass = DETAILS,
    name = "selectTab",
    returnType = "V",
    parameters = listOf(TAB),
)

@Suppress("unused")
val imdbTriviaPatch = bytecodePatch(
    name = "IMDb trivia (personal)",
    description = "Shows categorized IMDb trivia for the current film. Enable only for authorized personal use.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Letterboxd",
            packageName = "com.letterboxd.letterboxd",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xFF8000,
            targets = listOf(AppTarget(version = "3.6.7")),
        ),
    )
    dependsOn(modSettingsPatch)
    execute {
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(0, "invoke-static {}, $TRIVIA->markAvailable()V")

        // After process recreation the restored child, rather than the new ViewModel, remembers Trivia.
        triviaDetailsView.method.addInstructionsWithLabels(0, """
            invoke-static { p0, p2 }, $TRIVIA->shouldRestoreTab(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;)Z
            move-result v0
            if-eqz v0, :native_init
            invoke-direct { p0 }, $DETAILS->getModel()$MODEL
            move-result-object v0
            const v1, 0x7fffffff
            invoke-virtual { v0, v1 }, $MODEL->setExtraDetailsTabPosition(I)V
            :native_init
            nop
        """)

        // Native code expects every tag to be its own enum while pruning empty Cast/Crew tabs.
        // Append after it completes, at the normal Unit return (the other return suspends).
        val trim = triviaTrimTabs.method
        val instructions = trim.implementation!!.instructions
        val normalReturn = instructions.withIndex().single { (index, instruction) ->
            instruction.opcode == Opcode.RETURN_OBJECT &&
                (instructions.elementAt(index - 1) as? ReferenceInstruction)?.reference?.toString() ==
                "Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;"
        }.index
        trim.addInstructions(normalReturn, """
            iget-object v0, p0, $TRIM_TABS->${'$'}binding:$BINDING
            iget-object v0, v0, $BINDING->extraDetailsTabs:$TABS
            iget-object v1, p0, $TRIM_TABS->this${'$'}0:$DETAILS
            invoke-static { v1 }, $DETAILS->access${'$'}getModel($DETAILS)$MODEL
            move-result-object v1
            invoke-virtual { v1 }, $MODEL->getExtraDetailsTabPosition()I
            move-result v1
            invoke-static { v0, v1 }, $TRIVIA->appendTab(${TABS}I)V
            iget-object v0, p0, $TRIM_TABS->this${'$'}0:$DETAILS
            invoke-static { v0 }, $DETAILS->access${'$'}getModel($DETAILS)$MODEL
            move-result-object v1
            invoke-virtual { v1 }, $MODEL->getFilm()Lkotlinx/coroutines/flow/StateFlow;
            move-result-object v1
            invoke-interface { v1 }, Lkotlinx/coroutines/flow/StateFlow;->getValue()Ljava/lang/Object;
            move-result-object v1
            invoke-static { v0, v1 }, $TRIVIA->filmReady(Landroidx/fragment/app/Fragment;Ljava/lang/Object;)V
        """)

        val select = triviaSelectTab.method
        val readTag = select.implementation!!.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference?.toString() == "$TAB->getTag()Ljava/lang/Object;"
        }
        check(readTag >= 0)
        // Let Letterboxd record the selection and clear native decorations before handling Trivia.
        select.addInstructionsWithLabels(readTag + 2, """
            invoke-static { p1 }, $TRIVIA->isTriviaTag(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_tab
            invoke-direct { p0 }, $DETAILS->getModel()$MODEL
            move-result-object v0
            const v1, 0x7fffffff
            invoke-virtual { v0, v1 }, $MODEL->setExtraDetailsTabPosition(I)V
            invoke-virtual { v0 }, $MODEL->getFilm()Lkotlinx/coroutines/flow/StateFlow;
            move-result-object v0
            invoke-interface { v0 }, Lkotlinx/coroutines/flow/StateFlow;->getValue()Ljava/lang/Object;
            move-result-object v0
            invoke-static { p0, v0 }, $TRIVIA->select(Landroidx/fragment/app/Fragment;Ljava/lang/Object;)V
            return-void
            :native_tab
            nop
        """)
    }
}
