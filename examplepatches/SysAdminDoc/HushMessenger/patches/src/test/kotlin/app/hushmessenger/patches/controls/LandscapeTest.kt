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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val HELPER = "LX/090;"
private const val VIEWER_HELPER = "LX/7aM;"
internal const val SYNTHETIC_PORTRAIT_LOCK = "$HELPER->A0K()Z"
internal const val SYNTHETIC_MEDIA_ORIENTATION = "$VIEWER_HELPER->A00(${VIEWER_HELPER}I)V"
private const val ACTIVITY_FIELD = "$HELPER->A01:$FB_FRAGMENT_ACTIVITY"
private const val CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

/** The lock check as 586 writes it: the server flag first, then the screen's own opt-in, answered with a plain return. */
private fun lockBody(flag: Long = LANDSCAPE_FLAG, field: String = ACTIVITY_FIELD, optIn: String = "$FB_FRAGMENT_ACTIVITY->A3C()Z", owner: String = "p0") = """
    invoke-static {}, LX/2wr;->A07()LX/5dt;
    move-result-object v2
    const-wide v0, ${flag}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CONFIG->B1R(J)Z
    move-result v0
    if-eqz v0, :no
    iget-object v0, $owner, $field
    invoke-virtual {v0}, $optIn
    move-result v0
    if-eqz v0, :no
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
""".trimIndent()

private fun lockCheck(body: String = lockBody(), registers: Int = 4, id: String = SYNTHETIC_PORTRAIT_LOCK,
    flags: Int = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value) = fixtureMethod(id, body, registers, flags)

/** The viewers' call as 586 writes it: through Messenger's activity helper when it has one, else on its own. */
private fun viewerBody(handOff: String = "invoke-virtual {v1, p1}, $HELPER->A0h(I)V", typeCheck: String = FB_FRAGMENT_ACTIVITY) = """
    iget-boolean v0, p0, $VIEWER_HELPER->A04:Z
    if-eqz v0, :done
    iget-object v1, p0, $VIEWER_HELPER->A00:Landroid/app/Activity;
    if-eqz v1, :plain
    instance-of v0, v1, $typeCheck
    if-eqz v0, :plain
    check-cast v1, $FB_FRAGMENT_ACTIVITY
    invoke-virtual {v1}, $FB_FRAGMENT_ACTIVITY->A2k()$HELPER
    move-result-object v1
    $handOff
    :done
    return-void
    :plain
    invoke-virtual {p0, p1}, $VIEWER_HELPER->A04(I)V
    return-void
""".trimIndent()

private fun viewerCall(body: String = viewerBody(), registers: Int = 4, id: String = SYNTHETIC_MEDIA_ORIENTATION,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) = fixtureMethod(id, body, registers, flags)

private fun viewerOption(type: String = VIEWER_HELPER) = fixtureMethod("$type-><init>(Landroid/content/Context;)V",
    "const-string v0, \"$MEDIA_ORIENTATION_OPTION\"\nreturn-void", 3, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)

private fun helperClass(vararg methods: Method): MutableClass = fixtureClass(HELPER, methods.toList())
private fun viewerClass(vararg methods: Method, type: String = VIEWER_HELPER): MutableClass = fixtureClass(type, methods.toList())

/** Messenger's activity helper with its lock check, and the viewers' orientation helper. */
internal fun landscapeFixture(lock: Method = lockCheck(), viewer: Method = viewerCall()): List<MutableClass> =
    listOf(helperClass(lock), viewerClass(viewerOption(), viewer))

private fun Method.code() = implementation!!.instructions.toList()

/** The same code with another register count, for counts the fixture's own registers can't be written in. */
private fun Method.withRegisters(count: Int): MutableMethod = MutableMethod(ImmutableMethod(definingClass, name, parameters, returnType,
    accessFlags, annotations, hiddenApiRestrictions, ImmutableMethodImplementation(count, implementation!!.instructions, implementation!!.tryBlocks, null)))

class LandscapeTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>, key: String) = mirroredControls(classes).getValue(key).map { it.hookId() }.toSet()

    @Test fun theLockCheckAndTheViewersCallAreFound() {
        val classes = landscapeFixture()
        assertEquals(setOf(SYNTHETIC_PORTRAIT_LOCK), found(classes, LANDSCAPE_LOCK))
        assertEquals(setOf(SYNTHETIC_MEDIA_ORIENTATION), found(classes, LANDSCAPE_MEDIA))
        validateControls(mirroredControls(classes), setOf(LANDSCAPE_LOCK, LANDSCAPE_MEDIA))
    }

    @Test fun theMappingHooksBothMethods() {
        assertEquals(setOf(LANDSCAPE_LOCK, LANDSCAPE_MEDIA), controlHooks.getValue(LANDSCAPE))
        assertEquals(setOf(SYNTHETIC_PORTRAIT_LOCK), SYNTHETIC_PROFILE.hooks.getValue(LANDSCAPE_LOCK))
        assertEquals(setOf(SYNTHETIC_MEDIA_ORIENTATION), SYNTHETIC_PROFILE.hooks.getValue(LANDSCAPE_MEDIA))
        assertEquals(setOf("LX/090;->A0K()Z"), BASE_PROFILE.hooks.getValue(LANDSCAPE_LOCK))
        assertEquals(setOf("LX/7aM;->A00(LX/7aM;I)V"), BASE_PROFILE.hooks.getValue(LANDSCAPE_MEDIA))
    }

    // The lock's answer is changed at each return, so a check that reads something else, or one whose returns or
    // registers don't have the tested shape, could be answering another question. None of them gets a hook.
    @Test fun anyOtherLockShapeLeavesTheControlUnapplied() {
        val jumpToReturn = lockBody().replace("const/4 v0, 0x1\nreturn v0", "if-nez v0, :yes\nconst/4 v0, 0x1\n:yes\nreturn v0")
        assertTrue(":yes" in jumpToReturn)
        val cases = mapOf(
            "another flag" to landscapeFixture(lockCheck(lockBody(flag = 0x8105f000002c02L))),
            "no opt-in call" to landscapeFixture(lockCheck(lockBody(optIn = "$FB_FRAGMENT_ACTIVITY->A3D()I"))),
            "an activity field of another class" to landscapeFixture(lockCheck(lockBody(field = "LX/091;->A01:$FB_FRAGMENT_ACTIVITY"))),
            "the field read off another object" to landscapeFixture(lockCheck("move-object/from16 v1, p0\n" + lockBody(owner = "v1"))),
            "this overwritten" to landscapeFixture(lockCheck("const/4 v3, 0x0\n" + lockBody())),
            "a branch onto a return" to landscapeFixture(lockCheck(jumpToReturn)),
            "only one local" to landscapeFixture(lockCheck().withRegisters(2)),
            "no local at all" to landscapeFixture(lockCheck().starved()),
            "more than sixteen registers" to landscapeFixture(lockCheck().withRegisters(17)),
            "a static check" to landscapeFixture(lockCheck(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "two lock checks" to landscapeFixture() + fixtureClass("LX/091;", listOf(lockCheck(lockBody(field = "LX/091;->A01:$FB_FRAGMENT_ACTIVITY"), id = "LX/091;->A0K()Z"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, LANDSCAPE_LOCK).isEmpty(), case)
            assertEquals(setOf(SYNTHETIC_MEDIA_ORIENTATION), found(classes, LANDSCAPE_MEDIA), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(LANDSCAPE_LOCK, LANDSCAPE_MEDIA)) }
        }
    }

    @Test fun anyOtherViewerShapeLeavesTheControlUnapplied() {
        val cases = mapOf(
            "no class names the option" to listOf(helperClass(lockCheck()), viewerClass(viewerCall())),
            "two classes name the option" to landscapeFixture() + viewerClass(viewerOption("LX/7aN;"), type = "LX/7aN;"),
            "an orientation it didn't get" to landscapeFixture(viewer = viewerCall(viewerBody(handOff = "const/4 v0, 0x1\n    invoke-virtual {v1, v0}, $HELPER->A0h(I)V"))),
            "no activity check" to landscapeFixture(viewer = viewerCall(viewerBody(typeCheck = "Landroid/app/Activity;"))),
            "an instance method" to landscapeFixture(viewer = viewerCall(id = "$VIEWER_HELPER->A00(I)V", flags = AccessFlags.PUBLIC.value)),
            "more than sixteen registers" to landscapeFixture(viewer = viewerCall().withRegisters(17)),
            "two viewer calls" to listOf(helperClass(lockCheck()), viewerClass(viewerOption(), viewerCall(), viewerCall(id = "$VIEWER_HELPER->A01(${VIEWER_HELPER}I)V"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, LANDSCAPE_MEDIA).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(LANDSCAPE_LOCK, LANDSCAPE_MEDIA)) }
        }
    }

    @Test fun eachLockAnswerPassesThroughTheExtensionWithItsScreen() {
        val method = lockCheck()
        val before = method.code()
        injectControl(LANDSCAPE, mapOf(LANDSCAPE_LOCK to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 6, code.size)
        val returns = code.indices.filter { code[it].opcode == Opcode.RETURN }
        assertEquals(2, returns.size)
        for (at in returns) {
            val read = code[at - 3] as TwoRegisterInstruction
            assertEquals(Opcode.IGET_OBJECT, code[at - 3].opcode)
            assertEquals(ACTIVITY_FIELD, (code[at - 3] as ReferenceInstruction).reference.toString())
            assertEquals(1, read.registerA)
            assertEquals(3, read.registerB)
            val call = code[at - 2] as FiveRegisterInstruction
            assertEquals(PORTRAIT_LOCK_HELPER, (call as ReferenceInstruction).reference.toString())
            assertEquals(listOf(0, 1), listOf(call.registerC, call.registerD).take(call.registerCount))
            assertEquals(Opcode.MOVE_RESULT, code[at - 1].opcode)
            assertEquals(0, (code[at - 1] as OneRegisterInstruction).registerA)
            assertEquals(0, (code[at] as OneRegisterInstruction).registerA)
        }
        // Messenger's own check runs as it was written, and both of its branches still land on the stock no.
        val stock = code.filterIndexed { i, _ -> returns.none { i in it - 3 until it } }
        assertEquals(before.map { it.opcode }, stock.map { it.opcode })
        val branches = code.indices.filter { code[it].opcode == Opcode.IF_EQZ }
        assertEquals(2, branches.size)
        for (branch in branches) assertEquals(returns[0] + 1, code.branchTarget(branch))
    }

    @Test fun theScratchRegisterNeverTakesTheAnswer() {
        val method = lockCheck("""
            const-wide v2, ${LANDSCAPE_FLAG}L
            iget-object v0, p0, $ACTIVITY_FIELD
            invoke-virtual {v0}, $FB_FRAGMENT_ACTIVITY->A3C()Z
            move-result v1
            return v1
        """.trimIndent(), registers = 5)
        injectControl(LANDSCAPE, mapOf(LANDSCAPE_LOCK to listOf(method)))
        val code = method.code()
        val at = code.indexOfFirst { it.opcode == Opcode.RETURN }
        assertEquals(1, (code[at] as OneRegisterInstruction).registerA)
        assertEquals(0, (code[at - 3] as TwoRegisterInstruction).registerA)
        assertEquals(4, (code[at - 3] as TwoRegisterInstruction).registerB)
        val call = code[at - 2] as FiveRegisterInstruction
        assertEquals(listOf(1, 0), listOf(call.registerC, call.registerD))
    }

    @Test fun theViewersOrientationPassesThroughTheExtensionFirst() {
        val method = viewerCall()
        val before = method.code()
        injectControl(LANDSCAPE, mapOf(LANDSCAPE_MEDIA to listOf(method)))
        val code = method.code()
        val call = code[0] as FiveRegisterInstruction
        assertEquals(MEDIA_ORIENTATION_HELPER, (call as ReferenceInstruction).reference.toString())
        assertEquals(1, call.registerCount)
        assertEquals(3, call.registerC)
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(3, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(before.map { it.opcode }, code.drop(2).map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a lock check with one local" to (lockCheck().withRegisters(2) to viewerCall()),
            "a lock check that overwrites this" to (lockCheck("const/4 v3, 0x0\n" + lockBody()) to viewerCall()),
            "a viewer call with too many registers" to (lockCheck() to viewerCall().withRegisters(17)),
            "a viewer call that loses the orientation" to (lockCheck() to viewerCall(viewerBody(handOff = "const/4 v0, 0x1\n    invoke-virtual {v1, v0}, $HELPER->A0h(I)V"))),
        )
        for ((case, pair) in cases) {
            val (lock, viewer) = pair
            val lockBefore = lock.code()
            val viewerBefore = viewer.code()
            assertFailsWith<PatchException>(case) {
                injectControl(LANDSCAPE, mapOf(LANDSCAPE_LOCK to listOf(lock), LANDSCAPE_MEDIA to listOf(viewer)))
            }
            assertEquals(lockBefore, lock.code(), case)
            assertEquals(viewerBefore, viewer.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksTheLockAndTheViewers() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val lock = findPortraitLock(classes)
            val viewer = findMediaOrientation(classes)
            assertEquals(activeProfile.hooks.getValue(LANDSCAPE_LOCK), lock.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(LANDSCAPE_MEDIA), viewer.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(LANDSCAPE_LOCK to lock, LANDSCAPE_MEDIA to viewer), setOf(LANDSCAPE_LOCK, LANDSCAPE_MEDIA))
            // Only the photo and video viewers put the lock back through this call, so nothing else turns with it.
            val viewerId = viewer.single().hookId()
            val callers = classes.flatMap { cls -> cls.methods.filter { method ->
                method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() == viewerId } == true
            }.map { cls.type } }.toSet()
            assertTrue(callers.isNotEmpty() && callers.all { it.startsWith("Lcom/facebook/messaging/media/viewer/") }, "$code: $callers")
            // The lock check is the helper's own, asked from inside the helper alone.
            val lockId = lock.single().hookId()
            assertTrue(AccessFlags.PRIVATE.isSet(lock.single().accessFlags), code)
            val lockCallers = classes.filter { cls -> cls.methods.any { method ->
                method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() == lockId } == true
            } }.map { it.type }.toSet()
            assertEquals(setOf(lock.single().definingClass), lockCallers, code)
            val lockMethod = MutableMethod(lock.single())
            val lockBefore = lockMethod.code()
            val returns = lockMethod.portraitLock().returns.size
            injectControl(LANDSCAPE, mapOf(LANDSCAPE_LOCK to listOf(lockMethod)))
            assertEquals(lockBefore.size + 3 * returns, lockMethod.code().size, code)
            assertEquals(returns, lockMethod.code().count { (it as? ReferenceInstruction)?.reference?.toString() == PORTRAIT_LOCK_HELPER }, code)
            val viewerMethod = MutableMethod(viewer.single())
            injectControl(LANDSCAPE, mapOf(LANDSCAPE_MEDIA to listOf(viewerMethod)))
            assertEquals(MEDIA_ORIENTATION_HELPER, (viewerMethod.code()[0] as ReferenceInstruction).reference.toString(), code)
        }
    }
}
