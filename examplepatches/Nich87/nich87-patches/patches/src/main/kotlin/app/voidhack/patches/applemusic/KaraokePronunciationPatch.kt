package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val WORDS = "Lcom/apple/android/music/ttml/javanative/model/LyricsWordVector;"
private const val ROW = "Lcom/apple/android/music/common/views/FullWidthAlphaGradientFlexboxLayout;"
private const val MAP = "Landroid/util/ArrayMap;"
private const val SONG = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val GROUP = "Landroid/view/ViewGroup;"
private const val STRING = "Ljava/lang/String;"
private const val HOOK = "Lapp/voidhack/extension/applemusic/lyrics/KaraokePronunciation;"

internal object InlinePronunciation : Fingerprint(
    parameters = listOf(WORDS, STRING, ROW, "I"),
    returnType = MAP,
    filters = listOf(methodCall(definingClass = WORDS, name = "size")),
    custom = { _, clazz -> clazz.type.startsWith("Lcom/apple/android/music/player/") },
)

internal val karaokePronunciationPatch = bytecodePatch {
    execute {
        val inline = InlinePronunciation.method
        val karaoke = InlinePronunciation.classDef
        val base = mutableClassDefBy(checkNotNull(karaoke.superclass))
        val song = base.methods.single { it.parameterTypes.isEmpty() && it.returnType == SONG }
        val updateLines = karaoke.methods.single {
            it.returnType == "V" && it.parameterTypes == listOf("Ljava/util/List;", "I", "[Landroid/util/Pair;")
        }
        val activeLines = updateLines.instructions.firstNotNullOf { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            field?.takeIf {
                instruction.opcode == Opcode.IGET_OBJECT &&
                    it.definingClass == karaoke.type && it.type == "Ljava/util/TreeSet;"
            }
        }
        val originalPreferred = base.methods.single { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() && method.implementation != null &&
                method.instructions.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ref?.name == "LYRICS" && ref.definingClass.startsWith("Lcom/apple/android/music/player/")
                }
        }

        // Keep the original word animation in the primary lyric layout.
        originalPreferred.addInstructionsWithLabels(
            0,
            """
                instance-of v0, p0, ${karaoke.type}
                if-eqz v0, :native
                invoke-virtual {p0}, $song
                move-result-object v0
                invoke-static {v0}, $HOOK->usesLineGuide(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :native
                return v0
                :native
                nop
            """,
        )

        inline.addInstructionsWithLabels(
            0,
            """
                invoke-virtual/range {p0 .. p0}, $song
                move-result-object v0
                move-object/from16 v1, p2
                move-object/from16 v2, p3
                move/from16 v3, p4
                move-object/from16 v4, p1
                invoke-static {v0, v1, v2, v3, v4}, $HOOK->capture(Ljava/lang/Object;$STRING${GROUP}ILjava/lang/Object;)$MAP
                move-result-object v0
                if-eqz v0, :native
                return-object v0
                :native
                nop
            """,
        )

        val wordLayout = karaoke.methods.single {
            it.returnType == MAP && it.parameterTypes == listOf(WORDS, MAP, ROW, "I", "I", "Z", "Z")
        }
        val wrapper = ImmutableMethod(
            karaoke.type,
            wordLayout.name,
            wordLayout.parameters,
            MAP,
            wordLayout.accessFlags,
            null,
            null,
            MutableMethodImplementation(11),
        ).toMutable()
        wordLayout.name = "voidhackLayoutKaraokeWords"
        wrapper.addInstructions(
            0,
            """
                invoke-static {p3, p2}, $HOOK->take($GROUP$MAP)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :layout_words
                const/4 p2, 0x0
                :layout_words
                invoke-virtual/range {p0 .. p7}, $wordLayout
                move-result-object v1
                if-eqz v0, :done
                iget-object v2, p0, $activeLines
                invoke-static {p0, p3, v0, p5, v2}, $HOOK->attach(Ljava/lang/Object;${GROUP}Ljava/lang/Object;ILjava/util/Set;)V
                :done
                return-object v1
            """,
        )
        karaoke.methods.add(wrapper)

        val lineWrapper = ImmutableMethod(
            karaoke.type,
            updateLines.name,
            updateLines.parameters,
            "V",
            updateLines.accessFlags,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable()
        updateLines.name = "voidhackUpdateKaraokeLines"
        lineWrapper.addInstructions(
            0,
            """
                invoke-virtual {p0, p1, p2, p3}, $updateLines
                iget-object v0, p0, $activeLines
                invoke-static {p0, v0}, $HOOK->syncActiveLines(Ljava/lang/Object;Ljava/util/Set;)V
                return-void
            """,
        )
        karaoke.methods.add(lineWrapper)
    }
}
