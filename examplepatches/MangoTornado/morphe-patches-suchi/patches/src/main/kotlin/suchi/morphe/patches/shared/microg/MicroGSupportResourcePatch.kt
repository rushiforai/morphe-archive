package suchi.morphe.patches.shared.microg

import app.morphe.patcher.apk.ApkSignatureScheme
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.security.MessageDigest

internal val microGSupportResourcePatch = resourcePatch {
    execute {
        val certificates = packageMetadata.signingCertificates.entries
            .filter { it.value.isNotEmpty() }
            .maxByOrNull {
                when (it.key) {
                    ApkSignatureScheme.V31 -> 3
                    ApkSignatureScheme.V3 -> 2
                    ApkSignatureScheme.V2 -> 1
                    else -> 0
                }
            }?.value
        val certificate = certificates?.singleOrNull()
            ?: throw PatchException("MicroG integration requires an original APK with one signer certificate.")
        val signature = MessageDigest.getInstance("SHA-1").digest(certificate.encoded)
            .joinToString("") { "%02x".format(it) }

        document("AndroidManifest.xml").use { document ->
            val elements = document.getElementsByTagName("*")
            for (index in 0 until elements.length) {
                val element = elements.item(index) as Element
                for (attribute in listOf("android:name", "android:permission")) {
                    microGManifestReplacement(element.getAttribute(attribute))?.let {
                        element.setAttribute(attribute, it)
                    }
                }
            }

            val queries = document.getElementsByTagName("queries").item(0)
                ?: document.createElement("queries").also { document.documentElement.appendChild(it) }
            val queriedPackages = queries.childNodes
            val hasMicroGQuery = (0 until queriedPackages.length).any {
                val node = queriedPackages.item(it)
                node is Element && node.tagName == "package" &&
                    node.getAttribute("android:name") == MICROG_PACKAGE
            }
            if (!hasMicroGQuery) {
                queries.appendChild(document.createElement("package").apply {
                    setAttribute("android:name", MICROG_PACKAGE)
                })
            }

            val application = document.getElementsByTagName("application").item(0)
                ?: throw PatchException("Application declaration is missing.")
            for ((name, value) in mapOf(
                "$MICROG_PACKAGE.SPOOFED_PACKAGE_NAME" to packageMetadata.packageName,
                "$MICROG_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to signature,
            )) {
                val children = application.childNodes
                val existing = (0 until children.length).map { children.item(it) }
                    .filterIsInstance<Element>()
                    .firstOrNull { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                val metadata = existing ?: document.createElement("meta-data").also {
                    application.appendChild(it)
                }
                metadata.setAttribute("android:name", name)
                metadata.setAttribute("android:value", value)
            }
        }
    }
}
