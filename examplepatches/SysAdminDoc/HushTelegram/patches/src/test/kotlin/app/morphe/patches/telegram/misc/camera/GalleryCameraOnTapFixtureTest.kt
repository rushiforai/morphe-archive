/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.camera

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** The photo layout, the classes of its fields (so the camera view's superclass resolves) and the runtime. */
class GalleryCameraOnTapFixtureTest {
    @Test
    fun `every gallery camera path is gated and keeps its stock flow`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveGalleryCameraSites()
            val check = ImmutableMethod.of(sites.check)
            val show = ImmutableMethod.of(sites.show)
            val tap = ImmutableMethod.of(sites.tap)
            val asks = sites.asks.map { ImmutableMethod.of(it.method) }
            val menuShow = ImmutableMethod.of(sites.menuShow)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { galleryCameraOnTapPatch.execute(context) })
            val name = build.name

            // checkCamera: a gate in front, and the opener in front of its one return.
            val checkMoved = assertKeepsStock("$name: checkCamera", check, sites.check, mapOf(0 to 3, sites.checkExit to 7))
            val checkAfter = sites.check.instructions()
            val checkReturn = checkMoved.getValue(sites.checkExit)
            assertGate("$name: checkCamera", sites.check, checkReturn)
            val opener = checkReturn - 7
            assertEquals("$name: opener", listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.NOP, Opcode.RETURN_VOID), checkAfter.subList(opener, checkReturn + 1).map { it.opcode })
            assertEquals("$name: opener reads the camera view", sites.cameraView, checkAfter[opener].field())
            assertEquals("$name: opener asks", "$GALLERY_CAMERA->openWhenReady(Ljava/lang/Object;Ljava/lang/Object;)Z", checkAfter[opener + 1].reference())
            assertEquals("$name: opener opens the camera", signature(sites.open), checkAfter[opener + 5].call()?.let(::signature))
            val checkFlow = ControlFlow.of(sites.check)
            val stockFlow = ControlFlow.of(check)
            assertEquals("$name: false returns as before", setOf(opener + 4, opener + 6), checkFlow.normal[opener + 3].toSet())
            val returns = stockFlow.normal.indices.filter { sites.checkExit in stockFlow.normal[it] }
            assertTrue("$name: checkCamera has stock paths to its return", returns.isNotEmpty())
            assertTrue("$name: every stock return runs the opener", returns.all { opener in checkFlow.normal[checkMoved.getValue(it)] })

            // showCamera: a gate in front that leaves through its one return.
            val showMoved = assertKeepsStock("$name: showCamera", show, sites.show, mapOf(0 to 3))
            assertGate("$name: showCamera", sites.show, showMoved.getValue(sites.showExit))

            // The camera tile: a sleeping gallery runs checkCamera(true) and returns, an awake one opens the view as before.
            assertKeepsStock("$name: camera tile", tap, sites.tap, mapOf(sites.tapIndex to 8))
            val tapAfter = sites.tap.instructions()
            val wake = sites.tapIndex
            assertEquals("$name: tile hook", listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID, Opcode.NOP), tapAfter.subList(wake, wake + 8).map { it.opcode })
            assertEquals("$name: tile reads the camera view", sites.cameraView, tapAfter[wake].field())
            assertEquals("$name: tile asks", "$GALLERY_CAMERA->wakeOnTap(Ljava/lang/Object;Ljava/lang/Object;)Z", tapAfter[wake + 1].reference())
            assertEquals("$name: tile starts the camera", signature(sites.check), tapAfter[wake + 5].call()?.let(::signature))
            assertEquals("$name: tile false opens as before", setOf(wake + 4, wake + 7), ControlFlow.of(sites.tap).normal[wake + 3].toSet())

            // The user's permission requests wake the gallery first, with the gallery they ask for:
            // the tile with the one its missing-permission read named, the camera button with the
            // one its lambda holds.
            assertEquals("$name: both permission requests", 2, sites.asks.size)
            assertEquals("$name: one tile request and one camera button", 1, sites.asks.count { it.load == null })
            for ((ask, original) in sites.asks.zip(asks)) {
                val size = if (ask.load == null) 1 else 2
                assertKeepsStock("$name: ${ask.method.name} request", original, ask.method, mapOf(ask.index to size))
                val body = ask.method.instructions()
                val call = body[ask.index + size - 1]
                assertEquals("$name: ${ask.method.name} wakes", "$GALLERY_CAMERA->wakeForPermission(Ljava/lang/Object;)V", call.reference())
                assertEquals("$name: ${ask.method.name} hands over its layout", ask.layout, (call as RegisterRangeInstruction).startRegister)
                if (ask.load == null) {
                    val read = original.instructions()[ask.index - 2]
                    assertEquals("$name: the tile's read of the missing flag", Opcode.IGET_BOOLEAN, read.opcode)
                    assertEquals("$name: the tile hands over the gallery it read", read.namedRegisters()[1], ask.layout)
                } else {
                    assertEquals("$name: the button reads its gallery", listOf(Opcode.IGET_OBJECT), listOf(body[ask.index].opcode))
                    assertEquals("$name: from its own gallery field", ask.load, body[ask.index].field())
                    assertEquals("$name: of this", listOf(ask.layout, ask.method.implementation!!.registerCount - 1 - original.parameterTypes.size),
                        body[ask.index].namedRegisters())
                    assertEquals("$name: the button's field is a gallery", PHOTO_LAYOUT, ask.load.type)
                }
                assertTrue("$name: ${ask.method.name} asks right after the wake",
                    body[ask.index + size].call()?.name == "requestPermissions" || ask.load == null &&
                        body.drop(ask.index + size).take(8).any { it.call()?.name == "requestPermissions" })
            }

            // Each open of the attach menu, on any tab, starts with its gallery asleep, before the dialog shows.
            val showAfter = sites.menuShow.instructions()
            assertEquals("$name: show reads its gallery", sites.menuGallery, showAfter[0].field())
            assertEquals("$name: from this", sites.menuShow.implementation!!.registerCount - 1, showAfter[0].namedRegisters()[1])
            assertEquals("$name: show puts the gallery to sleep", "$GALLERY_CAMERA->sleep(Ljava/lang/Object;)V", showAfter[1].reference())
            assertEquals("$name: sleep is handed the gallery", listOf(showAfter[0].namedRegisters()[0]), showAfter[1].namedRegisters())
            assertEquals("$name: show keeps its stock code", menuShow.instructions().map(::operation), showAfter.drop(2).map(::operation))
            assertEquals("$name: then shows the dialog", Opcode.INVOKE_SUPER, showAfter[2].opcode)
            // Nothing in the gallery puts it back to sleep, so a tap made while the menu opens holds.
            assertEquals("$name: the menu's show is the only sleep", emptyList<String>(), context.mutableClassDefBy(PHOTO_LAYOUT).methods
                .filter { method -> method.instructions().any { it.reference()?.contains("->sleep(") == true } }.map { it.name })

            assertEquals("$name: build fact", 1, statusFlag(context))
        }
    }

    @Test
    fun `checkCamera and showCamera are the only gallery code that starts the camera`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveGalleryCameraSites()
            val layout = context.mutableClassDefBy(PHOTO_LAYOUT).methods.toList()
            assertEquals("${build.name}: CameraController is started from checkCamera alone", listOf(sites.check.name), layout.filter { method ->
                method.instructions().any { it.call()?.let { call -> call.definingClass == CAMERA_CONTROLLER && call.name == "initCamera" } == true }
            }.map { it.name })
            assertEquals("${build.name}: the camera view is built in showCamera alone", listOf(sites.show.name), layout.filter { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == sites.cameraView.type } }.map { it.name })
            val builders = FixtureDex.methodsWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == sites.cameraView.type } }
            assertEquals("${build.name}: nothing outside the gallery builds its camera view", listOf("$PHOTO_LAYOUT->${sites.show.name}"),
                builders.map { "${it.definingClass}->${it.name}" })
        }
    }

    @Test
    fun `the attach menu keeps one gallery for every open`() {
        for (build in Fixtures.declaredBuilds()) {
            val sites = contextFor(build).resolveGalleryCameraSites()
            // The sleep is keyed by the gallery object, so the menu must hand show() the same one each time.
            val galleryBuilders = FixtureDex.methodsWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == PHOTO_LAYOUT } }
            assertEquals("${build.name}: only the menu's constructor builds a gallery", listOf("${sites.menuGallery.definingClass}-><init>"),
                galleryBuilders.map { "${it.definingClass}->${it.name}" })
            val writers = FixtureDex.methodsWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.IPUT_OBJECT && it.field() == sites.menuGallery } }
            assertEquals("${build.name}: only the menu's constructor sets its gallery", listOf("${sites.menuGallery.definingClass}-><init>"),
                writers.map { "${it.definingClass}->${it.name}" })
        }
    }

    @Test
    fun `changed gallery geometry refuses every site before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (GalleryCameraSites) -> Unit>> = listOf(
                "showCamera call moved" to { sites -> sites.check.replaceInstruction(sites.checkExit - 1, "nop") },
                "tile tap changed" to { sites -> sites.tap.replaceInstruction(sites.tapIndex + 2, "nop") },
                "tile request unguarded" to { sites ->
                    val ask = sites.asks.single { it.load == null }
                    ask.method.replaceInstruction(ask.index - 1, "nop")
                },
                "camera button no longer leads to the tap" to { sites ->
                    val ask = sites.asks.single { it.load != null }
                    val tap = ask.method.instructions().indexOfFirst { it.call()?.name == sites.tap.name }
                    ask.method.replaceInstruction(tap, "nop")
                },
                "menu show no longer shows first" to { sites -> sites.menuShow.addInstructions(0, "invoke-static {}, Ljava/lang/System;->gc()V") },
            )
            val menu = menuType(build)
            for ((case, change) in changes) {
                val context = contextFor(build)
                change(context.resolveGalleryCameraSites())
                assertRefusedUntouched(build.name, case, context, menu)
            }
            assertRefusedUntouched(build.name, "no runtime", contextFor(build, runtime = false), menu)
        }
    }

    private fun assertRefusedUntouched(build: String, case: String, context: BytecodePatchContext, menu: String) {
        val owners = listOf(PHOTO_LAYOUT, menu) + requesters.getValue(build)
        val before = owners.associateWith { type -> context.mutableClassDefBy(type).methods.associate { signature(it) to it.instructions().map(::operation) } }
        try {
            galleryCameraOnTapPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue("$build: $case: ${expected.message}", expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$build: $case doesn't partly mutate the gallery or the menu", before,
            owners.associateWith { type -> context.mutableClassDefBy(type).methods.associate { signature(it) to it.instructions().map(::operation) } })
        assertEquals("$build: $case leaves the build fact false", 0, statusFlag(context))
    }

    /** A three-instruction gate at 0 that leaves through [exit] when the gallery sleeps and runs the method otherwise. */
    private fun assertGate(what: String, method: Method, exit: Int) {
        val body = method.instructions()
        assertEquals("$what gate", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), body.take(3).map { it.opcode })
        assertEquals("$what gate asks", "$GALLERY_CAMERA->keepCameraOff(Ljava/lang/Object;)Z", body[0].reference())
        assertEquals("$what gate is handed this", method.implementation!!.registerCount - 1 - method.parameterTypes.size,
            (body[0] as FiveRegisterInstruction).registerC)
        assertEquals("$what sleeping leaves at once", Opcode.RETURN_VOID, body[exit].opcode)
        assertEquals("$what gate branches", setOf(3, exit), ControlFlow.of(method).normal[2].toSet())
    }

    /**
     * The edited method holds the stock one's operations in order, outside the hooks inserted at
     * [inserts] (stock index to hook length) and the switch tables' padding, and every stock jump
     * still goes where it went, a jump to a hooked instruction now landing on its hook. Returns
     * where each stock index moved.
     */
    private fun assertKeepsStock(what: String, original: Method, after: Method, inserts: Map<Int, Int>): Map<Int, Int> {
        val old = original.instructions()
        val now = after.instructions()
        val hooks = inserts.map { (at, size) -> (at + inserts.filterKeys { it < at }.values.sum()).let { it until it + size } }
        val kept = old.indices.filterNot { old.isPadding(it) }
        val moved = now.indices.filterNot { at -> now.isPadding(at) || hooks.any { at in it } }
        assertEquals("$what keeps every original operation", kept.map { operation(old[it]) }, moved.map { operation(now[it]) })
        val to = kept.zip(moved).toMap()
        val landing = inserts.mapValues { (at, size) -> to.getValue(at) - size }
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(after)
        for (index in kept) {
            assertEquals("$what keeps stock flow from $index", oldFlow.normal[index].map { landing[it] ?: to.getValue(it) },
                newFlow.normal[to.getValue(index)])
        }
        return to
    }

    private val requesters = mutableMapOf<String, Set<String>>()

    private fun contextFor(build: java.io.File, runtime: Boolean = true): BytecodePatchContext {
        val layout = FixtureDex.classes(build, setOf(PHOTO_LAYOUT)).values.single()
        val fieldTypes = layout.fields.map { it.type }.filter { it.startsWith("L") && it != PHOTO_LAYOUT }.toSet() + menuType(build) +
            requesters.getOrPut(build.name) { requesterTypes(build) }
        val extension = ExtensionDex.classes().filter { runtime || it.type != GALLERY_CAMERA }
        return PatchContexts.of(extension + layout + FixtureDex.classes(build, fieldTypes).values)
    }

    /**
     * The classes outside the gallery that ask for a permission with the gallery in hand: R8 merges
     * the gallery's click lambdas, the camera tile's and the camera button's requests among them,
     * into classes they share with other code.
     */
    private fun requesterTypes(build: java.io.File) = FixtureDex.classesWhere(build, { true }) { method ->
        method.instructions().any { it.call()?.name == "requestPermissions" } &&
            method.instructions().any { it.reference()?.contains(PHOTO_LAYOUT) == true } }
        .map { it.type }.filter { it != PHOTO_LAYOUT }.toSet()

    /** The attach menu: the one class whose constructor builds the gallery. */
    private fun menuType(build: java.io.File) = FixtureDex.classesWhere(build, { true }) { method -> method.name == "<init>" &&
        method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == PHOTO_LAYOUT } }.single().type

    private fun statusFlag(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "galleryCameraOnTap" }.instructions()[0] as NarrowLiteralInstruction).narrowLiteral

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun List<Instruction>.isPadding(index: Int) = this[index].opcode == Opcode.NOP && getOrNull(index + 1)?.opcode in
        setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
    private fun signature(method: MethodReference) = "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"

    private companion object {
        const val CAMERA_CONTROLLER = "Lorg/telegram/messenger/camera/CameraController;"
    }
}
