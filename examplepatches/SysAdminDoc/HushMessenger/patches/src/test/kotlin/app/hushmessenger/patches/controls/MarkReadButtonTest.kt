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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val BAR = "LX/MrBar;"
private const val SOCKET = "LX/MrSocket;"
private const val CLICK = "LX/MrClick;"
private const val BUILDER = "LX/MrBuilder;"
private const val SPEC = "LX/MrSpec;"
private const val ICON = "LX/MrIcon;"
private const val FACTORY = "LX/MrFactory;"
private const val LAZY = "LX/MrLazy;"
private const val LAZIES = "LX/MrLazies;"
private const val PROVIDER = "LX/MrProvider;"
private const val LISTENER = "LX/MrListener;"
private const val ICON_SETTER = "$BUILDER->A01($ICON$PROVIDER$BUILDER)V"
private const val ICON_SETTER_BODY = "invoke-virtual {p1, p0}, $PROVIDER->A05($ICON)I\nmove-result v0\niput v0, p2, $BUILDER->A00:I\nreturn-void"
private const val SETTER_COPY = "LX/MrZSetters;"
private const val LIST_HELPER = "LX/MrListHelper;"
private const val DETAILS = "LX/MrDetails;"
private const val TITLE_BAR = "LX/MrTitleBar;"
private const val LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"
private const val DETAILS_BUILD = "$DETAILS->A00($LISTENER$LISTENER$MIG_SCHEME)$SPEC"
private const val LIST_COPY = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"
internal const val SYNTHETIC_MARK_READ_BAR = "$BAR->A00($SOCKET)V"
internal const val SYNTHETIC_MARK_READ_FACTORY = "$TITLE_BAR->A02(Landroid/content/Context;$FB_USER_SESSION$THREAD_KEY_TYPE$MIG_SCHEME$LIST_BUILDER)Ljava/lang/Object;"
internal const val SYNTHETIC_MARK_READ_CLICK = "$CLICK->onClick(Landroid/view/View;)V"
private const val ADD = "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z"
private const val WALK = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;"
private const val COUNT = "$SOCKET->A00($SOCKET)I"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val CONSTRUCTOR = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value
private val FINAL = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

/**
 * 583's older chat top bar, cut down: the QR scanner block that the button copies, the details button, the padding loop
 * that counts the socket's plugins, then the one walk of the list and the three-button cut. v1 is the list and v2 the
 * socket, as in 583.
 */
private val BAR_BODY = """
    const/16 v9, 0x3
    new-instance v1, Ljava/util/ArrayList;
    move v8, v9
    invoke-direct {v1, v8}, Ljava/util/ArrayList;-><init>(I)V
    move-object v2, p0
    const/4 v13, 0x4
    const-string v8, "audio_call_button"
    const-string v8, "video_call_button"
    const-string v8, "$QR_BUTTON_NAME"
    iget-object v12, v2, $SOCKET->A05:$QR_BUTTON
    iget-object v8, v12, $QR_BUTTON->A00:Landroid/content/Context;
    new-instance v11, $BUILDER
    const-string v8, "QR code"
    invoke-direct {v11, v8}, $BUILDER-><init>(Ljava/lang/String;)V
    iget-object v8, v12, $QR_BUTTON->A05:$THREAD_SCHEME
    iget-object v8, v8, $THREAD_SCHEME->A0G:$MIG_SCHEME
    iput-object v8, v11, $BUILDER->A08:$MIG_SCHEME
    iget-object v8, v12, $QR_BUTTON->A02:$LAZY
    invoke-static {v8}, $FACTORY->A0M($LAZY)$PROVIDER
    move-result-object v10
    sget-object v8, $ICON->A5v:$ICON
    invoke-virtual {v10, v8}, $PROVIDER->A05($ICON)I
    move-result v8
    iput v8, v11, $BUILDER->A00:I
    const-string v8, "$QR_BUTTON_TAG"
    iput-object v8, v11, $BUILDER->A0A:Ljava/lang/String;
    new-instance v8, $CLICK
    invoke-direct {v8, v12, v13}, $CLICK-><init>(Ljava/lang/Object;I)V
    iput-object v8, v11, $BUILDER->A06:$LISTENER
    new-instance v8, $SPEC
    invoke-direct {v8, v11}, $SPEC-><init>($BUILDER)V
    invoke-virtual {v1, v8}, $ADD
    const/4 v8, 0x0
    invoke-virtual {v8, v8, v8, v8}, $DETAILS_BUILD
    move-result-object v8
    invoke-virtual {v1, v8}, $ADD
    const/4 v7, 0x0
    :pad
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I
    move-result v5
    invoke-static {v2}, $COUNT
    move-result v3
    if-ge v5, v3, :padded
    invoke-virtual {v1, v7}, $ADD
    goto :pad
    :padded
    nop
    invoke-virtual {v1}, $WALK
    move-result-object v4
    const/4 v4, 0x0
    const/4 v6, 0x0
    move v5, v9
    invoke-virtual {v4, v6, v5}, $IMMUTABLE_LIST->subList(II)$IMMUTABLE_LIST
    return-void
""".trimIndent()

/** The walk's index in [BAR_BODY], where the button goes in. */
private val BAR_SITE = BAR_BODY.lines().filter { !it.startsWith(":") }.indexOfFirst { WALK in it }

private fun bar(body: String = BAR_BODY) = fixtureMethod(SYNTHETIC_MARK_READ_BAR, body, 16, STATIC)

/**
 * 583's newer chat top bar, cut down: a static factory that adds the details button to the builder it's handed and
 * returns what the builder builds. v0 is the list, the session p1, the chat p2 and the colors p3, as in 583's order.
 */
private val FACTORY_BODY = """
    const/4 v0, 0x0
    invoke-virtual {v0, v0, v0, p3}, $DETAILS_BUILD
    move-result-object v1
    invoke-virtual {p4, v1}, $LIST_BUILDER->add(Ljava/lang/Object;)$LIST_BUILDER
    invoke-virtual {p4}, $LIST_BUILDER->build()$IMMUTABLE_LIST
    move-result-object v0
    invoke-static {v0}, LX/MrCheck;->A0Z(Ljava/lang/Object;)V
    return-object v0
""".trimIndent()

/** The factory's return, where the button goes in. */
private val FACTORY_SITE = FACTORY_BODY.lines().indexOfFirst { "return-object" in it }

private fun factory(body: String = FACTORY_BODY) = fixtureMethod(SYNTHETIC_MARK_READ_FACTORY, body, 9, STATIC)

/** The details button's builder both bars call: it tags the button [tag], the way 583 tags it settings_button. */
private fun details(tag: String = MARK_READ_DETAILS_TAG) = fixtureMethod(DETAILS_BUILD, """
    new-instance v0, $BUILDER
    const-string v1, "Thread details"
    invoke-direct {v0, v1}, $BUILDER-><init>(Ljava/lang/String;)V
    iput-object p3, v0, $BUILDER->A08:$MIG_SCHEME
    const-string v1, "$tag"
    iput-object v1, v0, $BUILDER->A0A:Ljava/lang/String;
    new-instance v1, $SPEC
    invoke-direct {v1, v0}, $SPEC-><init>($BUILDER)V
    return-object v1
""".trimIndent(), 6)

/** The shared listener: its Object and case, read by one onClick that switches on the case. */
private fun click(registers: Int = 5, flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(SYNTHETIC_MARK_READ_CLICK, """
    iget v0, p0, $CLICK->A01:I
    iget-object v1, p0, $CLICK->A00:Ljava/lang/Object;
    return-void
""".trimIndent(), registers, flags)

private fun field(owner: String, name: String, type: String, flags: Int = FINAL) = ImmutableField(owner, name, type, flags, null, null, null)
private fun helper(id: String, body: String = "const/4 v0, 0x0\nreturn-object v0") = fixtureMethod(id, body, 2, STATIC)

/** The extension's build(socket) stub as it ships. */
internal fun markReadStub(flags: Int = STATIC, body: String = "const/4 v0, 0x0\nreturn-object v0") = fixtureMethod(MARK_READ_BUILD, body, 2, flags)

/** The extension's button(session, thread, mig) stub as it ships. */
internal fun markReadButtonStub(flags: Int = STATIC, body: String = "const/4 v0, 0x0\nreturn-object v0") = fixtureMethod(MARK_READ_BUTTON_BUILD, body, 4, flags)

/**
 * Both top bars, the socket and listener, the QR plugin, the builder it fills, the details button's builder, the icon
 * enum with Mark as read in it, and Guava's ImmutableList.copyOf unless [immutableList] is false (a caller that brings
 * its own drops it).
 */
internal fun markReadFixture(
    barMethod: MutableMethod = bar(),
    clickMethod: MutableMethod = click(),
    sessionFlags: Int = FINAL,
    builderFlags: Int = AccessFlags.PUBLIC.value,
    icons: List<String> = listOf("QR_CODE" to "A5v", "ENVELOPE_OPEN" to "A2i").map { it.first + ":" + it.second },
    factoryMethod: MutableMethod = factory(),
    detailsMethod: MutableMethod = details(),
    others: List<MutableMethod> = emptyList(),
    immutableList: Boolean = true,
): List<MutableClass> = listOfNotNull(
    fixtureClass(BAR, listOf(barMethod)),
    fixtureClass(TITLE_BAR, listOf(factoryMethod)),
    fixtureClass(DETAILS, listOf(detailsMethod)),
    others.takeIf { it.isNotEmpty() }?.let { fixtureClass("LX/MrOtherBar;", it) },
    fixtureClass(IMMUTABLE_LIST, listOf(fixtureMethod(LIST_COPY, "const/4 v0, 0x0\nreturn-object v0", 1, STATIC))).takeIf { immutableList },
    fixtureClass(SOCKET, listOf(helper(COUNT, "const/4 v0, 0x0\nreturn v0")), extraFields = listOf(
        field(SOCKET, "A0O", FB_USER_SESSION, sessionFlags), field(SOCKET, "A0V", THREAD_KEY_TYPE),
        field(SOCKET, "A0Y", THREAD_SCHEME), field(SOCKET, "A05", QR_BUTTON))),
    fixtureClass(QR_BUTTON, listOf(fixtureMethod("$QR_BUTTON-><init>(Landroid/content/Context;)V", """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        iput-object p1, p0, $QR_BUTTON->A00:Landroid/content/Context;
        invoke-static {}, $LAZIES->A00()$LAZY
        move-result-object v0
        iput-object v0, p0, $QR_BUTTON->A02:$LAZY
        const v0, 0x107c9
        invoke-static {v0}, $LAZIES->A01(I)$LAZY
        move-result-object v0
        iput-object v0, p0, $QR_BUTTON->A03:$LAZY
        return-void
    """.trimIndent(), 3, CONSTRUCTOR)), extraFields = listOf(field(QR_BUTTON, "A00", "Landroid/content/Context;"),
        // 583 keeps a second lazy of the icon's type, filled from an id: the icon is the one the bar reads.
        field(QR_BUTTON, "A05", THREAD_SCHEME), field(QR_BUTTON, "A02", LAZY), field(QR_BUTTON, "A03", LAZY))),
    fixtureClass(CLICK, listOf(fixtureMethod("$CLICK-><init>(Ljava/lang/Object;I)V", """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        iput-object p1, p0, $CLICK->A00:Ljava/lang/Object;
        iput p2, p0, $CLICK->A01:I
        return-void
    """.trimIndent(), 3, CONSTRUCTOR), clickMethod), extraFields = listOf(field(CLICK, "A00", "Ljava/lang/Object;"), field(CLICK, "A01", "I"))),
    fixtureClass(BUILDER, listOf(fixtureMethod("$BUILDER-><init>(Ljava/lang/String;)V", "return-void", 2, CONSTRUCTOR),
        // 584 sets the icon through the provider's resolver into an int field; this helper is the same two steps.
        fixtureMethod(ICON_SETTER, ICON_SETTER_BODY, 4, STATIC)),
        flags = builderFlags),
    fixtureClass(SPEC, listOf(fixtureMethod("$SPEC-><init>($BUILDER)V", "return-void", 2, CONSTRUCTOR))),
    fixtureClass(FACTORY, listOf(helper("$FACTORY->A0M($LAZY)$PROVIDER"))),
    fixtureClass(LAZIES, listOf(helper("$LAZIES->A00()$LAZY"))),
    fixtureClass(ICON, listOf(fixtureMethod("$ICON-><clinit>()V", icons.joinToString("\n") { entry ->
        val (name, slot) = entry.split(":")
        "new-instance v0, $ICON\nconst-string v1, \"$name\"\ninvoke-direct {v0, v1}, $ICON-><init>(Ljava/lang/String;)V\nsput-object v0, $ICON->$slot:$ICON"
    } + "\nreturn-void", 2, AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value))),
)

private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.args() = (this as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount) }

class MarkReadButtonTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        markReadRecipe = null
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).let { hooks ->
        hooks.getValue(MARK_READ_BAR).map { it.hookId() } + hooks.getValue(MARK_READ_CLICK).map { it.hookId() }
    }

    @Test fun theTopBarAndItsListenerAreFoundWithEveryValueTheButtonCopies() {
        assertEquals(listOf(SYNTHETIC_MARK_READ_BAR, SYNTHETIC_MARK_READ_FACTORY, SYNTHETIC_MARK_READ_CLICK), found(markReadFixture()))
        validateControls(mirroredControls(markReadFixture()), setOf(MARK_READ_BAR, MARK_READ_CLICK))
        val recipe = markReadRecipe!!
        assertEquals(SOCKET, recipe.socketType)
        assertEquals("$SOCKET->A0O:$FB_USER_SESSION", recipe.session)
        assertEquals("$SOCKET->A0V:$THREAD_KEY_TYPE", recipe.thread)
        assertEquals("$SOCKET->A0Y:$THREAD_SCHEME", recipe.scheme)
        assertEquals("$THREAD_SCHEME->A0G:$MIG_SCHEME", recipe.mig)
        assertEquals(BUILDER, recipe.builder)
        assertEquals("$BUILDER->A08:$MIG_SCHEME", recipe.builderScheme)
        assertEquals("$BUILDER->A0A:Ljava/lang/String;", recipe.tagField)
        assertEquals("$BUILDER->A06:$LISTENER", recipe.listenerField)
        assertEquals("$LAZIES->A00()$LAZY", recipe.iconSource)
        assertEquals("$FACTORY->A0M($LAZY)$PROVIDER", recipe.iconProvider)
        assertEquals("$ICON_SETTER", recipe.iconSetter)
        // Messenger's own Mark as read icon, not the QR code the block it copies uses.
        assertEquals("$ICON->A2i:$ICON", recipe.icon)
        assertEquals(CLICK, recipe.listener)
        assertEquals(4, recipe.listenerCase)
        assertEquals("$CLICK->A00:Ljava/lang/Object;", recipe.target)
        assertEquals(SPEC, recipe.spec)
        assertEquals(listOf(BAR_SITE, 1, 2), listOf(recipe.site, recipe.list, recipe.socket))
        // The newer bar: its return of v0, the session, chat and colors parameters, and three free locals.
        val factory = factory()
        assertEquals(SYNTHETIC_MARK_READ_FACTORY, recipe.factory.hookId())
        assertEquals(MarkReadFactory(FACTORY_SITE, 0, factory.parameterRegister(1), factory.parameterRegister(2), factory.parameterRegister(3),
            listOf(1, 2, 3), "$LIST_BUILDER->build()$IMMUTABLE_LIST"), recipe.factorySite)
        assertEquals(DETAILS_BUILD, recipe.details)
    }

    // 585's factory is an instance method whose early returns hand back other lists, and builds the button list through a
    // static helper that only builds and null-checks it. The site is the one return the details button reaches.
    @Test fun anInstanceFactoryReturnsTheListTheDetailsButtonReachesThroughItsBuildHelper() {
        val build = "$LIST_HELPER->A00($LIST_BUILDER)$IMMUTABLE_LIST"
        val body = """
            const/4 v0, 0x0
            if-eqz v0, :late
            invoke-virtual {p5}, $LIST_BUILDER->build()$IMMUTABLE_LIST
            move-result-object v0
            return-object v0
            :late
            invoke-virtual {v0, v0, v0, p4}, $DETAILS_BUILD
            move-result-object v1
            invoke-virtual {p5, v1}, $LIST_BUILDER->add(Ljava/lang/Object;)$LIST_BUILDER
            invoke-static {p5}, $build
            move-result-object v0
            return-object v0
        """.trimIndent()
        val helper = fixtureMethod(build, "invoke-virtual {p0}, $LIST_BUILDER->build()$IMMUTABLE_LIST\nmove-result-object v0\n" +
            "invoke-static {v0}, LX/MrCheck;->A0Z(Ljava/lang/Object;)V\nreturn-object v0", 2, STATIC)
        val factory = fixtureMethod(SYNTHETIC_MARK_READ_FACTORY, body, 10, AccessFlags.PUBLIC.value)
        val classes = markReadFixture(factoryMethod = factory) + fixtureClass(LIST_HELPER, listOf(helper))
        assertEquals(listOf(SYNTHETIC_MARK_READ_BAR, SYNTHETIC_MARK_READ_FACTORY, SYNTHETIC_MARK_READ_CLICK), found(classes))
        validateControls(mirroredControls(classes), setOf(MARK_READ_BAR, MARK_READ_CLICK))
        // p0 is the receiver, so the session, chat and colors are p2..p4, and the scratch stays below it.
        val site = body.lines().filter { !it.startsWith(":") }.indexOfLast { "return-object" in it }
        assertEquals(MarkReadFactory(site, 0, factory.parameterRegister(2), factory.parameterRegister(3), factory.parameterRegister(4),
            listOf(1, 2, 3), build), markReadRecipe!!.factorySite)
    }

    // 585 carries the icon setter on more than one public class; copies that do the same steps are the same helper.
    @Test fun anIdenticalIconSetterCopyLeavesTheFirstSetterInUse() {
        val copy = fixtureMethod("$SETTER_COPY->A00($ICON$PROVIDER$BUILDER)V", ICON_SETTER_BODY, 4, STATIC)
        val classes = markReadFixture() + fixtureClass(SETTER_COPY, listOf(copy))
        assertEquals(listOf(SYNTHETIC_MARK_READ_BAR, SYNTHETIC_MARK_READ_FACTORY, SYNTHETIC_MARK_READ_CLICK), found(classes))
        assertEquals(ICON_SETTER, markReadRecipe!!.iconSetter)
    }

    @Test fun everyProfileNamesBothBarsAndOneListener() {
        for (profile in listOf(SYNTHETIC_PROFILE, BASE_PROFILE)) {
            assertEquals(2, profile.hooks.getValue(MARK_READ_BAR).size)
            assertEquals(1, profile.hooks.getValue(MARK_READ_CLICK).size)
        }
    }

    // The button is safe only where the list it joins is the one the bar walks, untouched in between, and the bar keeps
    // three buttons, and where the newer bar hands back the list its builder just built. Any other shape, or a value the
    // copied block can't supply, leaves every hook out.
    @Test fun aChangedBarOrAMissingValueLeavesTheControlUnapplied() {
        val walk = "invoke-virtual {v1}, $WALK"
        val ret = "return-object v0"
        val cases = mapOf(
            "a factory that reassigns the chat" to markReadFixture(factoryMethod = factory(FACTORY_BODY.replace("const/4 v0, 0x0", "const/4 v0, 0x0\nmove-object p2, v0"))),
            "a factory with a second return" to markReadFixture(factoryMethod = factory(FACTORY_BODY.replace("move-result-object v1", "move-result-object v1\nif-eqz v1, :early").replace(ret, "$ret\n:early\n$ret"))),
            "a jump onto the factory's return" to markReadFixture(factoryMethod = factory(FACTORY_BODY.replace("const/4 v0, 0x0", "const/4 v0, 0x0\nif-eqz v0, :out").replace(ret, ":out\n$ret"))),
            "a factory list written after it's built" to markReadFixture(factoryMethod = factory(FACTORY_BODY.replace(ret, "move-object v0, p4\n$ret"))),
            "a factory without a free local" to markReadFixture(factoryMethod = fixtureMethod(SYNTHETIC_MARK_READ_FACTORY, FACTORY_BODY, 7, STATIC)),
            "a factory list built by an unknown call" to markReadFixture(factoryMethod = factory(FACTORY_BODY.replace("invoke-virtual {p4}, $LIST_BUILDER->build()$IMMUTABLE_LIST",
                "invoke-static {p4}, $LIST_HELPER->A00($LIST_BUILDER)$IMMUTABLE_LIST"))),
            "a build helper that does more" to markReadFixture(factoryMethod = factory(FACTORY_BODY.replace("invoke-virtual {p4}, $LIST_BUILDER->build()$IMMUTABLE_LIST",
                "invoke-static {p4}, $LIST_HELPER->A00($LIST_BUILDER)$IMMUTABLE_LIST"))) + fixtureClass(LIST_HELPER, listOf(fixtureMethod(
                "$LIST_HELPER->A00($LIST_BUILDER)$IMMUTABLE_LIST", "invoke-virtual {p0}, $LIST_BUILDER->build()$IMMUTABLE_LIST\nmove-result-object v0\n" +
                    "invoke-virtual {p0}, $LIST_BUILDER->build()$IMMUTABLE_LIST\nreturn-object v0", 2, STATIC))),
            "an icon setter copy with other steps" to markReadFixture() + fixtureClass(SETTER_COPY, listOf(fixtureMethod("$SETTER_COPY->A00($ICON$PROVIDER$BUILDER)V",
                ICON_SETTER_BODY.replace("$BUILDER->A00:I", "$BUILDER->A07:I"), 4, STATIC))),
            "a second caller of the details button" to markReadFixture(others = listOf(fixtureMethod("LX/MrOtherBar;->A00()V",
                "const/4 v0, 0x0\ninvoke-virtual {v0, v0, v0, v0}, $DETAILS_BUILD\nreturn-void", 2, STATIC))),
            "a details button with another tag" to markReadFixture(detailsMethod = details("circles_settings_button")),
            "no ImmutableList.copyOf" to markReadFixture(immutableList = false),
            "a second walk of the list" to markReadFixture(bar(BAR_BODY.replace("return-void", "$walk\nreturn-void"))),
            "a jump into the seam from before the count" to markReadFixture(bar(BAR_BODY.replace("move-object v2, p0", "move-object v2, p0\nif-eqz v2, :padded"))),
            "a jump onto the walk itself" to markReadFixture(bar(BAR_BODY.replace("nop\n$walk", "if-eqz v5, :walk\n:walk\n$walk"))),
            "the list written in the seam" to markReadFixture(bar(BAR_BODY.replace("nop\n$walk", "move-object v1, v7\n$walk"))),
            "the socket written in the seam" to markReadFixture(bar(BAR_BODY.replace("nop\n$walk", "move-object v2, v7\n$walk"))),
            "a bar that keeps four buttons" to markReadFixture(bar(BAR_BODY.replace("const/16 v9, 0x3", "const/16 v9, 0x4"))),
            "no Mark as read icon" to markReadFixture(icons = listOf("QR_CODE:A5v")),
            "a builder outside the public API" to markReadFixture(builderFlags = 0),
            "a listener with one free register" to markReadFixture(clickMethod = click(registers = 3)),
            "a static listener" to markReadFixture(clickMethod = click(flags = STATIC)),
            "a session field that can change" to markReadFixture(sessionFlags = AccessFlags.PUBLIC.value),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MARK_READ_BAR, MARK_READ_CLICK)) }
        }
    }

    @Test fun theButtonJoinsTheListRightBeforeTheWalk() {
        val method = bar()
        mirroredControls(markReadFixture(barMethod = method))
        val before = method.code()
        injectControl(MARK_READ_BUTTON, mapOf(MARK_READ_BAR to listOf(method, factory()), MARK_READ_CLICK to listOf(click())))
        val code = method.code()
        assertEquals(MARK_READ_ADD, code[BAR_SITE].ref())
        assertEquals(listOf(1, 2), code[BAR_SITE].args())
        assertEquals(WALK, code[BAR_SITE + 1].ref())
        // The padding loop's exit still lands ahead of the new call, so every pass through the seam runs it.
        val exit = code.indexOfFirst { it.opcode == Opcode.IF_GE }
        assertEquals(BAR_SITE - 1, code.branchTarget(exit))
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i != BAR_SITE }.map { it.opcode })
    }

    @Test fun theNewerBarReturnsItsListThroughTheExtensionAndBackIntoAnImmutableList() {
        val method = factory()
        mirroredControls(markReadFixture(factoryMethod = method))
        val before = method.code()
        injectControl(MARK_READ_BUTTON, mapOf(MARK_READ_BAR to listOf(bar(), method), MARK_READ_CLICK to listOf(click())))
        val code = method.code()
        val added = code.subList(FACTORY_SITE, FACTORY_SITE + 7)
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT), added.map { it.opcode })
        // The session, chat and colors parameters go to three free locals, never to the list's v0.
        assertEquals(listOf(1 to method.parameterRegister(1), 2 to method.parameterRegister(2), 3 to method.parameterRegister(3)),
            added.take(3).map { (it as TwoRegisterInstruction).let { move -> move.registerA to move.registerB } })
        assertEquals(MARK_READ_ADD_TO, added[3].ref())
        assertEquals(listOf(0, 1, 2, 3), added[3].args())
        assertEquals(LIST_COPY, added[5].ref())
        assertEquals(listOf(0), added[5].args())
        assertEquals(listOf(0, 0), listOf(added[4], added[6]).map { (it as OneRegisterInstruction).registerA })
        assertEquals(Opcode.RETURN_OBJECT, code[FACTORY_SITE + 7].opcode)
        assertEquals(before, code.filterIndexed { i, _ -> i !in FACTORY_SITE until FACTORY_SITE + 7 })
    }

    @Test fun ourTagAnswersTheTapAndEveryOtherButtonGoesOnAsBefore() {
        val method = click()
        mirroredControls(markReadFixture(clickMethod = method))
        val before = method.code()
        injectControl(MARK_READ_BUTTON, mapOf(MARK_READ_BAR to listOf(bar(), factory()), MARK_READ_CLICK to listOf(method)))
        val code = method.code()
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), code.take(7).map { it.opcode })
        assertEquals(method.parameterRegister(0), (code[0] as TwoRegisterInstruction).registerB)
        assertEquals("$CLICK->A00:Ljava/lang/Object;", code[1].ref())
        assertEquals(method.parameterRegister(1), (code[2] as TwoRegisterInstruction).registerB)
        assertEquals(MARK_READ_CLICKED, code[3].ref())
        assertEquals(listOf(0, 1), code[3].args())
        assertEquals(7, code.branchTarget(5))
        assertEquals(before, code.drop(7))
    }

    @Test fun bothTopBarControlsWriteTheirSharedSeamOnceInEitherOrder() {
        for (hideFirst in listOf(true, false)) {
            val barMethod = bar()
            val factoryMethod = factory()
            val clickMethod = click()
            mirroredControls(markReadFixture(barMethod = barMethod, clickMethod = clickMethod, factoryMethod = factoryMethod))
            val hide = { injectControl(HIDE_CALL_BUTTONS, mapOf(HIDE_CALL_BAR to listOf(barMethod, factoryMethod))) }
            val mark = { injectControl(MARK_READ_BUTTON, mapOf(MARK_READ_BAR to listOf(barMethod, factoryMethod), MARK_READ_CLICK to listOf(clickMethod))) }
            if (hideFirst) { hide(); mark() } else { mark(); hide() }
            assertEquals(1, barMethod.code().count { it.ref() == MARK_READ_ADD }, "hide first: $hideFirst")
            assertEquals(1, factoryMethod.code().count { it.ref() == MARK_READ_ADD_TO }, "hide first: $hideFirst")
            assertEquals(1, clickMethod.code().count { it.ref() == MARK_READ_CLICKED }, "hide first: $hideFirst")
        }
    }

    @Test fun hideCallButtonsAloneStillGetsTheSeamAndLeavesTheTapAlone() {
        val barMethod = bar()
        val factoryMethod = factory()
        val clickMethod = click()
        mirroredControls(markReadFixture(barMethod = barMethod, clickMethod = clickMethod, factoryMethod = factoryMethod))
        val clickBefore = clickMethod.code()
        injectControl(HIDE_CALL_BUTTONS, mapOf(HIDE_CALL_BAR to listOf(barMethod, factoryMethod)))
        assertEquals(MARK_READ_ADD, barMethod.code()[BAR_SITE].ref())
        assertEquals(1, factoryMethod.code().count { it.ref() == MARK_READ_ADD_TO })
        assertEquals(clickBefore, clickMethod.code())
    }

    @Test fun aStrayMethodRefusesTheControlBeforeAnyEdit() {
        val method = bar()
        mirroredControls(markReadFixture(barMethod = method))
        val before = method.code()
        val stray = fixtureMethod("LX/MrOther;->onClick(Landroid/view/View;)V", "return-void", 5)
        assertFailsWith<PatchException> { injectControl(MARK_READ_BUTTON, mapOf(MARK_READ_BAR to listOf(method), MARK_READ_CLICK to listOf(stray))) }
        assertEquals(before, method.code())
    }

    @Test fun theBuiltButtonCopiesTheQrBlockWithTheMarkAsReadIconAndOurTag() {
        mirroredControls(markReadFixture())
        val stub = markReadButtonStub()
        val built = markReadBuilder(stub, markReadRecipe!!)
        assertEquals(MARK_READ_BUTTON_BUILD, built.hookId())
        assertEquals(stub.accessFlags, built.accessFlags)
        val code = built.code()
        val refs = code.mapNotNull { it.ref() }
        assertEquals(MARK_READ_TAG, code[0].ref())
        assertEquals(listOf(built.parameterRegister(0), built.parameterRegister(1)), code[0].args())
        for (expected in listOf(MIG_SCHEME, MARK_READ_LABEL, "$BUILDER-><init>(Ljava/lang/String;)V", "$BUILDER->A08:$MIG_SCHEME",
            "$LAZIES->A00()$LAZY", "$FACTORY->A0M($LAZY)$PROVIDER", "$ICON->A2i:$ICON", "$ICON_SETTER",
            "$BUILDER->A0A:Ljava/lang/String;", "$CLICK-><init>(Ljava/lang/Object;I)V", "$BUILDER->A06:$LISTENER", "$SPEC-><init>($BUILDER)V"))
            assertTrue(expected in refs, expected)
        assertTrue("$ICON->A5v:$ICON" !in refs)
        assertEquals(MARK_READ_VIEW_TAG, code.firstNotNullOf { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string })
        // The colors are checked as Messenger's color scheme before the builder takes them.
        val isScheme = code.indexOfFirst { it.opcode == Opcode.INSTANCE_OF }
        assertEquals(built.parameterRegister(2), (code[isScheme] as TwoRegisterInstruction).registerB)
        // The listener holds the chat's tag, under the QR button's case, so the tap hook can tell it apart.
        val listenerInit = code.indexOfFirst { it.ref() == "$CLICK-><init>(Ljava/lang/Object;I)V" }
        val case = code.take(listenerInit).last { it.opcode == Opcode.CONST_16 } as NarrowLiteralInstruction
        assertEquals(4, case.narrowLiteral)
        assertEquals((code[1] as OneRegisterInstruction).registerA, code[listenerInit].args()[1])
        // Every way out early returns null: no tag for the chat, colors that aren't Messenger's.
        val none = code.size - 2
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT), code.drop(none).map { it.opcode })
        assertEquals(2, code.indices.count { code[it].opcode == Opcode.IF_EQZ && code.branchTarget(it) == none })
        assertEquals(Opcode.RETURN_OBJECT, code[none - 1].opcode)
    }

    @Test fun theOlderBarsSocketHandsItsChatAndColorsToTheButton() {
        mirroredControls(markReadFixture())
        val stub = markReadStub()
        val built = markReadSocketBuilder(stub, markReadRecipe!!)
        assertEquals(MARK_READ_BUILD, built.hookId())
        assertEquals(stub.accessFlags, built.accessFlags)
        val code = built.code()
        assertEquals(SOCKET, code[0].ref())
        assertEquals(listOf("$SOCKET->A0O:$FB_USER_SESSION", "$SOCKET->A0V:$THREAD_KEY_TYPE", "$SOCKET->A0Y:$THREAD_SCHEME", "$THREAD_SCHEME->A0G:$MIG_SCHEME"),
            code.filter { it.opcode == Opcode.IGET_OBJECT }.map { it.ref() })
        val call = code.indexOfFirst { it.ref() == MARK_READ_BUTTON_BUILD }
        assertEquals(listOf(0, 1, 2), code[call].args())
        assertEquals(Opcode.RETURN_OBJECT, code[call + 2].opcode)
        // Not the bar's socket, or no colors yet: null.
        val none = code.size - 2
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT), code.drop(none).map { it.opcode })
        assertEquals(2, code.indices.count { code[it].opcode == Opcode.IF_EQZ && code.branchTarget(it) == none })
    }

    @Test fun aChangedStubIsRefusedBeforeAnyEdit() {
        mirroredControls(markReadFixture())
        val recipe = markReadRecipe!!
        val other = fixtureMethod("$MARK_READ->tag(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "const/4 v0, 0x0\nreturn-object v0", 3, STATIC)
        val cases = mapOf(
            "an instance stub" to (markReadStub(flags = AccessFlags.PUBLIC.value) to markReadButtonStub(flags = AccessFlags.PUBLIC.value)),
            "a private stub" to (markReadStub(flags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value) to
                markReadButtonStub(flags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value)),
            "a stub with a body" to (markReadStub(body = "new-instance v0, Ljava/lang/Object;\nreturn-object v0") to
                markReadButtonStub(body = "new-instance v0, Ljava/lang/Object;\nreturn-object v0")),
            "another method" to (other to other),
            "the stubs swapped" to (markReadButtonStub() to markReadStub()),
        )
        for ((case, stubs) in cases) {
            assertFailsWith<PatchException>(case) { markReadSocketBuilder(stubs.first, recipe) }
            assertFailsWith<PatchException>(case) { markReadBuilder(stubs.second, recipe) }
        }
    }

    @Test fun everySupportedBuildGivesTheButtonItsRecipe() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val (bars, clicks) = findMarkReadButton(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(MARK_READ_BAR), bars.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(MARK_READ_CLICK), clicks.map { it.hookId() }.toSet(), code)
            val recipe = markReadRecipe!!
            val bar = MutableMethod(bars.single { it.hookId() == recipe.bar.hookId() })
            val factory = MutableMethod(bars.single { it.hookId() == recipe.factory.hookId() })
            val click = MutableMethod(clicks.single())
            val barBefore = bar.code()
            val factoryBefore = factory.code()
            injectControl(MARK_READ_BUTTON, mapOf(MARK_READ_BAR to listOf(bar, factory), MARK_READ_CLICK to listOf(click)))
            assertEquals(MARK_READ_ADD, bar.code()[recipe.site].ref(), code)
            assertEquals(WALK, bar.code()[recipe.site + 1].ref(), code)
            assertEquals(barBefore.map { it.opcode }, bar.code().filterIndexed { i, _ -> i != recipe.site }.map { it.opcode }, code)
            val site = recipe.factorySite.site
            assertEquals(listOf(MARK_READ_ADD_TO, LIST_COPY), listOf(factory.code()[site + 3].ref(), factory.code()[site + 5].ref()), code)
            assertEquals(Opcode.RETURN_OBJECT, factory.code()[site + 7].opcode, code)
            // A goto that jumps across the new call may come back wider; it's the same jump.
            fun Instruction.jump() = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
            assertEquals(factoryBefore.map { it.jump() }, factory.code().filterIndexed { i, _ -> i !in site until site + 7 }.map { it.jump() }, code)
            assertEquals(MARK_READ_CLICKED, click.code()[3].ref(), code)
            val built = markReadBuilder(markReadButtonStub(), recipe).code().mapNotNull { it.ref() }
            assertTrue(recipe.icon in built && "${recipe.listener}-><init>(Ljava/lang/Object;I)V" in built, code)
            assertTrue(MARK_READ_BUTTON_BUILD in markReadSocketBuilder(markReadStub(), recipe).code().mapNotNull { it.ref() }, code)
        }
    }
}
