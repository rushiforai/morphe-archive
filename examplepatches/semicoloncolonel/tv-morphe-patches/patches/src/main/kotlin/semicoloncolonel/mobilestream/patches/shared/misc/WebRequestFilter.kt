package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Apps that are a shell around a remote web app (the NBCU news apps and CNN on
// Android TV) send the web app's requests from the WebView itself, so they
// never pass through URL.openConnection or OkHttp. The one place an app can
// see them is WebViewClient.shouldInterceptRequest, which the WebView calls on
// a background thread for every request the page makes.
//
// filterWebRequests() gives the app's WebViewClient that method. The method
// asks each filter in turn and returns the first response; when every filter
// returns null, it falls through to WebViewClient's own answer, which is
// null, so the WebView loads the request normally. A second call for the same
// client (for example an ads filter after the analytics one) rebuilds the
// method with the new filter first. Inserting a check into the existing method
// would leave the earlier check's branch pointing into the new code.
//
// A client can define the method itself, as Cordova's SystemWebViewClient does
// to serve the app's local files. That method is kept under another name, and
// the added method falls through to it instead of to WebViewClient's.

private const val WEB_VIEW_CLIENT = "Landroid/webkit/WebViewClient;"
private const val INTERCEPT = "shouldInterceptRequest"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private val INTERCEPT_PARAMETERS = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;")
private const val INTERCEPT_SIGNATURE = "(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)$RESPONSE"
private const val APP_INTERCEPT = "shouldInterceptRequest\$app"

/**
 * Adds [filter] to [client]'s shouldInterceptRequest. [filter] is a full
 * static method reference taking a WebResourceRequest and returning a
 * WebResourceResponse, or null to let the request through.
 */
internal fun BytecodePatchContext.filterWebRequests(client: String, filter: String) {
    val classDef = mutableClassDefBy(client)
    if (classDef.superclass != WEB_VIEW_CLIENT) {
        throw PatchException("$client does not extend WebViewClient")
    }
    val existing = classDef.methods.firstOrNull { method ->
        method.name == INTERCEPT && method.returnType == RESPONSE &&
            method.parameterTypes.map { it.toString() } == INTERCEPT_PARAMETERS
    }
    // A method an earlier call added: its filters are its static calls, in
    // order, and it ends by calling WebViewClient's method or the app's.
    val earlier = existing?.let { method ->
        val instructions = method.implementation?.instructions?.toList()
            ?: throw PatchException("$client.$INTERCEPT has no code")
        val calls = instructions.filter { it.opcode == Opcode.INVOKE_STATIC }.map {
            val reference = (it as ReferenceInstruction).reference as MethodReference
            "${reference.definingClass}->${reference.name}(${reference.parameterTypes.joinToString("")})${reference.returnType}"
        }
        val fallsThrough = instructions.any { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER ||
                (instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).name == APP_INTERCEPT)
        }
        classDef.methods.remove(method)
        if (calls.isNotEmpty() && fallsThrough) {
            calls
        } else {
            // The app's own method: keep it under APP_INTERCEPT.
            classDef.methods.add(
                ImmutableMethod(
                    client,
                    APP_INTERCEPT,
                    method.parameters,
                    RESPONSE,
                    method.accessFlags,
                    null,
                    null,
                    method.implementation,
                ).toMutable(),
            )
            emptyList()
        }
    } ?: emptyList()
    val fallThrough = if (classDef.methods.any { it.name == APP_INTERCEPT }) {
        "invoke-virtual { p0, p1, p2 }, $client->$APP_INTERCEPT$INTERCEPT_SIGNATURE"
    } else {
        "invoke-super { p0, p1, p2 }, $WEB_VIEW_CLIENT->$INTERCEPT$INTERCEPT_SIGNATURE"
    }

    val checks = (listOf(filter) + earlier).withIndex().joinToString("\n") { (index, call) ->
        """
            invoke-static { p2 }, $call
            move-result-object v0
            if-eqz v0, :pass$index
            return-object v0
            :pass$index
            nop
        """.trimIndent()
    }

    // v0, then p0 (this), p1 (the WebView), and p2 (the request).
    val method = ImmutableMethod(
        client,
        INTERCEPT,
        INTERCEPT_PARAMETERS.map { ImmutableMethodParameter(it, null, null) },
        RESPONSE,
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(4),
    ).toMutable()
    method.addInstructions(
        0,
        """
            $checks
            $fallThrough
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
    classDef.methods.add(method)
}
