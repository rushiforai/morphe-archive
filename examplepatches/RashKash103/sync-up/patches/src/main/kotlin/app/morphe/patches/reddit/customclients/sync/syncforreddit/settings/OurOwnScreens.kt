package app.morphe.patches.reddit.customclients.sync.syncforreddit.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

private const val WRAPPER_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/preferences/PreferenceWrapperFragment;"

/** What every screen of the settings is looked up in, and what it says when it does not know. */
private const val UNKNOWN_SCREEN = "Unsupported preference fragment."

/**
 * Sync's own list of which fragment belongs to which screen of the settings. It answers with a
 * fragment for every id it knows and throws for every other, so a screen of ours has to be
 * answered before it gets there.
 */
internal val screenForFingerprint = Fingerprint(
    parameters = listOf("I"),
    returnType = "Landroidx/fragment/app/Fragment;",
    strings = listOf(UNKNOWN_SCREEN),
)

/** The same list again, for the name shown at the top of a screen, and it throws the same way. */
internal val titleForFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    strings = listOf(UNKNOWN_SCREEN),
)

/**
 * The id of the screen being shown, which the name is looked up by.
 *
 * <p>The class has two methods of this shape, and taking either would have been arbitrary: the
 * screen it is showing is held in a field and read out, while the other answers with a layout id
 * written into it. Reading the field is what makes this the right one, so that is what is
 * matched on rather than the shape alone.
 */
internal val screenIdFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "I",
    custom = { method, classDef ->
        classDef.type.endsWith("preferences/PreferenceWrapperFragment;") &&
                method.implementation?.instructions?.toList()?.let { instructions ->
                    instructions.size == 2 && instructions.first().opcode == Opcode.IGET
                } == true
    },
)

/**
 * Has Sync ask a screen of ours about an id before it looks the id up itself.
 *
 * <p>Both lookups are answered at the very top, and both are left alone for an id that is not
 * ours: the extension answers null for every other, the injected code falls straight through,
 * and Sync goes on exactly as it did. More than one patch can do this to the same two methods —
 * whichever was injected last is simply asked first, and each declines what is not its own.
 *
 * @param screenClass The extension class that answers, which must carry
 *                    {@code screenFor(int)} and {@code titleFor(int)} as statics.
 */
internal fun BytecodePatchContext.answerTheScreenLookupWith(screenClass: String) {
    screenForFingerprint.method.apply {
        addInstructionsWithLabels(
            0,
            """
            invoke-static       { p1 }, $screenClass->screenFor(I)Lpa/d;
            move-result-object  v0
            if-eqz              v0, :not_ours
            return-object       v0
            """,
            ExternalLabel("not_ours", getInstruction<Instruction>(0)),
        )
    }

    // The name at the top of it, looked up in the same list and throwing the same way. The id
    // is not passed to this one, so it is asked of the screen itself.
    val screenId = screenIdFingerprint.originalMethod.name

    titleForFingerprint.method.apply {
        addInstructionsWithLabels(
            0,
            """
            invoke-virtual      { p0 }, $WRAPPER_CLASS->$screenId()I
            move-result         v0
            invoke-static       { v0 }, $screenClass->titleFor(I)Ljava/lang/String;
            move-result-object  v0
            if-eqz              v0, :not_ours
            return-object       v0
            """,
            ExternalLabel("not_ours", getInstruction<Instruction>(0)),
        )
    }
}
