package app.template.patches.sofascore.misc.screenshot

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_SCREEN_CALM
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val DISABLE_SCREENSHOT_PROMPT = HevalFeature(
    id = "sofascore.disable_screenshot_prompt",
    name = "Hide screenshot sharing prompt",
    description = "Stops the app offering to share when you take a screenshot.",
    category = SofascoreControlsCategory.POPUPS,
    icon = "eye_off",
)

/** The preference the app's own "don't show again" button writes. */
private const val SCREENSHOT_PREF_KEY = "PREF_SCREENSHOT_DO_NOT_SHOW_AGAIN"

private const val EXTENSION_PACKAGE = "Lapp/template/extension/"

/** A SharedPreferences.getBoolean(key, default) call right after the key literal. */
private fun MethodReference.isPreferenceGetBoolean() =
    name == "getBoolean" && returnType == "Z" &&
        definingClass == "Landroid/content/SharedPreferences;" &&
        parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z")

// A Heval Controls feature, on by default. EventActivity.onStart and LeagueActivity.onStart register
// a ScreenCaptureCallback unless PREF_SCREENSHOT_DO_NOT_SHOW_AGAIN reads true, and the callback
// (onScreenCaptured) checks the same preference before showing the prompt. Every read of that key
// (found by the key literal and the SharedPreferences.getBoolean call after it, not by name) passes
// its result through ScreenCalm.screenshotPromptHidden, which answers true while the switch is on.
// The writes (the "don't show again" button) are left alone, so turning the switch off restores stock.
@Suppress("unused")
val disableScreenshotPromptPatch = sofascoreControls.featurePatch(
    DISABLE_SCREENSHOT_PROMPT,
    name = "Disable screenshot prompt",
    description = "Hides the prompt to share a screenshot.",
) {
    classDefBy(SOFASCORE_SCREEN_CALM)

    // Every (class, method name, descriptor, index of the move-result) of a key read.
    class Read(val owner: ClassDef, val name: String, val parameters: List<String>, val moveResult: Int)

    val reads = mutableListOf<Read>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        classDef.methods.forEach { method ->
            val insns = method.implementation?.instructions?.toList() ?: return@forEach
            insns.forEachIndexed { index, insn ->
                if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                if (((insn as ReferenceInstruction).reference as? StringReference)?.string != SCREENSHOT_PREF_KEY) return@forEachIndexed
                // The read follows the literal within a few instructions (the default value is loaded
                // in between); a write (Editor.putBoolean through a helper) has no getBoolean.
                val call = (index + 1..minOf(index + 3, insns.lastIndex)).firstOrNull { i ->
                    ((insns[i] as? ReferenceInstruction)?.reference as? MethodReference)?.isPreferenceGetBoolean() == true
                } ?: return@forEachIndexed
                if (insns.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT) return@forEachIndexed
                reads += Read(classDef, method.name, method.parameterTypes.map(CharSequence::toString), call + 1)
            }
        }
    }
    if (reads.isEmpty()) throw PatchException("Disable screenshot prompt: no read of $SCREENSHOT_PREF_KEY found")

    // Validate every site, then edit (highest index first within a method so indexes stay valid).
    val sites = reads.map { read ->
        val method = mutableClassDefBy(read.owner).methods.single {
            it.name == read.name && it.parameterTypes.map(CharSequence::toString) == read.parameters
        }
        method.requireNoBranchTargetAt(read.moveResult + 1, "Disable screenshot prompt (${read.owner.type}->${read.name})")
        method to read.moveResult
    }
    sites.groupBy({ it.first }, { it.second }).forEach { (method, moveResults) ->
        moveResults.sortedDescending().forEach { moveResult ->
            val register = (method.implementation!!.instructions[moveResult] as OneRegisterInstruction).registerA
            method.addInstructionsChecked(
                moveResult + 1,
                """
                    invoke-static/range {v$register .. v$register}, $SOFASCORE_SCREEN_CALM->screenshotPromptHidden(Z)Z
                    move-result v$register
                """,
            )
        }
    }
}
