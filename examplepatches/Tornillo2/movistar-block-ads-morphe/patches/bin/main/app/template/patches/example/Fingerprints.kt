package app.template.patches.example

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object InitializePlayerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/net/Uri;",
        "J",
        "Z",
        "Lcom/movistarplus/androidtv/models/PlayerDataModel;",
        "Ljava/lang/String;"
    ),
    // Match by method name instead of a string literal constant in the bytecode.
    // "initializePlayer" is the method name, not an embedded string constant,
    // so `string(...)` would never find it.
    custom = { methodDef, classDef ->
        methodDef.name == "initializePlayer" &&
            classDef.type == "Lcom/movistarplus/androidtv/player/PlayerTV;"
    }
)
