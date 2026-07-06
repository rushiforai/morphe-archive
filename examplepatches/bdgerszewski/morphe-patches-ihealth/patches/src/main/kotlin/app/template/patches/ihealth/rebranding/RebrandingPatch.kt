package app.template.patches.ihealth.rebranding

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.COMPATIBILITY_IHEALTH
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.ihealthlabs.MyVitalsPro"
private const val NEW_PACKAGE = "com.ihealthlabs.MyVitalsMorphe"

// FirebaseInitProvider.onCreate() calls FirebaseApp.initializeApp() synchronously at startup.
// With a renamed package the Firebase backend returns 403, which causes the provider to fail
// and the app to black-screen. Short-circuiting onCreate() disables Firebase startup entirely.
private object FirebaseInitProviderFingerprint : Fingerprint(
    returnType = "Z",
    definingClass = "Lcom/google/firebase/provider/FirebaseInitProvider;",
    strings = listOf("FirebaseApp initialization unsuccessful"),
)

private val disableFirebaseInitPatch = bytecodePatch {
    execute {
        FirebaseInitProviderFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}

@Suppress("unused")
val rebrandingPatch = resourcePatch(
    name = "Rebrand app",
    description = "Changes the package name to allow installation alongside the original app " +
        "and renames the app to 'iHealth Morphe'. Disables Firebase initialization, which " +
        "would otherwise crash on startup when the new package name is not registered.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_IHEALTH)

    dependsOn(disableFirebaseInitPatch)

    execute {
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val node = strings.item(i) as? Element ?: continue
                if (node.getAttribute("name") == "app_name") {
                    node.textContent = "iHealth Morphe"
                    break
                }
            }
        }

        document("AndroidManifest.xml").use { doc ->
            fun replaceInNode(node: org.w3c.dom.Node) {
                if (node is Element) {
                    val attrs = node.attributes
                    for (i in 0 until attrs.length) {
                        val attr = attrs.item(i)
                        if (attr.nodeValue.contains(ORIGINAL_PACKAGE)) {
                            attr.nodeValue = attr.nodeValue.replace(ORIGINAL_PACKAGE, NEW_PACKAGE)
                        }
                    }
                }
                val children = node.childNodes
                for (i in 0 until children.length) {
                    replaceInNode(children.item(i))
                }
            }
            replaceInNode(doc.documentElement)
        }
    }
}
