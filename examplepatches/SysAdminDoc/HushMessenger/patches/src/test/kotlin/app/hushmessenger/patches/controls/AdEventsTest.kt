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
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val S = "Ljava/lang/String;"
internal const val SYNTHETIC_AD_ENTRY = "LX/6J3;->A00(LX/6Bz;$FB_USER_SESSION$S$S$S$S)V"
internal const val SYNTHETIC_INBOX_VISIBILITY = "LX/24f;->Df7(LX/0Co;Z)V"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The entry event cut down to the two IDs it fills in. */
private val ENTRY_BODY = """
    const-string v0, "ad_id"
    const-string v0, "page_id"
    return-void
""".trimIndent()

/**
 * The tracker callback as Messenger ships it, with its loops cut to one: the visibility update's loop exits onto the
 * event's name, the event is built and logged, then the ReqContext opened at the top is closed. Its two handlers are
 * Kotlin's use block, the first rethrowing whatever the body throws and the second closing the context on the way out.
 */
private val VISIBILITY_BODY = """
    const/4 v6, 0x0
    const-string v0, "$INBOX_IMPRESSION_TRACKER"
    invoke-static {v0, v6}, LX/02n;->A04(${S}I)Lcom/facebook/fury/context/ReqContext;
    move-result-object v3
    :rows
    if-eqz v13, :rows_done
    iput-boolean v13, v11, LX/24f;->A00:Z
    goto :rows
    :rows_done
    const-string v0, "$INBOX_VISIBILITY_EVENT"
    new-instance v2, LX/2Kb;
    invoke-direct {v2, v0}, LX/2Kb;-><init>($S)V
    const-string v1, "pigeon_reserved_keyword_module"
    const-string v0, "messenger_inbox_ads"
    invoke-virtual {v2, v1, v0}, LX/2Kb;->A0E($S$S)V
    invoke-virtual {v11}, LX/24f;->A02()I
    move-result v0
    iget-object v0, v11, LX/24f;->A03:LX/5vW;
    invoke-virtual {v0, v2}, LX/5vW;->A03(LX/2Kb;)V
    if-eqz v3, :closed
    invoke-interface {v3}, $REQ_CONTEXT_CLOSE
    :closed
    return-void
    move-exception v1
    throw v1
    move-exception v0
    invoke-static {v3, v1}, LX/36T;->A00(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    throw v0
""".trimIndent()

private fun entry(id: String = SYNTHETIC_AD_ENTRY, body: String = ENTRY_BODY, registers: Int = 11, flags: Int = STATIC) =
    fixtureMethod(id, body, registers, flags)

/**
 * As in Messenger, the body's try runs from just after the context opens up to its close, and the closing handler
 * covers only the rethrow. [closeCovered] stretches the closing handler over the close, where it would read registers
 * the skip leaves in another type.
 */
private fun visibility(
    id: String = SYNTHETIC_INBOX_VISIBILITY,
    body: String = VISIBILITY_BODY,
    flags: Int = AccessFlags.PUBLIC.value,
    closeCovered: Boolean = false,
) = fixtureMethod(id, body, registers = 14, flags = flags).apply {
    val code = implementation!!.instructions.toList()
    val opened = code.indexOfFirst { it.opcode == Opcode.MOVE_RESULT_OBJECT }
    val close = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == REQ_CONTEXT_CLOSE }
    val (rethrow, finally) = code.indices.filter { code[it].opcode == Opcode.MOVE_EXCEPTION }
    implementation!!.run {
        addCatch(newLabelForIndex(opened + 1), newLabelForIndex(close), newLabelForIndex(rethrow))
        addCatch(newLabelForIndex(rethrow + 1), newLabelForIndex(rethrow + 2), newLabelForIndex(finally))
        if (closeCovered) addCatch(newLabelForIndex(close), newLabelForIndex(close + 1), newLabelForIndex(finally))
    }
}

/** Both events beside methods that share part of their shape and never get a hook. */
internal fun adEventsFixture(entryMethod: MutableMethod = entry(), visibilityMethod: MutableMethod = visibility()): List<MutableClass> = listOf(
    fixtureClass("LX/6J3;", listOf(entryMethod,
        fixtureMethod("LX/6J3;->A01(LX/6Bz;$FB_USER_SESSION$S$S$S$S)V", "const-string v0, \"ad_id\"\nreturn-void", 11, STATIC))),
    fixtureClass("LX/24f;", listOf(visibilityMethod,
        fixtureMethod("LX/24f;->Dgz(LX/0Co;Z)V", "const-string v0, \"$INBOX_IMPRESSION_TRACKER\"\nreturn-void", 14))),
)

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.ref() = (this as ReferenceInstruction).reference.toString()

class AdEventsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(AD_EVENTS).map { it.hookId() }.toSet()

    @Test fun bothEventsAreFoundByShapeAndTheNamesTheyLog() {
        assertEquals(setOf(SYNTHETIC_INBOX_VISIBILITY, SYNTHETIC_AD_ENTRY), found(adEventsFixture()))
        validateControls(mirroredControls(adEventsFixture()), setOf(AD_EVENTS))
    }

    @Test fun everyProfileHooksBothEvents() {
        assertEquals(setOf("LX/279;->FBj(LX/0Bh;Z)V", "LX/6Nj;->A00(LX/6Es;$FB_USER_SESSION$S$S$S$S)V"),
            BASE_PROFILE.hooks.getValue(AD_EVENTS))
        assertEquals(setOf(SYNTHETIC_INBOX_VISIBILITY, SYNTHETIC_AD_ENTRY), SYNTHETIC_PROFILE.hooks.getValue(AD_EVENTS))
    }

    @Test fun lookalikesAreNotAdEvents() {
        val cases = mapOf(
            "entry without page_id" to adEventsFixture(entryMethod = entry(body = "const-string v0, \"ad_id\"\nreturn-void")),
            "entry as an instance method" to adEventsFixture(entryMethod = entry(flags = AccessFlags.PUBLIC.value)),
            "entry with three strings" to adEventsFixture(entryMethod = entry(id = "LX/6J3;->A00(LX/6Bz;$FB_USER_SESSION$S$S$S)V", registers = 10)),
            "entry without the session second" to adEventsFixture(entryMethod = entry(id = "LX/6J3;->A00($FB_USER_SESSION$S$S$S${S}LX/6Bz;)V")),
            "visibility without its tracker" to adEventsFixture(visibilityMethod = visibility(body = VISIBILITY_BODY.replace(INBOX_IMPRESSION_TRACKER, "OtherTracker"))),
            "visibility without its event" to adEventsFixture(visibilityMethod = visibility(body = VISIBILITY_BODY.replace(INBOX_VISIBILITY_EVENT, "inbox2_other"))),
            "visibility as a static method" to adEventsFixture(visibilityMethod = visibility(flags = STATIC)),
            "visibility with an int flag" to adEventsFixture(visibilityMethod = visibility(id = "LX/24f;->Df7(LX/0Co;I)V")),
        )
        for ((case, classes) in cases) {
            assertEquals(1, found(classes).size, case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(AD_EVENTS)) }
        }
    }

    @Test fun theEntryEventReturnsBeforeItsFirstInstruction() {
        val method = entry()
        val before = method.code()
        injectControl(AD_EVENTS, mapOf(AD_EVENTS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAdEvents()Z", code[0].ref())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(4, code.branchTarget(2))
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        assertEquals(before, code.drop(4))
    }

    @Test fun theVisibilityCallbackSkipsOnlyTheEventAndStillClosesItsContext() {
        val method = visibility()
        val before = method.code()
        val name = before.indexOfFirst { it.string() == INBOX_VISIBILITY_EVENT }
        val loopExit = before.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        assertEquals(name, before.branchTarget(loopExit))
        injectControl(AD_EVENTS, mapOf(AD_EVENTS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAdEvents()Z", code[name + 1].ref())
        assertEquals(Opcode.MOVE_RESULT, code[name + 2].opcode)
        // The event's register, which the new-instance right after overwrites on the stock path.
        assertEquals(2, (code[name + 2] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[name + 3].opcode)
        assertEquals(2, (code[name + 3] as OneRegisterInstruction).registerA)
        val guard = code.indexOfLast { it.opcode == Opcode.IF_EQZ }
        assertEquals(guard, code.branchTarget(name + 3))
        assertEquals("LX/5vW;->A03(LX/2Kb;)V", code[guard - 1].ref())
        assertEquals(REQ_CONTEXT_CLOSE, code[guard + 1].ref())
        // The tracker's own loop still exits onto the name, so its state updates run either way.
        assertEquals(name, code.branchTarget(loopExit))
        assertEquals(before, code.take(name + 1) + code.drop(name + 4))
    }

    @Test fun aChangedCallbackRefusesBothEventsBeforeAnyEdit() {
        val getter = "invoke-virtual {v11}, LX/24f;->A02()I\nmove-result v0"
        val bodies = mapOf(
            "the loop lands on the event" to VISIBILITY_BODY.replace(
                ":rows_done\nconst-string v0, \"$INBOX_VISIBILITY_EVENT\"", "const-string v0, \"$INBOX_VISIBILITY_EVENT\"\n:rows_done"),
            "the context lives in a register the event writes" to VISIBILITY_BODY.replace("move-result-object v3", "move-result-object v1")
                .replace("if-eqz v3", "if-eqz v1").replace("{v3}", "{v1}"),
            "the logger takes more than the event" to VISIBILITY_BODY.replace(
                "invoke-virtual {v0, v2}, LX/5vW;->A03(LX/2Kb;)V", "invoke-virtual {v0, v2, v6}, LX/5vW;->A03(LX/2Kb;I)V"),
            "the event code branches" to VISIBILITY_BODY.replace("const-string v1, \"pigeon", "if-eqz v13, :closed\nconst-string v1, \"pigeon"),
            "work after the close" to VISIBILITY_BODY.replace(":closed\nreturn-void", ":closed\niput-boolean v13, v11, LX/24f;->A00:Z\nreturn-void"),
            "the name loads twice" to VISIBILITY_BODY.replace("const-string v1, \"pigeon", "const-string v1, \"$INBOX_VISIBILITY_EVENT\"\nconst-string v1, \"pigeon"),
            "no constructor right after the name" to VISIBILITY_BODY.replace("new-instance v2, LX/2Kb;", "new-instance v2, LX/2Kb;\nconst/4 v6, 0x0"),
            "the event code writes the tracker" to VISIBILITY_BODY.replace(getter, "iput-boolean v13, v11, LX/24f;->A00:Z"),
            "the event code calls into the tracker" to VISIBILITY_BODY.replace(getter, "invoke-virtual {v11}, LX/24f;->A04()V"),
            "the event code calls the tracker by range" to VISIBILITY_BODY.replace(getter, "invoke-virtual/range {v11 .. v11}, LX/24f;->A04()V"),
            "the event code calls a static helper" to VISIBILITY_BODY.replace(getter, "invoke-static {v11}, LX/24f;->A05(LX/24f;)V"),
            "the event code adds to a list and drops the answer" to VISIBILITY_BODY.replace(getter,
                "invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z"),
            "the event code writes a static" to VISIBILITY_BODY.replace(getter, "sput-boolean v13, LX/24f;->A09:Z"),
            "the event code writes an array" to VISIBILITY_BODY.replace(getter, "aput v6, v0, v6"),
            "the event code takes a lock" to VISIBILITY_BODY.replace(getter, "monitor-enter v11"),
            "the event code releases a lock" to VISIBILITY_BODY.replace(getter, "monitor-exit v11"),
            "the rethrow reads the event" to VISIBILITY_BODY.replace("move-exception v1\nthrow v1",
                "move-exception v1\ninvoke-static {v2, v1}, LX/36T;->A01(Ljava/lang/Object;Ljava/lang/Throwable;)V\nthrow v1"),
        )
        val cases = bodies.mapValues { (case, body) -> assertTrue(body != VISIBILITY_BODY, case); visibility(body = body) } +
            ("the closing handler covers the close" to visibility(closeCovered = true))
        for ((case, bad) in cases) {
            val good = entry()
            assertTrue(bad.isInboxVisibilityEvent(), case)
            val goodBefore = good.code()
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(AD_EVENTS, mapOf(AD_EVENTS to listOf(good, bad))) }
            assertEquals(goodBefore, good.code(), case)
            assertEquals(badBefore, bad.code(), case)
        }
        // Six registers are exactly the entry event's parameter words, so v0 would be its first argument.
        val tight = entry(registers = 6)
        val tightBefore = tight.code()
        assertFailsWith<PatchException> { injectControl(AD_EVENTS, mapOf(AD_EVENTS to listOf(tight))) }
        assertEquals(tightBefore, tight.code())
    }

    @Test fun everySupportedBuildSkipsBothEvents() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val events = findAdEvents(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(AD_EVENTS), events.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(AD_EVENTS to events), setOf(AD_EVENTS))
            val methods = events.map { MutableMethod(it) }
            val befores = methods.map { it.code() }
            val visibilityAt = methods.single { it.isInboxVisibilityEvent() }.inboxVisibilitySubmit()
            injectControl(AD_EVENTS, mapOf(AD_EVENTS to methods))
            for ((method, before) in methods.zip(befores)) {
                val after = method.code()
                if (method.isAdEntryEvent()) {
                    assertEquals("$SETTINGS->stopAdEvents()Z", after[0].ref(), code)
                    assertEquals(4, after.branchTarget(2), code)
                    assertEquals(Opcode.RETURN_VOID, after[3].opcode, code)
                    assertEquals(before.map { it.opcode }, after.drop(4).map { it.opcode }, code)
                } else {
                    val at = visibilityAt.skipFrom
                    assertEquals(INBOX_VISIBILITY_EVENT, after[at - 1].string(), code)
                    assertEquals("$SETTINGS->stopAdEvents()Z", after[at].ref(), code)
                    assertEquals(Opcode.IF_NEZ, after[at + 2].opcode, code)
                    assertEquals(visibilityAt.resume + 3, after.branchTarget(at + 2), code)
                    assertEquals(REQ_CONTEXT_CLOSE, after[visibilityAt.resume + 4].ref(), code)
                    assertTrue(at - 1 in method.jumpTargets() && at !in method.jumpTargets(), code)
                    assertEquals(before.map { it.opcode }, (after.take(at) + after.drop(at + 3)).map { it.opcode }, code)
                }
            }
        }
    }
}
