/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/viber/ads/Fingerprints.kt
 */
package app.morphe.patches.viber.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.Opcode

internal object FindAdStringMethodFingerprint : Fingerprint(
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.NEW_INSTANCE,
        Opcode.CONST_STRING,
    ),
    strings = listOf("viber_plus_debug_ads_free_flag"),
)

