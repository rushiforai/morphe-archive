/*
 * Copyright 2026 Rosaldivo.
 * https://github.com/Rosaldivo/rosaldivo-morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.rosaldivo.patches.music.autoplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.rosaldivo.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_SINGLE_SONG
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/rosaldivo/extension/music/SingleSongMixPatch;"

@Suppress("unused")
val noMixForSingleSongPatch = bytecodePatch(
    name = "No mix for single songs",
    description = "When autoplay is off, choosing a single song plays only that song, instead of " +
            "filling the queue with a radio mix.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_SINGLE_SONG)

    extendWith("extensions/music.mpe")

    execute {
        // region The queue lanes.

        val laneMethod = QueueLaneFingerprint.method
        val queueManagerClass = laneMethod.definingClass
        val laneClass = laneMethod.returnType

        val laneInterface = classDefBy(laneClass)
        listOf(
            "size" to "()I",
            "get" to "(I)Ljava/lang/Object;",
            "remove" to "(I)Ljava/lang/Object;",
        ).forEach { (name, signature) ->
            val found = laneInterface.methods.any {
                it.name == name && "(${it.parameterTypes.joinToString("")})${it.returnType}" == signature
            }
            if (!found) throw PatchException("Queue lane has no $name$signature")
        }

        // The extension learns the queue manager from the lane requests.
        laneMethod.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->setQueueManager(Ljava/lang/Object;)V"
        )

        implementExtensionMethod(
            "getLane",
            registerCount = 1,
            """
                check-cast p0, $queueManagerClass
                invoke-virtual { p0, p1 }, $queueManagerClass->${laneMethod.name}(I)$laneClass
                move-result-object v0
                return-object v0
            """
        )
        implementExtensionMethod(
            "laneSize",
            registerCount = 1,
            """
                check-cast p0, $laneClass
                invoke-interface { p0 }, $laneClass->size()I
                move-result v0
                return v0
            """
        )
        implementExtensionMethod(
            "laneGet",
            registerCount = 1,
            """
                check-cast p0, $laneClass
                invoke-interface { p0, p1 }, $laneClass->get(I)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """
        )
        implementExtensionMethod(
            "laneRemove",
            registerCount = 1,
            """
                check-cast p0, $laneClass
                invoke-interface { p0, p1 }, $laneClass->remove(I)Ljava/lang/Object;
                return-void
            """
        )

        // endregion

        // region The continuations.

        // The app asks for more songs whenever the queue gets short, which would bring the mix back.
        // The first parameter is the continuation type. The class keeps the continuations it knows of
        // in its only map field, and the queue shows a spinner for as long as it has one.
        val continuationMethod = QueueContinuationRequestFingerprint.method
        val continuationMapField = classDefBy(continuationMethod.definingClass).fields.single {
            it.type == "Ljava/util/Map;" && !AccessFlags.STATIC.isSet(it.accessFlags)
        }

        continuationMethod.addInstructionsWithLabels(
            0,
            """
                iget-object v1, p0, ${continuationMethod.definingClass}->${continuationMapField.name}:Ljava/util/Map;
                invoke-static { p1, v1 }, $EXTENSION_CLASS->blockContinuation(Ljava/lang/Object;Ljava/util/Map;)Z
                move-result v0
                if-eqz v0, :continue
                return-void
            """,
            ExternalLabel("continue", continuationMethod.getInstruction(0))
        )

        // The queue shows a spinner until it is told it is not loading, which it only does when
        // it is long enough. The method does so with 'loading.onNext(Boolean.FALSE)', copy it.
        val loadMoreMethod = QueueLoadMoreFingerprint.method
        val loadMoreInstructions = loadMoreMethod.implementation!!.instructions.toList()
        val falseIndex = loadMoreInstructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as? FieldReference)?.let { field ->
                        field.definingClass == "Ljava/lang/Boolean;" && field.name == "FALSE"
                    } == true
        }
        if (falseIndex < 0) throw PatchException("Could not find where the queue stops loading")

        // The field is read just before or after the constant, and the call is just after.
        val nearby = (maxOf(0, falseIndex - 2)..minOf(loadMoreInstructions.lastIndex, falseIndex + 2))
            .map { loadMoreInstructions[it] }
        val loadingField = nearby.firstNotNullOfOrNull {
            if (it.opcode != Opcode.IGET_OBJECT) return@firstNotNullOfOrNull null
            ((it as ReferenceInstruction).reference as? FieldReference)
                ?.takeIf { field -> field.definingClass == loadMoreMethod.definingClass }
        } ?: throw PatchException("Could not find the loading field")
        val setLoadingMethod = nearby.firstNotNullOfOrNull {
            if (it.opcode != Opcode.INVOKE_VIRTUAL) return@firstNotNullOfOrNull null
            (it as ReferenceInstruction).reference as? MethodReference
        } ?: throw PatchException("Could not find the loading method")

        loadMoreMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->isSingleSongQueue()Z
                move-result v0
                if-eqz v0, :normal
                iget-object v0, p0, ${loadingField.definingClass}->${loadingField.name}:${loadingField.type}
                sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-virtual { v0, v1 }, ${setLoadingMethod.definingClass}->${setLoadingMethod.name}(${setLoadingMethod.parameterTypes.joinToString("")})${setLoadingMethod.returnType}
                return-void
            """,
            ExternalLabel("normal", loadMoreMethod.getInstruction(0))
        )

        // endregion

        // region The queue load.

        // The first parameter is the server response with the songs. Whether it is the mix of a
        // single song is for the extension to tell.
        QueueResponseFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->onQueueLoad(Ljava/lang/Object;)V"
        )

        // endregion
    }
}

/**
 * Replaces the body of a static stub method of the extension class.
 *
 * @param registerCount Number of registers used besides the parameter registers.
 */
private fun BytecodePatchContext.implementExtensionMethod(
    name: String,
    registerCount: Int,
    smali: String,
) {
    mutableClassDefBy(EXTENSION_CLASS).apply {
        val stub = methods.first { it.name == name }
        methods.remove(stub)

        val parameterRegisters = stub.parameterTypes.sumOf {
            val type = it.toString()
            if (type == "J" || type == "D") 2L else 1L
        }.toInt()
        methods.add(
            ImmutableMethod(
                type,
                stub.name,
                stub.parameters.map { ImmutableMethodParameter(it.type, null, it.name) },
                stub.returnType,
                stub.accessFlags,
                null,
                null,
                MutableMethodImplementation(registerCount + parameterRegisters),
            ).toMutable().apply {
                addInstructionsWithLabels(0, smali)
            }
        )
    }
}
