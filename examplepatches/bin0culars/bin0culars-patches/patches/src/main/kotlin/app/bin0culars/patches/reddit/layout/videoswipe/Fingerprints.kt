package app.bin0culars.patches.reddit.layout.videoswipe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess

object VideoPlayerFlagsConstructorFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("android_fbp_m1_vertical_chaining"),
)

object ChainingModeChoiceFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/fullbleedplayer/ui/FullBleedViewModel;",
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/reddit/fullbleedplayer/ui/ChainingMode;",
            name = "Vertical",
        ),
    ),
)
