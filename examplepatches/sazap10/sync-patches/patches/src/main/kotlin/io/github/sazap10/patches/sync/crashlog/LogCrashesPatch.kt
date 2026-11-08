package io.github.sazap10.patches.sync.crashlog

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import io.github.sazap10.patches.sync.shared.SyncCompatibility

private const val CRASH_LOGGER = "Lio/github/sazap10/extension/sync/CrashLogger;"

internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/RedditApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

@Suppress("unused")
val logCrashesPatch = patch(
    name = "Log crashes",
    description = "Writes every crash to a text file in Download/SyncCrashes, so crashes can be reported without adb.",
    default = false,
) {
    compatibleWith(*SyncCompatibility.SyncForReddit)

    extendWith("extensions/sync.mpe")

    execute {
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $CRASH_LOGGER->install(Landroid/content/Context;)V",
        )
    }
}
