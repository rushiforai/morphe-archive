package app.bookspiko.patches.books.reader.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * `shouldInterceptRequest` of the reader WebViews (the off-screen paginator and the page spread).
 * It serves `http://<volume>.localhost/assets/<js>` and `/fonts/<file>` (the @font-face sources
 * declared by the reader's compiled.js) from the APK assets.
 */
internal object ReaderInterceptRequestFingerprint : Fingerprint(
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    filters = listOf(
        string("fonts/"),
        methodCall(smali = "Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;"),
        string("font/"),
        methodCall(smali = "Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;"),
    ),
)
