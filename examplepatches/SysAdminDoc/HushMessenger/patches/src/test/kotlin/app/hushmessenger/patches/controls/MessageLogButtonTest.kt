package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val BAR = "LX/MlBar;"
private const val BUTTON = "LX/MlButton;"
private const val FACTORY = "LX/MlFactory;"
private const val ICON = "LX/MlIcon;"
private const val GLYPH = "LX/MlGlyph;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val BUTTON_INIT = "$BUTTON-><init>(LX/MlA;LX/MlB;${GLYPH}LX/MlC;LX/MlD;$STRING$STRING${STRING}Z)V"
private const val FACTORY_CALL = "$FACTORY->A00($CONTEXT$FB_USER_SESSION$ICON)$GLYPH"
private const val ADD = "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z"
internal const val SYNTHETIC_LOG_BAR = "$BAR->Cdh()Ljava/util/List;"
internal const val SYNTHETIC_LOG_CLICK = "$BAR->DgR(Landroid/view/View;${STRING}${STRING}I)V"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val FINAL = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
private const val NULL_BODY = "const/4 v0, 0x0\nreturn-object v0"

/**
 * 585's Chats tab bar, cut down: the new message button's block (the context and account fields, the icon factory, the
 * label, the button's nine arguments in one range), then the null padding up to the bar's size and a call before the
 * one return. 585 also keeps the receiver in v20 and reads it through a low local, as here.
 */
private val BAR_BODY = """
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    const-string v0, "$TOOLBAR_SPEC"
    const-string v0, "$TOOLBAR_MODEL"
    const-string v0, "$COMPOSE_BUTTON_NAME"
    move-object/from16 v3, p0
    iget-object v2, v3, $BAR->A0M:$CONTEXT
    iget-object v3, v3, $BAR->A0P:$FB_USER_SESSION
    sget-object v4, $ICON->A0R:$ICON
    invoke-static {v2, v3, v4}, $FACTORY_CALL
    move-result-object v9
    const v5, 0x7f0b0001
    invoke-virtual {v2, v5}, $CONTEXT->getString(I)$STRING
    move-result-object v13
    new-instance v6, $BUTTON
    const/4 v7, 0x0
    move-object v8, v7
    const/4 v10, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    const-string v14, "$COMPOSER_BUTTON_ID"
    const/4 v15, 0x0
    invoke-direct/range {v6 .. v15}, $BUTTON_INIT
    invoke-virtual {v1, v6}, $ADD
    const/4 v0, 0x0
    :pad
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I
    move-result v2
    const/4 v3, 0x5
    if-ge v2, v3, :done
    invoke-virtual {v1, v0}, $ADD
    goto :pad
    :done
    invoke-static {v1}, LX/MlTrace;->A00(Ljava/lang/Object;)V
    return-object v1
""".trimIndent()

/** The bar's return, where the button goes in. */
private val BAR_SITE = BAR_BODY.lines().filter { !it.startsWith(":") }.indexOfFirst { "return-object" in it }

private val SLOTS = listOf(LogSlot.NONE, LogSlot.NONE, LogSlot.ICON, LogSlot.NONE, LogSlot.NONE, LogSlot.NONE, LogSlot.LABEL, LogSlot.ID, LogSlot.OFF)

private fun logBar(body: String = BAR_BODY, id: String = SYNTHETIC_LOG_BAR) = fixtureMethod(id, body, 20)

/** The bar's tap handler: the id second, and the new message button's own id among the ones it checks. */
private fun logClick(registers: Int = 7) = fixtureMethod(SYNTHETIC_LOG_CLICK, """
    const-string v0, "$COMPOSER_BUTTON_ID"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :other
    iget-object v1, p0, $BAR->A0M:$CONTEXT
    :other
    return-void
""".trimIndent(), registers)

/** The bar with one try from its first instruction up to [end], caught by a handler after the return. */
private fun withTry(method: MutableMethod, end: Int): MutableMethod {
    val code = method.implementation!!.instructions.toList()
    val at = IntArray(code.size + 1).also { a -> for (i in code.indices) a[i + 1] = a[i] + code[i].codeUnits }
    val handler = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
    return MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
        null, null, ImmutableMethodImplementation(method.implementation!!.registerCount, code,
            listOf(ImmutableTryBlock(0, at[end], listOf(ImmutableExceptionHandler(null, at[handler])))), null)))
}

private fun field(owner: String, name: String, type: String, flags: Int = FINAL) = ImmutableField(owner, name, type, flags, null, null, null)

/** The extension's button(context, session, label) stub as it ships. */
internal fun logButtonStub(flags: Int = STATIC, body: String = NULL_BODY) = fixtureMethod(MESSAGE_LOG_BUTTON_BUILD, body, 4, flags)

/** The extension's buttonId(button) stub as it ships. */
internal fun logButtonIdStub(flags: Int = STATIC, body: String = NULL_BODY) = fixtureMethod(MESSAGE_LOG_BUTTON_ID_OF, body, 2, flags)

/** The bar, the button with its id field, the icon factory, the icon enum with the clock in it, and the account class. */
internal fun messageLogButtonFixture(
    barMethod: MutableMethod = logBar(),
    clickMethod: MutableMethod = logClick(),
    idFlags: Int = FINAL,
    buttonFlags: Int = AccessFlags.PUBLIC.value,
    icons: List<String> = listOf("COMPOSE:A0R", "CLOCK:A1y"),
): List<MutableClass> = listOf(
    fixtureClass(BAR, listOf(barMethod, clickMethod), extraFields = listOf(field(BAR, "A0M", CONTEXT), field(BAR, "A0P", FB_USER_SESSION))),
    fixtureClass(BUTTON, listOf(fixtureMethod(BUTTON_INIT, """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        iput-object p3, p0, $BUTTON->A02:$GLYPH
        iput-object p7, p0, $BUTTON->A06:$STRING
        iput-object p8, p0, $BUTTON->A07:$STRING
        return-void
    """.trimIndent(), 10, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)),
        extraFields = listOf(field(BUTTON, "A02", GLYPH), field(BUTTON, "A06", STRING), field(BUTTON, "A07", STRING, idFlags)), flags = buttonFlags),
    fixtureClass(FACTORY, listOf(fixtureMethod(FACTORY_CALL, NULL_BODY, 4, STATIC))),
    fixtureClass(ICON, listOf(fixtureMethod("$ICON-><clinit>()V", icons.joinToString("\n") { entry ->
        val (name, slot) = entry.split(":")
        "new-instance v0, $ICON\nconst-string v1, \"$name\"\ninvoke-direct {v0, v1}, $ICON-><init>(Ljava/lang/String;)V\nsput-object v0, $ICON->$slot:$ICON"
    } + "\nreturn-void", 2, AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)),
        extraFields = icons.map { field(ICON, it.substringAfter(":"), ICON, STATIC or AccessFlags.FINAL.value) }),
    fixtureClass(FB_USER_SESSION),
)

private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.args(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

class MessageLogButtonTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        messageLogButtonRecipe = null
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).let { hooks ->
        hooks.getValue(MESSAGE_LOG_BUTTON).map { it.hookId() } + hooks.getValue(MESSAGE_LOG_CLICK).map { it.hookId() }
    }

    @Test fun theChatsBarAndItsTapHandlerAreFoundWithEveryValueTheButtonCopies() {
        assertEquals(listOf(SYNTHETIC_LOG_BAR, SYNTHETIC_LOG_CLICK), found(messageLogButtonFixture()))
        validateControls(mirroredControls(messageLogButtonFixture()), setOf(MESSAGE_LOG_BUTTON, MESSAGE_LOG_CLICK))
        val recipe = messageLogButtonRecipe!!
        assertEquals("$BAR->A0M:$CONTEXT", recipe.context)
        assertEquals("$BAR->A0P:$FB_USER_SESSION", recipe.session)
        assertEquals(FACTORY_CALL, recipe.factory)
        // Messenger's clock, not the compose icon the block it copies uses.
        assertEquals("$ICON->A1y:$ICON", recipe.icon)
        assertEquals(BUTTON, recipe.button)
        assertEquals(BUTTON_INIT, recipe.init)
        assertEquals(SLOTS, recipe.slots)
        assertEquals("$BUTTON->A07:$STRING", recipe.idField)
        assertEquals(LogBarSite(BAR_SITE, 1, listOf(0, 2)), recipe.site)
    }

    @Test fun aBarTheButtonCantGoIntoSafelyIsRefusedByBothFinders() {
        val handled = BAR_BODY + "\n:caught\nmove-exception v0\nthrow v0"
        val cases = mapOf(
            // The new code would join a try whose end sits on the return.
            "try ends on the return" to messageLogButtonFixture(withTry(logBar(handled), BAR_SITE)),
            "try covers the return" to messageLogButtonFixture(withTry(logBar(handled), BAR_SITE + 1)),
            "branch onto the return" to messageLogButtonFixture(logBar(BAR_BODY.replace("invoke-static {v1}, LX/MlTrace;->A00(Ljava/lang/Object;)V\n", ""))),
            "receiver written" to messageLogButtonFixture(logBar(BAR_BODY.replace("const/4 v0, 0x0\n:pad", "move-object/from16 v19, v1\nconst/4 v0, 0x0\n:pad"))),
            "list it didn't make" to messageLogButtonFixture(logBar(BAR_BODY.replace(
                "new-instance v1, Ljava/util/ArrayList;\ninvoke-direct {v1}, Ljava/util/ArrayList;-><init>()V",
                "invoke-static {}, LX/MlLists;->A00()Ljava/util/ArrayList;\nmove-result-object v1"))),
            "second return" to messageLogButtonFixture(logBar(BAR_BODY.replace("goto :pad", "return-object v1"))),
            "argument nothing explains" to messageLogButtonFixture(logBar(BAR_BODY.replace("const/4 v10, 0x0", "const/4 v10, 0x1"))),
            "two new message buttons" to messageLogButtonFixture(logBar(BAR_BODY.replace("const-string v0, \"$TOOLBAR_MODEL\"",
                "const-string v0, \"$TOOLBAR_MODEL\"\nconst-string v0, \"$COMPOSE_BUTTON_NAME\""))),
            "no clock icon" to messageLogButtonFixture(icons = listOf("COMPOSE:A0R", "ALARM:A1y")),
            "private id field" to messageLogButtonFixture(idFlags = AccessFlags.FINAL.value),
            "package-private button" to messageLogButtonFixture(buttonFlags = AccessFlags.FINAL.value),
            "tap handler with no free local" to messageLogButtonFixture(clickMethod = logClick(5)),
            "second bar" to messageLogButtonFixture() + fixtureClass("LX/MlOtherBar;", listOf(logBar(id = "LX/MlOtherBar;->Cdh()Ljava/util/List;"))),
        )
        for ((case, classes) in cases) {
            assertEquals(emptyList(), found(classes), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MESSAGE_LOG_BUTTON, MESSAGE_LOG_CLICK)) }
        }
        // A try that ends before the call ahead of the return stays where it is.
        assertEquals(listOf(SYNTHETIC_LOG_BAR, SYNTHETIC_LOG_CLICK), found(messageLogButtonFixture(withTry(logBar(handled), BAR_SITE - 1))))
    }

    @Test fun theButtonGoesInRightBeforeTheReturnAndTheTapIsOursOnlyForOurId() {
        val bar = logBar()
        val click = logClick()
        findMessageLogButton(messageLogButtonFixture(bar, click))
        val before = bar.code()
        injectControl(MESSAGE_LOG, mapOf(MESSAGE_LOG_BUTTON to listOf(bar), MESSAGE_LOG_CLICK to listOf(click)))
        val code = bar.code()
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[BAR_SITE].opcode)
        assertEquals(listOf(0, 19), (code[BAR_SITE] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(listOf("$BAR->A0M:$CONTEXT", "$BAR->A0P:$FB_USER_SESSION"), listOf(code[BAR_SITE + 1].ref(), code[BAR_SITE + 2].ref()))
        assertEquals(listOf(2, 0), listOf(code[BAR_SITE + 1], code[BAR_SITE + 2]).map { (it as OneRegisterInstruction).registerA })
        assertEquals(MESSAGE_LOG_BUTTON_ADD, code[BAR_SITE + 3].ref())
        assertEquals(listOf(1, 2, 0), code[BAR_SITE + 3].args())
        assertEquals(Opcode.RETURN_OBJECT, code[BAR_SITE + 4].opcode)
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in BAR_SITE until BAR_SITE + 4 }.map { it.opcode })
        // The padding loop still exits onto the call ahead of the new code.
        assertTrue(BAR_SITE - 1 in bar.jumpTargets() && (BAR_SITE until BAR_SITE + 5).none { it in bar.jumpTargets() })

        val tap = click.code()
        assertEquals(MESSAGE_LOG_BUTTON_CLICKED, tap[0].ref())
        assertEquals(listOf(click.parameterRegister(1), click.parameterRegister(2)), tap[0].args())
        assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), tap.subList(1, 4).map { it.opcode })
        // Any other id goes on to Messenger's own handler.
        assertTrue(4 in click.jumpTargets())
        assertEquals(COMPOSER_BUTTON_ID, ((tap[4] as ReferenceInstruction).reference as StringReference).string)
    }

    @Test fun theStubsBecomeTheBuildsOwnButtonAndIdReader() {
        findMessageLogButton(messageLogButtonFixture())
        val recipe = messageLogButtonRecipe!!
        val built = messageLogButtonBuilder(logButtonStub(), recipe)
        val code = built.code()
        assertEquals(15, built.implementation!!.registerCount)
        assertEquals(listOf("$ICON->A1y:$ICON", FACTORY_CALL), listOf(code[4].ref(), code[5].ref()))
        // The factory gets the stub's context and the checked account.
        assertEquals(listOf(12, 11, 10), code[5].args())
        val init = code.single { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
        assertEquals(BUTTON_INIT, init.ref())
        assertEquals((0..9).toList(), init.args())
        val slots = code.subList(code.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE } + 1, code.indexOf(init))
        assertEquals(listOf(Opcode.CONST_4, Opcode.CONST_4, Opcode.MOVE_OBJECT, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4,
            Opcode.MOVE_OBJECT, Opcode.CONST_STRING, Opcode.CONST_4), slots.map { it.opcode })
        assertEquals(10, (slots[2] as TwoRegisterInstruction).registerB)
        // The label is the stub's third parameter, the id the extension's own.
        assertEquals(14, (slots[6] as TwoRegisterInstruction).registerB)
        assertEquals(MESSAGE_LOG_BUTTON_ID, ((slots[7] as ReferenceInstruction).reference as StringReference).string)

        val reader = messageLogButtonIdReader(logButtonIdStub(), recipe).code()
        assertEquals("$BUTTON->A07:$STRING", reader.single { it.opcode == Opcode.IGET_OBJECT }.ref())
        assertEquals(BUTTON, reader[0].ref())

        for ((case, stub) in mapOf("not static" to logButtonStub(AccessFlags.PUBLIC.value), "body changed" to logButtonStub(body = "const/4 v0, 0x1\nreturn-object v0"),
            "private" to logButtonStub(AccessFlags.PRIVATE.value or AccessFlags.STATIC.value)))
            assertFailsWith<PatchException>(case) { messageLogButtonBuilder(stub, recipe) }
        assertFailsWith<PatchException> { messageLogButtonIdReader(logButtonStub(), recipe) }
    }

    @Test fun everySupportedBuildMakesTheButtonFromItsOwnNewMessageButton() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val (bars, clicks) = findMessageLogButton(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(MESSAGE_LOG_BUTTON), bars.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(MESSAGE_LOG_CLICK), clicks.map { it.hookId() }.toSet(), code)
            val recipe = messageLogButtonRecipe!!
            assertEquals(SLOTS, recipe.slots, code)
            val bar = MutableMethod(bars.single())
            val click = MutableMethod(clicks.single())
            val before = bar.code()
            injectControl(MESSAGE_LOG, mapOf(MESSAGE_LOG_BUTTON to listOf(bar), MESSAGE_LOG_CLICK to listOf(click)))
            val site = recipe.site.site
            assertEquals(MESSAGE_LOG_BUTTON_ADD, bar.code()[site + 3].ref(), code)
            assertEquals(before.map { it.opcode }, bar.code().filterIndexed { i, _ -> i !in site until site + 4 }.map { it.opcode }, code)
            assertEquals(MESSAGE_LOG_BUTTON_CLICKED, click.code()[0].ref(), code)
            messageLogButtonBuilder(logButtonStub(), recipe)
            messageLogButtonIdReader(logButtonIdStub(), recipe)
        }
    }
}
