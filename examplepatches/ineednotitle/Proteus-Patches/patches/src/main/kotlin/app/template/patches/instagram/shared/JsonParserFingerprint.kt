/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstruction
import app.template.patches.shared.indexOfFirstStringInstruction
import app.template.patches.shared.indexOfFirstStringInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.Collections
import java.util.WeakHashMap
import java.util.logging.Logger

data class JsonParserMatch(
    val method: MutableMethod,
    val matchIndex: Int,
    val isStringMatch: Boolean,
)

@Suppress("unused")
open class JsonParserFingerprint(
    private val mainStringKey: String,
    private vararg val otherStringKeys: String,
) {
    private val allStringKeys get() = listOf(mainStringKey) + otherStringKeys

    context(patchContext: BytecodePatchContext)
    private val switchKeys get() = allStringKeys.associateWith { findSwitchKeyForString(it) }

    context(patchContext: BytecodePatchContext)
    fun match(): JsonParserMatch = matchAll().let {
        if (it.size > 1) {
            Logger.getLogger(this::class.java.name)
                .warning("SingleMatch was called but multiple fingerprints were matched")
        }
        it.firstOrNull()
    } ?: throw PatchException("No match found for key: $mainStringKey")

    context(patchContext: BytecodePatchContext)
    fun matchAll(): List<JsonParserMatch> =
        (normalMatches() + complexMatches())
            .distinctBy { it.method }

    context(patchContext: BytecodePatchContext)
    private fun normalMatches(): List<JsonParserMatch> =
        normalFingerprint.matchAllOrNull()?.mapNotNull { result ->
            with(result.method) {
                val allKeysPresent = otherStringKeys.all { key ->
                    containsKey(key, switchKeys[key])
                }
                if (!allKeysPresent) return@mapNotNull null

                val stringMatchIndex = indexOfFirstStringInstructionOrThrow(mainStringKey)

                JsonParserMatch(
                    method = this,
                    matchIndex = stringMatchIndex,
                    isStringMatch = true,
                )
            }
        } ?: emptyList()

    context(patchContext: BytecodePatchContext)
    private fun complexMatches(): List<JsonParserMatch> {
        val mainSwitchKey = switchKeys[mainStringKey] ?: return emptyList()

        return jsonParserFullList().mapNotNull { result ->
            val matchIndex = result.method.indexOfFirstDictionaryCall(mainSwitchKey)
                ?: return@mapNotNull null

            val allKeysPresent = otherStringKeys.all { key ->
                result.method.containsKey(key, switchKeys[key])
            }
            if (!allKeysPresent) return@mapNotNull null

            JsonParserMatch(method = result.method, matchIndex = matchIndex, isStringMatch = false)
        }
    }

    private val normalFingerprint = Fingerprint(
        filters = listOf(string(mainStringKey)),
        name = "unsafeParseFromJson",
    )

    context(patchContext: BytecodePatchContext)
    private fun findSwitchKeyForString(key: String): Int? {
        with(stringDictionaryMethod()) {
            val offsetToSwitchKey = instructions
                .filterIsInstance<SwitchPayload>()
                .first()
                .switchElements
                .associate { it.offset to it.key }

            val stringLoadIndex = indexOfFirstStringInstruction(key)
            if (stringLoadIndex == -1) return null

            var codeUnitOffset = 0
            instructions.forEachIndexed { index, instruction ->
                if (index == stringLoadIndex) {
                    return offsetToSwitchKey.entries
                        .firstOrNull { (offset, _) -> offset in (codeUnitOffset - 2)..(codeUnitOffset + 2) }
                        ?.value
                }
                codeUnitOffset += instruction.codeUnits
            }

            return null
        }
    }

    companion object {
        private val jsonParserCache: MutableMap<BytecodePatchContext, List<Match>> =
            Collections.synchronizedMap(WeakHashMap())

        context(patchContext: BytecodePatchContext)
        private fun jsonParserFullList(): List<Match> =
            jsonParserCache.getOrPut(patchContext) {
                Fingerprint(name = "unsafeParseFromJson").matchAll()
            }

        context(patchContext: BytecodePatchContext)
        internal fun stringDictionaryMethod(): MutableMethod =
            Fingerprint(
                returnType = "Ljava/lang/String;",
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
                parameters = listOf("I"),
                filters = listOf(
                    opcode(Opcode.PACKED_SWITCH),
                ),
                strings = listOf("auto_load_more_enabled"),
            ).method
    }
}

context(patchContext: BytecodePatchContext)
fun MutableMethod.indexOfFirstDictionaryCall(switchKey: Int): Int? {
    if (implementation == null) return null

    val dictMethod = JsonParserFingerprint.stringDictionaryMethod()
    for (index in 1 until instructions.size) {
        val ref = getInstruction(index).getReference<MethodReference>()
        if (ref?.name == dictMethod.name && ref.definingClass == dictMethod.definingClass) {
            val literal = getInstruction(index - 1) as? NarrowLiteralInstruction ?: continue
            if (literal.narrowLiteral == switchKey) return index - 1
        }
    }
    return null
}

context(patchContext: BytecodePatchContext)
private fun MutableMethod.containsKey(stringKey: String, switchKey: Int?): Boolean =
    indexOfFirstInstruction { getReference<StringReference>()?.string == stringKey } >= 0 ||
        (switchKey != null && indexOfFirstDictionaryCall(switchKey) != null)

/**
 * Replaces the parsed JSON field key with "BOGUS" (or index 0 when dictionary-backed)
 * so the target field is skipped during JSON parsing.
 */
@Suppress("unused")
fun JsonParserMatch.replaceJsonFieldWithBogus() {
    method.apply {
        val targetRegister = getInstruction<OneRegisterInstruction>(matchIndex).registerA
        if (isStringMatch) {
            addInstruction(
                matchIndex + 1,
                "const-string v$targetRegister, \"BOGUS\"",
            )
        } else {
            val constOpcode = if (targetRegister <= 15) "const/4" else "const/16"
            addInstruction(
                matchIndex + 1,
                "$constOpcode v$targetRegister, 0x0",
            )
        }
    }
}

@Suppress("unused")
fun MutableMethod.replaceJsonFieldWithBogus(key: String) {
    val targetStringIndex = indexOfFirstStringInstructionOrThrow(key)
    val targetStringRegister = getInstruction<OneRegisterInstruction>(targetStringIndex).registerA

    replaceInstruction(
        targetStringIndex,
        "const-string v$targetStringRegister, \"BOGUS\"",
    )
}
