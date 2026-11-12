package app.template.patches.pdb.tweaks

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.Fingerprint
import app.template.patches.pdb.AppAttachBaseContextFingerprint
import app.template.patches.pdb.SettingsFragmentFingerprint
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val EXT_PREFIX = "Lapp/template/extension/pdb/"
private const val INIT_PROVIDER = "app.template.extension.pdb.PdbInitProvider"
private const val EXTRAS_ACTIVITY = "app.template.extension.pdb.PdbExtrasActivity"
private const val HISTORY_ACTIVITY = "app.template.extension.pdb.SoulHistoryActivity"
private const val SETTINGS_LAYOUT = "res/layout/fragment_app_setting.xml"
private const val ENTRY_ID = "morphe_extras_entry"

private fun Document.el(tag: String, vararg attrs: Pair<String, String>): Element =
    createElement(tag).apply { attrs.forEach { (k, v) -> setAttribute(k, v) } }

/**
 * Resource side of the Pdb Extras feature:
 *
 *  1. Injects a **"Morphe"** section with a *Pdb Extras* row at the very top of
 *     Pdb's own Settings screen (`res/layout/fragment_app_setting.xml`), styled like
 *     the surrounding `ActionCell` rows. The row opens the extension's full-screen
 *     extras settings (`[EXTRAS_ACTIVITY]`), so no hidden gestures are needed.
 *  2. Registers the extension's startup [INIT_PROVIDER] and the extras activity.
 *
 * The switches themselves live inside the extras screen (framework `Switch`
 * widgets) instead of Pdb's Tweaks preference list: Pdb's Tweaks host fragment
 * supports no preference navigation, and this way the whole feature set is
 * reachable in one tap without the 4-tap-on-the-version-row gesture.
 */
@Suppress("unused")
val pdbExtrasResourcePatch = resourcePatch(
    name = "Pdb Extras \u2014 resources",
    description = "Adds the Pdb Extras entry to the Settings screen and registers the extension components.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        document(SETTINGS_LAYOUT).use { doc ->
            // The scroll content of the settings screen: the first vertical
            // LinearLayout inside the NestedScrollView, id @id/contentLayout.
            var contentLayout: Element? = null
            val linearLayouts = doc.getElementsByTagName("LinearLayout")
            for (i in 0 until linearLayouts.length) {
                val el = linearLayouts.item(i) as? Element ?: continue
                if (el.attributes.getNamedItem("android:id")?.nodeValue == "@id/contentLayout") {
                    contentLayout = el
                    break
                }
            }
            val content = requireNotNull(contentLayout) { "settings contentLayout not found" }

            // Section label + card, mirroring the surrounding sections' style.
            val label = doc.el(
                "pdb.app.base.wigets.PBDTextView",
                "android:textSize" to "14.0sp",
                "android:textColor" to "@color/gray_04",
                "android:layout_width" to "wrap_content",
                "android:layout_height" to "wrap_content",
                "android:layout_marginTop" to "24.0dip",
                "android:layout_marginStart" to "24.0dip",
                "android:text" to "Pdb Extras",
            )
            val card = doc.el(
                "LinearLayout",
                "android:orientation" to "vertical",
                "android:background" to "@drawable/content_bg_r8",
                "android:layout_width" to "fill_parent",
                "android:layout_height" to "wrap_content",
                "android:layout_marginTop" to "8.0dip",
                "android:layout_marginStart" to "12.0dip",
                "android:layout_marginEnd" to "12.0dip",
            )
            val entry = doc.el(
                "pdb.app.base.wigets.ActionCell",
                "android:id" to "@+id/$ENTRY_ID",
                "android:layout_width" to "fill_parent",
                "android:layout_height" to "wrap_content",
                "app:ac_show_arrow" to "true",
                "app:ac_show_divider" to "false",
                "app:ac_text" to "Pdb Extras \u2014 settings, tools & unlocks",
            )
            card.appendChild(entry)
            content.insertBefore(label, content.firstChild)
            content.insertBefore(card, content.firstChild.nextSibling)
        }

        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element

            val providers = doc.getElementsByTagName("provider")
            val providerPresent = (0 until providers.length).any {
                (providers.item(it) as? Element)
                    ?.attributes?.getNamedItem("android:name")?.nodeValue == INIT_PROVIDER
            }
            if (!providerPresent) {
                application.appendChild(
                    doc.el(
                        "provider",
                        "android:name" to INIT_PROVIDER,
                        "android:authorities" to "pdb.app.morphe.init",
                        "android:exported" to "false",
                        "android:initOrder" to "100",
                    ),
                )
            }

            val activities = doc.getElementsByTagName("activity")
            val activityPresent = (0 until activities.length).any {
                (activities.item(it) as? Element)
                    ?.attributes?.getNamedItem("android:name")?.nodeValue == EXTRAS_ACTIVITY
            }
            if (!activityPresent) {
                application.appendChild(
                    doc.el(
                        "activity",
                        "android:name" to EXTRAS_ACTIVITY,
                        // Not exported: Pdb Extras is opened only from the app's
                        // own Settings menu. Temporarily set to "true" when a
                        // signed-out emulator needs `adb shell am start`.
                        "android:exported" to "false",
                    ),
                )
            }
            val historyPresent = (0 until activities.length).any {
                (activities.item(it) as? Element)
                    ?.attributes?.getNamedItem("android:name")?.nodeValue == HISTORY_ACTIVITY
            }
            if (!historyPresent) {
                application.appendChild(
                    doc.el(
                        "activity",
                        "android:name" to HISTORY_ACTIVITY,
                        "android:exported" to "false",
                    ),
                )
            }
        }
    }
}

/**
 * Pdb Extras (bytecode side).
 *
 *  1. Early hook in `pdb.app.App.attachBaseContext(Context)` → the extension's
 *     startup routine applies every toggle to the app's own preference store
 *     (and force-writes the patch-time unlocks).
 *  2. Hooks the Settings screen fragment's `onViewCreated(View, Bundle)` — found
 *     through the stable ViewBinding debug string
 *     `getBinding()Lpdb/app/user/databinding/FragmentAppSettingBinding;`, then
 *     matched by the framework-stable method signature — and wires the injected
 *     "Pdb Extras" entry row to open the extras screen.
 *
 * The extras screen itself is injected by [pdbExtrasResourcePatch] (entry row +
 * manifest registration); premium and ad removal are forced by the `Unlock Pro`
 * and `Remove ads` patches and have no switch.
 */
@Suppress("unused")
val pdbExtrasPatch = bytecodePatch(
    name = "Pdb Extras feature menu",
    description = "Adds a single Pdb Extras entry to the top of Pdb's Settings screen.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    dependsOn(pdbExtrasResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Earliest hook: right after Application.attachBaseContext() has run.
        // `pdb.app.App.attachBaseContext(Context)` has `.locals 0` + one parameter,
        // so the inline-smali frame is `.registers 2` and `p1` == v1 (valid).
        // Injecting at index 1 keeps it after super.attachBaseContext(), so the base
        // context is attached and SharedPreferences are usable.
        AppAttachBaseContextFingerprint.method.addInstructions(
            1,
            "invoke-static {p1}, ${EXT_PREFIX}PdbStartup;->onAppCreate(Landroid/content/Context;)V",
        )

        // Settings screen entry row. The fragment class is obfuscated and changes
        // between releases, so anchor on the ViewBinding debug string and then pick
        // the onViewCreated override by its framework-stable signature.
        val fragment = SettingsFragmentFingerprint.matchOrNull()?.classDef
            ?: throw IllegalStateException("Pdb settings fragment not found")
        val onViewCreated = fragment.methods.firstOrNull {
            it.returnType == "V" &&
                it.parameterTypes == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        } ?: throw IllegalStateException("onViewCreated(View, Bundle) not found in settings fragment")

        onViewCreated.addInstructions(
            0,
            "invoke-static {p1}, ${EXT_PREFIX}SettingsEntryHook;->wire(Landroid/view/View;)V",
        )
    }
}
