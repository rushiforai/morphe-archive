package app.lchanc3.patches.jptt.connection

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.CONTENT_PAGER_ADAPTER_CLASS
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_RECONNECT_CLASS
import app.lchanc3.patches.jptt.shared.Constants.MAIN_ACTIVITY_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.lchanc3.patches.jptt.shared.newMethod
import app.lchanc3.patches.jptt.shared.requireFreeLocals
import app.lchanc3.patches.jptt.shared.toSmaliLiteral
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags

private const val COUNTDOWN_FIELD = "disconnectCountDown"
private const val COUNTDOWN_TYPE = "Landroid/os/CountDownTimer;"
private const val RECONNECT_FIELD = "drunnable"
private const val RECONNECT_TYPE = "Ljava/lang/Runnable;"
private const val BANNER_FIELD = "disconnectedTextView"
private const val BANNER_TYPE = "Landroid/widget/TextView;"

/** What setDisconnected() puts on the banner when it is given no reason. */
private const val HELD_BANNER_TEXT = "斷線了，點此立即重新連線"

/**
 * The methods added to MainActivity, named so they cannot collide with its own.
 * Public, because the extension calls them.
 */
private val HELPERS = mapOf(
    // Whether a reconnect is scheduled or held.
    "patchHasPendingReconnect" to ("Z" to """
        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$COUNTDOWN_FIELD:$COUNTDOWN_TYPE
        if-eqz v0, :none
        const/4 v0, 0x1
        return v0
        :none
        const/4 v0, 0x0
        return v0
    """),
    // Exactly what tapping the 斷線了 banner does. drunnable is safe to call from
    // anywhere on the main thread: it returns early when a connection is already
    // being made, and falls back to scheduling a countdown when the device is
    // offline.
    "patchReconnectNow" to ("V" to """
        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$COUNTDOWN_FIELD:$COUNTDOWN_TYPE
        if-eqz v0, :none
        invoke-virtual { v0 }, $COUNTDOWN_TYPE->cancel()V
        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$RECONNECT_FIELD:$RECONNECT_TYPE
        invoke-interface { v0 }, $RECONNECT_TYPE->run()V
        :none
        return-void
    """),
    // Stops the countdown but leaves it in the field, which is what keeps the
    // banner's tap handler working and setDisconnected() from starting another.
    // The text is reset because a countdown with a reason counts down on it.
    "patchHoldReconnect" to ("V" to """
        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$COUNTDOWN_FIELD:$COUNTDOWN_TYPE
        if-eqz v0, :none
        invoke-virtual { v0 }, $COUNTDOWN_TYPE->cancel()V
        iget-object v0, p0, $MAIN_ACTIVITY_CLASS->$BANNER_FIELD:$BANNER_TYPE
        const-string v1, "${HELD_BANNER_TEXT.toSmaliLiteral()}"
        invoke-virtual { v0, v1 }, $BANNER_TYPE->setText(Ljava/lang/CharSequence;)V
        :none
        return-void
    """),
)

@Suppress("unused")
val reconnectOnResumePatch = bytecodePatch(
    name = "Reconnect on return",
    description = "Reconnects the moment you come back to the app, instead of leaving " +
        "you on a countdown that grows to eight seconds. While an article is open it " +
        "waits until you leave it or do something that needs PTT, so opening links " +
        "does not log you in again every time.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        val classDef = MainActivityOnResumeFingerprint.classDef

        listOf(
            COUNTDOWN_FIELD to COUNTDOWN_TYPE,
            RECONNECT_FIELD to RECONNECT_TYPE,
            BANNER_FIELD to BANNER_TYPE,
        ).forEach { (name, type) ->
            if (classDef.fields.none { it.name == name && it.type == type }) {
                throw PatchException(
                    "$MAIN_ACTIVITY_CLASS has no $name of type $type. " +
                        "JPTT's reconnect handling has changed.",
                )
            }
        }

        // In methods of their own because the fields are private to MainActivity
        // and the extension decides when to use them.
        HELPERS.forEach { (name, body) ->
            val (returnType, smali) = body
            if (classDef.methods.any { it.name == name }) {
                throw PatchException("$MAIN_ACTIVITY_CLASS already has a $name method.")
            }
            classDef.methods.add(
                newMethod(
                    MAIN_ACTIVITY_CLASS,
                    name,
                    returnType,
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    // v0 and v1, and p0 for the activity itself.
                    registers = 3,
                    smali,
                ),
            )
        }

        // After the super call, by which point onStart() has set activityIsActive,
        // which drunnable requires before it will reconnect at all. Only p0 is
        // read: onResume() is compiled down to nothing but that in 3.8.5.
        MainActivityOnResumeFingerprint.method.addInstruction(
            1,
            "invoke-static { p0 }, $EXTENSION_RECONNECT_CLASS->onResume($MAIN_ACTIVITY_CLASS)V",
        )

        // The countdown's onFinish() runs drunnable and nothing else; hand the
        // decision to the extension instead. The method has no register but p0,
        // which is free to reuse for the activity since nothing after it runs.
        val countdown = ReconnectCountdownFinishFingerprint
        val outerField = countdown.classDef.fields.singleOrNull { it.type == MAIN_ACTIVITY_CLASS }
            ?: throw PatchException("The reconnect countdown no longer holds its activity in one field.")
        countdown.method.addInstructions(
            0,
            """
                iget-object p0, p0, ${countdown.classDef.type}->${outerField.name}:$MAIN_ACTIVITY_CLASS
                invoke-static { p0 }, $EXTENSION_RECONNECT_CLASS->onCountdownFinished($MAIN_ACTIVITY_CLASS)V
                return-void
            """,
        )

        NotifyNotConnectedFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_RECONNECT_CLASS->onNotConnected($MAIN_ACTIVITY_CLASS)V",
        )

        ContentPageSelectedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, " +
                "$EXTENSION_RECONNECT_CLASS->onPageSelected(${CONTENT_PAGER_ADAPTER_CLASS}I)V",
        )

        // Both are one-liners with no register but p0 and the view, and nothing
        // is written here.
        SidebarOpenedFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_RECONNECT_CLASS->onSidebarOpened()V",
        )
        SidebarClosedFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_RECONNECT_CLASS->onSidebarClosed()V",
        )

        // getMorePush() asks PTT for new pushes without checking for a connection
        // first, and while one is being made that would type into the login
        // screen. Its first instruction reads the mode, so v0 is free.
        val morePush = ArticleGetMorePushFingerprint.method
        if (ArticleGetMorePushFingerprint.classDef.fields.none { it.name == "mode" && it.type == "C" }) {
            throw PatchException("${morePush.definingClass} has no mode of type char.")
        }
        requireFreeLocals(morePush, 1)
        morePush.addInstructionsWithLabels(
            0,
            """
                iget-char v0, p0, ${morePush.definingClass}->mode:C
                invoke-static { v0, p1 }, $EXTENSION_RECONNECT_CLASS->skipMorePush(CLjava/lang/Runnable;)Z
                move-result v0
                if-eqz v0, :load
                return-void
            """,
            ExternalLabel("load", morePush.getInstruction(0)),
        )
    }
}
