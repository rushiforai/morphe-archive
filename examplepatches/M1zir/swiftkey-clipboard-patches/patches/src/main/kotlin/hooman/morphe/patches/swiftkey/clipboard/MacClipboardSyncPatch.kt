package hooman.morphe.patches.swiftkey.clipboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import hooman.morphe.patches.swiftkey.swiftKeyCompatibility
import org.w3c.dom.Element

private const val KEYBOARD_SERVICE = "Lcom/touchtype/KeyboardService;"
private const val SYNC = "Lapp/morphe/extension/swiftkey/MacClipboardSync;"
private const val SETTINGS_ACTIVITY = "app.morphe.extension.swiftkey.MacClipboardSettingsActivity"

private fun keyboardServiceMethod(name: String) = Fingerprint(
    definingClass = KEYBOARD_SERVICE, name = name, returnType = "V", parameters = emptyList(),
)

private val macClipboardSyncResources = resourcePatch {
    compatibleWith(swiftKeyCompatibility)
    execute {
        // Material "content paste" outline, tinted with the theme's text colour like the toolbar entry.
        get("res/drawable/mac_clipboard_sync_icon.xml").apply { parentFile.mkdirs() }.writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp"
                android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="?android:attr/textColorPrimary"
                    android:pathData="M16,4h-1.18C14.4,2.84 13.3,2 12,2s-2.4,0.84 -2.82,2H8C6.9,4 6,4.9 6,6v14c0,1.1 0.9,2 2,2h8c1.1,0 2,-0.9 2,-2V6c0,-1.1 -0.9,-2 -2,-2zM12,4c0.55,0 1,0.45 1,1s-0.45,1 -1,1 -1,-0.45 -1,-1 0.45,-1 1,-1zM16,20H8V6h1v2h6V6h1v14z"/>
            </vector>
        """.trimIndent())
        document("res/values/strings.xml").use { doc ->
            val root = doc.documentElement
            for ((name, value) in mapOf(
                "mac_clipboard_sync_title" to "Mac clipboard sync",
                "mac_clipboard_sync_summary" to "Copied text appears on your Mac, and the Mac's text here",
            )) {
                if ((0 until root.childNodes.length).any {
                    (root.childNodes.item(it) as? Element)?.getAttribute("name") == name
                }) throw PatchException("Mac clipboard sync already patched: $name")
                root.appendChild(doc.createElement("string").apply { setAttribute("name", name); textContent = value })
            }
        }
        document("AndroidManifest.xml").use { doc ->
            val apps = doc.getElementsByTagName("application")
            if (apps.length != 1) throw PatchException("Expected one SwiftKey application")
            apps.item(0).appendChild(doc.createElement("activity").apply {
                setAttribute("android:name", SETTINGS_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:label", "@string/mac_clipboard_sync_title")
                setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                setAttribute("android:parentActivityName", "com.touchtype.materialsettingsx.NavigationActivity")
            })
        }
        document("res/xml/prefsx_home_screen.xml").use { doc ->
            val preference = doc.createElement("Preference").apply {
                setAttribute("android:key", "swiftkey_mac_clipboard_sync")
                setAttribute("android:title", "@string/mac_clipboard_sync_title")
                setAttribute("android:summary", "@string/mac_clipboard_sync_summary")
                setAttribute("android:icon", "@drawable/mac_clipboard_sync_icon")
                setAttribute("android:persistent", "false")
                appendChild(doc.createElement("intent").apply {
                    setAttribute("android:targetPackage", "com.touchtype.swiftkey")
                    setAttribute("android:targetClass", SETTINGS_ACTIVITY)
                })
            }
            val root = doc.documentElement
            val anchor = (0 until root.childNodes.length).mapNotNull { root.childNodes.item(it) as? Element }
                .singleOrNull { it.getAttribute("android:key") == "@string/pref_home_launch_layout_and_keys_prefs" }
                ?: throw PatchException("SwiftKey layout/settings preference changed")
            root.insertBefore(preference, anchor.nextSibling)
        }
    }
}

/**
 * The default keyboard may read the clipboard in the background, so a listener in KeyboardService
 * sees every copy without an overlay, Accessibility service or root.
 */
@Suppress("unused")
val macClipboardSyncPatch = bytecodePatch(
    name = "Mac clipboard sync",
    description = "Sends text you copy to a paired Mac running SyncClipboard, and puts text copied on the Mac " +
        "on the phone's clipboard while the keyboard is open. Uses HTTPS with a pinned certificate key over " +
        "Wi-Fi or Tailscale. Pair once in SwiftKey settings. Skips clips Android marks as sensitive.",
    default = false,
) {
    compatibleWith(swiftKeyCompatibility)
    dependsOn(macClipboardSyncResources)
    extendWith("extensions/swiftkey.mpe")
    execute {
        for ((method, hook) in listOf(
            "onCreate" to "invoke-static {p0}, $SYNC->start(Landroid/content/Context;)V",
            "onDestroy" to "invoke-static {}, $SYNC->stop()V",
            "onWindowShown" to "invoke-static {}, $SYNC->shown()V",
            "onWindowHidden" to "invoke-static {}, $SYNC->hidden()V",
        )) {
            keyboardServiceMethod(method).method.addInstructions(0, hook)
        }
    }
}
