/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2cb2182 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.pinterest.coexist

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.compat.AppCompatibilities.PINTEREST_PACKAGE
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val CHANGE_PACKAGE_NAME = "Change package name"

/** The package a copy gets unless you choose another. */
internal const val DEFAULT_PACKAGE = "$PINTEREST_PACKAGE.hushpinterest"

/** The name a copy shows under its icon unless you choose another. */
internal const val DEFAULT_APP_NAME = "HushPinterest"

/** The longest name allowed: a launcher cuts a long one off under the icon anyway. */
internal const val APP_NAME_LIMIT = 30

/** A package name Android takes: two or more dot-separated parts, each a letter then letters, digits or underscores. */
private val PACKAGE_NAME = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

/** Whether [name] can be a copy's package: a valid name, and not Pinterest's own. */
internal fun isCopyPackage(name: String?): Boolean =
    name != null && PACKAGE_NAME.matches(name) && name != PINTEREST_PACKAGE

/**
 * Whether [name] can be the app's name: some text that isn't only spaces, not too long, and not
 * starting with `@` or `?`, which the resource compiler would read as a reference to a resource.
 */
internal fun isAppName(name: String?): Boolean {
    val trimmed = name?.trim() ?: return false
    return trimmed.isNotEmpty() && trimmed.length <= APP_NAME_LIMIT && trimmed[0] != '@' && trimmed[0] != '?'
}

private const val LAUNCHER = "android.intent.category.LAUNCHER"

/**
 * Gives the app [name]: the application's label, which is what Android shows wherever the app has
 * no label of its own, and the label of every activity or alias a launcher lists, which would
 * otherwise win over it. Answers how many labels it set.
 */
internal fun Document.renameApp(name: String): Int {
    val application = elements("application").singleOrNull()
        ?: throw PatchException("$CHANGE_PACKAGE_NAME: AndroidManifest.xml doesn't have one <application>")
    application.setAttribute("android:label", name)
    var labels = 1
    for (component in elements("activity") + elements("activity-alias")) {
        val launcher = component.getElementsByTagName("category").let { categories ->
            (0 until categories.length).any { (categories.item(it) as Element).getAttribute("android:name") == LAUNCHER }
        }
        if (!launcher) continue
        component.setAttribute("android:label", name)
        labels++
    }
    return labels
}

/** The stock app's own authorities and permissions, read before the package is renamed. */
private var stockAuthorities: Set<String> = emptySet()
private var stockPermissions: Set<String> = emptySet()

/** The package and name the manifest half sets, from the options when the patch executes. */
private var renameTo: String = DEFAULT_PACKAGE
private var appName: String = DEFAULT_APP_NAME

/**
 * Renames the manifest in finalize, after every patch has made its own changes under the stock
 * name. Download pins declares its share preview provider under the package then, so the
 * authorities and permissions are read again there before anything moves.
 */
internal fun Document.renameCopy(packageName: String, label: String, authorities: Set<String>, permissions: Set<String>): String {
    var renamed = packageName
    var moving = authorities
    var declared = permissions
    // Morphe's own Change package name or Clone app, picked as well, may have renamed it first. Its
    // name stays, and whatever it left under the stock name still moves.
    val current = documentElement.getAttribute("package")
    if (current == PINTEREST_PACKAGE) {
        moving = moving + ownAuthorities(PINTEREST_PACKAGE)
        declared = declared + ownPermissions(PINTEREST_PACKAGE)
        documentElement.setAttribute("package", packageName)
    } else {
        renamed = current
    }
    val followed = followRenamedPackage(PINTEREST_PACKAGE, moving, declared)
        ?: throw PatchException("$CHANGE_PACKAGE_NAME: the package is still $PINTEREST_PACKAGE")
    val labels = renameApp(label)
    if (renamed != packageName) {
        patchLog.warning("$CHANGE_PACKAGE_NAME: another patch already renamed the package to $renamed, so it keeps that name.")
    }
    patchLog.info(
        "$CHANGE_PACKAGE_NAME: the package is now $renamed. ${followed.declarations} permission declaration(s), " +
            "${followed.permissions} mention(s) of them and ${followed.authorities} provider authorities moved with it. " +
            "The app is called \"$label\" ($labels label(s)).",
    )
    return renamed
}

private val changePackageNameManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use {
            stockAuthorities = it.ownAuthorities(PINTEREST_PACKAGE)
            stockPermissions = it.ownPermissions(PINTEREST_PACKAGE)
        }
        if (stockAuthorities.isEmpty()) throw PatchException("$CHANGE_PACKAGE_NAME: Pinterest's manifest has no provider under $PINTEREST_PACKAGE")
    }

    finalize {
        document("AndroidManifest.xml").use { it.renameCopy(renameTo, appName, stockAuthorities, stockPermissions) }
    }
}

/**
 * Renames Pinterest so the patched copy installs beside the Pinterest you already have.
 *
 * Android keys an app by its package, so a copy under another package is a second app with its own
 * data and sign-in. Renaming the package alone isn't enough: Pinterest declares its own signature
 * permissions and content providers under its package, and Android refuses a second app that
 * declares the same permission with another key (INSTALL_FAILED_DUPLICATE_PERMISSION) or claims the
 * same authority (INSTALL_FAILED_CONFLICTING_PROVIDER). So both move under the new package, along
 * with every component that requires one of those permissions. Pinterest's code also spells its
 * FileProvider's authority out when it shares or saves its own files, and that goes through the
 * extension, which answers the running app's own. The copy also gets a name of its own under its
 * icon, so the launcher doesn't show two apps called Pinterest.
 */
@Suppress("unused")
val changePackageNamePatch = bytecodePatch(
    name = "Change package name",
    description = "Gives the patched Pinterest its own package name and app name (HushPinterest unless you pick " +
        "another), so it installs beside the Pinterest you already have instead of over it. It's a separate app with " +
        "its own sign-in. It isn't selected by default. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Settings")
    dependsOn(settingsPatch, pinterestExtensionPatch, changePackageNameManifestPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    val packageName by stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE,
        title = "Package name",
        description = "The copy's package name. Each copy needs its own.",
        required = true,
    ) { isCopyPackage(it) }

    val name by stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        title = "App name",
        description = "The name under the copy's icon, up to $APP_NAME_LIMIT characters.",
        required = true,
    ) { isAppName(it) }

    execute {
        renameTo = packageName!!
        appName = name!!.trim()
        val routed = routeOwnAuthorities(CHANGE_PACKAGE_NAME, PINTEREST_PACKAGE, stockAuthorities)
        if (routed == 0) throw PatchException("$CHANGE_PACKAGE_NAME: Pinterest's code no longer names any of its own providers")
        patchLog.info("$CHANGE_PACKAGE_NAME: $routed of Pinterest's own provider addresses now follow the running package.")
        enableStatus("changePackageName")
    }
}
