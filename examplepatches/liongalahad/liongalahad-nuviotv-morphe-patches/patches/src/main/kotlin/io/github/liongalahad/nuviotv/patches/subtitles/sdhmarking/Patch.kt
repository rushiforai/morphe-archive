package io.github.liongalahad.nuviotv.patches.subtitles.sdhmarking

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import io.github.liongalahad.nuviotv.patches.shared.updates.patchedAppUpdatesPatch
import org.w3c.dom.Element

private const val MARKER =
    "Lio/github/liongalahad/nuviotv/extension/subtitles/sdhmarking/SdhSubtitleMarker;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.mark_sdh_subtitles"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking.SdhMarkingSettingsCategory"

private val sdhMarkingResourcePatch = resourcePatch {
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
val sdhmarkingPatch = bytecodePatch(
    name = "Mark SDH Subtitles",
    description = "Marks explicitly labelled SDH tracks and detected English SDH subtitle files.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdatesPatch, settingsUiPatch, sdhMarkingResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            TrackInfoConstructorFingerprint,
            SubtitleOptionBuilderFingerprint
        ).forEach {
            it.matchAll(1..1)
        }
        val subtitleOptionContentMatches = SubtitleOptionContentFingerprint.matchAll(2..2)

        // Display-only name transformation for embedded Media3 and MPV track models.
        TrackInfoConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2, p2, p3, p4 }, $MARKER->markTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
            """
        )

        SubtitleOptionBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val languageNameCall = instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == SUBTITLE_COMPANION &&
                    reference.name == "languageCodeToName" &&
                    reference.returnType == "Ljava/lang/String;"
            }
            val titleRegister = (instructions[languageNameCall.index + 1] as? OneRegisterInstruction)?.registerA
                ?: error("Addon language title call no longer has an object result")
            val subtitleRegister = instructions
                .take(languageNameCall.index)
                .asReversed()
                .firstNotNullOfOrNull { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@firstNotNullOfOrNull null
                    if (reference.definingClass != SUBTITLE || reference.name != "getLang") {
                        return@firstNotNullOfOrNull null
                    }
                    (instruction as? FiveRegisterInstruction)?.registerC
                } ?: error("Addon language title call no longer exposes its Subtitle receiver")
            check(titleRegister <= 15 && subtitleRegister <= 15) {
                "Addon title registers cannot be encoded safely: title=v$titleRegister subtitle=v$subtitleRegister"
            }
            addInstructions(
                languageNameCall.index + 2,
                """
                    invoke-static { v$titleRegister, v$subtitleRegister }, $MARKER->markAddonTitle(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$titleRegister
                """
            )
        }

        // Each visible option content scope observes the refresh epoch. Its remembered
        // model and ID stay untouched, so focus and scroll position do not move.
        subtitleOptionContentMatches.forEach { match ->
            match.method.apply {
                val instructions = implementation!!.instructions
                val optionFieldGroups = instructions.withIndex().mapNotNull { (index, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                        ?: return@mapNotNull null
                    if (instruction.opcode != Opcode.IGET_OBJECT && instruction.opcode != Opcode.IGET_BOOLEAN) {
                        return@mapNotNull null
                    }
                    Triple(index, instruction, reference)
                }.distinctBy { "${it.third.definingClass}->${it.third.name}:${it.third.type}" }
                    .groupBy { it.third.definingClass }
                val optionFields = optionFieldGroups.values.single { fields ->
                    fields.map { it.third.type } == listOf(
                        "Z", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"
                    )
                }
                val titleAccess = optionFields[2]
                val titleRegister = (titleAccess.second as? TwoRegisterInstruction)?.registerA
                    ?: error("Subtitle option title field no longer has an object destination")
                check(titleRegister <= 15) {
                    "Subtitle option title register cannot be encoded safely: v$titleRegister"
                }

                addInstructions(
                    titleAccess.first + 1,
                    """
                        invoke-static { v$titleRegister }, $MARKER->markCurrentOptionTitle(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$titleRegister
                    """
                )
                addInstructions(
                    0,
                    "invoke-static/range { p0 .. p0 }, $MARKER->beginOptionRendering(Ljava/lang/Object;)V"
                )
            }
        }
    }
}
