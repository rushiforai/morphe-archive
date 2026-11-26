/*
 * Copyright (C) 2024-2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Modified by lavinhoque33, 2026-11-24.
 * Modified by lavinhoque33, 2026-11-20.
 * Modified by lavinhoque33, 2026-10-24.
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

/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to Morphe contributions.
 */

package app.morphe.patches.youtube.general.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.litho.addLithoFilter
import app.morphe.patches.shared.litho.lithoFilterPatch
import app.morphe.patches.youtube.utils.bottomsheet.bottomSheetFlyoutMenuPatch
import app.morphe.patches.youtube.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.youtube.utils.playservice.is_21_04_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.resourceid.sharedResourceIdPatch
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_CLASS_DESCRIPTOR =
    "$GENERAL_PATH/DownloadActionsPatch;"

private const val EXTENSION_FLYOUT_MENU_VIDEO_ID_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/general/DownloadActionsPatch$FlyoutMenuVideoIdInterface;"

private const val EXTENSION_PROTOCOL_BUFFER_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/general/DownloadActionsPatch$ProtocolBufferFieldInterface;"

private const val EXTENSION_FLYOUT_UTILS_CLASS_DESCRIPTOR = "Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;"

/** Shared feed and player flyout lifecycle, without selecting any download overrides. */
internal val videoFlyoutMenuHookPatch = bytecodePatch(description = "Hooks video menus and their video IDs.") {
    dependsOn(lithoFilterPatch, versionCheckPatch, sharedResourceIdPatch, bottomSheetFlyoutMenuPatch)

    execute {
        // Track the top-level player menu even when Hide player flyout menu is excluded.
        addLithoFilter("Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuFilter;")

        FlyoutBufferClassFingerprint.let {
            val bufferField = it.classDef.fields.first { field -> field.type == "[B" }

            mutableClassDefBy(it.classDef.type).apply {
                interfaces.add(EXTENSION_PROTOCOL_BUFFER_INTERFACE)
                methods.add(
                    ImmutableMethod(
                        type,
                        "patch_getBuffer",
                        emptyList(),
                        "[B",
                        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                        null,
                        null,
                        MutableMethodImplementation(2),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                iget-object v0, p0, $bufferField
                                return-object v0
                            """,
                        )
                    },
                )
            }
        }

        fun addFlyoutVideoIdInterface(messageType: String) {
            // The video ID is the only String field initialized to an empty value.
            val videoIdStringField = Fingerprint(
                definingClass = messageType,
                name = "<init>",
                filters = listOf(
                    string(""),
                    fieldAccess(
                        opcode = Opcode.IPUT_OBJECT,
                        definingClass = "this",
                        type = "Ljava/lang/String;",
                        location = MatchAfterWithin(2),
                    ),
                ),
            ).instructionMatches.last().instruction.getReference<FieldReference>()!!

            mutableClassDefBy(messageType).apply {
                interfaces.add(EXTENSION_FLYOUT_MENU_VIDEO_ID_INTERFACE)
                methods.add(
                    ImmutableMethod(
                        type,
                        "patch_getVideoId",
                        emptyList(),
                        "Ljava/lang/String;",
                        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                        null,
                        null,
                        MutableMethodImplementation(2),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                iget-object v0, p0, $videoIdStringField
                                return-object v0
                            """,
                        )
                    },
                )
            }
        }

        // Full watch history does not use Litho.
        FlyoutMenuItemMessageFingerprint.let { fingerprint ->
            val match = fingerprint.matchOrNull()
            if (match != null) {
                val messageType = fingerprint.instructionMatches[1]
                    .instruction.getReference<TypeReference>()!!.type
                addFlyoutVideoIdInterface(messageType)
            }
        }

        // Playlists in the "You" tab use a separate generated message on 20.21+.
        SingularGeneratedExtensionFingerprint.let { fingerprint ->
            val match = fingerprint.matchOrNull()
            if (match != null) {
                val messageType = fingerprint.instructionMatches[1]
                    .fieldReference.type
                addFlyoutVideoIdInterface(messageType)
            }
        }

        FeedFlyoutBufferObjectFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p2 .. p2}, $EXTENSION_CLASS_DESCRIPTOR->extractFlyoutVideoId(Ljava/util/Map;)V",
        )

        FullHistoryFlyoutBufferObjectFingerprint.let {
            val index = it.instructionMatches[2].index
            val register = it.method.getInstruction<OneRegisterInstruction>(index).registerA
            it.method.addInstruction(
                index + 1,
                "invoke-static {v$register}, $EXTENSION_CLASS_DESCRIPTOR->extractFlyoutVideoId(Ljava/lang/Object;)V",
            )
        }

        val feedBottomSheetFlyoutFingerprint =
            if (is_21_04_or_greater) ModernFeedBottomSheetFlyoutFingerprint
            else FeedBottomSheetFlyoutFingerprint

        feedBottomSheetFlyoutFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstruction(
                    index,
                    "invoke-static {v$register}, $EXTENSION_CLASS_DESCRIPTOR->setQueueBottomSheetFlyout(Landroid/app/Dialog;)V",
                )
            }
        }

        FeedPopupWindowFlyoutFingerprint.matchAll(2..4).forEach {
            it.method.apply {
                // Other popup hooks can already have inserted instructions before the dismissal listener.
                val instructionIndex = indexOfFirstInstructionOrThrow {
                    val reference = getReference<MethodReference>()
                    reference != null && reference.definingClass == "Landroid/widget/PopupWindow;" &&
                        reference.name == "setOnDismissListener"
                }
                val instructionRegister = getInstruction<FiveRegisterInstruction>(instructionIndex).registerC

                addInstruction(
                    instructionIndex,
                    "invoke-static { v$instructionRegister }, $EXTENSION_FLYOUT_UTILS_CLASS_DESCRIPTOR->" +
                            "setPopupWindowFlyout(Landroid/widget/PopupWindow;)V",
                )
            }
        }
    }
}
