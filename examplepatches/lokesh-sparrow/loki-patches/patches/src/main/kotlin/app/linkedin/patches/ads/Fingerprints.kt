package app.linkedin.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

private const val COLLECTION_TEMPLATE = "Lcom/linkedin/android/pegasus/gen/collection/CollectionTemplate;"

/**
 * The main feed's `ModelFilter` (MainFeedUpdatesConfigFactory.createSponsoredDuplicatesFilter).
 * It only drops duplicate ad campaigns before calling `copyWithNewElements(list)`.
 *
 * R8 merges this lambda into an unrelated class, so match on the ads counter metric
 * it increments instead of the defining class.
 */
object SponsoredDuplicatesFilterFingerprint : Fingerprint(
    name = "filter",
    returnType = COLLECTION_TEMPLATE,
    parameters = listOf(COLLECTION_TEMPLATE),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/linkedin/android/sensors/CounterMetric;",
            name = "ADS_ADS_CLIENT_UPDATES_FETCH_COUNT",
        ),
        methodCall(
            definingClass = COLLECTION_TEMPLATE,
            name = "copyWithNewElements",
        ),
    )
)