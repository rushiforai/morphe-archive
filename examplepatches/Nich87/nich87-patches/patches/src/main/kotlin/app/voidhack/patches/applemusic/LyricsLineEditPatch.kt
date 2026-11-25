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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
private const val SONG_INFO = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;"
private const val SONG_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val LINE_PTR = "Lcom/apple/android/music/ttml/javanative/model/LyricsLine\$LyricsLinePtr;"
private const val ADAPTER = "Landroidx/recyclerview/widget/RecyclerView\$f;"
private const val HOLDER = "Landroidx/recyclerview/widget/RecyclerView\$D;"
private const val BINDING = "Landroidx/databinding/ViewDataBinding;"
private const val VIEW = "Landroid/view/View;"
private const val HOOK = "Lapp/voidhack/extension/applemusic/lyrics/LyricsLineGestures;"
private const val SHARE = "voidhackNativeShareLyricLine"
private const val TIMED_TARGET = "voidhackTimedLyricTarget"

private object ShareTimedLyric : Fingerprint(
    definingClass = FRAGMENT,
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = VIEW, name = "getTag", parameters = listOf("I")),
        methodCall(definingClass = HOLDER, parameters = emptyList(), returnType = "I"),
        methodCall(name = "getImageUrl"),
    ),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 3 &&
            method.parameterTypes.take(2) == listOf(FRAGMENT, VIEW)
    },
)

private object LegacyLyricRender : Fingerprint(
    definingClass = FRAGMENT,
    parameters = listOf(SONG_PTR, "Z"),
    returnType = "V",
    filters = listOf(methodCall(definingClass = SONG_INFO, name = "generateLegacyLyricsLines")),
)

private object NativeCustomLyricRender : Fingerprint(
    definingClass = FRAGMENT,
    parameters = listOf(SONG_PTR),
    returnType = "V",
    filters = listOf(methodCall(name = "customLyrics", returnType = "Ljava/lang/String;")),
)

internal val lyricsLineEditPatch = bytecodePatch {
    execute {
        val nativeShare = ShareTimedLyric.method
        val adapterType = nativeShare.parameterTypes[2]
        val shareRefs = nativeShare.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        val holderPosition = shareRefs.single { it.definingClass == HOLDER && it.returnType == "I" }
        val nativePosition = shareRefs.single { it.definingClass == adapterType && it.parameterTypes == listOf("I", "Z") }
        val tagCall = nativeShare.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref -> ref.definingClass == VIEW && ref.name == "getTag" } == true
        }
        val rowTag = (nativeShare.instructions[tagCall - 1] as NarrowLiteralInstruction).narrowLiteral
        val rowHolder = (nativeShare.instructions[tagCall + 2] as ReferenceInstruction).reference
        val timedAdapter = mutableClassDefBy(adapterType.toString())
        val lines = timedAdapter.methods.single {
            it.parameterTypes.isEmpty() && it.returnType.startsWith("Lcom/apple/android/music/ttml/") &&
                !it.returnType.startsWith("Lcom/apple/android/music/ttml/javanative/")
        }
        val lineAt = mutableClassDefBy(lines.returnType).methods.single {
            it.parameterTypes == listOf("I") && it.returnType == LINE_PTR
        }
        val song = timedAdapter.methods.single { it.parameterTypes.isEmpty() && it.returnType == SONG_PTR }

        val fragment = ShareTimedLyric.classDef
        val targetMethod = ImmutableMethod(
            FRAGMENT,
            TIMED_TARGET,
            nativeShare.parameters.drop(1),
            "[Ljava/lang/Object;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(7),
        ).toMutable()
        targetMethod.addInstructions(
            0,
            """
                const v0, $rowTag
                invoke-virtual {p0, v0}, $VIEW->getTag(I)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $rowHolder
                if-eqz v0, :missing
                invoke-virtual {v0}, $holderPosition
                move-result v0
                if-ltz v0, :missing
                const/4 v1, 0x1
                invoke-virtual {p1, v0, v1}, $nativePosition
                move-result v0
                if-ltz v0, :missing
                invoke-virtual {p1}, $lines
                move-result-object v1
                if-eqz v1, :missing
                invoke-virtual {v1, v0}, $lineAt
                move-result-object v1
                if-eqz v1, :missing
                invoke-virtual {p1}, $song
                move-result-object v2
                invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v3
                filled-new-array {v1, v2, v3}, [Ljava/lang/Object;
                move-result-object v4
                return-object v4
                :missing
                const/4 v0, 0x0
                return-object v0
            """,
        )
        fragment.methods.add(targetMethod)

        val wrapper = ImmutableMethod(
            FRAGMENT,
            nativeShare.name,
            nativeShare.parameters,
            "V",
            nativeShare.accessFlags,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable()
        nativeShare.name = SHARE
        wrapper.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $FRAGMENT->$TIMED_TARGET($VIEW$adapterType)[Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :done
                invoke-static {p0, p1, p2, v0}, $HOOK->editTimed(Ljava/lang/Object;${VIEW}Ljava/lang/Object;[Ljava/lang/Object;)V
                :done
                return-void
            """,
        )
        fragment.methods.add(wrapper)

        val timedHolderFactories = mutableListOf<Method>()
        classDefForEach { clazz ->
            if (clazz.superclass != adapterType) return@classDefForEach
            clazz.methods.singleOrNull {
                it.returnType == HOLDER && it.parameterTypes == listOf("Landroid/view/ViewGroup;", "I") &&
                    it.implementation?.instructions?.any { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getLyricsShareSignaturePrefix"
                    } == true
            }?.let(timedHolderFactories::add)
        }
        check(timedHolderFactories.size == 2)
        for (method in timedHolderFactories) {
            val factory = mutableClassDefBy(method.definingClass).methods.single { it == method }
            val listenerCall = factory.instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setOnLongClickListener"
            }
            val branch = factory.instructions[listenerCall - 2]
            check(branch.opcode == Opcode.IF_EQZ && factory.instructions[listenerCall - 1].opcode == Opcode.IGET_OBJECT)
            val view = (factory.instructions[listenerCall] as FiveRegisterInstruction).registerC
            val signature = (branch as OneRegisterInstruction).registerA
            factory.replaceInstruction(listenerCall - 2, "invoke-static {v$view, v$signature}, $HOOK->setTimedShare(${VIEW}Ljava/lang/String;)V")
        }

        val legacyRender = LegacyLyricRender.method
        val legacyLinesCall = legacyRender.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "generateLegacyLyricsLines"
        }
        val (lyricsField, adapterRegister) = legacyRender.instructions.take(legacyLinesCall).asReversed().firstNotNullOf { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode == Opcode.IPUT_OBJECT && ref?.type == "Ljava/lang/String;") {
                ref to (instruction as TwoRegisterInstruction).registerB
            } else {
                null
            }
        }
        val legacyRefresh = legacyRender.instructions.withIndex().single { (index, instruction) ->
            index > legacyLinesCall && (instruction as? FiveRegisterInstruction)?.registerC == adapterRegister &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { it.definingClass == ADAPTER && it.name == "g" } == true
        }.index
        legacyRender.replaceInstruction(legacyRefresh, "invoke-static {p0, v$adapterRegister}, $HOOK->bindStaticAdapter(Ljava/lang/Object;Ljava/lang/Object;)V")
        legacyRender.addInstruction(legacyRefresh + 1, "invoke-virtual {v$adapterRegister}, $ADAPTER->g()V")

        val rawRender = NativeCustomLyricRender.method
        val rawReceiverCopy = rawRender.instructions.first() as TwoRegisterInstruction
        check(rawReceiverCopy.opcode == Opcode.MOVE_OBJECT_FROM16 &&
            rawReceiverCopy.registerB == checkNotNull(rawRender.implementation).registerCount - 2)
        val fragmentRegister = rawReceiverCopy.registerA
        val rawWrite = rawRender.instructions.indexOfLast {
            it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference == lyricsField
        }
        check(rawWrite >= 0)
        val rawAdapter = (rawRender.instructions[rawWrite] as TwoRegisterInstruction).registerB
        val rawRefresh = rawRender.instructions.withIndex().single { (index, instruction) ->
            index > rawWrite && (instruction as? FiveRegisterInstruction)?.registerC == rawAdapter &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { it.definingClass == ADAPTER && it.name == "g" } == true
        }.index
        rawRender.replaceInstruction(rawRefresh, "invoke-static {v$fragmentRegister, v$rawAdapter}, $HOOK->bindStaticAdapter(Ljava/lang/Object;Ljava/lang/Object;)V")
        rawRender.addInstruction(rawRefresh + 1, "invoke-virtual {v$rawAdapter}, $ADAPTER->g()V")

        val legacy = mutableClassDefBy(lyricsField.definingClass)
        val bind = legacy.methods.single { it.parameterTypes == listOf(HOLDER, "I") && it.returnType == "V" }
        val boundHolder = (bind.instructions.first() as ReferenceInstruction).reference.toString()
        val holderCtor = mutableClassDefBy(boundHolder).methods.single { it.name == "<init>" && it.parameterTypes == listOf(BINDING) }
        val rootView = holderCtor.instructions.firstNotNullOf {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field -> field.definingClass == BINDING && field.type == VIEW }
        }
        val read = bind.instructions.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && (it as? ReferenceInstruction)?.reference == lyricsField }
        check(read > 0 && bind.instructions[read - 1].opcode == Opcode.CHECK_CAST)
        bind.addInstructions(
            read,
            """
                iget-object p2, p1, $rootView
                invoke-static {p0, p2}, $HOOK->bindStaticView(Ljava/lang/Object;$VIEW)V
            """,
        )
    }
}
