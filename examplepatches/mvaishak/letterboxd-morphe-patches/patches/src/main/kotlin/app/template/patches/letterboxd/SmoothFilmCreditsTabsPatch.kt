package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val FILM_PACKAGE = "Lcom/letterboxd/letterboxd/ui/fragments/film/"
private const val FILM_MODEL = "${FILM_PACKAGE}FilmViewModel;"
private const val CAST_SECTION = "${FILM_PACKAGE}FilmCastSectionFragment;"
private const val CAST_ROWS = "${FILM_PACKAGE}FilmCastSectionFragment\$onViewCreated\$1\$1;"
private const val CAST_CACHE = "morpheCollapsedCastRows"
private const val CREW_SECTION = "${FILM_PACKAGE}FilmCrewSectionFragment;"
private const val CONTRIBUTORS_MODEL = "${FILM_PACKAGE}FilmContributorsViewModel;"
private const val ADAPTER = "Lcom/letterboxd/letterboxd/ui/item/FilmContributionListAdapter;"
private const val COROUTINES = "Lkotlinx/coroutines/"
private const val FLOW = "${COROUTINES}flow/Flow;"
private const val SHARED_FLOW = "${COROUTINES}flow/SharedFlow;"
private const val SHARING_STARTED = "${COROUTINES}flow/SharingStarted;"
private const val SHARING_COMPANION = "${COROUTINES}flow/SharingStarted\$Companion;"

private val filmModelConstructor = Fingerprint(
    definingClass = FILM_MODEL,
    name = "<init>",
    parameters = emptyList(),
    returnType = "V",
)

private val crewOnViewCreated = Fingerprint(
    definingClass = CREW_SECTION,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

private val castOnViewCreated = Fingerprint(
    definingClass = CAST_SECTION,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

private val castRowsTransform = Fingerprint(
    definingClass = CAST_ROWS,
    name = "invoke",
    parameters = listOf("Ljava/util/List;", "Z", "Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;",
)

private val setFilmId = Fingerprint(
    definingClass = FILM_MODEL,
    name = "setFilmId",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
)

private fun MutableMethod.creditsInstruction(target: String, opcode: Opcode): Int =
    implementation!!.instructions.withIndex().single { (_, instruction) ->
        instruction.opcode == opcode && (instruction as? ReferenceInstruction)?.reference?.toString() == target
    }.index

@Suppress("unused")
val smoothFilmCreditsTabsPatch = bytecodePatch(
    name = "Smooth film credits tabs",
    description = "Shows already-loaded cast and crew credits immediately when switching film detail tabs.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Letterboxd",
            packageName = "com.letterboxd.letterboxd",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xFF8000,
            targets = listOf(AppTarget(version = "3.5.4"), AppTarget(version = "3.5.6"), AppTarget(version = "3.6.7")),
        ),
    )

    execute {
        filmModelConstructor.classDef.fields.add(
            MutableField(
                ImmutableField(FILM_MODEL, CAST_CACHE, "Ljava/util/List;",
                    AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value, null, emptySet(), emptySet()),
            ),
        )

        val filmId = setFilmId.method
        val filmIdStore = filmId.creditsInstruction("$FILM_MODEL->_filmId:Ljava/lang/String;", Opcode.IPUT_OBJECT)
        filmId.addInstructions(
            filmIdStore,
            """
                const/4 v0, 0x0
                iput-object v0, p0, $FILM_MODEL->$CAST_CACHE:Ljava/util/List;
            """,
        )

        // Keep the native collapsed rows, including its limit and Show more row.
        val castRows = castRowsTransform.method
        val transform = castRows.creditsInstruction("$CAST_ROWS->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", Opcode.INVOKE_VIRTUAL)
        castRows.addInstructionsWithLabels(
            transform + 2,
            """
                if-eqz p2, :return_rows
                instance-of v0, p1, Ljava/util/List;
                if-eqz v0, :return_rows
                move-object v0, p1
                check-cast v0, Ljava/util/List;
                iget-object v1, p0, $CAST_ROWS->this${'$'}0:$CAST_SECTION
                invoke-static { v1 }, $CAST_SECTION->access${'$'}getViewModel($CAST_SECTION)$FILM_MODEL
                move-result-object v1
                iput-object v0, v1, $FILM_MODEL->$CAST_CACHE:Ljava/util/List;
                :return_rows
                nop
            """,
        )

        val cast = castOnViewCreated.method
        val viewCheck = cast.creditsInstruction(
            "Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V",
            Opcode.INVOKE_STATIC,
        )
        // Seed the new adapter before Cast installs its animator or starts observing the flow.
        cast.addInstructionsWithLabels(
            viewCheck + 1,
            """
                invoke-direct { p0 }, $CAST_SECTION->getViewModel()$FILM_MODEL
                move-result-object v1
                iget-object v2, v1, $FILM_MODEL->$CAST_CACHE:Ljava/util/List;
                if-eqz v2, :observe
                iget-object v3, p0, $CAST_SECTION->adapter:$ADAPTER
                if-eqz v3, :observe
                invoke-virtual { v3, v2 }, $ADAPTER->submitList(Ljava/util/List;)V
                invoke-direct { p0 }, $CAST_SECTION->getContributorsViewModel()$CONTRIBUTORS_MODEL
                move-result-object v3
                invoke-virtual { v3, v2 }, $CONTRIBUTORS_MODEL->setContributors(Ljava/util/List;)V
                :observe
                nop
            """,
        )

        val model = filmModelConstructor.method
        val crewStore = model.creditsInstruction("$FILM_MODEL->crews:$FLOW", Opcode.IPUT_OBJECT)
        val mappedFlow = model.implementation!!.instructions.elementAt(crewStore - 1)
        check(mappedFlow.opcode == Opcode.MOVE_RESULT_OBJECT && (mappedFlow as OneRegisterInstruction).registerA == 0)
        // The tab setup already subscribes to this flow to determine whether Crew exists.
        // Keep its latest result for the film's lifetime and retain the original background mapping.
        model.addInstructions(
            crewStore,
            """
                invoke-static { p0 }, Landroidx/lifecycle/ViewModelKt;->getViewModelScope(Landroidx/lifecycle/ViewModel;)${COROUTINES}CoroutineScope;
                move-result-object v1
                sget-object v2, $SHARING_STARTED->Companion:$SHARING_COMPANION
                invoke-virtual { v2 }, $SHARING_COMPANION->getLazily()$SHARING_STARTED
                move-result-object v2
                const/4 v3, 0x1
                invoke-static { v0, v1, v2, v3 }, ${COROUTINES}flow/FlowKt;->shareIn($FLOW${COROUTINES}CoroutineScope;${SHARING_STARTED}I)$SHARED_FLOW
                move-result-object v0
            """,
        )

        val section = crewOnViewCreated.method
        val hide = section.creditsInstruction("Landroid/view/View;->setVisibility(I)V", Opcode.INVOKE_VIRTUAL)
        // Fill the newly created adapter before the first frame. Seed both native observers
        // so the contributor-image observer cannot briefly replace the rows with its empty list.
        section.addInstructionsWithLabels(
            hide + 1,
            """
                invoke-direct { p0 }, $CREW_SECTION->getViewModel()$FILM_MODEL
                move-result-object v1
                invoke-virtual { v1 }, $FILM_MODEL->getCrews()$FLOW
                move-result-object v1
                check-cast v1, $SHARED_FLOW
                invoke-interface { v1 }, $SHARED_FLOW->getReplayCache()Ljava/util/List;
                move-result-object v1
                invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
                move-result v2
                if-nez v2, :observe
                const/4 v2, 0x0
                invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Ljava/util/List;
                invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
                move-result v3
                if-nez v3, :observe
                iget-object v3, p0, $CREW_SECTION->adapter:$ADAPTER
                if-eqz v3, :observe
                invoke-virtual { v3, v1 }, $ADAPTER->submitList(Ljava/util/List;)V
                invoke-direct { p0 }, $CREW_SECTION->getContributorsViewModel()$CONTRIBUTORS_MODEL
                move-result-object v3
                invoke-virtual { v3, v1 }, $CONTRIBUTORS_MODEL->setContributors(Ljava/util/List;)V
                invoke-virtual { p1, v2 }, Landroid/view/View;->setVisibility(I)V
                :observe
                nop
            """,
        )
    }
}
