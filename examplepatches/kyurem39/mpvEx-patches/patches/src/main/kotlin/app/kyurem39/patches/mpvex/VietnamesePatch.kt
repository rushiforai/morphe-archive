package app.kyurem39.patches.mpvex

import app.kyurem39.patches.shared.Constants.COMPATIBILITY_MPVEX
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val MORPHE_HOOK = "Lapp/kyurem39/extension/MorpheHook;"
private const val LOCALE_HELPER = "Lapp/kyurem39/extension/MorpheLocale;"

/** Every activity mpvEx ships has to apply the locale before it reads any resource. */
private val ACTIVITIES = listOf(
    "Lapp/marlboroadvance/mpvex/MainActivity;",
    "Lapp/marlboroadvance/mpvex/ui/mediainfo/MediaInfoActivity;",
    "Lapp/marlboroadvance/mpvex/ui/player/PlayerActivity;",
    "Lapp/marlboroadvance/mpvex/presentation/crash/CrashActivity;",
)

/**
 * Forces the Vietnamese interface.
 *
 * <p>The settings panel is shared with the other patches and lives in [patchSettingsPatch], so
 * this patch only adds the locale hooks.
 */
@Suppress("unused")
val vietnamesePatch = bytecodePatch(
    name = "Vietnamese interface",
    description = "Translates the application interface into Vietnamese.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MPVEX)

    dependsOn(vietnameseResourcesPatch)
    dependsOn(patchSettingsPatch)

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
                    invoke-static {}, $MORPHE_HOOK->enableVietnameseInterface()V
                    invoke-static {p0}, $LOCALE_HELPER->overrideConfiguration(Landroid/app/Activity;)V
                """,
            )
        }
    }
}
