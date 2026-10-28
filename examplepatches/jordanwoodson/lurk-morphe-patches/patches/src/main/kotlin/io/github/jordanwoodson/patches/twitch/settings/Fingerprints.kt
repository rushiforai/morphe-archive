package io.github.jordanwoodson.patches.twitch.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

internal object BundleLoaderFingerprint : Fingerprint(
    name = "loadScriptFromAssets", returnType = "V",
    parameters = listOf("Landroid/content/res/AssetManager;", "Ljava/lang/String;", "Z"),
    filters = listOf(methodCall(
        definingClass = "Lcom/facebook/react/runtime/ReactInstance;",
        name = "access\$loadJSBundleFromAssets",
    )),
)

/** The last rows of Twitch's main Settings screen, in both of its versions, by their titles. */
private fun aboutRows() = listOf(
    resourceLiteral(ResourceType.STRING, "system"),
    resourceLiteral(ResourceType.STRING, "community_guidelines"),
    resourceLiteral(ResourceType.STRING, "help"),
    resourceLiteral(ResourceType.STRING, "terms_of_service"),
    resourceLiteral(ResourceType.STRING, "privacy_notice"),
)

/**
 * The Compose version of the main Settings screen (MainSettingsFragmentV2, signed in): the composable section
 * that draws System, Community Guidelines, Help, Terms of Service and Privacy Notice with one row composable.
 */
internal object SettingsAboutSectionFingerprint : Fingerprint(
    returnType = "V",
    filters = aboutRows(),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

/**
 * The list version of the main Settings screen (MainSettingsFragment, signed out): its presenter's list
 * builder, which adds a menu row model for each title to the screen's list.
 */
internal object SettingsMenuListFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = aboutRows() + methodCall(definingClass = "Ljava/util/ArrayList;", name = "add"),
    custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) },
)
