package app.adm.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

object AppBrainBannerFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/f3;",
    name = "c",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("main-toolend"),
        string("18b2becc3142993292bf348e92467eded74e23229100a646")
    )
)

object AppodealInitFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/f3;",
    name = "i",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("18b2becc3142993292bf348e92467eded74e23229100a646")
    )
)

object BannerDisplayFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/f3;",
    name = "h",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("main-toolend")
    )
)

object InterstitialDisplayFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/f3;",
    name = "j",
    returnType = "V",
    parameters = listOf("Lcom/dv/get/all/MyActivity;"),
    filters = listOf(
        string("AppoInterShow")
    )
)

object TelegramPromptFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Main;",
    name = "s3",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("TELE1_KEY"),
        string("TELE2_KEY"),
        literal(2, listOf(Opcode.CONST_4)),
        opcode(Opcode.IF_GE, location = InstructionLocation.MatchAfterWithin(0)),
        literal(9, listOf(Opcode.CONST_16)),
        methodCall(
            definingClass = "Lh2/u0;",
            name = "a",
            parameters = listOf("Landroid/view/View;"),
            returnType = "Lh2/u0;"
        ),
        methodCall(
            definingClass = "Lh2/u0;",
            name = "b",
            parameters = listOf(),
            returnType = "Landroid/widget/RelativeLayout;"
        ),
        literal(19, listOf(Opcode.CONST_16))
    )
)
