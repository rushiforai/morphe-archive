package patches.bright

import app.morphe.patcher.patch.bytecodePatch

/**
 * Stops the UMP consent flow at startup and every audited reopen/retry path
 * before any native form request, load or show, while each Dart closure completes
 * through its genuine original continuation. Stores no consent or age
 * choice; the separate local age-gate decision is untouched. Includes
 * Disable tracking. The shared runtime also suppresses the traced Bright
 * Consentmanager web bootstrap on article pages, without changing consent state.
 */
@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips the advertising-consent flow at startup, on retry and when reopened, before native form or network activation, completing every callback through its original continuation. Also stops the inspected Consentmanager web popup on Bright article pages. Never records a consent or age choice; the local age gate keeps its own stored decision. Includes Disable tracking.",
) {
    dependsOn(originalInput, runtime, disableTracking, consentNative)
    compatibleWith(bright)
    execute { selectControl("consent") }
}
