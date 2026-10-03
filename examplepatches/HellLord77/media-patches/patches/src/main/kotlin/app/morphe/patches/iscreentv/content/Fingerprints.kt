package app.morphe.patches.iscreentv.content

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object GetPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/playoffstudio/modelmodule/",
    name = "getPremium",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)

object GetTvodFingerprint : Fingerprint(
    definingClass = "Lcom/playoffstudio/modelmodule/",
    name = "getTvod",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)