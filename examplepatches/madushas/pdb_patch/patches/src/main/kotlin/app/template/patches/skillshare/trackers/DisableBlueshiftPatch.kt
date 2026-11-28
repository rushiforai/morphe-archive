package app.template.patches.skillshare.trackers

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.Constants.SKILLSHARE_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import app.template.patches.shared.returnVoid
import app.template.patches.shared.requireProgress

/**
 * Removes Skillshare's Blueshift engagement SDK (push campaigns + in-app inbox).
 *
 * Blueshift is initialised from `Skillshare.onCreate()` with a `Configuration` built for
 * the notification channel, then immediately told about each app open. It also owns 13
 * manifest components (AlarmReceiver, ScheduledPushReceiver, NetworkChangeListener,
 * RequestQueueJobService, BulkEventJobService, NotificationWorker and three activities).
 *
 * WHY THIS IS A SEPARATE, OFF-BY-DEFAULT PATCH: unlike Sentry/Singular, Blueshift is not
 * purely passive analytics — it drives rich-push display and the in-app message inbox, and
 * the app-side `BlueshiftManager` resyncs the FCM token so campaign targeting works.
 * Neutralising it stops campaign/engagement tracking but can also stop in-app messages and
 * inbox content from appearing. The default tracker pass
 * ([skillshareDisableTrackersPatch]) leaves this off so push keeps working.
 *
 * Every app-owned Blueshift entry point is neutralised, by name across overloads rather
 * than by pinned descriptor, because an uninitialised SDK must never be re-entered after
 * `initialize()` is gone:
 *
 *   initialize, trackAppOpen, identifyUserByDeviceId, trackNotificationClick,
 *   trackNotificationPageOpen            → return-void
 *   BlueshiftLinksHandler.handleBlueshiftUniversalLinks → false
 *
 * (Verified entry set from the 5.4.81 build: getInstance ×5 plus the six above — no other
 * `Lcom/blueshift/...` call site exists outside the SDK itself.)
 */
private const val BLUESHIFT = "Lcom/blueshift/Blueshift;"
private const val BLUESHIFT_LINKS = "Lcom/blueshift/BlueshiftLinksHandler;"

@Suppress("unused")
val skillshareDisableBlueshiftPatch = bytecodePatch(
    name = "Disable Blueshift engagement SDK",
    description = "No-ops Blueshift's SDK initialisation, identification and event " +
        "endpoints, so no campaign, push or in-app-message engagement data is sent. Off by " +
        "default: Blueshift also drives rich push and the in-app inbox, so enabling this " +
        "can stop in-app messages and inbox content from appearing.",
    default = false,
) {
    compatibleWith(SKILLSHARE_COMPATIBILITY)

    execute {
        // Fail closed on a missing class: a supported build must contain Blueshift.
        val blueshift = mutableClassDefByOrNull(BLUESHIFT)
            ?: throw PatchException(
                "Skillshare Disable Blueshift: $BLUESHIFT not found — re-audit (fail-closed).",
            )

        val voidEntries = setOf(
            "initialize",
            "trackAppOpen",
            "identifyUserByDeviceId",
            "trackNotificationClick",
            "trackNotificationPageOpen",
        )

        var matched = 0
        var noOped = 0
        for (m in blueshift.methods) {
            if (m.returnType == "V" && m.name in voidEntries) {
                matched++
                m.returnVoid()
                noOped++
            }
        }
        requireProgress(matched, noOped, "Blueshift void entry points")

        // Universal-link handling is a boolean gate — return false so the link is ignored
        // instead of the SDK being re-entered from a deep link. Both overloads are rewritten
        // explicitly (rather than via returnEarly) because the 3-arg overload has
        // `.locals 0`: the generated `const/4 v0` aliases the `this` parameter register, and
        // this method still dereferences p0 in its (now unreachable) body. Growing the frame
        // by one register first puts the constant in a fresh local instead — the same hazard
        // documented on `MutableMethod.clearBody()`.
        val links = mutableClassDefByOrNull(BLUESHIFT_LINKS)
        val linkMatched = links?.methods?.count { m ->
            val isGate = m.name == "handleBlueshiftUniversalLinks" && m.returnType == "Z"
            if (isGate) {
                // Grow the frame by exactly one register (a fresh local) so `const/4 v0`
                // lands in a local instead of aliasing a parameter register.
                m.ensureRegisters((m.implementation?.registerCount ?: 0) + 1)
                m.clearBody()
                m.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    return v0
                    """.trimIndent(),
                )
            }
            isGate
        } ?: 0
        requireProgress(1, linkMatched, "BlueshiftLinksHandler.handleBlueshiftUniversalLinks")
    }
}