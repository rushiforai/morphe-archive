package app.bin0culars.patches.reddit.layout.bottombar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.newInstance

object BottomBarStateChangeFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/bottomnav/BottomNavScreen;",
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(
        newInstance("Lcom/reddit/launch/bottomnav/BottomNavScreen\$onNavBarStateChange\$1;"),
    ),
)
