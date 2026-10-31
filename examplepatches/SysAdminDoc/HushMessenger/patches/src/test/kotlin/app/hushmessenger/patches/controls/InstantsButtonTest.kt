package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/** The synthetic label for the attach step, named after the first build it was found in. */
internal const val INSTANTS_BUTTON_ATTACH = "LX/1mx;->A0D(LX/1mx;)V"

/** The synthetic label for the step that adds the Instants button under the chat heads, named the same way. */
internal const val CHAT_HEAD_INSTANTS_BUTTON = "LX/ZnZ;->A0X(LX/ZnZ;)V"

private const val CHAT_LIST = "LX/1mx;"
private const val CHAT_HEADS = "LX/ZnZ;"

/**
 * The attach step cut down to what every build shares: static and void, handed its own fragment, and logging both
 * corner peek events, with locals to spare above its one parameter.
 */
private val ATTACH_BODY = """
    const-string v0, "$CORNER_PEEK_ATTACH"
    const-string v1, "$CORNER_PEEK_ATTACHED"
    return-void
""".trimIndent()

/**
 * The chat heads' step cut down the same way: it gives up without the stack's full view, and otherwise builds the
 * button and logs it as quicksnap.
 */
private val CHAT_HEAD_BODY = """
    iget-object v0, v3, $CHAT_HEADS->A0a:$CHAT_HEADS_FULL_VIEW
    if-eqz v0, :done
    const-string v0, "$QUICKSNAP"
    :done
    return-void
""".trimIndent()

private fun attach(
    id: String = INSTANTS_BUTTON_ATTACH,
    body: String = ATTACH_BODY,
    registers: Int = 4,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
): MutableMethod = fixtureMethod(id, body, registers, flags)

private fun chatHeadButton(
    id: String = CHAT_HEAD_INSTANTS_BUTTON,
    body: String = CHAT_HEAD_BODY,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
): MutableMethod = fixtureMethod(id, body, 4, flags)

/** The layout pass that calls the attach step and logs nothing, which never gets the hook. */
private fun layoutPass() = attach("$CHAT_LIST->A0C($CHAT_LIST)V", body = """
    invoke-static {v3}, $INSTANTS_BUTTON_ATTACH
    return-void
""".trimIndent())

/** The chat heads' refresh, which reads the same full view and calls the step but logs nothing, so it never gets the hook. */
private fun chatHeadRefresh() = chatHeadButton("$CHAT_HEADS->A1e($CHAT_HEADS)V", body = """
    iget-object v0, v3, $CHAT_HEADS->A0a:$CHAT_HEADS_FULL_VIEW
    invoke-static {v3}, $CHAT_HEAD_INSTANTS_BUTTON
    return-void
""".trimIndent())

private fun chatHeads(button: MutableMethod = chatHeadButton()) = fixtureClass(CHAT_HEADS, listOf(button, chatHeadRefresh()))

/**
 * The attach step beside the layout pass that calls it, and the chat heads' step beside their refresh. Messenger keeps
 * the first two on InboxFragment itself, but the community inbox fixture already stands in for that class (its finder
 * wants exactly one), so they carry a label of their own.
 */
internal fun instantsButtonFixture(
    attachMethod: MutableMethod = attach(),
    chatHeadMethod: MutableMethod = chatHeadButton(),
): List<MutableClass> = listOf(
    fixtureClass(CHAT_LIST, listOf(attachMethod, layoutPass()), originalName = "InboxCornerPeek"),
    chatHeads(chatHeadMethod),
)

private fun Method.code() = implementation!!.instructions.toList()

class InstantsButtonTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(INSTANTS_BUTTON).map { it.hookId() }

    @Test fun bothStepsAreFoundByTheirShape() {
        assertEquals(setOf(INSTANTS_BUTTON_ATTACH, CHAT_HEAD_INSTANTS_BUTTON), found(instantsButtonFixture()).toSet())
        validateControls(mirroredControls(instantsButtonFixture()), setOf(INSTANTS_BUTTON))
    }

    @Test fun lookalikesAreNotTheAttachStep() {
        val onlyAttach = ATTACH_BODY.replace(CORNER_PEEK_ATTACHED, "qs_peek_attach")
        val onlyAttached = ATTACH_BODY.replace("\"$CORNER_PEEK_ATTACH\"", "\"qs_peek_attach\"")
        val cases = mapOf(
            "not static" to instantsButtonFixture(attach(flags = AccessFlags.PUBLIC.value)),
            "another parameter" to instantsButtonFixture(attach(id = "$CHAT_LIST->A0D(Landroid/view/View;)V")),
            "two parameters" to instantsButtonFixture(attach(id = "$CHAT_LIST->A0D(${CHAT_LIST}I)V")),
            "returns a value" to instantsButtonFixture(attach(id = INSTANTS_BUTTON_ATTACH.replace(")V", ")Z"),
                body = ATTACH_BODY.replace("return-void", "const/4 v0, 0x0\nreturn v0"))),
            "only the first event" to instantsButtonFixture(attach(body = onlyAttach)),
            "only the second event" to instantsButtonFixture(attach(body = onlyAttached)),
            "only the layout pass" to listOf(fixtureClass(CHAT_LIST, listOf(layoutPass())), chatHeads()),
        )
        for ((case, classes) in cases) {
            assertEquals(listOf(CHAT_HEAD_INSTANTS_BUTTON), found(classes), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(INSTANTS_BUTTON)) }
        }
    }

    @Test fun lookalikesAreNotTheChatHeadStep() {
        val cases = mapOf(
            "not static" to instantsButtonFixture(chatHeadMethod = chatHeadButton(flags = AccessFlags.PUBLIC.value)),
            "another parameter" to instantsButtonFixture(chatHeadMethod = chatHeadButton(id = "$CHAT_HEADS->A0X(Landroid/view/View;)V")),
            "returns a value" to instantsButtonFixture(chatHeadMethod = chatHeadButton(id = CHAT_HEAD_INSTANTS_BUTTON.replace(")V", ")Z"),
                body = CHAT_HEAD_BODY.replace("return-void", "const/4 v0, 0x0\nreturn v0"))),
            "another surface" to instantsButtonFixture(chatHeadMethod = chatHeadButton(body = CHAT_HEAD_BODY.replace("\"$QUICKSNAP\"", "\"montage\""))),
            "no full view" to instantsButtonFixture(chatHeadMethod = chatHeadButton(body = CHAT_HEAD_BODY.replace(CHAT_HEADS_FULL_VIEW, "Landroid/view/View;"))),
            "only the refresh" to listOf(fixtureClass(CHAT_LIST, listOf(attach(), layoutPass())), fixtureClass(CHAT_HEADS, listOf(chatHeadRefresh()))),
        )
        for ((case, classes) in cases) {
            assertEquals(listOf(INSTANTS_BUTTON_ATTACH), found(classes), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(INSTANTS_BUTTON)) }
        }
    }

    @Test fun theSwitchReturnsBeforeEitherButtonIsBuilt() {
        for (method in listOf(attach(), chatHeadButton())) {
            val before = method.code()
            injectControl(INSTANTS_BUTTON, mapOf(INSTANTS_BUTTON to listOf(method)))
            val code = method.code()
            val id = method.hookId()
            assertEquals("$SETTINGS->hideInstantsButton()Z", ((code[0] as ReferenceInstruction).reference).toString(), id)
            assertEquals(Opcode.MOVE_RESULT, code[1].opcode, id)
            assertEquals(0, (code[1] as OneRegisterInstruction).registerA, id)
            assertEquals(Opcode.IF_EQZ, code[2].opcode, id)
            assertEquals(4, code.branchTarget(2), id)
            assertEquals(Opcode.RETURN_VOID, code[3].opcode, id)
            // Off, Pause and safe mode fall through to Messenger's own step, unchanged.
            assertEquals(before.map { it.opcode }, code.drop(4).map { it.opcode }, id)
        }
    }

    @Test fun anUnusableStepRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // One register is exactly the parameter, so v0 would be the fragment.
            "no free register" to attach(registers = 1, body = """
                const-string v0, "$CORNER_PEEK_ATTACH"
                const-string v0, "$CORNER_PEEK_ATTACHED"
                return-void
            """.trimIndent()),
            "the layout pass" to layoutPass(),
            "only the first event" to attach(body = ATTACH_BODY.replace(CORNER_PEEK_ATTACHED, "qs_peek_attach")),
            "the chat heads' refresh" to chatHeadRefresh(),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) {
                injectControl(INSTANTS_BUTTON, mapOf(INSTANTS_BUTTON to listOf(bad)))
            }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksBothSteps() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val steps = findInstantsButton(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(INSTANTS_BUTTON), steps.map { it.hookId() }.toSet(), code)
            assertEquals(1, steps.count { it.isInstantsButtonAttach() }, code)
            assertEquals(1, steps.count { it.isChatHeadInstantsButton() }, code)
            validateControls(mapOf(INSTANTS_BUTTON to steps), setOf(INSTANTS_BUTTON))
            for (step in steps) {
                val method = MutableMethod(step)
                val before = method.code()
                method.injectInstantsButton()
                val after = method.code()
                val label = "$code ${step.hookId()}"
                assertEquals("$SETTINGS->hideInstantsButton()Z", ((after[0] as ReferenceInstruction).reference).toString(), label)
                assertEquals(4, after.branchTarget(2), label)
                assertEquals(Opcode.RETURN_VOID, after[3].opcode, label)
                assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP }, after.drop(4).map { it.opcode }.filter { it != Opcode.NOP }, label)
            }
        }
    }
}
