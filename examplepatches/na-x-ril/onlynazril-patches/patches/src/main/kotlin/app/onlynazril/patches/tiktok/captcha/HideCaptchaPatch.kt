package app.onlynazril.patches.tiktok.captcha

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tiktok.shared.callThroughLocals
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.patches.tiktok.shared.objectIn
import app.morphe.patches.tiktok.shared.requireLocals
import app.morphe.util.findMutableMethodOf
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val BRIDGE = "Lapp/onlynazril/extension/tiktok/captcha/CaptchaBridge;"
private const val PATCH = "Hide CAPTCHA popups"

/** The Turing (oecverify) dialog: the SDK's own captcha surface, not reached through `sec`. */
private const val TURING_DIALOG = "Lcom/tts/oecverify/BdTuring;"
private const val TURING_CALLBACK = "Lcom/tts/oecverify/BdTuringCallback;"
private const val TURING_SHOW = "showVerifyDialog"
private const val TURING_ACTIVITY = "Landroid/app/Activity;"

/** The method each puzzle callback is told the puzzle is over with; the class is read off the match. */
private const val SEC_DISMISS = "LIZJ"
private const val LIVE_DISMISS = "LIZIZ"

/**
 * Skips the risk-control puzzle TikTok shows while browsing.
 *
 * Every entry point that asks the app to show the puzzle is guarded at its top: the decision is
 * made in the extension (the switch, and whether this is account verification), and when it says
 * hide, the callback the app passed is told the puzzle is over and the method returns without ever
 * reaching the web view. Nothing is matched by name except the real-named ByteDance classes and
 * the callback's dismiss method (see `Fingerprints.kt`).
 *
 * Login, SMS and two-factor verification never pass through these entry points without an account
 * activity or scene, and the extension shows any puzzle whose activity or risk info names one. A
 * puzzle the server raised over a like, a follow or a comment is hidden too, which is the point of
 * the feature and its one cost: that single action is not completed. The switch turns it all off.
 */
@Suppress("unused")
val tiktokCaptchaPatch = bytecodePatch(
    name = PATCH,
    description = "Skips the risk-control puzzle TikTok shows while browsing, and lets the app " +
        "carry on. Account verification (login, SMS or two-factor) is never hidden. On by " +
        "default; the switch is in Tweaks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)
    extendWith("extensions/tiktok.mpe")

    execute {
        // The callback the app handed the entry point sits in p3 on all three shapes; the puzzle
        // is dismissed by telling it so, and a callback that declares no such method fails the
        // build rather than assembling a call to nothing. /range because a parameter register can
        // sit above v15 on a large method.
        fun dismissCall(callbackType: String, methodName: String): String {
            val classDef = classDefByOrNull(callbackType)
                ?: throw PatchException("$PATCH: the puzzle callback $callbackType is not in the app.")
            if (classDef.methods.none { it.name == methodName && it.parameterTypes.isEmpty() }) {
                throw PatchException("$PATCH: $callbackType declares no $methodName() to dismiss with.")
            }
            val kind = if (AccessFlags.INTERFACE.isSet(classDef.accessFlags)) {
                "invoke-interface/range"
            } else {
                "invoke-virtual/range"
            }
            return "$kind { p3 .. p3 }, $callbackType->$methodName()V"
        }

        SecCaptchaPopupFingerprint.method.apply {
            requireLocals(PATCH, 1)
            guardAtEntry(
                PATCH,
                "invoke-static/range { p1 .. p2 }, $BRIDGE" +
                    "->shouldHideCaptchaPopup(Landroid/app/Activity;Ljava/lang/String;)Z",
                dismissThenReturn(dismissCall(parameterTypes[2].toString(), SEC_DISMISS)),
            )
        }

        SecLegacyCaptchaPopupFingerprint.method.apply {
            requireLocals(PATCH, 1)
            guardAtEntry(
                PATCH,
                "invoke-static/range { p1 .. p2 }, $BRIDGE" +
                    "->shouldHideLegacyCaptchaPopup(Landroid/app/Activity;I)Z",
                dismissThenReturn(dismissCall(parameterTypes[2].toString(), SEC_DISMISS)),
            )
        }

        LiveCaptchaPopupFingerprint.method.apply {
            requireLocals(PATCH, 1)
            guardAtEntry(
                PATCH,
                "invoke-static/range { p1 .. p2 }, $BRIDGE" +
                    "->shouldHideCaptchaPopup(Landroid/app/Activity;Ljava/lang/String;)Z",
                dismissThenReturn(dismissCall(parameterTypes[2].toString(), LIVE_DISMISS)),
            )
        }

        // The Turing dialog is a second surface, not reached through `sec`: a hybrid page or a
        // live room is shown it by the oecverify SDK's own services, and a captcha that appears
        // while the three entry points above stay silent comes from here. Both overloads carry
        // the second shape's request or the older challenge code; the first parameter is the
        // activity and the third the callback, whichever it is. The real-named class is the
        // anchor, the request type is never written down.
        val turingDialogs = mutableListOf<Method>()
        classDefForEach { classDef ->
            if (classDef.type != TURING_DIALOG) return@classDefForEach
            classDef.methods
                .filter { it.isTuringShowVerifyDialog() }
                .forEach { turingDialogs += it }
        }
        if (turingDialogs.size != 2) {
            throw PatchException(
                "$PATCH: expected the two $TURING_DIALOG#$TURING_SHOW shapes, " +
                    "found ${turingDialogs.size}.",
            )
        }
        turingDialogs.forEach { dialog ->
            mutableClassDefBy(TURING_DIALOG).findMutableMethodOf(dialog).guardTuringDialog()
        }
    }
}

/** Whether the method is one of the two `BdTuring#showVerifyDialog` shapes. */
private fun Method.isTuringShowVerifyDialog(): Boolean =
    name == TURING_SHOW
            && returnType == "V"
            && implementation != null
            && parameterTypes.size == 3
            && parameterTypes[0] == TURING_ACTIVITY
            && parameterTypes[2] == TURING_CALLBACK

/**
 * Guards the Turing dialog at its entry. The bridge answers whether this one may be hidden and,
 * when it may, tells the callback the SDK's own "the dialog was closed" answer before the method
 * returns, so the caller's flow is not left waiting. The second parameter is the request or the
 * older challenge code, so it is not touched.
 */
private fun MutableMethod.guardTuringDialog() {
    requireLocals(PATCH, 1)
    val call = callThroughLocals(
        PATCH,
        "invoke-static",
        "$BRIDGE->shouldHideTuringPopup(Landroid/app/Activity;Ljava/lang/Object;)Z",
        objectIn("p1"),
        objectIn("p3"),
    )
    addInstructionsWithLabels(
        0,
        """
            $call
            move-result v0
            if-eqz v0, :morphe_captcha_turing_keep
            return-void
            :morphe_captcha_turing_keep
            nop
        """.trimIndent(),
    )
}

/** Tell the callback the puzzle is over, when there is one, and leave the method. */
private fun dismissThenReturn(dismiss: String): String =
    """
        if-eqz p3, :morphe_captcha_no_callback
        $dismiss
        :morphe_captcha_no_callback
        return-void
    """.trimIndent()
