// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.edbfi.extension.syncforreddit.websitepreview.bindings.WebsitePreviews
import app.reseam.patch.Type
import app.reseam.patch.XmlDocument
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.klass
import app.reseam.patch.methods
import app.reseam.patch.points
import app.reseam.patch.redirectTo

private const val CONTEXT = "android.content.Context"
private const val GLIDE = "com.bumptech.glide.b"
private const val REQUEST_MANAGER = "com.bumptech.glide.g"
private const val REQUEST_BUILDER = "com.bumptech.glide.f"
private const val SITE_PREVIEW_SETTING = "ultra_website_previews"
private const val ACCOUNT_PREFERENCES = "android.content.SharedPreferences"
private const val MAIN_SETTINGS = "SettingsSingleton: main"
private const val ULTRA_ENHANCEMENTS = "ultra_enhancements"
private const val SWITCH = "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncCheckBoxPreference"
internal const val LINKS_XML = "cat_links"

private val previewHelper = klass("Website preview helper") {
    sourceFile("WebsitePreviewHelper.java")
}

private val stockEligibility = methods("Check stock website preview eligibility") {
    inClass(previewHelper)
    params(Type.String)
    returns(Type.Boolean)
    flags(AccessFlags.STATIC)
    accesses { name(SITE_PREVIEW_SETTING) }
}.single()

private val eligibleLink = methods("Recognize a previewable website URL") {
    inClass(previewHelper)
    params(Type.String)
    returns(Type.Boolean)
    flags(AccessFlags.STATIC or AccessFlags.PUBLIC)
    strings("https://", "reddit.com", "tenor.com")
    calledBy(stockEligibility)
}.single()

private val readSettings = methods("Read Sync's per-account website preview preference") {
    inClass(klass("com.laurencedawson.reddit_sync.singleton.SettingsSingleton"))
    params(CONTEXT)
    strings(MAIN_SETTINGS, SITE_PREVIEW_SETTING)
}.single()

private val stockImageUrl = methods("Build the stock website preview URL") {
    inClass(previewHelper)
    params(Type.String)
    returns(Type.String)
    strings("https://ap.syncforreddit.com/image?url=", "https://i.ytimg.com/vi/", "/amp/s/")
}.single()

private val linkTypeHelper = klass("Link type helper") {
    sourceFile("LinkTypeHelper.java")
}

private val isYouTube = methods("Recognize a YouTube video link") {
    inClass(linkTypeHelper)
    params(Type.String)
    returns(Type.Boolean)
    flags(AccessFlags.STATIC)
    strings("/shorts/", "youtube.com", "youtu.be")
    calledBy(stockImageUrl)
}.single()

private val redditApplication = klass("com.laurencedawson.reddit_sync.RedditApplication")
private val appContext = methods("Get Sync application context") {
    inClass(redditApplication)
    flags(AccessFlags.STATIC or AccessFlags.PUBLIC)
    params()
    returns(CONTEXT)
}.single()

private val glideModule = klass("com.laurencedawson.reddit_sync.YourAppGlideModule")
private val registerModels = methods("Register Sync's Glide models") {
    inClass(glideModule)
    param(0, CONTEXT)
    param(1, GLIDE)
    paramCount(3)
    returns(Type.Void)
    strings("Setting up glide with OkHTTP")
}.single()

internal val spannableTextBuilder = klass("Spannable text builder") {
    sourceFile("SpannableTextViewStringBuilder.java")
    hasInstanceField("java.lang.StringBuilder")
}

private val inlineLoader = methods("Bind comment link spans") {
    inClass(spannableTextBuilder)
    returns(Type.Void)
    strings("EfficientImageSpan", "tenor.com")
}.single()

private val spanModel = methods("Read the inline website image model") {
    inClass(klass("Website preview span") { sourceFile("WebPreviewImageSpan.java") })
    flags(AccessFlags.PUBLIC)
    params()
    returns(Type.String)
    opcodeSequence(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT)
    calledBy(inlineLoader)
}.single()

private val sheet = klass("Link options sheet") {
    sourceFile("UrlSelectionDialogBottomSheet.java")
    strings("Link options", "Open in browser", "Retrying")
}

private val sheetLoad = methods("Load a website image in the link options sheet") {
    inClass(sheet)
    flags(AccessFlags.PRIVATE)
    params()
    returns(Type.Void)
    calls(stockImageUrl)
}.single()

private val sheetSetup = methods("Build the link options sheet") {
    inClass(sheet)
    strings("Open in browser", "Copy link address")
    calls(stockEligibility)
}.single()

private val sheetEligibility = sheetSetup.points("Check the link options preview URL") {
    calls(stockEligibility)
}.single()

private val sheetFirstLoad = sheetSetup.points("Start sheet website preview") { calls(sheetLoad) }.single()

private val inlineEligibility = methods("Add the inline website preview span") {
    inClass(klass("Sync HTML to spanned converter") {
        sourceFile("SyncHtmlToSpannedConverter.java")
        implements("org.xml.sax.ContentHandler")
    })
    strings("sync-settings", "preview.redd.it", "tenor.com")
    flags(AccessFlags.PRIVATE or AccessFlags.STATIC)
    returns(Type.Void)
}.single().points("Check the inline website preview URL") { calls(stockEligibility) }.single()

private val sheetRetry = methods("Retry a link options preview") {
    inClass(sheet)
    params("android.view.View")
    strings("Retrying")
}.single().points("Retry sheet website preview") { calls(sheetLoad) }.single()

private val inlineImage = inlineLoader.points("Load the website image span") {
    calls(spanModel)
    then { opcode(Opcode.MOVE_RESULT_OBJECT) }
    then {
        invokeVirtual {
            owner(REQUEST_MANAGER)
            params(Type.String)
            returns(REQUEST_BUILDER)
        }
    }
}.single()

private val sheetImage = sheetLoad.points("Load the link sheet website image") {
    calls(stockImageUrl)
    then { opcode(Opcode.MOVE_RESULT_OBJECT) }
    then {
        invokeVirtual {
            owner(REQUEST_MANAGER)
            params(Type.String)
            returns(REQUEST_BUILDER)
        }
    }
}.single()

internal fun resolveWebsitePreviewEdits(): () -> Unit {
    listOf(stockEligibility, eligibleLink, isYouTube, appContext, registerModels, indexablePreference).forEach { it.method }
    // Resolve the store from the call with the same argument that Sync uses to load this key.
    val mainStore = readSettings.points("Get the main settings store") {
        invokeStatic {
            params(Type.String)
            returns(ACCOUNT_PREFERENCES)
        }
        argument(0) { string(MAIN_SETTINGS) }
    }.single()
    val preferenceStore = mainStore.callee("Get the active preference store")
    val readPreview = readSettings.points("Read the native preview key with its default") {
        invokeInterface {
            owner(ACCOUNT_PREFERENCES)
            name("getBoolean")
            params(Type.String, Type.Boolean)
            returns(Type.Boolean)
        }
        argument(0) { resultOf(ACCOUNT_PREFERENCES) }
        argument(1) { string(SITE_PREVIEW_SETTING) }
        argument(2) { literal(1L) }
    }.single()
    check(readPreview.writer(0).index == mainStore.index + 1) { "Expected the preview key in Sync's main settings store" }
    preferenceStore.method
    listOf(inlineEligibility, sheetEligibility, inlineImage, sheetImage, sheetFirstLoad, sheetRetry).forEach { it.index }
    check(sheetEligibility.index < sheetFirstLoad.index) { "Expected the eligibility check before the first sheet load" }
    check(registerModels.method.parameterTypes.last() == "Lw2/e;") { "Unexpected Glide registry type" }

    return {
        WebsitePreviews.stockEligibility.implement { returnValue(call(stockEligibility, param(0))) }
        WebsitePreviews.isYouTube.implement { returnValue(call(isYouTube, param(0))) }
        WebsitePreviews.isWebsiteLink.implement { returnValue(call(eligibleLink, param(0))) }
        WebsitePreviews.appContext.implement { returnValue(call(appContext)) }
        WebsitePreviews.previewsEnabled.implement {
            val preferences = call(preferenceStore, string(MAIN_SETTINGS))
            returnValue(preferences.callInterface(
                ACCOUNT_PREFERENCES, "getBoolean", "(Ljava/lang/String;Z)Z", string(SITE_PREVIEW_SETTING), bool(true),
            ))
        }
        // Search filters Ultra keys regardless of which screen declares them. Only index the relocated switch.
        indexablePreference.before {
            val matches = string(SITE_PREVIEW_SETTING).callVirtual(
                "java.lang.String", "equals", "(Ljava/lang/Object;)Z", param(0),
            )
            whenTrue(matches) { returnValue(bool(true)) }
        }
        registerModels.after { WebsitePreviews.register(param(0), param(2)) }
        inlineEligibility.redirectTo(WebsitePreviews.eligible)
        sheetEligibility.redirectTo(WebsitePreviews.eligible)
        // Sync still uses its original model strings to size previews. Only the image requests are redirected.
        inlineImage.redirectTo(WebsitePreviews.load)
        sheetImage.redirectTo(WebsitePreviews.load)
    }
}

internal fun resolveUltraPreviewVisibilityEdit(): () -> Unit {
    val start = ultraSettings.points("Find the Ultra enhancements category lookup") { string(ULTRA_ENHANCEMENTS) }.single()
    val visibility = ultraSettings.points("Set visibility of the Ultra enhancements category") {
        string(ULTRA_ENHANCEMENTS)
        then {
            invokeVirtual {
                params("java.lang.CharSequence")
                returns(PREFERENCE)
            }
            argument(1) { string(ULTRA_ENHANCEMENTS) }
        }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then {
            invokeVirtual {
                owner(PREFERENCE)
                params(Type.Boolean)
                returns(Type.Void)
            }
            argument(0) { resultOf(PREFERENCE) }
        }
    }.single()
    val count = visibility.index - start.index + 1
    check(count == 4) { "Unexpected Ultra enhancements visibility setup" }
    val method = ultraSettings.method
    return { method.removeInstructions(start.index, count) }
}

internal fun XmlDocument.resolveWebsitePreviewSettingsEdit(links: XmlDocument): () -> Unit {
    val category = requirePreference(ULTRA_XML, ULTRA_ENHANCEMENTS, "PreferenceCategory")
    val enabled = requirePreference(ULTRA_XML, SITE_PREVIEW_SETTING, SWITCH)
    val promotion = requirePreference(ULTRA_XML, "ultra_disabled_website_previews", SYNC_PREFERENCE)
    check(category.parent?.tag == "PreferenceScreen" && category.children.map { it.tag } == listOf(CATEGORY_HEADER, SWITCH) &&
        enabled.parent?.get(KEY) == ULTRA_ENHANCEMENTS && enabled["android:defaultValue"] == "true" && enabled.children.isEmpty() &&
        enabled["android:title"] == "Website previews" && promotion.parent?.get(KEY) == "ultra_perks" &&
        promotion.children.isEmpty()) {
        "Unexpected website preview rows in $ULTRA_XML"
    }
    val anchor = links.requirePreference(LINKS_XML, "bypass_amp", SWITCH)
    val destination = checkNotNull(anchor.parent)
    check(links.root.tag == "PreferenceScreen" && destination.tag == "PreferenceCategory" &&
        destination.parent?.tag == "PreferenceScreen" &&
        destination.children.firstOrNull()?.get("app:categoryTitle") == "Enhancements" &&
        links.findByAttribute(KEY, SITE_PREVIEW_SETTING).isEmpty()) {
        "Unexpected website preview destination in $LINKS_XML"
    }

    return {
        destination.appendChild(links.adopt(enabled))
        category.remove()
        promotion.remove()
    }
}
