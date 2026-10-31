package app.starkist.patches.newyorker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * attachBaseContext of the app's base activity (re.t in 10.7.2), which every screen extends.
 * It sets fontScale to 1.0 to ignore the system font size, then applies the configuration.
 */
object BaseActivityAttachBaseContextFingerprint : Fingerprint(
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Landroid/content/res/Configuration;",
            name = "fontScale",
            opcode = Opcode.IPUT,
        ),
        methodCall(name = "applyOverrideConfiguration"),
    )
)

/**
 * AndroidX ResourcesCompat.loadFont (q4.g.b in 10.7.2). All of the app's fonts are files
 * in res/font, and both its View and Compose screens load them through this method.
 * Matches the call that creates a Typeface from a font file, and the line storing its result.
 */
object ResourcesCompatLoadFontFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf("Landroid/content/Context;", "I", "Landroid/util/TypedValue;", "I", "L", "Z", "Z"),
    filters = listOf(
        string("Failed to find font-family tag"),
        methodCall(
            returnType = "Landroid/graphics/Typeface;",
            parameters = listOf(
                "Landroid/content/Context;",
                "Landroid/content/res/Resources;",
                "I",
                "Ljava/lang/String;",
                "I",
            ),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    )
)

/**
 * Constructor of the WebViewClient used by the article screen
 * (de.h$c in 10.7.2, originally inside ArticleHtmlContentViewHolder).
 * Only used to locate the class; matched by two strings unique to it.
 */
object ArticleWebViewClientFingerprint : Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("L", "L", "L", "Landroid/webkit/WebView;", "L", "Ljava/lang/String;"),
    filters = listOf(
        string("appEnvironment"),
        string("/culture/cover-story/christoph-niemanns-enchanted-forest"),
    )
)

/** Called when an article page starts loading. */
object ArticleOnPageStartedFingerprint : Fingerprint(
    classFingerprint = ArticleWebViewClientFingerprint,
    name = "onPageStarted",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;"),
)

/** Called for every request the article page makes, including its stylesheet. */
object ArticleShouldInterceptRequestFingerprint : Fingerprint(
    classFingerprint = ArticleWebViewClientFingerprint,
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
)

/** Called when an article page has finished loading. */
object ArticleOnPageFinishedFingerprint : Fingerprint(
    classFingerprint = ArticleWebViewClientFingerprint,
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)
