package app.template.patches.berlingske.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_BERLINGSKE
import app.template.patches.shared.Constants.COMPATIBILITY_BT
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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
 * Berlingske and B.T. are the same WebWrapper app (one binary, two packages): WrapperActivity creates the WebView, adds the JS bridge and sets
 * its own WebViewClient (a WebViewClientCompat subclass). The page's ad slots are the website's
 * requests, so the SDK patches do not apply. The app's client does not override
 * shouldInterceptRequest; the patch adds that override, delegating to super for non-ad URLs, so
 * every other callback keeps working and only ad/tracking hosts get an empty response.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Blocks the website's ad requests inside the article WebView.",
) {
    compatibleWith(COMPATIBILITY_BERLINGSKE, COMPATIBILITY_BT)

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
                val addsBridge = insns.any { insn ->
                    val call = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == WEBVIEW && call.name == "addJavascriptInterface"
                }
                val setsClient = insns.any { insn ->
                    val call = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == WEBVIEW && call.name == "setWebViewClient"
                }
                if (addsBridge && setsClient) candidates += classDef to method
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
        val loader = insns[loaderIndex]
        val clientType = when (loader.opcode) {
            Opcode.NEW_INSTANCE -> (loader.typeOf())
            Opcode.IGET_OBJECT -> ((loader as? ReferenceInstruction)?.reference as? FieldReference)?.type
            else -> null
        } ?: throw PatchException("${classDef.type}->${method.name}: cannot resolve the WebViewClient type")
        val client = classDefByOrNull(clientType)
            ?: throw PatchException("$clientType not found")
        val clientSuper = client.superclass ?: throw PatchException("$clientType has no superclass")
        if (!isWebViewClient(clientSuper)) {
            throw PatchException("$clientType does not extend a WebViewClient (super $clientSuper)")
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
                    invoke-super {p0, p1, p2}, $clientSuper->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    return-object v0
                """,
            )
        }
        mutableClient.methods.add(override)
    }
}

private fun BytecodePatchContext.isWebViewClient(type: String): Boolean =
    type == CLIENT ||
        generateSequence(type) { classDefByOrNull(it)?.superclass }
            .take(8)
            .any { it == CLIENT }

private fun Instruction.typeOf(): String? =
    ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Instruction.writes(register: Int): Boolean =
    opcode.setsRegister() && (this as? OneRegisterInstruction)?.registerA == register
