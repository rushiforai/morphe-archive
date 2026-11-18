/* Native fingerprints adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Rewritten for patcher 2.1 and Afterglow's iOS settings and defaults.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val BEHAVIOR = "$EXTENSION_PACKAGE/playback/PlayerBehavior;"

/** Android 21.43 removed the old ambient feature flags. Keep the server renderer unless disabled. */
internal val ambientModeHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        val host = Fingerprint(name = "toString", returnType = "Ljava/lang/String;",
            strings = listOf("RendererWithState{rendererLoadedState=")).classDef
        val constructor = host.methods.single { it.name == "<init>" && it.parameterTypes.size == 2 }
        val optional = constructor.parameterTypes[1].toString()
        require(optional == "Lj\$/util/Optional;") { "Ambient renderer optional type changed" }
        val helper = "afterglow_ambientRenderer"
        require(host.methods.none { it.name == helper })
        host.methods.add(ImmutableMethod(host.type, helper,
            listOf(ImmutableMethodParameter(optional, null, null)), optional,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(2)).toMutable().apply {
                addInstructionsWithLabels(0, """
                    invoke-static {}, $BEHAVIOR->disableAmbientMode()Z
                    move-result v0
                    if-eqz v0, :native_renderer
                    invoke-static {}, $optional->empty()$optional
                    move-result-object p0
                    :native_renderer
                    return-object p0
                """)
            })
        // Replacing only the optional leaves the native loading state and all other fields intact.
        constructor.addInstructions(0, """
            invoke-static/range { p2 .. p2 }, ${host.type}->$helper($optional)$optional
            move-result-object p2
        """)
        println("Afterglow ambient renderer: ${host.type}")
    }
}

/** Use the same update/seek methods as the native bar, preserving its DVR and chapter handling. */
internal val tapToSeekHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        val nativeTouch = Fingerprint(name = "onTouchEvent", returnType = "Z",
            parameters = listOf("Landroid/view/MotionEvent;"),
            filters = listOf(
                opcode(Opcode.INVOKE_VIRTUAL),
                opcode(Opcode.IGET_OBJECT, MatchAfterWithin(1)),
                opcode(Opcode.IGET_BOOLEAN, MatchAfterImmediately()),
                opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
                opcode(Opcode.INVOKE_VIRTUAL, MatchAfterImmediately()),
                opcode(Opcode.INT_TO_FLOAT, MatchAfterWithin(1)),
                opcode(Opcode.INT_TO_FLOAT, MatchAfterImmediately()),
                opcode(Opcode.INVOKE_VIRTUAL, MatchAfterImmediately()),
                opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
                opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
                opcode(Opcode.INVOKE_VIRTUAL, MatchAfterImmediately()),
                opcode(Opcode.INVOKE_VIRTUAL, MatchAfterImmediately())
            ))
        val handlers = listOf(nativeTouch.instructionMatches.first().index, nativeTouch.instructionMatches.last().index)
            .map { (nativeTouch.method.implementation!!.instructions[it] as ReferenceInstruction).reference as MethodReference }
        require(handlers.all { it.returnType == "V" && it.parameterTypes == listOf("I") }) { "Native tap seek handlers changed" }
        val touch = Fingerprint(name = "onTouchEvent", returnType = "Z",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("Landroid/view/MotionEvent;"), filters = listOf(
                literal(Int.MAX_VALUE),
                newInstance("Landroid/graphics/Point;"),
                methodCall(smali = "Landroid/graphics/Point;-><init>(II)V", location = MatchAfterImmediately()),
                methodCall(smali = "Lj\$/util/Optional;->of(Ljava/lang/Object;)Lj\$/util/Optional;", location = MatchAfterImmediately()),
                opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
                fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Lj\$/util/Optional;", location = MatchAfterImmediately()),
                opcode(Opcode.INVOKE_VIRTUAL, MatchAfterWithin(10))
            ))
        val host = touch.classDef
        // 21.43 has an intermediate class: Ljsb -> Ljrq -> Larua. Match the
        // actual bar independently instead of assuming the handlers are on its direct parent.
        require(host.type == Fingerprint(returnType = "V", strings = listOf("timed_markers_width")).classDef.type
                && handlers.all { it.definingClass == nativeTouch.method.definingClass }) {
            "Native seek-bar handlers changed"
        }
        val helper = "afterglow_tapToSeek"
        require(host.methods.none { it.name == helper })
        host.methods.add(ImmutableMethod(host.type, helper,
            listOf(ImmutableMethodParameter("I", null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            MutableMethodImplementation(3)).toMutable().apply {
                addInstructionsWithLabels(0, """
                    invoke-static {}, $BEHAVIOR->tapToSeek()Z
                    move-result v0
                    if-eqz v0, :native_gesture
                    invoke-virtual/range { p0 .. p1 }, ${handlers[0].smali}
                    invoke-virtual/range { p0 .. p1 }, ${handlers[1].smali}
                    :native_gesture
                    return-void
                """)
            })
        val insert = touch.instructionMatches.last().index
        val instructions = touch.method.implementation!!.instructions
        val receiver = instructions[insert].invokeRegisters.first()
        val x = instructions[touch.instructionMatches[2].index].invokeRegisters[1]
        require(receiver < 16 && x < 16) { "Native tap coordinates moved to high registers" }
        touch.method.addInstructions(insert + 1,
            "invoke-virtual { v$receiver, v$x }, ${host.type}->$helper(I)V")
        println("Afterglow tap seek: ${host.type} via ${handlers.joinToString { it.smali }}")
    }
}
