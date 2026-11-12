package app.template.patches.polnews.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_POLNEWS
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val WEBVIEW = "Landroid/webkit/WebView;"
private const val CLIENT = "Landroid/webkit/WebViewClient;"
private const val REQUEST = "Landroid/webkit/WebResourceRequest;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"

/**
 * Politiken News renders articles with the Compose WebView component, which creates the WebView
 * and sets its own WebViewClient. The page's ads are the website's requests, so the SDK patches do
 * not apply. The app's client does not override shouldInterceptRequest; the patch adds that
 * override to it (delegating to super for non-ad URLs), so every other callback keeps working and
 * only the ad/tracking hosts are answered with an empty response.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Blocks the website's ad requests inside the article WebView.",
) {
    compatibleWith(COMPATIBILITY_POLNEWS)

    extendWith("extensions/webviewads.mpe")

    execute {
        val candidates = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/") || classDef.type.startsWith("Landroid") ||
                classDef.type.startsWith("Landroidx/") || classDef.type.startsWith("Lkotlin")
            ) {
                return@classDefForEach
            }
            classDef.methods.forEach { method ->
                val insns = method.implementation?.instructions?.toList() ?: return@forEach
                val createsWebView = insns.any {
                    it.opcode == Opcode.NEW_INSTANCE && it.typeOf() == WEBVIEW
                }
                val setsClient = insns.any { insn ->
                    val call = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == WEBVIEW && call.name == "setWebViewClient"
                }
                if (createsWebView && setsClient) candidates += classDef to method
            }
        }
        val (classDef, method) = candidates.singleOrNull() ?: throw PatchException(
            "expected one app WebView factory, found ${candidates.size}: " +
                candidates.joinToString { "${it.first.type}->${it.second.name}" },
        )

        val insns = method.implementation!!.instructions.toList()
        val callIndex = insns.indexOfFirst { insn ->
            val call = (insn as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == WEBVIEW && call.name == "setWebViewClient"
        }
        val call = insns[callIndex] as? FiveRegisterInstruction
            ?: throw PatchException("${classDef.type}->${method.name}: setWebViewClient is not a 35c invoke")
        if (call.registerCount != 2) {
            throw PatchException("${classDef.type}->${method.name}: setWebViewClient has ${call.registerCount} registers")
        }
        val clientRegister = call.registerD
        val loaderIndex = (callIndex - 1 downTo 0).firstOrNull { insns[it].writes(clientRegister) }
            ?: throw PatchException("${classDef.type}->${method.name}: no instruction loads the WebViewClient")
        val clientType = ((insns[loaderIndex] as? ReferenceInstruction)?.reference as? FieldReference)?.type
            ?: throw PatchException("${classDef.type}->${method.name}: the WebViewClient is not loaded from a field")
        val client = classDefByOrNull(clientType)
            ?: throw PatchException("$clientType not found")
        if (client.superclass != CLIENT) {
            throw PatchException("$clientType does not extend $CLIENT (super ${client.superclass})")
        }
        val mutableClient = mutableClassDefBy(clientType)
        val signature = listOf(WEBVIEW, REQUEST)
        if (mutableClient.methods.any {
                it.name == "shouldInterceptRequest" &&
                    it.parameterTypes.map(CharSequence::toString) == signature
            }
        ) {
            throw PatchException("$clientType already overrides shouldInterceptRequest(WebView, WebResourceRequest)")
        }

        val override = ImmutableMethod(
            clientType,
            "shouldInterceptRequest",
            signature.map { ImmutableMethodParameter(it, null, null) },
            RESPONSE,
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructionsWithLabelsChecked(
                0,
                """
                    invoke-virtual {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                    move-result-object v0
                    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                    move-result-object v0
                    invoke-static {v0}, Lapp/template/extension/webviewads/AdBlock;->isAdUrl(Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :continue
                    invoke-static {}, Lapp/template/extension/webviewads/AdBlock;->emptyResponse()Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    return-object v0
                    :continue
                    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    return-object v0
                """,
            )
        }
        mutableClient.methods.add(override)
    }
}

private fun Instruction.typeOf(): String? =
    ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Instruction.writes(register: Int): Boolean =
    opcode.setsRegister() && (this as? OneRegisterInstruction)?.registerA == register
