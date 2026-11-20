package id.ikuradachi.patches.crunchyroll.ui.splash

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object AnimatedSplashViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "L", "L"),
    filters = listOf(
        string("playbackProvider"),
    ),
)

fun createAnimatedSplashPlaybackProviderImplFingerprint(providerInterfaceType: String) = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;",
            name = "get",
            parameters = emptyList(),
            returnType = "Z",
        ),
    ),
    custom = { _, classDef ->
        providerInterfaceType in classDef.interfaces
    },
)

object RazorPayPreloadFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        newInstance("Landroid/webkit/WebView;"),
        string("https://api.razorpay.com/v1/checkout/public"),
        methodCall(
            definingClass = "Landroid/webkit/WebView;",
            name = "loadUrl",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "V",
        ),
    ),
)
