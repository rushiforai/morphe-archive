package io.github.liongalahad.nuviotv.patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

private const val SEGMENTED_MEDIA_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.storage.segmented.SegmentedMediaProvider"
private const val SEGMENTED_MEDIA_AUTHORITY = "com.nuvio.tv.morphe.segmented"

/** Registers the neutral seekable segmented-media provider once for any storage patch that uses it. */
fun registerSegmentedMediaProvider(document: Document, application: Element) {
    val present = (0 until application.getElementsByTagName("provider").length).any { index ->
        (application.getElementsByTagName("provider").item(index) as Element)
            .getAttribute("android:name") == SEGMENTED_MEDIA_PROVIDER
    }
    if (present) return
    application.appendChild(document.createElement("provider").apply {
        setAttribute("android:name", SEGMENTED_MEDIA_PROVIDER)
        setAttribute("android:authorities", SEGMENTED_MEDIA_AUTHORITY)
        setAttribute("android:exported", "false")
        setAttribute("android:grantUriPermissions", "false")
    })
}
