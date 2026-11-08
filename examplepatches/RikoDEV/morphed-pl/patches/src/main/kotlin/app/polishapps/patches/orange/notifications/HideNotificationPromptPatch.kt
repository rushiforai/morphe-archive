package app.polishapps.patches.orange.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.polishapps.patches.shared.Constants.COMPATIBILITY_MOJ_ORANGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_CLASS = "Lapp/polishapps/extension/orange/NotificationPromptPatch;"
private const val PROMPT_VIEW = "LNotificationDrawerAlertView;"

@Suppress("unused")
val hideNotificationPromptPatch = bytecodePatch(
    name = "Hide notification prompt",
    description = "Stops the popup asking to turn on notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOJ_ORANGE)

    extendWith("extensions/extension.mpe")

    execute {
        val view = mutableClassDefBy(PROMPT_VIEW)
        if (view.methods.any { it.name == "onResume" && it.parameters.isEmpty() }) {
            throw PatchException("$PROMPT_VIEW already overrides onResume")
        }

        view.methods.add(
            ImmutableMethod(
                view.type,
                "onResume",
                emptyList(),
                "V",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-super {p0}, ${view.superclass}->onResume()V
                        invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
                        move-result-object v0
                        invoke-static {v0}, $EXTENSION_CLASS->close(Landroid/view/View;)V
                        return-void
                    """,
                )
            },
        )
    }
}
