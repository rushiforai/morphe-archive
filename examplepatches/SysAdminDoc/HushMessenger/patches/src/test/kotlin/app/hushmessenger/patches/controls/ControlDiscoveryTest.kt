package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class ControlDiscoveryTest {
    private val originals = mapOf(
        "LX/2UL;" to "InboxSubtabsItemSupplierImplementation\$onSubscribe\$1",
        "LX/Ahp;" to "ConversationTypingContext\$sendActiveStateRunnable\$1",
    )

    private fun completeFixture(): List<MutableClass> {
        val methods = expectedHooks.flatMap { (key, ids) ->
            ids.map { id ->
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
                    "subtabs", "typing" -> "return-void"
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
                val staticGate = key in pluginGates && !id.substringAfter('(').startsWith(')')
                fixtureMethod(id, body, flags = AccessFlags.PUBLIC.value or
                    if (staticGate) AccessFlags.STATIC.value else 0)
            }
        }
        return methods.groupBy { it.definingClass }.map { (type, grouped) ->
            fixtureClass(type, grouped, originals[type])
        } + listOf(fixtureClass(AD_ITEM), fixtureClass(IMMUTABLE_LIST, listOf(
            fixtureMethod("$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST",
                "const/4 v0, 0x0\nreturn-object v0", flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )))
    }

    @Test fun discoversTheCompleteHookUnionThroughRealClassDefinitions() {
        val found = findControls(completeFixture())
        validateControls(found)
        assertEquals(57, found.values.sumOf { it.size })
        for (key in expectedHooks.keys) validateControls(found, setOf(key))
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
