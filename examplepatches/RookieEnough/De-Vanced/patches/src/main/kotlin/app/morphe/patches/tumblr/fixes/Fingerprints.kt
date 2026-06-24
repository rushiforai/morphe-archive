/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/fixes/Fingerprints.kt
 */
package app.morphe.patches.tumblr.fixes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.Opcode

// Fingerprint for the addQueryParam method from retrofit2
// https://github.com/square/retrofit/blob/trunk/retrofit/src/main/java/retrofit2/RequestBuilder.java#L186
// Injecting here allows modifying dynamically set query parameters
internal object AddQueryParamFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"),
    strings = listOf("Malformed URL. Base: ", ", Relative: "),
)

// Fingerprint for the parseHttpMethodAndPath method from retrofit2
// https://github.com/square/retrofit/blob/ebf87b10997e2136af4d335276fa950221852c64/retrofit/src/main/java/retrofit2/RequestFactory.java#L270-L302
// Injecting here allows modifying the path/query params of API endpoints defined via annotations
internal object HttpPathParserFingerprint : Fingerprint(
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.IPUT_OBJECT,
        Opcode.IPUT_BOOLEAN,
    ),
    strings = listOf("Only one HTTP method is allowed. Found: %s and %s."),
)

