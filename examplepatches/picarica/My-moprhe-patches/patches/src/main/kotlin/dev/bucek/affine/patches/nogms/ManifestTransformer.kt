package dev.bucek.affine.patches.nogms

import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

internal object ManifestTransformer {
    private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
    private const val EXPECTED_PAIRIP_APPLICATION = "com.pairip.application.Application"
    private const val AFFINE_APPLICATION = "app.affine.pro.AFFiNEApp"

    private val removablePermissions = setOf(
        "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        "com.google.android.gms.permission.AD_ID",
        "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
        "android.permission.ACCESS_ADSERVICES_AD_ID",
        "com.android.vending.CHECK_LICENSE",
    )

    private val removableComponents = setOf(
        "com.google.android.gms.measurement.AppMeasurementReceiver",
        "com.google.android.gms.measurement.AppMeasurementService",
        "com.google.android.gms.measurement.AppMeasurementJobService",
        "com.google.firebase.components.ComponentDiscoveryService",
        "com.google.firebase.sessions.SessionLifecycleService",
        "com.google.firebase.provider.FirebaseInitProvider",
        "com.google.android.gms.common.api.GoogleApiActivity",
        "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
        "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
        "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
        "com.pairip.licensecheck.LicenseActivity",
    )

    private val requiredMetadata = setOf(
        "com.google.android.gms.version",
    )

    // ApkMerger removes these before patches execute when the input is an XAPK.
    private val optionalBundleMetadata = setOf(
        "com.android.vending.splits.required",
        "com.android.stamp.source",
        "com.android.stamp.type",
        "com.android.vending.splits",
        "com.android.vending.derived.apk.id",
    )

    data class Result(
        val removedPermissions: Set<String>,
        val removedComponents: Set<String>,
        val removedMetadata: Set<String>,
    )

    fun transform(document: Document): Result {
        val manifest = document.documentElement
        require(manifest.tagName == "manifest") { "AndroidManifest.xml has no manifest root" }
        require(manifest.getAttribute("package") == "app.affine.pro") {
            "Unexpected package: ${manifest.getAttribute("package")}"
        }

        val application = document.getElementsByTagName("application").item(0) as? Element
            ?: error("AndroidManifest.xml has no application element")
        val currentApplication = application.androidName()
        require(currentApplication == EXPECTED_PAIRIP_APPLICATION) {
            "Unexpected application class: $currentApplication"
        }
        // Morphe's ARSCLib-backed DOM persists qualified Android attributes through
        // setAttribute(), while setAttributeNS() can leave the binary attribute unchanged.
        application.setAttribute("android:name", AFFINE_APPLICATION)
        check(application.androidName() == AFFINE_APPLICATION) {
            "Failed to restore AFFiNE application class"
        }

        val removedPermissions = removeNamedChildren(manifest, setOf("uses-permission"), removablePermissions)
        val removedComponents = removeNamedChildren(
            application,
            setOf("activity", "provider", "receiver", "service"),
            removableComponents,
        )
        val removedMetadata = removeNamedChildren(
            application,
            setOf("meta-data"),
            requiredMetadata + optionalBundleMetadata,
        )

        check(removedPermissions == removablePermissions) {
            "Expected permissions were not all present; removed=$removedPermissions"
        }
        check(removedComponents == removableComponents) {
            "Expected startup components were not all present; removed=$removedComponents"
        }
        check(removedMetadata.containsAll(requiredMetadata)) {
            "Required Google metadata was not present; removed=$removedMetadata"
        }

        check(document.findGoogleOrPairIpStartupNodes().isEmpty()) {
            "Google/Firebase/PairIP startup declarations remain: ${document.findGoogleOrPairIpStartupNodes()}"
        }

        return Result(removedPermissions, removedComponents, removedMetadata)
    }

    private fun removeNamedChildren(
        parent: Element,
        tags: Set<String>,
        names: Set<String>,
    ): Set<String> {
        val removed = mutableSetOf<String>()
        parent.childElements()
            .filter { it.tagName in tags && it.androidName() in names }
            .toList()
            .forEach {
                removed += it.androidName()
                parent.removeChild(it)
            }
        return removed
    }

    private fun Document.findGoogleOrPairIpStartupNodes(): List<String> {
        val application = getElementsByTagName("application").item(0) as Element
        return application.childElements()
            .filter { it.tagName in setOf("activity", "provider", "receiver", "service") }
            .map { it.androidName() }
            .filter {
                it.startsWith("com.google.android.gms.") ||
                    it.startsWith("com.google.firebase.") ||
                    it.startsWith("com.google.android.datatransport.") ||
                    it.startsWith("com.pairip.")
            }
            .toList()
    }

    private fun Element.androidName() =
        getAttributeNS(ANDROID_NAMESPACE, "name").ifEmpty { getAttribute("android:name") }

    private fun Node.childElements(): Sequence<Element> = sequence {
        var child = firstChild
        while (child != null) {
            if (child is Element) yield(child)
            child = child.nextSibling
        }
    }
}