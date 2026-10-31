package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.googlephotos.misc.gms.Constants.MORPHE_PHOTOS_PACKAGE_NAME
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.registersUsed
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.gms.PackageNameConfig
import app.morphe.util.getNode
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import org.w3c.dom.Element
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/DisablePlayStoreUpdatesPatch;"

private var originalVersionCode: Int = 0

private val officialPackageNameResourcePatch = resourcePatch {
    execute {
        PackageNameConfig.useOfficialPackageName = true
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
val officialPackageNamePatch = bytecodePatch(
    name = "Official package name",
    description = "Retains the official package name (com.google.android.apps.photos) instead of renaming to " +
        "$MORPHE_PHOTOS_PACKAGE_NAME and disables Play Store updates by setting the version code to maximum to prevent automatic overwriting. " +
        "This is strictly for non-root users whose devices do not have Google Photos preinstalled by the OEM.",
    default = false,
) {
    category("Official package name")
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.DISABLED
        }
    }

    dependsOn(officialPackageNameResourcePatch)
    dependsOn(sharedExtensionPatch)

    execute {
        PackageNameConfig.useOfficialPackageName = true
    }

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
            val registers = this.getInstruction<Instruction>(index).registersUsed
            val moveResultRegister = registers[0]
            val packageInfoRegister = registers[1]
            val moveResultIndex = index + 1

            if (moveResultRegister >= 16) {
                val provider = getFreeRegisterProvider(
                    moveResultIndex,
                    1,
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
            val register = getInstruction(index).registersUsed.first()

            replaceInstruction(
                index,
                "invoke-static/range { v$register .. v$register }, " +
                    "$EXTENSION_CLASS->getVersionCodeLong(Landroid/content/pm/PackageInfo;)J",
            )
        }
    }
}
