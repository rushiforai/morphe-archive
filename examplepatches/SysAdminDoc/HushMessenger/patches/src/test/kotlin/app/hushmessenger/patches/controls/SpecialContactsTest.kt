package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
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

private const val DEFAULT_MANAGER = "Lcom/facebook/presence/DefaultPresenceManager;"
private const val MANAGER_V2 = "Lcom/facebook/presence/PresenceManagerV2;"

/** The three hooks under the names every 587 build keeps: none of these classes is renamed. */
internal const val SPECIAL_PRESENCE_INIT =
    "$PRESENCE_ITEM-><init>(${USER_KEY}Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;IJZ)V"
internal const val SPECIAL_DEFAULT_TYPING = "$DEFAULT_MANAGER->A0F(Landroid/content/Intent;$DEFAULT_MANAGER)V"
internal const val SPECIAL_V2_TYPING = "$MANAGER_V2->A0B(Landroid/content/Intent;$MANAGER_V2)V"

/** PresenceItem's constructor as 587 has it: ten registers, no locals, each parameter stored, then the one return. */
private val PRESENCE_BODY = """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, $PRESENCE_ITEM->A04:$USER_KEY
    iput-object p2, p0, $PRESENCE_ITEM->A02:Ljava/lang/Long;
    iput-object p3, p0, $PRESENCE_ITEM->A03:Ljava/lang/Long;
    iput-object p4, p0, $PRESENCE_ITEM->A05:Ljava/lang/String;
    iput-object p5, p0, $PRESENCE_ITEM->A06:Ljava/lang/String;
    iput p6, p0, $PRESENCE_ITEM->A00:I
    iput-wide p7, p0, $PRESENCE_ITEM->A01:J
    iput-boolean p9, p0, $PRESENCE_ITEM->A07:Z
    return-void
""".trimIndent()

/** A typing handler cut down: the new state read with getIntExtra and the user cast from the extras. */
private val TYPING_BODY = """
    const-string v0, "extra_new_state"
    const/4 v1, -0x1
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    const-string v1, "extra_user_key"
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object v1
    check-cast v1, $USER_KEY
    return-void
""".trimIndent()

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun presence(body: String = PRESENCE_BODY, id: String = SPECIAL_PRESENCE_INIT, registers: Int = 10) =
    fixtureMethod(id, body, registers, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)

private fun typing(id: String = SPECIAL_DEFAULT_TYPING, body: String = TYPING_BODY) = fixtureMethod(id, body, 4, STATIC)

private fun fixture(vararg methods: MutableMethod = arrayOf(presence(), typing(), typing(SPECIAL_V2_TYPING))): List<MutableClass> =
    methods.groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) }

/** The constructor and both typing handlers, for the complete discovery fixture. */
internal fun specialContactsFixture(): List<MutableClass> = fixture()

private fun Method.code() = implementation!!.instructions.toList()
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class SpecialContactsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(SPECIAL_CONTACTS)

    @Test fun findsThePresenceConstructorAndBothTypingHandlers() {
        val ids = setOf(SPECIAL_PRESENCE_INIT, SPECIAL_DEFAULT_TYPING, SPECIAL_V2_TYPING)
        assertEquals(ids, found(fixture()).map { it.hookId() }.toSet())
        validateControls(mirroredControls(fixture()), setOf(SPECIAL_CONTACTS))
        assertEquals(ids, SYNTHETIC_PROFILE.hooks.getValue(SPECIAL_CONTACTS))
        for ((code, profile) in controlProfiles) assertEquals(ids, profile.hooks.getValue(SPECIAL_CONTACTS), "$code")
    }

    // Messenger runs one manager or the other depending on its config, so one handler is enough to find.
    @Test fun oneManagerIsEnough() {
        assertEquals(listOf(SPECIAL_PRESENCE_INIT, SPECIAL_V2_TYPING), found(fixture(presence(), typing(SPECIAL_V2_TYPING))).map { it.hookId() })
    }

    @Test fun lookalikesAreNotFound() {
        val cases = mapOf(
            "no typing handler" to fixture(presence()),
            "no presence constructor" to fixture(typing(), typing(SPECIAL_V2_TYPING)),
            "a constructor without the active flag" to fixture(presence(PRESENCE_BODY.replace("iput-boolean p9, p0, $PRESENCE_ITEM->A07:Z\n", ""),
                SPECIAL_PRESENCE_INIT.replace("IJZ)V", "IJ)V"), registers = 9), typing()),
            "a branch in the constructor" to fixture(presence(PRESENCE_BODY.replace("iput p6", "if-eqz p1, :done\niput p6")
                .replace("return-void", ":done\nreturn-void")), typing()),
            "a parameter written over" to fixture(presence(PRESENCE_BODY.replace("return-void", "const/4 p6, 0x0\nreturn-void")), typing()),
            "a wide parameter written over" to fixture(presence(PRESENCE_BODY.replace("return-void", "const-wide/16 p7, 0x0\nreturn-void")), typing()),
            "a handler that reads no state" to fixture(presence(), typing(body = TYPING_BODY.replace("getIntExtra(Ljava/lang/String;I)I", "getStringExtra(Ljava/lang/String;I)I"))),
            "a handler that casts no user" to fixture(presence(), typing(body = TYPING_BODY.replace("check-cast v1, $USER_KEY", "check-cast v1, Ljava/lang/String;"))),
            "a handler that isn't static" to fixture(presence(), fixtureMethod(SPECIAL_DEFAULT_TYPING, TYPING_BODY.replace("{p0", "{p1"), 5)),
            "a jump to a handler's start" to fixture(presence(), typing(body = ":top\n" + TYPING_BODY.replace("return-void", "if-eqz v0, :top\nreturn-void"))),
            "two handlers in one manager" to fixture(presence(), typing(), typing(SPECIAL_DEFAULT_TYPING.replace("A0F", "A0G"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(SPECIAL_CONTACTS)) }
        }
    }

    @Test fun aChangedMethodIsRefusedAndLeftAsItWas() {
        val cases = mapOf(
            "a branch in the constructor" to presence(PRESENCE_BODY.replace("iput p6", "if-eqz p1, :done\niput p6").replace("return-void", ":done\nreturn-void")),
            "a jump to a handler's start" to typing(body = ":top\n" + TYPING_BODY.replace("return-void", "if-eqz v0, :top\nreturn-void")),
        )
        for ((case, method) in cases) {
            val before = method.code()
            assertFailsWith<PatchException>(case) { method.injectSpecialContacts() }
            assertEquals(before, method.code(), case)
        }
    }

    @Test fun theConstructorHandsOverWhatItStoredRightBeforeItReturns() {
        val method = presence()
        val before = method.code()
        injectControl(SPECIAL_CONTACTS, mapOf(SPECIAL_CONTACTS to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 1, code.size)
        val call = code[code.size - 2] as RegisterRangeInstruction
        assertEquals(PRESENCE_CALL, code[code.size - 2].reference())
        // p1 to p9: the user, both Longs, both Strings, the client bits, last active (two words) and the flag.
        assertEquals(1 to 9, call.startRegister to call.registerCount)
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
        assertEquals(before.dropLast(1).map { it.opcode }, code.dropLast(2).map { it.opcode })
    }

    @Test fun eachTypingHandlerHandsOverItsIntentFirst() {
        for (id in listOf(SPECIAL_DEFAULT_TYPING, SPECIAL_V2_TYPING)) {
            val method = typing(id)
            val before = method.code()
            injectControl(SPECIAL_CONTACTS, mapOf(SPECIAL_CONTACTS to listOf(method)))
            val code = method.code()
            val call = code[0] as RegisterRangeInstruction
            assertEquals(TYPING_CALL, code[0].reference(), id)
            assertEquals(2 to 1, call.startRegister to call.registerCount, id)
            assertEquals(before.map { it.opcode }, code.drop(1).map { it.opcode }, id)
        }
    }

    @Test fun everySupportedBuildHooksPresenceAndTyping() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findSpecialContacts(classes)
            assertEquals(activeProfile.hooks.getValue(SPECIAL_CONTACTS), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(SPECIAL_CONTACTS to hooks), setOf(SPECIAL_CONTACTS))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                method.injectSpecialContacts()
                val after = method.code()
                if (method.isPresenceItemInit()) {
                    assertEquals(PRESENCE_CALL, after[after.size - 2].reference(), code)
                    assertEquals(method.parameterRegister(1), (after[after.size - 2] as RegisterRangeInstruction).startRegister, code)
                    assertEquals(before.dropLast(1).map { it.opcode }, after.dropLast(2).map { it.opcode }, code)
                } else {
                    assertEquals(TYPING_CALL, after[0].reference(), code)
                    assertEquals(method.parameterRegister(0), (after[0] as RegisterRangeInstruction).startRegister, code)
                    assertEquals(before.map { it.opcode }, after.drop(1).map { it.opcode }, code)
                }
            }
        }
    }
}
