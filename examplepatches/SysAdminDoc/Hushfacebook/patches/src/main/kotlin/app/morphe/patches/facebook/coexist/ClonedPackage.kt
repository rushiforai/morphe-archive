/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.patchLog
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

/*
 * What Morphe's Clone app patch leaves for this bundle to finish, so a renamed copy of Facebook
 * installs and starts beside the Facebook it was cloned from (#16).
 *
 * Clone app renames the package in its finalize block. With Update permissions on it renames each
 * permission Facebook declares, com.facebook.katana.X to <package>.X and any other name to
 * <package>_<name>, and the first <uses-permission> of each, but not the components that require
 * one: they went on naming permissions only the stock app declares. With Update providers on it
 * renames the provider authorities the same way. With it off they stay the stock app's, and Android
 * refuses a second app claiming one (INSTALL_FAILED_CONFLICTING_PROVIDER). And Facebook's code
 * spells some of its own authorities out, content://com.facebook.katana.ClientMessagePushDedupInfoProvider/mutestatus
 * among them, so a clone started up by deleting through the stock app's provider, which turned it
 * away, and with Update permissions on Android refused it before that.
 *
 * Morphe executes the patches it's given sorted by name, each after its dependencies, and runs the
 * finalize blocks in the reverse order, so this one's finalize sees Clone app's work only when it
 * executed before "Clone app". Every patch depends on the settings patch, which depends on this,
 * and the default selection has patches whose names sort before "Clone app" (ClonedPackageOrderTest
 * holds both). A selection without any of them leaves the manifest as Clone app wrote it. The code
 * half doesn't depend on the order: the extension reads the package at run time.
 *
 * There's no way to make this run after "Clone app" whatever the reader picks: Morphe sorts and
 * finalizes by what got selected, "Clone app" comes from a different bundle this one can't depend
 * on, and a patch has no way to ask what else was selected. So a selection holding only patches
 * whose names sort after "Clone app" (ClonedPackageOrderTest.aSelectionOfOnlyLaterNamedPatchesRunsCloneAppFirst
 * shows one) leaves [followRenamedPackage] running before the rename, with nothing to follow yet.
 * It can't tell that apart from an ordinary install either, so it says what to add at fine level
 * instead of warning on every build that was never a clone.
 */

/** The call each of Facebook's own authority literals goes through, into the register it was loaded into. */
internal const val AUTHORITY_CALL =
    "$EXTENSION_PACKAGE/coexist/OwnAuthorities;->name(Ljava/lang/String;)Ljava/lang/String;"

internal const val CONTENT = "content://"

private fun Document.elements(tag: String): List<Element> {
    val nodes = getElementsByTagName(tag)
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

/** Facebook's own provider authorities: every entry of a provider's list that's under [packageName]. */
internal fun Document.ownAuthorities(packageName: String): Set<String> = elements("provider")
    .flatMap { it.getAttribute("android:authorities").split(';') }
    .map { it.trim() }
    .filter { it.startsWith("$packageName.") }
    .toSet()

/** What following a renamed package moved: mentions of a permission, and authorities. */
internal data class Followed(val permissions: Int, val authorities: Int)

/**
 * After something renamed the package away from [originalPackage]: points every mention of a
 * permission this manifest no longer declares at the renamed declaration Clone app made of it, and
 * moves every authority still in [stockAuthorities] under the new package, which is where Clone
 * app's Update providers would have put it. Answers what it moved, or null when the package is
 * still [originalPackage], and then it changes nothing but a fine message, since this could be an
 * ordinary install as easily as a clone whose "Clone app" hasn't finalized yet.
 */
internal fun Document.followRenamedPackage(originalPackage: String, stockAuthorities: Set<String>): Followed? {
    val renamedTo = documentElement.getAttribute("package")
    if (renamedTo.isEmpty() || renamedTo == originalPackage) {
        patchLog.fine(
            "The package is still $originalPackage, so there's nothing to follow yet. If you're patching " +
                "with Clone app and the clone still doesn't start beside the app it came from, also select a " +
                "patch whose name sorts before \"Clone app\", such as Block ad telemetry, which is on by " +
                "default: Morphe finalizes in reverse name order, and this step has to run after Clone app's " +
                "to see the renamed manifest.",
        )
        return null
    }

    val declared = elements("permission").map { it.getAttribute("android:name") }.toSet()
    fun movedUnder(name: String) = renamedTo + name.removePrefix(originalPackage)
    fun cloneDeclarationOf(name: String): String? = listOfNotNull(
        movedUnder(name).takeIf { name.startsWith("$originalPackage.") },
        "${renamedTo}_$name",
    ).firstOrNull { it in declared }

    var permissions = 0
    for (element in elements("*")) {
        val attributes = element.attributes
        for (at in 0 until attributes.length) {
            val attribute = attributes.item(at) as? Attr ?: continue
            if (element.tagName == "permission" && attribute.nodeName == "android:name") continue
            if (attribute.value in declared) continue
            val clone = cloneDeclarationOf(attribute.value) ?: continue
            attribute.value = clone
            permissions++
        }
    }

    var authorities = 0
    for (provider in elements("provider")) {
        val entries = provider.getAttribute("android:authorities").split(';')
        val moved = entries.map { entry ->
            val authority = entry.trim()
            if (authority !in stockAuthorities) return@map entry
            authorities++
            entry.replace(authority, movedUnder(authority))
        }
        if (moved != entries) provider.setAttribute("android:authorities", moved.joinToString(";"))
    }
    return Followed(permissions, authorities)
}

/** The authority [this] names when it's one of [authorities] or a content:// address on one, else null. */
internal fun String.ownAuthority(authorities: Set<String>): String? {
    if (this in authorities) return this
    if (!startsWith(CONTENT)) return null
    return removePrefix(CONTENT).takeWhile { it != '/' && it != '?' && it != '#' }.takeIf { it in authorities }
}

/**
 * Hands every literal of Facebook's code naming one of its own [authorities] to the extension,
 * which answers the running app's. Answers how many it handed over. Every one is under
 * [packageName], which the string index finds with a prefix, and the extension is left alone.
 */
internal fun BytecodePatchContext.routeOwnAuthorities(packageName: String, authorities: Set<String>): Int {
    val owners = listOf("$packageName.", "$CONTENT$packageName.")
        .flatMap { classDefByStrings(it, StringComparisonType.STARTS_WITH) }
        .map { it.type }
        .filterNot { it.startsWith(EXTENSION_ROOT) }
        .distinct()
    return owners.sumOf { type ->
        mutableClassDefBy(type).methods
            .filter { method -> method.implementation?.instructions?.any { it.loadedString()?.ownAuthority(authorities) != null } == true }
            .sumOf { it.routeLiterals(AUTHORITY_CALL, "Clone support", "an authority") { literal -> literal.ownAuthority(authorities) != null } }
    }
}

/** The stock app's own authorities, read before anything renames the package. */
private var stockAuthorities: Set<String> = emptySet()

private val clonedPackageManifestPatch = resourcePatch {
    execute {
        stockAuthorities = document("AndroidManifest.xml").use { it.ownAuthorities(packageMetadata.packageName) }
    }

    finalize {
        val followed = document("AndroidManifest.xml").use {
            it.followRenamedPackage(packageMetadata.packageName, stockAuthorities)
        } ?: return@finalize
        patchLog.info(
            "The package was renamed, so ${followed.permissions} mention(s) of a permission now name the renamed " +
                "declaration, and ${followed.authorities} provider authorities moved under the new name.",
        )
    }
}

/**
 * Makes a copy renamed with Morphe's Clone app its own app: its manifest names only permissions it
 * declares and authorities it owns, and its code reaches its own providers. On an install nobody
 * renamed, the manifest is left as it was and the extension hands every authority back unchanged.
 */
internal val clonedPackagePatch = bytecodePatch {
    dependsOn(clonedPackageManifestPatch, facebookExtensionPatch)

    execute {
        routeOwnAuthorities(packageMetadata.packageName, stockAuthorities)
    }
}
