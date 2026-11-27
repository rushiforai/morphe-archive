// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.misc.goldenplatinum

import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.ads.disable.screenTransition
import app.edbfi.extension.rifisfun.settings.bindings.AdSettings
import app.reseam.patch.MethodTarget
import app.reseam.patch.PatchRuntime
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.Opcode
import app.reseam.patch.dex.literal
import app.reseam.patch.dex.opcode
import app.reseam.patch.methods
import app.reseam.patch.points
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.klass
import app.reseam.patch.method
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Element

private const val RIF = "com.andrewshu.android.reddit."
private const val PREFERENCE_SCREEN = "general_preferences"
private const val SHOW_ADS = "edbfi_show_ads"
// rif 5.6.22 ships RecyclerView.Adapter under this R8 name in the album helper signature.
private const val RECYCLER_ADAPTER = "androidx.recyclerview.widget.RecyclerView\$h"

private val applicationContext = method("read rif application context") {
    inClass(klass(RIF + "RedditIsFunApplication"))
    flags(AccessFlags.PUBLIC or AccessFlags.STATIC)
    params()
    returns("android.content.Context")
}

private val insertFeedAd = method("allow an ad row in a thread feed") {
    // Disable ads erases the identifying theme calls. Two protected ()Z overrides remain,
    // so pin the R8 class and override names from rif 5.6.22.
    inClass(klass("e5.e0"))
    name("d0")
    flags(AccessFlags.PROTECTED)
    params()
    returns(Type.Boolean)
}

private val showBanner = method("allow a banner below the thread list") {
    // Three private methods on this enum accept MainActivity and return Boolean. Disable ads
    // erases the theme call that distinguishes the gate, so retain its rif 5.6.22 R8 name.
    inClass(screenTransition)
    name("b")
    flags(AccessFlags.PRIVATE)
    params(RIF + "MainActivity")
    returns(Type.Boolean)
}

private val wrapAlbumAdapter = method("add ad rows to an image album") {
    inClass(klass(RIF + "ads.ImageAlbumAdViewHelper"))
    name("newRecyclerAdapter")
    params("android.app.Activity", RECYCLER_ADAPTER)
    returns(RECYCLER_ADAPTER)
}

private const val ADS = "ADS_ENABLED"
private const val PAID_PACKAGE = "com.andrewshu.android.redditdonation"
private const val PREFS = "android.content.SharedPreferences"
private const val SHOP = RIF + "theme.shop.ThemeShopActivity"

private fun savedBoolean(key: String) = method("Save rif's $key preference") {
    params("$PREFS\$Editor")
    strings(key)
}.points("Read the setting stored under $key") {
    string(key)
    then { invokeVirtual { params(); returns(Type.Boolean) } }
}.single().callee()

private val adsEnabled = savedBoolean(ADS)
private val cardsEnabled = savedBoolean("THREADS_CARDS")
private val developerMode = savedBoolean("THEME_DEVELOPER")
private val folder = method("Save developer theme directory") {
    params("$PREFS\$Editor")
    strings("DEVELOPER_THEME_URI")
}.points("Read the theme URI before serializing it") {
    invokeVirtual { owner(adsEnabled.owner); params(); returns("android.net.Uri") }
    then { opcode(Opcode.MOVE_RESULT_OBJECT) }
    then { invokeVirtual { owner("android.net.Uri"); name("toString") } }
}.single().previous { invokeVirtual { owner(adsEnabled.owner); params(); returns("android.net.Uri") } }.callee()

private val readAdsPreference = method("Load stock ad preference") {
    inClass(klass(adsEnabled.owner))
    params(PREFS)
    strings(ADS)
}

private fun MethodTarget.adResult() = points("Read ad eligibility in ${descriptor}") {
    calls(adsEnabled)
    then { opcode(Opcode.MOVE_RESULT) }
}.single().captureAs("enabled", Type.Boolean).also { it.index }

internal fun PatchRuntime.prepareAdDisplaySetting(): () -> Unit {
    applicationContext.method
    readAdsPreference.method
    wrapAlbumAdapter.method
    AdSettings.migrate.target.method
    AdSettings.showAds.target.method
    AdSettings.settingsRequiringAds.target.method

    val cardMethods = methods("Select Cards or bind Cards controls") {
        strings(PAID_PACKAGE)
        calls(adsEnabled)
        calls(cardsEnabled)
    }.all.also { check(it.size == 5) { "Expected 5 Cards selectors and bindings, found ${it.size}" } }
    val albumMethods = methods("Route a link to the native album viewer") {
        params("android.net.Uri")
        returns(Type.Boolean)
        strings(PAID_PACKAGE)
        calls(adsEnabled)
    }.all.also { check(it.size == 3) { "Expected 3 native album routers, found ${it.size}" } }
    val moderatorStore = method("Find moderated subreddits") { strings("moderator=1") }
    val moderator = method("Allow local moderator tools") {
        inClass(klass(moderatorStore.owner))
        strings(PAID_PACKAGE)
        calls(adsEnabled)
    }
    val tablet = method("Choose a two-pane layout for the current configuration") {
        strings(PAID_PACKAGE)
        params()
        returns(Type.Boolean)
        calls(adsEnabled)
        calls { owner("android.content.res.Resources"); name("getConfiguration") }
    }
    val visitedEndpoint = method("Reddit Premium visited-link endpoint") {
        name("<clinit>")
        strings("store_visits")
        calls { owner("android.net.Uri"); name("withAppendedPath") }
    }
    val visited = method("Allow Reddit history sync for an eligible account") {
        inClass(klass(visitedEndpoint.owner))
        strings(PAID_PACKAGE)
        calls(adsEnabled)
    }
    val localGates = (cardMethods + albumMethods + moderator + tablet + visited).map { it.adResult() }

    // Only a selected developer folder supplies extra theme files. Keep downloaded themes
    // on their original path when the user has no folder selected.
    val themeReaders = methods("Read developer-folder styles and templates") {
        strings(PAID_PACKAGE)
        calls(adsEnabled)
        calls(folder)
    }.all.also { check(it.size == 6) { "Expected 6 developer-folder theme readers, found ${it.size}" } }
    val applyTheme = method("Apply theme manifest") { strings(PAID_PACKAGE, "ThemeManifest.version") }
    val selectTheme = method("Update local theme selection") {
        inClass(klass(SHOP))
        strings(PAID_PACKAGE)
        calls { owner("android.widget.TextView"); name("setCompoundDrawablesWithIntrinsicBounds") }
    }
    val settings = method("Access rif's current settings") {
        inClass(klass(adsEnabled.owner))
        flags(AccessFlags.STATIC)
        params()
        returns(adsEnabled.owner)
    }
    settings.method
    developerMode.method
    val folderGates = (themeReaders + applyTheme + selectTheme).map { it.adResult() }

    val adMethods = listOf("initLoadAdsIfNeeded", "isAdsEnabledAndUnblocked").flatMap { methodName ->
        methods("Ad loading helpers named $methodName") {
            name(methodName)
            calls(adsEnabled)
        }.all.also { check(it.size == 2) { "Expected 2 ad helpers named $methodName, found ${it.size}" } }
    }
    val feedLoader = method("Load rif feed from its URI") { strings("Loading things list uri %s") }
    val premiumRefresh = method("Check Premium status for feed ad blocking") {
        inClass(klass(feedLoader.owner))
        params()
        returns(Type.Boolean)
        calls(adsEnabled)
    }
    val placementGates = (adMethods + premiumRefresh + listOf(insertFeedAd, showBanner).filter { target ->
        val instructions = target.method.instructions
        // Disable ads may already have replaced these two methods with return false.
        !(instructions.size == 2 && instructions.first().opcode == Opcode.CONST_4 &&
            instructions.last().opcode == Opcode.RETURN && instructions.first().literal == 0L)
    }).map { it.adResult() }
    val albumAds = klass(RIF + "ads.ImageAlbumAdViewHelper").method("isAdsEnabledAndUnblocked") {
        params(); returns(Type.Boolean); calls(adsEnabled)
    }
    albumAds.method

    val greyOut = method("Disable preferences that require the stock combined switch") {
        inClass(klass(RIF + "settings.RifBaseSettingsFragment"))
        strings(ADS)
    }.points("Iterate the settings disabled when stock ads are off") {
        invokeInterface { owner("java.util.Set"); name("iterator") }
    }.single().captureArgumentAs("keys", 0)
    greyOut.index
    val cardOptions = methods("Enable individual Cards options") {
        inClass(klass(RIF + "settings.AppearanceSettingsFragment"))
        strings(ADS)
    }.all.also { check(it.size == 2) { "Expected 2 Cards option readers, found ${it.size}" } }.map { target ->
        target.points("Read the combined preference for Cards options") {
            invokeInterface { owner(PREFS); name("getBoolean"); params(Type.String, Type.Boolean) }
            then { opcode(Opcode.MOVE_RESULT) }
        }.single().captureAs("enabled", Type.Boolean).also { it.index }
    }

    stockPreferenceScreen(PREFERENCE_SCREEN).use { screen ->
        check(screen.root.tag == "PreferenceScreen") {
            "Expected PreferenceScreen at the root of $PREFERENCE_SCREEN, found ${screen.root.tag}"
        }
        screen.requirePreference(ADS, "CheckBoxPreference")
        val existing = screen.findByAttribute("android:key", SHOW_ADS)
        check(existing.isEmpty()) { "Expected no $SHOW_ADS preference in $PREFERENCE_SCREEN, found ${existing.size}" }
        listOf("GOLD_BLOCK_ADS", "MODERATOR_ENABLED").forEach { key ->
            val row = screen.requirePreference(key, RIF + "settings.CheckIfEnabledCheckBoxPreference")
            val dependency = row["android:dependency"]
            check(dependency == ADS) { "Expected $key to depend on $ADS in $PREFERENCE_SCREEN, found $dependency" }
        }
    }
    val strings = checkNotNull(RifPatchStrings::class.java.getResourceAsStream("/edbfi/rifisfun/strings.xml"))
        .use { DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it).getElementsByTagName("string") }
    val labels = (0 until strings.length).map { strings.item(it) as Element }
        .associate { it.getAttribute("name") to it.textContent }
    val title = labels.getValue(RifPatchStrings.showAds.name)
    val summary = labels.getValue(RifPatchStrings.showAdsSummary.name)
    val summaries = listOf("pref_threads_cards_summary", "pref_native_image_albums_summary",
        "pref_dualpane_summary", "pref_moderator_enabled_summary", "pref_reddit_visited_enabled_summary").associateWith { key ->
        checkNotNull(resources.getString(key)).also { check(it.startsWith("Requires ads enabled")) }
            .removePrefix("Requires ads enabled").trimStart('.', ' ')
    }
    return {
        val titleId = checkNotNull(resources.addString(SHOW_ADS, title))
        val summaryId = checkNotNull(resources.addString("${SHOW_ADS}_summary", summary))
        summaries.forEach { (key, value) -> check(resources.setString(key, value)) }
        stockPreferenceScreen(PREFERENCE_SCREEN).use { screen ->
            val checkbox = screen.requirePreference(ADS, "CheckBoxPreference")
            checkbox["android:key"] = SHOW_ADS
            checkbox.setResourceRef("android:title", titleId)
            checkbox.setResourceRef("android:summary", summaryId)
            screen.requirePreference("GOLD_BLOCK_ADS", RIF + "settings.CheckIfEnabledCheckBoxPreference")["android:dependency"] = SHOW_ADS
            screen.requirePreference("MODERATOR_ENABLED", RIF + "settings.CheckIfEnabledCheckBoxPreference").removeAttribute("android:dependency")
        }
        readAdsPreference.before { AdSettings.migrate(param(0)) }
        localGates.forEach { it.after { capture("enabled").assign(bool(true)) } }
        folderGates.forEach { point ->
            point.after {
                val current = call(settings)
                whenTrue(current.call(developerMode)) {
                    whenNotNull(current.call(folder)) { capture("enabled").assign(bool(true)) }
                }
            }
        }
        greyOut.before { val keys = capture("keys"); keys.assign(AdSettings.settingsRequiringAds(keys)) }
        cardOptions.forEach { it.after { capture("enabled").assign(bool(true)) } }
        placementGates.forEach { it.after { capture("enabled").assign(AdSettings.showAds(call(applicationContext))) } }
        wrapAlbumAdapter.before { whenFalse(thisObject.call(albumAds)) { returnValue(param(1)) } }
    }
}
