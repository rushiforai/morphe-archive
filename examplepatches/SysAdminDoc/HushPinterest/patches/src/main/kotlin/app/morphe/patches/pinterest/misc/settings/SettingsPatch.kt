/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.pinterest.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.PINTEREST_APPLICATION
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.ui.routeToastsToPinterest
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

internal const val ENTRY = "$EXTENSION_PACKAGE/settings/SettingsEntry;"

/**
 * The activity Pinterest's launcher opens: a splash screen with no history that routes to the home
 * activity or to sign-in. The launcher reaches it through an exported alias of the same name. A
 * manifest name is never obfuscated.
 */
internal const val MAIN_ACTIVITY = "Lcom/pinterest/activity/PinterestActivity;"

/** The manifest-named home activity that receives requests after the no-history launcher finishes. */
internal const val HOME_ACTIVITY = "Lcom/pinterest/activityLibrary/activity/task/activity/MainActivity;"

/** [MAIN_ACTIVITY] as the manifest writes it. */
internal const val MAIN_ACTIVITY_NAME = "com.pinterest.activity.PinterestActivity"

/**
 * The activity alias the settings patch adds for Android's App info page. Its name sits in the
 * extension's package, so it can't meet a component of Pinterest's own.
 */
internal const val SETTINGS_ALIAS_NAME = "app.hushpinterest.extension.pinterest.settings.OpenSettings"

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
 * Android's App info page for Pinterest show "Additional settings in the app". The alias opens
 * Pinterest's own launcher activity with that action, and the extension opens the settings from there.
 * The settings extension needs API 29, so the patched APK also declares that floor, preserving any
 * higher minimum Pinterest already requires.
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
            // Pinterest's activity isn't exported itself: its launcher entry is an exported alias of
            // the same name. An alias decides its own visibility, so the one added here is exported
            // and the activity is left as Pinterest declared it.
            val aliases = document.getElementsByTagName("activity-alias")
            if ((0 until aliases.length).any { (aliases.item(it) as Element).getAttribute("android:name") == SETTINGS_ALIAS_NAME }) {
                throw PatchException("AndroidManifest.xml already has $SETTINGS_ALIAS_NAME")
            }

            val sdkElements = document.getElementsByTagName("uses-sdk")
            if (sdkElements.length > 1) throw PatchException("AndroidManifest.xml has more than one uses-sdk element")
            val sdk = sdkElements.item(0) as? Element ?: document.createElement("uses-sdk").also {
                document.documentElement.insertBefore(it, document.documentElement.firstChild)
            }
            val stockMinSdk = if (!sdk.hasAttribute("android:minSdkVersion")) {
                1 // Android's default when a manifest declares no minimum.
            } else {
                sdk.getAttribute("android:minSdkVersion").toIntOrNull()?.takeIf { it > 0 }
                    ?: throw PatchException("AndroidManifest.xml has an invalid minSdkVersion")
            }
            sdk.setAttribute("android:minSdkVersion", maxOf(stockMinSdk, 29).toString())

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
        // Patcher 2.0 decodes only the files a patch asks for.
        decode("res/values/strings.xml")
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            if ((0 until strings.length).any { (strings.item(it) as Element).getAttribute("name") == NATIVE_SETTINGS_TITLE }) {
                throw PatchException("HushPinterest settings title already exists")
            }
            document.documentElement.appendChild(document.createElement("string").apply {
                setAttribute("name", NATIVE_SETTINGS_TITLE)
                setAttribute("translatable", "false")
                textContent = "HushPinterest"
            })
        }
    }
}

/**
 * Makes the HushPinterest screen reachable four ways. Its owned row opens it from native settings.
 * Inside Pinterest, a long press on the
 * Pinterest logo at the top of the home feed opens it (see [hookLogoLongPress]). From the home
 * screen, a long-press shortcut on Pinterest's launcher icon opens Pinterest with an extra; from
 * Android's App info page for Pinterest, "Additional settings in the app" opens it with
 * [APPLICATION_PREFERENCES]. The launcher reports its startup intent, and both it and the home activity
 * report new intents. The screen opens over the next Pinterest activity to resume. Apart from the
 * logo's header, found by its R field, every name hooked here is a manifest component or a framework
 * override or call. It also has
 * HushPinterest's messages show as Pinterest's own toasts, which only fills in extension stubs.
 */
@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "HushPinterest settings",
    description = "Adds a HushPinterest page to Pinterest where you turn features on or off, pause HushPinterest, " +
        "back up your settings and read the licenses. Open it from Pinterest's settings, or by long-pressing " +
        "the Pinterest logo at the top of your home feed, the Home button in the bottom bar or Pinterest's app icon. " +
        "Works as soon as you patch it in, with no switch.",
    default = true,
) {
    category("Settings")
    dependsOn(pinterestExtensionPatch, settingsManifestPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        hookNativeSettingsEntry()
        // Before each return of the application's onCreate, after Pinterest's own startup: the
        // extension registers activity lifecycle callbacks there, and that's only safe once Pinterest
        // has set itself up.
        val applicationOnCreate = declaredInHierarchy(PINTEREST_APPLICATION, "onCreate")
        val returns = applicationOnCreate.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("$PINTEREST_APPLICATION.onCreate never returns")
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
        // The no-history launcher disappears after startup. Warm requests can go straight to the
        // home activity, whose own override is outside the launcher's inheritance chain.
        listOf(MAIN_ACTIVITY, HOME_ACTIVITY)
            .map { declaredInHierarchy(it, "onNewIntent", "Landroid/content/Intent;") }
            .distinct()
            .forEach { method ->
                method.addInstruction(
                    0,
                    "invoke-static/range { p0 .. p1 }, $ENTRY->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V",
                )
            }

        // Pinterest pushes its own shortcuts at rank 0, and the newest push goes first, so the
        // shortcut above could end up last, where a launcher that shows only a few cuts it off.
        // Each of those calls now goes through the extension, which puts it back in front
        // afterwards. Framework names only, which the obfuscator keeps.
        rerouteShortcutCalls()

        // HushPinterest's messages as Pinterest's own toasts. Only the extension's stubs change,
        // and a build whose toast code reads differently keeps Android toasts.
        routeToastsToPinterest()

        // The Pinterest logo at the top of the home feed: once Pinterest finds the header it sits
        // in, the extension gives the logo a long press that opens the screen. A build that finds
        // the header differently keeps its logo as it was.
        hookLogoLongPress()

        // The Home tab in the bottom bar: its long press opens the screen too (#48). The other
        // tabs keep Pinterest's, and a build that builds its tabs differently keeps them all.
        hookHomeTabLongPress()
    }
}
