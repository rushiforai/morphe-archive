package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

class HideRecapsTest {
    private val recapsItem = "Ltv/twitch/android/shared/viewer/pub/FeedItem\$RecapsItem;"
    private val adKey = "Ltv/twitch/android/shared/viewer/pub/FeedItem\$DiscoveryFeedAdKey;"
    private val recapEntry = "Ln9h;"
    private val switch = "Android-Stream-Recaps-Native-Feed-Shelf"
    private val end = ImmutableInstruction10x(Opcode.RETURN_VOID)

    private fun method(vararg code: Instruction) = ImmutableMethod("Lowner;", "invoke", emptyList(), "V",
        AccessFlags.PUBLIC.value, emptySet(), emptySet(), ImmutableMethodImplementation(64, code.toList(), emptyList(), emptyList()))

    private fun read(register: Int, type: String) =
        ImmutableInstruction22c(Opcode.IGET_OBJECT, register, 12, ImmutableFieldReference("Lj9h;", "e", type))

    private fun unlessNull(register: Int) = ImmutableInstruction21t(Opcode.IF_EQZ, register, 8)

    private fun built(register: Int, type: String) = ImmutableInstruction21c(Opcode.NEW_INSTANCE, register, ImmutableTypeReference(type))

    private fun text(register: Int, value: String) = ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))

    private fun number(register: Int, value: Int) = ImmutableInstruction11n(Opcode.CONST_4, register, value)

    private fun moved(to: Int, from: Int) = ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, to, from)

    private fun section(opcode: Opcode, first: Int, vararg parameters: String) = ImmutableInstruction3rc(opcode, first,
        parameters.size + if (opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1,
        ImmutableMethodReference("Lki50;", "u", parameters.toList(), "V"))

    private fun defined(name: Int, default: Int, vararg parameters: String, method: String = "<init>") =
        ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 5, 0, name, default, 1, 2,
            ImmutableMethodReference("Lg73;", method, parameters.toList(), "V"))

    private val switchParameters = arrayOf("Ljava/lang/String;", "Z", "Luh6;", "Z")
    private val sectionParameters = arrayOf("Ljava/lang/String;", "Ljava/util/List;", "Lt6k;", "Lci00;", "I")

    private fun failsWithContract(block: () -> Unit) {
        try {
            block()
            fail("expected a contract failure")
        } catch (expected: PatchException) {
            assertTrue(expected.message!!, "Hide recaps" in expected.message!!)
        }
    }

    // ---- recap entry of the feed parser ----

    /** The parser's branches as Twitch 30.7.2 to 32.0.0 compile them: an ad key first, then the recap entry. */
    private fun parser(vararg recap: Instruction) = method(
        built(19, adKey), ImmutableInstruction21t(Opcode.IF_EQZ, 19, 4), *recap, end)

    @Test fun findsTheTestOnTheRecapEntryBeforeItsItemIsBuilt() {
        val found = recapEntryTest(parser(read(2, recapEntry), unlessNull(2), built(19, recapsItem))) { it == recapEntry }
        assertEquals(Slot(3, 2, recapEntry), found)
    }

    @Test fun theRegisterIsTheOneThisVersionUses() {
        val found = recapEntryTest(parser(read(0, "Lt6g;"), unlessNull(0), built(18, recapsItem))) { it == "Lt6g;" }
        assertEquals(Slot(3, 0, "Lt6g;"), found)
    }

    @Test fun aTestOnSomethingElseThanARecapEntryFailsThePatch() {
        failsWithContract { recapEntryTest(parser(read(2, "Ll9h;"), unlessNull(2), built(19, recapsItem))) { it == recapEntry } }
    }

    @Test fun aTestOnAnotherRegisterFailsThePatch() {
        failsWithContract { recapEntryTest(parser(read(2, recapEntry), unlessNull(3), built(19, recapsItem))) { it == recapEntry } }
    }

    @Test fun anItemNoLongerBuiltRightAfterTheTestFailsThePatch() {
        failsWithContract {
            recapEntryTest(parser(read(2, recapEntry), unlessNull(2), number(4, 0), built(19, recapsItem))) { it == recapEntry }
        }
    }

    @Test fun twoPlacesBuildingRecapItemsFailThePatch() {
        failsWithContract {
            recapEntryTest(parser(read(2, recapEntry), unlessNull(2), built(19, recapsItem), built(20, recapsItem))) { it == recapEntry }
        }
    }

    @Test fun aParserWithoutRecapItemsFailsThePatch() {
        failsWithContract { recapEntryTest(parser()) { it == recapEntry } }
    }

    // ---- recap shelf section of a channel page ----

    @Test fun findsTheItemsOfTheSectionAddedWithTheShelfKey() {
        // 32.0.0: invoke-virtual/range {v31 .. v36}, key in v32 and items in v33.
        val page = method(text(32, "streamerShelfKey"), section(Opcode.INVOKE_VIRTUAL_RANGE, 12, *sectionParameters),
            text(32, "streamRecapsShelfKey"), moved(35, 45), section(Opcode.INVOKE_VIRTUAL_RANGE, 31, *sectionParameters), end)
        assertEquals(Slot(4, 33), channelShelfItems(page))
    }

    @Test fun aStaticFormTakesTheListBuilderAsItsFirstParameter() {
        val page = method(text(13, "streamRecapsShelfKey"),
            section(Opcode.INVOKE_STATIC_RANGE, 12, "Lki50;", *sectionParameters), end)
        assertEquals(Slot(1, 14), channelShelfItems(page))
    }

    @Test fun aCallThatDoesNotTakeKeyAndItemsFailsThePatch() {
        failsWithContract {
            channelShelfItems(method(text(32, "streamRecapsShelfKey"),
                section(Opcode.INVOKE_VIRTUAL_RANGE, 31, "Ljava/lang/String;", "Lt6k;"), end))
        }
    }

    @Test fun aKeyThatIsNotTheOnePassedFailsThePatch() {
        failsWithContract {
            channelShelfItems(method(text(40, "streamRecapsShelfKey"),
                section(Opcode.INVOKE_VIRTUAL_RANGE, 31, *sectionParameters), end))
        }
    }

    @Test fun aPageWithoutTheShelfKeyFailsThePatch() {
        failsWithContract { channelShelfItems(method(text(32, "streamerShelfKey"), end)) }
    }

    @Test fun aKeyNothingIsCalledWithFailsThePatch() {
        failsWithContract { channelShelfItems(method(text(32, "streamRecapsShelfKey"), end)) }
    }

    // ---- Twitch's switch for the native feed's recap shelf ----

    @Test fun findsTheNameOfASwitchThatIsOffByDefault() {
        // 31.9.0 and 32.0.0: const-string v3, const/4 v4, 0x0, invoke-direct {v0, v3, v4, v1, v2}.
        val initializer = method(built(0, "Lo8g;"), number(2, 1), text(3, switch), number(4, 0), defined(3, 4, *switchParameters), end)
        assertEquals(Slot(2, 3), switchName(initializer, switch))
    }

    @Test fun theDefaultMayBeSetBeforeTheName() {
        val initializer = method(number(4, 0), text(3, switch), defined(3, 4, *switchParameters), end)
        assertEquals(Slot(1, 3), switchName(initializer, switch))
    }

    @Test fun aSwitchThatIsOnByDefaultFailsThePatch() {
        failsWithContract { switchName(method(text(3, switch), number(4, 1), defined(3, 4, *switchParameters), end), switch) }
    }

    @Test fun aDefaultThatIsNotAConstantFailsThePatch() {
        failsWithContract { switchName(method(text(3, switch), defined(3, 4, *switchParameters), end), switch) }
    }

    @Test fun aNameThatIsNotHandedToTheConstructorFailsThePatch() {
        failsWithContract { switchName(method(text(3, switch), number(4, 0), defined(1, 4, *switchParameters), end), switch) }
        failsWithContract {
            switchName(method(text(3, switch), number(4, 0), defined(3, 4, *switchParameters, method = "a"), end), switch)
        }
        failsWithContract { switchName(method(text(3, switch), number(4, 0), defined(3, 4, "Ljava/lang/String;", "I"), end), switch) }
    }

    @Test fun aSwitchThatIsNotDefinedHereFailsThePatch() {
        failsWithContract { switchName(method(number(4, 0), end), switch) }
    }
}
