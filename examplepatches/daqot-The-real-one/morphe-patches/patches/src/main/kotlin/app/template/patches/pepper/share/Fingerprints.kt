package app.template.patches.pepper.share

import app.morphe.patcher.Fingerprint

/**
 * Threads are loaded from the REST API into these classes. Their names are kept,
 * because kotlinx.serialization needs them, so they can be matched by name.
 */
private const val API_REPRESENTATION_PACKAGE = "Lcom/pepper/network/apirepresentation/"

internal val threadApiRepresentationClasses = listOf(
    "${API_REPRESENTATION_PACKAGE}ThreadApiRepresentation;",
    "${API_REPRESENTATION_PACKAGE}ThreadFullApiRepresentation;",
)

/**
 * Link the app shares for a thread, such as https://www.pepper.nl/share-deal-from-app/1371572.
 * It redirects to an Adjust tracking link, which then redirects to the thread
 * with utm parameters added.
 */
internal class GetShareableLinkFingerprint(threadApiRepresentationClass: String) : Fingerprint(
    definingClass = threadApiRepresentationClass,
    name = "getShareableLink",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)
