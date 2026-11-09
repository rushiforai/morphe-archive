/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.coexist

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.patchLog
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val CHANGE_APP_NAME = "Change app name"

/** The name a renamed Threads shows unless you choose another. */
internal const val DEFAULT_APP_NAME = "HushThreads"

/** The longest name allowed: a launcher cuts a long one off under the icon anyway. */
internal const val APP_NAME_LIMIT = 30

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
        ?: throw PatchException("$CHANGE_APP_NAME: AndroidManifest.xml doesn't have one <application>")
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

/** The name the manifest half sets, from the option when the patch executes. */
private var appName: String = DEFAULT_APP_NAME

private val changeAppNameManifestPatch = resourcePatch {
    finalize {
        val labels = document("AndroidManifest.xml").use { it.renameApp(appName) }
        patchLog.info("$CHANGE_APP_NAME: the app is now called \"$appName\" ($labels label(s)).")
    }
}

/**
 * Changes the name Threads shows under its icon and in your recent apps. With Change package name,
 * it tells the patched copy apart from the stock Threads beside it.
 */
@Suppress("unused")
val changeAppNamePatch = bytecodePatch(
    name = "Change app name",
    description = "Changes the name under the app's icon, so a copy you install beside Threads with " +
        "Change package name is easy to tell apart. It isn't selected by default. Works as soon as you " +
        "patch it in, with no switch.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, threadsExtensionPatch, changeAppNameManifestPatch)
    compatibleWith(*AppCompatibilities.threads())

    val name by stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        title = "App name",
        description = "The name under the app's icon, up to $APP_NAME_LIMIT characters.",
        required = true,
    ) { isAppName(it) }

    execute {
        appName = name!!.trim()
        enableStatus("changeAppName")
    }
}
