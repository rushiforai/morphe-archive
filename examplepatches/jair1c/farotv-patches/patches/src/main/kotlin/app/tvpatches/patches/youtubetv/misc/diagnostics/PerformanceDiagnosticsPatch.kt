package app.tvpatches.patches.youtubetv.misc.diagnostics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.tvpatches.patches.youtubetv.misc.scripts.youTvScriptsPatch
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV

private object DiagnosticsEnabledFingerprint : Fingerprint(
    definingClass = "Lapp/tvpatches/extension/youtubetv/TvScripts;",
    name = "getDiagnosticsEnabled",
    returnType = "Z",
)

@Suppress("unused")
val performanceDiagnosticsPatch = bytecodePatch(
    name = "Performance diagnostics",
    description = "Logs aggregate script timings, resource durations and supported long tasks for troubleshooting. Disabled by default; does not log video URLs or response contents.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
    dependsOn(youTvScriptsPatch)
    execute { DiagnosticsEnabledFingerprint.method.returnEarly(true) }
}
