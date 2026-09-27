package app.ckzombies.patches.intro

import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

private const val INTRO_ONCE = "Lapp/ckzombies/extension/IntroOnce;"
internal const val MOVIE_ACTIVITY = "Lcom/glu/platform/android/GluMovieActivity;"

/** Copies the movie's intent extras into fields and returns; the video starts once its surface exists. */
internal object MovieActivityOnCreateFingerprint : Fingerprint(
    definingClass = MOVIE_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Where every way out of the intro ends: the video running out, a tap, the back key and
 * `onPause()`. It tells the engine the movie is over, then closes the activity.
 */
internal object FinishMovieActivityFingerprint : Fingerprint(
    definingClass = MOVIE_ACTIVITY,
    name = "finishMovieActivity",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = MOVIE_ACTIVITY, name = "OnMovieComplete"),
        methodCall(name = "finish"),
    ),
)

/**
 * [finish] marks the intro as seen for this install, and [onCreate], once the extras are read,
 * calls it straight away when the intro was seen before. That is the path a tap takes, so the
 * engine hears the same `OnMovieComplete` it always did. Finishing inside `onCreate` makes
 * Android go straight to `onDestroy`, which checks for a missing player; `onPause`, which does
 * not, never runs.
 */
internal fun playIntroOnce(onCreate: MutableMethod, finish: MutableMethod) {
    val code = onCreate.implementation ?: throw PatchException("GluMovieActivity.onCreate has no code")
    val last = code.instructions.size - 1
    if (last < 0 || code.instructions[last].opcode != Opcode.RETURN_VOID) {
        throw PatchException("GluMovieActivity.onCreate does not end in return-void")
    }
    // The answer needs one local register, below this and the Bundle. At return-void no local
    // is live any more.
    if (code.registerCount < 3) {
        throw PatchException("GluMovieActivity.onCreate has no local register")
    }

    finish.addInstruction(0, "invoke-static {p0}, $INTRO_ONCE->markSeen(Landroid/content/Context;)V")
    onCreate.addInstructionsWithLabels(
        last,
        """
            invoke-static {p0}, $INTRO_ONCE->skip(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :play
            invoke-direct {p0}, $MOVIE_ACTIVITY->finishMovieActivity()V
        """,
        ExternalLabel("play", onCreate.getInstruction(last)),
    )
}

/**
 * Glu's intro video (`CK_Zombie1024Android.3gp` or the 800 wide one, from the OBB) plays at every
 * launch until it is tapped away. This lets it play on the first launch of an install and skips
 * it from then on. What counts as an install is explained in the extension's `IntroOnce`.
 */
@Suppress("unused")
val playIntroOncePatch = bytecodePatch(
    name = "Play intro once",
    description = "Plays the intro video on the first launch after installing, and skips it after that.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    extendWith("extensions/extension.mpe")

    execute {
        playIntroOnce(MovieActivityOnCreateFingerprint.method, FinishMovieActivityFingerprint.method)
    }
}
