package app.anghami.patches.system

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceVoid
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Removes the secure-window flag the app installs on its activities, so screen
 * capture is permitted everywhere instead of being refused by the platform.
 *
 * The single method below is the place where the window manager is asked to
 * treat the current window as protected. Emptying it leaves the rest of the
 * activity setup intact while the flag is never actually applied, which is what
 * lets both screenshots and screen recordings succeed.
 */
@Suppress("unused")
val screenshotUnlockPatch = bytecodePatch(
    name = "Allow Screenshots",
    description = "Bypasses secure window restrictions to allow screenshots and screen recording across the app.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        MainActivitySetSecureScreenSignature.method.forceVoid()
    }
}

/** Activity hook that marks the window as non-capturable. */
object MainActivitySetSecureScreenSignature : Fingerprint(
    definingClass = "Lcom/anghami/app/main/MainActivity;",
    name = "e1",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)
