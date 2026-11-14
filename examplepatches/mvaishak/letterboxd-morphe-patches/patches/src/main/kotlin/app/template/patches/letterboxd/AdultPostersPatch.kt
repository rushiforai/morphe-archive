package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val MODEL = "Lcom/letterboxd/api/model/"
private const val IMAGE = "${MODEL}Image;"
private const val PREFS = "Lapp/template/extension/settings/Prefs;"

private fun posterGetter(owner: String, name: String) =
    Fingerprint(definingClass = owner, name = name, returnType = IMAGE, parameters = emptyList())

@Suppress("unused")
val adultPostersPatch = bytecodePatch(
    name = "Adult posters",
    description = "Adds a Mods setting to show unblurred adult film posters supplied by Letterboxd.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Letterboxd",
            packageName = "com.letterboxd.letterboxd",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.6.7")),
        ),
    )
    dependsOn(modSettingsPatch)

    execute {
        for (model in listOf("Film", "FilmSummary")) {
            val owner = "$MODEL$model;"
            val adultPoster = posterGetter(owner, "getAdultPoster").method
            posterGetter(owner, "getPoster").method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $PREFS->showAdultPosters()Z
                    move-result v0
                    if-eqz v0, :stock_poster
                    invoke-virtual {p0}, $owner->${adultPoster.name}()$IMAGE
                    move-result-object v0
                    if-eqz v0, :stock_poster
                    return-object v0
                    :stock_poster
                    nop
                """,
            )
        }
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0, "invoke-static {}, $PREFS->enableAdultPostersSetting()V",
        )
    }
}
