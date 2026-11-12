package app.tvpatches.patches.youtubetv.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * UNTESTED starting points found with jadx in YouTube for Android TV 7.32.300.
 * Log strings in the Cobalt shell are not obfuscated, so they make stable anchors.
 */

/**
 * Shell method that registers the Java <-> JavaScript bridge and then loads the
 * startup URL (https://www.youtube.com/tv). Candidate place to register an extra
 * JS interface or to change the startup URL.
 * (dev/cobalt/shell/Shell.java in jadx output)
 */
internal object InitializeJavaBridgeFingerprint : Fingerprint(
    definingClass = "Ldev/cobalt/shell/Shell;",
    filters = listOf(
        string("initializeJavaBridge"),
        string("shellManager load url:"),
    )
)

/**
 * CobaltActivity code that reads the "--url=" startup argument and warns on
 * non-YouTube URLs. Candidate place to append URL parameters.
 */
internal object StartupUrlFingerprint : Fingerprint(
    definingClass = COBALT_ACTIVITY_CLASS,
    filters = listOf(
        string("Non-Youtube startup URL detected."),
    )
)

private const val COBALT_ACTIVITY_CLASS = "Ldev/cobalt/coat/CobaltActivity;"
