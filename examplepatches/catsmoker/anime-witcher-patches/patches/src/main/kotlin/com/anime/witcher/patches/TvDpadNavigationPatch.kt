package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val TV_FOCUS_HELPER = "Lcom/anime/witcher/TvFocusHelper;"

/**
 * TV D-pad navigation support.
 *
 * The app is designed for touch; on a TV / Fire TV remote there is nothing focusable in the
 * content area and focus gets stuck on the top bar. This patch:
 *
 * - Wires [TvFocusHelper] as an ActivityLifecycleCallbacks in ApplicationClass.onCreate() so
 *   every activity gets a focusability pass (only the outermost clickable element of a
 *   clickable chain becomes focusable, list containers watch for late-added rows).
 * - Redirects D-pad presses away from the top bar to the first content row in
 *   AppCompatActivity.dispatchKeyEvent().
 * - Makes every WitcherDialog factory dialog TV-focusable and installs the window callback
 *   wrapper (which also routes D-pad out of the top bar) before the dialog is returned.
 *
 * The runtime classes live in the "extensions/extension.mpe" DEX merged by the patcher.
 */
@Suppress("unused")
val tvDpadNavigationPatch = bytecodePatch(
    name = "TV D-pad navigation",
    description = "Makes the app fully navigable with a TV / Fire TV remote (focusable content rows, D-pad focus out of the top bar, dialog focus).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    extendWith("extensions/extension.mpe")

    execute {
        // Register TvFocusHelper as an ActivityLifecycleCallbacks right after super.onCreate(),
        // before FirebaseApp.initializeApp / the appearance setting code run.
        ApplicationClassOnCreateFingerprint.method.addInstructions(
            1,
            """
                new-instance v0, $TV_FOCUS_HELPER
                invoke-direct {v0}, $TV_FOCUS_HELPER-><init>()V
                invoke-virtual {p0, v0}, Landroid/app/Application->registerActivityLifecycleCallbacks(Landroid/app/Application${'$'}ActivityLifecycleCallbacks;)V
            """
        )

        // Consume a top-bar D-pad press only after focus has actually moved into a content
        // row; otherwise fall through to the original dispatch so in-content navigation is
        // left untouched. redirectMod itself filters action/keycode/focus-position.
        AppCompatActivityDispatchKeyEventFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $TV_FOCUS_HELPER->redirectMod(Landroid/app/Activity;Landroid/view/KeyEvent;)Z
                move-result v3
                if-eqz v3, :original
                const/4 v3, 0x1
                return v3
                :original
                nop
            """
        )

        // Every WitcherDialog method that builds and returns a Dialog: make it focusable for
        // TV and wrap its window callback before the dialog is returned to the caller.
        val dialogClass = mutableClassDefBy("Lcom/anime/witcher/utils/WitcherDialog;")
        val dialogFactoryMethods = dialogClass.methods.filter { method ->
            method.returnType == "Landroid/app/Dialog;" && method.implementation != null
        }
        dialogFactoryMethods.forEach { method ->
            val implementation = method.implementation!!
            val returnObjectIndexes = implementation.instructions.indices
                .filter { index -> implementation.instructions[index].opcode == Opcode.RETURN_OBJECT }
                .reversed()
            returnObjectIndexes.forEach { index ->
                val register = (implementation.instructions[index] as OneRegisterInstruction).registerA
                method.addInstructions(
                    index,
                    "invoke-static {v$register}, $TV_FOCUS_HELPER->fixDialog(Landroid/app/Dialog;)V"
                )
            }
        }
    }
}