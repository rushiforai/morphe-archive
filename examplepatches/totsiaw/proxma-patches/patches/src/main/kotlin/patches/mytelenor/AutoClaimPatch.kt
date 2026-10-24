package patches.mytelenor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN_ACTIVITY = "Lcom/telenor/pakistan/mytelenor/Main/MainActivity;"
private const val ENTRY_POINT = "Lapp/proxma/mytelenor/EntryPoint;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val BUNDLE = "Landroid/os/Bundle;"

internal val mytelenorMainActivityOnCreateFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(BUNDLE),
    custom = { method, classDef ->
        classDef.type == MAIN_ACTIVITY && method.name == "onCreate"
    },
)

@Suppress("unused")
val autoClaimPatch = bytecodePatch(
    name = "Auto-claim daily rewards",
    description = "Claims daily streak MBs and Answer & Win quiz rewards automatically " +
        "via a background WorkManager job scheduled from MainActivity.",
) {
    compatibleWith(COMPATIBILITY_MYTELENOR)
    extendWith("extensions/extension.mpe")

    execute {
        val onCreate = mytelenorMainActivityOnCreateFingerprint.method
        val instructions = onCreate.instructions.toList()

        val superCall = instructions.indexOfFirst { instruction ->
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
            throw PatchException(
                "MainActivity.onCreate has no invoke-super onCreate(Bundle) to anchor the worker on",
            )
        }

        onCreate.addInstructions(
            superCall + 1,
            "invoke-static {p0}, $ENTRY_POINT->onActivityCreate($ACTIVITY)V",
        )
    }
}
