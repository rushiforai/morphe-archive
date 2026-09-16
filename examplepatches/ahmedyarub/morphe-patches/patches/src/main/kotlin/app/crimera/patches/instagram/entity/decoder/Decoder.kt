/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.decoder

import app.crimera.patches.instagram.entity.mediadata.AslSessionRelatedFingerprint
import app.crimera.utils.extensionToClassName
import app.crimera.utils.fieldExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import kotlin.properties.Delegates

var MEDIA_CLASS_NAME: String by Delegates.notNull()
    private set

var MEDIAEXT_CLASS_NAME: String by Delegates.notNull()
    private set

var USER_MODEL_CLASS_NAME: String by Delegates.notNull()
    private set

var MEDIA_ADD_INFO_CLASS_NAME: String by Delegates.notNull()
    private set

var CURRENT_MEDIA_FIELD: FieldReference by Delegates.notNull()
    private set

var COMMENT_BUTTON_CLASS: String by Delegates.notNull()
    private set

val decoderEntity =
    bytecodePatch(
        description = "This patch is used hold class and field names that are commonly used",
    ) {
        execute {
            MEDIA_CLASS_NAME = AslSessionRelatedFingerprint.method.parameters[0].type

            // The carousel index lives on a helper object the fragment holds. piko reads it
            // from the first IGET in the fragment's media id getter, but 446 rewrote that
            // getter and it no longer touches the helper at all.
            //
            // The field is still read elsewhere in the same class, so the whole class is
            // searched instead, for an int field belonging to some other, obfuscated class.
            // Fields on the fragment itself and on named framework or Instagram classes are
            // not candidates, which leaves exactly one on both 439 and 446.
            val fragmentClass = EditMediaInfoGetCurrentMediaIdFingerprint.classDef

            CURRENT_MEDIA_FIELD = fragmentClass.methods
                .asSequence()
                .flatMap { method -> method.implementation?.instructions?.asSequence() ?: emptySequence() }
                .filter { instruction -> instruction.opcode == Opcode.IGET }
                .mapNotNull { instruction -> (instruction as? ReferenceInstruction)?.reference as? FieldReference }
                .distinct()
                .singleOrNull { field ->
                    field.definingClass != fragmentClass.type && field.definingClass.isObfuscated()
                } ?: throw PatchException("Could not identify the carousel index field")

            MEDIA_ADD_INFO_CLASS_NAME = CURRENT_MEDIA_FIELD.definingClass

            COMMENT_BUTTON_CLASS = CommentButtonOnClickFingerprint.method.parameters[0].type

            USER_MODEL_CLASS_NAME = UserTagInfoDictInitFingerprint.method.parameters[0].type

            MEDIAEXT_CLASS_NAME = ReelsInlineQualitySurveyRelatedFingerprint.classDef.type
        }
    }

/**
 * A class R8 renamed, as opposed to one that kept a real package such as android or
 * com.instagram. Only renamed classes are candidates for the app's internal helpers.
 */
private fun String.isObfuscated() = !startsWith("Landroid") &&
    !startsWith("Lcom/instagram") &&
    !startsWith("Ljava") &&
    !startsWith("Lkotlin")
