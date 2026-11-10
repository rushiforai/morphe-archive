package app.bin0culars.patches.reddit.misc.anonymousbrowsing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object IncognitoRevampEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        checkCast("Lcom/reddit/incognito/IncognitoRevampM1Variant;"),
        fieldAccess(
            definingClass = "Lcom/reddit/incognito/IncognitoRevampM1Variant;",
            name = "CONTROL",
        ),
        opcode(Opcode.IF_EQ),
    ),
)
