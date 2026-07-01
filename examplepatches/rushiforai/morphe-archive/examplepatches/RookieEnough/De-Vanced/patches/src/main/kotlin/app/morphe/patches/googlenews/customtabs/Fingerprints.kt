/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlenews/customtabs/Fingerprints.kt
 */
package app.morphe.patches.googlenews.customtabs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object LaunchCustomTabFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.IPUT_OBJECT,
        Opcode.CONST_4,
        Opcode.IPUT,
        Opcode.CONST_4,
        Opcode.IPUT_BOOLEAN,
    ),
    custom = { _, classDef -> classDef.endsWith("CustomTabsArticleLauncher;") },
)