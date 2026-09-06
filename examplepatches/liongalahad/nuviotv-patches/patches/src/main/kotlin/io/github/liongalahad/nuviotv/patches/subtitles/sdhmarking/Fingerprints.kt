package io.github.liongalahad.nuviotv.patches.subtitles.sdhmarking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val SUBTITLE = "Lcom/nuvio/tv/domain/model/Subtitle;"
internal const val SUBTITLE_COMPANION = "Lcom/nuvio/tv/domain/model/Subtitle\$Companion;"

/** Nuvio's TrackInfo primary constructor, shared by embedded Media3 and MPV tracks. */
internal object TrackInfoConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
        "Ljava/lang/String;", "Ljava/lang/Integer;", "Z", "Z", "Ljava/lang/Integer;"
    ),
    strings = listOf("name")
)

/** Builds one addon option, shared by fetched and stream-provided subtitles in 0.9.0. */
internal object SubtitleOptionBuilderFingerprint : Fingerprint(
    parameters = listOf(
        "Ljava/lang/String;", "Ljava/lang/String;", SUBTITLE
    ),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;"),
        methodCall(
            definingClass = SUBTITLE_COMPANION,
            name = "languageCodeToName",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Ljava/lang/String;"
        ),
        methodCall(definingClass = SUBTITLE, name = "getAddonName", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getId", returnType = "Ljava/lang/String;")
    ),
    custom = { method, _ -> method.returnType.startsWith("L") && method.returnType != "Ljava/lang/String;" }
)

/** 0.8.4 Compose content lambda that reads one remembered subtitle option's visible title. */
internal object SubtitleOptionContentFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(type = "Z", opcode = Opcode.IGET_BOOLEAN),
        fieldAccess(type = "Ljava/lang/String;", opcode = Opcode.IGET_OBJECT),
        fieldAccess(type = "Ljava/lang/String;", opcode = Opcode.IGET_OBJECT),
        fieldAccess(type = "Ljava/lang/String;", opcode = Opcode.IGET_OBJECT)
    ),
    custom = { method, _ ->
        val optionFields = (method.implementation?.instructions ?: emptyList()).mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT || instruction.opcode == Opcode.IGET_BOOLEAN }
        }.distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
            .groupBy(FieldReference::getDefiningClass)

        optionFields.values.any { fields ->
            fields.map(FieldReference::getType) == listOf(
                "Z", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"
            )
        }
    }
)
