package app.morphe.patches.shared.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.all.misc.resources.addAppResources
import app.morphe.patches.all.misc.resources.addResourcesPatch
import app.morphe.patches.shared.misc.settings.preference.BasePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.getNode
import app.morphe.util.insertFirst
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.w3c.dom.Node

const val MORPHE_SETTINGS_INTENT = "morphe_settings_intent"

private var lightThemeColor : String? = null
private var darkThemeColor : String? = null

/**
 * Sets the default theme colors used in various Morphe specific settings menus.
 * By default, these colors are white and black, but instead can be set to the
 * same color the target app uses for its own settings.
 */
fun overrideThemeColors(lightThemeColorString: String?, darkThemeColorString: String) {
    lightThemeColor = lightThemeColorString
    darkThemeColor = darkThemeColorString
}

private val settingsColorPatch = bytecodePatch {
    finalize {
        lightThemeColor?.let { ThemeLightColorResourceNameFingerprint.method.returnEarly(it) }
        darkThemeColor?.let { ThemeDarkColorResourceNameFingerprint.method.returnEarly(it) }
    }
}

/**
 * A resource patch that adds settings to a settings fragment.
 *
 * @param rootPreferences List of intent preferences and the name of the fragment file to add it to.
 *                        File names that do not exist are ignored and not processed.
 * @param preferences A set of preferences to add to the Morphe fragment.
 */
fun settingsPatch (
    rootPreferences: List<Pair<BasePreference, String>>? = null,
    preferences: Set<BasePreference>,
) = resourcePatch {
    dependsOn(
        addResourcesPatch,
        settingsColorPatch
    )

    execute {
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
                // CustomListPreference resources.
                "morphe_ic_dialog_alert.xml",
                // Search resources.
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
                // Color picker.
                "morphe_color_dot_widget.xml",
                "morphe_color_picker.xml",
                // Search.
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

    finalize {
        fun Node.addPreference(preference: BasePreference) {
            preference.serialize(ownerDocument) { _ ->
            }.let { preferenceNode ->
                insertFirst(preferenceNode)
            }
        }

        // Add the root preference to an existing fragment if needed.
        rootPreferences?.let {
            var modified = false

            it.forEach { (intent, fileName) ->
                val preferenceFileName = "res/xml/$fileName.xml"
                if (get(preferenceFileName).exists()) {
                    document(preferenceFileName).use { document ->
                        document.getNode("PreferenceScreen").addPreference(intent)
                    }
                    modified = true
                }
            }

            if (!modified) throw PatchException("No declared preference files exists: $rootPreferences")
        }

        // Add all preferences to the Morphe fragment.
        document("res/xml/morphe_prefs_icons.xml").use { document ->
            val morphePreferenceScreenNode = document.getNode("PreferenceScreen")
            preferences.forEach { morphePreferenceScreenNode.addPreference(it) }
        }

        // Because the icon preferences require declaring a layout resource,
        // there is no easy way to change to the Android default preference layout
        // after the preference is inflated.
        // Using two different preference files is the simplest and most robust solution.
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

        // Bold icons.
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
}

private const val BASE_ACTIVITY_HOOK_CLASS = "Lapp/morphe/extension/shared/settings/BaseActivityHook;"

/**
 * Modifies the activity to show Morphe settings instead of its original purpose.
 */
context(patchContext: BytecodePatchContext)
fun modifyActivityForSettingsInjection(
    activityOnCreateFingerprint: Fingerprint,
    extensionClassType: String,
    isYouTubeMusic: Boolean
) {
    val activityOnCreateClass = activityOnCreateFingerprint.classDef
    val activityOnCreateMethod = activityOnCreateFingerprint.method

    // Modify Activity and remove all existing layout code.
    // Must modify an existing activity and cannot add a new activity to the manifest,
    // as that fails for root installations.
    activityOnCreateMethod.addInstructions(
        0,
        """
            invoke-super { p0, p1 }, ${activityOnCreateClass.superclass}->onCreate(Landroid/os/Bundle;)V
            invoke-static { p0 }, $extensionClassType->initialize(Landroid/app/Activity;)V
            return-void
        """
    )

    // Remove other methods as they will break as the onCreate method is modified above.
    activityOnCreateClass.apply {
        methods.removeIf { it != activityOnCreateMethod && !MethodUtil.isConstructor(it) }
    }

    // Override base context to allow using Morphe specific settings.
    ImmutableMethod(
        activityOnCreateClass.type,
        "attachBaseContext",
        listOf(ImmutableMethodParameter("Landroid/content/Context;", null, null)),
        "V",
        AccessFlags.PROTECTED.value,
        null,
        null,
        MutableMethodImplementation(3),
    ).toMutable().apply {
        addInstructions(
            0,
            """
                invoke-static { p1 }, $BASE_ACTIVITY_HOOK_CLASS->getAttachBaseContext(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
                invoke-super { p0, p1 }, ${activityOnCreateClass.superclass}->attachBaseContext(Landroid/content/Context;)V
                return-void
            """
        )
    }.let(activityOnCreateClass.methods::add)

    // Override finish() to intercept back gesture.
    ImmutableMethod(
        activityOnCreateClass.type,
        if (isYouTubeMusic) "finish" else "onBackPressed",
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(3),
    ).toMutable().apply {
        // Slightly different hooks are needed, otherwise the back button can behave wrong.
        val extensionMethodName = if (isYouTubeMusic) "handleFinish" else "handleBackPress"
        val invokeFinishOpcode = if (isYouTubeMusic) "invoke-super" else "invoke-virtual"

        addInstructions(
            0,
            """
                invoke-static {}, $extensionClassType->$extensionMethodName()Z
                move-result v0
                if-nez v0, :search_handled
                $invokeFinishOpcode { p0 }, Landroid/app/Activity;->finish()V
                :search_handled
                return-void
            """
        )
    }.let(activityOnCreateClass.methods::add)
}

