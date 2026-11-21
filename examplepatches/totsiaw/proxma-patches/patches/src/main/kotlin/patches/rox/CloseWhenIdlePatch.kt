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

private const val IDLE_CLOSE = "Lapp/proxma/rox/IdleClose;"
private const val IDLE_PROVIDER = "app.proxma.rox.IdleProvider"

// A provider is created at every process start, including ones started by pushes, jobs and
// alarms with no screen, so idle close can watch those processes too.
private val idleProviderManifestPatch = resourcePatch {
    // Clears 3.0.14's duplicate <application android:name> before this reads the manifest as XML.
    dependsOn(fixApplicationNamePatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val packageName = manifest.getAttribute("package").ifEmpty { "com.jazz.rox" }
            val application = doc.getElementsByTagName("application").item(0) as Element
            val providers = doc.getElementsByTagName("provider")
            if ((0 until providers.length).none {
                    (providers.item(it) as Element).getAttribute("android:name") == IDLE_PROVIDER
                }
            ) {
                application.appendChild(
                    doc.createElement("provider").apply {
                        setAttribute("android:name", IDLE_PROVIDER)
                        setAttribute("android:authorities", "$packageName.proxma.idle")
                        setAttribute("android:exported", "false")
                    },
                )
            }
        }
    }
}

@Suppress("unused")
val closeWhenIdlePatch = bytecodePatch(
    name = "Close when idle in background",
    description = "Closes ROX once it has been out of sight for three minutes and nothing is playing, " +
        "so its timers, ad and analytics code stop using the battery. This also covers ROX being " +
        "started in the background by a push message or a job. Notifications still arrive. " +
        "Opening ROX after that is a fresh start.",
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")
    dependsOn(idleProviderManifestPatch)

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
            "invoke-static/range {p0 .. p0}, $IDLE_CLOSE->onActivityCreate(Landroid/app/Activity;)V",
        )
    }
}
