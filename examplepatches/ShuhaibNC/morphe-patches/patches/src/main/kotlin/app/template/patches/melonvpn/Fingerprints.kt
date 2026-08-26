package app.template.patches.melonvpn

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object IsVipOneFingerprint : Fingerprint(
    definingClass = "Lcom/yolo/iap/server/response/VipStatusResponse;",
    name = "isVip",
    returnType = "Z",
    parameters = emptyList(),
)

object IsVipTwoFingerprint : Fingerprint(
    definingClass = "Lcom/github/shadowsocks/database/Profile;",
    name = "isVip",
    returnType = "Z",
    parameters = emptyList(),
)