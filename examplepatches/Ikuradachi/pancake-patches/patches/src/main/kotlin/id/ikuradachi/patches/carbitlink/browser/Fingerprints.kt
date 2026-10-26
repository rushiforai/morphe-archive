package id.ikuradachi.patches.carbitlink.browser

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object BrowserVisibilityFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("sp_web_browser"),
        methodCall(
            name = "getInt",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "I"),
            returnType = "I",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)
