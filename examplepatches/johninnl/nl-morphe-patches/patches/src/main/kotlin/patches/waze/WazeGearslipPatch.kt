package patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

private const val GEARSLIP_PACKAGE = "app.seb3thehacker.gearslip"

/** HostValidator cannot look up a package Waze is not allowed to see. */
private val gearslipVisibility = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val queries = doc.getElementsByTagName("queries").item(0) as? Element
                ?: doc.createElement("queries").also { doc.documentElement.appendChild(it) }
            val packages = queries.getElementsByTagName("package")
            if ((0 until packages.length).none {
                (packages.item(it) as Element).getAttribute("android:name") == GEARSLIP_PACKAGE
            }) queries.appendChild(doc.createElement("package").apply {
                setAttribute("android:name", GEARSLIP_PACKAGE)
            })
        }
    }
}

@Suppress("unused")
val wazeGearslipPatch = bytecodePatch(
    name = "Support Gearslip",
    description = "Accepts Gearslip as a car host by package name, whichever key signed it, so a patched " +
        "Gearslip keeps working. Other hosts keep Android Auto host validation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(gearslipVisibility)

    execute {
        // Runs after validateHost has tied the package name to the caller's UID.
        HostValidatorAllowListFingerprint.method.apply {
            if (implementation!!.registerCount <= parameterTypes.size + 1)
                throw PatchException("Waze host allowlist check has no free register")
            addInstructionsWithLabels(0, """
                const-string v0, "$GEARSLIP_PACKAGE"
                invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original_allowlist
                const/4 v0, 0x1
                return v0
            """, ExternalLabel("original_allowlist", getInstruction(0)))
        }
    }
}
