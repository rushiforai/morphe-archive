/*
 * Copyright 2026 anondev.
 *
 * GPLv3. See the LICENSE file for details.
 */

package app.anondev.patches.zotero.uploads

import app.anondev.patches.zotero.shared.Constants.COMPATIBILITY_ZOTERO
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/** The one class whose parse of the attachment `mtime` decides whether the file is ever uploaded. */
private const val READER_CLASS =
    "Lorg/zotero/android/database/requests/ReadAttachmentUploadsDbRequest;"

/** The call being replaced, and its replacement. */
private const val STRINGS_KT_CLASS = "Lkotlin/text/StringsKt;"
private const val TO_LONG_OR_NULL = "toLongOrNull"
private const val EXTENSION_CLASS = "Lapp/anondev/patches/zotero/extension/AttachmentMtime;"
private const val EXTENSION_METHOD = "mtimeOrNow"
private const val STRING_TYPE = "Ljava/lang/String;"
private const val LONG_BOX_TYPE = "Ljava/lang/Long;"

/**
 * Keeps an attachment uploadable when its stored modification time cannot be parsed.
 *
 * The reader skips an attachment whose `mtime` does not parse to a number
 * (`ReadAttachmentUploadsDbRequest`), and no request to any file endpoint follows — the file is
 * never uploaded, so the field is never repaired, so the attachment stays skipped. Only the parse
 * is replaced here: the extension helper returns a usable value instead of null, which leaves the
 * surrounding bytecode, the rest of the reader and every other `toLongOrNull` call site untouched.
 *
 * Scoped to [READER_CLASS] on purpose: the app parses strings the same way in nine classes.
 */
@Suppress("unused")
val attachmentMtimeRecoveryPatch = bytecodePatch(
    name = "Recover attachments with an unusable modification time",
    description = "Temporary workaround: the Zotero Android app discards an attachment whose " +
        "stored modification time it cannot parse, instead of repairing it, so the file is " +
        "never uploaded. Reported upstream: https://github.com/zotero/zotero-android/issues/351",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZOTERO)
    category("Sync")

    extendWith("extensions/extension.mpe")

    execute {
        val replacement = ImmutableMethodReference(
            EXTENSION_CLASS,
            EXTENSION_METHOD,
            listOf(STRING_TYPE),
            LONG_BOX_TYPE,
        )

        var replacements = 0
        val reader = mutableClassDefBy(READER_CLASS)
        reader.methods.forEach { method ->
            val instructions = method.implementation?.instructions ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.INVOKE_STATIC) return@forEachIndexed
                if (instruction !is ReferenceInstruction) return@forEachIndexed

                val reference = instruction.reference
                if (reference !is MethodReference) return@forEachIndexed
                if (reference.definingClass != STRINGS_KT_CLASS) return@forEachIndexed
                if (reference.name != TO_LONG_OR_NULL) return@forEachIndexed
                if (reference.parameterTypes != listOf(STRING_TYPE)) return@forEachIndexed

                // Reuse the original register: the helper takes and returns what the call did.
                val invoke = instruction as? FiveRegisterInstruction
                    ?: throw PatchException(
                        "Recover attachments: the mtime parse in $READER_CLASS has an unexpected " +
                            "shape. The patch targets Zotero 1.0.0-247.",
                    )
                if (invoke.registerCount != 1) {
                    throw PatchException(
                        "Recover attachments: the mtime parse in $READER_CLASS passes " +
                            "${invoke.registerCount} registers, expected 1. The patch targets " +
                            "Zotero 1.0.0-247.",
                    )
                }

                method.replaceInstruction(
                    index,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        1,
                        invoke.registerC,
                        0,
                        0,
                        0,
                        0,
                        replacement,
                    ),
                )
                replacements++
            }
        }

        if (replacements == 0) {
            throw PatchException(
                "Recover attachments: found no '${STRINGS_KT_CLASS}->$TO_LONG_OR_NULL' call in " +
                    "$READER_CLASS. The patch targets Zotero 1.0.0-247.",
            )
        }
    }
}
