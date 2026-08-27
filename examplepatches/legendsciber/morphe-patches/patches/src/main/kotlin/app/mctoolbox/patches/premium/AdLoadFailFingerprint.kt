package app.mctoolbox.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * r2$b.b()V — ad source load failure handler.
 * Logs "Failed to load ad from <source>" and retries with the next source.
 * When all sources are exhausted, the original callback returns a timeout.
 * Body is replaced: on failure, premium is written directly via S()
 * and the dialog is dismissed.
 */
object AdLoadFailFingerprint : Fingerprint(
    definingClass = "Lr2\$b;",
    name = "b",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("Failed to load ad from ")
    )
)
