package app.stylus.patches.telegram.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Telegram's central bundled-font loader.
 *
 * Current Telegram source:
 *
 * public static Typeface getTypeface(String assetPath)
 *
 * The implementation uses Typeface.Builder on API 26+ and
 * Typeface.createFromAsset() on older Android versions.
 */
internal object AndroidUtilitiesGetTypefaceFingerprint : Fingerprint(
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.STATIC,
    ),
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf(
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(
            smali =
                "Landroid/graphics/Typeface\$Builder;->build()" +
                    "Landroid/graphics/Typeface;"
        ),
    ),
    strings = listOf(
        "rextrabold",
        "rbold",
        "italic",
    ),
)