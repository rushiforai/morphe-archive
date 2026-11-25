package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
private const val SONG_INFO = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;"
private const val SONG_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val ADAPTER = "Landroidx/recyclerview/widget/RecyclerView\$f;"
private const val HOLDER = "Landroidx/recyclerview/widget/RecyclerView\$D;"
private const val HOOK = "Lapp/voidhack/extension/applemusic/lyrics/StaticLyricsPronunciation;"

private object LegacyLyricsRender : Fingerprint(
    definingClass = FRAGMENT,
    parameters = listOf(SONG_PTR, "Z"),
    returnType = "V",
    filters = listOf(methodCall(definingClass = SONG_INFO, name = "generateLegacyLyricsLines")),
)

private object PronunciationSelected : Fingerprint(
    name = "onChanged",
    parameters = listOf("Ljava/lang/Boolean;"),
    returnType = "V",
    filters = listOf(methodCall(name = "setIsPronunciationDisplayed", parameters = listOf("Z"), returnType = "V")),
    custom = { _, classDef -> classDef.type.startsWith(FRAGMENT.removeSuffix(";") + "\$") },
)

internal val staticLyricsPronunciationPatch = bytecodePatch {
    execute {
        val render = LegacyLyricsRender.method
        val sourceCall = render.instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == SONG_INFO && ref.name == "generateLegacyLyricsLines"
        }
        val (lyricsField, adapterRegister) = render.instructions.take(sourceCall).asReversed().firstNotNullOf { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode == Opcode.IPUT_OBJECT && field?.type == "Ljava/lang/String;") {
                field to (instruction as TwoRegisterInstruction).registerB
            } else {
                null
            }
        }
        val refreshIndex = (sourceCall + 1 until render.instructions.size).first { index ->
            val instruction = render.instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == ADAPTER && reference.name == "g" &&
                (instruction as? FiveRegisterInstruction)?.registerC == adapterRegister
        }
        check(adapterRegister == checkNotNull(render.implementation).registerCount - 1)
        render.replaceInstruction(
            refreshIndex,
            "invoke-static {p0, p2, p1}, $HOOK->bind(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        render.addInstruction(refreshIndex + 1, "invoke-virtual {p2}, $ADAPTER->g()V")
        render.addInstruction(0, "invoke-static {p0}, $HOOK->clear(Ljava/lang/Object;)V")

        val adapter = mutableClassDefBy(lyricsField.definingClass)
        val bind = adapter.methods.single {
            it.parameterTypes == listOf(HOLDER, "I") && it.returnType == "V"
        }
        val readIndex = bind.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                (instruction as? ReferenceInstruction)?.reference == lyricsField
        }
        val read = bind.instructions[readIndex] as TwoRegisterInstruction
        val parameterBase = checkNotNull(bind.implementation).registerCount - 3
        check(read.registerA == parameterBase && read.registerB == parameterBase)
        val consume = bind.instructions[readIndex + 1] as ReferenceInstruction
        check((consume.reference as MethodReference).parameterTypes == listOf("Ljava/lang/CharSequence;"))
        bind.replaceInstruction(readIndex, "iget-object p2, p0, $lyricsField")
        bind.addInstructions(
            readIndex + 1,
            """
                invoke-static {p0, p2}, $HOOK->display(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/CharSequence;
                move-result-object p0
            """,
        )
        val refresh = ImmutableMethod(
            adapter.type,
            "voidhackRefreshStaticLyrics",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(1),
        ).toMutable()
        refresh.addInstructions(0, "invoke-virtual {p0}, $ADAPTER->g()V\nreturn-void")
        adapter.methods.add(refresh)

        val selected = PronunciationSelected.method
        val fragment = selected.instructions.firstNotNullOf { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            field?.takeIf { it.definingClass == selected.definingClass && it.type == FRAGMENT }
        }
        selected.addInstructions(
            0,
            """
                iget-object v0, p0, $fragment
                invoke-static {v0, p1}, $HOOK->onSelectionChanged(Ljava/lang/Object;Ljava/lang/Boolean;)V
            """,
        )
    }
}
