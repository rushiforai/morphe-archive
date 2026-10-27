package patches.mytelenor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

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

private const val JOB_SERVICE = "app.proxma.mytelenor.ClaimJobService"

private val claimJobServiceManifestPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val permissions = doc.getElementsByTagName("uses-permission")
            val bootPermission = "android.permission.RECEIVE_BOOT_COMPLETED"
            if ((0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttribute("android:name") == bootPermission
                }
            ) {
                manifest.insertBefore(
                    doc.createElement("uses-permission").apply { setAttribute("android:name", bootPermission) },
                    manifest.firstChild,
                )
            }

            val application = doc.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                doc.createElement("service").apply {
                    setAttribute("android:name", JOB_SERVICE)
                    setAttribute("android:permission", "android.permission.BIND_JOB_SERVICE")
                    setAttribute("android:exported", "true")
                },
            )
        }
    }
}

@Suppress("unused")
val autoClaimPatch = bytecodePatch(
    name = "Auto-claim daily rewards",
    description = "Claims the daily streak MBs and plays the Answer & Win quiz automatically, using the answer key " +
        "the app already receives, then claims the quiz MBs. Runs at about 00:05 PKT, a few seconds after the " +
        "app is opened, and every 6 hours, retrying failures until late evening. A notification shows each " +
        "result. Swiping the app away from recents force-stops it and cancels the schedule until it is opened again.",
) {
    compatibleWith(COMPATIBILITY_MYTELENOR)
    extendWith("extensions/extension.mpe")
    dependsOn(claimJobServiceManifestPatch)

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
