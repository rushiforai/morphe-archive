package app.nogoogle.gboard.patches

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Features ported from jasonwu1994's Gboard-patches (https://github.com/jasonwu1994/Gboard-patches,
// GPLv3): the ones that only override feature flags, by name, so they work on 18.2.4 too. Each patch
// only marks its feature as included; PortedFeatures applies it through the shared flag hook.

private const val CREDIT = " Ported from jasonwu1994/Gboard-patches (GPLv3)."

/** The "Gboard patches" entry in Gboard's settings, added once any ported feature is selected. */
private val gboardPatchesEntryPatch = resourcePatch {
    dependsOn(extensionPatch, modMenuActivityPatch)

    finalize {
        addSettingsEntry("nogoogle_gboard_patches", "Gboard patches",
            "Extra features from jasonwu1994's Gboard-patches", "gboard_patches")
    }
}

private fun portedFeature(id: String, name: String, description: String, vararg also: Patch<*>) = resourcePatch(
    name = name,
    description = description + CREDIT,
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch, flagHookPatch, gboardPatchesEntryPatch, *also)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            val meta = doc.createElement("meta-data")
            meta.setAttributeNS(ANDROID_NS, "android:name", "app.nogoogle.feature.$id")
            meta.setAttributeNS(ANDROID_NS, "android:value", "true")
            app.appendChild(meta)
        }
    }
}

// Names and descriptions as in Gboard-patches, all selected by default as there (same ids as
// PortedFeatures.ALL, which also holds his defaults for the switches).

@Suppress("unused")
val emojiSizePatch = portedFeature("emoji_size", "Change emoji size",
    "Enables Gboard's emoji size setting.")

@Suppress("unused")
val cursorTrackpadPatch = portedFeature("cursor_trackpad", "Enable cursor trackpad mode",
    "Enables the long-press-spacebar trackpad, cursor lock mode, and the required scrub-move preference.")

@Suppress("unused")
val keyShapePatch = portedFeature("key_shape", "Key Shape Selection",
    "Enables the Key shape option inside theme details without forcing rounded keys by default.")

@Suppress("unused")
val closeProactivePatch = portedFeature("close_proactive", "Close Proactive Suggestions",
    "Shows a dismiss button in the proactive suggestions bar.")

@Suppress("unused")
val quickInsertPatch = portedFeature("quick_insert", "Quick Insert",
    "Enables the Quick Insert panel and toolbar access point.")

@Suppress("unused")
val inlineAutofillPatch = portedFeature("inline_autofill", "Enable Inline Autofill Suggestions",
    "Enables inline autofill suggestions in supported contexts.")

@Suppress("unused")
val accessPointsMenuPatch = portedFeature("access_points_menu", "Access Points menu style",
    "Lets you switch between the new and legacy Access Points menu styles.")

@Suppress("unused")
val toolbarCountPatch = portedFeature("toolbar_count", "Top Toolbar Item Count",
    "Lets you customize the top toolbar item count.", toolbarCapacityPatch)

@Suppress("unused")
val clipboardLimitPatch = portedFeature("clipboard_limit", "Clipboard Custom Character Limit",
    "Lets you set the maximum number of characters stored for each text clipboard item, " +
        "with Gboard's stock 20,000-character limit as the default.")
