/*
 * YTAfterglow for Android.
 *
 * Adapted from the autoplay button part of the "Hide player overlay buttons" patch of
 * Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3), which was
 * forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3).
 * Modified for YTAfterglow: rewritten for patcher 2.1.0, gated by the iOS setting
 * autoplayMode. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val AUTOPLAY_CLASS = "$EXTENSION_PACKAGE/playback/Autoplay;"

/** Initial load readiness and live visibility are independent of next-video autonav. */
internal val autoplayHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val load = Fingerprint(parameters = listOf("L"), returnType = "V", strings = listOf(
            "MedialibPlayer.loadVideo(cpn=%s playWhenReady=%b positionMs=%s playerEvents=[%d] videoId=%s volume=%s pauseOnLastFrame=%b)"
        )).method
        val model = load.parameterTypes.single().toString()
        // The native log identifies flag 2 as playWhenReady. Follow its interface
        // getter into the copied configuration, rather than assuming a field name.
        val flagTest = Fingerprint(filters = listOf(literal(2),
            methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(model, "I"),
                returnType = "Z", location = MatchAfterImmediately())
        )).match(load).instructionMatches.last().getMethodCalled()
        val flagsGetter = Fingerprint(filters = listOf(
            methodCall(opcode = Opcode.INVOKE_INTERFACE, definingClass = model,
                parameters = listOf(), returnType = "I"), opcode(Opcode.AND_INT_2ADDR)
        )).match(flagTest).instructionMatches.first().methodReference
        val copyCall = Fingerprint(filters = listOf(
            methodCall(opcode = Opcode.INVOKE_DIRECT, name = "<init>",
                parameters = listOf(model), returnType = "V")
        )).match(load).instructionMatches.single()
        val copyConstructor = copyCall.getMethodCalled()
        val baseConstructor = Fingerprint(filters = listOf(
            methodCall(opcode = Opcode.INVOKE_DIRECT, name = "<init>",
                parameters = listOf(model), returnType = "V")
        )).match(copyConstructor).instructionMatches.single().getMethodCalled()
        val flagsCopy = Fingerprint(filters = listOf(
            methodCall(smali = flagsGetter.smali),
            opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
            fieldAccess(opcode = Opcode.IPUT, type = "I", location = MatchAfterImmediately())
        )).match(baseConstructor)
        val flagIndex = flagsCopy.instructionMatches.last().index
        val field = (baseConstructor.implementation!!.instructions[flagIndex] as ReferenceInstruction)
            .reference as FieldReference
        val host = mutableClassDefBy(copyConstructor.definingClass)
        require(host.superclass == baseConstructor.definingClass && field.definingClass == host.superclass) {
            "Native initial-load flags no longer belong to the private configuration copy"
        }
        val helper = "afterglow_initialPlayback"
        require(host.methods.none { it.name == helper })
        host.addMethod(helper, "V", 2, """
            iget v0, p0, ${field.smali}
            invoke-static { v0 }, $AUTOPLAY_CLASS->startFlags(I)I
            move-result v0
            iput v0, p0, ${field.smali}
            return-void
        """)
        val instance = load.implementation!!.instructions[copyCall.index].invokeRegisters.first()
        // Only this new load's private copy changes. Later manual Play/Pause calls,
        // the caller's configuration and other playback flags retain native behavior.
        load.addInstructions(copyCall.index + 1,
            "invoke-virtual/range { v$instance .. v$instance }, ${host.type}->$helper()V")
        println("Afterglow autoplay initial load: ${load.smali}, flags=${field.smali}")

        // Bind the inflated root through the native switch controller. Keeping the
        // controller alive lets Off + hidden restore live without rebuilding a video.
        val toggle = Fingerprint(accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
            parameters = listOf(), returnType = "V", filters = listOf(
                methodCall(parameters = listOf(), returnType = "Landroid/view/View;"),
                opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
                resourceLiteral(ResourceType.ID, "autonav_toggle_button")
            ))
        val read = toggle.instructionMatches[1].index
        val root = (toggle.method.implementation!!.instructions[read] as OneRegisterInstruction).registerA
        toggle.method.addInstructions(read + 1,
            "invoke-static/range { v$root .. v$root }, $EXTENSION_PACKAGE/playback/PlayerOverlay;->autoplay(Landroid/view/View;)V")
        println("Afterglow autoplay switch: ${toggle.method.smali}")
    }
}
