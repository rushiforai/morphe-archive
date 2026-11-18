/* Double-tap model fingerprint adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * The dispatcher gate follows Afterglow's independent iOS gesture switches.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

internal val doubleTapGestureHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        val info = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            parameters = listOf("Landroid/view/MotionEvent;", "I", "Z", "Lj\$/time/Duration;"))
        val dispatch = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("Landroid/view/MotionEvent;", "Landroid/view/View;", "Z"),
            returnType = "V", filters = listOf(methodCall(
                definingClass = info.classDef.type, name = "<init>",
                parameters = listOf("Landroid/view/MotionEvent;", "I", "Z", "Lj\$/time/Duration;")
            ))).method
        // 21.43.523: Larxl.a creates Larxo with p3 as isChapterSeek, then g()
        // dispatches both seek and visual feedback. Gate before either side effect.
        require(dispatch.implementation!!.registerCount > 4) { "Double-tap dispatcher has no scratch register" }
        dispatch.addInstructionsWithLabels(0, """
            invoke-static/range { p3 .. p3 }, $EXTENSION_PACKAGE/playback/PlayerBehavior;->blockDoubleTap(Z)Z
            move-result v0
            if-eqz v0, :native_double_tap
            return-void
            :native_double_tap
            nop
        """)
        println("Afterglow double-tap dispatcher: ${dispatch.definingClass}->${dispatch.name}")
    }
}
