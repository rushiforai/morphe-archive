/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.network

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicCleanShareLinks")

internal const val SHARE_LINKS_EXTENSION = "Lapp/nyandex/extension/yandexmusic/share/ShareLinks;"

private const val STRING = "Ljava/lang/String;"
private val URI_TO_STRING_OWNERS = setOf("Landroid/net/Uri;", "Ljava/lang/Object;")

val cleanShareLinksPatch = patch(
    name = "Чистые ссылки",
    description = "Убирает из ссылок «Поделиться» и «Скопировать ссылку» метки utm_* и случайный ref_id, " +
        "по которому переход по ссылке можно связать с тем, кто ею поделился. Ссылки-приглашения " +
        "сохраняют invite_id.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    extendWith("extensions/share-links.mpe")

    execute {
        hookShareLinkBuilder()
    }
}

/**
 * Every shared or copied link to a track, album, artist, playlist, chart, video or concert is
 * built by one static method (`vit.a(target, inviteId, refId)` in 2026.11.2): it builds the path,
 * then appends `utm_medium=copy_link`, the optional `invite_id` and `ref_id` with
 * `Uri.Builder.appendQueryParameter` and returns `build().toString()`. The finished string is
 * passed through the extension before it is returned.
 */
private fun hookShareLinkBuilder() {
    val builder = classDefByStrings("copy_link").singleOrNull { classDef ->
        classDef.methods.any { method ->
            method.hasString("copy_link") && method.hasString("ref_id") && method.hasString("invite_id")
        }
    } ?: throw PatchException("Share link builder was not found")

    val method = mutableClassDefBy(builder.type).methods.singleOrNull { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == STRING &&
            method.hasString("copy_link") && method.hasString("ref_id")
    } ?: throw PatchException("Share link builder method was not found in ${builder.type}")

    val instructions = method.implementation!!.instructions.toList()
    val refId = instructions.indexOfFirst { it.stringValue() == "ref_id" }

    // The link string: the first toString() after "ref_id", and the move-result that follows it.
    val toString = (refId + 1 until instructions.size).firstOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.name == "toString" && reference.returnType == STRING &&
            reference.parameterTypes.isEmpty() && reference.definingClass in URI_TO_STRING_OWNERS
    } ?: throw PatchException("Share link toString() was not found")
    val moveResult = instructions.getOrNull(toString + 1)
    if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Share link toString() result is not moved")
    }
    val register = (moveResult as OneRegisterInstruction).registerA

    method.addInstructions(
        toString + 2,
        """
            invoke-static/range {v$register .. v$register}, $SHARE_LINKS_EXTENSION->clean($STRING)$STRING
            move-result-object v$register
        """,
    )
    logger.info("Share links from ${builder.type}.${method.name} are cleaned (register v$register)")
}

private fun com.android.tools.smali.dexlib2.iface.Method.hasString(value: String): Boolean =
    implementation?.instructions?.any { it.stringValue() == value } == true

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.stringValue(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
