package io.github.liongalahad.nuviotv.patches.playback.sourceselectionrestore

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/playback/sourceselectionrestore/SourceSelectionRestoreRuntime;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.source_selection_restore"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore.SourceSelectionRestoreSettingsCategory"

private val sourceSelectionRestoreCategoryResourcePatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", CATEGORY_METADATA)
                setAttribute("android:value", CATEGORY_PROVIDER)
            })
        }
    }
}

@Suppress("unused")
val sourceSelectionRestorePatch = bytecodePatch(
    name = "Restore Source Selection",
    description = "Returns the source picker to the source played before leaving the player.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch, sourceSelectionRestoreCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        StreamScreenFingerprint.matchAll(1..1)
        PlayerScreenFingerprint.matchAll(1..1)
        StreamsListFingerprint.matchAll(1..1)

        val streamsListMethod = StreamsListFingerprint.method
        val originalInstructions = streamsListMethod.implementation!!.instructions
        val lazyListStateCallIndex = originalInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfFirst false
            reference.returnType == "Le0/i0;" &&
                reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                    parameters.size == 5 && parameters.take(2) == listOf("I", "I") &&
                        parameters[2] == "Le1/m0;"
                }
        }
        require(lazyListStateCallIndex >= 0) { "StreamsList lazy-list state creation was not found" }
        val lazyListStateRegister =
            (originalInstructions.getOrNull(lazyListStateCallIndex + 1) as? OneRegisterInstruction)
                ?.registerA ?: error("StreamsList lazy-list state result register was not found")

        // Nuvio's filter-key effect resets every newly composed list to item zero. Queue the
        // selected viewport after composition so the existing focus effect can reach its row.
        streamsListMethod.addInstructions(
            lazyListStateCallIndex + 2,
            "invoke-static/range { v$lazyListStateRegister .. v$lazyListStateRegister }, " +
                "$RUNTIME->scheduleViewportRestore(Ljava/lang/Object;)V"
        )

        // Every manual internal-player route eventually invokes this callback. Wrapping it
        // arms one restore for the same Navigation Compose back-stack entry without storing
        // a Stream, URL, provider result, or cross-content identifier.
        StreamScreenFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapSelectionCallback(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;
                move-result-object p2
            """
        )

        // The player can begin before the outgoing source composable finishes its transition.
        // Wrap both player exit paths, making the marker consumable only when Back/error exits.
        PlayerScreenFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapPlayerBackCallback(Lkotlin/jvm/functions/Function5;)Lkotlin/jvm/functions/Function5;
                move-result-object p1
                move-object/from16 v0, p2
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapPlayerErrorBackCallback(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                move-result-object p2
            """
        )

        // Nuvio already owns the saveable clicked index, list state, clamping, focus requester,
        // and one-shot completion callback. Supply its restore flag only for the armed return.
        streamsListMethod.addInstructions(
            0,
            """
                move/from16 v0, p3
                move/from16 v1, p2
                invoke-static { v0, v1 }, $RUNTIME->shouldRestoreSelection(ZI)Z
                move-result v0
                move/16 p3, v0
                move-object/from16 v0, p4
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapRestoreHandledCallback(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                move-result-object p4
            """
        )
    }
}
