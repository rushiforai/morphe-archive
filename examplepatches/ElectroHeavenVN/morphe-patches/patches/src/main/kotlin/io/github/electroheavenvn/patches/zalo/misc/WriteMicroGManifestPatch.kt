package io.github.electroheavenvn.patches.zalo.misc

import app.morphe.patcher.patch.resourcePatch
import io.github.electroheavenvn.patches.zalo.shared.Constants.COMPATIBILITY_ZALO
import io.github.electroheavenvn.patches.zalo.shared.Constants.ZINGTALK_CERT
import org.w3c.dom.Element

private val MICROG_PACKAGES = listOf(
    "app.revanced.android.gms",
    "app.reseam.android.gms",
    "com.mgoogle.android.gms",
)

val writeMicroGManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element
            val queries = (0 until manifest.childNodes.length).map { manifest.childNodes.item(it) }
                .filterIsInstance<Element>().firstOrNull { it.tagName == "queries" }
                ?: document.createElement("queries").also { manifest.appendChild(it) }

            MICROG_PACKAGES.forEach { pkg ->
                if ((0 until queries.childNodes.length).none {
                        val node = queries.childNodes.item(it) as? Element
                        node?.tagName == "package" && node.getAttribute("android:name") == pkg
                    }) {
                    queries.appendChild(document.createElement("package").apply {
                        setAttribute("android:name", pkg)
                    })
                }
            }

            val metadata = MICROG_PACKAGES.flatMap { pkg ->
                listOf(
                    "$pkg.SPOOFED_PACKAGE_NAME" to "com.zing.zalo",
                    "$pkg.SPOOFED_PACKAGE_SIGNATURE" to ZINGTALK_CERT,
                )
            }.toMap()

            metadata.forEach { (name, value) ->
                val entries = (0 until application.childNodes.length).map { application.childNodes.item(it) }
                    .filterIsInstance<Element>().filter {
                        it.tagName == "meta-data" && it.getAttribute("android:name") == name
                    }
                check(entries.size <= 1 && (entries.isEmpty() || entries.single().getAttribute("android:value") == value)) {
                    "Conflicting microG identity metadata: $name"
                }
                if (entries.isEmpty()) application.appendChild(document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                })
            }
        }
    }
}
