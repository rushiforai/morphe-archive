package io.github.jordanwoodson.patches.shared.apps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import io.github.jordanwoodson.patches.shared.compose.AppCode
import io.github.jordanwoodson.patches.shared.settings.SETTINGS_CLASS
import io.github.jordanwoodson.patches.shared.settings.SettingsScreen

/**
 * One app of the bundle, as the patches every app has see it: the hidden settings patch (and a React Native
 * app's bundle loader), Lurk icon, Clone app, Change app name and Remove tracking permissions. Each app's
 * folder declares those patches (name, description, whether selected by default) and builds their body
 * from here with the app's description in Apps.kt. What differs between the apps is a parameter of this
 * class or of the builder, never a check on which app it is.
 */
internal class LurkApp(
    /** The app's folder under patches/, which also starts its locator keys: `twitch`. */
    val slug: String,
    /** The app's `COMPATIBILITY_<APP>` from its shared/Constants.kt. */
    val compatibility: Compatibility,
    /** How the app's patches match a fingerprint: exactly once, or a PatchException naming `what`. */
    val matcher: BytecodePatchContext.(fingerprint: Fingerprint, what: String) -> Match,
    /** The type descriptor of the Application subclass the manifest names. */
    applicationClass: String,
    /** The static method taking the Application context that starts Lurk's settings, first in onCreate. */
    settingsInit: String = "$SETTINGS_CLASS->init(Landroid/content/Context;)V",
    /** Set for an app whose screens are React Native, with its JavaScript as a Hermes bundle in the assets. */
    val reactNative: ReactNative? = null,
    /** The launcher icon Lurk icon installs next to the app's own (the App icon choice picks one). */
    val icon: LauncherIcon,
    /** What Clone app renames besides the package and the names under it. */
    val cloneRules: List<CloneRule> = emptyList(),
    /** The `<uses-permission>` entries Remove tracking permissions takes out. Each must be in the manifest. */
    val trackingPermissions: Set<String>,
    /** The `<queries>` entries Remove tracking permissions takes out with them. */
    val trackingQueries: TrackingQueries = TrackingQueries(),
) {
    /** The launcher name as Constants.kt gives it ("Twitch"), for messages and the default app name. */
    val name: String = compatibility.name ?: throw IllegalArgumentException("$slug: the compatibility has no name")

    /** The original app's package name. */
    val packageName: String = compatibility.packageName
        ?: throw IllegalArgumentException("$slug: the compatibility has no package name")

    /** The newest version the patches target, for messages. Only shared/Constants.kt spells it. */
    val version: String get() = AppCode(compatibility).version

    /** The app's entries on the Lurk settings screen. Each patch that can be switched adds its own. */
    val settings = SettingsScreen(name)

    /** Application.onCreate, where the settings patch starts the extension. */
    val applicationOnCreate = ApplicationOnCreateFingerprint(applicationClass)

    /** The application class's simple name, for messages: `TwitchApplication`. */
    val applicationName = applicationClass.substringAfterLast('/').removeSuffix(";")

    /**
     * The static methods taking the Application context that the settings patch calls first in onCreate,
     * in order: the settings, then a React Native app's bundle loader.
     */
    val startup: List<String> =
        listOf(settingsInit) + listOfNotNull(reactNative?.let { "${it.bundleClass}->init(Landroid/content/Context;)V" })
}

/**
 * A React Native app's Hermes bundle loading: [bundleClass] is the extension class that prepares a patched
 * copy of the bundle (`init(Context)`, `prepare(AssetManager, String)`), [bundleLoader] the React Native method
 * that loads the bundle from the APK's assets.
 */
internal class ReactNative(val bundleClass: String, val bundleLoader: Fingerprint)
