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
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val WORDMARK = "LX/Hh1;"
private const val SCOPE = "LX/Hh5;"
internal const val SYNTHETIC_HOME_HEADER = "$WORDMARK->render($SCOPE)LX/Hh9;"
private const val SCALE = "Landroid/widget/ImageView\$ScaleType;"
private const val COLORS = "Lcom/facebook/mig/scheme/interfaces/MigColorScheme;"
private const val MEMO = "LX/Hh4;->A00(${SCOPE}Lkotlin/jvm/functions/Function0;[Ljava/lang/Object;)Ljava/lang/Object;"
private const val IMAGE = "LX/Hh8;->A00(Landroid/graphics/drawable/Drawable;${SCALE}LX/Hh6;Z)LX/Hh9;"

/**
 * The wordmark's render as 585 writes it, cut down: the color scheme picks the light or dark wordmark, a memo loads it
 * once, then it shows as an image start-aligned, or end-aligned right to left. Eight registers, p0 is v6 and p1 v7.
 */
private val RENDER_BODY = """
    const/4 v4, 0x0
    iget-object v1, p0, $WORDMARK->A02:$COLORS
    sget-object v0, $WORDMARK->A03:LX/Hh2;
    invoke-interface {v1, v0}, $COLORS->Eiy(LX/Hh2;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Number;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I
    move-result v2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    const/4 v3, 0x1
    filled-new-array {v1}, [Ljava/lang/Object;
    move-result-object v1
    new-instance v0, LX/Hh3;
    invoke-direct {v0, v2, v4, v7, v6}, LX/Hh3;-><init>(IILjava/lang/Object;Ljava/lang/Object;)V
    invoke-static {v7, v0, v1}, $MEMO
    move-result-object v2
    check-cast v2, Landroid/graphics/drawable/Drawable;
    invoke-virtual {v7}, $SCOPE->A06()V
    sget-object v1, LX/Hh6;->A02:LX/Hh6;
    invoke-static {v6}, LX/Hh7;->A01(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :start
    sget-object v0, $SCALE->FIT_END:$SCALE
    :show
    invoke-static {v2, v0, v1, v3}, $IMAGE
    move-result-object v0
    return-object v0
    :start
    sget-object v0, $SCALE->FIT_START:$SCALE
    goto :show
""".trimIndent()

private fun render(body: String = RENDER_BODY, id: String = SYNTHETIC_HOME_HEADER, flags: Int = AccessFlags.PUBLIC.value): MutableMethod =
    fixtureMethod(id, body, registers = 8, flags = flags)

/** The component beside it measures the title and loads nothing. */
private fun measure() = fixtureMethod("$WORDMARK->A00($SCOPE)I", "const/4 v0, 0x0\nreturn v0", registers = 2)

internal fun homeHeaderFixture(renderMethod: MutableMethod = render()): List<MutableClass> =
    listOf(fixtureClass(WORDMARK, listOf(renderMethod, measure())))

private fun Method.code() = implementation!!.instructions.toList()

class HomeHeaderTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(HOME_HEADER).map { it.hookId() }

    @Test fun theWordmarkIsTheOneRenderThatMemosADrawableAndShowsItAtEitherEnd() {
        assertEquals(listOf(SYNTHETIC_HOME_HEADER), found(homeHeaderFixture()))
        validateControls(mirroredControls(homeHeaderFixture()), setOf(HOME_HEADER))
        assertEquals(setOf(SYNTHETIC_HOME_HEADER), SYNTHETIC_PROFILE.hooks.getValue(HOME_HEADER))
        val arm64 = setOf("LX/2a9;->render(LX/2ED;)LX/1IG;")
        assertEquals(arm64, BASE_PROFILE.hooks.getValue(HOME_HEADER))
        assertEquals(arm64, PROFILE_347014996.hooks.getValue(HOME_HEADER))
        assertEquals(setOf("LX/2be;->render(LX/2Fc;)LX/1J8;"), PROFILE_347014974.hooks.getValue(HOME_HEADER))
        assertEquals(setOf("LX/2aZ;->render(LX/2Ed;)LX/1Ig;"), PROFILE_347014990.hooks.getValue(HOME_HEADER))
    }

    @Test fun lookalikesAreNotTheWordmark() {
        fun changed(from: String, to: String) = homeHeaderFixture(render(RENDER_BODY.replace(from, to).also { check(it != RENDER_BODY) }))
        val cases = mapOf(
            "static" to homeHeaderFixture(render(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "never end-aligned" to changed("$SCALE->FIT_END:$SCALE", "$SCALE->CENTER:$SCALE"),
            "never start-aligned" to changed("$SCALE->FIT_START:$SCALE", "$SCALE->CENTER:$SCALE"),
            "no color scheme" to changed("invoke-interface {v1, v0}, $COLORS->Eiy(LX/Hh2;)Ljava/lang/Object;",
                "invoke-interface {v1, v0}, LX/Hh10;->Eiy(LX/Hh2;)Ljava/lang/Object;"),
            "an image that takes no flag" to changed("invoke-static {v2, v0, v1, v3}, $IMAGE",
                "invoke-static {v2, v0, v1}, LX/Hh8;->A00(Landroid/graphics/drawable/Drawable;${SCALE}LX/Hh6;)LX/Hh9;"),
            "a memo cast to something else" to changed("check-cast v2, Landroid/graphics/drawable/Drawable;", "check-cast v2, Ljava/lang/String;"),
            "a memo without its keys" to changed("invoke-static {v7, v0, v1}, $MEMO",
                "invoke-static {v7, v0}, LX/Hh4;->A00(${SCOPE}Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;"),
            "the cast of another register" to changed("check-cast v2, Landroid/graphics/drawable/Drawable;", "check-cast v1, Landroid/graphics/drawable/Drawable;"),
            "two memoed drawables" to changed("invoke-virtual {v7}, $SCOPE->A06()V",
                "invoke-static {v7, v0, v1}, $MEMO\nmove-result-object v5\ncheck-cast v5, Landroid/graphics/drawable/Drawable;\ninvoke-virtual {v7}, $SCOPE->A06()V"),
            "two wordmarks" to homeHeaderFixture() + fixtureClass("LX/Other;", listOf(render(id = "LX/Other;->render($SCOPE)LX/Hh9;"))),
            "no wordmark" to listOf(fixtureClass("LX/Unrelated;")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(HOME_HEADER)) }
        }
    }

    @Test fun theExtensionDressesTheWordmarkRightAfterTheCast() {
        val method = render()
        val before = method.code()
        val cast = before.indexOfFirst { it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == "Landroid/graphics/drawable/Drawable;" }
        injectControl(HOME_HEADER, mapOf(HOME_HEADER to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 2, code.size)
        assertEquals(before.take(cast + 1), code.take(cast + 1))
        val call = code[cast + 1]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(HOME_HEADER_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(2, 1), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, 2), (code[cast + 2] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(before.drop(cast + 1).map { it.opcode }, code.drop(cast + 3).map { it.opcode })
    }

    @Test fun anUnusableRenderRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // A branch onto the instruction after the cast would skip the call, so a raw wordmark could still show.
            "a jump lands after the cast" to render(RENDER_BODY.replace("invoke-virtual {v7}, $SCOPE->A06()V", ":after\ninvoke-virtual {v7}, $SCOPE->A06()V")
                .replace("const/4 v3, 0x1", "const/4 v3, 0x1\nif-eqz v4, :after")),
            "never end-aligned" to render(RENDER_BODY.replace("$SCALE->FIT_END:$SCALE", "$SCALE->CENTER:$SCALE")),
            "the measure beside it" to measure(),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(HOME_HEADER, mapOf(HOME_HEADER to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildDrawsItsWordmarkFromOneRender() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val renders = findHomeHeader(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(HOME_HEADER), renders.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(HOME_HEADER to renders), setOf(HOME_HEADER))
            val method = MutableMethod(renders.single())
            val site = method.validateHomeHeader()
            val before = method.code()
            method.injectHomeHeader()
            val after = method.code()
            assertEquals(before.size + 2, after.size, code)
            assertEquals(HOME_HEADER_CALL, (after[site.index + 1] as ReferenceInstruction).reference.toString(), code)
            assertEquals(site.drawable, (after[site.index + 2] as OneRegisterInstruction).registerA, code)
        }
    }
}
