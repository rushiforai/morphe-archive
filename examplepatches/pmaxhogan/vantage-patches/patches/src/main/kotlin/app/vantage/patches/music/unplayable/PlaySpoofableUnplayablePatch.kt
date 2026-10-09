package app.vantage.patches.music.unplayable

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val EXTENSION_CLASS = "Lapp/vantage/extension/music/UnplayableOverride;"

private const val STREAMING_DATA_CLASS =
    "Lcom/google/protos/youtube/api/innertube/StreamingDataOuterClass\$StreamingData;"

// How far back from `new <StreamingDataModel>` to look for the has-bits read
// that guards it. The guard is `iget vX, vResponse, PlayerResponse->bits:I`,
// `and-int/lit16 vX, vX, 0x10`, `if-eqz vX, ...`, then the new-instance.
private const val MAX_GUARD_DISTANCE = 8

private val COMPATIBILITY_MUSIC =
    Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
    )

/**
 * The streaming-data model built from a PlayerResponse (apci in 9.15.51). It
 * carries this log string; anddea's spoof patch anchors on the same class.
 */
internal val streamingDataModelFingerprint =
    Fingerprint(
        strings = listOf("Invalid playback type; streaming data is not playable"),
    )

// MusicResponsiveListItemRenderer's extension field number on the generic
// Renderer message. Proto field numbers are wire format, so they do not change
// with obfuscation.
private const val LIST_ITEM_RENDERER_EXTENSION = 161429595L

/**
 * The static initializer that registers MusicResponsiveListItemRenderer as an
 * extension of Renderer (bwio.<clinit> in 9.15.51):
 * newSingularGeneratedExtension(Renderer, default, default, null, 161429595, MESSAGE, X.class).
 */
internal val listItemRendererExtensionFingerprint =
    Fingerprint(
        name = "<clinit>",
        filters = listOf(literal(LIST_ITEM_RENDERER_EXTENSION)),
    )

// Every list-row presenter puts this key into its binding context.
private const val LIST_ROW_PRESENTER_STRING = "sectionControllerPosition"

private fun app.morphe.patcher.patch.BytecodePatchContext.hookListRows() {
    val registration = listItemRendererExtensionFingerprint.method
    // The extension's message class is the one const-class in the initializer
    // (it is loaded before the field number, not after).
    val rowClass = registration.implementation!!.instructions
        .filter { it.opcode == Opcode.CONST_CLASS }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        .singleOrNull()
        ?: throw PatchException("expected exactly one const-class in the list-row extension initializer")

    val presenters = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val usesKey = classDef.methods.any { method ->
            method.implementation?.instructions?.any {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as ReferenceInstruction).reference as com.android.tools.smali.dexlib2.iface.reference.StringReference)
                        .string == LIST_ROW_PRESENTER_STRING
            } ?: false
        }
        if (usesKey) presenters += classDef
    }

    var hooked = 0
    presenters.forEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef)
        mutableClass.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            // Each instruction that leaves a row in a register: a cast to the
            // row type, or a read of a row-typed field (the playlist page binds
            // rows through a small wrapper object).
            val producers = instructions.withIndex().filter { (_, instruction) ->
                when (instruction.opcode) {
                    Opcode.CHECK_CAST ->
                        ((instruction as ReferenceInstruction).reference as TypeReference).type == rowClass
                    Opcode.IGET_OBJECT ->
                        ((instruction as ReferenceInstruction).reference as FieldReference).type == rowClass
                    else -> false
                }
            }
            producers.sortedByDescending { it.index }.forEach { (index, instruction) ->
                val register =
                    (instruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                method.addInstruction(
                    index + 1,
                    "invoke-static/range { v$register .. v$register }, " +
                        "$EXTENSION_CLASS->onListItem(Ljava/lang/Object;)V",
                )
                hooked++
            }
        }
    }

    if (hooked == 0) {
        throw PatchException("found no list-row presenter binding $rowClass")
    }
}

@Suppress("unused")
val playSpoofableUnplayablePatch =
    bytecodePatch(
        name = "Play videos Music marks unavailable",
        description = "Plays a video that YouTube Music's own player API refuses as " +
            "\"This video is not available\" when the client used by Spoof video streams " +
            "can play it. Needs Spoof video streams; does nothing without it.",
    ) {
        compatibleWith(COMPATIBILITY_MUSIC)

        extendWith("extensions/music.mpe")

        execute {
            val modelClass = streamingDataModelFingerprint.classDef
            val modelCtor =
                modelClass.methods.singleOrNull {
                    it.name == "<init>" &&
                        it.parameterTypes.size == 1 &&
                        it.parameterTypes[0].toString() != STREAMING_DATA_CLASS
                } ?: throw PatchException("streaming-data model has no single PlayerResponse constructor")
            val playerResponseClass = modelCtor.parameterTypes[0].toString()

            fun isModelCtorCall(ref: MethodReference?) =
                ref != null && MethodUtil.methodSignaturesMatch(ref, modelCtor)

            // Collect first, patch after: mutating classes while iterating them
            // is not safe.
            val sites = mutableListOf<Pair<ClassDef, Method>>()
            classDefForEach { classDef ->
                classDef.methods.forEach { method ->
                    val hit = method.implementation?.instructions?.any {
                        it.opcode == Opcode.INVOKE_DIRECT &&
                            isModelCtorCall((it as ReferenceInstruction).reference as? MethodReference)
                    } ?: false
                    if (hit) sites += classDef to method
                }
            }

            var hooked = 0
            sites.forEach { (classDef, method) ->
                val mutable =
                    mutableClassDefBy(classDef).methods.first { MethodUtil.methodSignaturesMatch(it, method) }
                val instructions = mutable.instructions.toList()

                // Highest index first, so earlier insertions do not shift later ones.
                val insertAt = sortedSetOf<Pair<Int, Int>>(compareByDescending { it.first })
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.NEW_INSTANCE) return@forEachIndexed
                    val type = ((instruction as ReferenceInstruction).reference as TypeReference).type
                    if (type != modelClass.type) return@forEachIndexed

                    val guardIndex = (index - 1 downTo maxOf(0, index - MAX_GUARD_DISTANCE)).firstOrNull { i ->
                        val candidate = instructions[i]
                        candidate.opcode == Opcode.IGET &&
                            ((candidate as ReferenceInstruction).reference as FieldReference).let {
                                it.definingClass == playerResponseClass && it.type == "I"
                            }
                    } ?: return@forEachIndexed

                    val responseRegister = (instructions[guardIndex] as TwoRegisterInstruction).registerB
                    insertAt += guardIndex to responseRegister
                }

                insertAt.forEach { (index, register) ->
                    mutable.addInstruction(
                        index,
                        "invoke-static/range { v$register .. v$register }, " +
                            "$EXTENSION_CLASS->onPlayerResponse(Ljava/lang/Object;)V",
                    )
                    hooked++
                }
            }

            if (hooked == 0) {
                throw PatchException(
                    "found no has-streaming-data guard before ${modelClass.type} construction " +
                        "(${sites.size} candidate methods)",
                )
            }

            hookListRows()
        }
    }
