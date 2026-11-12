package app.template.patches.fotmob.controls

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.hevalControlsPatch
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val FOTMOB_EXTENSION = "extensions/fotmob.mpe"
internal const val FOTMOB_CONTROLS_ENTRY = "Lapp/template/extension/fotmob/HevalControlsEntry;"
internal const val FOTMOB_ACTIVITY_HOOKS = "Lapp/template/extension/fotmob/ActivityHooks;"

/** Categories of the FotMob features, in the order a full patch set usually registers them. */
internal object FotMobControlsCategory {
    const val BETTING = "Betting"
    const val POPUPS = "Pop-ups & promotions"
    const val DISPLAY = "Display"
    const val MATCH_PAGE = "Match page"
    const val SPOILER_FREE = "Spoiler-free"
    const val LEAGUES = "Leagues"
}

/** The index right after the only `invoke-super` of [name] in [this] method. */
private fun MutableMethod.indexAfterSuperCall(name: String): Int {
    val calls = instructions.withIndex().filter { (_, instruction) ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) && call?.name == name
    }
    return (calls.singleOrNull()?.index ?: throw PatchException("$definingClass->$name calls super.$name ${calls.size} times, expected once")) + 1
}

/**
 * The in-app entry point: a "Patch settings" row after "Support" on FotMob's Settings screen,
 * inflated from the stock row layout (HevalControlsEntry in extensions/fotmob). It is part of the
 * "Patch settings" patch, so the screen can always be reached.
 */
private val fotMobControlsEntryPatch = bytecodePatch(
    description = "Adds a \"Patch settings\" row to FotMob's Settings screen.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    extendWith(FOTMOB_EXTENSION)

    execute {
        classDefBy(FOTMOB_CONTROLS_ENTRY)

        // Right after setContentView(R.layout.activity_settings): the rows are inflated, and the
        // activity binds them afterwards by their own ids (the new row has none of those). p0 is
        // still the activity there; the call must use it.
        val onCreate = SettingsActivityOnCreateFingerprint.method
        val setContentView = SettingsActivityOnCreateFingerprint.instructionMatches.single().index
        val thisRegister = onCreate.implementation!!.registerCount - 2
        val call = onCreate.getInstruction<FiveRegisterInstruction>(setContentView)
        if (call.registerC != thisRegister) {
            throw PatchException("SettingsActivity.onCreate: setContentView is not called on p0 (v${call.registerC})")
        }
        onCreate.requireNoBranchTargetAt(setContentView + 1, "Patch settings row")
        onCreate.addInstructionsChecked(
            setContentView + 1,
            "invoke-static/range {p0 .. p0}, $FOTMOB_CONTROLS_ENTRY->addRow(Landroid/app/Activity;)V",
        )
    }
}

/**
 * Registers the extension's activity lifecycle hooks (system font theme overlay, animation speed)
 * from FotMobApp.onCreate, right after super.onCreate(). Unnamed; the features that need it depend
 * on it.
 */
internal val fotMobActivityHooksPatch = bytecodePatch(
    description = "Registers the FotMob activity hooks.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    extendWith(FOTMOB_EXTENSION)

    execute {
        classDefBy(FOTMOB_ACTIVITY_HOOKS)
        val onCreate = FotMobAppOnCreateFingerprint.method
        if (AccessFlags.STATIC.isSet(onCreate.accessFlags)) throw PatchException("FotMobApp.onCreate is static")
        val index = onCreate.indexAfterSuperCall("onCreate")
        onCreate.requireNoBranchTargetAt(index, "activity hooks")
        onCreate.addInstructionsChecked(
            index,
            "invoke-static/range {p0 .. p0}, $FOTMOB_ACTIVITY_HOOKS->register(Landroid/app/Application;)V",
        )
    }
}

/** The FotMob Heval Controls host; the switchable FotMob patches are its feature patches. */
internal val fotMobControls = hevalControlsPatch(
    COMPATIBILITY_FOTMOB,
    dependencies = setOf(fotMobControlsEntryPatch),
)

// Expose the host patch, so Manager lists "Patch settings".
@Suppress("unused")
val fotMobHevalControlsPatch = fotMobControls.patch
