package app.sledgesune.patches.waze.keepalive

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_WAZE
import app.sledgesune.patches.waze.shared.applyConfigOnSync

private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/waze/KeepAlivePatch;"

/** Extension stub whose body the patch replaces with the chosen number of minutes. */
private object MinutesStubFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "minutes",
    returnType = "I",
    parameters = listOf(),
)

@Suppress("unused")
val keepAlivePatch = patch(
    name = "Keep Waze alive",
    description = "Lets Waze stay open in the background longer before it closes itself " +
        "(Waze's \"background timeout\", normally set by Waze's servers).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    val minutes by intOption(
        key = "minutes",
        default = 60,
        values = mapOf(
            "30 minutes" to 30,
            "1 hour" to 60,
            "2 hours" to 120,
            "12 hours" to 720,
        ),
        title = "Time in the background",
        description = "How long Waze may stay in the background before it closes itself. " +
            "Longer uses more battery if you leave Waze open.",
        required = true,
    )

    execute {
        val value = (minutes ?: 60).coerceIn(1, 24 * 60)
        MinutesStubFingerprint.method.addInstructions(
            0,
            """
                const v0, $value
                return v0
            """,
        )
        applyConfigOnSync(EXTENSION_CLASS)
    }
}
