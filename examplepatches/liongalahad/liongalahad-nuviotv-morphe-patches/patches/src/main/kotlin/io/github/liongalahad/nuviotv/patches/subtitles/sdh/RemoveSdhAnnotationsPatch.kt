package io.github.liongalahad.nuviotv.patches.subtitles.sdh

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import io.github.liongalahad.nuviotv.patches.shared.updates.patchedAppUpdatesPatch
import org.w3c.dom.Element

private const val CUE_TRANSFORMER =
    "Lio/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCueTransformer;"
private const val CUE_GROUP = "Landroidx/media3/common/text/CueGroup;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.remove_sdh_annotations"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.subtitles.sdh.RemoveSdhSettingsCategory"

private val sdhCategoryResourcePatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            listOf(CATEGORY_METADATA).forEach { metadataName ->
                val alreadyPresent = (0 until application.getElementsByTagName("meta-data").length).any { index ->
                    (application.getElementsByTagName("meta-data").item(index) as? Element)
                        ?.getAttribute("android:name") == metadataName
                }
                if (!alreadyPresent) {
                    application.appendChild(document.createElement("meta-data").apply {
                        setAttribute("android:name", metadataName)
                        setAttribute("android:value", CATEGORY_PROVIDER)
                    })
                }
            }
        }
    }
}

@Suppress("unused")
val removeSdhAnnotationsPatch = bytecodePatch(
    name = "Remove SDH Annotations",
    description = "Adds Settings → Morphe → Subtitles to normalize music symbols and remove SDH annotations from Media3 subtitles.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdatesPatch, settingsUiPatch, sdhCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            NativeSdhFilterFingerprint,
            CueGroupOutputFingerprint,
            LegacyCueOutputFingerprint,
            SidecarCueRenderFingerprint
        ).forEach {
            it.matchAll(1..1)
        }

        fun MutableMethod.bindRecognitionSession() = addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $CUE_TRANSFORMER->beginSession(Ljava/lang/Object;)V
            """
        )

        fun MutableMethod.hook(parameter: String, returnType: String) {
            addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $CUE_TRANSFORMER->clean($parameter)$returnType
                move-result-object p1
            """
            )
            bindRecognitionSession()
        }

        NativeSdhFilterFingerprint.method.apply {
            check(implementation!!.registerCount >= 3) {
                "Native SDH filter no longer has a safe local arbitration register"
            }
            val cueListRegister = if (AccessFlags.STATIC.isSet(accessFlags)) "p0" else "p1"
            check(returnType == "Ljava/util/ArrayList;") {
                "Native SDH filter no longer has the verified 0.8.11 ArrayList return type: $returnType"
            }
            addInstructions(
                0,
                """
                    invoke-static {}, $CUE_TRANSFORMER->shouldApplyNativeFilter()Z
                    move-result v0
                    if-nez v0, :morphe_run_native_sdh_filter
                    invoke-static { $cueListRegister }, $CUE_TRANSFORMER->bypassNativeFilter(Ljava/util/List;)Ljava/util/ArrayList;
                    move-result-object v0
                    return-object v0
                    :morphe_run_native_sdh_filter
                """
            )
        }

        CueGroupOutputFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val cueListRead = instructions.withIndex().single { (_, instruction) ->
                if (instruction.opcode != Opcode.IGET_OBJECT) return@single false
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@single false
                reference.definingClass == CUE_GROUP
            }
            val listRegister = (cueListRead.value as? TwoRegisterInstruction)?.registerA
                ?: error("CueGroup cue-list read has no destination register")
            check(listRegister == 2 && implementation!!.registerCount == 7) {
                "CueGroup callback no longer has the verified 0.8.11 register layout: " +
                    "list=v$listRegister, registerCount=${implementation!!.registerCount}"
            }
            val presentationTimeField = instructions.mapNotNull { instruction ->
                if (instruction.opcode != Opcode.IGET_WIDE) return@mapNotNull null
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }.single { reference ->
                reference.definingClass == CUE_GROUP && reference.type == "J"
            }
            val presentationTimeDescriptor = buildString {
                append(presentationTimeField.definingClass)
                    .append("->")
                    .append(presentationTimeField.name)
                    .append(":")
                    .append(presentationTimeField.type)
            }
            val cueListDescriptor = buildString {
                val reference = (cueListRead.value as ReferenceInstruction).reference as FieldReference
                append(reference.definingClass)
                    .append("->")
                    .append(reference.name)
                    .append(":")
                    .append(reference.type)
            }

            val constructorIndex = CueGroupOutputFingerprint.instructionMatches.first().index
            val constructorInstruction = getInstruction<com.android.tools.smali.dexlib2.iface.instruction.Instruction>(
                constructorIndex
            )
            val reconstructedListRegister = when (constructorInstruction) {
                is FiveRegisterInstruction -> constructorInstruction.registerD
                is RegisterRangeInstruction -> constructorInstruction.startRegister + 1
                else -> error("CueGroup constructor call uses an unsupported instruction format")
            }
            addInstructions(
                constructorIndex,
                """
                    invoke-static { v$reconstructedListRegister }, $CUE_TRANSFORMER->clean(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$reconstructedListRegister
                """
            )

            // When Nuvio's native SDH filter is disabled, it forwards the incoming CueGroup
            // directly. Rebuild that group in the direct-forward branch, where v0 and
            // v2..v4 are dead, so the injected code cannot corrupt the typed locals used
            // by Nuvio's conditional reconstruction branch.
            val directForwardIndex = instructions.withIndex().first { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@first false
                reference.definingClass == "Landroidx/media3/exoplayer/text/TextOutput;" &&
                    reference.name == "onCues" &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf(CUE_GROUP)
            }.index
            check(directForwardIndex < constructorIndex) {
                "CueGroup direct-forward call no longer precedes reconstruction"
            }
            addInstructions(
                directForwardIndex,
                """
                    iget-object v2, p1, $cueListDescriptor
                    invoke-static { v2 }, $CUE_TRANSFORMER->clean(Ljava/util/List;)Ljava/util/List;
                    move-result-object v2
                    iget-wide v3, p1, $presentationTimeDescriptor
                    new-instance v0, $CUE_GROUP
                    invoke-direct { v0, v2, v3, v4 }, $CUE_GROUP-><init>(Ljava/util/List;J)V
                    move-object p1, v0
                """
            )
            bindRecognitionSession()
        }
        LegacyCueOutputFingerprint.method.hook("Ljava/util/List;", "Ljava/util/List;")

        SidecarCueRenderFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val setCuesIndex = instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                    ?: return@single false
                reference.definingClass == "Landroidx/media3/ui/SubtitleView;" &&
                    reference.name == "setCues" &&
                    reference.parameterTypes.map(CharSequence::toString) ==
                        listOf("Ljava/util/List;")
            }.index
            val sidecarListRead = instructions.take(setCuesIndex).withIndex().last { (_, instruction) ->
                if (instruction.opcode != Opcode.IGET_OBJECT) return@last false
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@last false
                reference.definingClass == definingClass && reference.type == "Ljava/util/List;"
            }
            val listRegister = (sidecarListRead.value as? TwoRegisterInstruction)?.registerA
                ?: error("Sidecar cue-list read has no object destination")
            check(listRegister <= 15) {
                "Sidecar cue-list register cannot be encoded safely: v$listRegister"
            }
            addInstructions(
                sidecarListRead.index + 1,
                """
                    invoke-static { v$listRegister }, $CUE_TRANSFORMER->clean(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$listRegister
                """
            )
            bindRecognitionSession()
        }
    }
}
