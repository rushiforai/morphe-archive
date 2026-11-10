package app.morphe.patches.kicktv.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patches.kicktv.KICK_TV
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/base/"

/** MainActivity.onCreate(), used to hand the current activity to the extension. */
private object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/tv/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

/**
 * The Settings row that shows the licensing information. It is replaced with
 * a "SEYTTINGS" row so no new Compose UI has to be added.
 */
private object MorpheSettingsRowFingerprint : Fingerprint(
    definingClass = "Lhh7;",
    name = "f",
    returnType = "V",
    parameters = listOf(
        "L",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "L",
        "I",
    ),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "tv_settings_open_source_licenses"),
        resourceLiteral(ResourceType.STRING, "tv_settings_licensing_information"),
    ),
)

/**
 * Base patch: installs the SEYTTINGS entry and its red themed dialog.
 *
 * Feature patches (for example CHAT SIZE) depend on this patch, so they get
 * the menu for free and only have to contribute their own section.
 */
@Suppress("unused")
val settingsPatch = patch(
    name = "SEYTTINGS",
    description = "Adds the red themed SEYTTINGS menu to KICK TV. " +
        "This is the base patch required by every KICK TV tweak.",
    default = true,
) {
    compatibleWith(KICK_TV)

    extendWith("extensions/KickSeyttings.mpe")

    execute {
        // Give the extension a reference to the running activity.
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, ${EXTENSION_CLASS}MorpheContext;->setActivity(Landroid/app/Activity;)V",
        )

        // Replace the licensing row labels and click callback with our settings dialog.
        MorpheSettingsRowFingerprint.apply {
            val method = method
            val titleMatch = instructionMatches[0]
            val subtitleMatch = instructionMatches[1]

            // Change the labels first, from the highest index to the lowest, because
            // removing instructions invalidates the indexes that follow them.
            replaceLabel(
                method = method,
                constIndex = subtitleMatch.index,
                text = "Open the patched tweaks menu",
            )
            replaceLabel(
                method = method,
                constIndex = titleMatch.index,
                text = "SEYTTINGS",
            )

            method.addInstructions(
                0,
                """
                    new-instance p3, ${EXTENSION_CLASS}OpenSettings;
                    invoke-direct {p3}, ${EXTENSION_CLASS}OpenSettings;-><init>()V
                """,
            )
        }
    }
}

/**
 * Replaces `const vX, <string resource id>` and the following
 * `ai7.i(...)` + `move-result-object` pair with a plain string constant.
 */
private fun replaceLabel(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    constIndex: Int,
    text: String,
) {
    val register = method.getInstruction<OneRegisterInstruction>(constIndex).registerA
    method.removeInstructions(constIndex, 3)
    method.addInstruction(constIndex, "const-string v$register, \"$text\"")
}
