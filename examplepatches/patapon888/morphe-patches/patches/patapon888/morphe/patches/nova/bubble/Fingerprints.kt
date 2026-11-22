package patapon888.morphe.patches.nova.bubble

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

private const val LIST_OF = "Ljg/a;->R([Ljava/lang/Object;)Ljava/util/List;"

/**
 * Static initializer of the class holding the list of long-press popup item factories.
 */
internal object PopupItemFactoriesFingerprint : Fingerprint(
    definingClass = "Lh10/f;",
    name = "<clinit>",
    filters = listOf(
        methodCall(smali = LIST_OF),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        fieldAccess(
            opcode = Opcode.SPUT_OBJECT,
            definingClass = "Lh10/f;",
            name = "a",
            type = "Ljava/util/List;",
            location = MatchAfterImmediately()
        )
    )
)

/**
 * Compose content of Settings > Look & feel > Long-press Menu.
 */
internal object LongPressMenuSettingsFingerprint : Fingerprint(
    definingClass = "Lr00/n;",
    name = "invoke",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "popup_menu_save_apk"),
        resourceLiteral(ResourceType.STRING, "sesame"),
        methodCall(smali = LIST_OF),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately())
    )
)
