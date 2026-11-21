package patches.rox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val JOB_SERVICE_CLASS = "Lapp/proxma/rox/CheckinJobService;"
private const val JOB_SERVICE = "app.proxma.rox.CheckinJobService"
private const val ALARM_RECEIVER = "app.proxma.rox.CheckinAlarm"
private val WAKE_PERMISSIONS = listOf(
    "android.permission.USE_FULL_SCREEN_INTENT",
    "android.permission.SYSTEM_ALERT_WINDOW",
)

private val checkinJobServiceManifestPatch = resourcePatch {
    // Clears 3.0.14's duplicate <application android:name> before this reads the manifest as XML.
    dependsOn(fixApplicationNamePatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            // What lets the background run open ROX's own screen, where the check-in works:
            // a full-screen notification, or "Appear on top" once the user turns it on.
            val manifest = doc.documentElement
            val permissions = doc.getElementsByTagName("uses-permission")
            for (permission in WAKE_PERMISSIONS) {
                if ((0 until permissions.length).none {
                        (permissions.item(it) as Element).getAttribute("android:name") == permission
                    }
                ) {
                    manifest.insertBefore(
                        doc.createElement("uses-permission").apply {
                            setAttribute("android:name", permission)
                        },
                        application,
                    )
                }
            }
            val services = doc.getElementsByTagName("service")
            if ((0 until services.length).none {
                    (services.item(it) as Element).getAttribute("android:name") == JOB_SERVICE
                }
            ) {
                application.appendChild(
                    doc.createElement("service").apply {
                        setAttribute("android:name", JOB_SERVICE)
                        setAttribute("android:permission", "android.permission.BIND_JOB_SERVICE")
                        setAttribute("android:exported", "false")
                    },
                )
            }
            // The wake-up alarm that starts the check-in on time while Doze holds the job back.
            val receivers = doc.getElementsByTagName("receiver")
            if ((0 until receivers.length).none {
                    (receivers.item(it) as Element).getAttribute("android:name") == ALARM_RECEIVER
                }
            ) {
                application.appendChild(
                    doc.createElement("receiver").apply {
                        setAttribute("android:name", ALARM_RECEIVER)
                        setAttribute("android:exported", "false")
                    },
                )
            }
        }
    }
}

@Suppress("unused")
val backgroundCheckinPatch = bytecodePatch(
    name = "Auto check-in in the background",
    description = "Does the daily streak check-in without you opening ROX. Shortly after midnight " +
        "(Pakistan time) an alarm that also fires while the phone sleeps wakes ROX; if today's check-in " +
        "isn't done yet, ROX opens its own screen for a moment, presses Check-in and closes again. While " +
        "the phone is in use that screen is see-through and lets your taps through, so you keep using what " +
        "you had open. While the phone is locked it opens over the lock screen if full-screen notifications " +
        "are allowed for ROX; otherwise the check-in waits and runs right after you next unlock the phone. " +
        "If Android doesn't allow ROX to open itself, a notification on the next " +
        "app open asks you to turn on \"Appear on top\" for ROX; until then it tries off-screen. " +
        "It retries up to three times a day. A notification says when it worked, or asks " +
        "you to tap it if it couldn't; the next time you open ROX a short message also says what the last " +
        "background try did. You must be signed in, and ROX must have been opened once after installing. " +
        "Force-stopping ROX stops it until the next time you open the app.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")
    dependsOn(autoCheckinPatch, checkinJobServiceManifestPatch)

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
                reference.parameterTypes.first().toString() == "Landroid/os/Bundle;"
        }
        if (superCall < 0) {
            throw PatchException("MainActivity.onCreate has no invoke-super onCreate(Bundle) to anchor on")
        }

        // Range form: in 3.0.14 onCreate uses enough registers that p0 is above v15, which a
        // plain invoke-static {p0} cannot encode.
        onCreate.addInstructions(
            superCall + 1,
            "invoke-static/range {p0 .. p0}, $JOB_SERVICE_CLASS->onActivityCreate(Landroid/app/Activity;)V",
        )
    }
}
