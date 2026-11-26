package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
private const val SONG_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val LINE_NATIVE = "Lcom/apple/android/music/ttml/javanative/model/LyricsLine\$LyricsLineNative;"
private const val HOOK = "Lapp/voidhack/extension/applemusic/lyrics/LyricsInterludes;"
private const val NATIVE_INTERLUDE_THRESHOLD_MS = 7000L

private val LONG_CONST_OPCODES = setOf(
    Opcode.CONST_WIDE_16,
    Opcode.CONST_WIDE_32,
    Opcode.CONST_WIDE,
)

private val INT_CONST_OPCODES = setOf(
    Opcode.CONST_16,
    Opcode.CONST,
    Opcode.CONST_HIGH16,
)

private object LyricsLineEventCallback : Fingerprint(
    filters = listOf(
        methodCall(definingClass = LINE_NATIVE, name = "getLineId", returnType = "I"),
    ),
    custom = { method, classDef ->
        classDef.type.startsWith(FRAGMENT.removeSuffix(";") + "\$") &&
            method.implementation?.instructions?.any { insn ->
                insn.opcode in LONG_CONST_OPCODES &&
                    (insn as? WideLiteralInstruction)?.wideLiteral == NATIVE_INTERLUDE_THRESHOLD_MS
            } == true
    },
)

private object LyricsPlaybackStateInterlude : Fingerprint(
    definingClass = FRAGMENT,
    parameters = listOf("I"),
    returnType = "V",
    filters = listOf(
        methodCall(name = "getMediaBrowser"),
        methodCall(name = "isPlaying", returnType = "Z"),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode in LONG_CONST_OPCODES &&
                (insn as? WideLiteralInstruction)?.wideLiteral == NATIVE_INTERLUDE_THRESHOLD_MS
        } == true
    },
)

private object LyricsRenderInterlude : Fingerprint(
    definingClass = FRAGMENT,
    parameters = listOf(SONG_PTR),
    returnType = "V",
    filters = listOf(
        methodCall(name = "getMediaBrowser"),
        methodCall(name = "getCurrentPosition", returnType = "J"),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode in LONG_CONST_OPCODES &&
                (insn as? WideLiteralInstruction)?.wideLiteral == NATIVE_INTERLUDE_THRESHOLD_MS
        } == true
    },
)

internal val lyricsInterludePatch = bytecodePatch {
    dependsOn(lyricsBasePatch)

    execute {
        replaceLongThreshold(LyricsLineEventCallback.method)
        replaceLongThreshold(LyricsPlaybackStateInterlude.method)
        replaceLongThreshold(LyricsRenderInterlude.method)

        val adapterBaseType = checkNotNull(InlinePronunciation.classDef.superclass) {
            "Missing timed lyrics adapter superclass"
        }
        val adapterUpdateMethods = mutableListOf<MutableMethod>()
        classDefForEach { clazz ->
            if (clazz.superclass != adapterBaseType) return@classDefForEach
            val matching = clazz.methods.singleOrNull { method ->
                method.returnType == "V" &&
                    method.parameterTypes == listOf("Ljava/util/List;", "I", "[Landroid/util/Pair;") &&
                    method.implementation?.instructions?.any { insn ->
                        insn.opcode in INT_CONST_OPCODES &&
                            (insn as? WideLiteralInstruction)?.wideLiteral == NATIVE_INTERLUDE_THRESHOLD_MS
                    } == true
            }
            if (matching != null) {
                adapterUpdateMethods.add(
                    mutableClassDefBy(clazz.type).methods.single {
                        it.name == matching.name &&
                            it.parameterTypes == matching.parameterTypes &&
                            it.returnType == matching.returnType
                    },
                )
            }
        }
        check(adapterUpdateMethods.size == 2) {
            "Expected 2 timed lyrics adapter update methods with 7000ms threshold, found ${adapterUpdateMethods.size}"
        }
        for (method in adapterUpdateMethods) {
            replaceIntThreshold(method)
        }
    }
}

private fun MutableMethod.formatRegister(register: Int): String {
    val paramRegisters = parameterTypes.sumOf { type -> if (type == "J" || type == "D") 2 else 1 } +
        if (com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val localCount = checkNotNull(implementation).registerCount - paramRegisters
    return if (register < localCount) "v$register" else "p${register - localCount}"
}

private fun replaceLongThreshold(method: MutableMethod) {
    val matches = method.instructions.withIndex().filter { (_, insn) ->
        insn.opcode in LONG_CONST_OPCODES &&
            (insn as? WideLiteralInstruction)?.wideLiteral == NATIVE_INTERLUDE_THRESHOLD_MS
    }
    check(matches.size == 1) {
        "Expected single 7000L literal in ${method.definingClass}->${method.name}, found ${matches.size}"
    }
    val (index, insn) = matches.single()
    val targetReg = method.formatRegister((insn as OneRegisterInstruction).registerA)
    method.replaceInstruction(index, "invoke-static {}, $HOOK->currentThresholdLong()J")
    method.addInstruction(index + 1, "move-result-wide $targetReg")
}

private fun replaceIntThreshold(method: MutableMethod) {
    val matches = method.instructions.withIndex().filter { (_, insn) ->
        insn.opcode in INT_CONST_OPCODES &&
            (insn as? WideLiteralInstruction)?.wideLiteral == NATIVE_INTERLUDE_THRESHOLD_MS
    }
    check(matches.size == 1) {
        "Expected single 7000 int literal in ${method.definingClass}->${method.name}, found ${matches.size}"
    }
    val (index, insn) = matches.single()
    val targetReg = method.formatRegister((insn as OneRegisterInstruction).registerA)
    method.replaceInstruction(index, "invoke-static {}, $HOOK->currentThresholdInt()I")
    method.addInstruction(index + 1, "move-result $targetReg")
}
