package app.morphe.patches.music.misc.settings.prathxm

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.ClassDef
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.fix.openurllinks.removeLinkVerification
import app.morphe.patches.all.misc.packagename.setOrGetFallbackPackageName
import app.morphe.patches.all.misc.resources.addAppResources
import app.morphe.patches.all.misc.resources.addResourcesPatch
import app.morphe.patches.all.misc.resources.localesYouTube
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.patches.all.misc.resources.setAddResourceLocale
import app.morphe.patches.all.misc.updates.checkPatcherUpToDatePatch
import app.morphe.patches.music.misc.extension.hooks.youTubeMusicApplicationInitOnCreateHook
import app.morphe.patches.music.misc.extension.sharedExtensionPatch
import app.morphe.patches.music.shared.Constants.MUSIC_PACKAGE_NAME
import app.morphe.patches.music.misc.playservice.is_8_40_or_greater
import app.morphe.patches.music.misc.playservice.versionCheckPatch
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.shared.BoldIconsFeatureFlagFingerprint
import app.morphe.patches.shared.GoogleApiActivityOnCreateFingerprint
import app.morphe.patches.shared.misc.checks.experimentalAppNoticePatch
import app.morphe.patches.shared.misc.initialization.initializationPatch
import app.morphe.patches.shared.misc.settings.MORPHE_SETTINGS_INTENT
import app.morphe.patches.shared.misc.settings.preference.BasePreference
import app.morphe.patches.shared.misc.settings.preference.BasePreferenceScreen
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.patches.shared.misc.settings.preference.IntentPreference
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patches.shared.misc.settings.modifyActivityForSettingsInjection
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.copyXmlNode
import app.morphe.util.getNode
import app.morphe.util.inputStreamFromBundledResource
import app.morphe.util.insertFirst
import app.morphe.util.insertLiteralOverride
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val MUSIC_ACTIVITY_HOOK_CLASS = "Lapp/morphe/extension/prathxmpatches/settings/MusicActivityHook;"

private val preferences = mutableSetOf<BasePreference>()

private var isMainRepoPresent = false
private var isMainRepoScrobblingPresent = false

val prathxmSettingsResourcePatch = resourcePatch {
    dependsOn(
        resourceMappingPatch,
        addResourcesPatch,
        bytecodePatch {
            execute {
                classDefForEach { classDef ->
                    if (classDef.type == "Lapp/morphe/extension/music/settings/MusicActivityHook;") {
                        isMainRepoPresent = true
                    }
                    if (classDef.type == "Lapp/morphe/extension/music/patches/scrobbling/ScrobblePatch;") {
                        isMainRepoScrobblingPresent = true
                    }
                }
            }
        }
    )

    execute {
        // 1. Always register GoogleApiActivity if it is missing from the manifest
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = document.getElementsByTagName("activity")
            var gmsActivityExists = false
            for (i in 0 until activities.length) {
                val act = activities.item(i) as Element
                if (act.getAttribute("android:name") == "com.google.android.gms.common.api.GoogleApiActivity") {
                    gmsActivityExists = true
                    break
                }
            }
            if (!gmsActivityExists) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", "com.google.android.gms.common.api.GoogleApiActivity")
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:theme", "@style/Theme.AppCompat.DayNight.NoActionBar")
                activity.setAttribute("android:configChanges", "orientation|screenSize|keyboardHidden")
                application.appendChild(activity)
            }
        }

        if (!isMainRepoPresent) {
            // Standalone mode: we copy the base files
            addAppResources("shared")

            copyResources(
                "settings",
                ResourceGroup("xml",
                    "morphe_prefs.xml",
                    "morphe_prefs_icons.xml",
                    "morphe_prefs_icons_bold.xml"
                ),
                ResourceGroup("menu",
                    "morphe_search_menu.xml"
                ),
                ResourceGroup("drawable",
                    "morphe_ic_dialog_alert.xml",
                    "morphe_settings_arrow_time.xml",
                    "morphe_settings_arrow_time_bold.xml",
                    "morphe_settings_custom_checkmark.xml",
                    "morphe_settings_custom_checkmark_bold.xml",
                    "morphe_settings_search_icon.xml",
                    "morphe_settings_search_icon_bold.xml",
                    "morphe_settings_search_remove.xml",
                    "morphe_settings_search_remove_bold.xml",
                    "morphe_settings_toolbar_arrow_left.xml",
                    "morphe_settings_toolbar_arrow_left_bold.xml",
                ),
                ResourceGroup("layout",
                    "morphe_custom_list_item_checked.xml",
                    "morphe_icon_list_item.xml",
                    "morphe_color_dot_widget.xml",
                    "morphe_color_picker.xml",
                    "morphe_preference_search_history_item.xml",
                    "morphe_preference_search_history_screen.xml",
                    "morphe_preference_search_no_result.xml",
                    "morphe_preference_search_result_color.xml",
                    "morphe_preference_search_result_group_header.xml",
                    "morphe_preference_search_result_list.xml",
                    "morphe_preference_search_result_regular.xml",
                    "morphe_preference_search_result_switch.xml",
                    "morphe_settings_with_toolbar.xml"
                )
            )
        }

        // Always copy our addon's drawables & layouts
        copyResources(
            "settings",
            ResourceGroup("drawable",
                "morphe_settings_screen_00_about.xml",
                "morphe_settings_screen_00_about_bold.xml",
                "morphe_settings_screen_04_general.xml",
                "morphe_settings_screen_04_general_bold.xml",
                "morphe_settings_screen_11_misc.xml",
                "morphe_settings_screen_11_misc_bold.xml",
                "morphe_settings_music_screen_05_scrobbling.xml",
                "morphe_settings_music_screen_05_scrobbling_bold.xml",
                "morphe_settings_music_screen_06_discord.xml",
                "morphe_settings_music_screen_06_discord_bold.xml"
            ),
            ResourceGroup("layout",
                "morphe_preference_with_icon.xml"
            )
        )

        // Set the style for the Morphe settings to follow the style of the music settings,
        // namely: action bar height, menu item padding and remove horizontal dividers.
        val targetResource = "values/styles.xml"
        inputStreamFromBundledResource(
            "settings/music",
            targetResource,
        )!!.let { inputStream ->
            "resources".copyXmlNode(
                document(inputStream),
                document("res/$targetResource"),
            ).close()
        }

        // Remove horizontal dividers from the music settings.
        val styleFile = get("res/values/styles.xml")
        styleFile.writeText(
            styleFile.readText()
                .replace(
                    "allowDividerAbove\">true",
                    "allowDividerAbove\">false"
                ).replace(
                    "allowDividerBelow\">true",
                    "allowDividerBelow\">false"
                )
        )

        // Register DiscordOAuthActivity in the manifest
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = document.getElementsByTagName("activity")
            var exists = false
            for (i in 0 until activities.length) {
                val act = activities.item(i) as Element
                val name = act.getAttribute("android:name")
                if (name == "app.morphe.extension.prathxmpatches.discord.DiscordOAuthActivity") {
                    exists = true
                    break
                }
            }
            if (!exists) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", "app.morphe.extension.prathxmpatches.discord.DiscordOAuthActivity")
                activity.setAttribute("android:exported", "true")
                activity.setAttribute("android:launchMode", "singleTask")

                val intentFilter = document.createElement("intent-filter")

                val action = document.createElement("action")
                action.setAttribute("android:name", "android.intent.action.VIEW")
                intentFilter.appendChild(action)

                val categoryDefault = document.createElement("category")
                categoryDefault.setAttribute("android:name", "android.intent.category.DEFAULT")
                intentFilter.appendChild(categoryDefault)

                val categoryBrowsable = document.createElement("category")
                categoryBrowsable.setAttribute("android:name", "android.intent.category.BROWSABLE")
                intentFilter.appendChild(categoryBrowsable)

                val data = document.createElement("data")
                data.setAttribute("android:scheme", "morphediscord")
                data.setAttribute("android:host", "oauth2")
                data.setAttribute("android:path", "/callback")
                intentFilter.appendChild(data)

                activity.appendChild(intentFilter)
                application.appendChild(activity)
            }
        }
    }

    finalize {
        val packageName = document("AndroidManifest.xml").use { it.documentElement.getAttribute("package") }
        
        fun Node.addPreference(preference: BasePreference) {
            preference.serialize(ownerDocument) { _ ->
            }.let { preferenceNode ->
                insertFirst(preferenceNode)
            }
        }

        fun removeIconsAndLayout(preferences: Collection<BasePreference>, removeAllIconsAndLayout: Boolean) {
            preferences.forEach { preference ->
                preference.icon = null
                if (removeAllIconsAndLayout) {
                    preference.iconBold = null
                    preference.layout = null
                }

                if (preference is PreferenceCategory) {
                    removeIconsAndLayout(preference.preferences, removeAllIconsAndLayout)
                } else if (preference is PreferenceScreenPreference) {
                    removeIconsAndLayout(preference.preferences, removeAllIconsAndLayout)
                }
            }
        }

        if (!isMainRepoPresent) {
            // Standalone mode: we create a "Prathxm Patches" header in settings_headers.xml
            val headerPreference = IntentPreference(
                title = "Prathxm Patches",
                summaryKey = null,
                intent = newIntent(MORPHE_SETTINGS_INTENT),
            )
            
            val preferenceFileName = "res/xml/settings_headers.xml"
            if (get(preferenceFileName).exists()) {
                document(preferenceFileName).use { document ->
                    document.getNode("PreferenceScreen").addPreference(headerPreference)
                }
            }

            // Write all preferences to clean XMLs
            document("res/xml/morphe_prefs_icons.xml").use { document ->
                val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
                preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
            }

            removeIconsAndLayout(preferences, false)
            document("res/xml/morphe_prefs_icons_bold.xml").use { document ->
                val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
                preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
            }

            removeIconsAndLayout(preferences, true)
            document("res/xml/morphe_prefs.xml").use { document ->
                val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
                preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
            }
        } else {
            // Addon mode: we append our preferences directly to the existing XMLs
            // Write our preferences to existing morphe_prefs_icons.xml
            document("res/xml/morphe_prefs_icons.xml").use { document ->
                val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
                preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
            }

            removeIconsAndLayout(preferences, false)
            document("res/xml/morphe_prefs_icons_bold.xml").use { document ->
                val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
                preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
            }

            removeIconsAndLayout(preferences, true)
            document("res/xml/morphe_prefs.xml").use { document ->
                val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
                preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
            }
        }

        // Apply package name injection
        listOf("morphe_prefs.xml", "morphe_prefs_icons.xml", "morphe_prefs_icons_bold.xml", "settings_headers.xml").forEach { fileName ->
            val path = "res/xml/$fileName"
            if (get(path).exists()) {
                document(path).use { document ->
                    val intents = document.getElementsByTagName("intent")
                    for (i in 0 until intents.length) {
                        val intent = intents.item(i) as Element
                        if (intent.getAttribute("android:targetClass") == "com.google.android.gms.common.api.GoogleApiActivity") {
                            intent.setAttribute("android:targetPackage", packageName)
                        }
                    }
                }
            }
        }
    }
}

val prathxmSettingsPatch = bytecodePatch(
    description = "Adds settings for Morphe to YouTube Music.",
) {
    dependsOn(
        checkPatcherUpToDatePatch,
        sharedExtensionPatch,
        prathxmSettingsResourcePatch,
        addResourcesPatch,
        versionCheckPatch,
        removeLinkVerification,
        experimentalAppNoticePatch(
            mainActivityFingerprint = youTubeMusicApplicationInitOnCreateHook.fingerprint,
            recommendedAppVersion = COMPATIBILITY_YOUTUBE_MUSIC.targets.first { !it.isExperimental }.version!!
        ),
        initializationPatch(
            extensionPatch = sharedExtensionPatch
        )
    )

    execute {
        var mainActivityHookClassDef: ClassDef? = null
        classDefForEach { classDef ->
            if (classDef.type == "Lapp/morphe/extension/music/settings/MusicActivityHook;") {
                mainActivityHookClassDef = classDef
            }
        }

        setAddResourceLocale(localesYouTube)
        addAppResources("shared-youtube")
        addAppResources("music")

        if (!isMainRepoPresent) {
            // Standalone mode: add all preferences (About, General, Scrobbling, Discord, Misc)
            preferences += NonInteractivePreference(
                key = "morphe_settings_music_screen_0_about",
                summaryKey = null,
                icon = "@drawable/morphe_settings_screen_00_about",
                iconBold = "@drawable/morphe_settings_screen_00_about_bold",
                layout = "@layout/morphe_preference_with_icon",
                tag = "app.morphe.extension.shared.settings.preference.about.MorpheAboutPreference",
                selectable = true
            )

            PreferenceScreen.GENERAL.addPreferences(
                SwitchPreference("morphe_settings_search_history"),
                SwitchPreference("morphe_show_menu_icons")
            )

            PreferenceScreen.SCROBBLING.addPreferences()
            PreferenceScreen.DISCORD_RPC.addPreferences()

            PreferenceScreen.MISC.addPreferences(
                TextPreference(
                    key = null,
                    titleKey = "morphe_pref_import_export_title",
                    summaryKey = "morphe_pref_import_export_summary",
                    inputType = InputType.TEXT_MULTI_LINE,
                    tag = "app.morphe.extension.shared.settings.preference.ImportExportPreference",
                )
            )

            // Setup standalone activity hijacking
            modifyActivityForSettingsInjection(
                GoogleApiActivityOnCreateFingerprint,
                MUSIC_ACTIVITY_HOOK_CLASS,
                true
            )

            if (is_8_40_or_greater) {
                BoldIconsFeatureFlagFingerprint.let {
                    it.method.insertLiteralOverride(
                        it.instructionMatches.first().index,
                        "$MUSIC_ACTIVITY_HOOK_CLASS->useBoldIcons(Z)Z"
                    )
                }
            }
        } else {
            // Addon mode: we only add Discord RPC (and Scrobbling if main repo doesn't have it)
            if (!isMainRepoScrobblingPresent) {
                PreferenceScreen.SCROBBLING.addPreferences()
            }
            PreferenceScreen.DISCORD_RPC.addPreferences()

            // In addon mode, force-load our Settings class from the main repo's MusicActivityHook.initialize
            val mutableClass = mutableClassDefBy(mainActivityHookClassDef!!)
            val method = mainActivityHookClassDef!!.methods.firstOrNull { it.name == "initialize" }
            if (method != null) {
                val mutableMethod = mutableClass.findMutableMethodOf(method)
                mutableMethod.addInstruction(0, "const-class v0, Lapp/morphe/extension/prathxmpatches/settings/Settings;")
            }
        }
    }

    finalize {
        PreferenceScreen.close()
    }
}

fun getPatchedPackageName(fallbackPackageName: String): String {
    for (className in listOf(
        "app.morphe.patches.music.misc.gms.Constants",
        "app.morphe.patches.shared.misc.settings.SettingsPatchKt"
    )) {
        try {
            val siblingClass = Class.forName(className)
            val clazz = siblingClass.classLoader.loadClass("app.morphe.patches.all.misc.packagename.ChangePackageNamePatchKt")
            val method = clazz.getMethod("setOrGetFallbackPackageName", String::class.java)
            return method.invoke(null, fallbackPackageName) as String
        } catch (e: Throwable) {
        }
    }
    return setOrGetFallbackPackageName(fallbackPackageName)
}

/**
 * Creates an intent to open Morphe settings.
 */
fun newIntent(settingsName: String) = IntentPreference.Intent(
    data = settingsName,
    targetClass = "com.google.android.gms.common.api.GoogleApiActivity"
) {
    getPatchedPackageName(MUSIC_PACKAGE_NAME)
}

object PreferenceScreen : BasePreferenceScreen() {

    val GENERAL = Screen(
        key = "morphe_settings_music_screen_2_general",
        summaryKey = null,
        icon = "@drawable/morphe_settings_screen_04_general",
        iconBold = "@drawable/morphe_settings_screen_04_general_bold",
        layout = "@layout/morphe_preference_with_icon"
    )

    val SCROBBLING = Screen(
        key = "morphe_settings_music_screen_5_scrobbling",
        titleKey = "morphe_settings_music_screen_4_scrobbling_title",
        summaryKey = null,
        icon = "@drawable/morphe_settings_music_screen_05_scrobbling",
        iconBold = "@drawable/morphe_settings_music_screen_05_scrobbling_bold",
        layout = "@layout/morphe_preference_with_icon",
        sorting = Sorting.UNSORTED
    )

    val DISCORD_RPC = Screen(
        key = "morphe_settings_music_screen_6_discord_rpc",
        titleKey = "morphe_settings_music_screen_5_discord_rpc_title",
        summaryKey = null,
        icon = "@drawable/morphe_settings_music_screen_06_discord",
        iconBold = "@drawable/morphe_settings_music_screen_06_discord_bold",
        layout = "@layout/morphe_preference_with_icon",
        sorting = Sorting.UNSORTED
    )

    val MISC = Screen(
        key = "morphe_settings_music_screen_4_misc",
        summaryKey = null,
        icon = "@drawable/morphe_settings_screen_11_misc",
        iconBold = "@drawable/morphe_settings_screen_11_misc_bold",
        layout = "@layout/morphe_preference_with_icon"
    )

    override fun commit(screen: PreferenceScreenPreference) {
        preferences += screen
    }
}
