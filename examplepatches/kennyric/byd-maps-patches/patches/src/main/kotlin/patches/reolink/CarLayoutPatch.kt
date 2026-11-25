package patches.reolink

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CAR_LAYOUT = "Lpatches/reolink/CarLayout;"
private const val BASE_ACTIVITY = "Lcom/bc/library/base/activity/BaseStatusActivity;"
private const val APP_COMPAT_ACTIVITY = "Landroidx/appcompat/app/AppCompatActivity;"
private const val CONTEXT = "Landroid/content/Context;"

/** The live player's full-screen button, and its Back while in full screen. */
private val playerSwitchOrientationFingerprint = Fingerprint(
    definingClass = "Lcom/android/bc/player/playerv2/PlayerV2Activity;",
    name = "switchOrientation",
    returnType = "V",
    parameters = listOf(),
)

/** The recordings player's full-screen button, and its Back while in full screen. */
private val playbackSwitchOrientationFingerprint = Fingerprint(
    definingClass = "Lcom/android/bc/player/playerv2/playbackpage/PlaybackV2Activity;",
    name = "switchOrientation",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val reolinkCarLayoutPatch = bytecodePatch(
    name = "Custom layout for Android Auto",
    description = "On a car screen, shows Reolink's phone layout across the whole width: the overview and the camera " +
        "page with its controls, Playback and Quick reply. Full screen still shows the video alone, and Back returns " +
        "from it and then to the overview, without rotating. Applies on every screen other than the phone's own, " +
        "whichever car host shows it. Nothing changes on the phone.",
) {
    compatibleWith(reolink)
    dependsOn(originalInput)
    extendWith("extensions/reolink-car.mpe")

    execute {
        // Every Reolink screen derives from BaseStatusActivity, which inherits attachBaseContext.
        val base = mutableClassDefBy(BASE_ACTIVITY)
        if (base.superclass != APP_COMPAT_ACTIVITY) throw PatchException("Unexpected superclass of $BASE_ACTIVITY")
        if (base.methods.any { it.name == "attachBaseContext" }) {
            throw PatchException("$BASE_ACTIVITY already overrides attachBaseContext")
        }
        base.methods.add(
            ImmutableMethod(
                BASE_ACTIVITY, "attachBaseContext", listOf(ImmutableMethodParameter(CONTEXT, null, "newBase")), "V",
                AccessFlags.PROTECTED.value, null, null, MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-static { p0, p1 }, $CAR_LAYOUT->wrap(Landroid/app/Activity;$CONTEXT)$CONTEXT
                        move-result-object p1
                        invoke-super { p0, p1 }, $APP_COMPAT_ACTIVITY->attachBaseContext($CONTEXT)V
                        return-void
                    """,
                )
            },
        )

        for (fingerprint in listOf(playerSwitchOrientationFingerprint, playbackSwitchOrientationFingerprint)) {
            fingerprint.method.apply {
                if (implementation!!.registerCount < 2) throw PatchException("No free register in $name")
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { p0 }, $CAR_LAYOUT->switchOrientation(Landroid/app/Activity;)Z
                        move-result v0
                        if-eqz v0, :rotate
                        return-void
                    """,
                    ExternalLabel("rotate", getInstruction(0)),
                )
            }
        }
    }
}
