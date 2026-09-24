/*
 * Copyright 2026 pdscomp, KingOfPoptart, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.redgifswebview

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val IMAGE_VIEWER_FRAGMENT_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/ImageViewerFragment;"
internal const val WEBVIEW_FRAGMENT_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/WebViewFragment;"

// All failures in Sync's Redgifs Volley request chain reach this listener. Match the stable
// interface callback and outer fragment structure without relying on the inner class name.
internal val redgifsErrorListenerFingerprint = Fingerprint(
    name = "onErrorResponse",
    parameters = listOf("Lcom/android/volley/VolleyError;"),
    returnType = "V",
    custom = { _, classDef ->
        classDef.type.startsWith(IMAGE_VIEWER_FRAGMENT_CLASS.dropLast(1) + "$") &&
                classDef.fields.any { it.type == IMAGE_VIEWER_FRAGMENT_CLASS } &&
                classDef.fields.any { it.type == "Ljava/lang/String;" }
    },
)

internal val webViewClientOnPageFinishedFingerprint = Fingerprint(
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
    custom = { _, classDef ->
        classDef.type.startsWith(WEBVIEW_FRAGMENT_CLASS.dropLast(1) + "$")
    },
)

// Match onViewCreated by the cookie-clearing call rather than Sync's obfuscated method name.
internal val webViewFragmentOnViewCreatedFingerprint = Fingerprint(
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == WEBVIEW_FRAGMENT_CLASS && method.instructions.any {
            val reference = it.getReference<MethodReference>()
            reference?.definingClass == "Landroid/webkit/CookieManager;" &&
                    reference.name == "removeAllCookie"
        }
    },
)
