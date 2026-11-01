package semicoloncolonel.mobilestream.patches.nba.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.nba.shared.Constants

private const val AI_NAVIGATION_PAYLOAD = "Lcom/nba/nextgen/abtest/ainavigation/AiNavigationPayload;"
private const val ASK_FILTER = "Lsemicoloncolonel/mobilestream/extension/nba/misc/NbaAskFilter;"

// The Ask NBA chat is opened from an icon that NBA rolls out per screen with
// the "AI navigation" A/B test. AskNbaIconViewModel.isEnabledForScreen maps
// the test's AiNavigationPayload (a list of screen names) to a Boolean: true
// when the current screen is in the list. In 1.2.0 the map's emit lives in
// com.nba.nextgen.asknba.d and ends with
//
//     invoke-static {vX}, Boolean.valueOf(Z)
//
// before handing the result downstream. Setting vX to false there hides the
// icon on every screen.
internal object AskNbaIconEnabledFingerprint : Fingerprint(
    custom = { method, _ ->
        method.name == "emit" && method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == AI_NAVIGATION_PAYLOAD
        } == true
    },
)

// The Discover tab also lists an "Ask NBA (Beta)" tile. Discover is a
// server-driven menu of com.nba.base.model.MenuItem objects, each with a
// children list. The extension drops any child that links to the asknba
// deep-link host before the constructor stores the list.
internal object MenuItemInitFingerprint : Fingerprint(
    definingClass = "Lcom/nba/base/model/MenuItem;",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/Integer;",
        "Lcom/nba/base/model/MenuInfo;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
)

@Suppress("unused")
val disableAskNbaPatch = bytecodePatch(
    name = "Disable Ask NBA AI",
    description = "Hides the Ask NBA AI chat button on every screen of the NBA app and the " +
        "Ask NBA tile in the Discover tab. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        MenuItemInitFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p6 .. p6 }, $ASK_FILTER->filterMenu(Ljava/util/List;)Ljava/util/List;
                move-result-object p6
            """,
        )

        AskNbaIconEnabledFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val boxIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == "Ljava/lang/Boolean;" && ref.name == "valueOf"
                    }
            }
            if (boxIndex < 0) throw PatchException("Ask NBA icon result not found")

            val register = (instructions[boxIndex] as FiveRegisterInstruction).registerC
            addInstructions(boxIndex, "const/4 v$register, 0x0")
        }
    }
}
