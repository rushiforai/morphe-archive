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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val OPTIONS = "LX/Av1;"
private const val LAYER = "LX/Av3;"
private const val PARAMS = "LX/Av4;"
internal const val SYNTHETIC_VITO_ROUNDING = "$OPTIONS-><init>([FFZZZ)V"
internal const val SYNTHETIC_LEGACY_ROUNDING = "LX/Av2;->A04($LAYER$PARAMS)V"
private const val CIRCLE = "$SETTINGS->avatarCircle(Z)Z"
private const val RADIUS = "$SETTINGS->avatarRadius(ZF)F"
private const val VITO_RADII = "$SETTINGS->avatarVitoRadii(Z[F)[F"
private const val LEGACY_RADII = "$SETTINGS->avatarRadii([FZ)[F"

/** Vito's RoundingOptions.toString() as 584.1 writes it, cut down: every field read up front, then the name and isCircular. */
private const val PRINTER_BODY = """iget-boolean v3, p0, $OPTIONS->A02:Z
iget v2, p0, $OPTIONS->A00:F
iget-boolean v1, p0, $OPTIONS->A01:Z
const-string v0, "$ROUNDING_OPTIONS_NAME"
invoke-static {v0}, LX/001;->A0t(Ljava/lang/String;)Ljava/lang/StringBuilder;
move-result-object v0
invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
move-result-object v0
return-object v0"""

/** Its constructor: radii, radius, isCircular, anti-aliased, force round at decode. */
private const val CONSTRUCTOR_BODY = """invoke-direct {p0}, Ljava/lang/Object;-><init>()V
iput-boolean p3, p0, $OPTIONS->A02:Z
iput p2, p0, $OPTIONS->A00:F
iput-object p1, p0, $OPTIONS->A04:[F
iput-boolean p4, p0, $OPTIONS->A01:Z
iput-boolean p5, p0, $OPTIONS->A03:Z
return-void"""

/** The legacy helper that hands RoundingParams to a rounded layer: the circle flag, the radii, then the border. */
private const val LEGACY_BODY = """iget-boolean v0, p1, $PARAMS->A06:Z
invoke-interface {p0, v0}, $LAYER->DT5(Z)V
iget-object v0, p1, $PARAMS->A07:[F
invoke-interface {p0, v0}, $LAYER->DZl([F)V
iget v1, p1, $PARAMS->A02:I
iget v0, p1, $PARAMS->A00:F
invoke-interface {p0, v1, v0}, $LAYER->DSU(IF)V
return-void"""

private const val TILE = "LX/Av10;"
private const val PLACEHOLDER = "LX/Av11;"
internal const val SYNTHETIC_TILE_SHAPE = "$TILE->A0E(Z)V"
internal const val SYNTHETIC_TILE_SETUP = "$TILE->A09(Landroid/graphics/Path;$PLACEHOLDER)V"
internal const val SYNTHETIC_TILE_PLACEHOLDER = "$PLACEHOLDER->draw(Landroid/graphics/Canvas;)V"
private const val TILE_PATH = "$SETTINGS->avatarPath(Landroid/graphics/Path;)Landroid/graphics/Path;"

/** The user tile's shape setter as 584.1 writes it: an OvalShape when the flag is set, a RectShape when it isn't. */
private const val TILE_SHAPE_BODY = """iget-object v1, p0, $TILE->A07:Landroid/graphics/drawable/ShapeDrawable;
if-eqz p1, :rect
new-instance v0, Landroid/graphics/drawable/shapes/OvalShape;
invoke-direct {v0}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V
:set
invoke-virtual {v1, v0}, Landroid/graphics/drawable/ShapeDrawable;->setShape(Landroid/graphics/drawable/shapes/Shape;)V
return-void
:rect
new-instance v0, Landroid/graphics/drawable/shapes/RectShape;
invoke-direct {v0}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V
goto :set"""

/** Its setup, cut down: the clip path becomes the photo's PathShape and the placeholder's clip, then the shape is set. */
private const val TILE_SETUP_BODY = """new-instance v0, Landroid/graphics/drawable/shapes/PathShape;
const/high16 v1, 0x3f800000
invoke-direct {v0, p1, v1, v1}, Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V
iput-object p1, p2, $PLACEHOLDER->A01:Landroid/graphics/Path;
const/4 v1, 0x1
invoke-virtual {p0, v1}, $SYNTHETIC_TILE_SHAPE
return-void"""

/** The placeholder fills an oval, then strokes it. */
private const val PLACEHOLDER_BODY = """iget-object v0, p0, $PLACEHOLDER->A08:Landroid/graphics/RectF;
iget-object v1, p0, $PLACEHOLDER->A07:Landroid/graphics/Paint;
invoke-virtual {p1, v0, v1}, $DRAW_OVAL
invoke-virtual {p1, v0, v1}, $DRAW_OVAL
return-void"""

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun printer(body: String = PRINTER_BODY, type: String = OPTIONS) = fixtureMethod("$type->toString()Ljava/lang/String;", body.replace(OPTIONS, type), 5)
private fun constructor(body: String = CONSTRUCTOR_BODY, id: String = SYNTHETIC_VITO_ROUNDING) = fixtureMethod(id, body, 6)
private fun legacy(body: String = LEGACY_BODY, id: String = SYNTHETIC_LEGACY_ROUNDING) = fixtureMethod(id, body, 4, STATIC)
private fun tileShape(body: String = TILE_SHAPE_BODY, id: String = SYNTHETIC_TILE_SHAPE) = fixtureMethod(id, body, 4)
private fun tileSetup(body: String = TILE_SETUP_BODY) = fixtureMethod(SYNTHETIC_TILE_SETUP, body, 5)
private fun placeholder(body: String = PLACEHOLDER_BODY) = fixtureMethod(SYNTHETIC_TILE_PLACEHOLDER, body, 4)

/** Vito's options class, the legacy helper's class, the user tile and its placeholder. */
internal fun avatarShapeFixture(
    options: List<MutableMethod> = listOf(printer(), constructor()),
    helper: MutableMethod = legacy(),
    tile: List<MutableMethod> = listOf(tileShape(), tileSetup()),
    placeholderDraw: List<MutableMethod> = listOf(placeholder()),
): List<MutableClass> = listOf(fixtureClass(OPTIONS, options), fixtureClass("LX/Av2;", listOf(helper)),
    fixtureClass(TILE, tile), fixtureClass(PLACEHOLDER, placeholderDraw))

private fun Method.code() = implementation!!.instructions.toList()

private fun call(code: List<Instruction>, at: Int) =
    (code[at] as ReferenceInstruction).reference.toString() to (code[at] as FiveRegisterInstruction).let {
        listOf(it.registerC, it.registerD, it.registerE).take(it.registerCount)
    }

class AvatarShapeTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(AVATAR_SHAPE).map { it.hookId() }.toSet()

    @Test fun theVitoConstructorTheLegacyHelperAndTheUserTileAreFound() {
        assertEquals(setOf(SYNTHETIC_VITO_ROUNDING, SYNTHETIC_LEGACY_ROUNDING, SYNTHETIC_TILE_SHAPE, SYNTHETIC_TILE_SETUP, SYNTHETIC_TILE_PLACEHOLDER),
            found(avatarShapeFixture()))
        assertEquals("$OPTIONS->A02:Z", vitoCircleField)
        validateControls(mirroredControls(avatarShapeFixture()), setOf(AVATAR_SHAPE))
    }

    @Test fun eachFamilyMapsItsOwnHooks() {
        fun tile(tile: String, a: String, b: String, placeholder: String) = setOf("LX/$tile;->A0E(Z)V",
            "LX/$tile;->A09(Landroid/content/Context;Landroid/graphics/Path;Landroid/graphics/drawable/Drawable;" +
                "Lcom/facebook/auth/usersession/FbUserSession;LX/$a;LX/$b;LX/$placeholder;FIIZZ)V",
            "LX/$placeholder;->draw(Landroid/graphics/Canvas;)V")
        val arm64 = setOf("LX/4dq;-><init>([FFZZZ)V", "LX/QE4;->A04(LX/Sli;LX/4cM;)V") + tile("2lH", "2jg", "2lQ", "2lt")
        assertEquals(arm64, PROFILE_347015062.hooks.getValue(AVATAR_SHAPE))
        assertEquals(arm64, PROFILE_347014996.hooks.getValue(AVATAR_SHAPE))
        assertEquals(setOf("LX/4gQ;-><init>([FFZZZ)V", "LX/NhC;->A04(LX/QIU;LX/4ev;)V") + tile("2mn", "2lC", "2mw", "2nP"),
            PROFILE_347014974.hooks.getValue(AVATAR_SHAPE))
        assertEquals(setOf("LX/4dE;-><init>([FFZZZ)V", "LX/NEI;->A04(LX/Q7X;LX/4bk;)V") + tile("2lh", "2k6", "2lq", "2mJ"),
            PROFILE_347014990.hooks.getValue(AVATAR_SHAPE))
    }

    // Only some pictures changing would look broken, so anything we can't prove about either path gets no hook at all.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        fun options(from: String, to: String) = avatarShapeFixture(options = listOf(printer(),
            constructor(CONSTRUCTOR_BODY.replace(from, to).also { check(it != CONSTRUCTOR_BODY) })))
        fun helper(from: String, to: String) = avatarShapeFixture(helper = legacy(LEGACY_BODY.replace(from, to).also { check(it != LEGACY_BODY) }))
        val cases = mapOf(
            "a second options class" to avatarShapeFixture() + fixtureClass("LX/Av5;", listOf(printer(type = "LX/Av5;"))),
            "a toString that doesn't name the class" to avatarShapeFixture(options = listOf(printer(PRINTER_BODY.replace(ROUNDING_OPTIONS_NAME, "Rounding(")), constructor())),
            "a circle flag of another class" to avatarShapeFixture(options = listOf(printer(PRINTER_BODY.replace("iget-boolean v3, p0, $OPTIONS->A02:Z", "iget-boolean v3, p0, LX/Av6;->A02:Z")), constructor())),
            "a flag overwritten before it's printed" to avatarShapeFixture(options = listOf(printer(PRINTER_BODY.replace("const-string v0", "const/4 v3, 0x1\nconst-string v0")), constructor())),
            "a flag read off another object" to avatarShapeFixture(options = listOf(printer(PRINTER_BODY.replace("iget-boolean v3, p0", "iget-boolean v3, v1")), constructor())),
            "a branch before the name" to avatarShapeFixture(options = listOf(printer(PRINTER_BODY.replace("const-string v0", "if-eqz v1, :name\n:name\nconst-string v0")), constructor())),
            "no constructor" to avatarShapeFixture(options = listOf(printer())),
            "two constructors in the shape" to avatarShapeFixture(options = listOf(printer(), constructor(),
                fixtureMethod("$OPTIONS-><init>([FFZZZZ)V", CONSTRUCTOR_BODY.replace("p4", "p6"), 7))),
            "a constructor that works out the radius" to options("iput p2", "neg-float p2, p2\niput p2"),
            "a constructor that calls another parent" to options("Ljava/lang/Object;-><init>()V", "LX/Av7;-><init>()V"),
            "a constructor that stores a constant" to options("iput-boolean p5, p0, $OPTIONS->A03:Z", "const/4 v0, 0x0\niput-boolean v0, p0, $OPTIONS->A03:Z"),
            "a constructor without the circle flag" to options("iput-boolean p3, p0, $OPTIONS->A02:Z\n", ""),
            "a constructor without radii" to options("iput-object p1, p0, $OPTIONS->A04:[F\n", ""),
            "one parameter stored twice" to options("iput-boolean p5, p0, $OPTIONS->A03:Z", "iput-boolean p4, p0, $OPTIONS->A03:Z"),
            "no legacy helper" to listOf(fixtureClass(OPTIONS, listOf(printer(), constructor()))),
            "two legacy helpers" to avatarShapeFixture() + fixtureClass("LX/Av8;", listOf(legacy(id = "LX/Av8;->A00($LAYER$PARAMS)V"))),
            "a flag handed somewhere else" to helper("invoke-interface {p0, v0}, $LAYER->DT5(Z)V", "invoke-static {v0}, LX/Av9;->A00(Z)V"),
            "radii read before the flag" to helper("iget-boolean v0, p1, $PARAMS->A06:Z\ninvoke-interface {p0, v0}, $LAYER->DT5(Z)V\n" +
                "iget-object v0, p1, $PARAMS->A07:[F\ninvoke-interface {p0, v0}, $LAYER->DZl([F)V",
                "iget-object v0, p1, $PARAMS->A07:[F\ninvoke-interface {p0, v0}, $LAYER->DZl([F)V\n" +
                "iget-boolean v0, p1, $PARAMS->A06:Z\ninvoke-interface {p0, v0}, $LAYER->DT5(Z)V"),
            "no free register after the radii" to helper("iget v1, p1, $PARAMS->A02:I", "invoke-interface {p0}, $LAYER->Da2()V\niget v1, p1, $PARAMS->A02:I"),
            "a branch back into the start" to avatarShapeFixture(helper = legacy(LEGACY_BODY
                .replace("iget-object v0", ":mid\niget-object v0").replace("return-void", "if-eqz v1, :mid\nreturn-void"))),
            "no user tile" to avatarShapeFixture(tile = emptyList()),
            "two tile shape setters" to avatarShapeFixture(tile = listOf(tileShape(), tileSetup(), tileShape(id = "$TILE->A0F(Z)V"))),
            "a tile that never draws an oval" to avatarShapeFixture(tile = listOf(tileShape(TILE_SHAPE_BODY.replace("OvalShape", "ArcShape")), tileSetup())),
            "a shape setter that branches on something else" to avatarShapeFixture(tile = listOf(tileShape(TILE_SHAPE_BODY.replace("if-eqz p1", "if-eqz v1")), tileSetup())),
            "no tile setup" to avatarShapeFixture(tile = listOf(tileShape())),
            "a setup without the path shape" to avatarShapeFixture(tile = listOf(tileShape(), tileSetup(TILE_SETUP_BODY
                .replace("invoke-direct {v0, p1, v1, v1}, Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V\n", "")))),
            "a setup that never sets the shape" to avatarShapeFixture(tile = listOf(tileShape(), tileSetup(TILE_SETUP_BODY
                .replace("invoke-virtual {p0, v1}, $SYNTHETIC_TILE_SHAPE\n", "")))),
            "a placeholder without an oval" to avatarShapeFixture(placeholderDraw = listOf(placeholder(PLACEHOLDER_BODY
                .replace("invoke-virtual {p1, v0, v1}, $DRAW_OVAL\n", "")))),
            "two tile setups" to avatarShapeFixture(tile = listOf(tileShape(), tileSetup(),
                fixtureMethod("$TILE->A0A(Landroid/graphics/Path;$PLACEHOLDER)V", TILE_SETUP_BODY, 5))),
            // The setup also takes a second drawable that draws ovals, so which one is the placeholder can't be told.
            "two placeholder draws" to avatarShapeFixture(tile = listOf(tileShape(),
                fixtureMethod("$TILE->A09(Landroid/graphics/Path;${PLACEHOLDER}LX/Av12;)V", TILE_SETUP_BODY, 6))) +
                fixtureClass("LX/Av12;", listOf(fixtureMethod("LX/Av12;->draw(Landroid/graphics/Canvas;)V", PLACEHOLDER_BODY.replace(PLACEHOLDER, "LX/Av12;"), 4))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(AVATAR_SHAPE)) }
        }
        // That second drawable is fine when it draws no oval.
        val plain = avatarShapeFixture(tile = listOf(tileShape(),
            fixtureMethod("$TILE->A09(Landroid/graphics/Path;${PLACEHOLDER}LX/Av12;)V", TILE_SETUP_BODY, 6))) +
            fixtureClass("LX/Av12;", listOf(fixtureMethod("LX/Av12;->draw(Landroid/graphics/Canvas;)V", "return-void", 2)))
        assertEquals(5, found(plain).size)
    }

    @Test fun vitoAsksForTheShapeRightAfterTheParentConstructor() {
        found(avatarShapeFixture())
        val method = constructor()
        val before = method.code()
        injectControl(AVATAR_SHAPE, mapOf(AVATAR_SHAPE to listOf(method)))
        val code = method.code()
        assertEquals(before[0].opcode, code[0].opcode)
        // p1 radii is v1, p2 radius v2, p3 isCircular v3. The radius and radii are worked out before the flag changes.
        assertEquals(RADIUS to listOf(3, 2), call(code, 1))
        assertEquals(listOf(Opcode.MOVE_RESULT, 2), (code[2] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(VITO_RADII to listOf(3, 1), call(code, 3))
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, 1), (code[4] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(CIRCLE to listOf(3), call(code, 5))
        assertEquals(listOf(Opcode.MOVE_RESULT, 3), (code[6] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(before.drop(1).map { it.opcode }, code.drop(7).map { it.opcode })
    }

    @Test fun theLegacyLayerGetsTheSameAnswers() {
        found(avatarShapeFixture())
        val method = legacy()
        val before = method.code()
        injectControl(AVATAR_SHAPE, mapOf(AVATAR_SHAPE to listOf(method)))
        val code = method.code()
        assertEquals(CIRCLE to listOf(0), call(code, 1))
        assertEquals(0, (code[2] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.INVOKE_INTERFACE, code[3].opcode)
        assertEquals(Opcode.IGET_OBJECT, code[4].opcode)
        // The original flag again, into v1, which the border read overwrites next anyway.
        assertEquals(Opcode.IGET_BOOLEAN, code[5].opcode)
        assertEquals(listOf(1, 3), (code[5] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$PARAMS->A06:Z", (code[5] as ReferenceInstruction).reference.toString())
        assertEquals(LEGACY_RADII to listOf(0, 1), call(code, 6))
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, 0), (code[7] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(before.drop(3).map { it.opcode }, code.drop(8).map { it.opcode })
    }

    @Test fun theUserTileAsksForItsShapeItsPathAndItsPlaceholderOval() {
        found(avatarShapeFixture())
        val shape = tileShape()
        val shapeBefore = shape.code()
        injectControl(AVATAR_SHAPE, mapOf(AVATAR_SHAPE to listOf(shape)))
        val shapeAfter = shape.code()
        // p1 is v3 in four registers; the flag is rewritten before the branch reads it.
        assertEquals(CIRCLE to listOf(3), call(shapeAfter, 0))
        assertEquals(listOf(Opcode.MOVE_RESULT, 3), (shapeAfter[1] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(shapeBefore.map { it.opcode }, shapeAfter.drop(2).map { it.opcode })

        val setup = tileSetup()
        val setupBefore = setup.code()
        injectControl(AVATAR_SHAPE, mapOf(AVATAR_SHAPE to listOf(setup)))
        val setupAfter = setup.code()
        // p1, the Path, is v3 in five registers.
        assertEquals(TILE_PATH to listOf(3), call(setupAfter, 0))
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, 3), (setupAfter[1] as OneRegisterInstruction).let { listOf(it.opcode, it.registerA) })
        assertEquals(setupBefore.map { it.opcode }, setupAfter.drop(2).map { it.opcode })

        val draw = placeholder()
        val drawBefore = draw.code()
        injectControl(AVATAR_SHAPE, mapOf(AVATAR_SHAPE to listOf(draw)))
        val drawAfter = draw.code()
        assertEquals(drawBefore.size, drawAfter.size)
        for (at in listOf(2, 3)) {
            assertEquals(Opcode.INVOKE_STATIC, drawAfter[at].opcode)
            // Canvas p1 is v3, then the RectF and Paint the oval was drawn with.
            assertEquals(TILE_OVAL to listOf(3, 0, 1), call(drawAfter, at))
        }
    }

    @Test fun anUnprovedMethodRefusesTheSwitchBeforeAnyEdit() {
        found(avatarShapeFixture())
        val cases = mapOf(
            "a constructor that computes" to constructor(CONSTRUCTOR_BODY.replace("iput p2", "neg-float p2, p2\niput p2")),
            "a constructor of another class" to constructor(CONSTRUCTOR_BODY.replace(OPTIONS, "LX/Av5;"), "LX/Av5;-><init>([FFZZZ)V"),
            "a helper with the radii first" to legacy(LEGACY_BODY.replace("iget-boolean v0, p1, $PARAMS->A06:Z", "iget-object v0, p1, $PARAMS->A07:[F")),
            "a shape setter that branches on something else" to tileShape(TILE_SHAPE_BODY.replace("if-eqz p1", "if-eqz v1")),
            "a setup without the path shape" to tileSetup(TILE_SETUP_BODY.replace("PathShape;-><init>", "PathShape;->A00")),
            "a placeholder without an oval" to placeholder(PLACEHOLDER_BODY.replace(DRAW_OVAL, "Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V")),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(AVATAR_SHAPE, mapOf(AVATAR_SHAPE to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildRoundsThroughTheSameFiveHooks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val expected = mutableMapOf<String, Set<String>>()
        val actual = mutableMapOf<String, Set<String>>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findAvatarShape(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            expected[code] = activeProfile.hooks.getValue(AVATAR_SHAPE)
            actual[code] = hooks.map { it.hookId() }.toSet()
            if (actual[code] != expected[code]) continue
            validateControls(mapOf(AVATAR_SHAPE to hooks), setOf(AVATAR_SHAPE))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                method.injectAvatarShape()
                val after = method.code()
                val id = "$code ${hook.hookId()}"
                fun asked(at: Int) = (after[at] as ReferenceInstruction).reference.toString()
                when {
                    hook.name == "<init>" -> { assertEquals(before.size + 6, after.size, id); assertEquals(CIRCLE, asked(5), id) }
                    hook.name == "draw" -> {
                        assertEquals(before.size, after.size, id)
                        assertTrue(after.none { (it as? ReferenceInstruction)?.reference?.toString() == DRAW_OVAL }, id)
                        assertTrue(after.any { (it as? ReferenceInstruction)?.reference?.toString() == TILE_OVAL }, id)
                    }
                    hook.hookId() == tileShapeSetter -> { assertEquals(before.size + 2, after.size, id); assertEquals(CIRCLE, asked(0), id) }
                    hook.parameterTypes.any { it.toString() == "Landroid/graphics/Path;" } -> {
                        assertEquals(before.size + 2, after.size, id); assertEquals(TILE_PATH, asked(0), id)
                    }
                    else -> { assertEquals(before.size + 5, after.size, id); assertEquals(CIRCLE, asked(1), id) }
                }
            }
        }
        // All builds at once, so one run shows every family's ids.
        assertEquals(expected, actual)
    }
}
