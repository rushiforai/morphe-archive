package app.kyurem39.patches.mpvex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val MORPHE_HOOK = "Lapp/kyurem39/extension/MorpheHook;"

private const val MAIN_ACTIVITY = "Lapp/marlboroadvance/mpvex/MainActivity;"
private const val ABOUT_SCREEN = "Lapp/marlboroadvance/mpvex/ui/preferences/AboutScreen;"
private const val CRASH_HANDLER =
    "Lapp/marlboroadvance/mpvex/presentation/crash/GlobalExceptionHandler;"
private const val PREFERENCES_ROW_LAMBDA =
    "Lapp/marlboroadvance/mpvex/MainActivity\$\$ExternalSyntheticLambda7;"

private const val BASE_STRINGS = "res/values/strings.xml"

private val aboutRowLabels = mapOf(
    "pref_about_title" to "kyurem39's patches",
    "pref_about_summary" to "Patches settings, About",
)

/**
 * Relabels the About row of the mpvEx settings, which becomes the entry of the patch settings
 * panel.
 *
 * <p>It is a patch of its own, without a name, so that every patch that shows settings can depend
 * on it without pulling in the Vietnamese interface.
 */
internal val patchSettingsResourcesPatch = resourcePatch {
    execute {
        document(BASE_STRINGS).use { document ->
            val elements = document.getElementsByTagName("string")
            var relabelled = 0

            for (index in 0 until elements.length) {
                val element = elements.item(index) as? Element ?: continue
                val label = aboutRowLabels[element.getAttribute("name")] ?: continue

                element.textContent = label
                relabelled++
            }

            check(relabelled == aboutRowLabels.size) {
                "Expected ${aboutRowLabels.size} About row strings in $BASE_STRINGS, found " +
                    "$relabelled."
            }
        }
    }
}

/**
 * The code every patch shares: the injected extension, the settings panel entry and the crash
 * logger.
 *
 * <p>Unnamed, so it is only applied as a dependency and never shows up as a patch of its own.
 */
internal val patchSettingsPatch = bytecodePatch {
    dependsOn(patchSettingsResourcesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The sheet is shown on the activity this tracks. Its lifecycle callbacks then follow
        // every other activity, so one call is enough for the whole process.
        val mainOnCreate = mutableClassDefBy(MAIN_ACTIVITY).methods.firstOrNull { method ->
            method.name == "onCreate" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0].toString() == "Landroid/os/Bundle;" &&
                method.returnType == "V"
        } ?: throw PatchException("$MAIN_ACTIVITY has no onCreate(Bundle).")

        mainOnCreate.addInstructions(
            0,
            """
                invoke-static {p0}, $MORPHE_HOOK->track(Landroid/app/Activity;)V
            """,
        )

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

        // The app shows crashes on its own screen and exits, so log the cause first: otherwise a
        // crash in patched code is invisible in logcat.
        val uncaught = mutableClassDefBy(CRASH_HANDLER).methods.firstOrNull { method ->
            method.name == "uncaughtException" &&
                method.parameterTypes.size == 2 &&
                method.parameterTypes[0].toString() == "Ljava/lang/Thread;" &&
                method.parameterTypes[1].toString() == "Ljava/lang/Throwable;"
        } ?: throw PatchException("$CRASH_HANDLER has no uncaughtException(Thread, Throwable).")

        uncaught.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $MORPHE_HOOK->logCrash(Ljava/lang/Thread;Ljava/lang/Throwable;)V
            """,
        )
    }
}
