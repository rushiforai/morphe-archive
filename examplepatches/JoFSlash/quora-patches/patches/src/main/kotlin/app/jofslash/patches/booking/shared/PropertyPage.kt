package app.jofslash.patches.booking.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PROPERTY_PAGE_ACTIVITY = "Lcom/booking/property/detail/PropertyPageActivity;"

// The property (hotel) page. Its constructor runs before onCreate, which is a safe place to hook
// the activity's lifecycle.
internal object PropertyPageConstructorFingerprint : Fingerprint(
    definingClass = PROPERTY_PAGE_ACTIVITY,
    name = "<init>",
    returnType = "V",
)

/**
 * Calls [extensionMethod] (a static method taking an Activity) from the property page's
 * constructor, right after the superclass constructor, when the activity can be used.
 */
internal fun BytecodePatchContext.callFromPropertyPageConstructor(extensionMethod: String) {
    val method = PropertyPageConstructorFingerprint.method
    val instructions = method.implementation!!.instructions.toList()
    val superCall = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT &&
                ((instruction as ReferenceInstruction).reference as MethodReference).let {
                    it.name == "<init>" && it.definingClass != PROPERTY_PAGE_ACTIVITY
                }
    }
    if (superCall < 0) throw PatchException("Couldn't find the property page's superclass constructor call")
    method.addInstruction(superCall + 1, "invoke-static/range { p0 .. p0 }, $extensionMethod")
}
