package app.template.patches.flashscore.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.hevalControlsPatch
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val FLASHSCORE_EXTENSION = "extensions/flashscore.mpe"
internal const val FLASHSCORE_CONTROLS_ENTRY = "Lapp/template/extension/flashscore/HevalControlsEntry;"

/** The app's own Settings screen. Not R8-renamed: it is an activity named in the manifest. */
private const val SETTINGS_ACTIVITY = "Leu/livesport/LiveSport_cz/view/settings/SettingsActivity;"

/** Categories of the Flashscore features, in the order a full patch set usually registers them. */
internal object FlashscoreControlsCategory {
    const val DISPLAY = "Display"
    const val LISTS = "Lists"
    const val NOTIFICATIONS = "Notifications"
}

/** True for `invoke-virtual setContentView(View)` on the activity. */
private fun Instruction.isSetContentView(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.name == "setContentView" && call.returnType == "V" &&
        call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;")
}

/**
 * The in-app entry point: a "Patch settings" row on Flashscore's Settings screen, right before the
 * version label. The row is the app's own arrow_row layout (background, divider, title, arrow), so
 * it matches the stock rows; HevalControlsEntry inserts it into the screen's ConstraintLayout and
 * re-constrains the version label below it. Part of the "Patch settings" patch, so the screen can
 * always be reached.
 */
private val flashscoreControlsEntryPatch = bytecodePatch(
    description = "Adds a \"Patch settings\" row to Flashscore's Settings screen.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    extendWith(FLASHSCORE_EXTENSION)

    execute {
        classDefBy(FLASHSCORE_CONTROLS_ENTRY)

        val activity = mutableClassDefBy(SETTINGS_ACTIVITY)
        val onCreate = activity.methods.singleOrNull {
            it.name == "onCreate" && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
        } ?: throw PatchException("$SETTINGS_ACTIVITY.onCreate(Bundle) not found")

        val insns = onCreate.implementation?.instructions?.toList()
            ?: throw PatchException("$SETTINGS_ACTIVITY.onCreate has no code")
        val calls = insns.withIndex().filter { (_, instruction) -> instruction.isSetContentView() }
        val (index, call) = calls.singleOrNull() ?: throw PatchException(
            "$SETTINGS_ACTIVITY.onCreate calls setContentView(View) ${calls.size} times, expected once",
        )
        // The receiver register holds the activity; it is still the activity right after the call,
        // so the row is added from there (the code may have moved p0 into a local beforehand).
        // setContentView(View) passes two registers: the receiver and the view.
        val receiver = when (call) {
            is RegisterRangeInstruction -> call.startRegister.takeIf { call.registerCount == 2 }
            is FiveRegisterInstruction -> call.registerC.takeIf { call.registerCount == 2 }
            else -> null
        } ?: throw PatchException("$SETTINGS_ACTIVITY.onCreate: setContentView is not a two-register call")

        onCreate.requireNoBranchTargetAt(index + 1, "Patch settings row")
        onCreate.addInstructionsChecked(
            index + 1,
            "invoke-static/range {v$receiver .. v$receiver}, $FLASHSCORE_CONTROLS_ENTRY->addRow(Landroid/app/Activity;)V",
        )
    }
}

/** The Flashscore Heval Controls host; the switchable Flashscore patches are its feature patches. */
internal val flashscoreControls = hevalControlsPatch(
    COMPATIBILITY_FLASHSCORE,
    dependencies = setOf(flashscoreControlsEntryPatch, flashscoreControlsRowPatch),
)

// Expose the host patch, so Manager lists "Patch settings".
@Suppress("unused")
val flashscoreHevalControlsPatch = flashscoreControls.patch
