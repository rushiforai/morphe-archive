/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/cricbuzz/ads/Fingerprints.kt
 */
package app.morphe.patches.cricbuzz.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.Opcode

internal object UserStateSwitchFingerprint : Fingerprint(
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.SPARSE_SWITCH,
    ),
    strings = listOf(
        "key.user.state",
        "NA",
    ),
)

internal object Cb11ConstructorFingerprint : Fingerprint(
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
    ),
    definingClass = "CB11Details;",
)

internal object GetBottomBarFingerprint : Fingerprint(
    definingClass = "HomeMenu;",
    name = "getBottomBar",
)

