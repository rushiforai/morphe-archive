package dev.brave.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val URL_STRIPPER = "Ldev/brave/extension/privacy/UrlStripper;"

internal object ClipboardSetTextFingerprint : Fingerprint(
    definingClass = "Ld14;",
    name = "setText",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object GenericSendIntentFingerprint : Fingerprint(
    definingClass = "Lcye;",
    name = "e",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)

internal object ShareSheetDispatchFingerprint : Fingerprint(
    definingClass = "Ljn2;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lbih;", "Lzu3;", "I")
)

@Suppress("unused")
val stripTrackingParamsPatch = patch(
    name = "Strip Tracking Parameters",
    description = "Removes marketing, analytics, and advertising tracking parameters from copied and shared URLs."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    extendWith("extensions/brave.mpe")

    execute {
        // 1. Hook d14->setText(String) at entry (index 0) so p1 is sanitized before any ClipData construction
        ClipboardSetTextFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static {p1}, $URL_STRIPPER->sanitize(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p1
                """.trimIndent()
            )
        }

        // 2. Hook cye->e(Context, String) at entry (index 0) so p1 is sanitized before putExtra
        GenericSendIntentFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static {p1}, $URL_STRIPPER->sanitize(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p1
                """.trimIndent()
            )
        }

        // 3. Hook jn2->d(bih, zu3, I) at entry (index 0) to safely sanitize ShareParams URL field via reflection
        ShareSheetDispatchFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static {p1}, $URL_STRIPPER->sanitizeShareObject(Ljava/lang/Object;)V
                """.trimIndent()
            )
        }
    }
}
