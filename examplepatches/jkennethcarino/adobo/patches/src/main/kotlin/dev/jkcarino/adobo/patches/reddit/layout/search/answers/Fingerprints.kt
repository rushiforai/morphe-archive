package dev.jkcarino.adobo.patches.reddit.layout.search.answers

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.string

private object SearchAnswersPreviewStreamingSectionFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("SearchAnswersPreviewStreamingSection(viewState=")
    )
)

private object SearchAnswersPreviewSectionFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("SearchAnswersPreviewSection(viewState=")
    )
)

internal object AnswersPreviewStreamingSectionFingerprint : Fingerprint(
    classFingerprint = SearchAnswersPreviewStreamingSectionFingerprint,
    returnType = "V",
    filters = listOf(
        literal(-0x5ccf1694)
    )
)

internal object AnswersPreviewSectionFingerprint : Fingerprint(
    classFingerprint = SearchAnswersPreviewSectionFingerprint,
    returnType = "V",
    filters = listOf(
        literal(-0xce97450)
    )
)
