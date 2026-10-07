package app.twoeno.patches.untappd.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.twoeno.patches.shared.Constants.COMPATIBILITY_UNTAPPD
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.replaceReturnedObjects

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/untappd/HideSponsoredContentPatch;"

internal object InterceptorChainProceedFingerprint : Fingerprint(
    definingClass = "Lokhttp3/internal/http/RealInterceptorChain;",
    name = "proceed",
    returnType = "Lokhttp3/Response;",
    parameters = listOf("Lokhttp3/Request;"),
)

@Suppress("unused")
val hideSponsoredContentPatch = bytecodePatch(
    name = "Hide sponsored content",
    description = "Removes sponsored beers, venues and posts from all lists.",
) {
    compatibleWith(COMPATIBILITY_UNTAPPD)

    extendWith(EXTENSION)

    execute {
        InterceptorChainProceedFingerprint.method.replaceReturnedObjects(
            "$EXTENSION_CLASS->filterResponse(Ljava/lang/Object;)Ljava/lang/Object;",
        )
    }
}
