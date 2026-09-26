package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * On startup (and from the player / TV fragment paths) the app compares the
 * server config's minimum WebView versionCode against the installed system
 * WebView and shows the "WebView Component"/"Chrome version needs to be
 * updated" dialog when the installed one is older.
 *
 * All four callers (NavDrawer1, helper/b, StandardVideoPlayer, tv/fragments/c)
 * funnel into the shared synthetic switch method `Lue4;->c(Object)`, which is
 * why removing a single dialog-show in earlier attempts only made the popup
 * resurface from another caller's path. The comparison `cmp-long` (required vs
 * installed) is followed by exactly one branch,
 *
 *     const v5, 0x7f16017b   <- unique anchor, used once in the whole method
 *     if-lez v1, :cond_17    <- skips the entire dialog block when installed >= required
 *
 * Replacing that branch with an unconditional `goto/16` to the same target
 * suppresses the dialog everywhere, for both the WebView and Chrome message
 * variants. Registers are untouched (goto/16 is register-less and the same 2
 * code units in size), and the branch target label is reused as-is.
 *
 * Deliberately NOT touched: the one-shot pref-gated "Country Problem" dialog
 * (its gate sits inside the skipped block but is a server feature, and it is
 * pref-limited to once) and the pref-gated "Android Version Problem" dialog
 * (only fires on Android < 8, once per install — factually true there).
 *
 * The "Start App" button on the news page ALSO carries its own copy of the
 * same check in its click listener (`Lg7;->onClick`, case 0xb): cmp-long H2/I2,
 * then `if-lez v0, :cond_1f` → proceed into the app, else call
 * `NavDrawer1.y()` (re-shows the dialog) and return. With the dialog
 * suppressed, that branch makes the button silently do nothing — so the
 * branch is likewise replaced with an unconditional goto, and Start App
 * always proceeds. */
object WebViewVersionCheckFingerprint : Fingerprint(
    definingClass = "Lue4;",
    name = "c",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("countryProblem6719")
)

object StartAppClickFingerprint : Fingerprint(
    definingClass = "Lg7;",
    name = "onClick",
    parameters = listOf("Landroid/view/View;")
)

@Suppress("unused")
val removeWebViewVersionNagPatch = bytecodePatch(
    name = "Remove WebView version nag",
    description = "Removes the 'WebView Component' version-update popup shown at startup and in the player.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        val method = WebViewVersionCheckFingerprint.method
        val instr = method.implementation!!.instructions

        // if-lez directly following the const v5, 0x7f16017b anchor
        val constIdx = instr.indexOfFirst {
            (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f16017b
        }
        check(constIdx >= 0) { "WebView nag: dialog drawable resource const not found" }

        val branch = instr[constIdx + 1] as BuilderInstruction21t
        check(branch.opcode.name == Opcode.IF_LEZ.name) {
            "WebView nag: expected if-lez after the anchor, found ${branch.opcode}"
        }

        method.replaceInstruction(constIdx + 1, BuilderInstruction20t(Opcode.GOTO_16, branch.target))

        // Same gate in the Start App button's click listener: proceed
        // unconditionally instead of re-showing the (now removed) dialog.
        val click = StartAppClickFingerprint.method
        val clickInstr = click.implementation!!.instructions
        val yIdx = clickInstr.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/streamdev/aiostreamer/mobile/ui/NavDrawer1;" && ref.name == "y"
        }
        check(yIdx > 0) { "WebView nag: NavDrawer1.y() call not found in Start App listener" }

        val startBranch = clickInstr[yIdx - 1] as BuilderInstruction21t
        check(startBranch.opcode.name == Opcode.IF_LEZ.name) {
            "WebView nag: expected if-lez before NavDrawer1.y(), found ${startBranch.opcode}"
        }

        click.replaceInstruction(yIdx - 1, BuilderInstruction20t(Opcode.GOTO_16, startBranch.target))
    }
}
