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

/** The settings provider's authority follows the package name, the way the extension's own build declares it. */
internal const val SETTINGS_AUTHORITY_SUFFIX = ".hush.settings"

internal fun Document.addSettingsEntry() {
    val applications = getElementsByTagName("application")
    if (applications.length != 1) throw PatchException("Messenger controls: expected one application")
    val application = applications.item(0) as Element
    for (tag in listOf("activity", "activity-alias", "provider")) {
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
        "authorities" to MessengerTarget.PACKAGE + SETTINGS_AUTHORITY_SUFFIX, "exported" to "false")
    application.child("activity", "name" to "app.hushmessenger.extension.SettingsActivity",
        "label" to "HushMessenger settings", "exported" to "true",
        "icon" to "@android:drawable/ic_menu_preferences", "taskAffinity" to "app.hushmessenger.settings")
    // The app drawer entry is an alias, so settings can hide it while the shortcuts and Menu tab row keep working.
    val launcher = application.child("activity-alias", "name" to "app.hushmessenger.extension.SettingsLauncher",
        "targetActivity" to "app.hushmessenger.extension.SettingsActivity", "label" to "HushMessenger settings",
        "icon" to "@android:drawable/ic_menu_preferences", "exported" to "true")
    val filter = launcher.child("intent-filter")
    filter.child("action", "name" to "android.intent.action.MAIN")
    filter.child("category", "name" to "android.intent.category.LAUNCHER")
    // Launcher shortcuts start it as Messenger itself, so no other app needs a way to kill the process.
    application.child("activity", "name" to "app.hushmessenger.extension.RestartActivity",
        "label" to "Restart Messenger", "exported" to "false", "excludeFromRecents" to "true",
        "noHistory" to "true", "configChanges" to "orientation|screenSize|keyboardHidden",
        "theme" to "@android:style/Theme.Material.NoActionBar")
}

internal val settingsResources = resourcePatch(description = "Install HushMessenger settings") {
    execute {
        validateVersionCode(packageMetadata.versionCode)
        nativeBubbleActivityVerified = document("AndroidManifest.xml").use {
            it.requireNativeBubbleRoutesAbsent()
            it.hasNativeBubbleActivity()
        }
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
internal var nativeBubbleActivityVerified = false
internal var nativeBubbleRoutesVerified = false
internal var communityInboxContract: CommunityInboxContract? = null

internal val settingsExtension = bytecodePatch(description = "Load HushMessenger runtime controls") {
    dependsOn(settingsResources)
    extendWith("extensions/messenger.mpe")
    execute {
        activeProfile = controlProfileFor(packageMetadata.versionCode)
        val classes = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { classes.add(it) }
        communityInboxContract = findCommunityInbox(classes)
        discoveredControls = findControls(classes, communityInboxContract)
        val nativeGate = discoveredControls["bubble_mode"].orEmpty().singleOrNull()
        nativeBubbleRoutesVerified = nativeBubbleActivityVerified && nativeGate != null &&
            findNativeBubbleRoutes(classes, nativeGate.hookId()) == activeProfile.nativeBubbleRoutes
        bundledControls.clear()
        hookScreenHosts()
    }
    finalize {
        discoveredControls = emptyMap()
        bundledControls.clear()
        activeProfile = BASE_PROFILE
        nativeBubbleActivityVerified = false
        nativeBubbleRoutesVerified = false
        communityInboxContract = null
        messageLogContract = null
    }
}

internal fun Document.requireFeatureAbsent(key: String): Element {
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
            "ai_sticker_cell" -> method.validateAiStickerCell()
            "screenshot_viewers" -> method.validateScreenshotViewer()
            "subtabs" -> method.validateSubtabs()
            "browser" -> method.validateBrowserPreference()
            "ads" -> method.validateAdFilter()
            "people_jewel" -> method.validatePeopleSection()
            "people_tab" -> method.validatePeopleTab()
            "people_search" -> method.validatePeopleSearch()
            "people_story" -> method.validatePeopleStory()
            INBOX_REFRESH_HOOK -> method.validateInboxItems()
            "keep_unsent" -> method.validateKeepUnsent()
            "unsent_indicator" -> method.validateUnsentIndicator()
            "delta_unsent" -> method.validateDeltaUnsent()
            "emoji_typeface" -> method.validateEmojiTypeface()
            EMOJI_DRAWER -> method.validateEmojiDrawer()
            ANALYTICS_UPLOADS -> method.validateAnalyticsUpload()
            MESSAGE_LOG -> method.validateMessageLog()
            "original_photo" -> method.validateOriginalPhoto()
            ORIGINAL_VIDEO -> method.validateOriginalVideo()
            SYSTEM_CAMERA -> method.validateSystemCamera()
            "avatar_tabs" -> if (method.returnType == "V") method.validateKeyboardTabsInline() else method.validateKeyboardTabs()
            "typing_mailbox" -> method.validateOutgoingTyping()
            "anonymous_stories" -> method.validateStorySeen()
            "growth_notes" -> method.validateNotesTips()
            "bubbles" -> method.validateBubbleEligibility()
            "bubble_mode" -> method.validateNativeBubbleMode()
            APP_ICONS -> method.validateAppIconGate()
            else -> method.validateSwitch()
        }
    }
    for ((hook, selectedMethods) in methods) for (method in selectedMethods) {
        when (hook) {
            "ai_sticker_cell" -> method.injectAiStickerCell()
            "screenshot_viewers" -> method.injectScreenshotViewer()
            "subtabs" -> method.injectSubtabs()
            "browser" -> method.injectBrowserPreference()
            "ads" -> method.injectAdFilter()
            "people_jewel" -> method.injectPeopleSection()
            "people_tab" -> method.injectPeopleTab()
            "people_search" -> method.injectPeopleSearch()
            "people_story" -> method.injectPeopleStory()
            INBOX_REFRESH_HOOK -> method.injectInboxItems()
            "stories" -> method.injectSwitch("hideStories", "0x0")
            "facebook" -> method.injectSwitch("hideFacebook", "0x0")
            "ai_menu", "ai_fab", "ai_toolbar", "ai_search", "ai_search_chip" -> method.injectSwitch("hideMetaAi", "0x0")
            "ai_tab" -> method.injectSwitch("hideMetaAiTab", "0x0")
            "typing" -> method.injectSwitch("suppressTyping", "0x0")
            "bubbles" -> method.injectSwitch("enableBubbles", "0x1")
            "bubble_mode" -> method.injectNativeBubbleMode()
            APP_ICONS -> method.injectAppIconGate()
            "allow_screenshot" -> method.injectSwitch("allowScreenshot", "0x0")
            "hide_read_receipts", "read_mailbox" -> method.injectSwitch("hideReadReceipts", "0x0")
            "keep_unsent" -> method.injectKeepUnsent()
            "unsent_indicator" -> method.injectUnsentIndicator()
            "delta_unsent" -> method.injectDeltaUnsent()
            "emoji_typeface" -> method.injectEmojiTypeface()
            EMOJI_DRAWER -> method.injectEmojiDrawer()
            ANALYTICS_UPLOADS -> method.injectAnalyticsUpload()
            MESSAGE_LOG -> method.injectMessageLog()
            "original_photo" -> method.injectOriginalPhoto()
            ORIGINAL_VIDEO -> method.injectOriginalVideo()
            SYSTEM_CAMERA -> method.injectSystemCamera()
            "avatar_tabs" -> if (method.returnType == "V") method.injectKeyboardTabsInline() else method.injectKeyboardTabs()
            "typing_mailbox" -> method.injectOutgoingTyping()
            "anonymous_stories" -> method.injectStorySeen()
            "growth_notes" -> method.injectNotesTips()
            else -> if (hook in pluginGates) method.injectPluginGate(key) else method.injectFeatureSwitch(key)
        }
    }
}

/** [manifest] adds the components a control needs, and runs only once its hooks are in. */
private fun controlPatch(key: String, title: String, summary: String, group: String, vararg hooks: String,
    manifest: (Document.() -> Unit)? = null): BytecodePatch {
    var applied = false
    var nativeRoutesApplied = false
    val featureResources = resourcePatch(description = "Record HushMessenger capability: $key") {
        dependsOn(settingsResources)
        execute {
            applied = false
            nativeRoutesApplied = false
            document("AndroidManifest.xml").use { it.requireFeatureAbsent(key) }
        }
        finalize {
            if (applied) document("AndroidManifest.xml").use {
                it.addFeature(key)
                manifest?.invoke(it)
                if (nativeRoutesApplied) it.addNativeBubbleRoutesMetadata()
            }
        }
    }
    return bytecodePatch(
        name = title,
        description = "$summary Long-press Messenger's home screen icon > Patch controls. Starts off.",
        default = true,
    ) {
        category(group)
        compatibleWith(MessengerTarget.COMPATIBILITY)
        dependsOn(settingsExtension, featureResources)
        execute {
            val selected = hooks.toSet().ifEmpty { setOf(key) }
            validateControls(discoveredControls, selected)
            // Proved on the stock classes, and the extension's half checked, before any target is edited.
            val inboxRoute = if (INBOX_REFRESH_HOOK in selected) {
                resolveInboxRefresh(discoveredControls.getValue(INBOX_REFRESH_HOOK).single()) { classDefByOrNull(it) } to inboxRefreshStub()
            } else null
            val emojiFontHolder = if ("emoji_typeface" in selected) {
                discoveredControls.getValue("emoji_typeface").single().emojiFontHolder { classDefByOrNull(it) }
            } else null
            val methods = selected.associateWith { hook ->
                discoveredControls.getValue(hook).map { original ->
                    mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }
                }
            }
            if (key == COMMUNITY_INBOX) {
                val contract = communityInboxContract ?: throw PatchException("Messenger controls: the native community inbox route is missing")
                val host = mutableClassDefBy(HOST_SCREENS)
                val helpers = host.methods
                val joined = helpers.singleOrNull { it.hookId() == JOINED_COMMUNITY_ROW }
                    ?: throw PatchException("Messenger controls: the joined-community helper is missing")
                val scope = helpers.singleOrNull { it.hookId() == MAIN_INBOX_SCOPE }
                    ?: throw PatchException("Messenger controls: the Main inbox helper is missing")
                val replacements = injectCommunityInbox(contract, methods.getValue(COMMUNITY_INBOX).single(), joined, scope)
                // MutableMethod.implementation has no setter. Keep both method indexes in sync when replacing it.
                val direct = host.directMethods
                helpers.removeAll(listOf(joined, scope))
                direct.removeAll(listOf(joined, scope))
                helpers.addAll(replacements)
                direct.addAll(replacements)
            } else if (key == "bubbles") {
                val capability = mutableClassDefBy(HOST_SCREENS).methods.singleOrNull { it.hookId() == NATIVE_BUBBLE_ROUTES }
                    ?: throw PatchException("Messenger controls: the extension has no native bubble capability")
                injectNativeBubbles(methods.getValue("bubbles").single(), methods.getValue("bubble_mode").single(),
                    capability, nativeBubbleRoutesVerified)
                nativeRoutesApplied = nativeBubbleRoutesVerified
            } else {
                injectControl(key, methods)
                inboxRoute?.let { (route, stub) -> stub.writeInboxRefreshRoute(route) }
                emojiFontHolder?.let { init ->
                    mutableClassDefBy(init.substringBefore("->")).methods.single { it.hookId() == init }.injectEmojiFontHolder()
                }
            }
            recordControl(key)
            applied = true
        }
    }
}

@Suppress("unused")
val hideInboxAdsPatch = controlPatch("ads", "Hide inbox ads", "Filters typed inbox ad items, in case Meta brings back the inbox ads it stopped selling in November 2025.", "Inbox")
@Suppress("unused")
val hidePeoplePatch = controlPatch("people", "Hide People You May Know", "Hides suggested people in chats, search and stories, and on the People and Notifications tabs.", "Inbox", "people", "people_list_end", "people_jewel", "people_tab", "people_search", "people_story", INBOX_REFRESH_HOOK)
@Suppress("unused")
val hideFriendRequestsPatch = controlPatch("friend_requests", "Hide friend request cards", "Hides friend request cards inside the inbox.", "Inbox")
@Suppress("unused")
val hideJoinedCommunityChatsPatch = controlPatch("community_inbox", "Hide joined community chats",
    "Hides joined community-chat rows from the main inbox on its next render. Keeps Search, community folders, delivery and unread counts unchanged.", "Inbox")
@Suppress("unused")
val hideGrowthPatch = controlPatch("growth", "Hide growth prompts", "Hides the inbox's add-more-people promotion unit. " +
    "Also hides the tip sheets in notes, like Make my notes public, and the Share your own story card after someone else's stories.",
    "Inbox", "growth", "growth_notes", "growth_story_card")
@Suppress("unused")
val hideInboxPromotionsPatch = controlPatch("inbox_promotions", "Hide inbox promotions", "Hides Messenger quick-promotion banners in the chat list.", "Inbox")
@Suppress("unused")
val hideStoriesPatch = controlPatch("stories", "Hide stories and notes", "Hides the horizontal tray above chats.", "Inbox")
@Suppress("unused")
val hideSubtabsPatch = controlPatch("subtabs", "Hide inbox tabs", "Hides the Home and Channels subtabs.", "Inbox")
@Suppress("unused")
val hideFacebookPatch = controlPatch("facebook", "Hide Facebook shortcuts", "Hides Facebook toolbar, profile and sharing shortcuts, and Also from Meta in the Menu tab.", "Navigation")
@Suppress("unused")
val hideMetaAiPatch = controlPatch("meta_ai", "Hide Meta AI", "Hides the floating button, toolbar button, Meta AI tab, menu entries and search AI.", "Navigation", "ai_menu", "ai_fab", "ai_toolbar", "ai_tab", "ai_search", "ai_search_chip")
@Suppress("unused")
val hideMomentsPatch = controlPatch("moments", "Hide Chat Moments", "Hides the Chat Moments entry in the menu.", "Navigation")
@Suppress("unused")
val hideReelsBadgePatch = controlPatch("reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "Navigation")
@Suppress("unused")
val hideAiStickersPatch = controlPatch("ai_stickers", "Hide AI sticker tools", "Hides the Generate AI sticker buttons, generated-sticker tab and AI sticker suggestions.", "Stickers", "ai_stickers", "ai_sticker_cell")
@Suppress("unused")
val hideAvatarStickersPatch = controlPatch("avatar_stickers", "Hide avatar stickers", "Hides the avatar tab in the sticker keyboard.", "Stickers", "avatar_stickers", "avatar_tabs")
@Suppress("unused")
val restoreEmojiDrawerPatch = controlPatch("emoji_drawer", "Restore old emoji drawer",
    "Turns off Meta's redesigned emoji drawer, so the emoji keyboard keeps its earlier layout. " +
        "Changes apply after Restart Messenger. Accounts Meta never moved to the redesign see no difference.", "Stickers")
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
val enableBubblesPatch = controlPatch("bubbles", "Allow chat bubbles", "Offers Stock, Chat Heads and Native Bubbles on verified Messenger routes on Android 11 and newer.", "Links and bubbles", "bubbles", "bubble_mode")
@Suppress("unused")
val useSystemEmojiPatch = controlPatch("use_system_emoji", "Use system emoji", "Renders emoji with the phone's own font instead of Messenger's.", "Conversations", "emoji_typeface")
@Suppress("unused")
val originalPhotoPatch = controlPatch("original_photo", "Send photos at original quality", "With HD on, sends a JPEG photo's own image data instead of a re-encoded copy, without its metadata except the rotation tag. Videos and photos over 20 MB are still compressed.", "Conversations")
@Suppress("unused")
val originalVideoPatch = controlPatch("original_video", "Send videos without re-encoding",
    "Sends a video file as it is when Messenger's own passthrough can take it, instead of a re-encoded copy. " +
        "Videos over 25 MB are still compressed, and so are trimmed or edited videos and formats Messenger won't pass through.", "Conversations")
@Suppress("unused")
val keepMessageLogPatch = controlPatch("message_log", "Keep a message log",
    "Keeps a copy of each message as its notification arrives, so an unsend can't take it back. This is the only way " +
        "that reaches end-to-end encrypted chats. The log stays on your phone, encrypted with a key that never leaves it, " +
        "and holds only messages that raised a notification. Read it or clear it from the log in settings.", "Privacy")
@Suppress("unused")
val systemCameraPatch = controlPatch("system_camera", "Use the phone's camera app",
    "The camera button in a chat opens your phone's own camera app instead of Messenger's camera. " +
        "The photo you take opens in Messenger's editor for that chat, ready to send. Photos only.", "Conversations",
    manifest = { addSystemCamera() })
@Suppress("unused")
val stopAnalyticsUploadsPatch = controlPatch("analytics_uploads", "Stop analytics uploads",
    "Stops the background services Messenger's analytics logger uploads through. Messenger still records those events on your phone, " +
        "and they can upload after you turn this off. Doesn't stop other logging.", "Privacy")
@Suppress("unused")
val allowScreenshotPatch = controlPatch("allow_screenshot", "Allow screenshots", "Lets you screenshot protected chat media, including view-once media and Quicksnap, and stops screenshot notices. This doesn't add replay or saving.", "Privacy", "allow_screenshot", "screenshot_viewers")
@Suppress("unused")
val hideReadReceiptsPatch = controlPatch("hide_read_receipts", "Hide read receipts", "Stops sending read receipts. Opened encrypted chats can stay unread on this phone. Replying or switching this off may notify the sender. Group coverage isn't verified.", "Privacy", "hide_read_receipts", "read_mailbox")
@Suppress("unused")
val keepUnsentPatch = controlPatch("keep_unsent", "Keep unsent messages", "Preserves messages on verified legacy unsend routes. End-to-end encrypted chats are unsupported, and group coverage is unverified. Activity records intercepted legacy unsends, not chat support. Your own unsend may be limited.", "Privacy", "keep_unsent", "unsent_indicator", "delta_unsent")
@Suppress("unused")
val unlockAppIconsPatch = controlPatch("app_icons", "Unlock app icons", "Makes every icon in Messenger's App icon setting selectable without a subscription. " +
    "Messenger applies the icon with its own launcher switch. Messenger still decides whether that setting shows on your account, " +
    "and switching this off can bring its default icon back.", "Theme")
private var anonymousStoriesApplied = false

private val anonymousStoriesResources = resourcePatch(description = "Record HushMessenger capability: anonymous_stories") {
    dependsOn(settingsResources)
    execute {
        anonymousStoriesApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent("anonymous_stories") }
    }
    finalize {
        if (anonymousStoriesApplied) document("AndroidManifest.xml").use { it.addFeature("anonymous_stories") }
    }
}

@Suppress("unused")
val anonymousStoriesPatch = bytecodePatch(
    name = "View stories anonymously",
    description = "Opens other people's stories without adding you to their viewer list. Stories you open this way are marked as seen on your side. Long-press Messenger's home screen icon > Patch controls. Starts off.",
    default = true,
) {
    category("Privacy")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, anonymousStoriesResources)
    execute {
        validateControls(discoveredControls, setOf("anonymous_stories"))
        val handler = discoveredControls.getValue("anonymous_stories").single().let { original ->
            mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }
        }
        // The read set is checked before the first edit, so a build that moved it fails with the APK untouched.
        val readSetClass = mutableClassDefBy(handler.storyReadSetAdd().definingClass)
        val readSet = readSetClass.validateStoryReadSet(handler.storyReadSetAdd())
        injectControl("anonymous_stories", mapOf("anonymous_stories" to listOf(handler)))
        readSetClass.methods.single { it.hookId() == readSet.add }.injectStoryReadSetAdd(readSet)
        readSetClass.methods.single { it.name == "<init>" }.injectStoryReadSetSeed(readSet)
        recordControl("anonymous_stories")
        anonymousStoriesApplied = true
    }
}

private var saveStoriesApplied = false

private val saveStoriesResources = resourcePatch(description = "Record HushMessenger capability: save_stories") {
    dependsOn(settingsResources)
    execute {
        saveStoriesApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent("save_stories") }
    }
    finalize {
        if (saveStoriesApplied) document("AndroidManifest.xml").use { it.addFeature("save_stories") }
    }
}

@Suppress("unused")
val saveStoriesPatch = bytecodePatch(
    name = "Save any story",
    description = "Adds Save to the More options menu on other people's stories. The photo or video goes to your phone the same way Messenger saves your own. Long-press Messenger's home screen icon > Patch controls. Starts off.",
    default = true,
) {
    category("Privacy")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, saveStoriesResources)
    execute {
        validateControls(discoveredControls, setOf("save_stories"))
        val original = discoveredControls.getValue("save_stories").single()
        val builderClass = mutableClassDefBy(original.definingClass)
        val builder = builderClass.methods.single { it.hookId() == original.hookId() }
        // The menu, its Save item and the handler are all checked before the first edit.
        val save = builder.validateStorySave()
        classDefBy(save.handler).validateStoryMenuHandler(save)
        if (builderClass.methods.any { it.name == STORY_SAVE_HELPER }) {
            throw PatchException("Messenger controls: the story menu already has $STORY_SAVE_HELPER")
        }
        val direct = builderClass.directMethods
        val helper = storySaveHelper(original.definingClass, save)
        builderClass.methods.add(helper)
        direct.add(helper)
        builder.injectStorySave(save)
        recordControl("save_stories")
        saveStoriesApplied = true
    }
}

private val CHAT_ANIMATION_HOOKS = setOf("chat_animation", "chat_fragment", "chat_inbox", "chat_legacy")
private var chatAnimationApplied = false

private val chatAnimationResources = resourcePatch(description = "Record HushMessenger capability: chat_animation") {
    dependsOn(settingsResources)
    execute {
        chatAnimationApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent("chat_animation") }
    }
    finalize {
        if (!chatAnimationApplied) return@finalize
        // Search and notifications open a chat as an activity of its own, and Android animates those from resources.
        for ((path, xml) in CHAT_ANIMATION_FILES) {
            val file = get(path)
            if (file.exists()) throw PatchException("HushMessenger: $path is already in the APK. Start with the stock APK.")
            file.parentFile.mkdirs()
            file.writeText(xml)
        }
        document("AndroidManifest.xml").use { it.addFeature("chat_animation") }
    }
}

@Suppress("unused")
val chatAnimationPatch = bytecodePatch(
    name = "Slide chats in and out",
    description = "Slides a chat in from the side when you open it and back out when you go back, while the screen underneath holds still. Chat heads and bubbles keep their own animations. Long-press Messenger's home screen icon > Patch controls. Starts off.",
    default = true,
) {
    category("Navigation")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, chatAnimationResources)
    execute {
        validateControls(discoveredControls, CHAT_ANIMATION_HOOKS)
        fun original(key: String) = discoveredControls.getValue(key).single()
        fun mutable(key: String) = original(key).let { found ->
            mutableClassDefBy(found.definingClass).methods.single { it.hookId() == found.hookId() }
        }
        val chat = original("chat_fragment").definingClass
        val inbox = original("chat_inbox").definingClass
        // Everything is checked before the first edit, so a changed build fails with the APK untouched.
        for (type in listOf(chat, inbox)) validateInheritsFragmentAnimation(type) { classDefByOrNull(it) }
        // The extension slides chats opened from search and notifications by this activity's name.
        if (classDefByOrNull(CHAT_ACTIVITY) == null) throw PatchException(
            "Slide chats in and out: Messenger's chat activity differs from the tested builds. Start with an unmodified supported APK.",
        )
        val base = mutable("chat_animation").apply { validateFragmentAnimation() }
        val legacy = mutable("chat_legacy").apply { validateLegacyChatAnimation() }
        base.injectFragmentAnimation(chat, inbox)
        legacy.injectLegacyChatAnimation()
        recordControl("chat_animation")
        chatAnimationApplied = true
    }
}

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
    description = "Adds a HushMessenger entry to the Menu tab and side menu. Always on.",
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
        val refreshMethod = methods.single { it.returnType == "V" && it.parameterTypes.isEmpty() }
        // Inspect immutable sources and assemble the replacement before requesting any mutable target.
        addMethod.validateMenuSettingsAdd()
        bindMethod.validateMenuSettingsBind()
        drawerMethod.validateMenuDrawerAdd()
        val folderItemType = addMethod.menuFolderItemType()
        clickMethod.menuFolderCastIndex(folderItemType)
        val legacy = prepareLegacyDrawer(refreshMethod, addMethod, classDefBy(SETTINGS)) { classDefByOrNull(it) }
        val controls = classDefBy(HOST_SCREENS).methods.single { it.hookId() == BUNDLED_CONTROLS }
        MutableMethod(controls).writeBundledControls(bundledControls + "menu_row")
        val addTarget = mutableClassDefBy(addMethod.definingClass).methods.single { it.hookId() == addMethod.hookId() }
        val bindTarget = mutableClassDefBy(bindMethod.definingClass).methods.single { it.hookId() == bindMethod.hookId() }
        val drawerTarget = mutableClassDefBy(drawerMethod.definingClass).methods.single { it.hookId() == drawerMethod.hookId() }
        val clickTarget = mutableClassDefBy(clickMethod.definingClass).methods.single { it.hookId() == clickMethod.hookId() }
        val refreshTarget = mutableClassDefBy(refreshMethod.definingClass).methods.single { it.hookId() == refreshMethod.hookId() }
        val extension = mutableClassDefBy(SETTINGS)
        val stub = extension.methods.single { it.hookId() == LEGACY_SECTION }
        // MutableMethod.implementation has no setter. Keep both method indexes in sync when replacing it.
        val direct = extension.directMethods
        val factory = MutableMethod(legacy.factory)
        extension.methods.remove(stub)
        direct.remove(stub)
        extension.methods.add(factory)
        direct.add(factory)
        addTarget.injectMenuSettingsAdd()
        bindTarget.injectMenuSettingsBind()
        drawerTarget.injectMenuDrawerAdd()
        clickTarget.injectMenuFolderClick(folderItemType)
        refreshTarget.injectLegacyDrawer(legacy.refresh)
        recordControl("menu_row")
        menuRowApplied = true
    }
}
