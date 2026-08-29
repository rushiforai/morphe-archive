package app.stylus.patches.instagram.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object ResourcesCompatGetFontFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    filters = listOf(
        string("ResourcesCompat"),
        string("res/"),
    ),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameters.size == 7 &&
            method.parameters[0].type == "Landroid/content/Context;" &&
            method.parameters[1].type == "Landroid/util/TypedValue;" &&
            method.parameters[2].type.startsWith("L") &&
            method.parameters[3].type == "I" &&
            method.parameters[4].type == "I" &&
            method.parameters[5].type == "Z" &&
            method.parameters[6].type == "Z"
    },
)

internal object ReactNativeFontRegistrationFingerprint : Fingerprint(
    strings = listOf("Optimistic VF App Lite "),
    custom = { method, _ ->
        method.parameters.isEmpty() && method.returnType.startsWith("L")
    },
)