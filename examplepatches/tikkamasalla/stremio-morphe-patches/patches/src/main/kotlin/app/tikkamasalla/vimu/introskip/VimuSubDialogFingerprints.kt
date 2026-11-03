package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.Fingerprint

/** Builds the subtitle selection dialog in Vimu 12.00 (private A1): the row array gets the addon subtitle rows. */
object VimuSubDialogBuildFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "A1",
    parameters = emptyList(),
)

/** Handles a click on a row of the audio or subtitle dialog in Vimu 12.00: a subtitle row of ours is taken here. */
object VimuSubDialogClickFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment\$q;",
    name = "b",
    parameters = listOf(
        "Landroidx/leanback/widget/h0\$a;",
        "Ljava/lang/Object;",
        "Landroidx/leanback/widget/q0\$b;",
        "Landroidx/leanback/widget/n0;",
    ),
)
