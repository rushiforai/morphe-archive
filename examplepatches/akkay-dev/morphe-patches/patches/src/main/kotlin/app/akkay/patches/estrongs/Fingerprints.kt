package app.akkay.patches.estrongs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the primary runtime VIP entitlement coordinator in ES File Explorer:
 * Method: public t()Z in class es.po4
 *
 * Smali anchor:
 *   sget-boolean v0, Lcom/estrongs/android/pop/TestActivity;->j:Z
 *   invoke-static {}, Les/vl4;->L0()Les/vl4;
 *   invoke-virtual {v0}, Les/vl4;->G2()Z
 *   return v0
 */
object VipCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_BOOLEAN,
            definingClass = "Lcom/estrongs/android/pop/TestActivity;",
            type = "Z"
        ),
        opcode(Opcode.INVOKE_STATIC),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.INVOKE_VIRTUAL),
        opcode(Opcode.MOVE_RESULT),
        opcode(Opcode.RETURN)
    )
)

/**
 * Matches the AccountInfo model getter:
 * Method: public getIsVip()Z in class com.estrongs.android.pop.app.account.model.AccountInfo
 *
 * Smali anchor:
 *   iget-boolean v0, p0, Lcom/estrongs/android/pop/app/account/model/AccountInfo;->isVip:Z
 *   return v0
 */
object AccountInfoVipFingerprint : Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/account/model/AccountInfo;",
    name = "getIsVip",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z"
        )
    )
)
