package app.xiondigital.patches.atoz.clone

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.xiondigital.patches.atoz.shared.Constants.COMPATIBILITY_ATOZ_APK
import org.w3c.dom.Element

/** Application id of the builds these patches are written against. */
private const val ORIGINAL_PACKAGE = "com.amazon.atozm"

/** Default application id for the clone: the patch author's namespace, not Amazon's. */
private const val DEFAULT_CLONE_PACKAGE = "app.xiondigital.atoz"

/** Default launcher name, so the clone is not mistaken for the official app. */
private const val DEFAULT_CLONE_NAME = "A to Z (clone)"

/** A legal Android application id: at least two segments, each starting with a lowercase letter. */
private val PACKAGE_ID_PATTERN = Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$")

/**
 * Permission declarations A to Z inherits from Amazon's SDK manifests.
 *
 * A re-signed build cannot own a permission name that an Amazon-signed app already owns: Android
 * refuses to install it with `INSTALL_FAILED_DUPLICATE_PERMISSION`, which is why the stock Amazon
 * apps had to be removed before an earlier re-signed build would go on. The clone never needs to own
 * them — it only needs to be *granted* them by Amazon-signed apps — so the declarations are dropped.
 * The matching `<uses-permission>` entries stay and simply go ungranted.
 *
 * The components that reference these permissions (`AuthPortalUIActivity` and friends) are all
 * `exported=false`, so nothing else depends on the declarations existing.
 */
private val FOREIGN_PERMISSION_PREFIXES = listOf(
    "com.amazon.identity.permission.",
    "com.amazon.identity.auth.device.perm.",
    "com.amazon.dcp.",
    "com.amazon.appmanager.preload.permission.",
)

/**
 * The options are declared by [clonePackagePatch] and read by its execution block. Options are
 * resolved before any patch runs, so both values are final by the time the manifest is rewritten.
 */
private lateinit var clonePackageNameOption: Option<String>
private lateinit var cloneAppNameOption: Option<String>

private fun clonePackageName(): String = clonePackageNameOption.value!!

private fun cloneAppName(): String = cloneAppNameOption.value!!

/**
 * Installs the patched build under its own application id, so it sits beside the official Amazon A to
 * Z instead of replacing it.
 *
 * Android identifies an installed app by the `package` attribute of its manifest, and every other
 * identifier the manifest derives from it has to move with it:
 *
 * - **Provider authorities.** An authority is a device-wide name. Six of them are derived from the
 *   package — `com.amazon.atozm.androidx-startup`, `.firebaseinitprovider`,
 *   `.imagepickerprovider`, `.rnshare.fileprovider`, `.fileprovider`, and
 *   `com.amazon.identity.auth.device.CrossAppContextProvider.com.amazon.atozm`, which embeds the
 *   package in the middle rather than as a prefix. Two apps cannot claim the same authority, so each
 *   is rewritten wherever the package occurs inside it. No dex literal carries an authority — the
 *   libraries that use them build them from `getPackageName()` — so nothing else has to move.
 * - **The app's own runtime permission.** `com.amazon.atozm.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION`
 *   is declared and used by the app itself, and AndroidX derives the same name from
 *   `Context.getPackageName()` at runtime, so the declaration and its `<uses-permission>` are renamed
 *   to match.
 * - **Permissions the app does not own.** The declarations listed in [FOREIGN_PERMISSION_PREFIXES]
 *   are dropped for the reason documented there.
 * - **Launcher label.** The clone gets a distinct name so the two installs are not indistinguishable.
 *
 * What a renamed application id cannot carry over, because the platform binds it to the original
 * package and signing certificate: Play services registration (including the FCM token the server
 * uses to target notifications), Play Integrity/attestation verdicts, verified App Links for the URLs
 * the manifest claims, and any Amazon backend check that compares the package or signature against
 * the official build. Sign-in through the browser flow keeps working because its redirect scheme
 * (`atozmobileauth`, `atozmobile`, `atozmobilelogout`) is declared by scheme, not by package — but a
 * server-side package check would still refuse it, which is untestable here.
 *
 * This patch is off by default: enabling it changes which app the user installs, and data from the
 * official install cannot be migrated into the clone.
 */
@Suppress("unused")
val clonePackagePatch = resourcePatch(
    name = "Clone package",
    description = "Installs the patched build under its own application id " +
        "($DEFAULT_CLONE_PACKAGE by default), so it can sit next to the official Amazon A to Z " +
        "instead of replacing it. Renames the provider authorities, the app's runtime permission and " +
        "the launcher label, and drops the Amazon SDK permission declarations a re-signed build " +
        "cannot own. Off by default: a clone starts empty, and Play services, FCM targeting, " +
        "attestation and verified App Links stay bound to the original package.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ATOZ_APK)

    clonePackageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_CLONE_PACKAGE,
        title = "Package name",
        description = "Application id the patched build installs as. Must not be $ORIGINAL_PACKAGE.",
        required = true,
    ) { packageName ->
        packageName != null && packageName != ORIGINAL_PACKAGE && PACKAGE_ID_PATTERN.matches(packageName)
    }

    cloneAppNameOption = stringOption(
        key = "appName",
        default = DEFAULT_CLONE_NAME,
        title = "App name",
        description = "Launcher label of the clone.",
        required = true,
    ) { appName -> !appName.isNullOrBlank() }

    execute {
        document("AndroidManifest.xml").use { document ->
            document.renamePackage(clonePackageName(), cloneAppName())
        }
    }
}

/**
 * Rewrites the application id and every manifest identifier that has to move with it.
 *
 * A split APK inside an APKM bundle carries a manifest without a `package` attribute — the base APK
 * owns it — so those are left untouched.
 */
private fun org.w3c.dom.Document.renamePackage(newPackageName: String, newAppName: String) {
    val manifest = documentElement ?: error("AndroidManifest.xml has no <manifest> element.")
    val currentPackage = manifest.getAttribute("package")

    if (currentPackage.isEmpty()) return

    require(currentPackage == ORIGINAL_PACKAGE) {
        "AndroidManifest.xml declares '$currentPackage', not $ORIGINAL_PACKAGE; refusing to rename it."
    }

    manifest.setAttribute("package", newPackageName)

    // Declared permissions: rename the app's own, drop the ones a re-signed build cannot own, and
    // refuse anything unexpected rather than shipping a clone that cannot be installed.
    getElementsByTagName("permission").toElements().forEach { permission ->
        val name = permission.getAttribute("android:name")

        when {
            name.startsWith("$ORIGINAL_PACKAGE.") ->
                permission.setAttribute("android:name", name.replacePackage(newPackageName))

            FOREIGN_PERMISSION_PREFIXES.any(name::startsWith) ->
                permission.parentNode.removeChild(permission)

            else -> error(
                "Amazon A to Z declares the permission '$name', which belongs to neither the app nor " +
                    "an Amazon SDK this patch knows. A clone cannot redeclare it, so this build needs " +
                    "inspecting before it can be renamed.",
            )
        }
    }

    getElementsByTagName("uses-permission").toElements().forEach { usesPermission ->
        val name = usesPermission.getAttribute("android:name")
        if (name.startsWith("$ORIGINAL_PACKAGE.")) {
            usesPermission.setAttribute("android:name", name.replacePackage(newPackageName))
        }
    }

    // Provider authorities are a device-wide namespace, and one element may declare several. The
    // package is not always a prefix: the identity SDK's CrossAppContextProvider appends it.
    getElementsByTagName("provider").toElements().forEach { provider ->
        val authorities = provider.getAttribute("android:authorities")
        if (authorities.isEmpty()) return@forEach

        provider.setAttribute(
            "android:authorities",
            authorities.split(';').joinToString(";") { authority ->
                authority.trim().replace(ORIGINAL_PACKAGE, newPackageName)
            },
        )
    }

    // Task affinity is matched across packages, so an activity that keeps the original affinity can
    // be handed the other install's task. A to Z declares none today; this keeps that true if it
    // ever adds one.
    listOf("activity", "activity-alias").forEach { tag ->
        getElementsByTagName(tag).toElements().forEach { component ->
            val affinity = component.getAttribute("android:taskAffinity")
            if (affinity.isNotEmpty()) {
                component.setAttribute(
                    "android:taskAffinity",
                    affinity.replace(ORIGINAL_PACKAGE, newPackageName),
                )
            }
        }
    }

    // Last check before the label: no manifest identity string may still point at the original app.
    val leftovers = buildList {
        getElementsByTagName("provider").toElements().forEach { provider ->
            val authorities = provider.getAttribute("android:authorities")
            if (ORIGINAL_PACKAGE in authorities) add("provider authority '$authorities'")
        }
        getElementsByTagName("permission").toElements().forEach { permission ->
            val name = permission.getAttribute("android:name")
            if (name.startsWith(ORIGINAL_PACKAGE)) add("permission '$name'")
        }
    }
    check(leftovers.isEmpty()) {
        "The clone still shares ${leftovers.joinToString()} with the official app, so the two could " +
            "not be installed side by side. The patch needs re-checking on this build."
    }

    val application = getElementsByTagName("application").item(0) as? Element
        ?: error("AndroidManifest.xml has no <application> element.")

    application.setAttribute("android:label", newAppName)
}

/**
 * Prefix-renames a package-owned identifier, leaving anything else (system permissions, URLs) alone.
 *
 * A bare `com.amazon.atozm` matches too: that is the form a task affinity or a `uses-permission`
 * entry takes.
 */
private fun String.replacePackage(newPackageName: String): String = when {
    this == ORIGINAL_PACKAGE -> newPackageName
    startsWith("$ORIGINAL_PACKAGE.") -> newPackageName + removePrefix(ORIGINAL_PACKAGE)
    else -> this
}

/** Snapshot of a [org.w3c.dom.NodeList], safe to iterate while elements are removed. */
private fun org.w3c.dom.NodeList.toElements(): List<Element> =
    (0 until length).mapNotNull { item(it) as? Element }
