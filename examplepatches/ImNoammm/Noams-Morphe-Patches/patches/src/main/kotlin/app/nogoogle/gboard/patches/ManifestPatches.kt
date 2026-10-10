package app.nogoogle.gboard.patches

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.File

private fun Document.elements(): List<Element> {
    val list = getElementsByTagName("*")
    return (0 until list.length).map { list.item(it) as Element }
}

private fun Element.androidAttr(name: String): String? =
    getAttributeNodeNS(ANDROID_NS, name)?.value ?: getAttribute("android:$name").ifEmpty { null }

private fun Element.setAndroidAttr(name: String, value: String) {
    if (getAttributeNodeNS(ANDROID_NS, name) != null) setAttributeNS(ANDROID_NS, "android:$name", value)
    else setAttribute("android:$name", value)
}

private fun Element.androidAttrs(): List<Attr> =
    (0 until attributes.length).map { attributes.item(it) as Attr }

private fun Node.remove() {
    parentNode?.removeChild(this)
}

private fun ResourcePatchContext.manifest(block: (Document) -> Unit) =
    document("AndroidManifest.xml").use(block)

/** Permissions that only exist to reach the network or Google services. */
private val REMOVED_PERMISSIONS = setOf(
    "android.permission.INTERNET",
    "android.permission.GET_ACCOUNTS",
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "com.google.android.apps.aicore.service.BIND_SERVICE",
    "com.google.android.setupwizard.READ_DEVICE_ORIGIN_FIRST_PARTY",
    "android.permission.PERSONAL_CONTEXT_HOST_INSIGHT_SURFACE",
    "android.permission.PERSONAL_CONTEXT_PUBLISH_HINTS",
    "android.permission.PERSONAL_CONTEXT_RECEIVE_INSIGHTS",
)

@Suppress("unused")
val removeNetworkAccessPatch = resourcePatch(
    name = "Remove network access",
    description = "Removes the INTERNET permission (plus account and Google-service " +
        "permissions). Without it the kernel refuses to create any network socket for the app, " +
        "so neither Gboard's Java code nor its native libraries can reach any server. " +
        "Language packs, GIFs, stickers, cloud voice typing and other online features stop " +
        "working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        manifest { doc ->
            doc.elements().filter { it.tagName == "uses-permission" || it.tagName == "uses-permission-sdk-23" }
                .filter { it.androidAttr("name") in REMOVED_PERMISSIONS }
                .forEach { it.remove() }
            val left = doc.elements().filter { it.tagName.startsWith("uses-permission") }
                .map { it.androidAttr("name") }
            if ("android.permission.INTERNET" in left) throw PatchException("INTERNET still present")
        }
    }
}

/** Manifest components that only Google apps talk to, or that expose Gboard to other apps. */
private val REMOVED_COMPONENTS = setOf(
    "com.google.android.libraries.appdoctor.AppDoctorReceiver",
    "com.google.android.libraries.inputmethod.accounts.checker.AccountsCapabilitiesChangedReceiver",
    "com.google.android.libraries.inputmethod.pixelbundle.PixelBundleBroadcastReceiver",
    "com.google.android.libraries.phenotype.client.stable.AccountRemovedBroadcastReceiver",
    "com.google.android.libraries.phenotype.client.stable.PhenotypeUpdateBackgroundBroadcastReceiver",
    "com.google.android.libraries.performance.primes.transmitter.LifeboatReceiver",
    "com.google.android.libraries.inputmethod.webdebugbridge.WebDebugBridgeContentProvider",
    "com.google.android.libraries.phenotype.registration.PhenotypeMetadataHolderService",
    "com.google.android.build.data.PropertiesServiceHolder",
    "android.net.http.MetaDataHolder",
    "com.google.android.apps.inputmethod.libs.trainingcache.examplestoreservice.ExampleStoreServiceMultiplexer",
    "com.google.android.apps.inputmethod.libs.trainingcache.replaycache.precomputedfeature.speech.examplestoreservice.SpeechPrecomputedFeatureExampleStoreService",
    "com.google.android.apps.inputmethod.libs.trainingcache.replaycache.sanitycheckeval.nwpp13n.examplestoreservice.NWPSanityCheckEvalExampleStoreService",
    "com.google.android.libraries.inputmethod.trainingcache.localcomputation.LocalComputationResultHandlingService",
    "com.google.android.libraries.inputmethod.trainingcache.trainer.dynamictrainer.FederatedResultHandlingService",
    "com.google.android.gms.learning.internal.training.InAppTrainingService",
)

private val COMPONENT_TAGS = setOf("activity", "activity-alias", "service", "receiver", "provider")

@Suppress("unused")
val removeGoogleComponentsPatch = resourcePatch(
    name = "Remove Google components",
    description = "Removes receivers and services that Play services, Phenotype or Pixel apps " +
        "call into, the federated-learning (Brella) training and example-store services, the " +
        "exported web debug bridge, Google package visibility <queries>, Google metadata, and " +
        "disables Android cloud backup (which uploads app data to Google Drive).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        manifest { doc ->
            val all = doc.elements()
            all.filter { it.tagName in COMPONENT_TAGS && it.androidAttr("name") in REMOVED_COMPONENTS }
                .forEach { it.remove() }
            // Google package visibility (keep intent-based queries such as other keyboards).
            all.filter { it.tagName == "package" && it.parentNode?.nodeName == "queries" }
                .filter { (it.androidAttr("name") ?: "").let { n -> n.startsWith("com.google.") || n == "com.android.vending" } }
                .forEach { it.remove() }
            // Google metadata on <application>.
            all.filter { it.tagName == "meta-data" && it.parentNode?.nodeName == "application" }
                .filter {
                    val n = it.androidAttr("name") ?: ""
                    n.startsWith("com.google.android.gms.phenotype") ||
                        n == "com.google.android.backup.api_key" ||
                        n.startsWith("com.google.android.partnersetup") ||
                        n.startsWith("com.android.stamp.")
                }
                .forEach { it.remove() }
            // No cloud backup of typing history / dictionaries.
            val application = all.single { it.tagName == "application" }
            application.setAndroidAttr("allowBackup", "false")
            listOf("backupAgent", "fullBackupContent", "dataExtractionRules", "backupInForeground")
                .forEach { a ->
                    application.getAttributeNodeNS(ANDROID_NS, a)?.let { application.removeAttributeNode(it) }
                    application.getAttributeNode("android:$a")?.let { application.removeAttributeNode(it) }
                }
        }
    }
}

private val COMPONENT_NAME_ATTRS = setOf("name", "targetActivity", "parentActivityName")

@Suppress("unused")
val packageRenamePatch = resourcePatch(
    name = "Package rename",
    description = "Renames the package so the patched keyboard installs alongside (instead of " +
        "over) the system Gboard, which keeps Google's signature. Also drops split-APK " +
        "requirements so a merged APK installs on its own.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val packageName = stringOption(
        key = "packageName",
        default = "app.nogoogle.inputmethod.latin",
        title = "Package name",
        description = "Package name of the patched keyboard.",
        required = true,
    ) { it != null && it.matches(Regex("[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+")) && it != GBOARD_PACKAGE }

    val appName = stringOption(
        key = "appName",
        default = "Gboard (no Google)",
        title = "App name",
        description = "Launcher / keyboard list name.",
        required = true,
    ) { !it.isNullOrBlank() }

    finalize {
        val newPackage = packageName.value!!
        manifest { doc ->
            val root = doc.documentElement
            if (root.getAttribute("package") != GBOARD_PACKAGE) {
                throw PatchException("Unexpected package ${root.getAttribute("package")}")
            }
            root.setAttribute("package", newPackage)
            fun renamed(value: String) = when {
                value == GBOARD_PACKAGE -> newPackage
                value.startsWith("$GBOARD_PACKAGE.") -> newPackage + value.removePrefix(GBOARD_PACKAGE)
                value.startsWith("deeplink.$GBOARD_PACKAGE") -> "deeplink.$newPackage" + value.removePrefix("deeplink.$GBOARD_PACKAGE")
                value.endsWith(":$GBOARD_PACKAGE") -> value.removeSuffix(GBOARD_PACKAGE) + newPackage
                else -> null
            }
            for (element in doc.elements()) {
                for (attr in element.androidAttrs()) {
                    val local = attr.localName ?: attr.name.substringAfter(':')
                    // Class names keep their original package.
                    if (local in COMPONENT_NAME_ATTRS && element.tagName != "permission" &&
                        element.tagName != "uses-permission" && element.tagName != "meta-data"
                    ) continue
                    renamed(attr.value)?.let { attr.value = it }
                }
            }
            // Merged (single) APK: drop split requirements.
            listOf("requiredSplitTypes", "splitTypes", "isSplitRequired").forEach { a ->
                root.getAttributeNodeNS(ANDROID_NS, a)?.let { root.removeAttributeNode(it) }
                doc.elements().single { it.tagName == "application" }.let { app ->
                    app.getAttributeNodeNS(ANDROID_NS, a)?.let { app.removeAttributeNode(it) }
                }
            }
            doc.elements().filter { it.tagName == "meta-data" }
                .filter { (it.androidAttr("name") ?: "").startsWith("com.android.vending.splits") }
                .forEach { it.remove() }
            val application = doc.elements().single { it.tagName == "application" }
            application.setAndroidAttr("label", appName.value!!)
        }

        // Preference / settings XML intents that target the app by package.
        val res = get("res", false)
        res.listFiles { f: File -> f.isDirectory && f.name.startsWith("xml") }?.forEach { dir ->
            dir.listFiles { f: File -> f.name.endsWith(".xml") }?.forEach { file ->
                if (!file.readText().contains(GBOARD_PACKAGE)) return@forEach
                document(file.relativeTo(res.parentFile).path).use { doc ->
                    for (element in doc.elements()) {
                        for (attr in element.androidAttrs()) {
                            val local = attr.localName ?: attr.name.substringAfter(':')
                            if ((local == "targetPackage" || local == "authorities") &&
                                (attr.value == GBOARD_PACKAGE || attr.value.startsWith("$GBOARD_PACKAGE."))
                            ) {
                                attr.value = newPackage + attr.value.removePrefix(GBOARD_PACKAGE)
                            }
                        }
                    }
                }
            }
        }
    }
}
