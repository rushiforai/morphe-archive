package app.bin0culars.patches.reddit.layout.videospeed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

object VideoPlaybackSpeedParserFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/reddit/features/VideoPlaybackSpeedVariant;", name = "getEntries"),
        methodCall(definingClass = "Lcom/reddit/features/VideoPlaybackSpeedVariant;", name = "getVariant"),
        methodCall(definingClass = "Lkotlin/jvm/internal/Intrinsics;", name = "areEqual"),
    ),
)
