// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.misc.goldenplatinum

import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.ExtClass
import app.reseam.patch.PatchRuntime
import app.reseam.patch.Type
import app.reseam.patch.XmlDocument
import app.reseam.patch.addMethod
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val SETTINGS = "com.andrewshu.android.reddit.settings."
private const val PREFERENCE = "androidx.preference.Preference"
private const val TWO_STATE = "androidx.preference.TwoStatePreference"
private const val GROUP = "androidx.preference.PreferenceGroup"
private const val SYNCCIT_ENABLED = "SYNCCIT_ENABLED"
private const val SYNCCIT_SETTINGS = "SYNCCIT_PREFS"
private const val NOTIFY_ENABLED = "ENABLE_NEW_POST_NOTIFICATIONS"
private const val MANAGE_NOTIFICATIONS = "MANAGE_NEW_POST_NOTIFICATIONS"

private object RetiredSearch : ExtClass("app.edbfi.extension.rifisfun.settings.RetiredSearch") {
    val filter by static("android.content.Context", "java.util.List")
    val filterRetained by static("android.app.Activity")
    val resultKey by static(Type.Object, returns = Type.String)
}

private val historySetup = method("bind History preferences") {
    inClass(klass(SETTINGS + "HistorySettingsFragment"))
    params("android.view.View", "android.os.Bundle")
    returns(Type.Void)
    strings(SYNCCIT_ENABLED)
}

private val notificationsSetup = method("bind Notifications preferences") {
    inClass(klass(SETTINGS + "NotificationSettingsFragment"))
    params("android.view.View", "android.os.Bundle")
    returns(Type.Void)
    // The superclass call identifies the same obfuscated onViewCreated override as in History.
    calls { owner(SETTINGS + "RifBaseSettingsFragment"); params("android.view.View", "android.os.Bundle") }
}

private val lookupPreference = method("look up an inflated preference by key") {
    inClass(klass(SETTINGS + "RifBaseSettingsFragment"))
    params("java.lang.CharSequence")
    returns(PREFERENCE)
}

// The APK obfuscates these AndroidX accessors. Their behavior is verified against the shipped methods.
private val checkedPreference = method("isChecked") {
    inClass(klass(TWO_STATE))
    name("I0")
    params()
    returns(Type.Boolean)
}

private val setPreferenceVisible = method("setVisible") {
    inClass(klass(PREFERENCE))
    name("C0")
    params(Type.Boolean)
    returns(Type.Void)
}

private val preferenceParent = method("getParent") {
    inClass(klass(PREFERENCE))
    params()
    returns(GROUP)
}

private val setChecked = method("store accepted checkbox state") {
    inClass(klass(TWO_STATE))
    params(Type.Boolean)
    returns(Type.Void)
    // Among boolean setters, this one persists the value through Preference.
    calls { owner(PREFERENCE); name("e0"); params(Type.Boolean) }
}

// The app obfuscates Preference's key getter. This descriptor is verified in the stock APK.
private val preferenceKey = method("read preference key") {
    inClass(klass(PREFERENCE))
    name("o")
    params()
    returns(Type.String)
}

private val findSibling = method("find preference by key within group") {
    inClass(klass(GROUP))
    params("java.lang.CharSequence")
    returns(PREFERENCE)
    strings("Key cannot be null")
}

private val collectSearchResults = method("collect results from settings XML") {
    params("android.content.Context", Type.String, Type.Int, Type.String)
    returns("java.util.ArrayList")
    strings("Preference", "title", "summary", "key")
    calls { owner("android.content.res.Resources"); name("getXml"); params(Type.Int) }
}

// The matched XML parser constructs this obfuscated result type with (screen, key, title, summary).
private val searchResultKey = method("read settings search result key") {
    inClass(klass("r4.c"))
    name("a")
    params()
    returns(Type.String)
}

private val searchActivity = klass(SETTINGS + "search.SettingsSearchActivity")
private const val THEMED_ACTIVITY = "com.andrewshu.android.reddit.theme.BaseThemedActivity"

private val themeActions = method("dispatch theme catalog or purchase action") {
    inClass(klass("com.andrewshu.android.reddit.theme.shop.ThemeShopActivity"))
    params()
    returns(Type.Void)
    // The loader's AndroidX class keeps its package, but the class and method names are obfuscated.
    calls { owner("androidx.loader.app.a"); params(Type.Int, "android.os.Bundle", "androidx.loader.app.a\$a") }
}

private val loadCatalog = themeActions.points("start remote theme listing loader") {
    invokeVirtual { owner("androidx.loader.app.a"); params(Type.Int, "android.os.Bundle", "androidx.loader.app.a\$a") }
}.single()

// AndroidX prefers the app's key attribute to android:key, regardless of its XML prefix.
// Both shipped screens use framework keys exclusively. Check the compiled attribute ID table.
internal fun PatchRuntime.stockPreferenceScreen(name: String): XmlDocument {
    val path = resources.paths("xml", name).distinct().singleOrNull()
        ?: error("Expected one compiled XML layout for $name")
    val appKey = checkNotNull(resources.id("attr", "key")).toInt()
    val xml = ByteBuffer.wrap(checkNotNull(files.read(path))).order(ByteOrder.LITTLE_ENDIAN)
    var offset = xml.getShort(2).toInt() and 0xffff
    while (offset <= xml.limit() - 8) {
        val header = xml.getShort(offset + 2).toInt() and 0xffff
        val size = xml.getInt(offset + 4)
        check(header >= 8 && size in header..(xml.limit() - offset)) { "Invalid binary XML chunk in $name" }
        if (xml.getShort(offset).toInt() == 0x0180) { // RES_XML_RESOURCE_MAP_TYPE
            check((size - header) % 4 == 0) { "Invalid XML resource map in $name" }
            check((offset + header until offset + size step 4).none { xml.getInt(it) == appKey }) {
                "Unexpected app:key in $name; stock preferences use android:key"
            }
            return files.xml(path)
        }
        offset += size
    }
    error("Missing XML resource map in $name")
}

internal fun XmlDocument.requirePreference(key: String, tag: String) =
    findByAttribute("android:key", key).singleOrNull()?.also {
        check(it.tag == tag) { "Expected $tag for preference $key, found ${it.tag}" }
    } ?: error("Expected exactly one preference with android:key=$key")

val goldenPlatinum = patch(RifPatchStrings.hideRetiredServiceControls) {
    description(RifPatchStrings.hideRetiredServiceControlsDescription)
    compatibleWith(rifIsFun)

    execute {
        val notifyId = checkNotNull(resources.id("id", "menu_subreddit_enable_new_post_notifications"))
        val disableId = checkNotNull(resources.id("id", "menu_subreddit_disable_new_post_notifications"))
        val menuBinder = method("bind per-subreddit notification controls") {
            literals(notifyId.toLong(), disableId.toLong())
            calls { owner("android.view.MenuItem"); name("setVisible"); params(Type.Boolean) }
        }
        val enableNotification = menuBinder.points("set visibility of the subscribe menu entry") {
            invokeInterface { owner("android.view.Menu"); name("findItem"); params(Type.Int) }
            argument(1) { literal(notifyId.toLong()) }
            then(within = 8) {
                invokeInterface { owner("android.view.MenuItem"); name("setVisible"); params(Type.Boolean) }
            }
        }.single().captureArgumentAs("visible", 1, Type.Boolean)
        enableNotification.instruction
        historySetup.method
        notificationsSetup.method
        lookupPreference.method
        checkedPreference.method
        setPreferenceVisible.method
        preferenceParent.method
        loadCatalog.instruction
        setChecked.method
        preferenceKey.method
        findSibling.method
        collectSearchResults.method
        val searchResultType = searchResultKey.owner
        RetiredSearch.resultKey.target.method
        RetiredSearch.filter.target.method
        RetiredSearch.filterRetained.target.method
        val searchRowId = checkNotNull(resources.id("layout", "settings_search_result_row"))
        val bindSearchRow = method("inflate the settings search result row") {
            params(Type.Int, "android.view.View", "android.view.ViewGroup")
            returns("android.view.View")
            literals(searchRowId.toLong())
            calls { owner("android.view.LayoutInflater"); name("inflate") }
        }
        val searchAdapter = method("create the settings search result adapter") {
            inClass(klass(bindSearchRow.owner))
            name("<init>")
            params("android.content.Context", "java.util.List")
            calls { owner("android.widget.ArrayAdapter"); name("<init>") }
        }
        searchAdapter.method
        check(searchActivity.classDef.superclass == "Lcom/andrewshu/android/reddit/theme/BaseThemedActivity;")
        check(searchActivity.classDef.method("onResume", "()V") == null)
        val addAdDisplaySetting = prepareAdDisplaySetting()

        val checkbox = SETTINGS + "CheckIfEnabledCheckBoxPreference"
        stockPreferenceScreen("history_preferences").use { history ->
            val toggle = history.requirePreference(SYNCCIT_ENABLED, checkbox)
            history.requirePreference(SYNCCIT_SETTINGS, "Preference")
            val category = toggle.parent
            check(category?.tag == "PreferenceCategory" &&
                category.children.any { it["android:key"] == SYNCCIT_SETTINGS }) {
                "Expected SYNCCIT_PREFS and SYNCCIT_ENABLED in the same PreferenceCategory"
            }
        }
        stockPreferenceScreen("notification_preferences").use { notifications ->
            val toggle = notifications.requirePreference(NOTIFY_ENABLED, checkbox)
            notifications.requirePreference(MANAGE_NOTIFICATIONS, "Preference")
            val category = toggle.parent
            check(category?.tag == "PreferenceCategory" &&
                category.children.map { it["android:key"] }.toSet() ==
                setOf(NOTIFY_ENABLED, MANAGE_NOTIFICATIONS)) {
                "Expected only the new-post switch and subscription manager in their PreferenceCategory"
            }
        }

        val remoteThemeIds = listOf("downloadable_themes_heading", "theme_count", "grid_for_sale")
            .map { checkNotNull(resources.id("id", it)) }
        val refreshId = checkNotNull(resources.id("id", "menu_refresh"))
        val addId = checkNotNull(resources.id("id", "menu_add"))
        fun ref(id: UInt) = "@0x" + id.toString(16).padStart(8, '0')
        resources.xml("layout", "theme_activity").use { themes ->
            resources.xml("menu", "themeshop").use { themeMenu ->
                resources.xml("menu", "subreddit_popup").use { subredditMenu ->
                    resources.xml("menu", "subreddit_new_post_subscriptions").use { subscriptions ->
                        val remoteViews = remoteThemeIds.map { themes.findByAttribute("android:id", ref(it)).single() }
                        val refresh = themeMenu.findByAttribute("android:id", ref(refreshId)).single()
                        val subscribe = subredditMenu.findByAttribute("android:id", ref(notifyId)).single()
                        val addSubscription = subscriptions.findByAttribute("android:id", ref(addId)).single()
                        remoteViews.forEach { it["android:visibility"] = "gone" }
                        refresh.remove()
                        subscribe.setBool("android:visible", false)
                        addSubscription.remove()
                    }
                }
            }
        }
        // Keep checked settings visible so an existing user can opt out using the stock switches.
        historySetup.after {
            val pref = thisObject.call(lookupPreference, string(SYNCCIT_ENABLED))
            val checked = pref.cast(TWO_STATE).call(checkedPreference)
            pref.call(setPreferenceVisible, checked)
            thisObject.call(lookupPreference, string(SYNCCIT_SETTINGS)).call(setPreferenceVisible, checked)
        }
        notificationsSetup.after {
            val pref = thisObject.call(lookupPreference, string(NOTIFY_ENABLED))
            val checked = pref.cast(TWO_STATE).call(checkedPreference)
            pref.call(preferenceParent).call(setPreferenceVisible, checked)
        }
        // A row/widget click calls this setter only after its listener accepts the change.
        setChecked.after {
            whenFalse(param(0)) {
                val key = thisObject.call(preferenceKey)
                val parent = thisObject.call(preferenceParent)
                whenNotNull(parent) {
                    whenTrue(string(SYNCCIT_ENABLED).callVirtual("java.lang.String", "equals", "(Ljava/lang/Object;)Z", key)) {
                        thisObject.call(setPreferenceVisible, bool(false))
                        val settings = parent.call(findSibling, string(SYNCCIT_SETTINGS))
                        whenNotNull(settings) { settings.call(setPreferenceVisible, bool(false)) }
                    } otherwise {
                        whenTrue(string(NOTIFY_ENABLED).callVirtual("java.lang.String", "equals", "(Ljava/lang/Object;)Z", key)) {
                            parent.call(setPreferenceVisible, bool(false))
                        }
                    }
                }
            }
        }
        RetiredSearch.resultKey.implement {
            returnValue(param(0).cast(searchResultType).call(searchResultKey))
        }
        collectSearchResults.after { RetiredSearch.filter(param(0), result) }
        // Recheck deferred results on the UI thread before they become an adapter.
        searchAdapter.before { RetiredSearch.filter(param(0), param(1)) }
        searchActivity.addMethod("onResume", "()V", accessFlags = AccessFlags.PROTECTED) {
            thisObject.callSuper(THEMED_ACTIVITY, "onResume", "()V")
            RetiredSearch.filterRetained(thisObject)
            returnVoid()
        }
        // The per-subreddit unsubscribe action keeps its stock visibility.
        enableNotification.before { capture("visible").assign(bool(false)) }
        loadCatalog.before { returnVoid() }
        addAdDisplaySetting()
    }
}
