package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val SUMMARY = "Lcom/facebook/messaging/model/threads/ThreadSummary;"
private const val THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
private const val PICKER = "LX/JZh;"
private const val LIST = "LX/HjU;"
private const val ENCRYPTED_LIST = "LX/HjV;"
internal const val SYNTHETIC_LOCAL_SEARCH = "$LIST->Evp(${SUMMARY}Ljava/lang/String;)V"
internal const val SYNTHETIC_LOCAL_SEARCH_VIEW = "$LIST->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V"

/** The picker as 585 ships it, cut to the tag and the branch on the chat's encryption. */
private val PICKER_BODY = """
    const-string v1, "$LOCAL_SEARCH_LIST"
    iget-object v1, p1, $SUMMARY->A0e:$THREAD_KEY
    invoke-virtual {v1}, $THREAD_KEY->A1I()Z
    move-result v0
    if-eqz v0, :plain
    new-instance v1, $ENCRYPTED_LIST
    goto :done
    :plain
    new-instance v1, $LIST
    :done
    return-void
""".trimIndent()

/** The list's search method: it resets its state, keeps the words and summary, reads the key off the summary and searches. */
private val SEARCH_BODY = """
    const/4 v2, 0x0
    iput-object p2, p0, $LIST->A0L:Ljava/lang/String;
    iput-object p1, p0, $LIST->A08:$SUMMARY
    iget-object v0, p1, $SUMMARY->A0e:$THREAD_KEY
    iput-object v0, p0, $LIST->A07:$THREAD_KEY
    invoke-direct {p0}, $LIST->A01()V
    return-void
""".trimIndent()

private val VIEW_BODY = """
    const/4 v0, 0x0
    return-void
""".trimIndent()

private fun search(body: String = SEARCH_BODY, id: String = SYNTHETIC_LOCAL_SEARCH, flags: Int = AccessFlags.PUBLIC.value): MutableMethod =
    fixtureMethod(id, body, registers = 6, flags = flags)

private fun view(body: String = VIEW_BODY): MutableMethod = fixtureMethod(SYNTHETIC_LOCAL_SEARCH_VIEW, body, registers = 7)

private fun picker(body: String = PICKER_BODY, id: String = "$PICKER->A02(${SUMMARY}Ljava/lang/String;I)V"): MutableMethod =
    fixtureMethod(id, body, registers = 6)

internal fun localChatSearchFixture(
    pickers: List<MutableMethod> = listOf(picker()),
    list: List<MutableMethod> = listOf(search(), view()),
): List<MutableClass> = pickers.groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) } + fixtureClass(LIST, list)

class LocalChatSearchTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(LOCAL_CHAT_SEARCH).map { it.hookId() }.toSet()

    @Test fun thePickerNamesTheListForChatsThatAreNotEncrypted() {
        assertEquals(setOf(SYNTHETIC_LOCAL_SEARCH, SYNTHETIC_LOCAL_SEARCH_VIEW), found(localChatSearchFixture()))
        validateControls(mirroredControls(localChatSearchFixture()), setOf(LOCAL_CHAT_SEARCH))
        assertEquals(setOf(SYNTHETIC_LOCAL_SEARCH, SYNTHETIC_LOCAL_SEARCH_VIEW), SYNTHETIC_PROFILE.hooks.getValue(LOCAL_CHAT_SEARCH))
        assertEquals(2, BASE_PROFILE.hooks.getValue(LOCAL_CHAT_SEARCH).size)
    }

    @Test fun lookalikesAreNotTheList() {
        val cases = mapOf(
            "no list tag" to localChatSearchFixture(listOf(picker(PICKER_BODY.replace("\"$LOCAL_SEARCH_LIST\"", "\"another_fragment\"")))),
            "the same list on both sides" to localChatSearchFixture(listOf(picker(PICKER_BODY.replace("new-instance v1, $ENCRYPTED_LIST", "new-instance v1, $LIST")))),
            "no branch on the chat" to localChatSearchFixture(listOf(picker(PICKER_BODY.replace("$THREAD_KEY->A1I()Z", "LX/Other;->A1I()Z")))),
            "two pickers" to localChatSearchFixture(listOf(picker(), picker(id = "LX/Other;->A02(${SUMMARY}Ljava/lang/String;I)V"))),
            "a static search method" to localChatSearchFixture(list = listOf(search(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value), view())),
            "the key never read" to localChatSearchFixture(list = listOf(search(SEARCH_BODY.replace("iget-object v0, p1, $SUMMARY->A0e:$THREAD_KEY", "const/4 v0, 0x0")), view())),
            "the words overwritten first" to localChatSearchFixture(list = listOf(search(SEARCH_BODY.replace("const/4 v2, 0x0", "const/4 p2, 0x0")), view())),
            "two reads of the key" to localChatSearchFixture(list = listOf(search(SEARCH_BODY.replace("return-void", "iget-object v0, p1, $SUMMARY->A0e:$THREAD_KEY\nreturn-void")), view())),
            "no view" to localChatSearchFixture(list = listOf(search())),
            "no list class" to localChatSearchFixture(list = emptyList()).filter { it.type != LIST },
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(LOCAL_CHAT_SEARCH)) }
        }
    }

    @Test fun theChatAndWordsGoToTheExtensionRightAfterTheKeyIsRead() {
        val method = search()
        val before = method.implementation!!.instructions.toList()
        injectControl(LOCAL_CHAT_SEARCH, mapOf(LOCAL_CHAT_SEARCH to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals(before.size + 1, code.size)
        val read = before.indexOfFirst { it.opcode == Opcode.IGET_OBJECT }
        val call = code[read + 1] as Instruction35c
        assertEquals(Opcode.INVOKE_STATIC, call.opcode)
        assertEquals(LOCAL_SEARCH_QUERY_CALL, call.reference.toString())
        assertEquals(0, call.registerC)
        assertEquals(method.parameterRegister(2), call.registerD)
    }

    @Test fun theViewGoesToTheExtensionFirst() {
        val method = view()
        injectControl(LOCAL_CHAT_SEARCH, mapOf(LOCAL_CHAT_SEARCH to listOf(method)))
        val call = method.implementation!!.instructions.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(LOCAL_SEARCH_VIEW_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(method.parameterRegister(1), (call as RegisterRangeInstruction).startRegister)
    }

    @Test fun theSearchScreenRunsInItsOwnProcess() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
        document.appendChild(document.createElement("manifest")).appendChild(document.createElement("application"))
        document.addLocalSearch()
        val activity = document.getElementsByTagName("activity").item(0) as org.w3c.dom.Element
        assertEquals(LOCAL_SEARCH_ACTIVITY, activity.getAttribute("android:name"))
        assertEquals(":hushsearch", activity.getAttribute("android:process"))
        assertEquals("false", activity.getAttribute("android:exported"))
    }
}
