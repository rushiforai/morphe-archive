package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.android.tools.smali.dexlib2.AccessFlags

private const val POSTER_VIEW =
    "Lcom/letterboxd/letterboxd/ui/views/PosterView;"
private const val IMAGE =
    "Lcom/letterboxd/api/model/Image;"
private const val FILM_ACTIONS_FRAGMENT =
    "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmActionsFragment;"
private const val FILM_HEADER_FRAGMENT =
    "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmHeaderFragment;"
private const val FILM =
    "Lcom/letterboxd/api/model/Film;"
private const val FRAGMENT_FILM_HEADER_BINDING =
    "Lcom/letterboxd/letterboxd/databinding/FragmentFilmHeaderBinding;"
private const val MEMBER_HEADER_FRAGMENT =
    "Lcom/letterboxd/letterboxd/ui/fragments/member/MemberHeaderFragment;"
private const val MEMBER =
    "Lcom/letterboxd/api/model/Member;"
private const val SETTINGS_APP_ICON_FRAGMENT =
    "Lcom/letterboxd/letterboxd/ui/fragments/user/SettingsAppIconFragment;"

/**
 * `PosterView.setImage(Image, int, Function0)` — poster rendering. We prepend a call that
 * checks the store; if a custom URL exists, our helper cancels Glide and loads via Coil.
 * Runs on every render, so the override persists across navigation.
 */
internal object PosterViewSetImageFingerprint : Fingerprint(
    definingClass = POSTER_VIEW,
    name = "setImage",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(IMAGE, "I", "Lkotlin/jvm/functions/Function0;"),
)

internal object FilmActionsOnViewCreatedFingerprint : Fingerprint(
    definingClass = FILM_ACTIONS_FRAGMENT,
    name = "onViewCreated",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

internal object FilmHeaderConfigureBackdropFingerprint : Fingerprint(
    definingClass = FILM_HEADER_FRAGMENT,
    name = "configureBackdrop",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(FRAGMENT_FILM_HEADER_BINDING, FILM),
)

internal object MemberHeaderApplyMemberFingerprint : Fingerprint(
    definingClass = MEMBER_HEADER_FRAGMENT,
    name = "applyMember",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(MEMBER),
)

internal object SettingsAppIconCanChangeFingerprint : Fingerprint(
    definingClass = SETTINGS_APP_ICON_FRAGMENT,
    name = "getCanChangeAppIcon",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val customPosterPatch = bytecodePatch(
    name = "Custom poster (local)",
    description = "Adds \"Custom poster\", \"Custom backdrop\", and \"Use as profile backdrop\" " +
        "rows to a film's action sheet. Custom images are stored locally, applied instantly, " +
        "persist across navigation, and are included in Mod settings export/import. Also " +
        "unlocks all Pro app icons (a purely local toggle).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // 1. Poster override — PosterView.setImage(Image, int, Function0). p0 = v3.
        PosterViewSetImageFingerprint.method.apply {
            addInstruction(
                0,
                "invoke-static {v3}, Lapp/template/extension/settings/CustomPosterButton;->maybeOverridePoster(Ljava/lang/Object;)V",
            )
        }

        // 2. Film action sheet row injection.
        FilmActionsOnViewCreatedFingerprint.method.apply {
            addInstruction(
                0,
                "invoke-static {p0}, Lapp/template/extension/settings/CustomPosterButton;->injectRow(Ljava/lang/Object;)V",
            )
        }

        // 3. Film backdrop override — FilmHeaderFragment.configureBackdrop(binding, film).
        //    .registers 9, 3 params → p0 = v6, p1 = v7, p2 = v8.
        FilmHeaderConfigureBackdropFingerprint.method.apply {
            addInstruction(
                0,
                "invoke-static {v7, v8}, Lapp/template/extension/settings/CustomPosterButton;->maybeOverrideFilmBackdrop(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }

        // 4. Profile backdrop override — MemberHeaderFragment.applyMember(Member).
        MemberHeaderApplyMemberFingerprint.method.apply {
            addInstruction(
                0,
                "invoke-static {p0}, Lapp/template/extension/settings/CustomPosterButton;->maybeOverrideProfileBackdrop(Ljava/lang/Object;)V",
            )
        }

        // 5. App icon unlock.
        SettingsAppIconCanChangeFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
        }
    }
}
