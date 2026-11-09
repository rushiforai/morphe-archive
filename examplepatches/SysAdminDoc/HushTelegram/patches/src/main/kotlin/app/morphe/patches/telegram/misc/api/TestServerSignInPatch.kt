/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val TEST_SERVERS = "$EXTENSION_PACKAGE/misc/TestServers;"
internal const val TEST_SERVERS_SHOWN = "$TEST_SERVERS->shown(I)Z"
internal const val DEBUG_TEST_BACKEND = "Lorg/telegram/messenger/R\$string;->DebugTestBackend:I"
internal const val IS_TEST_BACKEND = "Lorg/telegram/tgnet/ConnectionsManager;->isTestBackend()Z"
internal const val TEST_SERVERS_COUNTRY_STATE = "$TEST_SERVERS->countryState(ILjava/lang/Object;)I"
internal const val CHOOSE_COUNTRY = "Lorg/telegram/messenger/R\$string;->ChooseCountry:I"
internal const val WRONG_COUNTRY = "Lorg/telegram/messenger/R\$string;->WrongCountry:I"
private const val EDIT_TEXT_GET_TEXT = "Landroid/widget/EditText;->getText()Landroid/text/Editable;"
/** The phone screen's country state for a code no country has, the one Next answers with WrongCountry. */
private const val UNKNOWN_COUNTRY_STATE = 2
private val CONSTANT_LOADS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
private const val CELLS_PACKAGE = "Lorg/telegram/ui/Cells/"
private const val CELL_INIT = "-><init>(Landroid/content/Context;I)V"

/**
 * Where the sign-in screen decides whether to add its Test Backend checkbox: the method that builds
 * the phone number screen, the index of the if-eqz testing ConnectionsManager.isTestBackend()'s
 * answer, and the register that answer sits in.
 */
internal class TestBackendCheck(val method: MutableMethod, val test: Int, val register: Int)

@Suppress("unused")
val testServerSignInPatch = bytecodePatch(
    name = "Test server sign-in",
    description = "Shows Telegram's Test Backend box on the sign-in screen for every new account. Tick it to sign that " +
        "account in on Telegram's test servers, kept apart from your other accounts. Starts off. Turn it on in " +
        "HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val check = resolveTestServerSignIn()
        val code = resolveTestNumberCode()
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertTestServersAnswer(MutableMethod(ImmutableMethod.of(check.method)), check)
        insertCountryStateAnswer(MutableMethod(ImmutableMethod.of(code.method)), code)
        insertTestServersAnswer(check.method, check)
        insertCountryStateAnswer(code.method, code)
        enableStatus("testServerSignIn")
    }
}

/**
 * Where Next on the sign-in phone screen refuses a country code no country has: the method, the
 * index right after it reads the screen's country state, the registers holding that state and the
 * screen, the field holding the typed code, a register the next instruction overwrites anyway, and
 * the screen's field for its sign-in page plus that page's Test Backend flag.
 */
internal class CountryCodeCheck(
    val method: MutableMethod,
    val at: Int,
    val state: Int,
    val screen: Int,
    val codeField: String,
    val scratch: Int,
    val pageField: String,
    val testBoxField: String,
)

/**
 * While the Test Backend box is ticked, the extension gets the country state and the code field
 * before Next tests the state, and its answer goes back in the same register, so a 999 test number
 * passes both of Telegram's tests. Unticked, Next is Telegram's own: test numbers only exist on the
 * test servers, and the regular ones would take one and wait for a code that never comes.
 */
internal fun insertCountryStateAnswer(target: MutableMethod, check: CountryCodeCheck) {
    target.addInstructionsWithLabels(
        check.at,
        """
            iget-object v${check.scratch}, v${check.screen}, ${check.pageField}
            iget-boolean v${check.scratch}, v${check.scratch}, ${check.testBoxField}
            if-eqz v${check.scratch}, :hush_stock
            iget-object v${check.scratch}, v${check.screen}, ${check.codeField}
            invoke-static { v${check.state}, v${check.scratch} }, $TEST_SERVERS_COUNTRY_STATE
            move-result v${check.state}
        """,
        ExternalLabel("hush_stock", target.getInstruction(check.at)),
    )
}

/**
 * Next on the sign-in phone screen. Telegram reads the screen's country state, shows ChooseCountry
 * for state 1 and WrongCountry for state 2, then builds the number from the code field's text and
 * the phone field's. Release builds know no 999 country, so a test number always lands on state 2.
 * Every piece of that is checked here before anything is edited.
 */
internal fun BytecodePatchContext.resolveTestNumberCode(): CountryCodeCheck {
    controlHook(TEST_SERVERS, "countryState", listOf("I", "Ljava/lang/Object;"), "I")
    val hosts = mutableListOf<Pair<String, Method>>()
    // Changing a number has the same alerts, but only signing in asks which servers an account is on.
    val refs = listOf(CHOOSE_COUNTRY, WRONG_COUNTRY, IS_TEST_BACKEND)
    forEachClassMentioning(Mention.allOf(refs.map { Mention.reference(it) })) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (method in cls.methods) {
            val body = method.controlBody()
            if (refs.all { ref -> body.any { it.controlRef() == ref } }) hosts += cls.type to method
        }
    }
    val (type, found) = hosts.controlSingle("the phone screen's Next")
    val signature = found.name + found.parameterTypes.joinToString("", "(", ")") + found.returnType
    val method = tgMutableClassDefBy(type).methods.single {
        it.name + it.parameterTypes.joinToString("", "(", ")") + it.returnType == signature
    }
    val body = method.controlBody()
    val choose = body.indices.filter { body[it].controlRef() == CHOOSE_COUNTRY }.controlSingle("the ChooseCountry alert")
    val wrong = body.indices.filter { body[it].controlRef() == WRONG_COUNTRY }.controlSingle("the WrongCountry alert")
    val refusal = (wrong - 1 downTo choose + 1).firstOrNull { body[it].opcode == Opcode.IF_NE }
    controlShape(refusal != null, "the WrongCountry alert is no longer behind a test")
    val tested = body[refusal!!] as TwoRegisterInstruction
    val state = tested.registerA
    controlShape((choose + 1 until refusal).any {
        val two = body[it]
        two.opcode == Opcode.CONST_4 && (two as OneRegisterInstruction).registerA == tested.registerB &&
            (two as NarrowLiteralInstruction).narrowLiteral == UNKNOWN_COUNTRY_STATE
    }, "the WrongCountry alert no longer waits on an unknown country code")
    val read = (choose - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.IGET && (body[it] as OneRegisterInstruction).registerA == state }
    controlShape(read != null, "Next no longer reads the country state")
    val stateField = (body[read!!] as ReferenceInstruction).reference as FieldReference
    val screen = (body[read] as TwoRegisterInstruction).registerB
    controlShape(stateField.definingClass == method.definingClass && stateField.type == "I",
        "the country state is no longer the screen's own int")
    val next = body[read + 1]
    controlShape(next.opcode in CONSTANT_LOADS && (next as OneRegisterInstruction).registerA.let { it != state && it != screen },
        "Next no longer loads a constant right after reading the country state")
    val scratch = (next as OneRegisterInstruction).registerA
    val first = read + 2
    controlShape(body[first].opcode == Opcode.IF_NE && (body[first] as TwoRegisterInstruction).registerA == state,
        "Next no longer tests the country state right after reading it")
    // Both tests read the state the hook answered: past ChooseCountry, Telegram goes straight to the
    // WrongCountry test with constants only, so nothing on the way changes it.
    val flow = ControlFlow.of(method)
    val past = flow.normal[first].filter { it != first + 1 }.controlSingle("the ChooseCountry test's way past the alert")
    controlShape(past in (choose + 1)..refusal && (past until refusal).all { i ->
        flow.normal[i] == listOf(i + 1) && body[i].opcode in CONSTANT_LOADS && (body[i] as OneRegisterInstruction).registerA != state
    }, "Next changes the country state before testing it again")
    val code = (wrong + 1 until body.size).firstOrNull { i ->
        val get = body[i]
        get.opcode == Opcode.IGET_OBJECT && (get as TwoRegisterInstruction).registerB == screen &&
            body.getOrNull(i + 1)?.controlRef() == EDIT_TEXT_GET_TEXT &&
            (body[i + 1] as FiveRegisterInstruction).registerC == get.registerA
    }
    controlShape(code != null, "Next no longer starts the number with a field's text")
    val codeField = (body[code!!] as ReferenceInstruction).reference as FieldReference
    controlShape(codeField.definingClass == method.definingClass, "the number no longer starts with the screen's own field")
    // The box's flag is the one Next compares with isTestBackend() before warning that a number is
    // already signed in: the sign-in page's boolean, read through the screen's field for that page.
    val box = body.indices.filter { i ->
        body[i].controlRef() == IS_TEST_BACKEND && i + 4 < body.size &&
            body[i + 1].opcode == Opcode.MOVE_RESULT && body[i + 2].opcode == Opcode.IGET_OBJECT &&
            body[i + 3].opcode == Opcode.IGET_BOOLEAN && body[i + 4].opcode in setOf(Opcode.IF_EQ, Opcode.IF_NE) &&
            (body[i + 3] as TwoRegisterInstruction).registerB == (body[i + 2] as OneRegisterInstruction).registerA &&
            (body[i + 4] as TwoRegisterInstruction).let { setOf(it.registerA, it.registerB) } ==
            setOf((body[i + 1] as OneRegisterInstruction).registerA, (body[i + 3] as OneRegisterInstruction).registerA)
    }.controlSingle("the Test Backend box's flag")
    val pageField = (body[box + 2] as ReferenceInstruction).reference as FieldReference
    val testBoxField = (body[box + 3] as ReferenceInstruction).reference as FieldReference
    controlShape(pageField.definingClass == method.definingClass && testBoxField.definingClass == pageField.type &&
        testBoxField.type == "Z", "the Test Backend box's flag is no longer on the screen's sign-in page")
    controlShape(listOf(state, screen, scratch).all { it <= 15 }, "Next's registers no longer fit the hook")
    // Nothing but the read itself may reach the instruction after it, or that way in would skip the hook.
    val otherEntry = flow.normal.indices.any { it != read && read + 1 in flow.normal[it] } ||
        flow.exceptional.any { read + 1 in it }
    controlShape(!otherEntry, "something else jumps past Next's country state read")
    return CountryCodeCheck(method, read + 1, state, screen, codeField.origString(), scratch,
        pageField.origString(), testBoxField.origString())
}

/**
 * The extension gets Telegram's answer to whether this account is on the test servers, right before
 * the screen tests it, and its answer goes back in the same register. That register also tells the
 * checkbox's tap listener what the account was on, and a yes there is what Telegram itself holds for a
 * test account, so ticking moves just this account to the test servers and unticking moves it back.
 */
internal fun insertTestServersAnswer(target: MutableMethod, check: TestBackendCheck) {
    target.addInstructions(
        check.test,
        """
            invoke-static/range { v${check.register} .. v${check.register} }, $TEST_SERVERS_SHOWN
            move-result v${check.register}
        """,
    )
}

/**
 * The sign-in screen's Test Backend checkbox. Telegram reads the account's isTestBackend(), skips the
 * checkbox when that's false or the screen isn't signing in, and otherwise builds a cell from
 * org.telegram.ui.Cells labelled with the DebugTestBackend string. Every piece of that is checked
 * here before anything is edited.
 */
internal fun BytecodePatchContext.resolveTestServerSignIn(): TestBackendCheck {
    requireStatusMethod("testServerSignIn")
    controlHook(TEST_SERVERS, "shown", listOf("I"), "Z")
    val hosts = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.reference(DEBUG_TEST_BACKEND) and Mention.reference(IS_TEST_BACKEND)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (method in cls.methods) {
            val body = method.controlBody()
            if (body.any { it.controlRef() == DEBUG_TEST_BACKEND } && body.any { it.controlRef() == IS_TEST_BACKEND }) {
                hosts += cls.type to method
            }
        }
    }
    val (type, found) = hosts.controlSingle("the sign-in screen's Test Backend checkbox")
    val signature = found.name + found.parameterTypes.joinToString("", "(", ")") + found.returnType
    val method = tgMutableClassDefBy(type).methods.single {
        it.name + it.parameterTypes.joinToString("", "(", ")") + it.returnType == signature
    }
    val body = method.controlBody()
    val label = body.indices.filter { body[it].controlRef() == DEBUG_TEST_BACKEND }.controlSingle("the Test Backend label")
    val cell = (label - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.NEW_INSTANCE }
    val cellType = cell?.let { body[it].controlRef() }
    controlShape(cell != null && cellType != null && cellType.startsWith(CELLS_PACKAGE) &&
        body[cell + 1].opcode == Opcode.INVOKE_DIRECT && body[cell + 1].controlRef() == cellType + CELL_INIT,
        "the Test Backend label no longer goes on a checkbox cell")
    val test = (cell!! - 1 downTo 2).firstOrNull { body[it].opcode == Opcode.IF_EQZ }
    controlShape(test != null, "the Test Backend checkbox is no longer behind a test")
    val register = (body[test!!] as OneRegisterInstruction).registerA
    val result = body[test - 1]
    controlShape(result.opcode == Opcode.MOVE_RESULT && (result as OneRegisterInstruction).registerA == register &&
        body[test - 2].controlRef() == IS_TEST_BACKEND, "the Test Backend checkbox no longer waits on isTestBackend()")
    val flow = ControlFlow.of(method)
    val skip = flow.normal[test].filter { it != test + 1 }.controlSingle("the Test Backend test's way past the checkbox")
    controlShape(skip > label, "the Test Backend test doesn't skip the checkbox")
    // Telegram's own second test keeps the box to signing in, so changing a number never shows it.
    controlShape((test + 1 until cell).any { body[it].opcode == Opcode.IF_NEZ && skip in flow.normal[it] },
        "the Test Backend checkbox is no longer kept to signing in")
    // Nothing but the answer's own move-result may reach the test, or that way in would skip the hook.
    val otherEntry = flow.normal.indices.any { it != test - 1 && test in flow.normal[it] } ||
        flow.exceptional.any { test in it }
    controlShape(!otherEntry, "something else jumps onto the Test Backend test")
    return TestBackendCheck(method, test, register)
}
