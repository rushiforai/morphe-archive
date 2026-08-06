package dev.alastorkaneki.morphe.patches.chrome

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import dev.alastorkaneki.morphe.patches.chrome.Constants.CHROME
import org.w3c.dom.Element
import java.util.Locale

private const val ORIGINAL_PACKAGE = "com.android.chrome"
private const val INIT_PROVIDER =
    "dev.alastorkaneki.morphe.extension.chromeuserscripts.ChromeUserscriptInitProvider"
private const val MANAGER_ACTIVITY =
    "dev.alastorkaneki.morphe.extension.chromeuserscripts.UserscriptManagerActivity"
private const val EDITOR_ACTIVITY =
    "dev.alastorkaneki.morphe.extension.chromeuserscripts.UserscriptEditorActivity"
private const val INSTALL_ACTIVITY =
    "dev.alastorkaneki.morphe.extension.chromeuserscripts.UserscriptInstallActivity"
private const val PROVIDER_AUTHORITY =
    "com.android.chrome.dev.alastorkaneki.monkeyscript.init"

private val componentTags = setOf(
    "application",
    "activity",
    "activity-alias",
    "service",
    "receiver",
    "provider",
    "instrumentation"
)

private val packageScopedAttributes = listOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
    "android:process",
    "android:taskAffinity",
    "android:targetPackage"
)

private val extraComponentAttributes = listOf(
    "android:backupAgent",
    "android:appComponentFactory",
    "android:manageSpaceActivity",
    "android:parentActivityName",
    "android:targetActivity",
    "android:zygotePreloadName"
)

private fun isResourceReference(value: String): Boolean =
    value.startsWith('@') || value.startsWith('?')

private fun qualifyComponentName(name: String, originalPackage: String): String = when {
    name.isBlank() || isResourceReference(name) -> name
    name.startsWith('.') -> originalPackage + name
    '.' !in name -> "$originalPackage.$name"
    else -> name
}

private fun rewritePackageScopedValue(value: String, replacementPackage: String): String = when {
    value == ORIGINAL_PACKAGE -> replacementPackage
    value.startsWith("$ORIGINAL_PACKAGE.") ->
        replacementPackage + value.removePrefix(ORIGINAL_PACKAGE)
    value == "\${applicationId}" -> replacementPackage
    value.startsWith("\${applicationId}.") ->
        replacementPackage + value.removePrefix("\${applicationId}")
    else -> value
}

private fun rewriteAuthority(value: String, replacementPackage: String): String {
    val authority = value.trim()
    if (authority.isEmpty() || isResourceReference(authority)) return authority
    return when {
        authority == ORIGINAL_PACKAGE || authority.startsWith("$ORIGINAL_PACKAGE.") ->
            replacementPackage + authority.removePrefix(ORIGINAL_PACKAGE)
        authority.contains("\${applicationId}") ->
            authority.replace("\${applicationId}", replacementPackage)
        authority == replacementPackage || authority.startsWith("$replacementPackage.") ->
            authority
        else -> "$replacementPackage.$authority"
    }
}

private fun hasLauncherIntent(element: Element): Boolean {
    val filters = element.getElementsByTagName("intent-filter")
    for (filterIndex in 0 until filters.length) {
        val filter = filters.item(filterIndex) as Element
        val actions = filter.getElementsByTagName("action")
        val categories = filter.getElementsByTagName("category")
        val hasMain = (0 until actions.length).any {
            (actions.item(it) as Element).getAttribute("android:name") ==
                "android.intent.action.MAIN"
        }
        val hasLauncher = (0 until categories.length).any {
            (categories.item(it) as Element).getAttribute("android:name") ==
                "android.intent.category.LAUNCHER"
        }
        if (hasMain && hasLauncher) return true
    }
    return false
}

private fun findActivity(application: Element, requestedName: String): Element? {
    if (requestedName.isBlank() || isResourceReference(requestedName)) return null
    val qualified = qualifyComponentName(requestedName, ORIGINAL_PACKAGE)
    val activities = application.getElementsByTagName("activity")
    for (index in 0 until activities.length) {
        val candidate = activities.item(index) as Element
        val candidateName = qualifyComponentName(
            candidate.getAttribute("android:name"),
            ORIGINAL_PACKAGE
        )
        if (candidateName == qualified) return candidate
    }
    return null
}

private fun resolveChromeTheme(application: Element): String {
    val applicationTheme = application.getAttribute("android:theme")

    // Chrome commonly exposes its launcher through an activity-alias. Follow targetActivity to
    // the real ChromeTabbedActivity instead of falling back to Android's generic Material theme.
    listOf("activity", "activity-alias").forEach { tag ->
        val nodes = application.getElementsByTagName(tag)
        for (index in 0 until nodes.length) {
            val launcher = nodes.item(index) as Element
            if (!hasLauncherIntent(launcher)) continue

            launcher.getAttribute("android:theme")
                .takeIf(String::isNotBlank)
                ?.let { return it }

            val targetName = launcher.getAttribute("android:targetActivity")
            val target = findActivity(application, targetName)
            target?.getAttribute("android:theme")
                ?.takeIf(String::isNotBlank)
                ?.let { return it }
        }
    }

    // Exact fallback for Chrome packages whose launcher alias is heavily transformed.
    val activities = application.getElementsByTagName("activity")
    for (index in 0 until activities.length) {
        val activity = activities.item(index) as Element
        val name = activity.getAttribute("android:name")
        if (!name.endsWith("ChromeTabbedActivity") &&
            !name.endsWith("ChromeTabbedActivity2")) continue
        activity.getAttribute("android:theme")
            .takeIf(String::isNotBlank)
            ?.let { return it }
    }

    return applicationTheme.takeIf(String::isNotBlank)
        ?: "@android:style/Theme.Material.NoActionBar"
}

@Suppress("unused")
internal val addChromeUserscriptManifestPatch = resourcePatch(
    description =
        "Registers the process-aware Chrome Material You userscript manager and patch-time Chrome cloning options."
) {
    compatibleWith(CHROME)

    val customAppName by stringOption(
        key = "chromeMonkeyScriptAppName",
        default = "Chrome MonkeyScript",
        title = "App name",
        description = "Launcher and Android system name for the patched Chrome build.",
        required = true
    ) {
        !it.isNullOrBlank() && it.trim().length <= 80
    }

    val customPackageName by stringOption(
        key = "chromeMonkeyScriptPackageName",
        default = "com.android.chrome.morphe",
        title = "Package name",
        description =
            "Android package ID for side-by-side installation. It must differ from com.android.chrome.",
        required = true
    ) {
        !it.isNullOrBlank() &&
            it != ORIGINAL_PACKAGE &&
            it.matches(Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$"))
    }

    execute {
        val appName = requireNotNull(customAppName).trim()

        document("AndroidManifest.xml").use { document ->
            val application =
                document.getElementsByTagName("application").item(0) as Element

            val chromeTheme = resolveChromeTheme(application)
            application.setAttribute("android:label", appName)

            listOf("activity", "activity-alias").forEach { tag ->
                val nodes = application.getElementsByTagName(tag)
                for (index in 0 until nodes.length) {
                    val element = nodes.item(index) as Element
                    if (hasLauncherIntent(element)) {
                        element.setAttribute("android:label", appName)
                    }
                }
            }

            // Chrome activities may run outside the application's default process. A provider
            // registered only in the default process cannot observe those activities, which makes
            // the patch appear completely absent. Install one initializer in every process that
            // hosts an Activity, plus the default process used by the injected manager screens.
            val applicationProcess = application.getAttribute("android:process")
            val activityProcesses = linkedSetOf(applicationProcess)
            val activityNodes = application.getElementsByTagName("activity")
            for (index in 0 until activityNodes.length) {
                val activity = activityNodes.item(index) as Element
                activityProcesses += activity.getAttribute("android:process")
                    .ifBlank { applicationProcess }
            }

            val providers = application.getElementsByTagName("provider")
            val oldInitializers = (0 until providers.length)
                .map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") == INIT_PROVIDER }
            oldInitializers.forEach(application::removeChild)

            activityProcesses.forEachIndexed { index, process ->
                application.appendChild(document.createElement("provider").apply {
                    setAttribute("android:name", INIT_PROVIDER)
                    setAttribute("android:authorities", "$PROVIDER_AUTHORITY.$index")
                    setAttribute("android:exported", "false")
                    setAttribute("android:initOrder", "1999999996")
                    if (process.isNotBlank()) setAttribute("android:process", process)
                })
            }

            val activities = application.getElementsByTagName("activity")
            val existingNames = (0 until activities.length)
                .map { (activities.item(it) as Element).getAttribute("android:name") }
                .toSet()

            fun addActivity(name: String, label: String, exported: Boolean = false) {
                if (name in existingNames) return
                application.appendChild(document.createElement("activity").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:exported", exported.toString())
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:label", label)
                    setAttribute("android:theme", chromeTheme)
                    setAttribute("android:windowSoftInputMode", "adjustResize")
                    if (name == MANAGER_ACTIVITY) {
                        setAttribute("android:launchMode", "singleTask")
                    }
                })
            }

            addActivity(MANAGER_ACTIVITY, "Userscripts", exported = true)
            addActivity(EDITOR_ACTIVITY, "Userscript editor")
            addActivity(INSTALL_ACTIVITY, "Install userscript")
        }

        // Chrome 150 renders its app menu from a Chromium ModelList rather than android.view.Menu.
        // The injected extension targets only the exact app_menu_list view at runtime and rejects
        // the separate context_menu_list_view hierarchy.
    }

    finalize {
        val replacementPackage = requireNotNull(customPackageName)
            .trim()
            .lowercase(Locale.US)
        val authorityStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val allElements = document.getElementsByTagName("*")

            listOf(
                "android:sharedUserId",
                "android:sharedUserLabel",
                "android:sharedUserMaxSdkVersion"
            ).forEach(manifest::removeAttribute)

            for (index in 0 until allElements.length) {
                val element = allElements.item(index) as Element

                if (element.tagName in componentTags &&
                    element.hasAttribute("android:name")) {
                    val name = element.getAttribute("android:name")
                    if (name.isNotBlank()) {
                        element.setAttribute(
                            "android:name",
                            qualifyComponentName(name, ORIGINAL_PACKAGE)
                        )
                    }
                }

                extraComponentAttributes.forEach { attribute ->
                    if (!element.hasAttribute(attribute)) return@forEach
                    val name = element.getAttribute(attribute)
                    if (name.isNotBlank()) {
                        element.setAttribute(
                            attribute,
                            qualifyComponentName(name, ORIGINAL_PACKAGE)
                        )
                    }
                }

                packageScopedAttributes.forEach { attribute ->
                    if (!element.hasAttribute(attribute)) return@forEach
                    val value = element.getAttribute(attribute)
                    element.setAttribute(
                        attribute,
                        rewritePackageScopedValue(value, replacementPackage)
                    )
                }

                if (element.tagName in setOf(
                        "permission",
                        "permission-group",
                        "permission-tree",
                        "uses-permission",
                        "uses-permission-sdk-23"
                    ) && element.hasAttribute("android:name")) {
                    val value = element.getAttribute("android:name")
                    element.setAttribute(
                        "android:name",
                        rewritePackageScopedValue(value, replacementPackage)
                    )
                }

                if (element.hasAttribute("android:authorities")) {
                    val rewritten = element.getAttribute("android:authorities")
                        .split(';')
                        .map { authority ->
                            if (authority.startsWith("@string/")) {
                                authorityStringResources += authority.removePrefix("@string/")
                            }
                            rewriteAuthority(authority, replacementPackage)
                        }
                    element.setAttribute("android:authorities", rewritten.joinToString(";"))
                }
            }

            manifest.setAttribute("package", replacementPackage)
        }

        if (authorityStringResources.isNotEmpty()) {
            runCatching {
                document("res/values/strings.xml").use { document ->
                    val children = document.documentElement.childNodes
                    for (index in 0 until children.length) {
                        val element = children.item(index) as? Element ?: continue
                        if (element.getAttribute("name") !in authorityStringResources) continue
                        element.textContent = rewriteAuthority(
                            element.textContent,
                            replacementPackage
                        )
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val chromeUserscriptManagerPatch = bytecodePatch(
    name = "MonkeyScript userscript manager",
    description =
        "Adds an exact Chrome 150 Material You userscript manager using a Violentmonkey-derived parser and installer, app_menu_list integration, Greasy Fork/Sleazy Fork support, publishing, and configurable app/package cloning.",
    default = true
) {
    compatibleWith(CHROME)
    dependsOn(addChromeUserscriptManifestPatch)
    extendWith("extensions/extension.mpe")

    // Chrome Android does not expose the desktop WebExtension runtime. The injected extension
    // therefore adapts Violentmonkey's portable userscript logic to Chromium Tab/WebContents.
    execute { }
}
