package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Picture-in-picture — EXPERIMENTAL, and the description says why.
 *
 * Waze's map activity never asks Android to float, so leaving Waze (home, recents, another app)
 * just backgrounds it. This row injects the request: a `primePip(Activity)` helper into
 * UidFragmentActivity, called from onResume and onUserLeaveHint, which builds PiP params with a
 * 9:16 aspect ratio and auto-enter.
 *
 * KNOWN ISSUE, deliberately shipped as-is: Waze lays its HUD out at phone density, and in a PiP
 * window that never shrinks. The speedometer, the sheets and the buttons stay full size and cover
 * the map. Effects that were tried and dropped: hiding the chrome view by view (the overlay repaints
 * on top), halving DisplayMetrics (Compose reads density at composition), and overriding
 * attachBaseContext (AppCompat declares it final - overriding it crashes Waze at startup with a
 * VerifyError). None of them shipped, because none of them worked. The PiP window itself is fine.
 *
 * Rebuilt from the compiled classes in waze-patches-LOCAL-DEV-2026-10-22.mpp.
 */
private const val FREE_MAP_ACTIVITY = "Lcom/waze/FreeMapAppActivity;"
private const val FREE_MAP_SUPER = "Lcom/waze/bv;"
private const val UID_ACTIVITY = "Lcom/waze/uid/activities/UidFragmentActivity;"
private const val UID_SUPER = "Lcom/waze/sharedui/a/f;"
private const val ACTIVITY_TYPE = "Landroid/app/Activity;"
private const val PIP_HELPER_NAME = "primePip"

/** UidFragmentActivity.onResume - the surface Waze shows when it comes back from PiP. */
internal val UidFragmentResumeFingerprint = Fingerprint(
    definingClass = UID_ACTIVITY,
    name = "onResume",
    parameters = listOf(),
    returnType = "V",
)

/** MainActivity.onResume - the second entry point, when Waze starts straight into the map. */
internal val MainActivityResumeFingerprint = Fingerprint(
    definingClass = "Lcom/waze/MainActivity;",
    name = "onResume",
    parameters = listOf(),
    returnType = "V",
)


@Suppress("unused")
val pictureInPicturePatch = bytecodePatch(
    name = "Picture-in-picture",
    description = "Floats Waze in a 9:16 window every time you leave it. Known issues: touch does not " +
        "work on the floating window, and the UI does not scale down.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    dependsOn(pipManifestPatch)
    dependsOn(configOverridesPatch)

    execute {
        // Auto-enter is on unconditionally: the route-gated variant never fired on the phone, so the
        // row floats every time Waze is left. Waze still only shows the window while it is on screen.
        val gate = "const/4 v1, 0x1"

        val uid = mutableClassDefBy(UID_ACTIVITY)
        if (uid.methods.any { it.name == PIP_HELPER_NAME }) {
            throw PatchException("pictureInPicturePatch: primePip already exists - refusing to add it twice")
        }

        val helper = MutableMethod(
            ImmutableMethod(
                UID_ACTIVITY,
                PIP_HELPER_NAME,
                listOf(ImmutableMethodParameter(ACTIVITY_TYPE, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                ImmutableMethodImplementation(9, emptyList(), emptyList(), emptyList()),
            ),
        )
        helper.addInstructions(
            0,
            """
            $gate
            new-instance v2, Landroid/app/PictureInPictureParams${'$'}Builder;
            invoke-direct {v2}, Landroid/app/PictureInPictureParams${'$'}Builder;-><init>()V
            new-instance v3, Landroid/util/Rational;
            const/16 v4, 0x9
            const/16 v5, 0x10
            invoke-direct {v3, v4, v5}, Landroid/util/Rational;-><init>(II)V
            invoke-virtual {v2, v3}, Landroid/app/PictureInPictureParams${'$'}Builder;->setAspectRatio(Landroid/util/Rational;)Landroid/app/PictureInPictureParams${'$'}Builder;
            move-result-object v2
            invoke-virtual {v2, v1}, Landroid/app/PictureInPictureParams${'$'}Builder;->setAutoEnterEnabled(Z)Landroid/app/PictureInPictureParams${'$'}Builder;
            move-result-object v2
            invoke-virtual {v2}, Landroid/app/PictureInPictureParams${'$'}Builder;->build()Landroid/app/PictureInPictureParams;
            move-result-object v2
            move-object/from16 v6, p0
            invoke-virtual {v6, v2}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
            return-void
            """.trimIndent(),
        )
        uid.methods.add(helper)

        val call = "invoke-static {p0}, $UID_ACTIVITY->$PIP_HELPER_NAME($ACTIVITY_TYPE)V"
        UidFragmentResumeFingerprint.method.addInstructions(0, call)

        val mainResume = MainActivityResumeFingerprint.method
        val alreadyPrimed = mainResume.implementation?.toString()?.contains(PIP_HELPER_NAME) == true
        if (!alreadyPrimed) mainResume.addInstructions(0, call)

        // FreeMapAppActivity can be the first activity when Waze opens straight into the map. It has
        // no onResume of its own in 5.26.0.0, so one is added that defers to the superclass first.
        val freeMap = mutableClassDefBy(FREE_MAP_ACTIVITY)
        val hasResume = freeMap.methods.any { it.name == "onResume" && it.parameterTypes.isEmpty() }
        if (!hasResume) {
            val override = MutableMethod(
                ImmutableMethod(
                    FREE_MAP_ACTIVITY,
                    "onResume",
                    emptyList(),
                    "V",
                    AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()),
                ),
            )
            override.addInstructions(
                0,
                """
                invoke-super {p0}, $FREE_MAP_SUPER->onResume()V
                $call
                return-void
                """.trimIndent(),
            )
            freeMap.methods.add(override)
        }

        // onUserLeaveHint fires exactly when the user leaves Waze, which is the cleanest moment to
        // hand the window over. It is added rather than hooked, so it also works if Waze never
        // overrides it.
        val hasLeaveHint = uid.methods.any { it.name == "onUserLeaveHint" && it.parameterTypes.isEmpty() }
        if (!hasLeaveHint) {
            val leaveHint = MutableMethod(
                ImmutableMethod(
                    UID_ACTIVITY,
                    "onUserLeaveHint",
                    emptyList(),
                    "V",
                    AccessFlags.PROTECTED.value,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()),
                ),
            )
            leaveHint.addInstructions(
                0,
                """
                invoke-super {p0}, $UID_SUPER->onUserLeaveHint()V
                $call
                return-void
                """.trimIndent(),
            )
            uid.methods.add(leaveHint)
        }

        // Inside PiP the HUD ComposeView covers the window, so every tap is consumed by panels and the
        // map underneath never sees a gesture. Hiding the HUD is not an option: the map is hosted as an
        // AndroidView *inside* that Compose tree (id wazeMapAndroidView), so hiding the parent blanks the
        // window. Instead the events are routed straight to the map view while floating - rendering is
        // untouched, the HUD still draws, and the touches go where the finger is.
        val hasTouchRouter = uid.methods.any { it.name == "dispatchTouchEvent" }
        if (!hasTouchRouter) {
            val router = MutableMethod(
                ImmutableMethod(
                    UID_ACTIVITY,
                    "dispatchTouchEvent",
                    listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;", null, null)),
                    "Z",
                    AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(4, emptyList(), emptyList(), emptySet()),
                ),
            )
            router.addInstructions(
                0,
                """
                invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z
                move-result v0
                if-eqz v0, :pipPassThrough
                const v0, 0x7f0a0820
                invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                if-eqz v0, :pipPassThrough
                invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
                move-result v1
                if-eqz v1, :pipPassThrough
                const/4 v1, 0x1
                return v1
                :pipPassThrough
                invoke-super {p0, p1}, $UID_SUPER->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
                move-result v1
                return v1
                """.trimIndent(),
            )
            uid.methods.add(router)
        }

        println(
            "pictureInPicturePatch: 9:16 PiP primed from onResume + onUserLeaveHint, auto-enter always",
        )
        // The lock screen is the thing that actually eats the touches. Waze raises it while a route is
        // running, and in PiP it stays up, which is why the window shows "Screen is locked" and ignores
        // every finger. Both state readers are pinned to false, so the lock never engages and the map
        // stays live in the window. p0 is reused as the return register, so this works whatever the
        // method's own .locals count is.
        println("pictureInPicturePatch: touches routed to wazeMapAndroidView while floating")
    }
}
