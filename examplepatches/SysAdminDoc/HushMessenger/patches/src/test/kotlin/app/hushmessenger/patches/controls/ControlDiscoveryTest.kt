package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** Media viewers' window lock: FLAG_SECURE through Window.addFlags. */
private val SECURE_WINDOW_BODY = """
    const/16 v0, 0x2000
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V
    return-void
""".trimIndent()

private const val LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"

class ControlDiscoveryTest {
    private val originals = mapOf(
        "LX/2UL;" to "InboxSubtabsItemSupplierImplementation\$onSubscribe\$1",
        "LX/Ahp;" to "ConversationTypingContext\$sendActiveStateRunnable\$1",
        "LX/N2h;" to "SecureWindowUtils\$1",
        "LX/1hl;" to "MsysThreadViewFragment",
        "LX/1fs;" to "M4TabNavigationFragment",
        "LX/1hd;" to "ThreadViewFragment",
    )

    private fun completeFixture(): List<MutableClass> {
        val methods = syntheticHooks.filter { it.key !in setOf("unsent_indicator", "delta_unsent", "ai_sticker_cell", "ai_sticker_grid", "screenshot_viewers", COMMUNITY_INBOX, EMOJI_DRAWER, EMOJI_SEARCH, TAB_BADGES, FACEBOOK_BADGE, FACEBOOK_PROFILE_HEADER, TAB_CONFIG, AI_MENTIONS, AI_COMMANDS, AI_SEARCH_HINT, AI_SEARCH_SCREEN_HINT, AI_MENTION_ROWS, XHE_AUDIO, XHE_TRANSCODE, DISAPPEARING_SWIPE, RECENT_MEDIA, ANALYTICS_UPLOADS, ATTRIBUTION_UPLOADS, AD_EVENTS, MQTT_TELEMETRY, PINNED_CHATS, NEARBY_SCANS, WIFI_IDENTITY, PHONE_ID_SYNC, STORY_HOLD, SHARE_STORY, AVATAR_SHAPE, QUIET_CALL_RING, QUIET_CALL_NOTIFICATION, MARK_READ_BAR, MARK_READ_CLICK, TEXT_STYLE, MESSAGE_LOG, AUTO_REPLY, SYSTEM_CAMERA, EXTERNAL_GALLERY, HIDE_READ_RECEIPTS, REPLY_READ) + CUSTOM_FONT_HOOKS }.flatMap { (key, ids) ->
            ids.map { id ->
                if (key == "people_jewel") return@map peopleJewelMethod()
                if (key == "people_tab") return@map peopleTabMethod()
                if (key == "people_search") return@map peopleSearchMethod()
                if (key == "people_story") return@map peopleStoryMethod()
                if (key == INBOX_REFRESH_HOOK) return@map inboxItemsMethod()
                if (key == "bubbles") return@map bubbleEligibilityMethod()
                if (key == "bubble_mode") return@map nativeBubbleModeMethod()
                if (id == STORY_PREVIEW_INIT) return@map fixtureMethod(id, STORY_PREVIEW_INIT_BODY, registers = 23)
                val body = when (key) {
                    in pluginGates -> pluginBody(pluginGates.getValue(key).anchors.first())
                    "stories" -> """
                        const-string v0, "com.facebook.messaging.friendsinboxunit.plugins.inboxunit.FriendsInboxUnitKillSwitch"
                        const/4 v0, 0x1
                        return v0
                    """.trimIndent()
                    "facebook" -> """
                        new-instance v0, Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;
                        const/4 v0, 0x1
                        return v0
                    """.trimIndent()
                    FACEBOOK_PROFILE -> "new-instance v0, $FACEBOOK_PROFILE_BUTTON\nconst/4 v0, 0x1\nreturn v0"
                    "ai_menu" -> """
                        const-string v0, "com.facebook.messaging.navigation.plugins.aihomefolder.folderitem.AiHomeFolderItem"
                        const/4 v0, 0x1
                        return v0
                    """.trimIndent()
                    "ai_fab" -> "const-string v0, \"AiFabComponent\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "subtabs", "typing" -> "return-void"
                    "allow_screenshot" -> if (id.contains("(Landroid/view/Window;)")) SECURE_WINDOW_BODY else "return-void"
                    "keep_unsent" -> "const-string v0, \"com.facebook.stella.ipc.messenger.ACTION_REVOKE_MESSAGE\"\nreturn-void"
                    "ai_search" -> "const-string v0, \"com.facebook.messaging.search.aiagent.plugins.implementations.SearchAiagentImplementationsKillSwitch\"\nconst/4 v0, 0x1\nreturn v0"
                    "original_photo" -> when {
                        id == TRANSCODE_CONFIG -> TRANSCODE_CONFIG_BODY
                        id == DECODE_BITMAP -> DECODE_BITMAP_BODY
                        id.endsWith(")[B") -> "const/4 v0, 0x0\nreturn-object v0"
                        else -> "return-void"
                    }
                    ORIGINAL_VIDEO -> VIDEO_TRANSCODE_BODY.replaceFirst("\n", "\n$TRANSCODE_SOURCE_PARSE\n")
                    "emoji_typeface" -> "const-string v0, \"FacebookEmojiTypefaceProviderImpl\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "avatar_tabs" -> """
                        sget-object v0, $AVATAR_TAB_EVENT->A03:$AVATAR_TAB_EVENT
                        new-instance v1, Ljava/util/ArrayList;
                        invoke-static {}, $IMMUTABLE_LIST->builder()$LIST_BUILDER
                        move-result-object v2
                        invoke-virtual {v2, v1}, $LIST_BUILDER->addAll(Ljava/lang/Iterable;)$LIST_BUILDER
                        invoke-static {v2}, LX/32c;->A00($LIST_BUILDER)$IMMUTABLE_LIST
                        move-result-object v3
                        return-object v3
                    """.trimIndent()
                    "ai_search_chip" -> "const/4 v0, 0x0\nreturn-object v0"
                    "typing_mailbox" -> "const-string v0, \"$TYPING_MAILBOX_CALL\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "anonymous_stories" -> STORY_MARK_READ_BODY
                    "save_stories" -> "const-string v0, \"$STORY_MENU_TAG\"\nreturn-void"
                    "chat_animation" -> FRAGMENT_ANIMATION_BODY
                    "chat_fragment", "chat_inbox" -> "return-void"
                    "chat_legacy" -> LEGACY_CHAT_ANIMATION_BODY
                    "growth_notes" -> "const-string v0, \"$NOTES_TIP_SHEET\"\nconst-string v0, \"$NOTES_TIP_TYPE_ARG\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "growth_story_card" -> "sget-object v0, LX/JVI;->A0E:LX/1BL;\nconst/4 v0, 0x1\nreturn v0"
                    APP_ICONS -> APP_ICON_GATE_BODY
                    "menu_settings" -> when {
                        id.contains("ArrayList") ->
                            "const-string v0, \"messaging.navigation.settingsfolder.folderitem.SettingsFolderItem\"\nconst/4 v0, 0x0\nreturn-object v0"
                        id.contains("Ljava/util/List;") -> "return-void"
                        id.contains("onClick") -> "const-string v0, \"$DRAWER_FOLDER_SELECTED\"\nreturn-void"
                        id.endsWith("->A1i()V") -> "const-string v0, \"$DRAWER_REFRESH\"\nreturn-void"
                        else -> "const-string v0, \"Unknown ViewHolder\"\nreturn-void"
                    }
                    "browser" -> "const/4 v0, 0x0\nreturn v0"
                    else -> error("Missing synthetic resolver fixture for $key")
                }
                // 585's Context-reading app icon check is the one instance gate.
                val staticGate = (key in pluginGates || key == "ai_search" || key == "growth_story_card" ||
                    (key == APP_ICONS && "Landroid/content/Context;" !in id)) && !id.substringAfter('(').startsWith(')')
                fixtureMethod(id, body, registers = when (key) { "original_photo" -> 22; ORIGINAL_VIDEO -> 24;"chat_animation", "chat_legacy" -> 5; else -> 8 }, flags = AccessFlags.PUBLIC.value or
                    if (staticGate) AccessFlags.STATIC.value else 0)
            }
        }
        return (methods.groupBy { it.definingClass }.map { (type, grouped) ->
            val extra = when (type) {
                "LX/Txc;" -> listOf(fixtureMethod("LX/Txc;->CH7(Landroid/view/ViewGroup;I)LX/4jw;",
                    "new-instance v0, LX/TxV;\nconst/4 v0, 0x0\nreturn-object v0"))
                "LX/JZ6;" -> listOf(peopleTabFetchMethod())
                "LX/7Ya;" -> listOf(appIconAliasMap("LX/7Ya;"))
                else -> emptyList()
            }
            fixtureClass(type, grouped + extra, originals[type],
                if (type == "LX/8xp;") listOf(SCREEN_CAPTURE_CALLBACK) else emptyList())
        } + listOf(fixtureClass(IMMUTABLE_LIST, listOf(
            fixtureMethod("$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST",
                "const/4 v0, 0x0\nreturn-object v0", flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )), peopleJewelKeyHolder(), storyCardKeyHolder(), debugDumperFixture(), messageWrapperFixture(type = "LX/K1Y;"), searchFieldFixture()) +
            aiStickerCellFixture(grid = true) + communityInboxFixture().filter { it.type != IMMUTABLE_LIST } + emojiDrawerFixture() + emojiSearchFixture() + tabBadgesFixture() + tabConfigFixture() + aiMentionsFixture() + searchBarFixture() + searchScreenFixture() + profileHeaderFixture() + aiMentionRowsFixture() + shareCopyFixture() + disappearingSwipeFixture() + recentMediaFixture() + analyticsUploadFixture() + attributionUploadFixture() + adEventsFixture() + mqttClientFixture() + pinnedChatLimitFixture() + nearbyScansFixture() + phoneIdFixture() + storyHoldFixture() + shareStoryFixture() + avatarShapeFixture() + quietCallsFixture() + markReadFixture(immutableList = false) + textFieldFixture() + messageLogFixture() + readReceiptsFixture() + systemCameraFixture() + externalGalleryFixture() + customFontFixture() +
            syntheticHooks.getValue("screenshot_viewers").map { screenshotViewerFixture(it) }
                .groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) })
        .let { classes ->
            // Both privacy and community fixtures contribute contracts to the same native ThreadKey class.
            val keys = classes.filter { it.type == THREAD_KEY_TYPE }
            classes.filter { it.type != THREAD_KEY_TYPE } + fixtureClass(THREAD_KEY_TYPE,
                keys.flatMap { it.methods }, extraFields = keys.flatMap { it.fields },
                flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)
        }
    }

    // The search field builds a render-less click helper first, then the Ask Meta AI chip component.
    private fun searchFieldFixture() = fixtureClass("LX/OIp;", listOf(fixtureMethod("LX/OIp;->render(LX/2MZ;)LX/1GG;", """
        new-instance v1, LX/Dzn;
        new-instance v2, LX/D8E;
        const-string v3, "$SEARCH_CLEAR_TAG"
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())))

    @Test fun searchChipIsTheFirstRenderableComponentOfTheSearchField() {
        val fixture = completeFixture()
        validateControls(mirroredControls(fixture), setOf("ai_search_chip"))
        val withoutField = mirroredControls(fixture.filter { it.type != "LX/OIp;" })
        assertTrue(withoutField.getValue("ai_search_chip").isEmpty())
    }

    @Test fun discoversTheCompleteHookUnionThroughRealClassDefinitions() {
        val found = mirroredControls(completeFixture())
        validateControls(found)
        assertEquals(ExpectedTotals.DISCOVERY_FIXTURE_HOOKS, found.values.sumOf { it.size })
        for (key in syntheticHooks.keys) validateControls(found, setOf(key))
    }

    @Test fun theStoryRingHookIsOnlyThePreviewConstructorThatTakesTheCard() {
        val fixture = completeFixture()
        validateControls(mirroredControls(fixture), setOf("anonymous_stories"))
        val withoutPreview = mirroredControls(fixture.filter { it.type != MONTAGE_BUCKET_PREVIEW })
        assertEquals(listOf(STORY_MARK_READ_HOOK), withoutPreview.getValue("anonymous_stories").map { it.hookId() })
        assertFailsWith<PatchException> { validateControls(withoutPreview, setOf("anonymous_stories")) }
        // A preview constructor without the card, or the same constructor shape on another class, doesn't count.
        val noCard = fixtureMethod("$MONTAGE_BUCKET_PREVIEW-><init>(Landroid/os/Parcel;)V", "return-void", 2)
        val elsewhere = fixtureMethod(STORY_PREVIEW_INIT.replace("$MONTAGE_BUCKET_PREVIEW->", "LX/Zz9;->"), "return-void", 23)
        val moved = fixture.filter { it.type != MONTAGE_BUCKET_PREVIEW } +
            fixtureClass(MONTAGE_BUCKET_PREVIEW, listOf(noCard)) + fixtureClass("LX/Zz9;", listOf(elsewhere))
        assertFailsWith<PatchException> { validateControls(mirroredControls(moved), setOf("anonymous_stories")) }
        // A second constructor that takes a card makes the set differ from the build's, so the control stops.
        val extra = fixtureMethod("$MONTAGE_BUCKET_PREVIEW-><init>($MONTAGE_CARD)V", "return-void", 2)
        val doubled = fixture.map { if (it.type == MONTAGE_BUCKET_PREVIEW) fixtureClass(it.type, it.methods.toList() + extra) else it }
        assertFailsWith<PatchException> { validateControls(mirroredControls(doubled), setOf("anonymous_stories")) }
    }

    @Test fun aChangedViewerLeavesOnlyScreenshotDiscoveryUnavailable() {
        val classes = completeFixture()
        val method = classes.single { it.type == EPHEMERAL_VIEWER }.methods.single { it.name == "onResume" }
        method.replaceInstruction(method.screenshotViewerSites().first(), "nop")
        val before = lifecycleDex(classes)
        val found = mirroredControls(classes)
        validateControls(found, syntheticHooks.keys - "screenshot_viewers")
        assertFailsWith<PatchException> { validateControls(found, setOf("screenshot_viewers")) }
        kotlin.test.assertContentEquals(before, lifecycleDex(classes))
    }

    @Test fun aSuppliedUnavailableCommunityContractDoesNotRunDiscoveryAgain() {
        val found = mirroredControls(completeFixture(), null)
        assertTrue(found.getValue(COMMUNITY_INBOX).isEmpty())
        validateControls(found, syntheticHooks.keys - COMMUNITY_INBOX)
    }

    @Test fun anExtraInvalidViewerDisablesTheWholeControlInEitherMethodOrder() {
        for (first in listOf(false, true)) {
            val classes = completeFixture()
            val viewer = classes.single { it.type == EPHEMERAL_VIEWER }
            val extra = fixtureMethod("$EPHEMERAL_VIEWER->onResume(I)V", "return-void", 2)
            val methods = viewer.methods.toList()
            val changed = fixtureClass(viewer.type, if (first) listOf(extra) + methods else methods + extra)
            val found = mirroredControls(classes.filter { it !== viewer } + changed)
            validateControls(found, syntheticHooks.keys - "screenshot_viewers")
            assertTrue(found.getValue("screenshot_viewers").isEmpty())
            assertFailsWith<PatchException> { validateControls(found, setOf("screenshot_viewers")) }
        }
    }

    @Test fun peopleTabHandlerIsFoundOnlyThroughItsFetchCoroutine() {
        val fixture = completeFixture()
        validateControls(mirroredControls(fixture), setOf("people_tab"))
        val withoutFetch = fixture.map { cls ->
            if (cls.type != "LX/JZ6;") cls else fixtureClass(cls.type, cls.methods.filter { it.name != "A03" })
        }
        assertTrue(mirroredControls(withoutFetch).getValue("people_tab").isEmpty())
    }

    @Test fun screenshotHooksNeedTheCaptureInterfaceAndTheSecureFlag() {
        val fixture = completeFixture()
        validateControls(mirroredControls(fixture), setOf("allow_screenshot"))
        // The same callback name in a class that isn't Android's capture callback doesn't count.
        val callback = fixture.single { it.type == "LX/8xp;" }
        val notCallback = fixture.filter { it !== callback } + fixtureClass(callback.type, callback.methods.toList())
        assertFailsWith<PatchException> { validateControls(mirroredControls(notCallback), setOf("allow_screenshot")) }
        // A window helper that adds some other flag isn't the screenshot lock.
        val helper = fixture.single { it.type == "LX/4nW;" }
        val otherFlag = fixtureMethod("LX/4nW;->A00(Landroid/view/Window;)V", SECURE_WINDOW_BODY.replace("0x2000", "0x80"))
        val notSecure = fixture.filter { it !== helper } + fixtureClass(helper.type, listOf(otherFlag))
        assertFailsWith<PatchException> { validateControls(mirroredControls(notSecure), setOf("allow_screenshot")) }
    }

    @Test fun photoHooksAreOnlyTheTranscodersOwnEntryPoints() {
        val fixture = completeFixture()
        assertEquals(ORIGINAL_PHOTO_HOOKS, mirroredControls(fixture).getValue("original_photo").map { it.hookId() }.toSet())
        // The same methods on some other class aren't the encrypted-chat photo path.
        val lookalike = fixtureClass("LX/Fixture;", ORIGINAL_PHOTO_HOOKS.map {
            fixtureMethod(it.replace(MEDIA_TRANSCODER, "LX/Fixture;"), "return-void", registers = 22)
        })
        validateControls(mirroredControls(fixture + lookalike), setOf("original_photo"))
        assertTrue(mirroredControls(fixture.filter { it.type != MEDIA_TRANSCODER } + lookalike).getValue("original_photo").isEmpty())
    }

    @Test fun notificationsSuggestionsReaderNeedsTheStockKeyAndGetter() {
        val withoutKey = mirroredControls(completeFixture().filter { it.type != "LX/JTx;" })
        assertTrue(withoutKey.getValue("people_jewel").isEmpty())
        validateControls(withoutKey, setOf("people", "people_list_end"))
        for (changed in listOf(
            peopleJewelMethod(flags = AccessFlags.PUBLIC.value),
            peopleJewelMethod(key = "LX/JTx;->A00:LX/1BL;"),
        )) {
            val fixture = completeFixture().filter { it.type != "LX/HAR;" } + fixtureClass("LX/HAR;", listOf(changed))
            assertTrue(mirroredControls(fixture).getValue("people_jewel").isEmpty())
        }
    }

    @Test fun duplicateAndMissingAnchorsFailAfterActualDiscovery() {
        val fixture = completeFixture()
        val peopleClass = fixture.single { it.type == "LX/1pm;" }
        val duplicate = fixtureMethod("Lfixture/Duplicate;->gate()Z",
            pluginBody(pluginGates.getValue("people").anchors.single()))
        val ambiguous = mirroredControls(fixture + fixtureClass(duplicate.definingClass, listOf(duplicate)))
        assertFailsWith<PatchException> { validateControls(ambiguous, setOf("people")) }
        val missing = mirroredControls(fixture.filter { it !== peopleClass })
        assertFailsWith<PatchException> { validateControls(missing, setOf("people")) }
        validateControls(missing, setOf("moments"))
    }

    @Test fun misleadingPluginSignaturesAndChangedRunnableNamesDoNotMatch() {
        val fixture = completeFixture()
        val people = fixture.single { it.type == "LX/1pm;" }.methods.single { it.name == "A0C" }
        people.setReturnType("Ljava/lang/Object;")
        val subtabs = fixture.single { it.type == "LX/2UL;" }
        val changed = fixture.filter { it !== subtabs } + fixtureClass(subtabs.type, subtabs.methods.toList(), "ChangedRunnable")
        val found = mirroredControls(changed)
        assertFailsWith<PatchException> { validateControls(found, setOf("people")) }
        assertFailsWith<PatchException> { validateControls(found, setOf("subtabs")) }
        validateControls(found, setOf("typing"))
    }

    @Test fun nonStaticOwnerParameterDoesNotMatchAStaticPluginGate() {
        val id = "LX/PKW;->A01(LX/PKW;)Z"
        val method = fixtureMethod(id, pluginBody(pluginGates.getValue("avatar_stickers").anchors.single()))
        val classes: List<ClassDef> = listOf(fixtureClass(method.definingClass, listOf(method)))
        assertTrue(mirroredControls(classes).getValue("avatar_stickers").isEmpty())
        (classes.single() as MutableClass).methods.single().setAccessFlags(AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        validateControls(mirroredControls(classes), setOf("avatar_stickers"))
    }

    // The tab's kill switch also gates its own toolbar buttons; only the gate that builds the tab content is the tab.
    @Test fun theMetaAiTabIsTheTabContentGateNotItsToolbarButtons() {
        val killSwitch = "com.facebook.messaging.aibot.plugins.tab.AibotTabKillSwitch"
        // Same shape as the tab gate and the same kill switch, so only the anchor can tell the two apart.
        val toolbar = fixtureMethod("LX/GRu;->A02(LX/GRu;)Z", pluginBody(killSwitch).replaceFirst(
            "const-string", "const-string v1, \"com.facebook.messaging.aibot.plugins.tab.tabcontent.history.MetaAiHistoryTabToolbarButtonImplementation\"\n    const-string"),
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val withToolbar = completeFixture() + fixtureClass(toolbar.definingClass, listOf(toolbar))
        val found = mirroredControls(withToolbar)
        assertEquals(listOf("LX/1iN;->A02(LX/1iN;)Z"), found.getValue("ai_tab").map { it.hookId() })
        validateControls(found, setOf("ai_tab"))
        assertTrue(mirroredControls(withToolbar.filter { it.type != "LX/1iN;" }).getValue("ai_tab").isEmpty())
    }

    // The bottom bar builds every tab in one class; each tab switch takes only the gate that builds its own tab content.
    @Test fun thePeopleAndNotificationsTabsAreEachTheirOwnBottomBarGate() {
        val found = mirroredControls(completeFixture())
        assertEquals(listOf("LX/1iN;->A0D(LX/1iN;)Z"), found.getValue(TAB_PEOPLE).map { it.hookId() })
        assertEquals(listOf("LX/1iN;->A08(LX/1iN;)Z"), found.getValue(TAB_NOTIFICATIONS).map { it.hookId() })
        validateControls(found, setOf(TAB_PEOPLE, TAB_NOTIFICATIONS, "ai_tab"))
    }

    // Some accounts get MUSE, an AI agent tab, where the Meta AI tab goes. The bar builds it behind a gate of its own,
    // so Hide Meta AI takes that gate too, with the same held answer as the Meta AI tab.
    @Test fun hideMetaAiTakesTheMuseTabsGateAsWellAsTheMetaAiTabs() {
        val found = mirroredControls(completeFixture())
        assertEquals(listOf("LX/1iN;->A01(LX/1iN;)Z"), found.getValue(AI_MUSE_TAB).map { it.hookId() })
        assertEquals(listOf("LX/1iN;->A02(LX/1iN;)Z"), found.getValue("ai_tab").map { it.hookId() })
        validateControls(found, setOf("ai_tab", AI_MUSE_TAB))
        assertTrue(listOf("ai_tab", AI_MUSE_TAB, TAB_CONFIG).all { it in controlHooks.getValue("meta_ai") })
        val gate = fixtureMethod("LX/1iN;->A01(LX/1iN;)Z", pluginBody(pluginGates.getValue(AI_MUSE_TAB).anchors.single()),
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        injectControl("meta_ai", mapOf(AI_MUSE_TAB to listOf(gate)))
        val first = gate.implementation!!.instructions.first() as ReferenceInstruction
        assertEquals("$SETTINGS->hideMetaAiTab()Z", first.reference.toString())
    }

    // Messenger's Menu tab gives Meta's subscriptions (Facebook Plus, Meta Verified, Meta One) a section of their own next to
    // Also from Meta. Both are Facebook shortcuts. The tab's own sections, built by the same class, aren't.
    @Test fun theMenuTabsMetaSectionsAreFacebookShortcutGates() {
        val section = { name: String, plugin: String ->
            fixtureMethod("LX/WRg;->$name()Z", """
                new-instance v0, Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/$plugin;
                const/4 v0, 0x1
                return v0
            """.trimIndent())
        }
        val drawer = fixtureClass("LX/WRg;", listOf(
            section("A02", "fbshortcutsfoldersection/FacebookShortcutsFolderSection"),
            section("A05", "subscriptionsfoldersection/SubscriptionsFolderSection"),
            section("A04", "settingsfoldersection/SettingsDrawerFolderSectionImplementation"),
        ))
        val found = mirroredControls(listOf(drawer))
        assertEquals(setOf("LX/WRg;->A02()Z", "LX/WRg;->A05()Z"), found.getValue("facebook").map { it.hookId() }.toSet())
    }

    // Keep the Profile button (#51) spares only the gates that build nothing but the chat details Profile button.
    // A gate that also builds another Facebook shortcut stays with Hide Facebook shortcuts.
    @Test fun theProfileButtonGateIsItsOwnHookAndAMixedGateIsNot() {
        val gate = { name: String, body: String -> fixtureMethod("LX/Pf1;->$name()Z", "$body\nconst/4 v0, 0x1\nreturn v0") }
        val share = "Lcom/facebook/messaging/communitymessaging/plugins/channelinvite/sharetofacebookbutton/ShareToFacebookButtonImplementation;"
        val details = fixtureClass("LX/Pf1;", listOf(
            gate("A01", "new-instance v0, $FACEBOOK_PROFILE_BUTTON"),
            gate("A02", "new-instance v0, $FACEBOOK_PROFILE_BUTTON\nnew-instance v0, $FACEBOOK_PROFILE_BUTTON"),
            gate("A03", "new-instance v0, $FACEBOOK_PROFILE_BUTTON\nnew-instance v0, $share"),
            gate("A04", "new-instance v0, Lcom/facebook/messaging/profile/plugins/core/threadsettingsactionbutton/mute/ThreadSettingsMuteActionButton;"),
        ))
        val found = mirroredControls(listOf(details))
        assertEquals(setOf("LX/Pf1;->A01()Z", "LX/Pf1;->A02()Z"), found.getValue(FACEBOOK_PROFILE).map { it.hookId() }.toSet())
        assertEquals(listOf("LX/Pf1;->A03()Z"), found.getValue("facebook").map { it.hookId() })
    }

    // Both chat menu builders gate Mark as read by its plugin name. Mark as unread has the same shape and its own name.
    @Test fun markAsReadIsBothChatMenuGatesAndNotMarkAsUnread() {
        val unread = fixtureMethod("LX/MKS;->A0G()Z",
            pluginBody("com.facebook.messaging.threadlist.threaditemmenu.plugins.core.markunreadmenuitem.MarkUnreadMenuItemImplementation"))
        val classes = completeFixture().map { cls ->
            if (cls.type != unread.definingClass) cls
            else fixtureClass(cls.type, cls.methods.toList() + unread)
        }
        val found = mirroredControls(classes)
        assertEquals(setOf("LX/KHu;->A0W()Z", "LX/MKS;->A0F()Z"), found.getValue("mark_read_action").map { it.hookId() }.toSet())
        validateControls(found, setOf("mark_read_action"))
        assertFailsWith<PatchException> {
            validateControls(mirroredControls(classes.filter { it.type != "LX/KHu;" }), setOf("mark_read_action"))
        }
    }
}
