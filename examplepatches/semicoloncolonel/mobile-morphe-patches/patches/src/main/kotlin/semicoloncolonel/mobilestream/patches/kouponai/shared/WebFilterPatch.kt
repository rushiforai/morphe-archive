package semicoloncolonel.mobilestream.patches.kouponai.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 opens each deal as a web page (cross-end.koupon.ai) in React
// Native's web view. That page's requests do not pass through React Native's
// networking, so React Native's web view clients get a shouldInterceptRequest
// that asks KouponWebFilter first, and their onPageFinished and
// doUpdateVisitedHistory call KouponWebFilter.onPage. The filter does nothing
// until a patch turns one of its switches on (blockTrackers, stopHistory,
// hideAi, hideTips, showCodes).
// ─────────────────────────────────────────────────────────────────────────────

internal const val KOUPON_WEB_FILTER = "Lsemicoloncolonel/mobilestream/extension/kouponai/web/KouponWebFilter;"
private const val WEB_VIEW_CLIENT = "Landroid/webkit/WebViewClient;"
private val INTERCEPT_PARAMETERS = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;")
private val PAGE_PARAMETERS = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")

internal val kouponWebFilterPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val clients = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/reactnativecommunity/webview/") &&
                classDef.superclass == WEB_VIEW_CLIENT &&
                classDef.methods.none { it.name == "shouldInterceptRequest" }
            ) {
                clients += classDef.type
            }
        }
        if (clients.isEmpty()) throw PatchException("Koupon: React Native web view client not found")
        clients.forEach { type ->
            val method = ImmutableMethod(
                type,
                "shouldInterceptRequest",
                INTERCEPT_PARAMETERS.map { ImmutableMethodParameter(it, null, null) },
                "Landroid/webkit/WebResourceResponse;",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(4),
            ).toMutable()
            method.addInstructions(
                0,
                """
                    invoke-static { p2 }, $KOUPON_WEB_FILTER->intercept(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    if-eqz v0, :pass
                    return-object v0
                    :pass
                    invoke-super { p0, p1, p2 }, $WEB_VIEW_CLIENT->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    return-object v0
                """,
            )
            mutableClassDefBy(type).methods.add(method)
        }

        // Page callbacks of the clients that define them: onPageFinished(view, url)
        // and doUpdateVisitedHistory(view, url, isReload).
        var hooked = 0
        clients.forEach { type ->
            mutableClassDefBy(type).methods.filter { method ->
                (method.name == "onPageFinished" && method.parameterTypes.map { it.toString() } == PAGE_PARAMETERS) ||
                    (method.name == "doUpdateVisitedHistory" &&
                        method.parameterTypes.map { it.toString() } == PAGE_PARAMETERS + "Z")
            }.forEach { method ->
                method.addInstructions(
                    0,
                    "invoke-static { p1, p2 }, $KOUPON_WEB_FILTER->onPage(Landroid/webkit/WebView;Ljava/lang/String;)V",
                )
                hooked++
            }
        }
        if (hooked == 0) throw PatchException("Koupon: web view page callbacks not found")
    }
}

private class WebFilterSwitchFingerprint(name: String) : Fingerprint(
    definingClass = KOUPON_WEB_FILTER,
    name = name,
    returnType = "Z",
)

/** Turns on one of KouponWebFilter's switches: blockTrackers, stopHistory, hideAi, hideTips or showCodes. */
internal fun BytecodePatchContext.enableWebFilter(switch: String) {
    WebFilterSwitchFingerprint(switch).method.returnEarly("const/4 v0, 0x1\nreturn v0")
}
