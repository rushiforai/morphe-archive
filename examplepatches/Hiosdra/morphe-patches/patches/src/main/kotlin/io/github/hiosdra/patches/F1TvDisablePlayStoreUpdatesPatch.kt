/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2470
 *
 * Original code hard forked from:
 * https://github.com/ReVanced/revanced-patches/blob/724e6d61b2ecd868c1a9a37d465a688e83a74799/patches/src/main/kotlin/app/revanced/patches/all/misc/versioncode/ChangeVersionCodePatch.kt
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file.
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * Section 7b: Notice Preservation
 * -------------------------------
 * This entire comment block must be preserved in all copies,
 * distributions, and derivative works of this file, in both
 * original and modified source forms.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getNode
import app.morphe.util.matchAllMethodIndicesForEach
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.w3c.dom.Element
import java.util.logging.Logger

private const val F1_TV_VERSION_CODE_HELPER =
    "Lio/github/hiosdra/patches/extension/f1tv/versioncode/F1TvDisablePlayStoreUpdatesPatch;"

private var originalF1TvVersionCode: Int = 0

/**
 * F1 TV-specific copy of Morphe's Disable Play Store updates resource patch.
 * Source: https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/updates/DisablePlayStoreUpdatesPatch.kt
 * Source revision: 38c13fa35e05e4df87d28445428e1fadf1bc5ea9
 */
private val f1TvDisablePlayStoreUpdatesResourcePatch = resourcePatch {
    compatibleWith(COMPATIBILITY_F1_TV)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element
            originalF1TvVersionCode = manifest.getAttribute("android:versionCode").toInt()
        }
    }

    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element

            // The Play Store limit is lower, but Android accepts Int.MAX_VALUE.
            manifest.setAttribute("android:versionCode", Int.MAX_VALUE.toString())
        }
    }
}

@Suppress("unused")
internal val f1TvDisablePlayStoreUpdatesPatch = bytecodePatch(
    name = "F1 TV - Disable Play Store updates",
    description = "Disables Play Store updates for the F1 TV package by setting its version code to the maximum allowed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)
    dependsOn(f1TvDisablePlayStoreUpdatesResourcePatch)
    extendWith("extensions/extension.mpe")

    finalize {
        Fingerprint(
            definingClass = F1_TV_VERSION_CODE_HELPER,
            name = "originalVersionCode",
        ).method.returnEarly(originalF1TvVersionCode)

        val logger by lazy { Logger.getLogger(this::class.java.name) }

        Fingerprint(
            filters = listOf(
                fieldAccess(
                    opcode = Opcode.IGET,
                    smali = "Landroid/content/pm/PackageInfo;->versionCode:I",
                ),
            ),
            custom = { _, classDef ->
                !classDef.type.startsWith("Lio/github/hiosdra/patches/extension")
            },
        ).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            val instruction = getInstruction<TwoRegisterInstruction>(index)
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
                    "$F1_TV_VERSION_CODE_HELPER->getVersionCode(Landroid/content/pm/PackageInfo;)I",
            )
        }

        // Replace the long version code, preserving versionCodeMajor.
        Fingerprint(
            filters = listOf(
                methodCall(
                    opcode = Opcode.INVOKE_VIRTUAL,
                    smali = "Landroid/content/pm/PackageInfo;->getLongVersionCode()J",
                ),
            ),
            custom = { _, classDef ->
                !classDef.type.startsWith("Lio/github/hiosdra/patches/extension")
            },
        ).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            if (getInstruction(index + 1).opcode != Opcode.MOVE_RESULT_WIDE) {
                return@matchAllMethodIndicesForEach
            }
            val register = getInstruction<FiveRegisterInstruction>(index).registerC

            replaceInstruction(
                index,
                "invoke-static/range { v$register .. v$register }, " +
                    "$F1_TV_VERSION_CODE_HELPER->getVersionCodeLong(Landroid/content/pm/PackageInfo;)J",
            )
        }
    }
}
