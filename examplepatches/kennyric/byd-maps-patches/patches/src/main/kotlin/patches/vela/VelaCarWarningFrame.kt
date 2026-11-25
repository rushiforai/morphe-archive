package patches.vela

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val VELA_CAR_FRAME = "Lxv;->a(Lorg/maplibre/android/snapshotter/MapSnapshot;)V"
internal const val VELA_CAR_WARNING_HOOK = "Lnl/johninnl/vela/CarUi;->warningFrame(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/lang/Object;FF)V"
internal const val VELA_CAR_PUCK = "Lcw;->e(Landroid/graphics/Canvas;Lorg/maplibre/android/snapshotter/MapSnapshot;FFD)V"
private const val FRAME_HASH = "005a5364b0b0636cef02de4ccdafc8db413745b565e90b800fbb4c0abe9fd3d8"

/** The real MapSnapshot callback owns this Canvas; no replacement surface or navigation state. */
internal fun validateVelaCarWarningFrame(classes: Iterable<ClassDef>): Method {
    val all=classes.toList();val owner=all.single { it.type=="Lxv;" }
    check(owner.sourceFile==VELA_MAP_ID) { "Changed Vela car frame owner" }
    val method=owner.methods.single { it.toString()==VELA_CAR_FRAME }
    validateFrame(method)
    val renderer=all.single { it.type=="Lcw;" }
    check(renderer.fields.count { it.name=="I"&&it.type=="Z" }==1)
    check(renderer.methods.count { it.toString()=="Lcw;->n()Z" }==1)
    check(renderer.methods.count { it.toString()=="Lcw;->s()V" }==1)
    return method
}
private fun validateFrame(method:Method) {
    val body=method.implementation?:error("Missing Vela car frame")
    check(method.toString()==VELA_CAR_FRAME&&method.accessFlags==17&&body.registerCount==25
        &&body.instructions.count()==335&&velaFingerprint(method)==FRAME_HASH) {
        "Changed or already patched Vela native car frame $method"
    }
}
context(context: BytecodePatchContext)
internal fun validateVelaCarWarningExtension() {
    check(context.classDefBy("Lnl/johninnl/vela/CarUi;").methods.count { it.toString()==VELA_CAR_WARNING_HOOK }==1) {
        "Missing Vela warning frame extension"
    }
}
internal fun bindVelaCarWarningFrame(method:MutableMethod) {
    validateFrame(method)
    val native=method.getInstruction<FiveRegisterInstruction>(285)
    check(method.getInstruction(285).opcode==Opcode.INVOKE_VIRTUAL
        &&(native as ReferenceInstruction).reference.toString()=="Lcw;->g(Landroid/graphics/Canvas;)V"
        &&native.registerCount==2&&native.registerC==1&&native.registerD==2)
    val join=method.getInstruction<FiveRegisterInstruction>(286)
    check(method.getInstruction(286).opcode==Opcode.INVOKE_VIRTUAL
        &&(join as ReferenceInstruction).reference.toString()=="Lcw;->u()Landroid/graphics/Rect;"
        &&join.registerCount==1&&join.registerC==native.registerC)
    // The native puck call is the frame's last snapshot draw. Just before it, R8 lays out
    // v3=MapSnapshot (p1), v4/v5=the bitmap-to-surface scale factors and v2=Canvas; nothing writes
    // v3..v5 again before index 286 (pinned by FRAME_HASH, data flow checked in the unit test).
    val puck=method.instructions.withIndex().single { (it.value as? ReferenceInstruction)?.reference?.toString()==VELA_CAR_PUCK }.index
    val range=method.getInstruction<RegisterRangeInstruction>(puck)
    check(method.getInstruction(puck).opcode==Opcode.INVOKE_VIRTUAL_RANGE&&range.startRegister==1&&range.registerCount==7&&puck in 5 until 285)
    listOf(Triple(Opcode.MOVE_OBJECT,3,2),Triple(Opcode.MOVE,4,5),Triple(Opcode.MOVE,5,6),Triple(Opcode.MOVE_WIDE,6,7),Triple(Opcode.MOVE_OBJECT,2,11))
        .forEachIndexed { offset,(opcode,target,origin) ->
            val move=method.getInstruction<TwoRegisterInstruction>(puck-5+offset)
            check(method.getInstruction(puck-5+offset).opcode==opcode&&move.registerA==target&&move.registerB==origin) { "Changed Vela car snapshot registers" }
        }
    // Both navigation and SpeedDisplay false branches target this location. Replacement keeps
    // those incoming labels on the warning hook; plain insertion would skip it on both paths.
    method.replaceInstruction(286,"invoke-static {v1, v2, v3, v4, v5}, $VELA_CAR_WARNING_HOOK")
    method.addInstructions(287,"invoke-virtual {v1}, Lcw;->u()Landroid/graphics/Rect;")
}
