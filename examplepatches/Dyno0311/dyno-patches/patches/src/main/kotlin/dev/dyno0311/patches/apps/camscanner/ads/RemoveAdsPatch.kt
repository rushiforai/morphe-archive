package dev.dyno0311.patches.apps.camscanner.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.dyno0311.patches.apps.camscanner.camScannerCompatibility

/**
 * com.intsig.advertisement.interfaces.interceptor.InterceptorInterface.〇080(Context, Object, Object)Z
 *
 * The four built-in interceptors are called from ItemRequestHolder / AbsPositionAdapter before an ad request
 * is issued: `if (interceptor.check(...) != 0) return;`. Returning true from each interceptor therefore aborts
 * the request for app-launch, banner, doc-list, scan-done, page-list and source-level inventory without
 * removing any SDK or breaking view inflation.
 */
internal object AppInterceptorFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/advertisement/interfaces/interceptor/AppInterceptor;",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Object;", "Ljava/lang/Object;")
)

internal object PositionInterceptorFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/advertisement/interfaces/interceptor/PositionInterceptor;",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Object;", "Ljava/lang/Object;")
)

internal object ItemHolderInterceptorFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/advertisement/interfaces/interceptor/ItemHolderInterceptor;",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Object;", "Ljava/lang/Object;")
)

internal object SourceInterceptorFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/advertisement/interfaces/interceptor/SourceInterceptor;",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Object;", "Ljava/lang/Object;")
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    default = false,
    name = "Remove ads",
    description = "Blocks every CamScanner ad position at the interceptor choke point (app launch, main/share/page " +
        "banners, doc list, scan-done and rewarded inventory). Ad SDKs stay bundled but receive no requests."
) {
    compatibleWith(camScannerCompatibility)

    execute {
        AppInterceptorFingerprint.method.returnEarly(true)
        PositionInterceptorFingerprint.method.returnEarly(true)
        ItemHolderInterceptorFingerprint.method.returnEarly(true)
        SourceInterceptorFingerprint.method.returnEarly(true)
    }
}
