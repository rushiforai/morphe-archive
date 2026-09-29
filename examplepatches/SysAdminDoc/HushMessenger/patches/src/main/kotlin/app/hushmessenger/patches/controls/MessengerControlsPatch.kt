package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.coexist.validateVersionCode
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import org.w3c.dom.Document
import org.w3c.dom.Element

internal fun Document.addSettingsEntry() {
    val applications = getElementsByTagName("application")
    if (applications.length != 1) throw PatchException("Messenger controls: expected one application")
    val application = applications.item(0) as Element
    for (tag in listOf("activity", "provider")) {
        val nodes = getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            if ((nodes.item(i) as Element).getAttribute("android:name").startsWith("app.hushmessenger.extension.")) {
                throw PatchException("Messenger controls: settings are already installed. Start with the stock APK.")
            }
        }
    }
    fun Element.child(tag: String, vararg attributes: Pair<String, String>): Element = createElement(tag).also { node ->
        attributes.forEach { (name, value) -> node.setAttribute("android:$name", value) }
        appendChild(node)
    }
    application.child("provider", "name" to "app.hushmessenger.extension.SettingsProvider",
        "authorities" to "com.facebook.orca.hush.settings", "exported" to "false")
    val activity = application.child("activity", "name" to "app.hushmessenger.extension.SettingsActivity",
        "label" to "HushMessenger settings", "exported" to "true",
        "icon" to "@android:drawable/ic_menu_preferences", "taskAffinity" to "app.hushmessenger.settings")
    val filter = activity.child("intent-filter")
    filter.child("action", "name" to "android.intent.action.MAIN")
    filter.child("category", "name" to "android.intent.category.LAUNCHER")
    // Launcher shortcuts start it as Messenger itself, so no other app needs a way to kill the process.
    application.child("activity", "name" to "app.hushmessenger.extension.RestartActivity",
        "label" to "Restart Messenger", "exported" to "false", "excludeFromRecents" to "true",
        "noHistory" to "true", "configChanges" to "orientation|screenSize|keyboardHidden",
        "theme" to "@android:style/Theme.Material.NoActionBar")
}

private val settingsResources = resourcePatch(description = "Install HushMessenger settings") {
    execute {
        validateVersionCode(packageMetadata.versionCode)
        val shortcutsPath = resolveShortcutsPath(listApkEntries("res/")) { path ->
            document(path).use { it }
        }
        // ARSCLib infers the resource type from the filename, so append to strings.xml.
        document(SHORTCUT_LABEL_PATH).use { labels ->
            labels.validateShortcutLabels()
            document("AndroidManifest.xml").use { manifest ->
                document(shortcutsPath).use { shortcuts -> manifest.addSettingsAccess(shortcuts) }
            }
            labels.addShortcutLabels()
        }
    }
}

internal var discoveredControls: Map<String, List<Method>> = emptyMap()

internal val settingsExtension = bytecodePatch(description = "Load HushMessenger runtime controls") {
    dependsOn(settingsResources)
    extendWith("extensions/messenger.mpe")
    execute {
        val classes = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { classes.add(it) }
        discoveredControls = findControls(classes)
    }
    finalize { discoveredControls = emptyMap() }
}

private fun Document.requireFeatureAbsent(key: String): Element {
    val application = getElementsByTagName("application").item(0) as Element
    val name = "hush.feature.$key"
    val metadata = application.getElementsByTagName("meta-data")
    if ((0 until metadata.length).any { (metadata.item(it) as Element).getAttribute("android:name") == name }) {
        throw PatchException("HushMessenger: $key is already installed. Start with the stock APK.")
    }
    return application
}

internal fun Document.addFeature(key: String) {
    val application = requireFeatureAbsent(key)
    application.appendChild(createElement("meta-data").apply {
        setAttribute("android:name", "hush.feature.$key")
        setAttribute("android:value", "true")
    })
}

internal fun injectControl(key: String, methods: Map<String, List<MutableMethod>>) {
    // A multi-method control must pass every contract before its first edit.
    for ((hook, selectedMethods) in methods) for (method in selectedMethods) {
        if (hook in pluginGates) method.validatePluginGate()
        when (hook) {
            "subtabs" -> method.validateSubtabs()
            "browser" -> method.validateBrowserPreference()
            "ads" -> method.validateAdFilter()
            "people_jewel" -> method.validatePeopleSection()
            "keep_unsent" -> method.validateKeepUnsent()
            "unsent_indicator" -> method.validateUnsentIndicator()
            "delta_unsent" -> method.validateDeltaUnsent()
            "emoji_typeface" -> method.validateScratch()
            "avatar_tabs" -> method.validateKeyboardTabs()
            "typing_mailbox" -> method.validateOutgoingTyping()
            else -> method.validateSwitch()
        }
    }
    for ((hook, selectedMethods) in methods) for (method in selectedMethods) {
        when (hook) {
            "subtabs" -> method.injectSubtabs()
            "browser" -> method.injectBrowserPreference()
            "ads" -> method.injectAdFilter()
            "people_jewel" -> method.injectPeopleSection()
            "stories" -> method.injectSwitch("hideStories", "0x0")
            "facebook" -> method.injectSwitch("hideFacebook", "0x0")
            "ai_menu", "ai_fab", "ai_toolbar", "ai_search", "ai_search_chip" -> method.injectSwitch("hideMetaAi", "0x0")
            "typing" -> method.injectSwitch("suppressTyping", "0x0")
            "bubbles" -> method.injectSwitch("enableBubbles", "0x1")
            "allow_screenshot" -> method.injectSwitch("allowScreenshot", "0x0")
            "hide_read_receipts", "read_mailbox" -> method.injectSwitch("hideReadReceipts", "0x0")
            "keep_unsent" -> method.injectKeepUnsent()
            "unsent_indicator" -> method.injectUnsentIndicator()
            "delta_unsent" -> method.injectDeltaUnsent()
            "emoji_typeface" -> method.injectEmojiTypeface()
            "avatar_tabs" -> method.injectKeyboardTabs()
            "typing_mailbox" -> method.injectOutgoingTyping()
            else -> method.injectFeatureSwitch(key)
        }
    }
}

private fun controlPatch(key: String, title: String, summary: String, group: String, vararg hooks: String): BytecodePatch {
    var applied = false
    val featureResources = resourcePatch(description = "Record HushMessenger capability: $key") {
        dependsOn(settingsResources)
        execute {
            applied = false
            document("AndroidManifest.xml").use { it.requireFeatureAbsent(key) }
        }
        finalize {
            if (applied) document("AndroidManifest.xml").use { it.addFeature(key) }
        }
    }
    return bytecodePatch(
        name = title,
        description = "$summary Long-press Messenger > Patch controls. Starts off.",
        default = true,
    ) {
        category(group)
        compatibleWith(MessengerTarget.COMPATIBILITY)
        dependsOn(settingsExtension, featureResources)
        execute {
            val selected = hooks.toSet().ifEmpty { setOf(key) }
            validateControls(discoveredControls, selected)
            val methods = selected.associateWith { hook ->
                discoveredControls.getValue(hook).map { original ->
                    mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }
                }
            }
            injectControl(key, methods)
            applied = true
        }
    }
}

@Suppress("unused")
val hideInboxAdsPatch = controlPatch("ads", "Hide inbox ads", "Filters typed inbox ad items. Live ad removal still needs an affected-account check.", "Inbox")
@Suppress("unused")
val hidePeoplePatch = controlPatch("people", "Hide People You May Know", "Hides suggested people in chats and on the Notifications tab.", "Inbox", "people", "people_list_end", "people_jewel")
@Suppress("unused")
val hideFriendRequestsPatch = controlPatch("friend_requests", "Hide friend request cards", "Hides friend request cards inside the inbox.", "Inbox")
@Suppress("unused")
val hideGrowthPatch = controlPatch("growth", "Hide growth prompts", "Hides the inbox's add-more-people promotion unit.", "Inbox")
@Suppress("unused")
val hideInboxPromotionsPatch = controlPatch("inbox_promotions", "Hide inbox promotions", "Hides Messenger quick-promotion banners in the chat list.", "Inbox")
@Suppress("unused")
val hideStoriesPatch = controlPatch("stories", "Hide stories and notes", "Hides the horizontal tray above chats.", "Inbox")
@Suppress("unused")
val hideSubtabsPatch = controlPatch("subtabs", "Hide inbox tabs", "Hides the Home and Channels subtabs.", "Inbox")
@Suppress("unused")
val hideFacebookPatch = controlPatch("facebook", "Hide Facebook shortcuts", "Hides Facebook toolbar, profile and sharing shortcuts.", "Navigation")
@Suppress("unused")
val hideMetaAiPatch = controlPatch("meta_ai", "Hide Meta AI", "Hides the floating button, toolbar button, menu entries and search AI.", "Navigation", "ai_menu", "ai_fab", "ai_toolbar", "ai_search", "ai_search_chip")
@Suppress("unused")
val hideMomentsPatch = controlPatch("moments", "Hide Chat Moments", "Hides the Chat Moments entry in the menu.", "Navigation")
@Suppress("unused")
val hideReelsBadgePatch = controlPatch("reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "Navigation")
@Suppress("unused")
val hideAiStickersPatch = controlPatch("ai_stickers", "Hide AI sticker tools", "Hides the generated-sticker tab and AI sticker suggestions.", "Stickers")
@Suppress("unused")
val hideAvatarStickersPatch = controlPatch("avatar_stickers", "Hide avatar stickers", "Hides the avatar tab in the sticker keyboard.", "Stickers", "avatar_stickers", "avatar_tabs")
@Suppress("unused")
val hideChatPromotionsPatch = controlPatch("chat_promotions", "Hide chat promotions", "Hides Messenger quick-promotion banners inside conversations.", "Conversations")
@Suppress("unused")
val hideSuggestedRepliesPatch = controlPatch("suggested_replies", "Hide business reply suggestions", "Hides suggested replies in business conversations.", "Conversations")
@Suppress("unused")
val hideBusinessSuggestionsPatch = controlPatch("business_suggestions", "Hide business typing suggestions", "Hides business suggestions as you type.", "Conversations")
@Suppress("unused")
val hideEventPromptsPatch = controlPatch("event_prompts", "Hide event prompts", "Hides event quick-promotion prompts inside chats.", "Conversations")
@Suppress("unused")
val suppressTypingPatch = controlPatch("typing", "Hide typing indicator", "Suppresses your outgoing active-typing signal, including in end-to-end encrypted chats.", "Conversations", "typing", "typing_mailbox")
@Suppress("unused")
val externalBrowserPatch = controlPatch("external_browser", "Open web links externally", "Uses Messenger's external-browser branch for HTTP and HTTPS links.", "Links and bubbles", "browser")
@Suppress("unused")
val enableBubblesPatch = controlPatch("bubbles", "Allow chat bubbles", "Removes the low-memory eligibility limit on Android 11 and newer.", "Links and bubbles")
@Suppress("unused")
val useSystemEmojiPatch = controlPatch("use_system_emoji", "Use system emoji", "Renders emoji with the phone's own font instead of Messenger's.", "Conversations", "emoji_typeface")
@Suppress("unused")
val allowScreenshotPatch = controlPatch("allow_screenshot", "Allow screenshots", "Removes screenshot restrictions in vanish mode and E2EE chats.", "Privacy")
@Suppress("unused")
val hideReadReceiptsPatch = controlPatch("hide_read_receipts", "Hide read receipts", "Suppresses your outgoing read receipt. In end-to-end encrypted chats, chats you open stay unread until you reply.", "Privacy", "hide_read_receipts", "read_mailbox")
@Suppress("unused")
val keepUnsentPatch = controlPatch("keep_unsent", "Keep unsent messages", "Preserves messages other people remove for everyone, except in end-to-end encrypted chats. Your own unsend ability may be limited while active.", "Privacy", "keep_unsent", "unsent_indicator", "delta_unsent")

private var menuRowApplied = false

// Lets the settings screen mention the Menu tab row only on builds that have it.
private val menuRowResources = resourcePatch(description = "Record HushMessenger capability: menu_row") {
    dependsOn(settingsResources)
    execute {
        menuRowApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent("menu_row") }
    }
    finalize {
        if (menuRowApplied) document("AndroidManifest.xml").use { it.addFeature("menu_row") }
    }
}

@Suppress("unused")
val menuSettingsPatch = bytecodePatch(
    name = "Open settings from menu",
    description = "Adds a HushMessenger entry to the Menu tab. Always on.",
    default = true,
) {
    category("Navigation")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, menuRowResources)
    execute {
        validateControls(discoveredControls, setOf("menu_settings"))
        val methods = discoveredControls.getValue("menu_settings")
        val addMethod = methods.single { it.returnType == "Ljava/util/ArrayList;" }
        val bindMethod = methods.single { it.returnType == "V" && it.parameterTypes.size == 2 }
        val drawerMethod = methods.single { it.returnType == "V" && it.parameterTypes == listOf("Ljava/util/List;") }
        val clickMethod = methods.single { it.name == "onClick" }
        val addTarget = mutableClassDefBy(addMethod.definingClass).methods.single { it.hookId() == addMethod.hookId() }
        val clickTarget = mutableClassDefBy(clickMethod.definingClass).methods.single { it.hookId() == clickMethod.hookId() }
        // Check the Litho drawer's click site before editing anything.
        val folderItemType = addTarget.menuFolderItemType()
        clickTarget.menuFolderCastIndex(folderItemType)
        addTarget.injectMenuSettingsAdd()
        mutableClassDefBy(bindMethod.definingClass).methods
            .single { it.hookId() == bindMethod.hookId() }
            .injectMenuSettingsBind()
        mutableClassDefBy(drawerMethod.definingClass).methods
            .single { it.hookId() == drawerMethod.hookId() }
            .injectMenuDrawerAdd()
        clickTarget.injectMenuFolderClick(folderItemType)
        menuRowApplied = true
    }
}
