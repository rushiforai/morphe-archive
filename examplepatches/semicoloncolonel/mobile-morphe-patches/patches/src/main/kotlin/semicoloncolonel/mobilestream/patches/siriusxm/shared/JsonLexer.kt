package semicoloncolonel.mobilestream.patches.siriusxm.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method

// SiriusXM 2610.4.0 decodes its API responses, including the live
// now-playing data, with kotlinx.serialization's Json.decodeFromString,
// which builds a StringJsonLexer from the response text. R8 renames
// kotlinx.serialization: the lexer's base class is the one that throws
// "Expected EOF after parsing, but had ", and the string lexer is its
// subclass whose constructor takes the String.

internal object JsonLexerBaseFingerprint : Fingerprint(
    strings = listOf("Expected EOF after parsing, but had "),
)

/**
 * Passes every JSON text the app decodes through [filter], a static method
 * that takes and returns a String. Patches that each call this run their
 * filters one after another.
 */
internal fun BytecodePatchContext.filterDecodedJson(filter: String) {
    val base = JsonLexerBaseFingerprint.classDef.type
    var lexer: String? = null
    classDefForEach { classDef ->
        if (classDef.superclass == base && classDef.methods.any { it.isStringConstructor() }) {
            lexer = classDef.type
        }
    }
    val type = lexer ?: throw PatchException("SiriusXM: the JSON string lexer was not found")
    mutableClassDefBy(type).methods.first { it.isStringConstructor() }.addInstructions(
        0,
        """
            invoke-static { p1 }, $filter
            move-result-object p1
        """,
    )
}

private fun Method.isStringConstructor() =
    name == "<init>" && parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
