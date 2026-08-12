package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val YTM_MORPHE_PACKAGE_ERROR_STACK =
    "app.morphe.android.apps.youtube.music"

private val YTM_ERROR_STACK_COMPATIBILITY = Compatibility(
    name = "YT Music Morphe",
    packageName = YTM_MORPHE_PACKAGE_ERROR_STACK,
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(
            version = "9.15.51",
            isExperimental = true,
            description = "Temporary MediaBrowser error-stack diagnostic for YT Music Morphe 9.15.51."
        )
    )
)

/*
 * Diagnostic path #1.
 *
 * Llin.e(int) is one error publisher used by the MediaBrowser controller.
 * v2.3 instrumented only this method, but the reproduced Clock ERROR(7)
 * produced no Thread.dumpStack output. Therefore the observed Premium state
 * is being published through another path.
 */
private object PlaybackErrorPublisherFingerprint : Fingerprint(
    definingClass = "Llin;",
    name = "e",
    returnType = "V",
    parameters = listOf("I"),
)

/*
 * Diagnostic path #2.
 *
 * Static inspection of the exact installed v2.2 APK shows that Lkzf.f(int)
 * directly publishes a PlaybackStateCompat whose state is the integer passed
 * by the caller. Several callers load literal 7 immediately before invoking
 * it. This is therefore a second direct producer of PlaybackState ERROR(7),
 * independent from Llin.e(int).
 *
 * Instrumenting Lkzf.f(int) gives us the exact runtime caller without adding
 * an extension class or changing any functional branch.
 */
private object PlaybackStatePublisherFingerprint : Fingerprint(
    definingClass = "Lkzf;",
    name = "f",
    returnType = "V",
    parameters = listOf("I"),
)

@Suppress("unused")
val youtubeMusicErrorStackDiagnosticPatch = bytecodePatch(
    name = "Google Clock MediaBrowser error stack diagnostic",
    description = "Temporary diagnostic. Dumps the Java call stack from both known YT Music MediaBrowser error publishers (Llin.e and Lkzf.f) so the exact source of Clock's Premium ERROR(7) can be identified.",
    default = false,
) {
    compatibleWith(YTM_ERROR_STACK_COMPATIBILITY)

    dependsOn(youtubeMusicFullMediaBrowserPatch)

    execute {
        PlaybackErrorPublisherFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/lang/Thread;->dumpStack()V
            """,
        )

        PlaybackStatePublisherFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/lang/Thread;->dumpStack()V
            """,
        )
    }
}
