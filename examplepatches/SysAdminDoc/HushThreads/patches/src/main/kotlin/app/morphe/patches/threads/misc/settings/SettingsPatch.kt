/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.THREADS_APPLICATION
import app.morphe.patches.threads.misc.extension.patchLog
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

internal const val ENTRY = "$EXTENSION_PACKAGE/settings/SettingsEntry;"

/** The activity Threads' launcher opens. A manifest name is never obfuscated. */
internal const val MAIN_ACTIVITY = "Lcom/instagram/barcelona/mainactivity/BarcelonaActivity;"

/** [MAIN_ACTIVITY] as the manifest writes it. */
internal const val MAIN_ACTIVITY_NAME = "com.instagram.barcelona.mainactivity.BarcelonaActivity"

/**
 * The activity alias the settings patch adds for Android's App info page. Its name sits in the
 * extension's package, so it can't meet a component of Threads' own.
 */
internal const val SETTINGS_ALIAS_NAME = "app.morphe.extension.hushthreads.settings.OpenSettings"

/** The intent Android's App info page sends to "Additional settings in the app". */
internal const val APPLICATION_PREFERENCES = "android.intent.action.APPLICATION_PREFERENCES"

/**
 * The first class in [type]'s hierarchy, as far as the APK carries it, that declares this
 * method with a body.
 */
internal fun BytecodePatchContext.declaredInHierarchy(
    type: String,
    name: String,
    vararg parameters: String,
): MutableMethod = superclassChain(type)
    .mapNotNull { mutableClassDefByOrNull(it) }
    .firstNotNullOfOrNull { classDef ->
        classDef.methods.singleOrNull { method ->
            method.name == name && method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map { it.toString() } == parameters.toList()
        }
    } ?: throw PatchException("No class of $type's hierarchy declares $name(${parameters.joinToString("")})V")

/**
 * Adds an alias of [MAIN_ACTIVITY] that answers [APPLICATION_PREFERENCES], which is what makes
 * Android's App info page for Threads show "Additional settings in the app". The alias opens
 * Threads' own launcher activity with that action, and the extension opens the settings from there.
 * Nothing of Threads' own manifest changes.
 */
internal val settingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no application element")
            val activities = document.getElementsByTagName("activity")
            val main = (0 until activities.length).map { activities.item(it) as Element }
                .singleOrNull { it.getAttribute("android:name") == MAIN_ACTIVITY_NAME }
                ?: throw PatchException("AndroidManifest.xml doesn't declare $MAIN_ACTIVITY_NAME")
            if (main.getAttribute("android:exported") != "true") {
                throw PatchException("$MAIN_ACTIVITY_NAME isn't exported, so Android's App info page couldn't open it")
            }
            val aliases = document.getElementsByTagName("activity-alias")
            if ((0 until aliases.length).any { (aliases.item(it) as Element).getAttribute("android:name") == SETTINGS_ALIAS_NAME }) {
                throw PatchException("AndroidManifest.xml already has $SETTINGS_ALIAS_NAME")
            }

            val alias = document.createElement("activity-alias").apply {
                setAttribute("android:name", SETTINGS_ALIAS_NAME)
                setAttribute("android:targetActivity", MAIN_ACTIVITY_NAME)
                setAttribute("android:exported", "true")
            }
            val filter = document.createElement("intent-filter")
            filter.appendChild(document.createElement("action").apply { setAttribute("android:name", APPLICATION_PREFERENCES) })
            filter.appendChild(
                document.createElement("category").apply { setAttribute("android:name", "android.intent.category.DEFAULT") },
            )
            alias.appendChild(filter)
            application.appendChild(alias)
        }
    }
}

/**
 * Makes the HushThreads screen reachable three ways. From the home screen, a long-press shortcut on
 * Threads' launcher icon opens Threads with an extra; from Android's App info page for Threads,
 * "Additional settings in the app" opens it with [APPLICATION_PREFERENCES]. Threads' launcher
 * activity reports its intent, and the screen opens over the next Threads activity to resume.
 * Every name used for those is a manifest component or a framework override or call. Inside
 * Threads, a HushThreads row above More settings in Threads' own settings opens it too
 * ([addThreadsSettingsRow]), found by Compose's notes and the settings list's enum names.
 */
@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "HushThreads settings",
    description = "Adds HushThreads settings to Threads. Tap HushThreads above More settings in Threads' " +
        "own settings, long-press Threads' launcher icon, or open Additional settings in the app on " +
        "Threads' App info page, to turn features on or off, pause " +
        "HushThreads, save your switches to a file or load them, and export diagnostics. The licenses " +
        "are there too.",
    default = true,
) {
    category("Settings")
    dependsOn(threadsExtensionPatch, settingsManifestPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        // Before each return of the application's onCreate, after Threads' own startup: the
        // extension registers activity lifecycle callbacks there, and that's only safe once Threads
        // has set itself up.
        val applicationOnCreate = declaredInHierarchy(THREADS_APPLICATION, "onCreate")
        val returns = applicationOnCreate.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("$THREADS_APPLICATION.onCreate never returns")
        returns.asReversed().forEach { index ->
            applicationOnCreate.addInstruction(
                index,
                "invoke-static/range { p0 .. p0 }, $ENTRY->onApplicationCreate(Landroid/content/Context;)V",
            )
        }

        declaredInHierarchy(MAIN_ACTIVITY, "onCreate", "Landroid/os/Bundle;").addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $ENTRY->onActivityCreate(Landroid/app/Activity;)V",
        )
        declaredInHierarchy(MAIN_ACTIVITY, "onNewIntent", "Landroid/content/Intent;").addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $ENTRY->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V",
        )

        // Threads pushes its own shortcuts at rank 0, and the newest push goes first, so the
        // shortcut above could end up last, where a launcher that shows only a few cuts it off.
        // Each of those calls now goes through the extension, which puts it back in front
        // afterwards. Framework names only, which the obfuscator keeps.
        rerouteShortcutCalls()

        // Every patch depends on this one, and HushThreads still opens from its launcher shortcut
        // and App info without the row, so a build the row doesn't fit gets the rest of this patch
        // and a warning saying why. The row checks everything before it writes anything.
        try {
            addThreadsSettingsRow()
        } catch (e: PatchException) {
            patchLog.warning("${e.message} The HushThreads row is left out of Threads' settings; HushThreads still opens from its launcher shortcut and App info.")
        }
    }
}
