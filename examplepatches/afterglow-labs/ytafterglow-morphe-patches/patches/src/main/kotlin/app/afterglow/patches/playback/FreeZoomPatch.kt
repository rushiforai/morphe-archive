package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** 21.43 retains its original pinch-to-fill path alongside continuous 0.98x-8x zoom. */
internal val freeZoomHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        val scale = "Landroid/view/ScaleGestureDetector;"
        val zoom = Fingerprint(accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
            parameters = listOf(scale), returnType = "F",
            filters = listOf(methodCall(definingClass = scale, name = "getScaleFactor"),
                literal(0.98f), literal(8f))).classDef
        val gate = Fingerprint(parameters = listOf(scale), returnType = "V",
            filters = listOf(fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
                opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
                literal(1.05f, location = MatchAfterImmediately())),
            custom = { _, host -> host.type == zoom.type })
        val field = (gate.method.implementation!!.instructions[gate.instructionMatches.first().index]
            as ReferenceInstruction).reference as FieldReference
        require(field.definingClass == zoom.type && zoom.fields.single { it.name == field.name }
            .accessFlags and AccessFlags.PRIVATE.value != 0) { "Free zoom capability field changed" }

        // Begin, update, release and capability refresh must agree. Only filter reads;
        // retaining the native field lets switching off take effect without restarting.
        var reads = 0
        zoom.methods.forEach { method ->
            val sites = method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.IGET_BOOLEAN &&
                    (instruction as ReferenceInstruction).reference == field) index else null
            }.orEmpty()
            sites.asReversed().forEach { index ->
                val register = (method.implementation!!.instructions[index] as TwoRegisterInstruction).registerA
                method.addInstructions(index + 1, """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/PlayerBehavior;->allowFreeZoom(Z)Z
                    move-result v$register
                """)
            }
            reads += sites.size
        }
        require(reads == 5) { "Expected five native free zoom capability reads, found $reads" }

        val listener = Fingerprint(name = "onScaleBegin", parameters = listOf(scale), returnType = "Z",
            custom = { _, host ->
                host.interfaces == listOf("Landroid/view/ScaleGestureDetector\$OnScaleGestureListener;") &&
                    host.fields.any { it.type == scale } &&
                    host.fields.any { it.type == "Landroid/view/GestureDetector;" }
            }).classDef
        val touch = Fingerprint(parameters = listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
            returnType = "Z", custom = { _, host -> host.type == listener.type },
            filters = listOf(methodCall(definingClass = scale, name = "onTouchEvent")))
        val index = touch.instructionMatches.single().index
        val registers = touch.method.implementation!!.instructions[index].invokeRegisters
        require(registers.size == 2 && registers.all { it < 16 }) { "Zoom detector registers changed" }
        touch.method.addInstructions(index,
            "invoke-static { v${registers[0]}, v${registers[1]} }, $EXTENSION_PACKAGE/playback/FreeZoom;->onTouch($scale" +
                "Landroid/view/MotionEvent;)V")
        println("Afterglow free zoom: ${zoom.type}->${field.name}, $reads reads; ${listener.type} quick-scale detector")
    }
}
