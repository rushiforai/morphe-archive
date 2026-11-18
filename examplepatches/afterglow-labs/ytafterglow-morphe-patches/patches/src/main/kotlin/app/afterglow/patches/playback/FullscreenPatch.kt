/* Fullscreen controller discovery adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Afterglow uses its own activation/session policy and preserves native feature flags.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.installAtStartup
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal val fullscreenHookPatch = bytecodePatch {
    dependsOn(videoStatePatch)
    execute {
        val exit = Fingerprint(filters = listOf(
            string("Ad player fullscreen state entity is null in onSuccess on exit"),
            methodCall(name = "getFullscreenForced", returnType = "Ljava/lang/Boolean;", parameters = listOf()),
            methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf(), returnType = "V",
                location = MatchAfterWithin(10))
        )).instructionMatches.last().getMethodCalled()
        val host = mutableClassDefBy(exit.definingClass)
        val enter = Fingerprint(name = "onClick", returnType = "V", parameters = listOf("Landroid/view/View;"),
            filters = listOf(
                fieldAccess(opcode = Opcode.IGET_OBJECT, type = host.type),
                methodCall(opcode = Opcode.INVOKE_VIRTUAL, definingClass = host.type, returnType = "V",
                    parameters = listOf(), location = MatchAfterWithin(3)),
                methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = exit.smali, location = MatchAfterWithin(10))
            )).instructionMatches[1].getMethodCalled()
        val bridge = "$EXTENSION_PACKAGE/playback/FullscreenController;"
        host.interfaces.add(bridge)
        host.addMethod("afterglow_enterFullscreen", "V", 1, "invoke-virtual { p0 }, ${enter.smali}\nreturn-void")
        host.addMethod("afterglow_exitFullscreen", "V", 1, "invoke-virtual { p0 }, ${exit.smali}\nreturn-void")
        val create = Fingerprint(
            definingClass = "Lcom/google/android/apps/youtube/app/watch/nextgenwatch/ui/NextGenWatchLayout;",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            filters = listOf(checkCast(host.type)))
        val index = create.instructionMatches.single().index
        val register = (create.method.implementation!!.instructions[index] as OneRegisterInstruction).registerA
        create.method.addInstruction(index + 1,
            "invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/Fullscreen;->setController($bridge)V")
        installAtStartup("$EXTENSION_PACKAGE/playback/Fullscreen;")
        println("Afterglow fullscreen: enter ${enter.smali}; exit ${exit.smali}")
    }
}
