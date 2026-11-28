package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// ─────────────────────────────────────────────────────────────────────────────
// Player touch hook, shared by "Volume and brightness sliders" and "Press and
// hold to speed up".
//
// In fullscreen the player is a stack of ordinary views under the watch
// screen's root, WatchLayout (player_container, then the overlays layout with
// the video surface and the controls overlay). WatchLayout and its parents
// (StatusBarFrameLayout, a FrameLayout) do not override dispatchTouchEvent, so
// one is added: it hands every touch to YttvPlayerTouch first.
//
//   PASS            the touch goes to the layout as usual
//   CONSUME         the touch is handled by the extension
//   CANCEL_CHILDREN a vertical drag was taken over: the children get one
//                   ACTION_CANCEL for the touch they started, then it is consumed
//
// dispatchTouchEvent is used rather than onInterceptTouchEvent because a child
// can switch interception off mid-drag with requestDisallowInterceptTouchEvent.
// ─────────────────────────────────────────────────────────────────────────────

internal const val WATCH_LAYOUT = "Lcom/google/android/apps/youtube/unplugged/features/watch/WatchLayout;"
internal const val PLAYER_TOUCH = "Lsemicoloncolonel/mobilestream/extension/yttv/YttvPlayerTouch;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"

internal object SlidersEnabledFingerprint : Fingerprint(
    definingClass = PLAYER_TOUCH,
    name = "slidersEnabled",
    parameters = listOf(),
    returnType = "Z",
)

internal object HoldEnabledFingerprint : Fingerprint(
    definingClass = PLAYER_TOUCH,
    name = "holdEnabled",
    parameters = listOf(),
    returnType = "Z",
)

/** Overwrites a feature flag in YttvPlayerTouch to return true. */
internal fun BytecodePatchContext.enablePlayerTouchFeature(flag: Fingerprint) {
    flag.method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """.trimIndent(),
    )
}

internal val playerTouchHookPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val original = classDefByOrNull(WATCH_LAYOUT)
            ?: throw PatchException("YouTube TV WatchLayout not found")
        if (original.methods.any { it.name == "dispatchTouchEvent" }) {
            throw PatchException("WatchLayout already overrides dispatchTouchEvent; the hook needs re-mapping")
        }
        val superType = original.superclass
            ?: throw PatchException("WatchLayout has no superclass")

        val watchLayout = mutableClassDefBy(WATCH_LAYOUT)
        val method = ImmutableMethod(
            WATCH_LAYOUT,
            "dispatchTouchEvent",
            listOf(ImmutableMethodParameter(MOTION_EVENT, null, null)),
            "Z",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable()

        // v0, v1 locals; p0 = this, p1 = event.
        method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $PLAYER_TOUCH->onDispatch(Landroid/view/View;$MOTION_EVENT)I
                move-result v0
                if-nez v0, :handled
                invoke-super { p0, p1 }, $superType->dispatchTouchEvent($MOTION_EVENT)Z
                move-result v0
                return v0
                :handled
                const/4 v1, 0x2
                if-ne v0, v1, :consume
                invoke-static { p1 }, $PLAYER_TOUCH->cancelOf($MOTION_EVENT)$MOTION_EVENT
                move-result-object v1
                invoke-super { p0, v1 }, $superType->dispatchTouchEvent($MOTION_EVENT)Z
                :consume
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
        watchLayout.methods.add(method)
    }
}
