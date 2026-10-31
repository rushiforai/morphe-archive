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
private const val CLAIM_SERVICE = "app.proxma.mytelenor.ClaimService"
private const val CLAIM_ALARM = "app.proxma.mytelenor.ClaimAlarm"

private val claimJobServiceManifestPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val permissions = doc.getElementsByTagName("uses-permission")
            listOf(
                "android.permission.RECEIVE_BOOT_COMPLETED",
                // ClaimService (foreground, dataSync) started by the exact ClaimAlarm
                "android.permission.FOREGROUND_SERVICE",
                "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
                "android.permission.SCHEDULE_EXACT_ALARM",
            ).forEach { permission ->
                if ((0 until permissions.length).none {
                        (permissions.item(it) as Element).getAttribute("android:name") == permission
                    }
                ) {
                    manifest.insertBefore(
                        doc.createElement("uses-permission").apply { setAttribute("android:name", permission) },
                        manifest.firstChild,
                    )
                }
            }

            val application = doc.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                doc.createElement("service").apply {
                    setAttribute("android:name", JOB_SERVICE)
                    setAttribute("android:permission", "android.permission.BIND_JOB_SERVICE")
                    setAttribute("android:exported", "true")
                },
            )
            application.appendChild(
                doc.createElement("service").apply {
                    setAttribute("android:name", CLAIM_SERVICE)
                    setAttribute("android:foregroundServiceType", "dataSync")
                    setAttribute("android:exported", "false")
                },
            )
            application.appendChild(
                doc.createElement("receiver").apply {
                    setAttribute("android:name", CLAIM_ALARM)
                    setAttribute("android:exported", "false")
                },
            )
        }
    }
}

@Suppress("unused")
val autoClaimPatch = bytecodePatch(
    name = "Auto-claim daily rewards",
    description = "Claims the daily streak MBs and plays the Answer & Win quiz automatically, using the answer key " +
        "the app already receives, then claims the quiz MBs. Runs at 00:05 PKT, shortly after the app is opened, " +
        "and every 6 hours, retrying failures until late evening. The 00:05 and app-open runs show a small " +
        "\"Claiming daily rewards\" notification for about a minute, which keeps the phone's battery manager " +
        "from cutting them off; allow \"Alarms & reminders\" for My Telenor so the 00:05 run can do that too. " +
        "A notification shows each result. Swiping the app away from recents force-stops it and cancels the " +
        "schedule until it is opened again.",
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
