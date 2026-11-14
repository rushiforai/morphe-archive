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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
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

/** The capture callback under its 354 name, which the synthetic profile keeps. */
internal const val SYNTHETIC_INSTANT_CAPTURE = "LX/VKB;->EKR(LX/2rP;)V"

private const val CAPTURE_OWNER = "LX/VKB;"
private const val CAPTURE_RESULT = "LX/2rP;"
private const val ARMV7_RESULT = "LX/2rp;"
private const val SEND_OWNER = "LX/Tk7;"
private const val SEND_ID = "LX/TkV;"
private const val CROP_SPEC = "LX/Tj3;"
private const val BITMAP = "Landroid/graphics/Bitmap;"
private const val FRAME_GETTER = "LX/T5d;->A0S($CAPTURE_RESULT)$BITMAP"
private const val ARMV7_GETTER = "$ARMV7_RESULT->A09()Ljava/lang/Object;"
private const val CAPTURE_CALL = "Lapp/hushmessenger/extension/InstantGallery;->capture(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)I"
private const val FRAME_CALL = "Lapp/hushmessenger/extension/InstantGallery;->frame($BITMAP)$BITMAP"

private fun staticRead(register: Int) = "invoke-static {p1}, $FRAME_GETTER\nmove-result-object v$register"
private fun armv7Read(register: Int) = "invoke-virtual {p1}, $ARMV7_GETTER\nmove-result-object v$register\ncheck-cast v$register, $BITMAP"

/**
 * EKR cut down from 354 (12 registers, so p0 is v10 and p1 v11): the send owner admits the capture or it returns, then
 * inside one try the photo is read and cropped, read again and recycled, and the recipe goes out. The try's handlers
 * log "photo_copy" on an OutOfMemoryError and drop the capture on any other Exception.
 */
private fun captureBody(read: (Int) -> String = ::staticRead) = """
    const/4 v9, 0x0
    iget-object v8, p0, $CAPTURE_OWNER->A03:$SEND_OWNER
    iget-object v7, p0, $CAPTURE_OWNER->A02:$SEND_ID
    invoke-virtual {v8, v7}, $SEND_OWNER->A0T($SEND_ID)Z
    move-result v0
    if-eqz v0, :done
    FIRST_READ
    iget-object v1, p0, $CAPTURE_OWNER->A01:$CROP_SPEC
    invoke-static {v5, v1}, $CAPTURE_OWNER->A00($BITMAP$CROP_SPEC)$BITMAP
    move-result-object v1
    SECOND_READ
    invoke-virtual {v0}, $BITMAP->recycle()V
    const-string v4, ""
    new-instance v0, $INSTANT_CAPTURE_RECIPE
    invoke-direct {v0, v4}, $INSTANT_CAPTURE_RECIPE-><init>(Ljava/lang/String;)V
    iput-object v0, p0, $CAPTURE_OWNER->A04:$INSTANT_CAPTURE_RECIPE
    return-void
    move-exception v1
    const-string v0, "$INSTANT_PHOTO_COPY"
    invoke-static {v8, v0, v1}, $SEND_OWNER->A0J(${SEND_OWNER}Ljava/lang/String;Ljava/lang/Throwable;)V
    invoke-virtual {v8, v7}, $SEND_OWNER->A0P($SEND_ID)V
    return-void
    invoke-virtual {v8, v7}, $SEND_OWNER->A0P($SEND_ID)V
    return-void
    :done
    return-void
""".trimIndent().replace("FIRST_READ", read(5)).replace("SECOND_READ", read(0))

/** The smallest callback the patch can take: the read, the recipe and the log, with locals v0 and v1 only. */
private val COMPACT_BODY = """
    ONLY_READ
    invoke-virtual {v1}, $BITMAP->recycle()V
    const-string v1, ""
    new-instance v0, $INSTANT_CAPTURE_RECIPE
    invoke-direct {v0, v1}, $INSTANT_CAPTURE_RECIPE-><init>(Ljava/lang/String;)V
    return-void
    move-exception v1
    const-string v0, "$INSTANT_PHOTO_COPY"
    return-void
    return-void
""".trimIndent().replace("ONLY_READ", staticRead(1))

private fun Instruction.isRead() = (this as? ReferenceInstruction)?.reference?.toString() in setOf(FRAME_GETTER, ARMV7_GETTER)

/**
 * The callback built from [body], with one try from a photo read ([from] picks which, the first by default) up to the
 * first return after it. Its handlers take an OutOfMemoryError at the move-exception and then [caught] right after
 * that handler's return, the way 587 lays EKR out.
 */
private fun capture(
    body: String = captureBody(),
    id: String = SYNTHETIC_INSTANT_CAPTURE,
    registers: Int = 12,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    caught: String? = "Ljava/lang/Exception;",
    from: Int = 0,
): MutableMethod {
    val plain = fixtureMethod(id, body, registers, flags)
    val code = plain.implementation!!.instructions.toList()
    val address = IntArray(code.size + 1).also { for (i in code.indices) it[i + 1] = it[i] + code[i].codeUnits }
    val start = code.indices.filter { code[it].isRead() }.getOrElse(from) { 0 }
    val until = (start until code.size).first { code[it].opcode == Opcode.RETURN_VOID }
    val oom = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
    val failed = (oom until code.size).first { code[it].opcode == Opcode.RETURN_VOID } + 1
    val handlers = listOf(ImmutableExceptionHandler("Ljava/lang/OutOfMemoryError;", address[oom]), ImmutableExceptionHandler(caught, address[failed]))
    return MutableMethod(ImmutableMethod(plain.definingClass, plain.name, plain.parameters, plain.returnType, plain.accessFlags, null, null,
        ImmutableMethodImplementation(registers, code, listOf(ImmutableTryBlock(address[start], address[until] - address[start], handlers)), null)))
}

private fun fixture(method: MutableMethod = capture()): List<MutableClass> = listOf(fixtureClass(method.definingClass, listOf(method)))

/** The capture handler on its own, for the complete discovery fixture. */
internal fun instantGalleryFixture(): List<MutableClass> = fixture()

private fun Method.code() = implementation!!.instructions.toList()

/** Whether the instruction at [index] sits in a try one of whose handlers takes an Exception. */
private fun Method.caughtAt(index: Int): Boolean {
    val address = code().take(index).sumOf { it.codeUnits }
    return implementation!!.tryBlocks.any { block ->
        address >= block.startCodeAddress && address < block.startCodeAddress + block.codeUnitCount &&
            block.exceptionHandlers.any { it.exceptionType == null || it.exceptionType == "Ljava/lang/Exception;" }
    }
}

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class InstantGalleryTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(INSTANT_GALLERY)

    @Test fun findsTheCaptureCallback() {
        assertEquals(listOf(SYNTHETIC_INSTANT_CAPTURE), found(fixture()).map { it.hookId() })
        validateControls(mirroredControls(fixture()), setOf(INSTANT_GALLERY))
        assertEquals(setOf(SYNTHETIC_INSTANT_CAPTURE), SYNTHETIC_PROFILE.hooks.getValue(INSTANT_GALLERY))
        assertEquals(setOf("LX/VKB;->EKR(LX/2rP;)V"), BASE_PROFILE.hooks.getValue(INSTANT_GALLERY))
        assertEquals(listOf(InstantFrameRead(8, 5), InstantFrameRead(13, 0)), capture().validateInstantGallery())
    }

    // armv7 reads the photo through the result's own getter and a cast.
    @Test fun findsTheArmv7Reads() {
        val method = capture(captureBody(::armv7Read).replace(CAPTURE_RESULT, ARMV7_RESULT), "LX/MNd;->EKq($ARMV7_RESULT)V")
        assertEquals(listOf("LX/MNd;->EKq($ARMV7_RESULT)V"), found(fixture(method)).map { it.hookId() })
        assertEquals(listOf(InstantFrameRead(9, 5), InstantFrameRead(15, 0)), method.validateInstantGallery())
    }

    // Three locals are enough for the entry check, even when the callback itself uses two.
    @Test fun aCompactCallbackWithThreeLocalsIsTaken() {
        val method = capture(COMPACT_BODY, registers = 5)
        assertEquals(listOf(SYNTHETIC_INSTANT_CAPTURE), found(fixture(method)).map { it.hookId() })
        assertEquals(listOf(InstantFrameRead(2, 1)), method.validateInstantGallery())
    }

    @Test fun lookalikesAreNotFound() {
        val cases = mapOf(
            "no photo_copy log" to capture(captureBody().replace("\"$INSTANT_PHOTO_COPY\"", "\"photo_paste\"")),
            "no capture recipe" to capture(captureBody().replace(INSTANT_CAPTURE_RECIPE, "LX/Zq1;")),
            "a static method" to capture(captureBody().replace("{p1}", "{p0}"), flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "two parameters" to capture(id = "$CAPTURE_OWNER->EKR(${CAPTURE_RESULT}I)V", registers = 13),
            "a result that isn't an object" to capture(id = "$CAPTURE_OWNER->EKR(I)V"),
            "a value returned" to capture(id = "$CAPTURE_OWNER->EKR($CAPTURE_RESULT)Z"),
        )
        for ((case, method) in cases) {
            assertTrue(found(fixture(method)).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(fixture(method)), setOf(INSTANT_GALLERY)) }
        }
    }

    // A callback whose reads can't all be swapped and dropped through Messenger's own handler gets no hook, and
    // CompatReport refuses the build the same way (found() checks the two agree).
    @Test fun aCallbackOfAnotherShapeIsRefused() {
        val cases = mapOf(
            "the first read outside the try" to capture(from = 1),
            "a handler for less than Exception" to capture(caught = "Ljava/lang/IllegalArgumentException;"),
            "no photo read" to capture(captureBody().replace("invoke-static {p1}, $FRAME_GETTER", "invoke-static {p0}, LX/T5d;->A0S($CAPTURE_OWNER)$BITMAP")),
            "five photo reads" to capture(captureBody().replace("invoke-virtual {v0}, $BITMAP->recycle()V",
                listOf(2, 3, 4).joinToString("\n") { staticRead(it) } + "\ninvoke-virtual {v0}, $BITMAP->recycle()V")),
            "a branch to the start" to capture(":start\n" + captureBody().replace(":done\nreturn-void", ":done\ngoto :start")),
            "a branch onto a read's end" to capture(captureBody().replace("if-eqz v0, :done", "if-nez v9, :cropped\nif-eqz v0, :done")
                .replace("iget-object v1, p0, $CAPTURE_OWNER->A01", ":cropped\niget-object v1, p0, $CAPTURE_OWNER->A01")),
            "two locals" to capture(COMPACT_BODY, registers = 4),
        )
        for ((case, method) in cases) {
            assertEquals(listOf(SYNTHETIC_INSTANT_CAPTURE), found(fixture(method)).map { it.hookId() }, case)
            assertFailsWith<PatchException>(case) { method.validateInstantGallery() }
        }
    }

    @Test fun theCaptureAsksFirstAndEachReadGoesThroughTheExtension() {
        val method = capture()
        val before = method.code()
        injectControl(INSTANT_GALLERY, mapOf(INSTANT_GALLERY to listOf(method)))
        val code = method.code()
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
            Opcode.IF_EQZ, Opcode.RETURN_VOID), code.take(7).map { it.opcode })
        assertEquals(listOf(0 to 10, 1 to 11), code.take(2).map { (it as TwoRegisterInstruction).registerA to it.registerB })
        assertEquals("EKR", ((code[2] as ReferenceInstruction).reference as StringReference).string)
        assertEquals(CAPTURE_CALL, code[3].reference())
        // Off, Pause and safe mode fall through to the stock first instruction.
        assertEquals(7, code.branchTarget(5))
        // Each read hands its photo to the extension, in the read's own register, before anything uses it.
        for ((at, register) in listOf(8 + 7 to 5, 13 + 9 to 0)) {
            val call = code[at] as RegisterRangeInstruction
            assertEquals(FRAME_CALL, code[at].reference())
            assertEquals(register to 1, call.startRegister to call.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at + 1].opcode)
            assertEquals(register, (code[at + 1] as OneRegisterInstruction).registerA)
            // A back-out throws from here into Messenger's own drop of the capture.
            assertTrue(method.caughtAt(at), "frame call at $at")
        }
        assertEquals(before.map { it.opcode }, (code.drop(7).take(8) + code.drop(17).take(5) + code.drop(24)).map { it.opcode })
    }

    @Test fun aRefusedCallbackIsLeftAsItWas() {
        val bad = capture(from = 1)
        val before = bad.code()
        assertFailsWith<PatchException> { injectControl(INSTANT_GALLERY, mapOf(INSTANT_GALLERY to listOf(bad))) }
        assertEquals(before, bad.code())
    }

    @Test fun everySupportedBuildSwapsEachPhotoRead() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findInstantGallery(classes)
            assertEquals(activeProfile.hooks.getValue(INSTANT_GALLERY), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(INSTANT_GALLERY to hooks), setOf(INSTANT_GALLERY))
            val method = MutableMethod(hooks.single())
            val before = method.code()
            val reads = method.validateInstantGallery()
            assertEquals(3, reads.size, code)
            method.injectInstantGallery()
            val after = method.code()
            assertEquals(CAPTURE_CALL, after[3].reference(), code)
            val frames = after.indices.filter { after[it].reference() == FRAME_CALL }
            assertEquals(reads.map { it.register }, frames.map { (after[it] as RegisterRangeInstruction).startRegister }, code)
            assertTrue(frames.all { method.caughtAt(it) }, code)
            val stock = after.drop(7).filterIndexed { i, _ -> (i + 7) !in frames.flatMap { listOf(it, it + 1) } }
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP }, stock.map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
