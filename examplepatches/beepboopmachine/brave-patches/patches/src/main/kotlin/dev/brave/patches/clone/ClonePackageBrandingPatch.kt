package dev.brave.patches.clone

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private val PACKAGE_REGEX = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

@Suppress("unused")
val clonePackageBrandingPatch = patch(
    name = "Clone Package & Branding",
    description = "Modifies application package name, authorities, and permissions to allow side-by-side installation with official Brave."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    val targetPackageOption = stringOption(
        key = "packageName",
        default = "com.brave.browser.clone",
        title = "Package Name",
        description = "New package identifier for side-by-side cloned installation."
    )

    val targetLabelOption = stringOption(
        key = "appLabel",
        default = "Brave Mod",
        title = "Application Label",
        description = "Custom application name shown on home screen and launcher."
    )

    execute {
        val newPackage = (targetPackageOption.value ?: "com.brave.browser.clone").trim()
        val newLabel = (targetLabelOption.value ?: "Brave Mod").trim()
        val oldPackage = "com.brave.browser"

        if (!PACKAGE_REGEX.matches(newPackage)) {
            throw IllegalArgumentException("Invalid package name format '$newPackage'. Must match ^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")
        }

        if (newLabel.isEmpty()) {
            throw IllegalArgumentException("Application label cannot be blank")
        }

        resourceXml("AndroidManifest.xml").use { xml ->
            // 1. Normalize all relative component names BEFORE rewriting manifest package
            // Covers application, activity, activity-alias, service, receiver, provider, and instrumentation
            val componentTags = listOf("application", "activity", "activity-alias", "service", "receiver", "provider", "instrumentation")
            for (tag in componentTags) {
                xml.elements(tag).forEach { element ->
                    val name = element.attribute("android:name")
                    if (name != null && name.isNotEmpty()) {
                        if (name.startsWith(".")) {
                            element.setAttribute("android:name", "$oldPackage$name")
                        } else if (!name.contains(".")) {
                            element.setAttribute("android:name", "$oldPackage.$name")
                        }
                    }

                    if (tag == "activity-alias") {
                        val target = element.attribute("android:targetActivity")
                        if (target != null && target.isNotEmpty()) {
                            if (target.startsWith(".")) {
                                element.setAttribute("android:targetActivity", "$oldPackage$target")
                            } else if (!target.contains(".")) {
                                element.setAttribute("android:targetActivity", "$oldPackage.$target")
                            }
                        }
                    }
                }
            }

            // 2. Update root manifest package attribute
            xml.root.setAttribute("package", newPackage)

            // 3. Update application label, taskAffinity, and process
            xml.elements("application").firstOrNull()?.let { app ->
                app.setAttribute("android:label", newLabel)
                val appAffinity = app.attribute("android:taskAffinity")
                if (appAffinity != null && appAffinity.contains(oldPackage)) {
                    app.setAttribute("android:taskAffinity", appAffinity.replace(oldPackage, newPackage))
                }
                val appProcess = app.attribute("android:process")
                if (appProcess != null && appProcess.contains(oldPackage)) {
                    app.setAttribute("android:process", appProcess.replace(oldPackage, newPackage))
                }
            }

            // 4. Update launcher activity / activity-alias labels and taskAffinity
            val launcherTags = listOf("activity", "activity-alias")
            for (tag in launcherTags) {
                xml.elements(tag).forEach { comp ->
                    var isLauncher = false
                    comp.elements("intent-filter").forEach { filter ->
                        val hasMain = filter.elements("action").any { it.attribute("android:name") == "android.intent.action.MAIN" }
                        val hasLauncher = filter.elements("category").any { it.attribute("android:name") == "android.intent.category.LAUNCHER" }
                        if (hasMain && hasLauncher) {
                            isLauncher = true
                        }
                    }
                    if (isLauncher) {
                        comp.setAttribute("android:label", newLabel)
                    }

                    val taskAffinity = comp.attribute("android:taskAffinity")
                    if (taskAffinity != null && taskAffinity.contains(oldPackage)) {
                        comp.setAttribute("android:taskAffinity", taskAffinity.replace(oldPackage, newPackage))
                    }
                }
            }

            // 5. Rewrite ContentProvider authorities (all 9 providers from RECON_DELTA.md Section 8.2)
            // Semicolon-delimited multi-authorities (e.g. ChromeBrowserProvider) are strictly preserved
            xml.elements("provider").forEach { provider ->
                val auth = provider.attribute("android:authorities")
                if (auth != null && auth.contains(oldPackage)) {
                    provider.setAttribute("android:authorities", auth.replace(oldPackage, newPackage))
                }

                // Rewrite <path-permission> nested inside <provider>
                provider.elements("path-permission").forEach { pathPerm ->
                    listOf("android:permission", "android:readPermission", "android:writePermission").forEach { attr ->
                        val pVal = pathPerm.attribute(attr)
                        if (pVal != null && pVal.contains(oldPackage)) {
                            pathPerm.setAttribute(attr, pVal.replace(oldPackage, newPackage))
                        }
                    }
                }
            }

            // 6. Rewrite custom signature permissions
            xml.elements("permission").forEach { perm ->
                val name = perm.attribute("android:name")
                if (name != null && name.contains(oldPackage)) {
                    perm.setAttribute("android:name", name.replace(oldPackage, newPackage))
                }
            }

            // 7. Rewrite matching <uses-permission> and <uses-permission-sdk-23> declarations
            listOf("uses-permission", "uses-permission-sdk-23").forEach { uTag ->
                xml.elements(uTag).forEach { usesPerm ->
                    val name = usesPerm.attribute("android:name")
                    if (name != null && name.contains(oldPackage)) {
                        usesPerm.setAttribute("android:name", name.replace(oldPackage, newPackage))
                    }
                }
            }

            // 8. Rewrite permission and process attributes across all component tags + application
            val permTags = listOf("application", "activity", "activity-alias", "service", "receiver", "provider")
            val permAttrs = listOf("android:permission", "android:readPermission", "android:writePermission")
            for (tag in permTags) {
                xml.elements(tag).forEach { comp ->
                    for (attr in permAttrs) {
                        val permVal = comp.attribute(attr)
                        if (permVal != null && permVal.contains(oldPackage)) {
                            comp.setAttribute(attr, permVal.replace(oldPackage, newPackage))
                        }
                    }

                    val processVal = comp.attribute("android:process")
                    if (processVal != null && processVal.contains(oldPackage)) {
                        comp.setAttribute("android:process", processVal.replace(oldPackage, newPackage))
                    }
                }
            }

            // 9. Rewrite <instrumentation android:targetPackage> if present
            xml.elements("instrumentation").forEach { inst ->
                val target = inst.attribute("android:targetPackage")
                if (target != null && target.contains(oldPackage)) {
                    inst.setAttribute("android:targetPackage", target.replace(oldPackage, newPackage))
                }
            }
        }
    }
}
