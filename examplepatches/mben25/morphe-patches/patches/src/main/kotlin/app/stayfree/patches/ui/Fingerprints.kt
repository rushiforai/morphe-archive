package app.stayfree.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess

private const val R_STRING = "Lcom/burockgames/R\$string;"

/**
 * Lambda (`Lds1;->g` in 20.16.1) that draws the "Select the app you want to pair your Android app
 * with:" Text, then a Spacer below it.
 */
object PairWithCodeSelectTextFingerprint : Fingerprint(
    filters = listOf(fieldAccess(definingClass = R_STRING, name = "select_platform_to_pair_device")),
)
