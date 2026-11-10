package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.lock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/lock/AccountPin;"

private const val GUARD_METHOD =
    "guard(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Runnable;"

private const val SETTLE_ROW_METHOD = "settle(Lpa/d;)V"

private const val AT_APP_OPEN_METHOD = "atAppOpen(Landroid/app/Activity;)V"

/**
 * The screen the app settles on, and the one the PIN covers where it is asked on the way in.
 *
 * <p>Not `HomeActivity`, which is opened first and then routes on and finishes itself, and not
 * the method there that decides what to ask for: stopping the app at that decision leaves the
 * activity with no content and therefore no window, and a prompt of ours then becomes the only
 * window the app has. This one has built its screen by the time the cover goes over it.
 */
private const val MAIN_ACTIVITY =
    "Lcom/laurencedawson/reddit_sync/ui/activities/MainActivity;"

/** Where Sync reads whether to ask for a fingerprint before the app opens. */
private val appOpenLockFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/activities/HomeActivity;",
    name = "h0",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
)

private const val FINGERPRINT_WANTED_METHOD =
    "fingerprintWanted(Landroid/content/SharedPreferences;Ljava/lang/String;Z)Z"

/**
 * Puts our own reading of Sync's fingerprint setting in front of Sync's, so that the prompt can
 * be stood down where the PIN is offered instead of it rather than beside it.
 *
 * <p>The call being replaced reads the setting out of an account's own settings, and takes the
 * three registers this one takes, so it is swapped for ours where it stands.
 */
private fun MutableMethod.readTheFingerprintSettingThroughUs(extension: String) {
    val at = indexOfFirstInstructionOrThrow {
        opcode == Opcode.INVOKE_INTERFACE &&
                (this as? ReferenceInstruction)?.reference.let {
                    it is MethodReference &&
                            it.definingClass == "Landroid/content/SharedPreferences;" &&
                            it.name == "getBoolean"
                }
    }

    val reading = getInstruction<FiveRegisterInstruction>(at)
    if (reading.registerCount != 3) {
        throw PatchException("The fingerprint setting is not read the way this expects")
    }

    replaceInstruction(
        at,
        "invoke-static { v${reading.registerC}, v${reading.registerD}, " +
                "v${reading.registerE} }, $extension->$FINGERPRINT_WANTED_METHOD",
    )
}

private const val SETTINGS_SCREEN = "Lpa/d;"

private const val ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"

/** Where Sync asks for a fingerprint before an account is opened. */
private val accountPickerLockFingerprint = Fingerprint(
    definingClass =
        "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/AccountPickerFragment;",
    name = "M3",
    parameters = listOf(
        ACTIVITY,
        "Landroid/view/View;",
        "Ljava/lang/String;",
        "Ljava/lang/Runnable;",
    ),
    returnType = "V",
)

/** The same, where an account is acted on rather than chosen. */
private val accountActionsLockFingerprint = Fingerprint(
    definingClass =
        "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/ActionsBottomSheetFragment;",
    name = "s4",
    parameters = listOf(ACTIVITY, "Ljava/lang/String;", "Ljava/lang/Runnable;"),
    returnType = "V",
)

@Suppress("unused")
val pinLockPatch = bytecodePatch(
    name = "Lock an account with a PIN",
    description = "Adds a PIN to the Security settings that is asked for when an account is " +
            "opened and, if you like, when the app is opened, beside or instead of Sync's " +
            "fingerprint lock.",
    default = true
) {
    dependsOn(sharedExtensionPatch, pinLockSettingsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // Both places hand what to do next to whatever unlocks the account, so what is handed
        // over is swapped for something that asks for the PIN first. Done in front of the first
        // instruction, which is before the branch deciding whether to ask for a fingerprint, so
        // the PIN is asked on either path: beside the fingerprint where Sync's own lock is on,
        // and on its own where it is not.
        accountPickerLockFingerprint.method.addInstructions(
            0,
            """
            invoke-static       { p0, p2, p3 }, $EXTENSION_CLASS_DESCRIPTOR->$GUARD_METHOD
            move-result-object  p3
            """
        )

        accountActionsLockFingerprint.method.addInstructions(
            0,
            """
            invoke-static       { p0, p1, p2 }, $EXTENSION_CLASS_DESCRIPTOR->$GUARD_METHOD
            move-result-object  p2
            """
        )

        // Where either lock on its own is enough, Sync's prompt stands down and the fingerprint
        // is offered beside the PIN instead, on the one screen.
        accountPickerLockFingerprint.method
            .readTheFingerprintSettingThroughUs(EXTENSION_CLASS_DESCRIPTOR)
        accountActionsLockFingerprint.method
            .readTheFingerprintSettingThroughUs(EXTENSION_CLASS_DESCRIPTOR)

        // Only what Sync reads there is answered, never where it goes next: the app has to
        // reach what builds its screen or it ends up with no window at all.
        appOpenLockFingerprint.method
            .readTheFingerprintSettingThroughUs(EXTENSION_CLASS_DESCRIPTOR)

        // Asked on the way in, over a screen the app has already built rather than in front
        // of it being built.
        Fingerprint(
            definingClass = MAIN_ACTIVITY,
            name = "onCreate",
            parameters = listOf("Landroid/os/Bundle;"),
            returnType = "V",
        ).method.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$AT_APP_OPEN_METHOD",
        )

        // Sync's settings screens are its own fragments, so the row is wired as a screen
        // finishes loading its rows; a screen without it is left alone.
        Fingerprint(
            definingClass = SETTINGS_SCREEN,
            name = "t3",
            parameters = listOf("I"),
            returnType = "V",
        ).method.apply {
            addInstructions(
                instructions.count() - 1,
                "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$SETTLE_ROW_METHOD",
            )
        }
    }
}
