package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val PASTE_INPUT = "Lcom/facebook/primitive/textinput/TextInputView;"
private const val PASTE_LISTENER = "LX/PsT;"
private const val PASTE_PAYLOAD = "LX/0Ur;"
private const val PASTE_HOLDER = "LX/0Us;"
private const val PASTE_CONTENT = "Landroid/view/ContentInfo;"
private const val PASTE_CLIP = "Landroid/content/ClipData;"
private const val PASTE_CHAT = "LX/1hl;"
private const val WEAK = "Ljava/lang/ref/WeakReference;"
private const val PASTE_RESULT_MAKER = "LX/5Rz;->A00(Landroid/content/Intent;II)$ACTIVITY_RESULT_EVENT"

internal const val SYNTHETIC_PASTE_LISTENER = "$PASTE_LISTENER->EP3(Landroid/view/View;$PASTE_PAYLOAD)$PASTE_PAYLOAD"
private const val SYNTHETIC_PASTE_FIELD = "$PASTE_PAYLOAD->A00:$PASTE_HOLDER"
private const val SYNTHETIC_PASTE_GETTER = "$PASTE_HOLDER->BBc()$PASTE_CLIP"
private const val SYNTHETIC_PASTE_RESULT = "$PASTE_CHAT->onActivityResult(IILandroid/content/Intent;)V"

/** The text input, cut down to the input connection and the paste listener it builds for the view it belongs to. */
private fun pasteInputClass(builds: String = PASTE_LISTENER) = fixtureClass(PASTE_INPUT, listOf(fixtureMethod(
    "$PASTE_INPUT->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;",
    "new-instance v0, $builds\nconst/4 v0, 0x0\nreturn-object v0", registers = 4)))

/** The listener's own body, which opens by reading the pasted clip out of the payload it was handed. */
private fun pasteListenerBody(field: String = SYNTHETIC_PASTE_FIELD, getter: String = SYNTHETIC_PASTE_GETTER) = """
    iget-object v1, p2, $field
    invoke-interface {v1}, $getter
    move-result-object v1
    return-object p2
""".trimIndent()

/**
 * The listener the content route hands a paste to: a weak reference to the view it was built for, and the one
 * (view, payload) -> payload method that reads the pasted clip.
 */
private fun pasteListenerClass(
    id: String = SYNTHETIC_PASTE_LISTENER,
    body: String = pasteListenerBody(),
    registers: Int = 8,
    interfaces: List<String> = listOf("LX/0Ut;"),
    fieldType: String = WEAK,
    ctor: String? = WEAK,
    extraMethods: List<Method> = emptyList(),
) = fixtureClass(PASTE_LISTENER, listOfNotNull(
    ctor?.let { fixtureMethod("$PASTE_LISTENER-><init>($it)V", "return-void", registers = 3) },
    fixtureMethod(id, body, registers = registers),
) + extraMethods, interfaces = interfaces,
    extraFields = listOf(ImmutableField(PASTE_LISTENER, "A00", fieldType, AccessFlags.FINAL.value, null, null, null)))

/** The payload: its own maker from the platform's content, the instance that hands it back, and the clip holder. */
private fun pastePayloadClass(maker: String = "$PASTE_PAYLOAD->A00($PASTE_CONTENT)$PASTE_PAYLOAD", unwrap: Boolean = true) =
    fixtureClass(PASTE_PAYLOAD, listOfNotNull(
        fixtureMethod(maker, "const/4 v0, 0x0\nreturn-object v0", registers = 3,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        if (!unwrap) null else fixtureMethod("$PASTE_PAYLOAD->A01()$PASTE_CONTENT", "const/4 v0, 0x0\nreturn-object v0", registers = 2),
    ), extraFields = listOf(ImmutableField(PASTE_PAYLOAD, "A00", PASTE_HOLDER, AccessFlags.FINAL.value, null, null, null)))

/** The chat fragment's own result handler, which makes the composer's activity result event out of what came back. */
internal fun pasteResultMethod(maker: String = PASTE_RESULT_MAKER) = fixtureMethod(SYNTHETIC_PASTE_RESULT, """
    invoke-static {p3, p1, p2}, $maker
    move-result-object v0
    return-void
""".trimIndent(), registers = 6)

/** The chat the pasted photo goes to: its view handover and that result handler. */
private fun pasteChatClass(original: String? = CHAT_FRAGMENT_NAME, result: String? = PASTE_RESULT_MAKER, view: Boolean = true) =
    fixtureClass(PASTE_CHAT, listOfNotNull(
        fixtureMethod("$PASTE_CHAT-><init>()V", "return-void"),
        if (!view) null else fixtureMethod(SYNTHETIC_CHAT_JUMP, "return-void", registers = 5),
        result?.let { pasteResultMethod(it) },
    ), original)

/** Paste a photo into the chat's own classes: the text input that builds the listener, the listener and its payload. */
internal fun pastePhotoFixture(vararg replace: MutableClass): List<MutableClass> {
    val classes = listOf(pasteInputClass(), pasteListenerClass(), pastePayloadClass())
    return classes.filter { cls -> replace.none { it.type == cls.type } } + replace
}

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.reference(at: Int) = (code()[at] as ReferenceInstruction).reference.toString()

class PastePhotoTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        pasteRoute = null
    }

    private fun fixture(vararg replace: MutableClass): List<ClassDef> = pastePhotoFixture(*replace) + pasteChatClass()

    private fun found(classes: List<ClassDef>) = mirroredControls(classes).getValue(PASTE_PHOTO)

    @Test fun theHooksAreTheContentListenerAndTheChatsViewHandover() {
        val found = found(fixture())
        assertEquals(listOf(SYNTHETIC_PASTE_LISTENER, SYNTHETIC_CHAT_JUMP), found.map { it.hookId() })
        validateControls(mapOf(PASTE_PHOTO to found), setOf(PASTE_PHOTO))
        assertEquals(PasteRoute(SYNTHETIC_PASTE_LISTENER, SYNTHETIC_PASTE_FIELD, SYNTHETIC_PASTE_GETTER,
            SYNTHETIC_CHAT_JUMP, SYNTHETIC_PASTE_RESULT), pasteRoute)
        // The chat is the same fragment Jump to a message already names, so both hooks move together on a new build.
        assertEquals(BASE_PROFILE.hooks.getValue(CHAT_JUMP),
            BASE_PROFILE.hooks.getValue(PASTE_PHOTO).filter { "onViewCreated" in it }.toSet())
    }

    @Test fun aChangedRouteIsFoundAsNoRouteAtAll() {
        val cases = mapOf(
            "no text input" to fixture().filter { it.type != PASTE_INPUT },
            "the input builds something else" to fixture(pasteInputClass(builds = "LX/Zz9;")),
            "no listener class" to fixture().filter { it.type != PASTE_LISTENER },
            "the listener serves two interfaces" to fixture(pasteListenerClass(interfaces = listOf("LX/0Ut;", "LX/0Uu;"))),
            "the listener holds a strong reference" to fixture(pasteListenerClass(fieldType = PASTE_INPUT)),
            "the listener isn't built from a weak reference" to fixture(pasteListenerClass(ctor = PASTE_INPUT)),
            "a second method of the listener's own shape" to fixture(pasteListenerClass(extraMethods = listOf(
                fixtureMethod("$PASTE_LISTENER->EP4(Landroid/view/View;$PASTE_PAYLOAD)$PASTE_PAYLOAD", "return-object p2")))),
            "the method hands back something else" to fixture(pasteListenerClass(
                id = "$PASTE_LISTENER->EP3(Landroid/view/View;$PASTE_PAYLOAD)$PASTE_CONTENT",
                body = "const/4 v0, 0x0\nreturn-object v0")),
            "no payload class" to fixture().filter { it.type != PASTE_PAYLOAD },
            "the payload has no maker" to fixture(pastePayloadClass(maker = "$PASTE_PAYLOAD->A00($PASTE_CLIP)$PASTE_PAYLOAD")),
            "the payload hands back no content" to fixture(pastePayloadClass(unwrap = false)),
            "the listener reads no clip" to fixture(pasteListenerClass(body = "return-object p2")),
            "the clip comes from somewhere else" to fixture(pasteListenerClass(
                body = pasteListenerBody(field = "$PASTE_CHAT->A00:$PASTE_HOLDER"))),
            "the read hands back something else" to fixture(pasteListenerClass(
                body = pasteListenerBody(getter = "$PASTE_HOLDER->BBc()$PASTE_CONTENT"))),
            "no chat fragment" to pastePhotoFixture(),
            "another chat route" to pastePhotoFixture() + pasteChatClass(original = "ThreadViewFragment"),
            "no view for the chat" to pastePhotoFixture() + pasteChatClass(view = false),
            "the chat takes no result" to pastePhotoFixture() + pasteChatClass(result = null),
            "the result makes something else" to pastePhotoFixture() + pasteChatClass(
                result = "LX/5Rz;->A00(Landroid/content/Intent;II)Ljava/lang/Object;"),
            "the result is handed another shape" to pastePhotoFixture() + pasteChatClass(
                result = "LX/5Rz;->A00(Landroid/content/Intent;Ljava/lang/String;I)$ACTIVITY_RESULT_EVENT"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertEquals(null, pasteRoute, case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(PASTE_PHOTO)) }
        }
    }

    /** The hook reads the clip into the lowest local, so a listener with no local, or one that reads it first, is refused. */
    @Test fun aListenerWithNoFreeLocalIsNoListener() {
        val starved = pasteListenerClass(body = pasteListenerBody().replace("v1", "p0"), registers = 3)
        assertTrue(found(fixture(starved)).isEmpty())
        val reads = pasteListenerClass(body = "move-object v1, v0\n" + pasteListenerBody())
        assertTrue(found(fixture(reads)).isEmpty())
    }

    @Test fun theListenerAsksTheExtensionBeforeMessengerReadsThePaste() {
        findPastePhoto(fixture())
        val method = MutableMethod(pasteListenerClass().methods.single { it.name == "EP3" })
        val before = method.code()
        injectControl(PASTE_PHOTO, mapOf(PASTE_PHOTO to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 8, code.size)
        assertEquals(SYNTHETIC_PASTE_FIELD, method.reference(0))
        assertEquals(SYNTHETIC_PASTE_GETTER, method.reference(1))
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[2].opcode)
        assertEquals(PASTED_PHOTO_CALL, method.reference(3))
        assertEquals(listOf(6, 0), (code[3] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(Opcode.MOVE_RESULT, code[4].opcode)
        // Not a photo for a chat we know: Messenger's own handling, which starts right after the hook.
        assertEquals(Opcode.IF_EQZ, code[5].opcode)
        assertEquals(0, (code[5] as OneRegisterInstruction).registerA)
        assertEquals(8, code.branchTarget(5))
        // One of ours: the listener hands back nothing, since the photo is already in that chat's tray.
        assertEquals(Opcode.CONST_4, code[6].opcode)
        assertEquals(Opcode.RETURN_OBJECT, code[7].opcode)
        assertEquals(before, code.drop(8))
        // The hook writes nothing but the one local it checked for.
        assertTrue(code.take(8).all { it !is OneRegisterInstruction || it.registerA == 0 })
    }

    @Test fun theChatHandsOverTheFragmentAndItsViewFirst() {
        findPastePhoto(fixture())
        val method = MutableMethod(pasteChatClass().methods.single { it.name == "onViewCreated" })
        val before = method.code()
        injectControl(PASTE_PHOTO, mapOf(PASTE_PHOTO to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 1, code.size)
        assertEquals(PASTE_CHAT_CALL, method.reference(0))
        assertEquals(before, code.drop(1))
    }

    @Test fun aMethodOffTheRouteRefusesTheSwitchBeforeAnyEdit() {
        findPastePhoto(fixture())
        val cases = mapOf(
            "another method of the listener" to fixtureMethod("$PASTE_LISTENER->EP9(Landroid/view/View;)V", "return-void", registers = 3),
            "the chat's own result handler" to pasteResultMethod(),
        )
        for ((case, bad) in cases) {
            val before = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(PASTE_PHOTO, mapOf(PASTE_PHOTO to listOf(bad))) }
            assertEquals(before, bad.code(), case)
        }
        // With no route read, nothing is edited at all.
        pasteRoute = null
        val listener = MutableMethod(pasteListenerClass().methods.single { it.name == "EP3" })
        val before = listener.code()
        assertFailsWith<PatchException> { injectControl(PASTE_PHOTO, mapOf(PASTE_PHOTO to listOf(listener))) }
        assertEquals(before, listener.code())
    }

    @Test fun everySupportedBuildRoutesAPastedPhotoThroughTheChat() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        // Every build's own ids, compared at the end, so one build that moved still reports what all the others found.
        val recorded = mutableMapOf<String, Set<String>>()
        val found = mutableMapOf<String, Set<String>>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findPastePhoto(classes)
            recorded[code] = activeProfile.hooks.getValue(PASTE_PHOTO)
            found[code] = hooks.map { it.hookId() }.toSet()
            // A build whose route moved is named by the comparison at the end, instead of this one stopping the run.
            if (found[code] != recorded[code]) continue
            validateControls(mapOf(PASTE_PHOTO to hooks), setOf(PASTE_PHOTO))
            val route = pasteRoute!!
            assertEquals(setOf(route.listener, route.chat), hooks.map { it.hookId() }.toSet(), code)
            // The photo goes in through the chat's own result handler, so that handler is on the chat too.
            assertEquals(route.chat.substringBefore("->"), route.result.substringBefore("->"), code)
            // The chat hook is the one Jump to a message takes, on the same fragment.
            assertEquals(activeProfile.hooks.getValue(CHAT_JUMP), setOf(route.chat), code)
            val methods = hooks.map { MutableMethod(it) }
            val befores = methods.map { it.code() }
            injectControl(PASTE_PHOTO, mapOf(PASTE_PHOTO to methods))
            for ((method, before) in methods.zip(befores)) {
                val after = method.code()
                assertTrue(after.size > before.size, "$code ${method.hookId()}")
                assertEquals(1, after.count { it is ReferenceInstruction &&
                    it.reference.toString() in setOf(PASTED_PHOTO_CALL, PASTE_CHAT_CALL) }, "$code ${method.hookId()}")
            }
        }
        assertEquals(recorded, found)
    }
}
