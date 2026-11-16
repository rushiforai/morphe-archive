package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.invokeStatic

/** Smali descriptor of the extension's player touch class. */
internal const val KICK_TOUCH = "Lio/github/jordanwoodson/extension/shared/kick/KickTouch;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"

/**
 * Kick's player controls are React Native views over the native player view, and they take the touches, so Lurk's
 * player touches (Player gestures) are taken where a touch enters the app: MainActivity gets a
 * dispatchTouchEvent that asks KickTouch first and otherwise dispatches as its superclass does. KickTouch does
 * nothing unless a switch of a patch that depends on this one is on.
 */
internal val kickPlayerTouchPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        val activity = MainActivityCreateFingerprint.kickMatch("MainActivity.onCreate").classDef
        if (activity.methods.any { it.name == "dispatchTouchEvent" }) {
            throw PatchException("Kick: MainActivity has its own dispatchTouchEvent now; hook it instead")
        }
        val superclass = activity.superclass ?: throw PatchException("Kick: MainActivity has no superclass")
        // The touch counts when it starts on Kick's player view; the extension gets the class, not its name.
        val playerView = SurfaceTransformFingerprint.kickMatch("player view surface transform").classDef.type
        activity.methods.add(
            ImmutableMethod(
                activity.type,
                "dispatchTouchEvent",
                listOf(ImmutableMethodParameter(MOTION_EVENT, null, null)),
                "Z",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(5),
            ).toMutable().apply {
                // Five registers: v0 to v2, then this (v3) and the event (v4).
                addInstructions(
                    0,
                    """
                        const-class v0, $playerView
                        ${invokeStatic("$KICK_TOUCH->dispatch(Landroid/app/Activity;${MOTION_EVENT}Ljava/lang/Class;)Z", 3, 4, 0)}
                        move-result v0
                        if-eqz v0, :dispatch
                        return v0
                        :dispatch
                        invoke-super { p0, p1 }, $superclass->dispatchTouchEvent($MOTION_EVENT)Z
                        move-result v0
                        return v0
                    """,
                )
            },
        )
        Locators.record("kick.player_touch.activity", activity.type)
        Locators.record("kick.player_touch.player_view", playerView)
    }
}
