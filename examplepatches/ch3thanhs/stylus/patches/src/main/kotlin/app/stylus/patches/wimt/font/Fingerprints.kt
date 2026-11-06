package app.stylus.patches.wimt.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * ResourcesCompat.getFont(Context, int, TypedValue, int, FontCallback, boolean, boolean).
 *
 * This is the shared entry point used by both the Android View and Compose
 * font loaders in the app.
 */
internal object ResourcesCompatGetFontFingerprint : Fingerprint(
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.STATIC,
    ),
    returnType = "Landroid/graphics/Typeface;",
    custom = { method, _ ->
        method.parameters.size == 7 &&
            method.parameters[0].type == "Landroid/content/Context;" &&
            method.parameters[1].type == "I" &&
            method.parameters[2].type == "Landroid/util/TypedValue;" &&
            method.parameters[3].type == "I" &&
            method.parameters[5].type == "Z" &&
            method.parameters[6].type == "Z"
    },
)

/**
 * Track row binder.
 *
 * Resets the station name TextView to Typeface.DEFAULT, which discards the
 * theme font. The custom font patch removes that reset so station names follow
 * the same font as the rest of the UI.
 */
internal object TrackRowTypefaceFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name == "a" &&
            method.parameters.size == 2 &&
            method.parameters[0].type == "Lnpu;" &&
            method.parameters[1].type == "Ljava/util/List;"
    },
    filters = listOf(
        methodCall(smali = "Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V"),
    ),
)

/**
 * Compose's AndroidParagraphIntrinsics constructor.
 *
 * Its TextPaint is the single paint used to measure and lay out all Compose
 * text. It is created in this constructor, so the end of the constructor is a
 * safe place to apply font feature settings after the base SpanStyle has been
 * copied onto the paint.
 */
internal object ComposeParagraphConstructorFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name == "<init>" &&
            method.parameters.size == 7 &&
            method.parameters[0].type == "Ljava/lang/String;"
    },
    filters = listOf(
        methodCall(smali = "Ldnv;-><init>(F)V"),
    ),
)
