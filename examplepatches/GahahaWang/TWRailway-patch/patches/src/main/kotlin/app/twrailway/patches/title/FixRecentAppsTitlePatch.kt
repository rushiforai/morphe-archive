package app.twrailway.patches.title

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.twrailway.patches.settings.PATCH_SETTINGS_CLASS
import app.twrailway.patches.settings.markPatchApplied
import app.twrailway.patches.settings.patchSettingsPatch
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE

/**
 * The title shown for the app in the recent apps screen is not the manifest label: Flutter's
 * `Title` widget sends `MaterialApp.title` over `SystemChrome.setApplicationSwitcherDescription`,
 * and the embedding passes it to `Activity.setTaskDescription`.
 *
 * 火車時刻表 sets that title to the GetX translation of `app.titleTra` before its translations
 * are loaded, so the untranslated key `app.titleTra` is shown instead of "火車時刻表".
 *
 * The patch hooks the embedding: a label that is an untranslated key (`word.word...`, ASCII
 * without spaces) is replaced with the app's own label, so the recent apps screen shows
 * "火車時刻表". Real titles are left as they are. It can be turned off in the patch settings.
 */
@Suppress("unused")
val fixRecentAppsTitlePatch = bytecodePatch(
    name = "Fix recent apps title",
    description = "Shows the app name instead of \"app.titleTra\" as the app's title in the recent apps screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    dependsOn(patchSettingsPatch)

    execute {
        markPatchApplied("fix_recent_apps_title")

        SetApplicationSwitcherDescriptionFingerprint.method.apply {
            val pluginType = definingClass
            val descriptionType = parameterTypes[0].toString()

            val activityField = classDefBy(pluginType).fields.singleOrNull { field ->
                field.type == "Landroid/app/Activity;"
            } ?: throw PatchException("Could not find the Activity field in $pluginType")

            // AppSwitcherDescription(int color, String label)
            val descriptionClass = classDefBy(descriptionType)
            val colorField = descriptionClass.fields.singleOrNull { it.type == "I" }
                ?: throw PatchException("Could not find AppSwitcherDescription.color in $descriptionType")
            val labelField = descriptionClass.fields.singleOrNull { it.type == "Ljava/lang/String;" }
                ?: throw PatchException("Could not find AppSwitcherDescription.label in $descriptionType")
            descriptionClass.methods.singleOrNull { method ->
                method.name == "<init>" &&
                    method.parameterTypes.map { it.toString() } == listOf("I", "Ljava/lang/String;")
            } ?: throw PatchException("Could not find AppSwitcherDescription constructor in $descriptionType")

            val implementation = implementation
                ?: throw PatchException("setApplicationSwitcherDescription has no implementation")
            // p0 (this) and p1 (description) are the last 2 registers.
            if (implementation.registerCount - 2 < 3 || implementation.registerCount > 16) {
                throw PatchException("Unexpected register layout in $pluginType->$name")
            }

            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $PATCH_SETTINGS_CLASS->fixRecentAppsTitle()Z
                    move-result v0
                    if-eqz v0, :original
                    iget-object v0, p1, $descriptionType->${labelField.name}:Ljava/lang/String;
                    if-eqz v0, :original
                    const-string v1, "^\\w+(\\.\\w+)+$"
                    invoke-virtual { v0, v1 }, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original

                    # Untranslated key: use the app's label instead.
                    iget-object v0, p0, $pluginType->${activityField.name}:Landroid/app/Activity;
                    invoke-virtual { v0 }, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;
                    move-result-object v1
                    invoke-virtual { v0 }, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;
                    move-result-object v2
                    invoke-virtual { v1, v2 }, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;
                    move-result-object v1
                    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
                    move-result-object v1
                    iget v0, p1, $descriptionType->${colorField.name}:I
                    new-instance p1, $descriptionType
                    invoke-direct { p1, v0, v1 }, $descriptionType-><init>(ILjava/lang/String;)V
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
