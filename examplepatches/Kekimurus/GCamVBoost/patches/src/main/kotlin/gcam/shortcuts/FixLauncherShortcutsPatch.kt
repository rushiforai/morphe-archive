package gcam.shortcuts

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

@Suppress("unused")
val fixLauncherShortcutsPatch = resourcePatch(
    name = "Fix launcher app shortcuts",
    description = "Updates static launcher shortcuts (Take a selfie, Take a video) in shortcuts.xml so they target the modified package instead of throwing 'App isn't installed'.",
    default = true
) {
    compatibleWith(
        "com.google.android.GoogleCameraEng",
        "com.google.android.GoogleCamera"
    )

    val targetPackageName by stringOption(
        key = "targetPackageName",
        default = null,
        title = "Target package name",
        description = "The package name that launcher shortcut intents should open. " +
                "Leave empty to use the app's own package name (recommended)."
    )

    execute {
        var resolvedTargetPackage = targetPackageName?.trim().orEmpty()
        val shortcutXmlNames = mutableSetOf("shortcuts.xml")

        // 1. Read the app's package name and any custom @xml/ shortcut resource from AndroidManifest.xml.
        //    If "Clone Google Camera" already ran, this is the new package name.
        document("AndroidManifest.xml").use { manifestDoc ->
            val manifestElement = manifestDoc.documentElement
            if (resolvedTargetPackage.isEmpty()) {
                resolvedTargetPackage = manifestElement.getAttribute("package")
            }

            val metaDataNodes = manifestDoc.getElementsByTagName("meta-data")
            for (i in 0 until metaDataNodes.length) {
                val metaElement = metaDataNodes.item(i) as? Element ?: continue
                val metaName = metaElement.getAttribute("android:name")
                if (metaName == "android.app.shortcuts") {
                    val resourceRef = metaElement.getAttribute("android:resource") // e.g., "@xml/shortcuts"
                    if (resourceRef.startsWith("@xml/")) {
                        val xmlBaseName = resourceRef.removePrefix("@xml/") + ".xml"
                        shortcutXmlNames.add(xmlBaseName)
                    }
                }
            }
        }

        // 2. Scan all `res/xml*` directories (res/xml, res/xml-v25, res/xml-v26, etc.) for matching shortcut files
        val resDirectory = get("res")
        if (!resDirectory.exists() || !resDirectory.isDirectory) {
            throw PatchException("Decoded res/ directory not found. Ensure resource decoding is enabled.")
        }

        val candidateXmlFiles = resDirectory.listFiles { file ->
            file.isDirectory && file.name.startsWith("xml")
        }?.flatMap { xmlDir ->
            xmlDir.listFiles { xmlFile ->
                xmlFile.isFile && shortcutXmlNames.contains(xmlFile.name)
            }?.toList() ?: emptyList()
        } ?: emptyList()

        if (candidateXmlFiles.isEmpty()) {
            throw PatchException("Could not find shortcuts XML (${shortcutXmlNames.joinToString()}) in any res/xml* directory.")
        }

        // 3. Rewrite android:targetPackage in all discovered shortcut XML files
        var intentCount = 0

        candidateXmlFiles.forEach { xmlFile ->
            val relativePath = "res/${xmlFile.parentFile.name}/${xmlFile.name}"

            document(relativePath).use { xmlDoc ->
                val intentNodes = xmlDoc.getElementsByTagName("intent")
                for (i in 0 until intentNodes.length) {
                    val intentElement = intentNodes.item(i) as? Element ?: continue
                    intentCount++

                    if (intentElement.getAttribute("android:targetPackage") != resolvedTargetPackage) {
                        intentElement.setAttribute("android:targetPackage", resolvedTargetPackage)
                    }
                }
            }
        }

        if (intentCount == 0) {
            throw PatchException("Located shortcut XML files (${candidateXmlFiles.map { it.path }}), but found no <intent> tags to update.")
        }
    }
}