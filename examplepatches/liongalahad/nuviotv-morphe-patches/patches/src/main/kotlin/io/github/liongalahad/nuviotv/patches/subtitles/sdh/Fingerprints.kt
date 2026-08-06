package io.github.liongalahad.nuviotv.patches.subtitles.sdh

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

private const val CUE_GROUP = "Landroidx/media3/common/text/CueGroup;"
private const val TEXT_OUTPUT = "Landroidx/media3/exoplayer/text/TextOutput;"

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
