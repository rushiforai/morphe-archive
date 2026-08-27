package io.github.liongalahad.nuviotv.patches.subtitles.sdh

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CUE_GROUP = "Landroidx/media3/common/text/CueGroup;"
private const val TEXT_OUTPUT = "Landroidx/media3/exoplayer/text/TextOutput;"
private const val CUE = "Landroidx/media3/common/text/Cue;"
private const val CUE_BUILDER = "Landroidx/media3/common/text/Cue\$Builder;"

/** Nuvio's central Media3 SDH cue-list filter. */
internal object NativeSdhFilterFingerprint : Fingerprint(
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        methodCall(
            definingClass = CUE,
            name = "buildUpon",
            returnType = CUE_BUILDER
        ),
        methodCall(
            definingClass = CUE_BUILDER,
            name = "setText",
            parameters = listOf("Ljava/lang/CharSequence;"),
            returnType = CUE_BUILDER
        ),
        methodCall(
            definingClass = CUE_BUILDER,
            name = "build",
            returnType = CUE
        )
    ),
    custom = { method, classDef ->
        method.returnType in listOf("Ljava/util/List;", "Ljava/util/ArrayList;") &&
            classDef.fields.count { field -> field.type == "Lkotlin/text/Regex;" } == 3 &&
            (method.implementation?.instructions ?: emptyList()).count { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@count false
                reference.definingClass == "Lkotlin/text/Regex;" &&
                    reference.name == "replace"
            } >= 3
    }
)

/** Nuvio's CueNormalizingTextOutput Media3 callback. */
internal object CueGroupOutputFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(CUE_GROUP),
    filters = listOf(
        methodCall(
            definingClass = CUE_GROUP,
            name = "<init>",
            parameters = listOf("Ljava/util/List;", "J")
        ),
        methodCall(
            definingClass = TEXT_OUTPUT,
            name = "onCues",
            parameters = listOf(CUE_GROUP),
            returnType = "V"
        )
    ),
    custom = { _, classDef -> TEXT_OUTPUT in classDef.interfaces }
)

internal object LegacyCueOutputFingerprint : Fingerprint(
    classFingerprint = CueGroupOutputFingerprint,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        methodCall(
            definingClass = TEXT_OUTPUT,
            name = "onCues",
            parameters = listOf("Ljava/util/List;"),
            returnType = "V"
        )
    )
)

/** 0.8.4's direct sidecar renderer, which bypasses Media3 TextOutput callbacks. */
internal object SidecarCueRenderFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, classDef ->
        val instructions = method.implementation?.instructions ?: emptyList()
        val calls = instructions.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        }
        method.name == "invoke" &&
            "Lkotlin/jvm/functions/Function1;" in classDef.interfaces &&
            classDef.fields.map { it.type }.sorted() == listOf(
                "I", "Ljava/lang/String;", "Ljava/util/List;"
            ).sorted() &&
            instructions.any { instruction ->
                (instruction as? WideLiteralInstruction)?.wideLiteral == 0x7f0a00d8L
            } &&
            calls.any { reference ->
                reference.definingClass == "Landroid/view/View;" &&
                    reference.name == "getTag" &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                    reference.returnType == "Ljava/lang/Object;"
            } &&
            calls.any { reference ->
                reference.definingClass == "Landroidx/media3/ui/SubtitleView;" &&
                    reference.name == "setCues" &&
                    reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/util/List;") &&
                    reference.returnType == "V"
            }
    }
)
