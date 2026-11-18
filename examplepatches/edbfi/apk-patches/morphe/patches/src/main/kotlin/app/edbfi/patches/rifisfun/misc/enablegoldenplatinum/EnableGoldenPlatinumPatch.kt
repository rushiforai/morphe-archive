// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.enablegoldenplatinum

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.ads.disableads.AlbumAdapterFingerprint
import app.edbfi.patches.shared.Edit
import app.edbfi.patches.shared.returnEarlyEdit
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getMutableMethod
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Document
import org.w3c.dom.Element

// The pro checks this version has: tablet layout, cards, the native gallery and album viewers, custom themes and
// their scripts, moderator tools, Reddit's visited-links sync, synccit and new post notifications.
private const val PRO_CHECKS = 24

/**
 * The paid build is a package of its own; the free one has the same features while its "Ads & pro features" setting is
 * on. Each pro check asks both: here the package comparison passes, so the setting only switches ads, as the paid
 * build has none. The package name itself stays, as the account type, providers and push messages are keyed on it.
 * Synccit and new post notifications need servers that are gone: they stay off.
 */
internal val unlockPatch =
    patch {
        execute {
            val adsEnabled = settingGetter("ADS_ENABLED")
            val synccitEnabled = settingGetter("SYNCCIT_ENABLED").getMutableMethod()
            val backend = NewPostPushInitFingerprint.matchSingle().originalMethod.definingClass
            val newPostPush = NewPostPushAvailableFingerprint(backend).matchSingle().method
            val checks = proChecks(adsEnabled)
            val count = checks.sumOf { it.equals.size }
            if (count != PRO_CHECKS) throw PatchException("Expected $PRO_CHECKS pro checks, found $count")
            val albumAdapter = AlbumAdapterFingerprint.matchSingle().method
            val albumAdsOn = AlbumAdsEnabledFingerprint.matchSingle().originalMethod
            // Disable ads, if it ran first, makes it return the album's own adapter at once: no ads to leave out.
            val first = albumAdapter.implementation?.instructions?.firstOrNull()
            val adsRemoved = first?.opcode == Opcode.RETURN_OBJECT
            // It has no register of its own, and first overwrites its unused Activity parameter: the check can use that.
            val activity = (albumAdapter.implementation?.registerCount ?: 0) - 2
            if (!adsRemoved && (first?.opcode != Opcode.NEW_INSTANCE || (first as OneRegisterInstruction).registerA != activity)) {
                throw PatchException("${albumAdapter.name} doesn't start by overwriting its Activity parameter")
            }
            val builtWithAds = builtWithAdsChecks()
            if (builtWithAds.size != 4) throw PatchException("Expected 4 settings checks of built_with_ads, found ${builtWithAds.size}")

            val edits = mutableListOf<Edit>()
            // `"…redditdonation".equals(packageName)` becomes the literal compared to itself: true.
            checks.forEach { check ->
                edits += Edit(check.equals.size) {
                    check.equals.forEach { (index, receiver) ->
                        check.method.replaceInstruction(index, "invoke-virtual { v$receiver, v$receiver }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z")
                    }
                }
            }
            // As in the paid build, the settings screens don't grey out the pro settings while ads are off.
            builtWithAds.forEach { (method, index) ->
                val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                edits += Edit(1) { method.replaceInstruction(index, if (register <= 15) "const/4 v$register, 0x0" else "const/16 v$register, 0x0") }
            }
            // The free app opened albums only with ads on, so it always slotted ads between the images; with ads off now,
            // the slots would stay "Loading ad…".
            if (!adsRemoved) {
                edits += Edit(1) {
                    albumAdapter.addInstructionsWithLabels(
                        0,
                        """
                        invoke-direct { p0 }, ${albumAdsOn.definingClass}->${albumAdsOn.name}()Z
                        move-result p1
                        if-nez p1, :ads
                        return-object p2
                    """,
                        ExternalLabel("ads", albumAdapter.getInstruction(0)),
                    )
                }
            }
            // synccit.com no longer answers (Cloudflare 522); rifnotifier.talklittle.com has no address.
            edits += synccitEnabled.returnEarlyEdit(false)
            edits += newPostPush.returnEarlyEdit(false)

            edits.forEach { it.apply() }
        }
    }

private const val REQUIRES_ADS = "Requires ads enabled"

private const val APP_NAMESPACE = "http://schemas.android.com/apk/res-auto"

@Suppress("unused")
val enableGoldenPlatinumPatch =
    patch(
        name = "Enable golden platinum",
        description = "Enables the golden platinum features that work without rif's servers, and makes the ads setting switch only ads.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)
        // Runs first: should a check here fail, the app keeps a complete unlock and only its settings stay as they were.
        dependsOn(unlockPatch)

        execute {
            val files = listOf("values/strings", "xml/general_preferences", "xml/about_preferences", "xml/history_preferences", "xml/notification_preferences", "layout/theme_activity", "menu/themeshop")
            val documents = files.map { document("res/$it.xml") }
            try {
                val (strings, general, about, history, notifications) = documents
                val (themes, themesMenu) = documents.drop(5)
                // Check every file before changing any.
                val title = strings.named("string", "pref_ads_enabled")
                val summary = strings.named("string", "pref_ads_enabled_summary")
                // The pro settings' summaries start "Requires ads enabled".
                val requiresAds = strings.elements("string").filter { it.textContent.startsWith(REQUIRES_ADS) }
                if (requiresAds.size != 7) throw PatchException("Expected 7 settings that say \"$REQUIRES_ADS\", found ${requiresAds.size}")
                val moderator = general.preference("MODERATOR_ENABLED")
                if (moderator.getAttribute("android:dependency") != "ADS_ENABLED") throw PatchException("MODERATOR_ENABLED no longer depends on ADS_ENABLED")
                // Opens the paid app's Play Store page.
                val upgrade = about.preference("UPGRADE")
                val synccit = listOf(history.preference("SYNCCIT_ENABLED"), history.preference("SYNCCIT_PREFS"))
                val newPosts = notifications.preference("ENABLE_NEW_POST_NOTIFICATIONS").parentNode as? Element
                if (newPosts?.tagName != "PreferenceCategory") throw PatchException("New post notifications have no category of their own")
                listOf(about, history, notifications).forEach { it.checkAppNamespace() }
                // The theme screen's list of downloadable themes, and its menu's only item, which refreshes it, come from
                // redditthemes.com, which has no address: the list says "Refreshing theme list…" for good.
                val shop = listOf("downloadable_themes_heading", "theme_count", "grid_for_sale").map { themes.withId(it) }
                if (shop.any { it.hasAttribute("android:visibility") }) throw PatchException("The theme list already sets its visibility")
                val refresh = themesMenu.withId("menu_refresh")

                title.textContent = "Ads"
                summary.textContent = "Pro features stay on either way"
                requiresAds.forEach { it.textContent = it.textContent.removePrefix(REQUIRES_ADS).removePrefix(".").trim() }
                moderator.removeAttribute("android:dependency")
                about.hide(upgrade)
                synccit.forEach { history.hide(it) }
                notifications.hide(newPosts)
                shop.forEach { it.setAttribute("android:visibility", "gone") }
                refresh.setAttribute("android:visible", "false")
            } finally {
                documents.forEach { it.close() }
            }
        }
    }

private fun Document.named(
    tag: String,
    name: String,
): Element {
    val found = elements(tag).filter { it.getAttribute("name") == name }
    return found.singleOrNull() ?: throw PatchException("Expected one $tag $name, found ${found.size}")
}

private fun Document.preference(key: String): Element {
    val found = elements("*").filter { it.getAttribute("android:key") == key }
    return found.singleOrNull() ?: throw PatchException("Expected one preference $key, found ${found.size}")
}

private fun Document.withId(id: String): Element {
    val found = elements("*").filter { it.getAttribute("android:id").substringAfter('/') == id }
    return found.singleOrNull() ?: throw PatchException("Expected one element with id $id, found ${found.size}")
}

private fun Document.elements(tag: String): List<Element> = getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }

private fun Document.checkAppNamespace() {
    val namespace = documentElement.getAttribute("xmlns:app")
    if (namespace.isNotEmpty() && namespace != APP_NAMESPACE) throw PatchException("The prefix app names $namespace in a preference screen")
}

/** Hides a preference, which code can still look up by its key. */
private fun Document.hide(preference: Element) {
    if (!documentElement.hasAttribute("xmlns:app")) documentElement.setAttribute("xmlns:app", APP_NAMESPACE)
    preference.setAttribute("app:isPreferenceVisible", "false")
}
