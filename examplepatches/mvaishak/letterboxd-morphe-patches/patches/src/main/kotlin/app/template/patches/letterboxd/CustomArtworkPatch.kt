package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val APP = "Lcom/letterboxd/letterboxd/"
private const val MODEL = "Lcom/letterboxd/api/model/"
private const val HOOK = "Lapp/template/extension/artwork/ArtworkHooks;"
private const val FILM_HEADER = "${APP}ui/fragments/film/FilmHeaderFragment;"
private const val MEMBER_HEADER = "${APP}ui/fragments/member/MemberHeaderFragment;"
private const val FILM_ACTIONS = "${APP}ui/fragments/film/FilmActionsFragment;"
private const val MEMBER_ACTIONS = "${APP}ui/fragments/member/MemberActionsFragment;"
private const val FILM_BINDING = "${APP}databinding/FragmentFilmHeaderBinding;"
private const val MEMBER_BINDING = "${APP}databinding/FragmentMemberHeaderBinding;"
private const val IMAGE = "${MODEL}Image;"
private const val FILM = "${MODEL}Film;"
private const val SUMMARY = "${MODEL}FilmSummary;"
private const val FRAGMENT = "Landroidx/fragment/app/Fragment;"
private const val DIALOG = "Landroidx/fragment/app/DialogFragment;"
private const val OBJECT = "Ljava/lang/Object;"
private const val IMAGE_VIEW = "Landroid/widget/ImageView;"
private const val STRING = "Ljava/lang/String;"
private const val SUMMARY_POSTER = "$SUMMARY->getPoster()$IMAGE"
private const val VIEWER_BUILDER = "Lcom/stfalcon/imageviewer/StfalconImageViewer\$Builder;"

private fun artworkMethod(owner: String, method: String, vararg parameters: String) =
    Fingerprint(definingClass = owner, name = method, returnType = "V", parameters = parameters.toList())

private val posterState = artworkMethod(
    "${APP}ui/views/PosterView;", "applyState", "${APP}ui/views/PosterView\$State;",
)
private val posterRebind = artworkMethod(
    "${APP}ui/views/PosterView;", "setFilmContext", "${APP}model/FilmContext;", "I", STRING, "Lkotlin/jvm/functions/Function0;",
)
private val filmPoster = artworkMethod(FILM_HEADER, "configurePoster", FILM, FILM_BINDING)
private val filmBackdrop = artworkMethod(FILM_HEADER, "configureBackdrop", FILM_BINDING, FILM)
private val profileBackdrop = artworkMethod(MEMBER_HEADER, "configureBackdrop", STRING, IMAGE, SUMMARY, MEMBER_BINDING)
private val filmAction = artworkMethod(FILM_ACTIONS, "onViewCreated", "Landroid/view/View;", "Landroid/os/Bundle;")
private val profileAction = artworkMethod(MEMBER_ACTIONS, "configureView", "${APP}databinding/FragmentMemberActionsBinding;")
private val accountState = artworkMethod(
    "${APP}services/CurrentMemberManager;", "updateState", "${APP}services/CurrentMemberManager\$State;",
)
private val tappedPoster = artworkMethod(FILM_HEADER, "showPoster", SUMMARY)
private val sheetPoster = Fingerprint(
    definingClass = FILM_ACTIONS,
    returnType = "V",
    parameters = listOf(FILM_ACTIONS, "Landroid/view/View;"),
    custom = { method, _ ->
        val references = (method.implementation?.instructions ?: emptyList())
            .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        SUMMARY_POSTER in references &&
            "${VIEWER_BUILDER}->show()Lcom/stfalcon/imageviewer/StfalconImageViewer;" in references
    },
)
private val tappedPosterLoader = artworkMethod(FILM_HEADER, "showPoster\$lambda\$0", FILM_HEADER, IMAGE_VIEW, "Ljava/net/URL;")

private fun MutableMethod.callIndex(target: String): Int {
    val matches = implementation!!.instructions.withIndex()
        .filter { (_, instruction) -> (instruction as? ReferenceInstruction)?.reference?.toString() == target }
    return matches.singleOrNull()?.index
        ?: throw PatchException("Expected one call to $target in $definingClass->$name, found ${matches.size}.")
}

private fun MutableMethod.imageResult(index: Int): String {
    val move = implementation!!.instructions.elementAt(index + 1)
    check(move.opcode == Opcode.MOVE_RESULT_OBJECT) { "Missing image result in $name" }
    return "v${(move as OneRegisterInstruction).registerA}"
}

private fun MutableMethod.afterImageGetter(target: String, hook: String, arguments: String, signature: String) {
    val index = callIndex(target)
    val result = imageResult(index)
    addInstructions(
        index + 2,
        """
            invoke-static { $arguments, $result }, $HOOK->$hook($signature$OBJECT)$OBJECT
            move-result-object $result
            check-cast $result, $IMAGE
        """,
    )
}

private fun MutableMethod.replaceImageGetter(target: String, hook: String, arguments: (String) -> String, signature: String) {
    val index = callIndex(target)
    val receiver = "v${(implementation!!.instructions.elementAt(index) as FiveRegisterInstruction).registerC}"
    val result = imageResult(index)
    addInstruction(index + 2, "check-cast $result, $IMAGE")
    replaceInstruction(index, "invoke-static { ${arguments(receiver)} }, $HOOK->$hook($signature)$OBJECT")
}

/** Keep any branch targeting the original return routed through the final UI update. */
internal fun MutableMethod.beforeReturns(instruction: String) {
    val returns = implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    check(returns.isNotEmpty()) { "Missing return in $name" }
    for (index in returns.asReversed()) {
        addInstruction(index + 1, "return-void")
        replaceInstruction(index, instruction)
    }
}

private val artworkResources = resourcePatch {
    execute {
        val logo = get("assets/morphe/tmdb.png", copy = false)
        logo.parentFile.mkdirs()
        checkNotNull(ArtworkResource::class.java.getResourceAsStream("/artwork/tmdb.png")).use { source ->
            logo.outputStream().use { destination -> source.copyTo(destination) }
        }
    }
}

private object ArtworkResource

@Suppress("unused")
val customArtworkPatch = bytecodePatch(
    name = "Custom artwork",
    description = "Choose local posters and backdrops from TMDB or an image URL, independently of your Letterboxd subscription.",
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
    dependsOn(modSettingsPatch, artworkResources)

    execute {
        val poster = posterState.method
        if (poster.implementation!!.instructions.any {
                (it as? ReferenceInstruction)?.reference?.toString() == "$HOOK->boundPoster(Landroid/view/View;$OBJECT)$OBJECT"
            }) {
            throw PatchException("Custom artwork is already applied. Select a clean, unpatched Letterboxd APK in Morphe.")
        }

        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0, "invoke-static { p0 }, $HOOK->initialize(Landroid/content/Context;)V",
        )
        // Reuse the native controls once the app has finished assigning labels and listeners.
        filmAction.method.beforeReturns("invoke-static { p0 }, $HOOK->filmAction($DIALOG)V")
        profileAction.method.beforeReturns("invoke-static { p0 }, $HOOK->profileAction($DIALOG)V")

        posterRebind.method.addInstruction(
            0, "invoke-static { p0, p1 }, $HOOK->rebindPoster(Landroid/view/View;$OBJECT)V",
        )
        poster.replaceImageGetter(
            "${APP}ui/views/PosterView\$State;->getPoster()$IMAGE",
            "boundPoster", { "p0, p1" }, "Landroid/view/View;$OBJECT",
        )
        filmPoster.method.afterImageGetter("${FILM}->getPoster()$IMAGE", "headerPoster", "p0, p2, p1", "$FRAGMENT$OBJECT$OBJECT")
        filmBackdrop.method.afterImageGetter("${FILM}->getBackdrop()$IMAGE", "filmBackdrop", "p0, p1, p2", "$FRAGMENT$OBJECT$OBJECT")
        profileBackdrop.method.addInstructions(
            0,
            """
                invoke-static { p0, p1, p2, p3, p4 }, $HOOK->profileBackdrop($FRAGMENT$STRING$OBJECT$OBJECT$OBJECT)$OBJECT
                move-result-object p2
                check-cast p2, $IMAGE
            """,
        )

        // The viewer obtains its own URL from FilmSummary, bypassing PosterView entirely.
        val sheetViewer = sheetPoster.matchAll().single().method
        val sheetLoader = artworkMethod(
            FILM_ACTIONS, sheetViewer.name + "\$0", "Landroidx/fragment/app/FragmentActivity;", IMAGE_VIEW, STRING,
        )
        for (viewer in listOf(tappedPoster.method, sheetViewer)) {
            viewer.replaceImageGetter(SUMMARY_POSTER, "viewerPoster", { it }, OBJECT)
        }
        for (loader in listOf(tappedPosterLoader, sheetLoader)) {
            val method = loader.method
            val index = method.callIndex("Lcom/bumptech/glide/RequestBuilder;->into($IMAGE_VIEW)Lcom/bumptech/glide/request/target/ViewTarget;")
            val registers = method.implementation!!.instructions.elementAt(index) as FiveRegisterInstruction
            method.addInstruction(index, "invoke-static { v${registers.registerC}, v${registers.registerD} }, $HOOK->viewerLoad($OBJECT$IMAGE_VIEW)V")
        }

        accountState.method.beforeReturns("invoke-static {}, $HOOK->accountChanged()V")
    }
}
