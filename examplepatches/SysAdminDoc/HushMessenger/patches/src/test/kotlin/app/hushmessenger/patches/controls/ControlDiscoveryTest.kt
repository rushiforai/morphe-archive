package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
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

class ControlDiscoveryTest {
    private val originals = mapOf(
        "LX/2UL;" to "InboxSubtabsItemSupplierImplementation\$onSubscribe\$1",
        "LX/Ahp;" to "ConversationTypingContext\$sendActiveStateRunnable\$1",
        "LX/N2h;" to "SecureWindowUtils\$1",
        "LX/AX0;" to "ReadThreadManager\$1",
    )

    private fun completeFixture(): List<MutableClass> {
        val methods = expectedHooks.filter { it.key != "unsent_indicator" && it.key != "delta_unsent" }.flatMap { (key, ids) ->
            ids.map { id ->
                if (key == "people_jewel") return@map peopleJewelMethod()
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
                    "ai_menu" -> """
                        const-string v0, "com.facebook.messaging.navigation.plugins.aihomefolder.folderitem.AiHomeFolderItem"
                        const/4 v0, 0x1
                        return v0
                    """.trimIndent()
                    "ai_fab" -> "const-string v0, \"AiFabComponent\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "subtabs", "typing", "hide_read_receipts" -> "return-void"
                    "allow_screenshot" -> if (id.contains("(Landroid/view/Window;)")) SECURE_WINDOW_BODY else "return-void"
                    "keep_unsent" -> "const-string v0, \"com.facebook.stella.ipc.messenger.ACTION_REVOKE_MESSAGE\"\nreturn-void"
                    "ai_search" -> "const-string v0, \"com.facebook.messaging.search.aiagent.plugins.implementations.SearchAiagentImplementationsKillSwitch\"\nconst/4 v0, 0x1\nreturn v0"
                    "emoji_typeface" -> "const-string v0, \"FacebookEmojiTypefaceProviderImpl\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "avatar_tabs" -> "sget-object v0, $AVATAR_TAB_EVENT->A03:$AVATAR_TAB_EVENT\nreturn-object v0"
                    "ai_search_chip" -> "const/4 v0, 0x0\nreturn-object v0"
                    "typing_mailbox" -> "const-string v0, \"$TYPING_MAILBOX_CALL\"\nconst/4 v0, 0x0\nreturn-object v0"
                    "read_mailbox" -> "const-string v0, \"$READ_MAILBOX_CALL\"\nreturn-void"
                    "menu_settings" -> when {
                        id.contains("ArrayList") ->
                            "const-string v0, \"messaging.navigation.settingsfolder.folderitem.SettingsFolderItem\"\nconst/4 v0, 0x0\nreturn-object v0"
                        id.contains("Ljava/util/List;") -> "return-void"
                        id.contains("onClick") -> "const-string v0, \"$DRAWER_FOLDER_SELECTED\"\nreturn-void"
                        else -> "const-string v0, \"Unknown ViewHolder\"\nreturn-void"
                    }
                    "bubbles" -> """
                        sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
                        const/4 v1, 0x0
                        invoke-virtual {v1}, Landroid/app/ActivityManager;->isLowRamDevice()Z
                        move-result v0
                        return v0
                    """.trimIndent()
                    "browser" -> """
                        const-string v0, "iab_skipped_reason"
                        const-string v0, "user_prefers_external"
                        const/4 v0, 0x0
                        return v0
                    """.trimIndent()
                    "ads" -> """
                        const-string v0, "messaging.inbox.itemlistprocessor.ItemListProcessorInterfaceSpec"
                        const-string v0, "processItems"
                        const-string v0, "new_friend_bump_threads"
                        const/4 v0, 0x0
                        return-object v0
                    """.trimIndent()
                    else -> error("Missing synthetic resolver fixture for $key")
                }
                val staticGate = (key in pluginGates || key == "ai_search") && !id.substringAfter('(').startsWith(')')
                fixtureMethod(id, body, flags = AccessFlags.PUBLIC.value or
                    if (staticGate) AccessFlags.STATIC.value else 0)
            }
        }
        return methods.groupBy { it.definingClass }.map { (type, grouped) ->
            val extra = if (type == "LX/Txc;") listOf(
                fixtureMethod("LX/Txc;->CH7(Landroid/view/ViewGroup;I)LX/4jw;",
                    "new-instance v0, LX/TxV;\nconst/4 v0, 0x0\nreturn-object v0")
            ) else emptyList()
            fixtureClass(type, grouped + extra, originals[type],
                if (type == "LX/8xp;") listOf(SCREEN_CAPTURE_CALLBACK) else emptyList())
        } + listOf(fixtureClass(AD_ITEM), fixtureClass(IMMUTABLE_LIST, listOf(
            fixtureMethod("$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST",
                "const/4 v0, 0x0\nreturn-object v0", flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )), peopleJewelKeyHolder(), debugDumperFixture(), messageWrapperFixture(type = "LX/K1Y;"), searchFieldFixture())
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
        validateControls(findControls(fixture), setOf("ai_search_chip"))
        val withoutField = findControls(fixture.filter { it.type != "LX/OIp;" })
        assertTrue(withoutField.getValue("ai_search_chip").isEmpty())
    }

    @Test fun discoversTheCompleteHookUnionThroughRealClassDefinitions() {
        val found = findControls(completeFixture())
        validateControls(found)
        assertEquals(79, found.values.sumOf { it.size })
        for (key in expectedHooks.keys) validateControls(found, setOf(key))
    }

    @Test fun screenshotHooksNeedTheCaptureInterfaceAndTheSecureFlag() {
        val fixture = completeFixture()
        validateControls(findControls(fixture), setOf("allow_screenshot"))
        // The same callback name in a class that isn't Android's capture callback doesn't count.
        val callback = fixture.single { it.type == "LX/8xp;" }
        val notCallback = fixture.filter { it !== callback } + fixtureClass(callback.type, callback.methods.toList())
        assertFailsWith<PatchException> { validateControls(findControls(notCallback), setOf("allow_screenshot")) }
        // A window helper that adds some other flag isn't the screenshot lock.
        val helper = fixture.single { it.type == "LX/4nW;" }
        val otherFlag = fixtureMethod("LX/4nW;->A00(Landroid/view/Window;)V", SECURE_WINDOW_BODY.replace("0x2000", "0x80"))
        val notSecure = fixture.filter { it !== helper } + fixtureClass(helper.type, listOf(otherFlag))
        assertFailsWith<PatchException> { validateControls(findControls(notSecure), setOf("allow_screenshot")) }
    }

    @Test fun notificationsSuggestionsReaderNeedsTheStockKeyAndGetter() {
        val withoutKey = findControls(completeFixture().filter { it.type != "LX/JTx;" })
        assertTrue(withoutKey.getValue("people_jewel").isEmpty())
        validateControls(withoutKey, setOf("people", "people_list_end"))
        for (changed in listOf(
            peopleJewelMethod(flags = AccessFlags.PUBLIC.value),
            peopleJewelMethod(key = "LX/JTx;->A00:LX/1BL;"),
        )) {
            val fixture = completeFixture().filter { it.type != "LX/HAR;" } + fixtureClass("LX/HAR;", listOf(changed))
            assertTrue(findControls(fixture).getValue("people_jewel").isEmpty())
        }
    }

    @Test fun duplicateAndMissingAnchorsFailAfterActualDiscovery() {
        val fixture = completeFixture()
        val peopleClass = fixture.single { it.type == "LX/1pm;" }
        val duplicate = fixtureMethod("Lfixture/Duplicate;->gate()Z",
            pluginBody(pluginGates.getValue("people").anchors.single()))
        val ambiguous = findControls(fixture + fixtureClass(duplicate.definingClass, listOf(duplicate)))
        assertFailsWith<PatchException> { validateControls(ambiguous, setOf("people")) }
        val missing = findControls(fixture.filter { it !== peopleClass })
        assertFailsWith<PatchException> { validateControls(missing, setOf("people")) }
        validateControls(missing, setOf("moments"))
    }

    @Test fun adResolutionRequiresTheHostTypeAndThePublicStaticCopyMethod() {
        for (missing in listOf(AD_ITEM, IMMUTABLE_LIST)) {
            val found = findControls(completeFixture().filter { it.type != missing })
            assertFailsWith<PatchException> { validateControls(found, setOf("ads")) }
            validateControls(found, setOf("people"))
        }
        val fixture = completeFixture()
        fixture.single { it.type == IMMUTABLE_LIST }.methods.single().setAccessFlags(AccessFlags.PUBLIC.value)
        assertTrue(findControls(fixture).getValue("ads").isEmpty())
    }

    @Test fun misleadingPluginSignaturesAndChangedRunnableNamesDoNotMatch() {
        val fixture = completeFixture()
        val people = fixture.single { it.type == "LX/1pm;" }.methods.single { it.name == "A0C" }
        people.setReturnType("Ljava/lang/Object;")
        val subtabs = fixture.single { it.type == "LX/2UL;" }
        val changed = fixture.filter { it !== subtabs } + fixtureClass(subtabs.type, subtabs.methods.toList(), "ChangedRunnable")
        val found = findControls(changed)
        assertFailsWith<PatchException> { validateControls(found, setOf("people")) }
        assertFailsWith<PatchException> { validateControls(found, setOf("subtabs")) }
        validateControls(found, setOf("typing"))
    }

    @Test fun nonStaticOwnerParameterDoesNotMatchAStaticPluginGate() {
        val id = "LX/PKW;->A01(LX/PKW;)Z"
        val method = fixtureMethod(id, pluginBody(pluginGates.getValue("avatar_stickers").anchors.single()))
        val classes: List<ClassDef> = listOf(fixtureClass(method.definingClass, listOf(method)))
        assertTrue(findControls(classes).getValue("avatar_stickers").isEmpty())
        (classes.single() as MutableClass).methods.single().setAccessFlags(AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        validateControls(findControls(classes), setOf("avatar_stickers"))
    }
}
