package app.olaelectric.patches.traffic

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.olaelectric.patches.shared.Constants.COMPATIBILITY_OLA
import app.olaelectric.patches.shared.OkHttpCleartextPermittedAFingerprint
import app.olaelectric.patches.shared.OkHttpCleartextPermittedBFingerprint
import app.olaelectric.patches.shared.OlaLoginManagerInitAuthFingerprint
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

@Suppress("unused")
val plaintextTrafficPatch = resourcePatch(
    name = "Allow Plaintext HTTP Traffic",
    description = "Allows cleartext HTTP connections to local self-hosted servers.",
    default = false
) {
    compatibleWith(COMPATIBILITY_OLA)

    dependsOn(
        bytecodePatch {
            execute {
                runCatching {
                    OkHttpCleartextPermittedAFingerprint.method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """
                    )
                }

                runCatching {
                    OkHttpCleartextPermittedBFingerprint.method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """
                    )
                }

                runCatching {
                    val method = OlaLoginManagerInitAuthFingerprint.method
                    val instructions = method.implementation!!.instructions
                    val checkIndex = instructions.indexOfFirst {
                        it.opcode == Opcode.IGET_BOOLEAN
                    }
                    if (checkIndex != -1) {
                        val nextIndex = checkIndex + 1
                        if (nextIndex < instructions.size && instructions[nextIndex].opcode == Opcode.IF_EQZ) {
                            method.replaceInstruction(nextIndex, "nop")
                        }
                    }
                }
            }
        }
    )

    execute {
        // 1. Update AndroidManifest.xml to set android:usesCleartextTraffic="true"
        document("AndroidManifest.xml").use { doc ->
            val appElements = doc.getElementsByTagName("application")
            if (appElements.length > 0) {
                val appElement = appElements.item(0) as Element
                appElement.setAttribute("android:usesCleartextTraffic", "true")
            }
        }

        // 2. Update res/xml/network_security_config.xml
        try {
            document("res/xml/network_security_config.xml").use { doc ->
                var baseConfig = doc.getElementsByTagName("base-config").item(0) as? Element
                if (baseConfig == null) {
                    baseConfig = doc.createElement("base-config")
                    doc.documentElement.appendChild(baseConfig)
                }
                baseConfig.setAttribute("cleartextTrafficPermitted", "true")

                val trustAnchors = doc.createElement("trust-anchors")
                val certsSystem = doc.createElement("certificates").apply { setAttribute("src", "system") }
                val certsUser = doc.createElement("certificates").apply { setAttribute("src", "user") }
                trustAnchors.appendChild(certsSystem)
                trustAnchors.appendChild(certsUser)
                baseConfig.appendChild(trustAnchors)
            }
        } catch (_: Exception) {
            // Ignored if network security config is not unpacked as XML
        }
    }
}
