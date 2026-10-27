package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption
import java.util.logging.Handler
import java.util.logging.Level
import java.util.logging.LogRecord
import java.util.logging.Logger
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertSame
import kotlin.test.assertTrue

private const val CHATS_TITLE = "LX/2R7;"
private const val MORE_TITLE = "LX/3E4;"
private const val TITLE_HANDLER = "LX/49Y;"
private const val MORE_TAB = MORE_TAB_CONTENT
internal const val SYNTHETIC_LOGO_LONG_PRESS = "$CHATS_TITLE->CY1(Landroid/content/Context;)V"
internal const val SYNTHETIC_MENU_TITLE_LONG_PRESS = "$MORE_TITLE->CY1(Landroid/content/Context;)V"
private val FINAL_PUBLIC = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

/**
 * The Chats title's long press handler as Messenger writes it: a null check, then the TitleShortcut plugin lookup with the
 * session and the Context, then the plugin call. p0 is v3 and the Context, p1, is v4.
 */
private val CHATS_TITLE_BODY = """
    const/4 v0, 0x0
    invoke-static {p1, v0}, LX/WKN;->A0g(Ljava/lang/Object;I)V
    const-string v2, "TitleShortcut"
    iget-object v0, p0, $CHATS_TITLE->A00:$FB_USER_SESSION
    filled-new-array {v0, p1}, [Ljava/lang/Object;
    move-result-object v1
    const-string v0, "$TITLE_SHORTCUT_SPEC"
    invoke-static {v0, v2, v1}, LX/1fl;->A00(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, LX/Lep;
    const/4 v0, 0x0
    sput v0, Lredex/${'$'}StoreFenceHelper;->DUMMY_VOLATILE:I
    invoke-static {v1}, LX/LYv;->A00(LX/Lep;)V
    return-void
""".trimIndent()

/** The Menu tab's handler asks the same plugin, but reads the session out of its tab content. */
private val MORE_TITLE_BODY = CHATS_TITLE_BODY.replace(
    "iget-object v0, p0, $CHATS_TITLE->A00:$FB_USER_SESSION",
    "iget-object v0, p0, $MORE_TITLE->A00:$MORE_TAB\niget-object v0, v0, $MORE_TAB->A01:$FB_USER_SESSION",
)

private fun titleHandler(
    type: String = CHATS_TITLE,
    body: String = CHATS_TITLE_BODY,
    flags: Int = FINAL_PUBLIC,
    id: String = SYNTHETIC_LOGO_LONG_PRESS,
) = fixtureMethod(id.replace(CHATS_TITLE, type), body.replace(CHATS_TITLE, type), registers = 5, flags = flags)

private fun titleClass(handler: MutableMethod, field: String = FB_USER_SESSION, interfaces: List<String> = listOf(TITLE_HANDLER)) =
    fixtureClass(handler.definingClass, listOf(handler), interfaces = interfaces, flags = FINAL_PUBLIC,
        extraFields = listOf(ImmutableField(handler.definingClass, "A00", field, AccessFlags.FINAL.value, null, null, null)))

/**
 * The Chats and Menu tabs' title long press handlers as every supported build has them, and a class that holds the session and
 * takes a Context but never asks the title shortcut plugin.
 */
internal fun chatsTitleClasses(chats: MutableMethod = titleHandler()): List<MutableClass> = listOf(
    titleClass(chats),
    titleClass(titleHandler(MORE_TITLE, MORE_TITLE_BODY), MORE_TAB),
    titleClass(fixtureMethod("LX/2R8;->CY1(Landroid/content/Context;)V", "return-void", registers = 2, flags = FINAL_PUBLIC)),
)

private fun Method.code() = implementation!!.instructions.toList()

private fun List<Instruction>.shape() = map { it.opcode to (it as? ReferenceInstruction)?.reference?.toString() }

/** The warnings the patcher logs while [action] runs. */
private fun warnings(action: () -> Unit): List<String> {
    val seen = mutableListOf<String>()
    val handler = object : Handler() {
        override fun publish(record: LogRecord) { if (record.level == Level.WARNING) seen += record.message }
        override fun flush() {}
        override fun close() {}
    }
    val root = Logger.getLogger("")
    root.addHandler(handler)
    try { action() } finally { root.removeHandler(handler) }
    return seen
}

class LogoLongPressTest {
    @Test fun eachTitleFindsOnlyItsOwnHandler() {
        val classes = chatsTitleClasses()
        assertEquals(listOf(SYNTHETIC_LOGO_LONG_PRESS), findLogoLongPress(classes).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_MENU_TITLE_LONG_PRESS), findLogoLongPress(classes, MENU_TAB_TITLE).map { it.hookId() })
        // A second handler of the same shape is counted, so the patch can refuse to pick between them.
        assertEquals(2, findLogoLongPress(classes + titleClass(titleHandler("LX/2R6;"))).size)
        assertEquals(2, findLogoLongPress(classes + titleClass(titleHandler("LX/3E5;", MORE_TITLE_BODY), MORE_TAB), MENU_TAB_TITLE).size)
        assertEquals(emptyList(), findLogoLongPress(listOf(titleClass(titleHandler(), interfaces = emptyList()))))
        assertEquals(emptyList(), findLogoLongPress(listOf(titleClass(titleHandler(MORE_TITLE, MORE_TITLE_BODY), MORE_TAB, emptyList())), MENU_TAB_TITLE))
    }

    @Test fun theMenuTitleGetsTheSameCallBeforeItsReturn() {
        val handler = titleHandler(MORE_TITLE, MORE_TITLE_BODY)
        val stock = handler.code()
        handler.injectLogoLongPress()
        val code = handler.code()
        val call = code[stock.lastIndex]
        assertEquals(LOGO_LONG_PRESSED, (call as ReferenceInstruction).reference.toString())
        assertEquals(4, (call as RegisterRangeInstruction).startRegister)
        assertEquals(stock.dropLast(1).shape(), code.take(stock.size - 1).shape())
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }

    @Test fun theCallGoesInAfterMessengersOwnHandlingOfThePress() {
        val handler = titleHandler()
        val stock = handler.code()
        handler.injectLogoLongPress()
        val code = handler.code()
        assertEquals(stock.size + 1, code.size)
        val call = code[stock.lastIndex]
        assertEquals(LOGO_LONG_PRESSED, (call as ReferenceInstruction).reference.toString())
        // p1, the toolbar's Context, is v4 of 5.
        val registers = call as RegisterRangeInstruction
        assertEquals(4, registers.startRegister)
        assertEquals(1, registers.registerCount)
        // Messenger's plugin lookup runs first, as it was, and the method still ends in its return.
        assertEquals(stock.dropLast(1).shape(), code.take(stock.size - 1).shape())
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }

    @Test fun aChangedHandlerIsLeftAloneAndNamed() {
        val cases = mapOf(
            "a branch" to titleHandler(body = CHATS_TITLE_BODY.replace("return-void",
                "if-eqz v1, :done\ninvoke-static {v1}, LX/LYv;->A00(LX/Lep;)V\n:done\nreturn-void")),
            "a second exit" to titleHandler(body = CHATS_TITLE_BODY.replace("invoke-static {v1}, LX/LYv;->A00(LX/Lep;)V", "throw v1")),
            "the Context overwritten" to titleHandler(body = CHATS_TITLE_BODY.replace("return-void", "const/4 p1, 0x0\nreturn-void")),
            "the Context under a wide value" to titleHandler(body = CHATS_TITLE_BODY.replace("return-void", "const-wide/16 v3, 0x0\nreturn-void")),
            "the plugin asked twice" to titleHandler(body = CHATS_TITLE_BODY.replace("\"TitleShortcut\"", "\"$TITLE_SHORTCUT_SPEC\"")),
            "a static method" to titleHandler(body = "const-string v0, \"$TITLE_SHORTCUT_SPEC\"\nreturn-void",
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "another parameter" to titleHandler(id = "$CHATS_TITLE->CY1(Landroid/app/Activity;)V"),
            "a catch handler" to titleHandler().apply {
                val last = implementation!!.instructions.size - 1
                implementation!!.run { addCatch(newLabelForIndex(0), newLabelForIndex(2), newLabelForIndex(last)) }
            },
        )
        for ((case, handler) in cases) {
            val stock = handler.code()
            val failure = assertFailsWith<PatchException>(case) { handler.injectLogoLongPress() }
            assertTrue(handler.definingClass in failure.message.orEmpty(), case)
            assertEquals(stock, handler.code(), case)
        }
    }

    @Test fun aBuildWithoutExactlyOneHandlerKeepsItsLogoAndSaysWhy() {
        val one = findLogoLongPress(chatsTitleClasses()).single()
        val changed = titleHandler(body = CHATS_TITLE_BODY.replace("return-void", "const/4 p1, 0x0\nreturn-void"))
        for ((case, sites) in listOf("found 0" to emptyList<Method>(), "found 2" to listOf(one, titleHandler("LX/2R6;")),
            "writes over its Context" to listOf(changed))) {
            var picked: Method? = one
            val logged = warnings { picked = logoLongPressSite(sites) }
            assertNull(picked, case)
            assertEquals(1, logged.size, case)
            assertTrue(case in logged.single(), case)
            assertTrue("won't open HushMessenger settings. The Menu tab and side menu rows still do." in logged.single(), case)
        }
        // The supported shape is picked without a warning.
        var picked: Method? = null
        assertEquals(emptyList(), warnings { picked = logoLongPressSite(listOf(one)) })
        assertSame(one, picked)
        // The Menu title's warning names the Menu title, not the logo.
        val logged = warnings { picked = logoLongPressSite(emptyList(), MENU_TAB_TITLE) }
        assertNull(picked)
        assertTrue("found 0 Menu tab title long press handlers instead of one, so a long press on the Menu tab's title won't open" in logged.single())
    }

    @Test fun theBuiltExtensionHasTheCallThePatchAdds() {
        val extension = Files.createTempFile("hush-logo-extension-", ".mpe")
        try {
            javaClass.classLoader.getResourceAsStream("extensions/messenger.mpe").use { input ->
                assertNotNull(input, "The embedded release extension must be built before patch tests")
                Files.copy(input, extension, StandardCopyOption.REPLACE_EXISTING)
            }
            val dex = DexFileFactory.loadDexContainer(extension.toFile(), Opcodes.forApi(35))
            val settings = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == SETTINGS }
            val method = settings.methods.single { it.hookId() == LOGO_LONG_PRESSED }
            assertTrue(AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
        } finally {
            Files.deleteIfExists(extension)
        }
    }

    @Test fun everySupportedBuildHasOneHandlerForEachTitleToHook() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            // 584.1's four families name the handlers differently, so each title gets its own one Context handler.
            val handlers = mutableSetOf<String>()
            for (title in listOf(CHATS_TAB_TITLE, MENU_TAB_TITLE)) {
                val sites = findLogoLongPress(classes, title)
                assertEquals(1, sites.size, "$code ${title.handler} ${sites.map { it.hookId() }}")
                assertTrue(sites.single().hookId().endsWith("(Landroid/content/Context;)V"), "$code ${sites.single().hookId()}")
                assertTrue(handlers.add(sites.single().hookId()), "$code: both titles share ${sites.single().hookId()}")
                val method = MutableMethod(assertNotNull(logoLongPressSite(sites, title), code))
                val stock = method.code().map { it.opcode }
                method.injectLogoLongPress()
                val after = method.code()
                val call = after[stock.lastIndex]
                assertEquals(LOGO_LONG_PRESSED, (call as ReferenceInstruction).reference.toString(), code)
                assertEquals(method.parameterRegister(1), (call as RegisterRangeInstruction).startRegister, code)
                assertEquals(stock, after.filterIndexed { index, _ -> index != stock.lastIndex }.map { it.opcode }, code)
            }
        }
    }
}
