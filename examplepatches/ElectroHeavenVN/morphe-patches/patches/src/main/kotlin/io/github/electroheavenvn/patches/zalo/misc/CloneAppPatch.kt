package io.github.electroheavenvn.patches.zalo.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import io.github.electroheavenvn.patches.zalo.shared.Constants.COMPATIBILITY_ZALO
import io.github.electroheavenvn.patches.zalo.xposed.integrateXposedPatch

import org.w3c.dom.Document
import org.w3c.dom.Element

const val LAUNCHER_ACTIVITY = "com.zing.zalo.ui.ZaloLauncherActivity"

private val cloneNumberOption = stringOption(
    key = "cloneNumber",
    default = "",
    title = "Clone number",
    description = "The clone number appended to the package name and app name (e.g. 2 -> Zalo Morphe 2). Leave empty to use the default name.",
    required = false,
) { it.isNullOrBlank() || it.all { char -> char.isDigit() } }


const val ORG_PKGNAME = "com.zing.zalo"
private const val PERMISSION_PREFIX = "zing.zalo.permission."
private val PKGNAME_REGEX = Regex("^[a-z][\\w]*(\\.[a-z][\\w]*)+$")

fun isValidZaloPackageName(name: String?): Boolean = name != null && PKGNAME_REGEX.matches(name)

/** Rewrites manifest identities */
fun rewriteZaloPackage(document: Document, newPackage: String) {
    document.documentElement.setAttribute("package", newPackage)
    val providers = document.getElementsByTagName("provider")
    for (i in 0 until providers.length) {
        val provider = providers.item(i) as Element
        val authorities = provider.getAttribute("android:authorities")
        val rewritten = authorities.split(';').joinToString(";") { authority ->
            when {
                authority == ORG_PKGNAME -> newPackage
                authority.startsWith("$ORG_PKGNAME.") -> authority.replaceFirst("$ORG_PKGNAME.", "$newPackage.")
                else -> authority
            }
        }
        if (rewritten != authorities) provider.setAttribute("android:authorities", rewritten)
    }

    val ownedPrefix = "$ORG_PKGNAME."
    val permissionNodes = sequenceOf("permission", "uses-permission")
        .flatMap { tag ->
            val nodes = document.getElementsByTagName(tag)
            (0 until nodes.length).asSequence().map { nodes.item(it) as Element }
        }
    permissionNodes.forEach { node ->
        val name = node.getAttribute("android:name")
        when {
            name.startsWith(ownedPrefix) -> node.setAttribute("android:name", name.replaceFirst(ownedPrefix, "$newPackage."))
            name.startsWith(PERMISSION_PREFIX) -> node.setAttribute("android:name", name.replaceFirst(PERMISSION_PREFIX, "$newPackage.permission."))
        }
    }

    val elements = document.getElementsByTagName("*")
    for (i in 0 until elements.length) {
        val element = elements.item(i) as Element
        val permission = element.getAttribute("android:permission")
        if (permission.startsWith(PERMISSION_PREFIX)) {
            element.setAttribute(
                "android:permission",
                permission.replaceFirst(PERMISSION_PREFIX, "$newPackage.permission."),
            )
        }
    }
}

fun rewriteAppLabel(document: Document, newName: String, launcherActivity: String) {
    val application = document.getElementsByTagName("application").item(0) as? Element
        ?: error("AndroidManifest.xml has no <application> element")
    application.setAttribute("android:label", newName)
    val activities = document.getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val activity = activities.item(i) as Element
        if (activity.getAttribute("android:name") == launcherActivity) {
            activity.setAttribute("android:label", newName)
        }
    }
}

@Suppress("unused")
val cloneZaloPatch = resourcePatch(
    name = "Clone app",
    description = "Change Zalo package name and update the app name to allow multiple installations.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(integrateXposedPatch)

    val cloneNumber by cloneNumberOption()

    finalize {
        val parsedNum = cloneNumber?.trim()?.toIntOrNull()
        val (targetPackageName, targetAppName) = if (parsedNum == null || parsedNum < 1) {
            "$ORG_PKGNAME.morphe" to "Zalo Morphe"
        } else {
            "$ORG_PKGNAME.morphe_$parsedNum" to "Zalo Morphe $parsedNum"
        }

        document("AndroidManifest.xml").use { document ->
            rewriteZaloPackage(document, targetPackageName)
            rewriteAppLabel(document, targetAppName, LAUNCHER_ACTIVITY)
        }
    }
}



