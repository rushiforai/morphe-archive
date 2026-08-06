package app.stylus.patches.github.font

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object ResourcesCompatGetFontFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameters.size == 7 &&
            method.parameters[0].type == "Landroid/content/Context;" &&
            method.parameters[1].type == "I" &&
            method.parameters[2].type == "Landroid/util/TypedValue;" &&
            method.parameters[3].type == "I" &&
            method.parameters[5].type == "Z" &&
            method.parameters[6].type == "Z"
    }
)