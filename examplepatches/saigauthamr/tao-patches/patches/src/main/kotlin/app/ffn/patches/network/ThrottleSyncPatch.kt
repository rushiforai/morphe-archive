package app.ffn.patches.network

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.string
import app.morphe.patcher.patch.longOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/ffn/extension/SyncThrottle;"

/**
 * The pull of one sync job (s4.B.invokeSuspend in 66.5): bookmarks, folders, history, offline stories
 * and so on each pull their changes since a sync version through this coroutine.
 */
internal object SyncPullFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("PULL version is "),
        string("?syncversion="),
    ),
)

@Suppress("unused")
val throttleSyncPatch = patch(
    name = "Throttle sync",
    description = "Skips pulling synced bookmarks, folders, history and offline stories from the server " +
        "when the same sync already ran recently. Saves about six server requests on most app starts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    extendWith("extensions/extension.mpe")

    val intervalMinutes by longOption(
        key = "intervalMinutes",
        default = 15L,
        values = mapOf("5 minutes" to 5L, "15 minutes" to 15L, "60 minutes" to 60L),
        title = "Minimum time between syncs",
        description = "Minutes after a sync pull during which the same pull is skipped.",
        required = true,
    ) { it!! > 0 }

    execute {
        // The coroutine uses many registers, so p0 needs a range call.
        SyncPullFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->shouldSkip(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sync
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
                :sync
                nop
            """,
        )

        mutableClassDefBy(EXTENSION_CLASS).methods.first { it.name == "intervalMinutes" }.addInstructions(
            0,
            """
                const-wide v0, ${intervalMinutes!!}L
                return-wide v0
            """,
        )
    }
}
