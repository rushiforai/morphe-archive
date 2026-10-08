package app.template.patches.iptvremote.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IPTVREMOTE
import app.morphe.util.returnEarly
import org.w3c.dom.Element

private const val STUB_PACKAGE = "ru.iptvremote.android.iptv.preference."
private const val PRO_PREFERENCE_STUB = STUB_PACKAGE + "ProPreferenceStub"
private const val PRO_CHECKBOX_STUB = STUB_PACKAGE + "ProCheckBoxPreferenceStub"
private const val RESET_PIN_KEY = "access_control_reset_parental_control_pin_code"
private const val PLAYLISTS_ACTIVITY = "ru.iptvremote.android.iptv.PlaylistsActivity"
private const val PLAYLISTS_SCREEN_KEY = "screen_playlists"
private const val RESET_PIN_PREFERENCE =
    "ru.iptvremote.android.iptv.common.preference.ResetAccessControlPreference"

/**
 * The free build declares the Pro-only settings as stub preferences whose only behaviour is
 * opening the IPTV Pro Play Store listing. The access-control (parental PIN) feature itself
 * ships in the free app: AccessControlPreferenceFragment wires the PIN dialog to these keys
 * and the lock checks read them. Swapping the stubs in the access-control screen for the
 * real preference classes makes the feature usable. The other stubs (start on boot,
 * autoplay last channel) have no implementation in the free build and stay as Pro links.
 */
private val accessControlResourcePatch = resourcePatch {
    execute {
        val target = get("res/xml").listFiles()
            ?.filter { it.extension == "xml" }
            ?.firstOrNull { it.readText().contains(RESET_PIN_KEY) }
            ?: throw PatchException("Access control preference screen not found")

        var replaced = 0
        document(target.absolutePath).use { doc ->
            val stubs = mutableListOf<Element>()
            val nodes = doc.getElementsByTagName("*")
            for (i in 0 until nodes.length) {
                val node = nodes.item(i) as? Element ?: continue
                if (node.tagName == PRO_PREFERENCE_STUB || node.tagName == PRO_CHECKBOX_STUB) stubs += node
            }
            stubs.forEach { node ->
                val replacement = when {
                    node.getAttribute("android:key") == RESET_PIN_KEY -> RESET_PIN_PREFERENCE
                    node.tagName == PRO_CHECKBOX_STUB -> "CheckBoxPreference"
                    else -> "Preference"
                }
                doc.renameNode(node, null, replacement)
                replaced++
            }
        }
        if (replaced == 0) throw PatchException("No Pro stubs found in ${target.name}")

        // "Lock playlist settings" works by attaching a PIN locker to the main settings entry
        // keyed "screen_playlists" (AbstractSettingsFragment.setupAccessControlScreen), but the
        // free build ships that entry without a key, so the lock was never enforced. Give the
        // entry that opens PlaylistsActivity the key the app looks up.
        val settings = get("res/xml").listFiles()
            ?.filter { it.extension == "xml" }
            ?.firstOrNull { it.readText().let { text -> text.contains(PLAYLISTS_ACTIVITY) && text.contains("screen_access_control") } }
            ?: throw PatchException("Main settings screen not found")
        var keyed = false
        document(settings.absolutePath).use { doc ->
            val intents = doc.getElementsByTagName("intent")
            for (i in 0 until intents.length) {
                val intent = intents.item(i) as? Element ?: continue
                if (intent.getAttribute("android:targetClass") != PLAYLISTS_ACTIVITY) continue
                val screen = intent.parentNode as? Element ?: continue
                if (screen.getAttribute("android:key").isEmpty()) screen.setAttribute("android:key", PLAYLISTS_SCREEN_KEY)
                keyed = screen.getAttribute("android:key") == PLAYLISTS_SCREEN_KEY
            }
        }
        if (!keyed) throw PatchException("Could not key the Playlists settings entry")
    }
}

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Pro-only access control settings (parental PIN, locking " +
            "playlist/EPG/proxy/import-export/recording settings, hiding playlist URLs) and " +
            "suppresses the in-app review prompt. Start on boot and autoplay last channel are " +
            "only implemented in the separate IPTV Pro app and stay unavailable."
) {
    compatibleWith(COMPATIBILITY_IPTVREMOTE)

    dependsOn(accessControlResourcePatch)

    execute {
        // "Was an ad closed in the last 20 minutes" check; its only caller skips the Play
        // in-app review prompt when it returns true.
        IptvFreeApplicationIsProFingerprint.method.returnEarly(value = true)
    }
}
