/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.decoder

import app.crimera.patches.instagram.utils.Constants.EDIT_MEDIA_INFO_FRAGMENT_CLASS
import app.crimera.utils.fieldExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import kotlin.properties.Delegates

var MEDIA_ADD_INFO_CLASS_NAME: String by Delegates.notNull()
    private set

var CURRENT_MEDIA_FIELD: FieldReference by Delegates.notNull()
    private set

val decoderEntity =
    bytecodePatch(
        description = "Resolves the current media field of the feed row state the download follows",
    ) {
        execute {
            EditMediaInfoGetCurrentMediaIdFingerprint.method.apply {
                val directIgetIndex = indexOfFirstInstruction(Opcode.IGET)
                if (directIgetIndex >= 0) {
                    CURRENT_MEDIA_FIELD = getInstruction(directIgetIndex).getReference<FieldReference>()!!
                } else {
                    // Newer releases moved the current-media getter into a synthetic accessor that
                    // takes the fragment. Read the current-media index field from that accessor.
                    val accessor =
                        mutableClassDefBy(EDIT_MEDIA_INFO_FRAGMENT_CLASS).methods.firstOrNull { method ->
                            method.returnType == "Ljava/lang/String;" &&
                                method.parameterTypes.size == 1 &&
                                method.parameterTypes[0].toString() == EDIT_MEDIA_INFO_FRAGMENT_CLASS &&
                                method.indexOfFirstInstruction(Opcode.IGET) >= 0
                        } ?: throw PatchException("Edit media current media getter not found")

                    val accessorIgetIndex = accessor.indexOfFirstInstruction(Opcode.IGET)
                    CURRENT_MEDIA_FIELD = accessor.getInstruction(accessorIgetIndex).getReference<FieldReference>()!!
                }
                MEDIA_ADD_INFO_CLASS_NAME = CURRENT_MEDIA_FIELD.definingClass
            }
        }
    }
