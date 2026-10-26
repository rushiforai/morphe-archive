package app.kyurem39.patches.mpvex

import app.kyurem39.patches.shared.Constants.COMPATIBILITY_MPVEX
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val LOCALE_HELPER = "Lapp/kyurem39/extension/MorpheLocale;"
private const val MORPHE_HOOK = "Lapp/kyurem39/extension/MorpheHook;"

private const val ABOUT_SCREEN = "Lapp/marlboroadvance/mpvex/ui/preferences/AboutScreen;"
private const val PREFERENCES_ROW_LAMBDA =
    "Lapp/marlboroadvance/mpvex/MainActivity\$\$ExternalSyntheticLambda7;"

/** Every activity mpvEx ships has to apply the locale before it reads any resource. */
private val ACTIVITIES = listOf(
    "Lapp/marlboroadvance/mpvex/MainActivity;",
    "Lapp/marlboroadvance/mpvex/ui/mediainfo/MediaInfoActivity;",
    "Lapp/marlboroadvance/mpvex/ui/player/PlayerActivity;",
    "Lapp/marlboroadvance/mpvex/presentation/crash/CrashActivity;",
)

/**
 * Forces the Vietnamese interface, which is on by default, and adds a "Morphe" row to the
 * mpvEx settings that turns it off again and links to the About screen.
 */
@Suppress("unused")
val vietnamesePatch = bytecodePatch(
    name = "Vietnamese interface",
    description = "Adds a Vietnamese interface that is enabled by default, plus a \"Morphe\" " +
        "settings row to turn it off and reach the About screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MPVEX)

    dependsOn(vietnameseResourcesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        ACTIVITIES.forEach { activity ->
            val onCreate = mutableClassDefBy(activity).methods.firstOrNull { method ->
                method.name == "onCreate" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].toString() == "Landroid/os/Bundle;" &&
                    method.returnType == "V"
            } ?: throw PatchException("$activity has no onCreate(Bundle).")

            onCreate.addInstructions(
                0,
                """
                    invoke-static {p0}, $LOCALE_HELPER->overrideConfiguration(Landroid/app/Activity;)V
                """,
            )
        }

        // The About row is the only place that pushes AboutScreen. It opens the Morphe sheet
        // instead, and hands it the back stack so the sheet can still reach AboutScreen.
        val invoke = mutableClassDefBy(PREFERENCES_ROW_LAMBDA).methods.firstOrNull { method ->
            method.name == "invoke" &&
                method.parameterTypes.isEmpty() &&
                method.returnType == "Ljava/lang/Object;"
        } ?: throw PatchException("$PREFERENCES_ROW_LAMBDA has no invoke().")

        val aboutPush = invoke.implementation!!.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is FieldReference &&
                reference.definingClass == ABOUT_SCREEN &&
                reference.name == "INSTANCE"
        }
        if (aboutPush < 0) throw PatchException("The About row does not push $ABOUT_SCREEN.")

        invoke.replaceInstructions(
            aboutPush,
            """
                invoke-static {v3}, $MORPHE_HOOK->open(Ljava/lang/Object;)V
                return-object v1
            """,
        )
    }
}
