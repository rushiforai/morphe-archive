package app.epxec.patches.touchthenotch.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object TouchTheNotchPremiumFingerprint : Fingerprint(
   
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("L", "Ljava/util/List;"),

    filters = listOf(
        string("premium"),
        opcode(Opcode.IGET_BOOLEAN),
        methodCall(
            smali ="Landroid/content/SharedPreferences\$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences\$Editor;"
        ),
        string("settingsPref"),
        string("premsettingschanged")
    )
)