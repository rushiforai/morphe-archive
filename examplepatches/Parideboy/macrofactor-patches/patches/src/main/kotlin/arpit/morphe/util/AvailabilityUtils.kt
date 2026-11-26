package arpit.morphe.util

import app.morphe.patcher.patch.AvailabilityResolver
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability

/**
 * Availability resolver for patches that are only viable when the patched build is
 * mounted over the genuine, Play-signed install by a root install method.
 *
 * Such patches break server-side attestation (Play Integrity / Firebase App Check)
 * on a re-signed sideload, so they must not be offered for standard installs.
 */
val requireRootMount = AvailabilityResolver { installerType, _ ->
    if (installerType == InstallerType.MOUNT) {
        PatchAvailability.ENABLED
    } else {
        PatchAvailability.UNAVAILABLE
    }
}
