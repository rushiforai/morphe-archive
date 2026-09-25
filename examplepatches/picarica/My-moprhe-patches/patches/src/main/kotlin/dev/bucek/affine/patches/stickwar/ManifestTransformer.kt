package dev.bucek.affine.patches.stickwar

import dev.bucek.affine.patches.shared.Constants.STICK_WAR_PACKAGE_NAME
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

internal object ManifestTransformer {
    private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
    private const val PAIRIP_APPLICATION = "com.pairip.application.Application"
    private const val LICENSE_ACTIVITY = "com.pairip.licensecheck.LicenseActivity"
    private const val LICENSE_PERMISSION = "com.android.vending.CHECK_LICENSE"

    data class Result(
        val removedPermissions: Set<String>,
        val removedComponents: Set<String>,
    )

    fun transform(document: Document): Result {
        val manifest = document.documentElement
        require(manifest.tagName == "manifest") { "AndroidManifest.xml has no manifest root" }
        require(manifest.getAttribute("package") == STICK_WAR_PACKAGE_NAME) {
            "Unexpected package: ${manifest.getAttribute("package")}"
        }

        val application = document.getElementsByTagName("application").item(0) as? Element
            ?: error("AndroidManifest.xml has no application element")
        require(application.androidName() == PAIRIP_APPLICATION) {
            "Unexpected application class: ${application.androidName()}"
        }

        val removedPermissions = removeNamedChildren(
            manifest,
            setOf("uses-permission"),
            setOf(LICENSE_PERMISSION),
        )
        val removedComponents = removeNamedChildren(
            application,
            setOf("activity"),
            setOf(LICENSE_ACTIVITY),
        )

        check(removedPermissions == setOf(LICENSE_PERMISSION)) {
            "Expected Play licensing permission was not present; removed=$removedPermissions"
        }
        check(removedComponents == setOf(LICENSE_ACTIVITY)) {
            "Expected PairIP license activity was not present; removed=$removedComponents"
        }

        return Result(removedPermissions, removedComponents)
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
                check(removed.add(it.androidName())) { "Duplicate manifest declaration: ${it.androidName()}" }
                parent.removeChild(it)
            }
        return removed
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