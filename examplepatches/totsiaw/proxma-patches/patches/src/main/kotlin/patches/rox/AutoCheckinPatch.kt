package patches.rox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN_ACTIVITY = "Lcom/jazz/rox/MainActivity;"
private const val AUTO_CHECKIN = "Lapp/proxma/rox/AutoCheckin;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val BUNDLE = "Landroid/os/Bundle;"

internal val roxMainActivityOnCreateFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(BUNDLE),
    custom = { method, classDef ->
        classDef.type == MAIN_ACTIVITY && method.name == "onCreate"
    },
)

@Suppress("unused")
val autoCheckinPatch = bytecodePatch(
    name = "Auto check-in daily streak",
    description = "Presses the Daily Streak Check-in button for you when the app is open, once a day. " +
        "It runs the app's own check-in, so it needs you to be signed in and to open the app each day.",
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")

    execute {
        val onCreate = roxMainActivityOnCreateFingerprint.method
        val superCall = onCreate.instructions.toList().indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.INVOKE_SUPER) {
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

        onCreate.addInstructions(
            superCall + 1,
            "invoke-static {p0}, $AUTO_CHECKIN->onActivityCreate($ACTIVITY)V",
        )
    }
}
