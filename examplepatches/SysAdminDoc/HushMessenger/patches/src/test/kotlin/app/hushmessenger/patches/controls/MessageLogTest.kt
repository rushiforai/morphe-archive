package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val BODY_FIELD = "$MESSAGE->A0n:$SECRET_STRING"
private const val SECRET_FIELD = "$SECRET_STRING->A00:Ljava/lang/String;"
private const val THREAD_KEY_FIELD = "$MESSAGE->A0e:$THREAD_KEY_TYPE"

private fun field(owner: String, name: String, type: String) =
    ImmutableField(owner, name, type, AccessFlags.PUBLIC.value, null, null, null)

/** The three stock classes the message log reads from, cut down to the shape the resolver checks. */
internal fun messageLogFixture(
    ctorRegisters: Int = 23,
    // Stock shape: the field is read only once "text" is in the set fields, else a shared static empty SecretString.
    bodyGetter: String = """
        iget-object v1, v2, $MESSAGE->A29:Ljava/util/Set;
        const-string v0, "text"
        invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :fallback
        iget-object v0, v2, $BODY_FIELD
        return-object v0
        :fallback
        sget-object v0, $MESSAGE->A2f:$SECRET_STRING
        return-object v0
    """.trimIndent(),
    secretCtor: String = """
        iput-object v3, v2, $SECRET_FIELD
        const/4 v0, 0x0
        iput-object v0, v2, $SECRET_STRING->A01:Ljava/lang/String;
        return-void
    """.trimIndent(),
    ctorBody: String = """
        iget-object v0, p2, $THREAD_KEY_FIELD
        return-void
    """.trimIndent(),
): List<MutableClass> {
    val notificationCtor = newMessageNotificationCtor("LX/5qJ;", "LX/5Yc;")
    val secret = fixtureClass(SECRET_STRING, listOf(
        fixtureMethod("$SECRET_STRING-><init>(Ljava/lang/String;)V", secretCtor, 4),
    ), extraFields = listOf(field(SECRET_STRING, "A00", "Ljava/lang/String;"), field(SECRET_STRING, "A01", "Ljava/lang/String;")))
    val message = fixtureClass(MESSAGE, listOf(
        fixtureMethod("$MESSAGE->A0G()$SECRET_STRING", bodyGetter, 3),
        // A decoy that also returns a SecretString but names a different field, so "text" has to disambiguate.
        fixtureMethod("$MESSAGE->A0F()$SECRET_STRING", "const-string v0, \"snippet\"\niget-object v0, v1, $MESSAGE->A0m:$SECRET_STRING\nreturn-object v0", 2),
    ), extraFields = listOf(field(MESSAGE, "A0n", SECRET_STRING), field(MESSAGE, "A0m", SECRET_STRING), field(MESSAGE, "A0e", THREAD_KEY_TYPE)))
    val notification = fixtureClass(NEW_MESSAGE_NOTIFICATION, listOf(
        fixtureMethod(notificationCtor, ctorBody, ctorRegisters),
        // The Parcel constructor the resolver must skip.
        fixtureMethod("$NEW_MESSAGE_NOTIFICATION-><init>(Landroid/os/Parcel;)V", "return-void", 2),
    ))
    return listOf(secret, message, notification)
}

private fun MutableMethod.code() = implementation!!.instructions.toList()
private fun reference(at: Int, code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) =
    (code[at] as ReferenceInstruction).reference.toString()

class MessageLogTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
        messageLogContract = null
    }

    private fun ctorOf(classes: List<MutableClass>) = classes.single { it.type == NEW_MESSAGE_NOTIFICATION }
        .methods.single { it.name == "<init>" && it.parameterTypes.firstOrNull() == MESSENGER_ACCOUNT_TYPE }

    @Test fun theConstructorIsFoundAndItsFieldsResolvePerBuild() {
        val classes = messageLogFixture()
        val found = findControls(classes).getValue(MESSAGE_LOG).map { it.hookId() }
        assertEquals(activeProfile.hooks.getValue(MESSAGE_LOG).toList(), found)
        validateControls(findControls(classes), setOf(MESSAGE_LOG))
        val contract = messageLogContract!!
        assertEquals(BODY_FIELD, contract.bodyField)
        assertEquals(SECRET_FIELD, contract.secretField)
        assertEquals(THREAD_KEY_FIELD, contract.threadKeyField)
    }

    @Test fun theHookReadsTheMessageAndThreadAndKeepsTheOriginalBody() {
        val classes = messageLogFixture()
        findControls(classes)
        val ctor = ctorOf(classes)
        val before = ctor.code()
        injectControl(MESSAGE_LOG, mapOf(MESSAGE_LOG to listOf(ctor)))
        val code = ctor.code()
        assertEquals("$SETTINGS->logReceivedMessages()Z", reference(0, code))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        val stock = code.size - before.size
        assertEquals(stock, code.branchTarget(2))
        assertEquals(stock, code.branchTarget(4))
        assertEquals(stock, code.branchTarget(6))
        assertEquals(0, (code[3] as OneRegisterInstruction).registerA)
        assertEquals(BODY_FIELD, reference(5, code))
        assertEquals(SECRET_FIELD, reference(7, code))
        assertEquals(THREAD_KEY_FIELD, reference(8, code))
        assertEquals(Opcode.IF_EQZ, code[9].opcode)
        // Null thread skips toString and passes a null string, so the register stays String-typed on both paths.
        assertEquals(13, code.branchTarget(9))
        assertEquals("$THREAD_KEY_TYPE->toString()Ljava/lang/String;", reference(10, code))
        assertEquals(Opcode.GOTO, code[12].opcode)
        assertEquals(14, code.branchTarget(12))
        assertEquals(Opcode.CONST_4, code[13].opcode)
        assertEquals("$SETTINGS->recordReceivedMessage(Ljava/lang/String;Ljava/lang/String;)V", reference(14, code))
        assertEquals(before, code.drop(stock))
    }

    @Test fun aMissingTextGetterRefusesTheSwitchBeforeAnyEdit() {
        val classes = messageLogFixture(bodyGetter = "const-string v0, \"snippet\"\niget-object v0, v1, $BODY_FIELD\nreturn-object v0")
        findControls(classes)
        assertEquals(null, messageLogContract)
        val ctor = ctorOf(classes)
        val before = ctor.code()
        assertFailsWith<PatchException> { injectControl(MESSAGE_LOG, mapOf(MESSAGE_LOG to listOf(ctor))) }
        assertEquals(before, ctor.code())
    }

    @Test fun aConstructorWithoutARoomForTheHookIsRefused() {
        val classes = messageLogFixture(ctorRegisters = 22)
        findControls(classes)
        assertTrue(messageLogContract != null)
        val ctor = ctorOf(classes)
        val before = ctor.code()
        assertFailsWith<PatchException> { injectControl(MESSAGE_LOG, mapOf(MESSAGE_LOG to listOf(ctor))) }
        assertEquals(before, ctor.code())
    }
}
