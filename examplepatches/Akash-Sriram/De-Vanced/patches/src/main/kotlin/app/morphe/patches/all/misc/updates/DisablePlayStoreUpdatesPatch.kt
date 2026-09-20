/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2470
 */

package app.morphe.patches.all.misc.updates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getNode
import app.morphe.util.matchAllMethodIndicesForEach
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.w3c.dom.Element
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/DisablePlayStoreUpdatesPatch;"

private var originalVersionCode: Int = 0

private val disablePlayStoreUpdatesResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element

            originalVersionCode = manifest.getAttribute("android:versionCode").toInt()
        }
    }

    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element

            // Max allowed by Play Store is 2100000000, but Android allows max int value.
            manifest.setAttribute("android:versionCode", Int.MAX_VALUE.toString())
        }
    }
}

@Suppress("unused")
val disablePlayStoreUpdatesPatch = bytecodePatch(
    name = "Disable Play Store updates",
    description = "[Experimental] Disables Play Store updates by setting the version code to the maximum allowed. " +
            "This patch may cause unexpected issues with some apps and does not work if the " +
            "app is installed by root mounting",
    default = false,
) {
    category("Experimental")
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    dependsOn(disablePlayStoreUpdatesResourcePatch)
    dependsOn(sharedExtensionPatch("shared", false))

    finalize {
        Fingerprint(
            definingClass = EXTENSION_CLASS,
            name = "originalVersionCode",
        ).method.returnEarly(originalVersionCode)

        val logger by lazy { Logger.getLogger(this::class.java.name) }

        Fingerprint(
            filters = listOf(
                fieldAccess(
                    opcode = Opcode.IGET,
                    smali = "Landroid/content/pm/PackageInfo;->versionCode:I",
                ),
            ),
            custom = { _, classDef ->
                !classDef.type.startsWith("Lapp/morphe/extension")
            },
        ).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            val instruction = this.getInstruction<TwoRegisterInstruction>(index)
            val moveResultRegister = instruction.registerA
            val packageInfoRegister = instruction.registerB
            val moveResultIndex = index + 1

            if (moveResultRegister >= 16) {
                val provider = getFreeRegisterProvider(
                    moveResultIndex,
                    moveResultRegister,
                    packageInfoRegister,
                )
                if (!provider.hasFreeRegisters()) {
                    logger.warning("Method does not have enough free registers, version code may not be overridden for: $this")
                    return@matchAllMethodIndicesForEach
                }
                val free = provider.getFreeRegister()
                if (free >= 16) {
                    logger.warning("No 4-bit register available, version code may not be overridden for: $this")
                    return@matchAllMethodIndicesForEach
                }

                addInstruction(
                    moveResultIndex,
                    """
                        move-result v$free
                        move/from16 v$moveResultRegister, v$free
                    """.trimIndent(),
                )
            } else {
                addInstruction(
                    moveResultIndex,
                    "move-result v$moveResultRegister",
                )
            }

            replaceInstruction(
                index,
                "invoke-static/range { v$packageInfoRegister .. v$packageInfoRegister }, " +
                        "$EXTENSION_CLASS->getVersionCode(Landroid/content/pm/PackageInfo;)I",
            )
        }

        // Replace long version code, which is a combination of
        // regular version code and versionCodeMajor.
        Fingerprint(
            filters = listOf(
                methodCall(
                    opcode = Opcode.INVOKE_VIRTUAL,
                    smali = "Landroid/content/pm/PackageInfo;->getLongVersionCode()J",
                ),
            ),
            custom = { _, classDef ->
                !classDef.type.startsWith("Lapp/morphe/extension")
            },
        ).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            if (getInstruction(index + 1).opcode != Opcode.MOVE_RESULT_WIDE) {
                return@matchAllMethodIndicesForEach
            }
            val register = getInstruction<FiveRegisterInstruction>(index).registerC

            replaceInstruction(
                index,
                "invoke-static/range { v$register .. v$register }, " +
                        "$EXTENSION_CLASS->getVersionCodeLong(Landroid/content/pm/PackageInfo;)J",
            )
        }
    }
}
