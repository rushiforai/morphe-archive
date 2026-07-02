/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/featureflags/Fingerprints.kt
 */
package app.morphe.patches.tumblr.featureflags

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// This fingerprint targets the method to get the value of a Feature in the class "com.tumblr.configuration.Feature".
// Features seem to be Tumblr's A/B testing program.
// Feature states are loaded from the server in the "api-http2.tumblr.com/v2/config" request on (first) startup.
// The startIndex of the opcode pattern is at the start of the function after the arg null check.
// We want to insert our instructions there.
internal object GetFeatureValueFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("L", "Z"),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.IF_EQZ,
        Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT,
    ),
    strings = listOf("feature"),
)

