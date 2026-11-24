package app.sircoderin.patches.kvaesitso

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.sircoderin.patches.shared.Constants.COMPATIBILITY_KVAESITSO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/sircoderin/extension/kvaesitso/SearchReopen;"
private const val SCAFFOLD_STATE = "Lde/mm20/launcher2/ui/launcher/scaffold/LauncherScaffoldState;"
private const val SCAFFOLD_CONFIG = "Lde/mm20/launcher2/ui/launcher/scaffold/ScaffoldConfiguration;"
private const val SCAFFOLD_COMPONENT = "Lde/mm20/launcher2/ui/launcher/scaffold/components/ScaffoldComponent;"
private const val SEARCH_COMPONENT = "Lde/mm20/launcher2/ui/launcher/scaffold/components/SearchComponent;"

/**
 * In search-only (assistant) mode, Kvaesitso decides what to show on resume by time alone: more than 5 s in
 * the background runs `LauncherScaffoldState.reset()` and clears the query, less keeps the old query. Either
 * way the keyboard stays hidden after you launched an app from the search, because the search bar keeps its
 * focus state and nothing asks for the keyboard again.
 *
 * This makes it depend on how the overlay comes back instead:
 * - Reopened with a new search request (swipe down on the home screen): the extension forces Kvaesitso's own
 *   reset branch (clean query) and shows the keyboard once the window is focused.
 * - Returned to without a new request (Back from an app launched from it): the reset is skipped, so the query
 *   stays.
 *
 * `reset()` also sets `isSearchBarFocused = false`, which makes the search bar drop focus, leaving the keyboard
 * nothing to attach to. Right after that, this re-runs the search component's `onPreActivate` (its own
 * "search opened" hook, which refocuses only when the "open keyboard" setting is on).
 */
@Suppress("unused")
val cleanSearchOnReopenPatch = patch(
    name = "Clean search on reopen",
    description = "Opening the search overlay again always starts a clean search with the keyboard open. " +
        "Going back to it from an app you launched keeps what you typed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KVAESITSO)

    extendWith("extensions/extension.mpe")

    execute {
        // Index 0 = before `invoke-super onPause()`.
        SharedLauncherActivityOnPauseFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onPause(Landroid/app/Activity;)V",
        )
        // Index 2 = after the `p1.getClass()` null check and `invoke-super onNewIntent`.
        SharedLauncherActivityOnNewIntentFingerprint.method.addInstruction(
            2,
            "invoke-static { p0 }, $EXTENSION_CLASS->onNewIntent(Landroid/app/Activity;)V",
        )
        // Index 0 = before `invoke-super onResume()`, which leads to ON_RESUME and the scaffold's resume check.
        BaseActivityOnResumeFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onResume(Landroid/app/Activity;)V",
        )

        LauncherScaffoldStateResetFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val unfocusIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == SCAFFOLD_STATE && ref.name == "setSearchBarFocused"
                    }
            }
            check(unfocusIndex >= 0) { "setSearchBarFocused call not found in LauncherScaffoldState.reset" }
            val nextIndex = unfocusIndex + 1

            // p1 (the continuation) and v2 are both overwritten before their next read, so they are free here.
            addInstructionsWithLabels(
                nextIndex,
                """
                    iget-object p1, p0, $SCAFFOLD_STATE->config:$SCAFFOLD_CONFIG
                    invoke-virtual { p1 }, $SCAFFOLD_CONFIG->getHomeComponent()$SCAFFOLD_COMPONENT
                    move-result-object p1
                    instance-of v2, p1, $SEARCH_COMPONENT
                    if-eqz v2, :not_search
                    invoke-virtual { p1, p0 }, $SCAFFOLD_COMPONENT->onPreActivate($SCAFFOLD_STATE)V
                """,
                ExternalLabel("not_search", instructions[nextIndex]),
            )
        }
    }
}
