/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-16
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

package app.morphe.patches.music.general.spoofappversion

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.GENERAL_CLASS_DESCRIPTOR
import app.morphe.patches.music.utils.extension.Constants.PATCH_STATUS_CLASS_DESCRIPTOR
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.patch.PatchList.SPOOF_APP_VERSION
import app.morphe.patches.music.utils.playservice.is_6_43_or_greater
import app.morphe.patches.music.utils.playservice.is_7_25_or_greater
import app.morphe.patches.music.utils.playservice.is_8_03_or_greater
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.addListPreference
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.clientTypeFingerprint
import app.morphe.patches.shared.spoof.browse.addClientInfoHook
import app.morphe.patches.shared.spoof.browse.spoofClientBrowseEndpointPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.appendAppVersion
import app.morphe.util.findMethodOrThrow
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val LEGACY_BROWSE_VERSION = "8.04.51"

internal fun supportsSpoofAppVersion(versionName: String) = versionName < "8.03.00"

internal fun spoofAppVersionTarget(versionName: String) =
    if (versionName < "7.17.00") LEGACY_BROWSE_VERSION else "8.05.50"

internal fun MutableMethod.useLegacyBrowseVersion(version: String) {
    // Preserve lyrics overrides, but do not let saved general preferences restore an unsupported
    // native client or the incompatible 8.05 browse theme on these old clients.
    addInstructions(
        0,
        """
            invoke-static {p0}, $GENERAL_CLASS_DESCRIPTOR->getLyricsVersionOverride(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
            if-nez p0, :legacy_browse_version
            const-string p0, "$version"
            :legacy_browse_version
            return-object p0
        """,
    )
}

private val spoofAppVersionBytecodePatch = bytecodePatch(
    description = "spoofAppVersionBytecodePatch"
) {
    dependsOn(
        sharedExtensionPatch,
        spoofClientBrowseEndpointPatch,
        versionCheckPatch,
        legacyBrowseThemePatch,
    )

    execute {
        if (!supportsSpoofAppVersion(packageMetadata.versionName)) {
            return@execute
        }

        val clientVersionFieldReference = clientTypeFingerprint.match().let {
            with(it.method) {
                val dummyClientVersionIndex = it.stringMatches.first().index
                val dummyClientVersionRegister =
                    getInstruction<OneRegisterInstruction>(dummyClientVersionIndex).registerA
                val clientVersionIndex =
                    indexOfFirstInstructionOrThrow(dummyClientVersionIndex) {
                        opcode == Opcode.IPUT_OBJECT &&
                                getReference<FieldReference>()?.type == "Ljava/lang/String;" &&
                                (this as TwoRegisterInstruction).registerA == dummyClientVersionRegister
                    }

                getInstruction<ReferenceInstruction>(clientVersionIndex).reference as FieldReference
            }
        }

        addClientInfoHook(
            helperMethodName = "patch_setBrowseAppVersion",
            smaliInstructions = """
                invoke-static {v3}, $GENERAL_CLASS_DESCRIPTOR->getBrowseVersionOverride(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :skip_browse_spoof
                iput-object v2, v1, $clientVersionFieldReference
                :skip_browse_spoof
                """,
            insertLast = false
        )

        val defaultVersionString = spoofAppVersionTarget(packageMetadata.versionName)

        findMethodOrThrow(PATCH_STATUS_CLASS_DESCRIPTOR) {
            name == "SpoofAppVersionDefaultString"
        }.returnEarly(defaultVersionString)

        findMethodOrThrow(PATCH_STATUS_CLASS_DESCRIPTOR) {
            name == "SpoofAppVersionDefaultBoolean"
        }.returnEarly(true)

        if (packageMetadata.versionName < "7.17.00") {
            findMethodOrThrow(GENERAL_CLASS_DESCRIPTOR) {
                name == "getBrowseVersionOverride"
            }.useLegacyBrowseVersion(defaultVersionString)
        }
    }
}

@Suppress("unused")
val spoofAppVersionPatch = resourcePatch(
    SPOOF_APP_VERSION.title,
    SPOOF_APP_VERSION.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(
        spoofAppVersionBytecodePatch,
        settingsPatch,
        versionCheckPatch,
    )

    execute {
        if (is_8_03_or_greater) {
            printWarn("\"${SPOOF_APP_VERSION.title}\" is not supported in this version. Use YouTube Music versions up to 8.03.")
            return@execute
        }
        if (packageMetadata.versionName < "7.17.00") {
            printWarn(
                "Music below 7.17 requires browse version $LEGACY_BROWSE_VERSION to avoid the server's " +
                        "update block. Keeping this compatibility override fixed; skipping general spoof controls."
            )
            updatePatchStatus(SPOOF_APP_VERSION)
            return@execute
        }

        appendAppVersion("8.05.50")
        if (is_7_25_or_greater) {
            appendAppVersion("7.17.52")
        }
        if (is_6_43_or_greater) {
            appendAppVersion("6.42.55")
        }
        appendAppVersion("6.35.52")

        addSwitchPreference(
            CategoryType.GENERAL,
            "revanced_spoof_app_version",
            "true"
        )
        addListPreference(
            CategoryType.GENERAL,
            "revanced_spoof_app_version_target",
            "revanced_spoof_app_version"
        )

        updatePatchStatus(SPOOF_APP_VERSION)

    }
}
