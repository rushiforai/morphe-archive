/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.coexist

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.compat.AppCompatibilities.THREADS_PACKAGE
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.patchLog
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

internal const val CHANGE_PACKAGE_NAME = "Change package name"

/** The package a copy gets unless you choose another. */
internal const val DEFAULT_PACKAGE = "$THREADS_PACKAGE.hushthreads"

/** A package name Android takes: two or more dot-separated parts, each a letter then letters, digits or underscores. */
private val PACKAGE_NAME = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

/** Whether [name] can be a copy's package: a valid name, and not Threads' own. */
internal fun isCopyPackage(name: String?): Boolean =
    name != null && PACKAGE_NAME.matches(name) && name != THREADS_PACKAGE

/** The stock app's own authorities and permissions, read before the package is renamed. */
private var stockAuthorities: Set<String> = emptySet()
private var stockPermissions: Set<String> = emptySet()

/** The package the manifest half renames to, set from the option when the patch executes. */
private var renameTo: String = DEFAULT_PACKAGE

private val changePackageNameManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use {
            stockAuthorities = it.ownAuthorities(THREADS_PACKAGE)
            stockPermissions = it.ownPermissions(THREADS_PACKAGE)
        }
        if (stockAuthorities.isEmpty()) throw PatchException("$CHANGE_PACKAGE_NAME: Threads' manifest has no provider under $THREADS_PACKAGE")
    }

    // In finalize, after every patch has made its own changes to the manifest under the stock name.
    finalize {
        var renamed = renameTo
        val followed = document("AndroidManifest.xml").use {
            // Morphe's Clone app, picked as well, may have renamed it first. Its name stays, and
            // whatever it left under the stock name still moves.
            val package_ = it.documentElement.getAttribute("package")
            if (package_ == THREADS_PACKAGE) it.documentElement.setAttribute("package", renameTo) else renamed = package_
            it.followRenamedPackage(THREADS_PACKAGE, stockAuthorities, stockPermissions)!!
        }
        if (renamed != renameTo) {
            patchLog.warning("$CHANGE_PACKAGE_NAME: another patch already renamed the package to $renamed, so it keeps that name.")
        }
        patchLog.info(
            "$CHANGE_PACKAGE_NAME: the package is now $renamed. ${followed.declarations} permission declaration(s), " +
                "${followed.permissions} mention(s) of them and ${followed.authorities} provider authorities moved with it.",
        )
    }
}

/**
 * Renames Threads so the patched copy installs beside the Threads you already have.
 *
 * Android keys an app by its package, so a copy under another package is a second app with its own
 * data and sign-in. Renaming the package alone isn't enough: Threads declares its own signature
 * permissions and content providers under its package, and Android refuses a second app that
 * declares the same permission with another key (INSTALL_FAILED_DUPLICATE_PERMISSION) or claims the
 * same authority (INSTALL_FAILED_CONFLICTING_PROVIDER). So both move under the new package, along
 * with every component that requires one of those permissions. Threads' code also spells its own
 * provider addresses out, for sharing files and in the tables it reads Meta's family apps from, and
 * those go through the extension, which answers the running app's own. And the copy passes Threads'
 * check for its own package, so it doesn't take itself for Instagram.
 */
@Suppress("unused")
val changePackageNamePatch = bytecodePatch(
    name = "Change package name",
    description = "Gives the patched Threads its own package name, so it installs beside the Threads " +
        "you already have instead of over it. It's a separate app with its own sign-in. It isn't " +
        "selected by default. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Fixes")
    dependsOn(settingsPatch, threadsExtensionPatch, changePackageNameManifestPatch)
    compatibleWith(*AppCompatibilities.threads())

    val packageName by stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE,
        title = "Package name",
        description = "The copy's package name. Each copy needs its own.",
        required = true,
    ) { isCopyPackage(it) }

    execute {
        renameTo = packageName!!
        val routed = routeOwnAuthorities(CHANGE_PACKAGE_NAME, THREADS_PACKAGE, stockAuthorities)
        if (routed == 0) throw PatchException("$CHANGE_PACKAGE_NAME: Threads' code no longer names any of its own providers")
        patchLog.info("$CHANGE_PACKAGE_NAME: $routed of Threads' own provider addresses now follow the running package.")
        val check = countCopyAsThreads()
        patchLog.info("$CHANGE_PACKAGE_NAME: the copy passes Threads' own package check ($check).")
        enableStatus("changePackageName")
    }
}

/** The extension call Threads' own package check asks first. */
internal const val OWN_PACKAGE_CALL = "$EXTENSION_PACKAGE/coexist/OwnAuthorities;->isRunningCopy(Ljava/lang/String;)Z"

/** Threads' debug build's package, the other name its own package check accepts. */
internal const val THREADS_DEBUG_PACKAGE = "$THREADS_PACKAGE.debug"

/**
 * A copy passes Threads' check for its own package. Threads compares a package name, usually its
 * own from the context, with its release and debug packages, and about eighty places act on the
 * answer. A copy under another package failed it and took itself for Instagram: Pando read Threads'
 * queries with Instagram's schema and couldn't find their documents, so replies came back without
 * parts their parsers require, and the app crashed seconds after the feed opened. The check now
 * asks the extension first, which answers yes only for the running copy's own package.
 *
 * The check is the one static method taking a String and answering a boolean that loads both of
 * Threads' package names. Answers its signature, for the log.
 */
internal fun BytecodePatchContext.countCopyAsThreads(): String {
    val checks = classDefByStrings(THREADS_DEBUG_PACKAGE, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { classDef -> classDef.methods.filter { it.isOwnPackageCheck() } }
    val check = checks.singleOrNull()
        ?: throw PatchException("$CHANGE_PACKAGE_NAME: expected one check of Threads' own package, found ${checks.size}")
    val method = mutableClassDefBy(check.definingClass).findMutableMethodOf(check)
    method.requireLocals(CHANGE_PACKAGE_NAME, 1)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { ${method.parameterRegister(0)} }, $OWN_PACKAGE_CALL
            move-result v0
            if-eqz v0, :threads
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("threads", method.getInstruction(0)),
    )
    return "${check.definingClass}->${check.name}"
}

/** A static (String)boolean that loads Threads' release and debug package names. */
internal fun Method.isOwnPackageCheck(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z") return false
    if (parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;")) return false
    val loaded = implementation?.instructions?.mapNotNull { it.loadedString() }?.toSet() ?: return false
    return THREADS_PACKAGE in loaded && THREADS_DEBUG_PACKAGE in loaded
}
