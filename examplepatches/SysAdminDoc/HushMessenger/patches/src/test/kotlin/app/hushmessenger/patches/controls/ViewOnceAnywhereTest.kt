package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The chat composer's gallery plugin under its 354 name, which the synthetic profile keeps. */
internal const val SYNTHETIC_VIEW_ONCE = "LX/5H4;->render(LX/5Re;LX/5q2;Lcom/facebook/xapp/messaging/capability/vector/Capabilities;)V"

private const val VIEW_ONCE_BUILDER = "LX/FVw;"
private const val VIEW_ONCE_COMPONENT = "LX/FUr;"
private const val VIEW_ONCE_CONTEXT = "LX/1Hx;"
private const val VIEW_ONCE_CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;"
private const val VIEW_ONCE_SHEET = "LX/G86;->render(LX/27r;)LX/1F6;"
private const val VIEW_ONCE_CALL = "Lapp/hushmessenger/extension/Settings;->viewOnceOffered(Z)Z"

/**
 * The builder's constructor, cut to three required props with the View once prop in the middle: the names packed into
 * one array, the BitSet sized to them, and both kept in the builder's own fields.
 */
private fun builderBody(prop: String = "showViewOnceToggle", array: String = "[Ljava/lang/String;") = """
    const-string v0, "fbUserSession"
    const-string v1, "$prop"
    const-string v2, "tintColor"
    filled-new-array {v0, v1, v2}, $array
    move-result-object v0
    iput-object v0, p0, $VIEW_ONCE_BUILDER->A03:$array
    const/4 v0, 0x3
    invoke-static {v0}, LX/FTP;->A18(I)Ljava/util/BitSet;
    move-result-object v0
    iput-object v0, p0, $VIEW_ONCE_BUILDER->A02:Ljava/util/BitSet;
    iput-object p2, p0, $VIEW_ONCE_BUILDER->A01:$VIEW_ONCE_COMPONENT
    return-void
""".trimIndent()

private fun builder(
    body: String = builderBody(),
    owner: String = VIEW_ONCE_BUILDER,
    component: String = VIEW_ONCE_COMPONENT,
) = fixtureMethod("$owner-><init>($VIEW_ONCE_CONTEXT$component)V", body, 6)

/**
 * The composer's gallery plugin cut to the prop it computes: the capability vector is asked, a true answer gives 1 and
 * a false one 0, and the answer is written into the component with the prop's own bit set right after.
 */
private fun hostBody(bit: Int = 1, component: String = VIEW_ONCE_COMPONENT, value: String = "v0") = """
    new-instance v4, $VIEW_ONCE_BUILDER
    const/16 v1, 0x12b
    invoke-virtual {p3, v1}, $VIEW_ONCE_CAPABILITIES->A00(I)Z
    move-result v1
    if-eqz v1, :off
    const/4 v0, 0x1
    goto :write
    :off
    const/4 v0, 0x0
    :write
    iput-boolean $value, v2, $component->A0u:Z
    const/4 v1, 0x$bit
    invoke-virtual {v3, v1}, Ljava/util/BitSet;->set(I)V
    return-void
""".trimIndent()

private fun host(body: String = hostBody(), id: String = SYNTHETIC_VIEW_ONCE) = fixtureMethod(id, body, 10)

/** The Send-to sheet's own gallery, which writes the prop from an answer of its own and takes no capability vector. */
private fun sheet() = fixtureMethod(VIEW_ONCE_SHEET, """
    new-instance v4, $VIEW_ONCE_BUILDER
    const/4 v0, 0x1
    iput-boolean v0, v2, $VIEW_ONCE_COMPONENT->A0u:Z
    const/4 v1, 0x1
    invoke-virtual {v3, v1}, Ljava/util/BitSet;->set(I)V
    return-object v4
""".trimIndent(), 8)

private fun fixture(
    host: MutableMethod = host(),
    builders: List<MutableMethod> = listOf(builder()),
    extra: List<MutableMethod> = emptyList(),
): List<MutableClass> = ((listOf(host) + builders + extra).groupBy { it.definingClass }
    .map { (type, methods) -> fixtureClass(type, methods) } + fixtureClass(VIEW_ONCE_COMPONENT))

/** The composer's plugin, its builder and the component, for the complete discovery fixture. */
internal fun viewOnceAnywhereFixture(): List<MutableClass> = fixture()

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.reference(at: Int) = (code()[at] as? ReferenceInstruction)?.reference?.toString()

class ViewOnceAnywhereTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(VIEW_ONCE_ANYWHERE)

    @Test fun findsTheComposersGalleryPlugin() {
        assertEquals(listOf(SYNTHETIC_VIEW_ONCE), found(fixture()).map { it.hookId() })
        validateControls(mirroredControls(fixture()), setOf(VIEW_ONCE_ANYWHERE))
        assertEquals(ViewOnceGate(VIEW_ONCE_BUILDER, VIEW_ONCE_COMPONENT, 1), viewOnceGate)
        assertEquals(setOf(SYNTHETIC_VIEW_ONCE), SYNTHETIC_PROFILE.hooks.getValue(VIEW_ONCE_ANYWHERE))
        // The fixtures keep 587's names. 588 renames the builder and both its scope types.
        assertEquals(setOf("LX/5yn;->render(LX/4nJ;LX/6Be;$VIEW_ONCE_CAPABILITIES)V"), BASE_PROFILE.hooks.getValue(VIEW_ONCE_ANYWHERE))
        assertEquals(8, host().validateViewOnceAnywhere())
    }

    // The Send-to sheet and the voice sheet build the same gallery with an answer of their own, and keep it. Their write
    // of the prop looks exactly like the composer's, so the capability vector is what tells the composer's apart.
    @Test fun theOtherGallerySurfacesAreLeftAlone() {
        val classes = fixture(extra = listOf(sheet()))
        assertEquals(listOf(SYNTHETIC_VIEW_ONCE), found(classes).map { it.hookId() })
        assertEquals(2, sheet().viewOnceSite(viewOnceGate!!))
        assertTrue(sheet().parameterTypes.none { it == VIEW_ONCE_CAPABILITIES })
    }

    @Test fun lookalikesAreNotFound() {
        val cases = mapOf(
            "no View once prop counted" to fixture(builders = listOf(builder(builderBody(prop = "showAddToToggle")))),
            "the names aren't a string array" to fixture(builders = listOf(builder(builderBody(array = "[Ljava/lang/Object;")))),
            "the builder keeps nothing" to fixture(builders = listOf(builder(builderBody()
                .replace("iput-object v0, p0, $VIEW_ONCE_BUILDER->A02:Ljava/util/BitSet;", "return-void")))),
            "two builders count the prop" to fixture(builders = listOf(builder(), builder(
                builderBody().replace(VIEW_ONCE_BUILDER, "LX/FVx;"), owner = "LX/FVx;"))),
            "the write sets another prop's bit" to fixture(host(hostBody(bit = 2))),
            "the write is to another component" to fixture(host(hostBody(component = "LX/FUs;"))),
            "no bit is set after the write" to fixture(host(hostBody()
                .replace("invoke-virtual {v3, v1}, Ljava/util/BitSet;->set(I)V", "return-void"))),
            "the answer is a parameter" to fixture(host(hostBody(value = "p1"))),
            "no builder is made" to fixture(host(hostBody().replace("new-instance v4, $VIEW_ONCE_BUILDER", "const/4 v4, 0x0"))),
            "the plugin takes no capability vector" to fixture(host(id = "LX/5H4;->render(LX/5Re;LX/5q2;LX/5q3;)V")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(VIEW_ONCE_ANYWHERE)) }
        }
    }

    // Two writes of the prop in the one plugin leave nothing to pick between, so the build is refused.
    @Test fun aPluginThatWritesThePropTwiceIsRefused() {
        val twice = host(hostBody().replace("return-void",
            "iput-boolean v0, v2, $VIEW_ONCE_COMPONENT->A0u:Z\nconst/4 v1, 0x1\ninvoke-virtual {v3, v1}, Ljava/util/BitSet;->set(I)V\nreturn-void"))
        assertTrue(found(fixture(twice)).isEmpty())
    }

    @Test fun theAnswerGoesThroughTheExtension() {
        val method = host()
        found(fixture(method))
        val before = method.code()
        injectControl(VIEW_ONCE_ANYWHERE, mapOf(VIEW_ONCE_ANYWHERE to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 2, code.size)
        assertEquals(Opcode.INVOKE_STATIC, code[8].opcode)
        assertEquals(VIEW_ONCE_CALL, method.reference(8))
        assertEquals(Opcode.MOVE_RESULT, code[9].opcode)
        assertEquals(0, (code[9] as OneRegisterInstruction).registerA)
        // The prop takes the extension's answer, in the register the capability gate left it in.
        assertEquals(Opcode.IPUT_BOOLEAN, code[10].opcode)
        assertEquals(0, (code[10] as TwoRegisterInstruction).registerA)
        // Nothing else moved, and both paths of the gate still reach the write through the extension.
        assertEquals(before.map { it.opcode }, (code.take(8) + code.drop(10)).map { it.opcode })
        assertEquals(7, code.branchTarget(4))
        assertTrue(code.branchTarget(6) in 8..10)
    }

    @Test fun aRefusedPluginIsLeftAsItWas() {
        found(fixture())
        val bad = host(hostBody(bit = 2))
        val before = bad.code()
        assertFailsWith<PatchException> { injectControl(VIEW_ONCE_ANYWHERE, mapOf(VIEW_ONCE_ANYWHERE to listOf(bad))) }
        assertEquals(before, bad.code())
    }

    @Test fun everySupportedBuildPassesThePropThrough() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findViewOnceAnywhere(classes)
            assertEquals(activeProfile.hooks.getValue(VIEW_ONCE_ANYWHERE), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(VIEW_ONCE_ANYWHERE to hooks), setOf(VIEW_ONCE_ANYWHERE))
            val method = MutableMethod(hooks.single())
            val before = method.code()
            val at = method.validateViewOnceAnywhere()
            val offered = (before[at] as TwoRegisterInstruction).registerA
            method.injectViewOnceAnywhere()
            val after = method.code()
            assertEquals(VIEW_ONCE_CALL, method.reference(at), code)
            assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode, code)
            assertEquals(offered, (after[at + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(Opcode.IPUT_BOOLEAN, after[at + 2].opcode, code)
            val stock = after.filterIndexed { i, _ -> i != at && i != at + 1 }
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP }, stock.map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
