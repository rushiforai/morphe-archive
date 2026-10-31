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
    // Settings get their own task, so Recents left a second card for them beside Messenger's (#54). Android still shows
    // the card while settings are in front, and drops it once anything else is.
    application.child("activity", "name" to "app.hushmessenger.extension.SettingsActivity",
        "label" to "HushMessenger settings", "exported" to "true", "excludeFromRecents" to "true",
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
        document("AndroidManifest.xml").use { it.addSettingsAccess() }
    }
}

internal var discoveredControls: Map<String, List<Method>> = emptyMap()
internal var nativeBubbleActivityVerified = false
internal var nativeBubbleRoutesVerified = false
internal var communityInboxContract: CommunityInboxContract? = null
/** Each control's hooks, filled as the control patches below are declared. HookInjectionReplayTest replays them. */
internal val controlHooks = linkedMapOf<String, Set<String>>()

internal val settingsExtension = bytecodePatch(description = "Load HushMessenger runtime controls") {
    dependsOn(settingsResources)
    extendWith("extensions/messenger.mpe")
    execute {
        activeProfile = controlProfileFor(packageMetadata.versionCode)
        val classes = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        patchStage("Read Messenger bytecode") { classDefForEach { classes.add(it) } }
        communityInboxContract = patchStage("Find community routes") { findCommunityInbox(classes) }
        discoveredControls = patchStage("Find runtime controls") { findControls(classes, communityInboxContract) }
        logoLongPressSites = findLogoLongPress(classes)
        menuTitleLongPressSites = findLogoLongPress(classes, MENU_TAB_TITLE)
        val nativeGate = discoveredControls["bubble_mode"].orEmpty().singleOrNull()
        nativeBubbleRoutesVerified = nativeBubbleActivityVerified && nativeGate != null &&
            findNativeBubbleRoutes(classes, nativeGate.hookId()) == activeProfile.nativeBubbleRoutes
        bundledControls.clear()
        hookScreenHosts()
        followShortcutWrites(classes)
        mutableClassDefBy(HOST_SCREENS).methods.single { it.hookId() == ORIGINAL_BUILD }
            .writeOriginalBuild(originalBuild(packageMetadata.versionName, packageMetadata.versionCode))
        resolveLogoutRoute(classes, mutableClassDefBy(HOST_SCREENS).methods.singleOrNull { it.hookId() == LOGOUT_ROUTE })
    }
    finalize {
        discoveredControls = emptyMap()
        bundledControls.clear()
        activeProfile = BASE_PROFILE
        nativeBubbleActivityVerified = false
        nativeBubbleRoutesVerified = false
        communityInboxContract = null
        logoLongPressSites = emptyList()
        menuTitleLongPressSites = emptyList()
        messageLogContract = null
        readReceiptThreadFields = emptyMap()
        markReadRecipe = null
        autoReplyPictureRecipe = null
        galleryRoute = null
        galleryChatRoute = null
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

/** The checks [hook]'s method has to pass before its control makes any edit. It edits nothing. */
internal fun MutableMethod.validateHook(hook: String) {
    if (hook in pluginGates) validatePluginGate()
    when (hook) {
        "ai_sticker_cell" -> validateAiStickerCell()
        "ai_sticker_grid" -> validateAiStickerGrid()
        "screenshot_viewers" -> validateScreenshotViewer()
        "subtabs" -> validateSubtabs()
        "browser" -> validateBrowserPreference()
        "people_jewel" -> validatePeopleSection()
        "people_tab" -> validatePeopleTab()
        "people_search" -> validatePeopleSearch()
        "people_story" -> validatePeopleStory()
        INBOX_REFRESH_HOOK -> validateInboxItems()
        "keep_unsent" -> validateKeepUnsent()
        "unsent_indicator" -> validateUnsentIndicator()
        "delta_unsent" -> validateDeltaUnsent()
        "emoji_typeface" -> validateEmojiTypeface()
        EMOJI_DRAWER -> validateEmojiDrawer()
        EMOJI_SEARCH -> validateEmojiSearch()
        TAB_BADGES -> validateTabBadges()
        TAB_CONFIG -> validateTabConfig()
        FACEBOOK_BADGE -> validateFacebookBadge()
        FACEBOOK_PROFILE_HEADER -> validateProfileHeader()
        AI_MENTIONS -> validateAiMentions()
        AI_COMMANDS -> validateAiCommands()
        AI_SEARCH_HINT -> validateAiSearchHint()
        AI_SEARCH_SCREEN_HINT -> validateAiSearchScreenHint()
        AI_MENTION_ROWS -> validateAiMentionRows()
        XHE_AUDIO -> validateXheAudio()
        XHE_TRANSCODE -> validateXheTranscode()
        DISAPPEARING_SWIPE -> validateDisappearingSwipe()
        RECENT_MEDIA -> validateRecentMedia()
        INSTANTS_BUTTON -> validateInstantsButton()
        SAVE_VOICE -> validateSaveVoice()
        HIDE_READ_RECEIPTS -> validateChatSeen()
        REPLY_READ -> validateReplyRead()
        MARK_READ_BAR -> validateMarkReadBar()
        MARK_READ_CLICK -> validateMarkReadClick()
        ANALYTICS_UPLOADS -> validateAnalyticsUpload()
        ATTRIBUTION_UPLOADS -> validateAttributionUpload()
        AD_EVENTS -> validateAdEvent()
        MQTT_TELEMETRY -> validateMqttTelemetry()
        PINNED_CHATS -> validatePinnedChatLimit()
        NEARBY_SCANS -> validateNearbyScans()
        WIFI_IDENTITY -> validateWifiIdentity()
        PHONE_ID_SYNC -> validatePhoneIdSync()
        STORY_HOLD -> validateStoryHold()
        SHARE_STORY -> validateShareStory()
        AVATAR_SHAPE -> validateAvatarShape()
        STORY_RING -> validateStoryRing()
        QUIET_CALL_RING -> validateQuietCallRing()
        QUIET_CALL_NOTIFICATION -> validateQuietCallNotification()
        CAR_MESSAGES -> validateCarMessages()
        TEXT_STYLE -> validateTextStyleField()
        MESSAGE_LOG, AUTO_REPLY -> validateMessageLog()
        UNSENT_RECALL -> validateUnsentRecall()
        UNSENT_CLEAR -> validateUnsentClear()
        "original_photo" -> validateOriginalPhoto()
        ORIGINAL_VIDEO -> validateOriginalVideo()
        SYSTEM_CAMERA -> validateSystemCamera()
        EXTERNAL_GALLERY -> validateExternalGallery()
        GALLERY_TO_CHAT -> validateGalleryToChat()
        in CUSTOM_FONT_HOOKS -> validateCustomFont(hook)
        "avatar_tabs" -> validateKeyboardTabsInline()
        "typing_mailbox" -> validateOutgoingTyping()
        "anonymous_stories" -> validateStorySeen()
        "growth_notes" -> validateNotesTips()
        "bubbles" -> validateBubbleEligibility()
        "bubble_mode" -> validateNativeBubbleMode()
        APP_ICONS -> validateAppIconGate()
        else -> validateSwitch()
    }
}

internal fun injectControl(key: String, methods: Map<String, List<MutableMethod>>) {
    // A multi-method control must pass every contract before its first edit.
    for ((hook, selectedMethods) in methods) for (method in selectedMethods) method.validateHook(hook)
    for ((hook, selectedMethods) in methods) for (method in selectedMethods) {
        when (hook) {
            "ai_sticker_cell" -> method.injectAiStickerCell()
            "ai_sticker_grid" -> method.injectAiStickerGrid()
            "screenshot_viewers" -> method.injectScreenshotViewer()
            "subtabs" -> method.injectSubtabs()
            "browser" -> method.injectBrowserPreference()
            "people_jewel" -> method.injectPeopleSection()
            "people_tab" -> method.injectPeopleTab()
            "people_search" -> method.injectPeopleSearch()
            "people_story" -> method.injectPeopleStory()
            INBOX_REFRESH_HOOK -> method.injectInboxItems()
            "stories" -> method.injectSwitch("$SETTINGS->hideStories()Z", "0x0")
            "facebook" -> method.injectSwitch("$SETTINGS->hideFacebook()Z", "0x0")
            FACEBOOK_PROFILE -> method.injectSwitch("$SETTINGS->hideFacebookProfile()Z", "0x0")
            "ai_menu", "ai_fab", "ai_toolbar", "ai_search", "ai_search_chip" -> method.injectSwitch("$SETTINGS->hideMetaAi()Z", "0x0")
            "ai_tab", AI_MUSE_TAB -> method.injectSwitch("$SETTINGS->hideMetaAiTab()Z", "0x0")
            TAB_PEOPLE -> method.injectSwitch("$SETTINGS->hidePeopleTab()Z", "0x0")
            TAB_NOTIFICATIONS -> method.injectSwitch("$SETTINGS->hideNotificationsTab()Z", "0x0")
            "typing" -> method.injectSwitch("$SETTINGS->suppressTyping()Z", "0x0")
            "bubbles" -> method.injectSwitch("$SETTINGS->enableBubbles()Z", "0x1")
            "bubble_mode" -> method.injectNativeBubbleMode()
            APP_ICONS -> method.injectAppIconGate()
            "allow_screenshot" -> method.injectSwitch("$SETTINGS->allowScreenshot()Z", "0x0")
            HIDE_READ_RECEIPTS -> method.injectChatSeen()
            REPLY_READ -> method.injectReplyRead()
            MARK_READ_BAR -> method.injectMarkReadBar()
            MARK_READ_CLICK -> method.injectMarkReadClick()
            "keep_unsent" -> method.injectKeepUnsent()
            "unsent_indicator" -> method.injectUnsentIndicator()
            "delta_unsent" -> method.injectDeltaUnsent()
            "emoji_typeface" -> method.injectEmojiTypeface()
            EMOJI_DRAWER -> method.injectEmojiDrawer()
            EMOJI_SEARCH -> method.injectEmojiSearch()
            TAB_BADGES -> method.injectTabBadges()
            TAB_CONFIG -> method.injectTabConfig()
            FACEBOOK_BADGE -> method.injectFacebookBadge()
            FACEBOOK_PROFILE_HEADER -> method.injectProfileHeader()
            AI_MENTIONS -> method.injectAiMentions()
            AI_COMMANDS -> method.injectAiCommands()
            AI_SEARCH_HINT -> method.injectAiSearchHint()
            AI_SEARCH_SCREEN_HINT -> method.injectAiSearchScreenHint()
            AI_MENTION_ROWS -> method.injectAiMentionRows()
            XHE_AUDIO -> method.injectXheAudio()
            XHE_TRANSCODE -> method.injectXheTranscode()
            DISAPPEARING_SWIPE -> method.injectDisappearingSwipe()
            RECENT_MEDIA -> method.injectRecentMedia()
            INSTANTS_BUTTON -> method.injectInstantsButton()
            SAVE_VOICE -> method.injectSaveVoice()
            ANALYTICS_UPLOADS -> method.injectAnalyticsUpload()
            ATTRIBUTION_UPLOADS -> method.injectAttributionUpload()
            AD_EVENTS -> method.injectAdEvent()
            MQTT_TELEMETRY -> method.injectMqttTelemetry()
            PINNED_CHATS -> method.injectPinnedChatLimit()
            NEARBY_SCANS -> method.injectNearbyScans()
            WIFI_IDENTITY -> method.injectWifiIdentity()
            PHONE_ID_SYNC -> method.injectPhoneIdSync()
            STORY_HOLD -> method.injectStoryHold()
            SHARE_STORY -> method.injectShareStory()
            AVATAR_SHAPE -> method.injectAvatarShape()
            STORY_RING -> method.injectStoryRing()
            QUIET_CALL_RING -> method.injectQuietCallRing()
            QUIET_CALL_NOTIFICATION -> method.injectQuietCallNotification()
            CAR_MESSAGES -> method.injectCarMessages()
            TEXT_STYLE -> method.injectTextStyleField()
            MESSAGE_LOG -> method.injectMessageLog()
            UNSENT_RECALL -> method.injectUnsentRecall()
            UNSENT_CLEAR -> method.injectUnsentClear()
            AUTO_REPLY -> method.injectAutoReply()
            "original_photo" -> method.injectOriginalPhoto()
            ORIGINAL_VIDEO -> method.injectOriginalVideo()
            SYSTEM_CAMERA -> method.injectSystemCamera()
            EXTERNAL_GALLERY -> method.injectExternalGallery()
            GALLERY_TO_CHAT -> method.injectGalleryToChat()
            in CUSTOM_FONT_HOOKS -> method.injectCustomFont(hook)
            "avatar_tabs" -> method.injectKeyboardTabsInline()
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
    val selected = hooks.toSet().ifEmpty { setOf(key) }
    controlHooks[key] = selected
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
        description = "$summary Starts off. Turn it on in HushMessenger settings > Controls.",
        default = true,
    ) {
        category(group)
        compatibleWith(MessengerTarget.COMPATIBILITY)
        dependsOn(settingsExtension, featureResources)
        execute {
            validateControls(discoveredControls, selected)
            // Proved on the stock classes, and the extension's half checked, before any target is edited.
            val inboxRoute = if (INBOX_REFRESH_HOOK in selected) {
                resolveInboxRefresh(discoveredControls.getValue(INBOX_REFRESH_HOOK).single()) { classDefByOrNull(it) } to inboxRefreshStub()
            } else null
            val emojiFontHolder = if ("emoji_typeface" in selected) {
                discoveredControls.getValue("emoji_typeface").single().emojiFontHolder { classDefByOrNull(it) }
            } else null
            val likeSnippet = if ("emoji_typeface" in selected) likeSnippetInit { classDefByOrNull(it) } else null
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
                // Settings then treats the control as unavailable (Settings.available), and the patcher log says why.
                if (!nativeBubbleRoutesVerified) java.util.logging.Logger.getLogger("").warning(
                    "Allow chat bubbles: this Messenger's native bubble routes don't match the tested build, so the switch shows as unavailable in HushMessenger settings")
            } else if (key == MARK_READ_BUTTON) {
                val recipe = markReadRecipe ?: throw PatchException("Messenger controls: the chat top bar's button recipe is missing")
                val host = mutableClassDefBy(MARK_READ)
                fun stub(id: String) = host.methods.singleOrNull { it.hookId() == id }
                    ?: throw PatchException("Messenger controls: the Mark as read button's extension stub is missing")
                // Built before the first edit, so a changed stub stops the patch with Messenger untouched.
                val built = listOf(stub(MARK_READ_BUILD).let { it to markReadSocketBuilder(it, recipe) },
                    stub(MARK_READ_BUTTON_BUILD).let { it to markReadBuilder(it, recipe) })
                injectControl(key, methods)
                // MutableMethod.implementation has no setter. Keep both method indexes in sync when replacing it.
                for ((old, new) in built) {
                    host.methods.remove(old)
                    host.directMethods.remove(old)
                    host.methods.add(new)
                    host.directMethods.add(new)
                }
            } else if (key == AUTO_REPLY) {
                val recipe = autoReplyPictureRecipe
                val host = mutableClassDefBy(SETTINGS)
                fun stub(id: String) = host.methods.singleOrNull { it.hookId() == id }
                    ?: throw PatchException("Messenger controls: the auto reply picture's extension stub is missing")
                // Built before the first edit, so a changed stub stops the patch with Messenger untouched.
                val built = if (recipe == null) emptyList() else listOf(
                    stub(AUTO_REPLY_PICTURE_MESSAGES).let { it to autoReplyMessagesBuilder(it, recipe) },
                    stub(AUTO_REPLY_SEND_MESSAGE).let { it to autoReplySendBuilder(it, recipe) },
                    stub(AUTO_REPLY_PICTURES).let { it to autoReplyPicturesFlag(it) })
                injectControl(key, methods)
                // MutableMethod.implementation has no setter. Keep both method indexes in sync when replacing it.
                for ((old, new) in built) {
                    host.methods.remove(old)
                    host.directMethods.remove(old)
                    host.methods.add(new)
                    host.directMethods.add(new)
                }
                // The settings then leave out the picture choice, and the patcher log says why.
                if (recipe == null) java.util.logging.Logger.getLogger("").warning(
                    "Auto reply: this Messenger's media send doesn't match the tested build, so replies go out as text only")
            } else {
                injectControl(key, methods)
                inboxRoute?.let { (route, stub) -> stub.writeInboxRefreshRoute(route) }
                emojiFontHolder?.let { init ->
                    mutableClassDefBy(init.substringBefore("->")).methods.single { it.hookId() == init }.injectEmojiFontHolder()
                }
                likeSnippet?.let { init ->
                    mutableClassDefBy(init.substringBefore("->")).methods.single { it.hookId() == init }.injectLikeSnippet()
                }
                if (emojiFontHolder != null && likeSnippet == null) java.util.logging.Logger.getLogger("").warning(
                    "Use system emoji: this Messenger builds its chat list snippet differently, so a Like there can still show as a box until Messenger's emoji font loads")
            }
            recordControl(key)
            applied = true
        }
    }
}

@Suppress("unused")
val hidePeoplePatch = controlPatch("people", "Hide People You May Know", "Hides suggested people in chats, search and stories, and on the People and Notifications tabs, so you only see people you know.", "Inbox", "people", "people_list_end", "people_jewel", "people_tab", "people_search", "people_story", INBOX_REFRESH_HOOK)
@Suppress("unused")
val hideFriendRequestsPatch = controlPatch("friend_requests", "Hide friend request cards", "Hides friend request cards in your chat list so they stop taking up room. It doesn't accept or decline anyone.", "Inbox")
@Suppress("unused")
val hideJoinedCommunityChatsPatch = controlPatch("community_inbox", "Hide joined community chats",
    "Hides the community chats you joined from your main chat list. Search and community folders still show them. Messages and unread counts don't change.", "Inbox")
@Suppress("unused")
val hideGrowthPatch = controlPatch("growth", "Hide growth prompts", "Hides prompts to add more people, the tip sheets in notes (like Make my notes public), and the Share your own story card after someone else's stories.",
    "Inbox", "growth", "growth_notes", "growth_story_card")
@Suppress("unused")
val hideInboxPromotionsPatch = controlPatch("inbox_promotions", "Hide inbox promotions", "Hides promotion banners in your chat list.", "Inbox")
@Suppress("unused")
val hideStoriesPatch = controlPatch("stories", "Hide stories and notes", "Hides the row of stories and notes above your chats, and the story rings around profile pictures.", "Inbox",
    "stories", STORY_RING)
@Suppress("unused")
val hideInstantsButtonPatch = controlPatch("instants_button", "Hide the Instants button",
    "Hides the + button that slides in at the right edge of your chat list and the one under your chat heads. Both open Instants.", "Inbox")
@Suppress("unused")
val hideSubtabsPatch = controlPatch("subtabs", "Hide inbox tabs", "Hides the All, Unread and Groups tabs above your chats.", "Inbox")
@Suppress("unused")
val hideMarkReadPatch = controlPatch("mark_read_action", "Hide Mark as read", "Hides Mark as read in the menu you get when you press and hold a chat in your chat list, so you can't mark a chat read by accident. Mark as unread stays.", "Inbox")
@Suppress("unused")
val pinMoreChatsPatch = controlPatch("pinned_chats", "Pin more chats", "Raises Messenger's limit of three pinned chats to 20, so you can keep more chats at the top of your chat list. Messenger's servers can still stop you sooner.", "Inbox")
@Suppress("unused")
val hideFacebookPatch = controlPatch("facebook", "Hide Facebook shortcuts", "Hides Facebook buttons, profile and sharing shortcuts, and the Also from Meta and Subscriptions sections in the Menu tab. Handy if you only use Messenger.", "Navigation", "facebook", FACEBOOK_PROFILE, FACEBOOK_PROFILE_HEADER)
@Suppress("unused")
val hideMetaAiPatch = controlPatch("meta_ai", "Hide Meta AI", "Hides the Meta AI floating button, toolbar button, tab and menu entries, plus AI in search and in @ suggestions. Restart Messenger to see the tab go.", "Navigation", "ai_menu", "ai_fab", "ai_toolbar", "ai_tab", AI_MUSE_TAB, "ai_search", "ai_search_chip", AI_MENTIONS, AI_COMMANDS, AI_SEARCH_HINT, AI_SEARCH_SCREEN_HINT, AI_MENTION_ROWS, TAB_CONFIG)
@Suppress("unused")
val hideMomentsPatch = controlPatch("moments", "Hide Chat Moments", "Hides Chat Moments in the menu.", "Navigation")
@Suppress("unused")
val hideReelsBadgePatch = controlPatch("reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "Navigation")
@Suppress("unused")
val hidePeopleTabPatch = controlPatch("tab_people", "Hide People tab", "Hides the People tab in the bar at the bottom. Restart Messenger to see the tab go.", "Navigation", TAB_PEOPLE, TAB_CONFIG)
@Suppress("unused")
val hideNotificationsTabPatch = controlPatch("tab_notifications", "Hide Notifications tab", "Hides the Notifications tab in the bar at the bottom. Restart Messenger to see the tab go.", "Navigation", TAB_NOTIFICATIONS, TAB_CONFIG)
@Suppress("unused")
val hideTabBadgesPatch = controlPatch("tab_badges", "Hide tab badges", "Hides the red dots and counts on the tabs at the bottom and on the Facebook button at the top. Turn on Keep for any you still want. Restart Messenger to see the change.",
    "Navigation", TAB_BADGES, FACEBOOK_BADGE)
@Suppress("unused")
val holdStoriesPatch = controlPatch("story_hold", "Hold stories at the end", "Keeps a story on screen when it ends instead of moving on to the next one, so you go on with a tap or a swipe. Photos and videos both wait, and the last story stays open until you close it.", "Navigation")
@Suppress("unused")
val hideAiStickersPatch = controlPatch("ai_stickers", "Hide AI sticker tools", "Hides the Generate and Generate AI sticker buttons, the AI sticker tab and AI sticker suggestions. Custom and music stickers in the Generate menu go with it.", "Stickers", "ai_stickers", "ai_sticker_cell", "ai_sticker_grid")
@Suppress("unused")
val hideAvatarStickersPatch = controlPatch("avatar_stickers", "Hide avatar stickers", "Hides the avatar tab in the sticker keyboard.", "Stickers", "avatar_stickers", "avatar_tabs")
@Suppress("unused")
val restoreEmojiDrawerPatch = controlPatch("emoji_drawer", "Restore old emoji drawer",
    "Turns off Meta's redesigned emoji keyboard, so you keep the earlier layout. Restart Messenger after changing it. If Meta never gave you the redesign, nothing changes.", "Stickers")
@Suppress("unused")
val keepEmojiSearchPatch = controlPatch("emoji_search", "Keep emoji search on emoji",
    "Typing while the emoji keyboard is open no longer jumps to sticker search. The keyboard stays on emoji.", "Stickers")
@Suppress("unused")
val hideChatPromotionsPatch = controlPatch("chat_promotions", "Hide chat promotions", "Hides promotion banners inside conversations.", "Conversations")
@Suppress("unused")
val hideAdContextBannerPatch = controlPatch("ad_context_banner", "Hide ad banners in business chats",
    "In a chat you started from a business's ad, hides the banner that shows that ad.", "Conversations")
@Suppress("unused")
val hideSuggestedRepliesPatch = controlPatch("suggested_replies", "Hide business reply suggestions", "Hides suggested replies in conversations with businesses.", "Conversations")
@Suppress("unused")
val hideBusinessSuggestionsPatch = controlPatch("business_suggestions", "Hide business typing suggestions", "Hides business suggestions that pop up as you type.", "Conversations")
@Suppress("unused")
val hideEventPromptsPatch = controlPatch("event_prompts", "Hide event prompts", "Hides event promotion prompts inside chats.", "Conversations")
@Suppress("unused")
val suppressTypingPatch = controlPatch("typing", "Hide typing indicator", "Stops Messenger from showing others when you're typing, even in end-to-end encrypted chats.", "Conversations", "typing", "typing_mailbox")
@Suppress("unused")
val externalBrowserPatch = controlPatch("external_browser", "Open web links externally", "Opens web links (http and https) in your default browser instead of inside Messenger. Other link types work as before.", "Links and bubbles", "browser")
@Suppress("unused")
val enableBubblesPatch = controlPatch("bubbles", "Allow chat bubbles", "Lets you pick Stock, Chat heads or Android bubbles for floating chats. Needs Android 11 or newer. Chat heads also needs Messenger's own Chat heads switch, and Android bubbles need Messenger's bubbles allowed in Android's notification settings.", "Links and bubbles", "bubbles", "bubble_mode")
@Suppress("unused")
val useSystemEmojiPatch = controlPatch("use_system_emoji", "Use system emoji", "Shows emoji in your phone's own style instead of Messenger's.", "Conversations", "emoji_typeface")
@Suppress("unused")
val originalPhotoPatch = controlPatch("original_photo", "Send photos at original quality", "With HD on, sends a JPEG photo at its full size instead of Messenger's smaller copy, so it stays sharp. Location is still removed. Photos over 20 MB are still made smaller.", "Photos and videos")
@Suppress("unused")
val originalVideoPatch = controlPatch("original_video", "Send videos without re-encoding",
    "Sends a video as the original file instead of a recompressed copy, when Messenger allows it. Videos over 25 MB, edited videos and some formats are still compressed.", "Photos and videos")
@Suppress("unused")
val xheAudioPatch = controlPatch("xhe_audio", "Fix videos that won't send",
    "Messenger stops two kinds of video with \"Unable to send\". One is a video whose only sound is xHE-AAC, which Facebook and Instagram now use. The other is a Samsung screen recording whose recorder tag Messenger's media check rejects. Whether you share one into Messenger from another app or pick it in a chat, the sound is converted to regular AAC, or the tag is dropped, so it sends. The picture isn't touched.", "Photos and videos", XHE_AUDIO, XHE_TRANSCODE)
@Suppress("unused")
val disappearingSwipePatch = controlPatch("disappearing_swipe", "Ignore the swipe up for disappearing messages",
    "Swiping up at the bottom of a chat no longer turns on disappearing messages, so a scroll can't set the timer by accident. You can still change it in the chat's settings.", "Conversations")
@Suppress("unused")
val hideRecentMediaPatch = controlPatch("recent_media", "Hide the recent photo card",
    "Stops the card above the message box that offers to send the screenshot, photo or video you just took. You can still send it from the gallery.", "Photos and videos")
@Suppress("unused")
val saveVoicePatch = controlPatch("save_voice", "Save voice messages you play",
    "Each voice message you play is also saved to Recordings/Messenger (Music/Messenger on Android 10 and 11), so your file manager and other players can open it. Playing it again doesn't save another copy. Needs Android 10 or newer.", "Photos and videos")
@Suppress("unused")
val hideShareStoryPatch = controlPatch("share_story", "Hide Your story when sharing",
    "When you share a photo, video or link into Messenger from another app, the Send to list no longer offers Your story, so a tap on Add can't post it by mistake. Your chats and groups are still there.", "Photos and videos")
@Suppress("unused")
val keepMessageLogPatch = controlPatch("message_log", "Keep a message log",
    "Saves each message when its notification arrives, so you can still read it if it's unsent, and marks the ones that were. Works in end-to-end encrypted chats too. Stays on your phone.", "Privacy",
    MESSAGE_LOG, UNSENT_RECALL, UNSENT_CLEAR)
@Suppress("unused")
val autoReplyPatch = controlPatch("auto_reply", "Auto reply",
    "Answers messages with replies you write in HushMessenger settings, when they have words you pick or any message at all. Replies go out through Messenger's own notification reply, encrypted chats too, at most once every five minutes per chat.", "Conversations")
@Suppress("unused")
val quietIncomingCallsPatch = controlPatch("quiet_calls", "Quiet incoming calls",
    "Calls still come in, but Messenger doesn't ring, vibrate or pop the call up over your screen. The call waits in the notification shade with Answer and Decline. A call you miss still shows in the chat. Only chosen chats keeps this to the chats you pick, and every other call rings. If the Facebook app is on your phone, it can still ring for the same call.", "Conversations",
    QUIET_CALL_RING, QUIET_CALL_NOTIFICATION)
@Suppress("unused")
val carMessagesPatch = controlPatch("car_messages", "Android Auto messages",
    "Lets Android Auto read your Messenger messages out loud and send the replies you speak, through its own messaging screen. Android Auto only shows apps installed from the Play Store until you turn on Unknown sources in its developer settings.", "Conversations")
@Suppress("unused")
val systemCameraPatch = controlPatch("system_camera", "Use the phone's camera app",
    "The camera button in a chat opens your phone's own camera app. The photo then opens in Messenger's editor, ready to send. Photos only.", "Photos and videos",
    manifest = { addSystemCamera() })
@Suppress("unused")
val externalGalleryPatch = controlPatch("external_gallery", "Open your gallery app",
    "The gallery button in a chat opens your phone's own gallery app. One photo or video opens in Messenger's editor for that chat, ready to send. Pick several and Messenger's Send to sheet opens with all of them and that chat at the top.", "Photos and videos",
    manifest = { addExternalGallery() })
@Suppress("unused")
val galleryToChatPatch = controlPatch("gallery_to_chat", "Put gallery picks in the chat",
    "With Open your gallery app on, what you pick goes into the chat's message box the way Messenger's own gallery puts it there, instead of the editor or the Send to sheet. Nothing goes out until you tap Send.", "Photos and videos")
@Suppress("unused")
val stopAnalyticsUploadsPatch = controlPatch("analytics_uploads", "Stop analytics uploads",
    "Stops the background services Messenger uses to upload usage statistics. It still records them on your phone, and they can upload after you turn this off.", "Privacy")
@Suppress("unused")
val stopAttributionUploadsPatch = controlPatch("attribution_uploads", "Stop ad attribution uploads",
    "Stops the job that reads your phone's advertising ID and sends it to Meta with your ad tracking setting. The ID itself doesn't change.", "Privacy")
@Suppress("unused")
val stopAdEventsPatch = controlPatch("ad_events", "Stop inbox and ad link logging",
    "Stops two reports Messenger logs. One says which part of your chat list was on screen, which Messenger files under inbox ads. The other says which ad brought you in when a link from an ad opens a chat.", "Privacy")
@Suppress("unused")
val stopMqttLoggingPatch = controlPatch("mqtt_telemetry", "Stop live connection logging",
    "Drops the health reports and push logging Messenger sends over its live connection (MQTT). Messenger sends most of its traffic another way, so there's often little for it to drop. Messages, calls and active status keep working.", "Privacy")
@Suppress("unused")
val stopNearbyScansPatch = controlPatch("nearby_scans", "Stop nearby scans",
    "Stops Messenger from reading the list of Wi-Fi networks around you, and hides the name and hardware address of the one you're connected to, the way Android does when Messenger can't see your location. Also stops the timer it can run while it's open to check your location and scan for Wi-Fi networks and Bluetooth devices.", "Privacy",
    NEARBY_SCANS, WIFI_IDENTITY)
@Suppress("unused")
val stopPhoneIdSyncPatch = controlPatch("phone_id_sync", "Stop app list and device ID sharing",
    "Stops Messenger from going through the apps on your phone to find other Meta apps, and from asking them for the device ID Meta uses to link the apps on one phone. Messenger keeps the ID it already has.", "Privacy")
@Suppress("unused")
val allowScreenshotPatch = controlPatch("allow_screenshot", "Allow screenshots", "Lets you screenshot protected chat media, such as view-once photos and Quicksnap, and stops screenshot notices. It doesn't add replay or saving.", "Privacy", "allow_screenshot", "screenshot_viewers")
@Suppress("unused")
val hideReadReceiptsPatch = controlPatch("hide_read_receipts", "Hide read receipts", "Opening a chat no longer tells people you read their message, and the chat stays unread on this phone. Marking it read yourself or replying in it marks it read and shows Seen, like Messenger does. Group chats aren't tested. Messenger's own Read receipts setting under Privacy & safety marks chats read without showing Seen.", "Privacy", HIDE_READ_RECEIPTS, REPLY_READ)
@Suppress("unused")
val markReadButtonPatch = controlPatch("mark_read_button", "Mark as read button", "Puts Messenger's Mark as read icon in a chat's top bar while Hide read receipts is on. Opening the chat still sends nothing, and a tap on the icon sends Seen and marks the chat read. It takes the place of the chat details button, since tapping the chat's name opens the same page, so the call buttons stay put.", "Privacy", MARK_READ_BAR, MARK_READ_CLICK)
@Suppress("unused")
val keepUnsentPatch = controlPatch("keep_unsent", "Keep unsent messages", "Keeps messages on screen after someone unsends them, in chats where it works. In end-to-end encrypted chats the message stays in its notification instead, since the chat itself can't keep it. Group chats aren't tested.", "Privacy", "keep_unsent", "unsent_indicator", "delta_unsent", UNSENT_RECALL, UNSENT_CLEAR)
@Suppress("unused")
val unlockAppIconsPatch = controlPatch("app_icons", "Unlock app icons", "Lets you pick any icon in Messenger's App icon setting without a subscription. Messenger still decides whether that setting shows for your account.", "Theme")
@Suppress("unused")
val avatarShapePatch = controlPatch("avatar_shape", "Square profile pictures",
    "Shows profile pictures as squares instead of circles, or as rounded squares with Round the corners on. Restart Messenger after changing it.", "Theme",
    AVATAR_SHAPE, STORY_RING)
@Suppress("unused")
val customFontPatch = controlPatch("custom_font", "Use your own font",
    "Shows Messenger's text in your phone's font instead of Meta's, or in a .ttf or .otf file you pick in HushMessenger settings. Emoji don't change. Restart Messenger after changing it.",
    "Theme", "font_layout", "font_repository", "font_roboto", "font_by_name", "font_input")
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
    description = "Opens other people's stories without adding you to their viewer list. Messenger still marks them as seen on your side. Starts off. Turn it on in HushMessenger settings > Controls.",
    default = true,
) {
    category("Privacy")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, anonymousStoriesResources)
    execute {
        validateControls(discoveredControls, setOf("anonymous_stories"))
        val handler = discoveredControls.getValue("anonymous_stories").single { it.definingClass != MONTAGE_BUCKET_PREVIEW }.let { original ->
            mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }
        }
        // The read set and the story preview are checked before the first edit, so a build that moved either fails
        // with the APK untouched.
        val readSetClass = mutableClassDefBy(handler.storyReadSetAdd().definingClass)
        val readSet = readSetClass.validateStoryReadSet(handler.storyReadSetAdd())
        val previewClass = mutableClassDefBy(MONTAGE_BUCKET_PREVIEW)
        val ring = previewClass.validateStoryRing()
        injectControl("anonymous_stories", mapOf("anonymous_stories" to listOf(handler)))
        readSetClass.methods.single { it.hookId() == readSet.add }.injectStoryReadSetAdd(readSet)
        readSetClass.methods.single { it.name == "<init>" }.injectStoryReadSetSeed(readSet)
        // The chat list's ring reads the preview, which Messenger fills from the server's seen state alone (#35).
        previewClass.injectStoryRing(ring, readSet.cardId)
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
    description = "Adds Save to the More options menu on other people's stories, so you can keep their photo or video on your phone. Starts off. Turn it on in HushMessenger settings > Controls.",
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
    description = "Slides a chat in from the side when you open it and back out when you go back. Chat heads and bubbles keep their own animations. Starts off. Turn it on in HushMessenger settings > Controls.",
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
        // The extension slides chats opened from search and notifications, and page and business chats, by these
        // activities' names.
        if (listOf(CHAT_ACTIVITY, BUSINESS_CHAT_ACTIVITY).any { classDefByOrNull(it) == null }) throw PatchException(
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

private var textStyleApplied = false

private val textStyleResources = resourcePatch(description = "Record HushMessenger capability: $TEXT_STYLE") {
    dependsOn(settingsResources)
    execute {
        textStyleApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent(TEXT_STYLE) }
    }
    finalize {
        if (textStyleApplied) document("AndroidManifest.xml").use {
            it.addFeature(TEXT_STYLE)
            it.addTextStyle()
        }
    }
}

@Suppress("unused")
val textStylePatch = bytecodePatch(
    name = "Bold and italic text",
    description = "Adds Bold and Italic to the menu that shows when you select words you typed. They're special Unicode letters, so they show on any phone, but screen readers may read them oddly. Starts off. Turn it on in HushMessenger settings > Controls.",
    default = true,
) {
    category("Conversations")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, textStyleResources)
    execute {
        validateControls(discoveredControls, setOf(TEXT_STYLE))
        val original = discoveredControls.getValue(TEXT_STYLE).single()
        val field = mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }
        // The chat box has no view id, and Android keeps every app's text actions out of a field without one.
        injectControl(TEXT_STYLE, mapOf(TEXT_STYLE to listOf(field)))
        // Recording it here lets a Root Mount install, which can't add the menu entries, show the switch as
        // unavailable instead of hiding it. The extension then leaves the chat box alone too.
        recordControl(TEXT_STYLE)
        textStyleApplied = true
    }
}

private var menuRowApplied = false
private var logoLongPressApplied = false

/** Recorded only when the long press on the Messenger logo at the top of Chats went in, so settings mention it then only. */
internal const val LOGO_LONG_PRESS = "logo_long_press"

// Lets the settings screen mention the Menu tab row and the logo only on builds that have them.
private val menuRowResources = resourcePatch(description = "Record HushMessenger capability: menu_row") {
    dependsOn(settingsResources)
    execute {
        menuRowApplied = false
        logoLongPressApplied = false
        document("AndroidManifest.xml").use {
            it.requireFeatureAbsent("menu_row")
            it.requireFeatureAbsent(LOGO_LONG_PRESS)
        }
    }
    finalize {
        document("AndroidManifest.xml").use {
            if (menuRowApplied) it.addFeature("menu_row")
            if (menuRowApplied && logoLongPressApplied) it.addFeature(LOGO_LONG_PRESS)
        }
    }
}

@Suppress("unused")
val menuSettingsPatch = bytecodePatch(
    name = "Open settings from menu",
    description = "Adds a HushMessenger entry to Messenger's Menu tab and side menu, and makes a long press on the Messenger logo at the top of Chats or on the Menu tab's title open these settings too. Works as soon as you patch it in. The settings App tab can turn off each way in, as long as one stays on.",
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
        // And a long press on the Messenger logo at the top of Chats or on the Menu tab's title. A build where either
        // handler isn't found in exactly one place keeps that title as it was, with a warning, and the rest still goes in.
        val logo = hookLogoLongPress()
        hookLogoLongPress(menuTitleLongPressSites, MENU_TAB_TITLE)
        recordControl("menu_row")
        if (logo) recordControl(LOGO_LONG_PRESS)
        menuRowApplied = true
        logoLongPressApplied = logo
    }
}
