/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/fixes/FixOldVersionsPatch.kt
 */
package app.morphe.patches.tumblr.fixes

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val fixOldVersionsPatch = bytecodePatch(
    name = "Fix old versions",
    description = "Fixes old versions of the app (v33.2 and earlier) breaking due to Tumblr removing remnants of Tumblr" +
        " Live from the API, which causes many requests to fail. This patch has no effect on newer versions of the app.",
    default = false,
) {
    compatibleWith(AppCompatibilities.TUMBLR)

    execute {
        val liveQueryParameters = listOf(
            ",?live_now",
            ",?live_streaming_user_id",
        )

        // Remove the live query parameters from the path when it's specified via a @METHOD annotation.
        val httpPathParserInsertIndex = HttpPathParserFingerprint.instructionMatches.last().index + 1
        for (liveQueryParameter in liveQueryParameters) {
            HttpPathParserFingerprint.method.addInstructions(
                httpPathParserInsertIndex,
                """
                    # urlPath = urlPath.replace(liveQueryParameter, "")
                    const-string p1, "$liveQueryParameter"
                    const-string p3, ""
                    invoke-virtual {p2, p1, p3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                    move-result-object p2
                """.trimIndent(),
            )
        }

        // Remove the live query parameters when passed via a parameter which has the @Query annotation.
        for (liveQueryParameter in liveQueryParameters) {
            AddQueryParamFingerprint.method.addInstructions(
                0,
                """
                    # queryParameterValue = queryParameterValue.replace(liveQueryParameter, "")
                    const-string v0, "$liveQueryParameter"
                    const-string v1, ""
                    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                    move-result-object p2
                """.trimIndent(),
            )
        }
    }
}

