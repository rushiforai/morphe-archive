package app.lchanc3.patches.jptt.connection

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.MAIN_ACTIVITY_CLASS
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val COUNTDOWN_FIELD = "disconnectCountDown"
private const val COUNTDOWN_TYPE = "Landroid/os/CountDownTimer;"
private const val RECONNECT_FIELD = "drunnable"
private const val RECONNECT_TYPE = "Ljava/lang/Runnable;"

/** The helper added to MainActivity, named so it cannot collide with its own. */
private const val HELPER_METHOD = "reconnectAfterResume"

@Suppress("unused")
val reconnectOnResumePatch = bytecodePatch(
    name = "Reconnect on return",
    description = "Reconnects the moment you come back to the app, instead of leaving " +
        "you on a countdown that grows to eight seconds and does not even run while the " +
        "app is in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    execute {
        val classDef = MainActivityOnResumeFingerprint.classDef

        listOf(COUNTDOWN_FIELD to COUNTDOWN_TYPE, RECONNECT_FIELD to RECONNECT_TYPE)
            .forEach { (name, type) ->
                if (classDef.fields.none { it.name == name && it.type == type }) {
                    throw PatchException(
                        "$MAIN_ACTIVITY_CLASS has no $name of type $type. " +
                            "JPTT's reconnect handling has changed.",
                    )
                }
            }

        if (classDef.methods.any { it.name == HELPER_METHOD }) {
            throw PatchException("$MAIN_ACTIVITY_CLASS already has a $HELPER_METHOD method.")
        }

        // This is exactly what tapping the "斷線了" banner does. It goes in a method
        // of its own because onResume() is compiled down to nothing but the
        // parameter register in 3.8.5, leaving nowhere to hold a field value, and
        // because both fields are private to MainActivity.
        //
        // drunnable is safe to call from here: it returns early when a connection
        // is already being made, and falls back to scheduling a countdown when the
        // device is offline.
        classDef.methods.add(
            ImmutableMethod(
                MAIN_ACTIVITY_CLASS,
                HELPER_METHOD,
                emptyList(),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                emptySet(),
                null,
                ImmutableMethodImplementation(
                    // v0 to hold each field, and p0 for the activity itself.
                    2,
                    """
                        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$COUNTDOWN_FIELD:$COUNTDOWN_TYPE
                        if-eqz v0, :connected
                        invoke-virtual { v0 }, $COUNTDOWN_TYPE->cancel()V
                        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$RECONNECT_FIELD:$RECONNECT_TYPE
                        invoke-interface { v0 }, $RECONNECT_TYPE->run()V
                        :connected
                        return-void
                    """.toInstructions(),
                    null,
                    null,
                ),
            ).toMutable(),
        )

        // After the super call, by which point onStart() has set activityIsActive,
        // which drunnable requires before it will reconnect at all.
        MainActivityOnResumeFingerprint.method.addInstruction(
            1,
            "invoke-direct { p0 }, $MAIN_ACTIVITY_CLASS->$HELPER_METHOD()V",
        )
    }
}
