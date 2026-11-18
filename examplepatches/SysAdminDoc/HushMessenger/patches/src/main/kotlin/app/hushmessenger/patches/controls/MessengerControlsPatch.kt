package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.coexist.validateVersionCode
import app.hushmessenger.patches.messengerClasses
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
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
    // Labels and the icon are the APK's own resources, which settingsResources adds (#141).
    application.child("activity", "name" to "app.hushmessenger.extension.SettingsActivity",
        "label" to "@string/$SETTINGS_LABEL", "exported" to "true", "excludeFromRecents" to "true",
        "icon" to "@drawable/$SETTINGS_ICON", "taskAffinity" to "app.hushmessenger.settings")
    // The app drawer entry is an alias, so settings can hide it while the shortcuts and Menu tab row keep working.
    val launcher = application.child("activity-alias", "name" to "app.hushmessenger.extension.SettingsLauncher",
        "targetActivity" to "app.hushmessenger.extension.SettingsActivity", "label" to "@string/$SETTINGS_LABEL",
        "icon" to "@drawable/$SETTINGS_ICON", "exported" to "true")
    // Android opens the first launcher match for the package (Android Auto too), so this one sorts after Messenger's.
    val filter = launcher.child("intent-filter", "priority" to "-1")
    filter.child("action", "name" to "android.intent.action.MAIN")
    filter.child("category", "name" to "android.intent.category.LAUNCHER")
    // Launcher shortcuts start it as Messenger itself, so no other app needs a way to kill the process.
    application.child("activity", "name" to "app.hushmessenger.extension.RestartActivity",
        "label" to "@string/$RESTART_LABEL", "exported" to "false", "excludeFromRecents" to "true",
        "noHistory" to "true", "configChanges" to "orientation|screenSize|keyboardHidden",
        "theme" to "@android:style/Theme.Material.NoActionBar")
}

internal val settingsResources = patch(description = "Install HushMessenger settings") {
    execute {
        validateVersionCode(packageMetadata.versionCode)
        nativeBubbleActivityVerified = document("AndroidManifest.xml").use {
            it.requireNativeBubbleRoutesAbsent()
            it.hasNativeBubbleActivity()
        }
        document("AndroidManifest.xml").use { it.addSettingsAccess() }
        // One decode call: patcher 2 loads the whole APK again for each one.
        decode(*MANIFEST_STRINGS.keys.toTypedArray())
        if (!resourceFile(DEFAULT_STRINGS, false).exists()) throw PatchException("Messenger controls: Messenger has no $DEFAULT_STRINGS for the labels")
        for ((path, strings) in MANIFEST_STRINGS) if (resourceFile(path, false).exists()) document(path).use { it.addStrings(strings) }
        val icon = resourceFile(SETTINGS_ICON_PATH)
        if (icon.exists()) throw PatchException("HushMessenger: $SETTINGS_ICON_PATH is already in the APK. Start with the stock APK.")
        icon.parentFile.mkdirs()
        icon.writeText(SETTINGS_ICON_XML)
    }
}

internal var discoveredControls: Map<String, List<Method>> = emptyMap()
internal var nativeBubbleActivityVerified = false
internal var nativeBubbleRoutesVerified = false
internal var communityInboxContract: CommunityInboxContract? = null
/** Each control's hooks, filled as the control patches below are declared. HookInjectionReplayTest replays them. */
internal val controlHooks = linkedMapOf<String, Set<String>>()

internal val settingsExtension = patch(description = "Load HushMessenger runtime controls") {
    dependsOn(settingsResources)
    extendWith("extensions/messenger.mpe")
    execute {
        activeProfile = controlProfileFor(packageMetadata.versionCode)
        val classes = patchStage("Read Messenger bytecode") { messengerClasses() }
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
        quietChatContract = null
        readReceiptThreadFields = emptyMap()
        markReadRecipe = null
        messageLogButtonRecipe = null
        appThemePick = null
        saveVoiceMenuRecipe = null
        autoReplyPictureRecipe = null
        galleryRoute = null
        galleryChatRoute = null
        pasteRoute = null
        pinLimitGetters = emptySet()
        metaAiFlagGetters = emptySet()
        monospaceMakers = emptySet()
        aiStickerCells = emptyList()
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
        INBOX_SEARCH_BAR -> validateSearchBar()
        EMOJI_SEARCH -> validateEmojiSearch()
        TAB_BADGES -> validateTabBadges()
        TAB_CONFIG -> validateTabConfig()
        TAB_LABELS -> validateTabLabels()
        TAB_ICONS -> validateTabIcons()
        FACEBOOK_BADGE -> validateFacebookBadge()
        FACEBOOK_PROFILE_HEADER -> validateProfileHeader()
        AI_MENTIONS -> validateAiMentions()
        AI_COMMANDS -> validateAiCommands()
        AI_SEARCH_HINT -> validateAiSearchHint()
        AI_SEARCH_SCREEN_HINT -> validateAiSearchScreenHint()
        AI_MENTION_ROWS -> validateAiMentionRows()
        AI_SUMMARY -> validateAiSummary()
        XHE_AUDIO -> validateXheAudio()
        XHE_TRANSCODE -> validateXheTranscode()
        DISAPPEARING_SWIPE -> validateDisappearingSwipe()
        RECENT_MEDIA -> validateRecentMedia()
        INSTANTS_BUTTON -> validateInstantsButton()
        SAVE_VOICE -> validateSaveVoice()
        SAVE_VOICE_MENU -> validateSaveVoiceMenu()
        MESSAGE_ACTIONS -> validateMessageActions()
        MESSAGE_ACTIONS_MORE -> validateMessageActionsMore()
        HIDE_READ_RECEIPTS -> validateChatSeen()
        REPLY_READ -> validateReplyRead()
        DELIVERY_RECEIPT -> validateDeliveryReceipt()
        MARK_READ_BAR, HIDE_CALL_BAR -> validateMarkReadBar()
        CALL_BUTTON_BUILT -> validateCallButtonBuilt()
        HIDE_CALL_LISTS -> validateCallButtonLists()
        MARK_READ_CLICK -> validateMarkReadClick()
        LOCAL_READ -> validateLocalRead()
        ANALYTICS_UPLOADS -> validateAnalyticsUpload()
        ATTRIBUTION_UPLOADS -> validateAttributionUpload()
        AD_EVENTS -> validateAdEvent()
        DWELL_TRACKING -> validateDwellTracking()
        MQTT_TELEMETRY -> validateMqttTelemetry()
        LINK_PLAYER -> validateLinkPlayer()
        PINNED_CHATS -> validatePinnedChatLimit()
        PIN_ROWS -> pinRowSummary() ?: throw PatchException("Messenger controls: the Pin row's check changed (${hookId()})")
        PIN_ASK -> if (!isPinAsk()) throw PatchException("Messenger controls: the pin call changed (${hookId()})")
        PIN_DROP -> if (!isPinDrop() || pinStepKey() == null) throw PatchException("Messenger controls: the unpin call changed (${hookId()})")
        PIN_FULL -> pinFullSite() ?: throw PatchException("Messenger controls: the pin limit's answer changed (${hookId()})")
        PIN_LIST -> pinListTrace() ?: throw PatchException("Messenger controls: the chat list's read changed (${hookId()})")
        // Hide chosen chats and Special contacts share these; the second finds the first's hook already in.
        HIDDEN_CHAT_LIST -> if (!hiddenChatHooked(hook)) hiddenListSite() ?: throw PatchException("Messenger controls: the chat list's walk changed (${hookId()})")
        HIDDEN_CHAT_ROW -> if (!hiddenChatHooked(hook)) hiddenRowSite() ?: throw PatchException("Messenger controls: the chat menu's rows changed (${hookId()})")
        HIDDEN_CHAT_TAP -> if (!hiddenChatHooked(hook)) hiddenTapSummary() ?: throw PatchException("Messenger controls: the chat menu's tap changed (${hookId()})")
        NEARBY_SCANS -> validateNearbyScans()
        WIFI_IDENTITY -> validateWifiIdentity()
        PHONE_ID_SYNC -> validatePhoneIdSync()
        PASSKEY_LOGIN -> validatePasskeyLogin()
        STORY_HOLD -> validateStoryHold()
        CHAT_PREVIEW -> validateChatPreview()
        CHAT_PREVIEW_SIZE -> validateChatPreviewSize()
        INBOX_TYPING -> validateInboxTyping()
        MEDIA_CAPTION -> validateMediaCaption()
        CHAT_MENU_ITEMS -> validateChatMenuItems()
        LANDSCAPE_LOCK -> validatePortraitLock()
        LANDSCAPE_MEDIA -> validateMediaOrientation()
        BLOCKED_LIST_PICTURES -> validateBlockedListPictures()
        RESTRICTED_NOTIFY -> validateRestrictedNotify()
        SHARE_STORY -> validateShareStory()
        SHARE_STORY_TARGET -> validateShareStoryTarget()
        FLOATING_TAB_BAR -> validateFloatingTabBar()
        TAB_BAR_OVERLAY -> validateTabBarOverlay()
        TAB_BAR_SCROLL_AWAY -> validateTabBarScrollAway()
        TAB_SWIPE -> validateTabSwipe()
        AVATAR_SHAPE -> validateAvatarShape()
        STORY_RING -> validateStoryRing()
        QUIET_CALL_RING -> validateQuietCallRing()
        QUIET_CALL_NOTIFICATION -> validateQuietCallNotification()
        QUIET_MODE -> validateQuietModeNotify()
        CAR_MESSAGES -> validateCarMessages()
        CAR_EXTENSION_GATE -> validateCarExtensionGate()
        LOCAL_CHAT_SEARCH -> validateLocalChatSearch()
        CHAT_JUMP, SECURE_CHAT, INVISIBLE_BUTTONS, IOS_BARS -> validateChatJump()
        CALL_RECORDING -> validateCallRecording()
        HOME_HEADER -> validateHomeHeader()
        TEXT_STYLE -> validateTextStyleField()
        MESSAGE_LOG, AUTO_REPLY -> validateMessageLog()
        MESSAGE_LOG_BUTTON -> validateMessageLogBar()
        MESSAGE_LOG_CLICK -> validateMessageLogClick()
        UNSENT_RECALL -> validateUnsentRecall()
        UNSENT_CLEAR -> validateUnsentClear()
        QUIET_LOG_CHECK -> validateQuietLogCheck()
        QUIET_LOG_DROP -> validateQuietLogDrop()
        "original_photo" -> validateOriginalPhoto()
        ORIGINAL_VIDEO -> validateOriginalVideo()
        SYSTEM_CAMERA -> validateSystemCamera()
        EXTERNAL_GALLERY -> validateExternalGallery()
        INSTANT_GALLERY -> validateInstantGallery()
        VIEW_ONCE_ANYWHERE -> validateViewOnceAnywhere()
        APPEAR_OFFLINE, AVAILABILITY_SETTING -> validateAppearOffline()
        SPECIAL_CONTACTS -> validateSpecialContacts()
        MENU_BLUR -> validateMenuBlur()
        GALLERY_TEMP_FILE -> validateGalleryTempFile()
        GALLERY_TO_CHAT -> validateGalleryToChat()
        PASTE_PHOTO -> validatePastePhoto()
        in CUSTOM_FONT_HOOKS -> validateCustomFont(hook)
        "avatar_tabs" -> validateKeyboardTabsInline()
        "typing_mailbox" -> validateOutgoingTyping()
        "anonymous_stories" -> validateStorySeen()
        "growth_notes" -> validateNotesTips()
        "bubbles" -> validateBubbleEligibility()
        "bubble_mode" -> validateNativeBubbleMode()
        APP_ICONS -> validateAppIconGate()
        APP_THEMES -> validateAppThemeGate()
        APP_THEME_PICK -> validateAppThemePick()
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
            "ai_menu", "ai_fab", "ai_toolbar", "ai_search", "ai_search_chip", AI_SUMMARY -> method.injectSwitch("$SETTINGS->hideMetaAi()Z", "0x0")
            "ai_tab", AI_MUSE_TAB -> method.injectSwitch("$SETTINGS->hideMetaAiTab()Z", "0x0")
            TAB_PEOPLE -> method.injectSwitch("$SETTINGS->hidePeopleTab()Z", "0x0")
            TAB_NOTIFICATIONS -> method.injectSwitch("$SETTINGS->hideNotificationsTab()Z", "0x0")
            "typing" -> method.injectSwitch("$SETTINGS->suppressTyping()Z", "0x0")
            "bubbles" -> method.injectSwitch("$SETTINGS->enableBubbles()Z", "0x1")
            "bubble_mode" -> method.injectNativeBubbleMode()
            APP_ICONS -> method.injectAppIconGate()
            APP_THEMES -> method.injectAppThemeGate()
            APP_THEME_PICK -> method.injectAppThemePick()
            "allow_screenshot" -> method.injectSwitch("$SETTINGS->allowScreenshot()Z", "0x0")
            HIDE_READ_RECEIPTS -> method.injectChatSeen()
            REPLY_READ -> method.injectReplyRead()
            DELIVERY_RECEIPT -> method.injectDeliveryReceipt()
            MARK_READ_BAR, HIDE_CALL_BAR -> method.injectMarkReadBar()
            CALL_BUTTON_BUILT -> method.injectCallButtonBuilt()
            HIDE_CALL_LISTS -> method.injectCallButtonLists()
            MARK_READ_CLICK -> method.injectMarkReadClick()
            LOCAL_READ -> method.injectLocalRead()
            "keep_unsent" -> method.injectKeepUnsent()
            "unsent_indicator" -> method.injectUnsentIndicator()
            "delta_unsent" -> method.injectDeltaUnsent()
            "emoji_typeface" -> method.injectEmojiTypeface()
            EMOJI_DRAWER -> method.injectEmojiDrawer()
            INBOX_SEARCH_BAR -> method.injectSearchBar()
            EMOJI_SEARCH -> method.injectEmojiSearch()
            TAB_BADGES -> method.injectTabBadges()
            TAB_CONFIG -> method.injectTabConfig()
            TAB_LABELS -> method.injectTabLabels()
            TAB_ICONS -> method.injectTabIcons()
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
            SAVE_VOICE_MENU -> method.injectSaveVoiceMenu()
            MESSAGE_ACTIONS -> method.injectMessageActions()
            MESSAGE_ACTIONS_MORE -> method.injectMessageActionsMore()
            ANALYTICS_UPLOADS -> method.injectAnalyticsUpload()
            ATTRIBUTION_UPLOADS -> method.injectAttributionUpload()
            AD_EVENTS -> method.injectAdEvent()
            DWELL_TRACKING -> method.injectDwellTracking()
            MQTT_TELEMETRY -> method.injectMqttTelemetry()
            LINK_PLAYER -> method.injectLinkPlayer()
            PINNED_CHATS -> method.injectPinnedChatLimit()
            PIN_ROWS -> method.injectPinRow()
            PIN_ASK -> method.injectPinStep(PINNING_CALL)
            PIN_DROP -> method.injectPinStep(UNPINNING_CALL)
            PIN_FULL -> method.injectPinFull()
            PIN_LIST -> method.injectPinList()
            HIDDEN_CHAT_LIST -> method.injectHiddenChatList()
            HIDDEN_CHAT_ROW -> method.injectHiddenChatRow()
            HIDDEN_CHAT_TAP -> method.injectHiddenChatTap()
            CHAT_MENU_ITEMS -> method.injectChatMenuItems()
            NEARBY_SCANS -> method.injectNearbyScans()
            WIFI_IDENTITY -> method.injectWifiIdentity()
            PHONE_ID_SYNC -> method.injectPhoneIdSync()
            PASSKEY_LOGIN -> method.injectPasskeyLogin()
            STORY_HOLD -> method.injectStoryHold()
            CHAT_PREVIEW -> method.injectChatPreview()
            CHAT_PREVIEW_SIZE -> method.injectChatPreviewSize()
            INBOX_TYPING -> method.injectInboxTyping()
            MEDIA_CAPTION -> method.injectMediaCaption()
            LANDSCAPE_LOCK -> method.injectPortraitLock()
            LANDSCAPE_MEDIA -> method.injectMediaOrientation()
            BLOCKED_LIST_PICTURES -> method.injectBlockedListPictures()
            RESTRICTED_NOTIFY -> method.injectRestrictedNotify()
            SHARE_STORY -> method.injectShareStory()
            SHARE_STORY_TARGET -> method.injectShareStoryTarget()
            FLOATING_TAB_BAR -> method.injectFloatingTabBar()
            TAB_BAR_OVERLAY -> method.injectTabBarOverlay()
            TAB_BAR_SCROLL_AWAY -> method.injectTabBarScrollAway()
            TAB_SWIPE -> method.injectTabSwipe()
            AVATAR_SHAPE -> method.injectAvatarShape()
            STORY_RING -> method.injectStoryRing()
            QUIET_CALL_RING -> method.injectQuietCallRing()
            QUIET_CALL_NOTIFICATION -> method.injectQuietCallNotification()
            QUIET_MODE -> method.injectQuietModeNotify()
            CAR_MESSAGES -> method.injectCarMessages()
            CAR_EXTENSION_GATE -> method.injectCarExtensionGate()
            LOCAL_CHAT_SEARCH -> method.injectLocalChatSearch()
            CHAT_JUMP -> method.injectChatJump()
            SECURE_CHAT -> method.injectSecureChat()
            INVISIBLE_BUTTONS -> method.injectInvisibleButtons()
            IOS_BARS -> method.injectIosBars()
            CALL_RECORDING -> method.injectCallRecording()
            HOME_HEADER -> method.injectHomeHeader()
            TEXT_STYLE -> method.injectTextStyleField()
            MESSAGE_LOG -> method.injectMessageLog()
            MESSAGE_LOG_BUTTON -> method.injectMessageLogBar()
            MESSAGE_LOG_CLICK -> method.injectMessageLogClick()
            UNSENT_RECALL -> method.injectUnsentRecall()
            UNSENT_CLEAR -> method.injectUnsentClear()
            QUIET_LOG_CHECK -> method.injectQuietLogCheck()
            QUIET_LOG_DROP -> method.injectQuietLogDrop()
            AUTO_REPLY -> method.injectAutoReply()
            "original_photo" -> method.injectOriginalPhoto()
            ORIGINAL_VIDEO -> method.injectOriginalVideo()
            SYSTEM_CAMERA -> method.injectSystemCamera()
            EXTERNAL_GALLERY -> method.injectExternalGallery()
            INSTANT_GALLERY -> method.injectInstantGallery()
            VIEW_ONCE_ANYWHERE -> method.injectViewOnceAnywhere()
            APPEAR_OFFLINE, AVAILABILITY_SETTING -> method.injectAppearOffline()
            SPECIAL_CONTACTS -> method.injectSpecialContacts()
            MENU_BLUR -> method.injectMenuBlur()
            GALLERY_TEMP_FILE -> method.injectGalleryTempFile()
            GALLERY_TO_CHAT -> method.injectGalleryToChat()
            PASTE_PHOTO -> method.injectPastePhoto()
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
    manifest: (Document.() -> Unit)? = null): Patch {
    var applied = false
    var nativeRoutesApplied = false
    val selected = hooks.toSet().ifEmpty { setOf(key) }
    controlHooks[key] = selected
    val featureResources = patch(description = "Record HushMessenger capability: $key") {
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
    return patch(
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
            val pinRoute = if (PIN_LIST in selected) {
                val row = discoveredControls.getValue(PIN_ROWS).first { it.definingClass == PIN_MENU_ITEM }
                resolvePinnedChatRoute(row, discoveredControls.getValue(PIN_LIST).single()) { classDefByOrNull(it) } to pinnedChatStub()
            } else null
            val hiddenRoute = if (HIDDEN_CHAT_LIST in selected) {
                resolveHiddenChatRoute(discoveredControls.getValue(HIDDEN_CHAT_LIST).single(), discoveredControls.getValue(HIDDEN_CHAT_ROW).single(),
                    discoveredControls.getValue(HIDDEN_CHAT_TAP).single()) { classDefByOrNull(it) } to hiddenChatStub()
            } else null
            val swipeRoute = if (TAB_SWIPE in selected) {
                resolveTabSwipe(discoveredControls.getValue(TAB_SWIPE).single()) { classDefByOrNull(it) } to tabSwipeStub()
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
            } else if (key == MESSAGE_LOG) {
                val recipe = messageLogButtonRecipe ?: throw PatchException("Messenger controls: the Chats tab's button recipe is missing")
                val host = mutableClassDefBy(MESSAGE_LOG_BUTTON_CLASS)
                fun stub(id: String) = host.methods.singleOrNull { it.hookId() == id }
                    ?: throw PatchException("Messenger controls: the message log button's extension stub is missing")
                // Built before the first edit, so a changed stub stops the patch with Messenger untouched.
                val built = listOf(stub(MESSAGE_LOG_BUTTON_BUILD).let { it to messageLogButtonBuilder(it, recipe) },
                    stub(MESSAGE_LOG_BUTTON_ID_OF).let { it to messageLogButtonIdReader(it, recipe) })
                injectControl(key, methods)
                // MutableMethod.implementation has no setter. Keep both method indexes in sync when replacing it.
                for ((old, new) in built) {
                    host.methods.remove(old)
                    host.directMethods.remove(old)
                    host.methods.add(new)
                    host.directMethods.add(new)
                }
            } else if (key == SAVE_VOICE_MENU) {
                val recipe = saveVoiceMenuRecipe ?: throw PatchException("Messenger controls: the voice message Save row's recipe is missing")
                val host = mutableClassDefBy(SAVE_VOICE_MENU_HOST)
                // Built before the first edit, so a changed stub stops the patch with Messenger untouched.
                val built = SAVE_VOICE_MENU_STUBS.map { id ->
                    val stub = host.methods.singleOrNull { it.hookId() == id }
                        ?: throw PatchException("Messenger controls: the voice message Save row's extension stub is missing")
                    stub to saveVoiceMenuBuilder(stub, recipe)
                }
                injectControl(key, methods)
                for ((old, new) in built) { host.methods.remove(old); host.directMethods.remove(old); host.methods.add(new); host.directMethods.add(new) }
            } else if (key == "keep_unsent" || key == HIDDEN_WORDS) {
                // Built before the first edit, so a row class without the helper's getters stops the patch with Messenger
                // untouched. Only encrypted chats' CQL rows take the helper, and both controls that read a row's text
                // call the same one, so the control that got there first leaves nothing to add.
                val rows = methods["unsent_indicator"].orEmpty().filter { it.validateUnsentIndicator() }.map { it.definingClass }.distinct()
                val helpers = rows.map { mutableClassDefBy(it) to unsentRowHelper(it) }
                    .filter { (row, _) -> row.methods.none { it.name == UNSENT_ROW_HELPER } }
                for ((row, _) in helpers) row.checkUnsentRowHelper()
                injectControl(key, methods)
                for ((row, helper) in helpers) row.addUnsentRowHelper(helper)
            } else if (key == MEDIA_CAPTION) {
                // Built before the first edit, so a compose fragment that can't take the helper stops the patch with
                // Messenger untouched.
                val sends = methods.getValue(MEDIA_CAPTION)
                val helpers = sends.map { it.definingClass to it.validateMediaCaption().textSend }.distinct()
                    .map { (host, send) -> mutableClassDefBy(host) to mediaCaptionHelper(host, send) }
                for ((host, _) in helpers) host.checkMediaCaptionHelper()
                injectControl(key, methods)
                for ((host, helper) in helpers) host.addMediaCaptionHelper(helper)
            } else if (key == INBOX_SEARCH_BAR) {
                val host = mutableClassDefBy(SETTINGS)
                val stub = host.methods.singleOrNull { it.hookId() == SEARCH_ICON_STUB }
                    ?: throw PatchException("Messenger controls: the inbox search bar's extension stub is missing")
                // Built before the first edit, so a changed stub or check stops the patch with Messenger untouched.
                val readers = discoveredControls.getValue(INBOX_SEARCH_BAR)
                val check = searchIconCheck(readers) { classDefByOrNull(it) }
                val built = searchIconReader(stub, check)
                injectControl(key, methods)
                // MutableMethod.implementation has no setter. Keep both method indexes in sync when replacing it.
                host.methods.remove(stub)
                host.directMethods.remove(stub)
                host.methods.add(built)
                host.directMethods.add(built)
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
                pinRoute?.let { (route, stub) -> stub.writePinnedChatRoute(route) }
                hiddenRoute?.let { (route, stub) -> stub.writeHiddenChatRoute(route) }
                swipeRoute?.let { (route, stub) -> stub.writeTabSwipeRoute(route) }
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
val hideGrowthPatch = controlPatch("growth", "Hide growth prompts", "Hides prompts to add more people, the tip sheets in notes (like Make my notes public), the Share your own story card after someone else's stories, and the Turn on active status line at the top of a chat.",
    "Inbox", "growth", "growth_active_status", "growth_notes", "growth_story_card")
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
val inboxTypingPatch = controlPatch("inbox_typing", "Typing in your chat list",
    "Writes typing over a chat's last message in your list while the other person types, instead of only showing it once you're in the chat. Messenger carries this already and Meta's server keeps it off. Restart Messenger to see it start.",
    "Inbox", INBOX_TYPING)
@Suppress("unused")
val keepSearchBarPatch = controlPatch("inbox_search_bar", "Keep the search bar",
    "Brings back the search bar at the top of your chat list when Messenger has swapped it for a search icon. Restart Messenger after changing it. If Messenger never gave you the icon, nothing changes.", "Inbox")
@Suppress("unused")
val hideMarkReadPatch = controlPatch("mark_read_action", "Hide Mark as read", "Hides Mark as read in the menu you get when you press and hold a chat in your chat list, so you can't mark a chat read by accident. Mark as unread stays.", "Chat menu")
@Suppress("unused")
val previewChatsPatch = controlPatch("chat_preview", "Preview chats on long press",
    "Pressing and holding a chat opens Messenger's own preview of it, with the chat's menu underneath, so you can peek at a chat without opening it.", "Chat menu")
@Suppress("unused")
val biggerChatPreviewPatch = controlPatch("chat_preview_size", "Bigger chat preview",
    "Gives the chat more room in the preview you get when you press and hold a chat, and lets you scroll back through it there. The menu under it keeps a set height and scrolls when it has more items.", "Chat menu")
@Suppress("unused")
val pinMoreChatsPatch = controlPatch("pinned_chats", "Pin more chats", "Lets you pin chats past Messenger's limit and puts Pin back on chats that don't offer it. Pins past the limit stay on this phone, so they won't show on your other devices.", "Chat menu", PINNED_CHATS, PIN_ROWS, PIN_ASK, PIN_DROP, PIN_FULL, PIN_LIST)
@Suppress("unused")
val hideChosenChatsPatch = controlPatch("hidden_chats", "Hide chosen chats", "Adds Hide from chat list to the menu you get when you press and hold a chat. A hidden chat stays off your chat list when new messages come in, and search still finds it. Hiding stays on this phone, and you can unhide chats in HushMessenger settings. It doesn't stop notifications, so mute the chat in Messenger for that.", "Chat menu", HIDDEN_CHAT_LIST, HIDDEN_CHAT_ROW, HIDDEN_CHAT_TAP)
@Suppress("unused")
val specialContactsPatch = controlPatch("special_contacts", "Special contacts", "Adds Track this person to the menu you get when you press and hold a chat with one person. HushMessenger then keeps a history of when they come online, go offline, type to you and change their name, from what Messenger already shows you. The history stays on this phone, and you can read it in HushMessenger settings.", "Chat menu", SPECIAL_CONTACTS, HIDDEN_CHAT_LIST, HIDDEN_CHAT_ROW, HIDDEN_CHAT_TAP)
@Suppress("unused")
val hideChatMenuItemsPatch = controlPatch("chat_menu_items", "Hide chat menu items",
    "Hides the items you pick from the menu you get when you press and hold a chat in your chat list. Press and hold any chat once, and that menu's items show up under this switch for you to pick.", "Chat menu")
@Suppress("unused")
val hideFacebookPatch = controlPatch("facebook", "Hide Facebook shortcuts", "Hides Facebook buttons, profile and sharing shortcuts, and the Also from Meta and Subscriptions sections in the Menu tab. Handy if you only use Messenger.", "Navigation", "facebook", FACEBOOK_PROFILE, FACEBOOK_PROFILE_HEADER)
@Suppress("unused")
val hideMetaAiPatch = controlPatch("meta_ai", "Hide Meta AI", "Hides the Meta AI floating button, toolbar button, tab and menu entries, AI in search and in @ suggestions, and the offer to summarize a chat's unread messages. Restart Messenger to see the tab go.", "Navigation", "ai_menu", "ai_fab", "ai_toolbar", "ai_tab", AI_MUSE_TAB, "ai_search", "ai_search_chip", AI_MENTIONS, AI_COMMANDS, AI_SEARCH_HINT, AI_SEARCH_SCREEN_HINT, AI_MENTION_ROWS, AI_SUMMARY, TAB_CONFIG)
@Suppress("unused")
val hideMomentsPatch = controlPatch("moments", "Hide Chat Moments", "Hides Chat Moments in the menu.", "Navigation")
@Suppress("unused")
val hideReelsBadgePatch = controlPatch("reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "Navigation")
@Suppress("unused")
val hidePeopleTabPatch = controlPatch("tab_people", "Hide People tab", "Hides the People tab in the bar at the bottom. Restart Messenger to see the tab go.", "Tab bar", TAB_PEOPLE, TAB_CONFIG)
@Suppress("unused")
val showPeopleTabPatch = controlPatch("tab_people_show", "Show People tab", "Puts the People tab back in the bar at the bottom, right after Chats, on accounts where Messenger took it away. Restart Messenger to see the tab.", "Tab bar", TAB_CONFIG)
@Suppress("unused")
val showSettingsTabPatch = controlPatch("tab_settings_show", "Show settings tab", "Puts Messenger's own settings tab at the end of the bar at the bottom, with your picture on it, so your account settings are one tap away. Restart Messenger to see the tab.", "Tab bar", TAB_CONFIG)
@Suppress("unused")
val hideNotificationsTabPatch = controlPatch("tab_notifications", "Hide Notifications tab", "Hides the Notifications tab in the bar at the bottom. Restart Messenger to see the tab go.", "Tab bar", TAB_NOTIFICATIONS, TAB_CONFIG)
@Suppress("unused")
val hideStoriesTabPatch = controlPatch("tab_stories", "Hide Stories tab", "Hides the Stories tab in the bar at the bottom. Restart Messenger to see the tab go.", "Tab bar", TAB_CONFIG)
@Suppress("unused")
val hideTabLabelsPatch = controlPatch("hide_tab_labels", "Hide tab labels", "Takes the words off the tabs at the bottom and leaves the icons on their own. Screen readers still name every tab. Restart Messenger to see the change.",
    "Tab bar", TAB_LABELS)
@Suppress("unused")
val tabIconsPatch = controlPatch("tab_icons", "Your own tab icons", "Swaps the icons in the bar at the bottom for plain outlined ones, and lets you put your own picture on any tab. Restart Messenger to see the change.",
    "Tab bar", TAB_ICONS)
@Suppress("unused")
val hideTabBadgesPatch = controlPatch("tab_badges", "Hide tab badges", "Hides the red dots and counts on the tabs at the bottom and on the Facebook button at the top. Turn on Keep for any you still want. Restart Messenger to see the change.",
    "Tab bar", TAB_BADGES, FACEBOOK_BADGE)
@Suppress("unused")
val tabBarScrollAwayPatch = controlPatch("tab_bar_scroll_away", "Hide the tab bar while scrolling", "Slides the tab bar at the bottom out of the way as you scroll down your chats and brings it back when you scroll up. Restart Messenger to see the change.",
    "Tab bar", TAB_BAR_SCROLL_AWAY, TAB_BAR_OVERLAY)
@Suppress("unused")
val floatingTabBarPatch = controlPatch("floating_tab_bar", "Floating tab bar", "Switches the tab bar at the bottom to the floating style Messenger is trying out, which sits over your chats instead of below them. Messenger may keep its usual bar on some screens. Restart Messenger to see the change.",
    "Tab bar", FLOATING_TAB_BAR)
@Suppress("unused")
val tabSwipePatch = controlPatch("tab_swipe", "Swipe between tabs",
    "Swipe sideways on your chats to move to the next tab in the bar at the bottom, instead of reaching down for its button. Hidden tabs are skipped, and a list that scrolls sideways keeps the swipe. Restart Messenger after you turn it on.",
    "Tab bar", TAB_SWIPE)
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
val linkPlayerPatch = controlPatch("link_player", "Play video links in the chat",
    "Plays a shared YouTube, TikTok, Instagram or Facebook video in a window over the chat instead of sending you to the app or the browser. The video comes from the site's own player, so nothing is downloaded and the window keeps no cookies. Shortened links (youtu.be aside), Facebook stories and anything that isn't a video page open the way they always did.",
    "Links and bubbles")
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
val messageActionsPatch = controlPatch("message_actions", "Customize message actions",
    "Lets you choose the order of the actions you get by holding a message, and hide the ones you don't use, separately for messages you sent and messages you got. The first ones show in the row under the message and the rest under More.", "Conversations",
    MESSAGE_ACTIONS, MESSAGE_ACTIONS_MORE)
@Suppress("unused")
val mediaCaptionPatch = controlPatch("media_caption", "Put your words above the photo",
    "Type something, attach a photo or video, and your words go out first, as their own message above it, instead of underneath. Mentions still work. With nothing typed, nothing changes.", "Photos and videos", MEDIA_CAPTION)
@Suppress("unused")
val hideRecentMediaPatch = controlPatch("recent_media", "Hide the recent photo card",
    "Stops the card above the message box that offers to send the screenshot, photo or video you just took. You can still send it from the gallery.", "Photos and videos")
@Suppress("unused")
val saveVoicePatch = controlPatch("save_voice", "Save voice messages you play",
    "Each voice message you play is also saved to Recordings/Messenger (Music/Messenger on Android 10 and 11), so your file manager and other players can open it. Playing it again doesn't save another copy. Needs Android 10 or newer.", "Photos and videos")
@Suppress("unused")
val saveVoiceMenuPatch = controlPatch("save_voice_menu", "Save button for voice messages",
    "Adds Save voice message to the menu you get by holding a voice message, for saving just that one. It goes in the same folder as Save voice messages you play, and that switch can stay off.", "Photos and videos")
@Suppress("unused")
val hideShareStoryPatch = controlPatch("share_story", "Hide Your story when sharing",
    "When you share a photo, video or link into Messenger from another app, your phone's share menu no longer offers Messenger's Your story, so it goes straight to Chats. The Send to list drops Your story too, so a tap on Add can't post it by mistake. Your chats and groups are still there.", "Photos and videos",
    SHARE_STORY, SHARE_STORY_TARGET)
@Suppress("unused")
val keepMessageLogPatch = controlPatch("message_log", "Keep a message log",
    "Saves each message when its notification arrives, so you can still read it if it's unsent, and marks the ones that were. Works in end-to-end encrypted chats too. Stays on your phone. A clock next to the new message button in Chats can open the log too, and so can a row in the menu you get when you press and hold a chat, which opens just that chat's messages. Log chats that don't notify, under it, adds muted and restricted chats without notifying you.", "Privacy",
    MESSAGE_LOG, UNSENT_RECALL, UNSENT_CLEAR, MESSAGE_LOG_BUTTON, MESSAGE_LOG_CLICK, QUIET_LOG_CHECK, QUIET_LOG_DROP,
    HIDDEN_CHAT_LIST, HIDDEN_CHAT_ROW, HIDDEN_CHAT_TAP)
@Suppress("unused")
val autoReplyPatch = controlPatch("auto_reply", "Auto reply",
    "Answers messages with replies you write in HushMessenger settings, when they have words you pick or any message at all. Replies go out through Messenger's own notification reply, encrypted chats too, at most once every five minutes per chat.", "Conversations")
@Suppress("unused")
val quietIncomingCallsPatch = controlPatch("quiet_calls", "Quiet incoming calls",
    "Calls still come in, but Messenger doesn't ring, vibrate or pop the call up over your screen. The call waits in the notification shade with Answer and Decline. A call you miss still shows in the chat. Only chosen chats keeps this to the chats you pick, and every other call rings. If the Facebook app is on your phone, it can still ring for the same call.", "Calls",
    QUIET_CALL_RING, QUIET_CALL_NOTIFICATION)
@Suppress("unused")
val quietModePatch = controlPatch("quiet_mode", "Quiet mode",
    "A break from Messenger. Pick 15 minutes, an hour, two hours, eight hours or until you end it yourself, and nothing from Messenger makes a sound or vibrates for that long. Messages and calls still arrive and wait in the notification shade, so nothing goes missing. Every night, under it, does the same between two times you pick. Anyone on your Special contacts list still comes through.", "Notifications",
    QUIET_MODE, QUIET_CALL_RING, QUIET_CALL_NOTIFICATION)
@Suppress("unused")
val carMessagesPatch = controlPatch("car_messages", "Android Auto messages",
    "Lets Android Auto read your Messenger messages out loud and send the replies you speak, through its own messaging screen. Android Auto only shows apps installed from the Play Store. Unknown sources in its developer settings opens that up on a desktop head unit, and a real car can still leave Messenger out. Playing a message aloud marks the chat read and shows Seen, even with Hide read receipts on.", "Conversations",
    CAR_MESSAGES, CAR_EXTENSION_GATE)
@Suppress("unused")
val localChatSearchPatch = controlPatch("local_chat_search", "Search saved messages",
    "Adds a button to a chat's search results that searches the messages saved on this phone, for old chats Messenger's own search finds nothing in. It works in chats that aren't end-to-end encrypted, and it can only find what the phone has loaded.", "Conversations",
    manifest = { addLocalSearch() })
@Suppress("unused")
val chatJumpPatch = controlPatch("chat_jump", "Jump to the first message or a date",
    "Long press a chat's name at the top of the chat to jump to its first message or to a day you pick. An arrow at the bottom left of a chat goes to its first message, and a long press on the arrow asks for a day. Tapping one of the dates between the messages opens the same day picker on that day. Messenger loads a chat a page at a time, so it scrolls back with a count on screen until it gets there, and Cancel stops it. It can only go as far back as Messenger can load.", "Conversations",
    CHAT_JUMP)
@Suppress("unused")
val allowLandscapePatch = controlPatch("landscape", "Allow landscape",
    "Lets Messenger turn sideways with your phone, for a wider keyboard and bigger photos and videos. It follows your phone's auto-rotate setting. Calls, the camera, payments and a few other screens stay upright. Restart Messenger after you change it.", "Conversations",
    LANDSCAPE_LOCK, LANDSCAPE_MEDIA)
@Suppress("unused")
val callRecordingPatch = controlPatch("call_recording", "Record calls",
    "Adds a Record button over Messenger during a call. The call goes into one sound file in Recordings/Messenger Calls on your phone (Music/Messenger Calls on Android 10 and 11). While it's on, calls use Android's regular audio path instead of Messenger's own, and Messenger needs a restart after you change it. Messenger doesn't tell the other people, and recording laws differ from place to place, so get everyone's OK first.", "Calls")
@Suppress("unused")
val callCaptionsPatch = controlPatch("call_captions", "Live captions on calls",
    "Shows what the other people say during a call as captions over Messenger. Your phone makes them itself, and it can translate them into your language and read them aloud. It needs Android 13 or newer with speech recognition on the phone. While it's on, calls use Android's regular audio path instead of Messenger's own, and Messenger needs a restart after you change it.", "Calls",
    CALL_RECORDING, manifest = { addSpeechQueries() })
@Suppress("unused")
val hideCallButtonsPatch = controlPatch("hide_call_buttons", "Hide call buttons",
    "Takes the audio and video call buttons out of a chat's top bar, business chats and the New message screen, so you can't tap one by accident. Calls still ring, and you can still join one that's going.", "Calls", HIDE_CALL_BAR, HIDE_CALL_LISTS)
@Suppress("unused")
val callConfirmPatch = controlPatch("call_confirm", "Ask before a call",
    "Tapping an audio or video call button asks first, so a stray tap doesn't ring anyone. That covers a chat's top bar, business chats and the New message screen. Call starts it, Cancel doesn't. Calls coming in aren't affected.", "Calls", HIDE_CALL_BAR, CALL_BUTTON_BUILT)
@Suppress("unused")
val systemCameraPatch = controlPatch("system_camera", "Use the phone's camera app",
    "The camera button in a chat opens your phone's own camera app. The photo then opens in Messenger's editor, ready to send. Its Ask photo or video option records videos too.", "Photos and videos",
    manifest = { addSystemCamera() })
@Suppress("unused")
val externalGalleryPatch = controlPatch("external_gallery", "Open your gallery app",
    "The gallery button in a chat opens your phone's own gallery app. One photo or video opens in Messenger's editor for that chat, ready to send. Pick several and Messenger's Send to sheet opens with all of them and that chat at the top.", "Photos and videos",
    "external_gallery", GALLERY_TEMP_FILE, manifest = { addExternalGallery() })
@Suppress("unused")
val galleryToChatPatch = controlPatch("gallery_to_chat", "Put gallery picks in the chat",
    "With Open your gallery app on, what you pick goes into the chat's message box the way Messenger's own gallery puts it there, instead of the editor or the Send to sheet. Nothing goes out until you tap Send.", "Photos and videos")
@Suppress("unused")
val pastePhotoPatch = controlPatch("paste_photo", "Paste a photo into the chat",
    "A photo you paste into a chat goes into the chat's message box the way a pick from your gallery does, instead of going out on its own. Nothing is sent until you tap Send, so you can add a caption or change your mind. Pasted text and the keyboard's GIFs work as they did. Open the chat again after turning this on.", "Photos and videos")
@Suppress("unused")
val instantGalleryPatch = controlPatch("instant_gallery", "Send Instants from your gallery",
    "Tapping the shutter in Instants opens your phone's gallery app instead of taking a photo. The photo you pick goes out as the Instant, cut to the camera's shape. Back out of the gallery and nothing is sent.", "Photos and videos",
    manifest = { addInstantGallery() })
@Suppress("unused")
val viewOnceAnywherePatch = controlPatch("view_once_anywhere", "Offer View once in every chat",
    "Messenger's gallery shows the View once toggle in some chats only, so a group never gets it. This offers it everywhere the gallery opens. Whether the other side's Messenger treats it as View once is still up to Meta.",
    "Photos and videos")
@Suppress("unused")
val stopAnalyticsUploadsPatch = controlPatch("analytics_uploads", "Stop analytics uploads",
    "Stops the background services Messenger uses to upload usage statistics. It still records them on your phone, and they can upload after you turn this off.", "Tracking")
@Suppress("unused")
val stopAttributionUploadsPatch = controlPatch("attribution_uploads", "Stop ad attribution uploads",
    "Stops the job that reads your phone's advertising ID and sends it to Meta with your ad tracking setting. The ID itself doesn't change.", "Tracking")
@Suppress("unused")
val stopAdEventsPatch = controlPatch("ad_events", "Stop inbox and ad link logging",
    "Stops two reports Messenger logs. One says which part of your chat list was on screen, which Messenger files under inbox ads. The other says which ad brought you in when a link from an ad opens a chat.", "Tracking")
@Suppress("unused")
val stopDwellTrackingPatch = controlPatch("dwell_tracking", "Stop attention time logging",
    "Stops the report Messenger files when you leave a screen, which says how long you looked at each thing on it, in what order, and how often you came back. It also stops the copy of those timings that goes onto Messenger's journey log.", "Tracking")
@Suppress("unused")
val stopMqttLoggingPatch = controlPatch("mqtt_telemetry", "Stop live connection logging",
    "Drops the health reports and push logging Messenger sends over its live connection (MQTT). Messenger sends most of its traffic another way, so there's often little for it to drop. Messages, calls and active status keep working.", "Tracking")
@Suppress("unused")
val stopNearbyScansPatch = controlPatch("nearby_scans", "Stop nearby scans",
    "Stops Messenger from reading the list of Wi-Fi networks around you, and hides the name and hardware address of the one you're connected to, the way Android does when Messenger can't see your location. Also stops the timer it can run while it's open to check your location and scan for Wi-Fi networks and Bluetooth devices.", "Tracking",
    NEARBY_SCANS, WIFI_IDENTITY)
@Suppress("unused")
val stopPhoneIdSyncPatch = controlPatch("phone_id_sync", "Stop app list and device ID sharing",
    "Stops Messenger from going through the apps on your phone to find other Meta apps, and from asking them for the device ID Meta uses to link the apps on one phone. Messenger keeps the ID it already has.", "Tracking")
@Suppress("unused")
val allowScreenshotPatch = controlPatch("allow_screenshot", "Allow screenshots", "Lets you screenshot protected chat media, such as view-once photos and Quicksnap, and stops screenshot notices. It doesn't add replay or saving.", "Privacy", "allow_screenshot", "screenshot_viewers")
@Suppress("unused")
val secureChatPatch = controlPatch("secure_chat", "Block screenshots in chats",
    "Stops a screenshot or a screen recording of a chat you have open, on this phone, and leaves the chat out of the app switcher's preview. Android refuses the screenshot itself, so it works in every chat and not only the disappearing ones. A chat that was already open needs opening again. The person you're chatting with still has their own phone to screenshot on.",
    "Privacy", SECURE_CHAT)
@Suppress("unused")
val skipPasskeyLoginPatch = controlPatch("passkey_login", "Skip passkey sign-in",
    "Signing in no longer offers a passkey from this phone, so Facebook falls back to approving the login from another device you're signed in on, the way it does for an account with no passkey. A patched Messenger can't pass Facebook's passkey check, and that's what leaves some logins going round the browser check again and again. While it's on, Messenger can't use a passkey for its encrypted backups either, so leave it off unless a login is stuck. Turn it on in HushMessenger settings > Controls. A long press on Messenger's home screen icon opens those settings when the login won't let you through.",
    "Privacy")
@Suppress("unused")
val hideReadReceiptsPatch = controlPatch("hide_read_receipts", "Hide read receipts", "Opening a chat no longer tells people you read their message, and the chat stays unread on this phone. Marking it read yourself or replying in it marks it read and shows Seen, like Messenger does. Group chats aren't tested. Hide Delivered, under it, also holds back the Delivered tick in ordinary chats. Messenger's own Read receipts setting under Privacy & safety marks chats read without showing Seen.", "Privacy", HIDE_READ_RECEIPTS, REPLY_READ, DELIVERY_RECEIPT)
@Suppress("unused")
val readChatsLocallyPatch = controlPatch("read_chats_locally", "Mark chats read on this phone", "Clears the unread look of a chat you've opened while Hide read receipts is on, so the chat list stops showing it bold with a count. Nothing goes to Messenger, so the other person still isn't told you read it. A new message in the chat brings the unread look back.", "Privacy", LOCAL_READ)

val markReadButtonPatch = controlPatch("mark_read_button", "Mark as read button", "Puts Messenger's Mark as read icon in a chat's top bar while Hide read receipts is on. Opening the chat still sends nothing, and a tap on the icon sends Seen and marks the chat read. When the bar is full it takes the place of the chat details button (tapping the chat's name opens the same page), or of another button that isn't for calls when a chat doesn't have one, so the call buttons stay put.", "Privacy", MARK_READ_BAR, MARK_READ_CLICK)
@Suppress("unused")
val keepUnsentPatch = controlPatch("keep_unsent", "Keep unsent messages", "Keeps messages on screen after someone unsends them, marked [unsent]. In end-to-end encrypted chats it keeps the words Messenger already showed you, in the chat or a notification, until Messenger restarts. Group chats aren't tested.", "Privacy", "keep_unsent", "unsent_indicator", "delta_unsent", UNSENT_RECALL, UNSENT_CLEAR)
/**
 * Hide messages with your words shares three hooks with other controls instead of adding its own: the row text getter
 * Keep unsent messages reads, and the new-message notification pair the message log and Log chats that don't notify
 * read. Each hook's block runs both controls' gates, so either one works alone and neither changes with the other on.
 */
internal const val HIDDEN_WORDS = "hidden_words"
@Suppress("unused")
val hiddenWordsPatch = controlPatch("hidden_words", "Hide messages with your words", "Hides messages that have words you choose, which you type below separated by commas. A message that arrives with one of them shows as [hidden] in the chat instead of its words, and no notification goes up for it. Nothing is sent back and nothing is deleted, so the message is still there for whoever sent it, and the messages you send go out as they always did. The chat list's last line still shows Messenger's own preview of the message.", "Privacy", "unsent_indicator", MESSAGE_LOG, QUIET_LOG_DROP)
@Suppress("unused")
val appearOfflinePatch = controlPatch("appear_offline", "Appear offline", "Stops Messenger from telling people you're active, while you keep seeing who else is. Messenger's own Active status setting stays on, so the green dots in your chat list and the People tab work as they always did, and only what Messenger reports about you changes. It takes effect the next time Messenger goes to the background or comes back, so restarting it makes the change land right away.", "Privacy", APPEAR_OFFLINE, AVAILABILITY_SETTING)
@Suppress("unused")
val blockedListPicturesPatch = controlPatch("blocked_list_pictures", "Hide pictures on the Blocked list",
    "Hides people's profile pictures on the list of people you've blocked, under Privacy and safety. Their names and Unblock stay.", "Privacy")
@Suppress("unused")
val restrictedNotifyPatch = controlPatch("restricted_notify", "Notify for restricted chats",
    "Chats with people you've restricted notify you like your other chats. A chat you've muted stays quiet. Restricted people still can't see when you're active or when you've read their messages.", "Notifications")
@Suppress("unused")
val unlockAppIconsPatch = controlPatch("app_icons", "Unlock app icons", "Lets you pick any icon in Messenger's App icon setting without a subscription. Messenger still decides whether that setting shows for your account.", "Theme")
@Suppress("unused")
val unlockAppThemesPatch = controlPatch("app_themes", "Unlock app themes", "Lets you pick any theme in Messenger's Theme setting without a subscription, so light mode can get a color too. Messenger still decides which themes it offers your account.", "Theme",
    APP_THEMES, APP_THEME_PICK)
@Suppress("unused")
val avatarShapePatch = controlPatch("avatar_shape", "Square profile pictures",
    "Shows profile pictures as squares instead of circles, or as rounded squares with Round the corners on. Restart Messenger after changing it.", "Theme",
    AVATAR_SHAPE, STORY_RING)
@Suppress("unused")
val homeHeaderPatch = controlPatch("home_header", "Your own home header",
    "Puts words or a picture of your own at the top of the chat list in place of Messenger's wordmark. Type the words or pick the picture in HushMessenger settings. With neither, the wordmark stays.",
    "Theme", HOME_HEADER)
@Suppress("unused")
val customFontPatch = controlPatch("custom_font", "Use your own font",
    "Shows Messenger's text in your phone's font instead of Meta's, or in a .ttf or .otf file you pick in HushMessenger settings. Emoji don't change. Restart Messenger after changing it.",
    "Theme", "font_layout", "font_repository", "font_roboto", "font_by_name", "font_input")
@Suppress("unused")
val menuBlurPatch = controlPatch("menu_blur", "Blur behind menus",
    "Blurs the screen behind the menu you get when you press and hold a chat or a message, and behind Messenger's other pop-up menus and sheets, like on an iPhone. Needs Android 12 or newer.",
    "Theme", MENU_BLUR)
@Suppress("unused")
val invisibleButtonsPatch = controlPatch("invisible_buttons", "Invisible buttons",
    "Makes buttons you pick invisible or partly see-through while they keep their place, their size and what they do, so a tap still lands. Works on the chat list, inside chats and in menus, HushMessenger's own buttons included. Good for a button you keep hitting by mistake or one you'd rather not look at. Pick them in HushMessenger settings, where every button Messenger has shown you is listed by the name a screen reader says for it.",
    "Theme", INVISIBLE_BUTTONS)
@Suppress("unused")
val iosBarsPatch = controlPatch("ios_bars", "Translucent chat bars",
    "The chat's top bar and message box go see-through, with the messages scrolling under them and showing through blurred, the way the bars on an iPhone do it. Needs Android 12 or newer.",
    "Theme", IOS_BARS)
private var anonymousStoriesApplied = false

private val anonymousStoriesResources = patch(description = "Record HushMessenger capability: anonymous_stories") {
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
val anonymousStoriesPatch = patch(
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
        val viewerClass = mutableClassDefBy(MONTAGE_VIEWER)
        val viewerCreated = viewerClass.storyViewerCreated().let { found -> viewerClass.methods.single { it.hookId() == found.hookId() } }
        injectControl("anonymous_stories", mapOf("anonymous_stories" to listOf(handler)))
        readSetClass.methods.single { it.hookId() == readSet.add }.injectStoryReadSetAdd(readSet)
        readSetClass.methods.single { it.name == "<init>" }.injectStoryReadSetSeed(readSet)
        // The chat list's ring reads the preview, which Messenger fills from the server's seen state alone (#35).
        previewClass.injectStoryRing(ring, readSet.cardId)
        // The Mark as seen button rides on the story viewer's window (#169).
        viewerCreated.injectStoryViewerCreated()
        recordControl("anonymous_stories")
        anonymousStoriesApplied = true
    }
}

private var saveStoriesApplied = false

private val saveStoriesResources = patch(description = "Record HushMessenger capability: save_stories") {
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
val saveStoriesPatch = patch(
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

private val chatAnimationResources = patch(description = "Record HushMessenger capability: chat_animation") {
    dependsOn(settingsResources)
    execute {
        chatAnimationApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent("chat_animation") }
    }
    finalize {
        if (!chatAnimationApplied) return@finalize
        // Search and notifications open a chat as an activity of its own, and Android animates those from resources.
        for ((path, xml) in CHAT_ANIMATION_FILES) {
            val file = resourceFile(path)
            if (file.exists()) throw PatchException("HushMessenger: $path is already in the APK. Start with the stock APK.")
            file.parentFile.mkdirs()
            file.writeText(xml)
        }
        document("AndroidManifest.xml").use { it.addFeature("chat_animation") }
    }
}

@Suppress("unused")
val chatAnimationPatch = patch(
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

private val textStyleResources = patch(description = "Record HushMessenger capability: $TEXT_STYLE") {
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
val textStylePatch = patch(
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
private val menuRowResources = patch(description = "Record HushMessenger capability: menu_row") {
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
val menuSettingsPatch = patch(
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
