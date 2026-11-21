package patches.rox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN_ACTIVITY = "Lcom/jazz/rox/MainActivity;"
private const val AUTO_CHECKIN = "Lapp/proxma/rox/AutoCheckin;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val BUNDLE = "Landroid/os/Bundle;"

// No accessFlags filter: it is matched exactly, and MainActivity.onCreate is `public` in
// 3.0.13 but `public final` in 3.0.14. The class + name + signature already pin it uniquely.
internal val roxMainActivityOnCreateFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(BUNDLE),
    custom = { method, classDef ->
        classDef.type == MAIN_ACTIVITY && method.name == "onCreate"
    },
)

@Suppress("unused")
val autoCheckinPatch = bytecodePatch(
    name = "Auto check-in daily streak",
    description = "Presses the Daily Streak Check-in button for you when the app is open, once a day. " +
        "It runs the app's own check-in, so it needs you to be signed in. Add \"Auto check-in in the " +
        "background\" so you don't have to open the app each day.",
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")

    execute {
        val onCreate = roxMainActivityOnCreateFingerprint.method
        val superCall = onCreate.instructions.toList().indexOfFirst { instruction ->
            // 3.0.13 compiled this as invoke-super; 3.0.14 as invoke-super/range. Accept both.
            if (instruction.opcode != Opcode.INVOKE_SUPER && instruction.opcode != Opcode.INVOKE_SUPER_RANGE) {
                return@indexOfFirst false
            }
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfFirst false
            reference.name == "onCreate" &&
                reference.parameterTypes.size == 1 &&
                reference.parameterTypes.first().toString() == BUNDLE
        }
        if (superCall < 0) {
            throw PatchException("MainActivity.onCreate has no invoke-super onCreate(Bundle) to anchor on")
        }

        // Range form: in 3.0.14 onCreate uses enough registers that p0 is above v15, which a
        // plain invoke-static {p0} cannot encode.
        onCreate.addInstructions(
            superCall + 1,
            "invoke-static/range {p0 .. p0}, $AUTO_CHECKIN->onActivityCreate($ACTIVITY)V",
        )
    }
}
