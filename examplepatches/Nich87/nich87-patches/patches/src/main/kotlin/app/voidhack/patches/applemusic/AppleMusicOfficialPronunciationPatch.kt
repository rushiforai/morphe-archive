package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val SONG_INFO = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val TTML_PARSER = "Lcom/apple/android/music/ttml/javanative/TTMLParser\$TTMLParserNative;"
private const val EXTENSION = "Lapp/voidhack/extension/applemusic/lyrics/OfficialLyricsPronunciation;"
private const val NATIVE_PARSE = "songInfoFromTTML"
private const val WRAPPED_PARSE = "voidhackParseOfficialLyrics"
private const val STRING_ARGUMENT = "Ljava/lang/String;"

private fun parseTtmlCall() = methodCall(
    definingClass = TTML_PARSER,
    name = NATIVE_PARSE,
    returnType = SONG_INFO,
    parameters = listOf(STRING_ARGUMENT),
)

private object OfflineOfficialLyrics : Fingerprint(
    returnType = SONG_INFO,
    filters = listOf(parseTtmlCall()),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/apple/android/music/ttml/") &&
            AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 4
    },
)

private object OnlineOfficialLyrics : Fingerprint(
    returnType = "Ljava/io/Serializable;",
    filters = listOf(parseTtmlCall()),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/apple/android/music/ttml/") },
)

internal val appleMusicOfficialPronunciation = bytecodePatch {
    execute {
        val callers = listOf(OfflineOfficialLyrics.method, OnlineOfficialLyrics.method)
        val parser = mutableClassDefBy(TTML_PARSER)
        val native = parser.methods.single { it.name == NATIVE_PARSE }
        val wrapper = ImmutableMethod(
            TTML_PARSER,
            WRAPPED_PARSE,
            native.parameters,
            SONG_INFO,
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        wrapper.addInstructions(
            0,
            """
                invoke-virtual {p0, p1}, $TTML_PARSER->$NATIVE_PARSE($STRING_ARGUMENT)$SONG_INFO
                move-result-object v0
                invoke-static {p1, v0}, $EXTENSION->rememberOriginal(Ljava/lang/String;Ljava/lang/Object;)V
                return-object v0
            """,
        )
        parser.methods.add(wrapper)

        for (caller in callers) {
            val (index, instruction) = caller.instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    reference?.definingClass == TTML_PARSER && reference.name == NATIVE_PARSE
            }
            val registers = instruction as FiveRegisterInstruction
            caller.replaceInstruction(
                index,
                "invoke-virtual {v${registers.registerC}, v${registers.registerD}}, " +
                    "$TTML_PARSER->$WRAPPED_PARSE($STRING_ARGUMENT)$SONG_INFO",
            )
        }
    }
}
