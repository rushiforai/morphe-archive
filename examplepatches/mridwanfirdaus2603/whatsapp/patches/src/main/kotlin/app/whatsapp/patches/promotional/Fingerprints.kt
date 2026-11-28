package app.whatsapp.patches.promotional

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * Fingerprints for identifying promotional and advertising-related UI components in WhatsApp.
 */

/**
 * Matches WhatsApp's WAMO / ad-verification method containing "is_wfal_paused".
 */
object AdVerifyFingerprint : Fingerprint(
    filters = listOf(
        string("is_wfal_paused", StringComparisonType.CONTAINS),
    )
)
