package app.morphe.patches.all.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

@Suppress("unused")
val removePairIpPatch = patch(
    name = "Remove PairIP",
    description = "Removes the PairIP Play licensing gate (startup license check, response " +
        "validation, repeated checks and paywall/kill path). Does not bypass PairIP native " +
        "virtualization or Play Integrity attestation.",
    default = false,
) {
    execute {
        // 1. Skip the startup license check entirely.
        mutableClassDefByOrNull("Lcom/pairip/licensecheck/LicenseContentProvider;")
            ?.methods?.firstOrNull { it.name == "onCreate" && it.returnType == "Z" }
            ?.returnEarly(true)

        // 2. Force the licensing response code to LICENSED (0) and disable re-checks.
        mutableClassDefByOrNull(LICENSE_CLIENT)
            ?.methods?.firstOrNull { it.name == "processResponse" }
            ?.let { m ->
                if (m.parameters.firstOrNull()?.type == "I") {
                    val pReg = if (AccessFlags.STATIC.isSet(m.accessFlags)) 0 else 1
                    m.addInstruction(0, "const/4 p$pReg, 0x0")
                }
                val targets = m.instructions.withIndex().filter { (_, ins) ->
                    ins.opcode == Opcode.SGET_BOOLEAN &&
                        ins.getReference<FieldReference>()?.name == "repeatedCheckEnabled"
                }.map { it.index }
                targets.forEach { i ->
                    val reg = (m.getInstruction(i) as OneRegisterInstruction).registerA
                    m.replaceInstruction(i, "const/4 v$reg, 0x0")
                }
            }

        // 3. Short-circuit response validation (void or boolean variants).
        listOf(
            "Lcom/pairip/licensecheck/ResponseValidator;",
            "Lcom/pairip/licensecheck/LicenseResponseHelper;",
        ).forEach { type ->
            mutableClassDefByOrNull(type)
                ?.methods?.firstOrNull { it.name == "validateResponse" }
                ?.let { m ->
                    when (m.returnType) {
                        "V" -> m.returnEarly()
                        "Z" -> m.returnEarly(true)
                    }
                }
        }

        // 4. Neutralize the paywall / process-kill fallback.
        mutableClassDefByOrNull(LICENSE_CLIENT)
            ?.methods?.firstOrNull { it.name == "startPaywallActivity" && it.returnType == "V" }
            ?.returnEarly()

        // 5. Drop the licensing components from the manifest so they never run.
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as? Element ?: return@use
            listOf("provider", "activity", "service", "receiver").forEach { tag ->
                val nodes = app.getElementsByTagName(tag)
                val toRemove = (0 until nodes.length)
                    .mapNotNull { nodes.item(it) as? Element }
                    .filter { it.getAttribute("android:name").startsWith("com.pairip.licensecheck") }
                toRemove.forEach { app.removeChild(it) }
            }
        }
    }
}
