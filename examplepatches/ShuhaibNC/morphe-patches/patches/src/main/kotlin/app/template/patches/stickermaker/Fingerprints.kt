package app.template.patches.stickermaker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object IsPremiumFingerPrint : Fingerprint(
    definingClass = "Lcom/marsvard/stickermakerforwhatsapp/DB\$Companion;",
    name = "isPremium",
    returnType = "Z",
    parameters = emptyList(),
)

object PremiumDialogShownFinger : Fingerprint(
    definingClass = "Lcom/marsvard/stickermakerforwhatsapp/DB\$Companion;",
    name = "premiumDialogShown",
    returnType = "Z",
    parameters = emptyList(),
)