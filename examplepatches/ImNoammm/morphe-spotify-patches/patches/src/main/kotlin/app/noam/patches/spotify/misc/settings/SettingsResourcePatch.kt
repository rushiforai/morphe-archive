package app.noam.patches.spotify.misc.settings

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.noam.patches.spotify.shared.Constants
import org.w3c.dom.Element

internal val settingsResourcePatch = resourcePatch(
    description = "Adds the Morphe settings screen and its file provider to the app.",
    default = false,
) {
    execute {
        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement

            fun addString(name: String, value: String) {
                if (resources.getElementsByTagName("string").let { nodes ->
                        (0 until nodes.length).any {
                            (nodes.item(it) as Element).getAttribute("name") == name
                        }
                    }
                ) {
                    return
                }

                resources.appendChild(
                    document.createElement("string").apply {
                        setAttribute("name", name)
                        textContent = value
                    },
                )
            }

            addString("morphe_settings_title", "Morphe")
            addString(
                "morphe_settings_description",
                "Local files from a server and other settings added by Morphe patches",
            )
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")

            val androidNamespace = "http://schemas.android.com/apk/res/android"
            val packageName = manifest.getAttribute("package")
            if (packageName.isEmpty()) throw PatchException("The manifest has no package name")

            application.appendChild(
                document.createElement("activity").apply {
                    setAttributeNS(androidNamespace, "android:name", Constants.SETTINGS_ACTIVITY)
                    setAttributeNS(androidNamespace, "android:exported", "true")
                    setAttributeNS(androidNamespace, "android:label", "Morphe")
                    setAttributeNS(androidNamespace, "android:theme", "@android:style/Theme.Material")

                    appendChild(
                        document.createElement("intent-filter").apply {
                            appendChild(
                                document.createElement("action").apply {
                                    setAttributeNS(androidNamespace, "android:name", "android.intent.action.VIEW")
                                },
                            )
                            appendChild(
                                document.createElement("category").apply {
                                    setAttributeNS(androidNamespace, "android:name", "android.intent.category.DEFAULT")
                                },
                            )
                            appendChild(
                                document.createElement("category").apply {
                                    setAttributeNS(androidNamespace, "android:name", "android.intent.category.BROWSABLE")
                                },
                            )
                            appendChild(
                                document.createElement("data").apply {
                                    setAttributeNS(androidNamespace, "android:scheme", Constants.SETTINGS_SCHEME)
                                },
                            )
                        },
                    )
                },
            )

            application.appendChild(
                document.createElement("provider").apply {
                    setAttributeNS(androidNamespace, "android:name", Constants.FILE_PROVIDER)
                    setAttributeNS(androidNamespace, "android:authorities", "$packageName.morphe.localserver")
                    setAttributeNS(androidNamespace, "android:exported", "false")
                    setAttributeNS(androidNamespace, "android:grantUriPermissions", "true")
                },
            )
        }
    }
}
