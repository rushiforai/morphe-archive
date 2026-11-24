package app.liquidmusic.patches.applemusic.layout.liquidglass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object BlurViewDrawFingerprint : Fingerprint(
    definingClass = "Leightbitlab/com/blurview/BlurView;",
    name = "draw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
    filters = listOf(
        methodCall(
            name = "draw",
            parameters = listOf("Landroid/graphics/Canvas;"),
            returnType = "V",
            opcode = Opcode.INVOKE_SUPER,
        ),
    ),
)
