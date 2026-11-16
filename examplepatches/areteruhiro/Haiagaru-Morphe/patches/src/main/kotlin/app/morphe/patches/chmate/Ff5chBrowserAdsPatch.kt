package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.patchFf5chBrowserAds(version: String) {
    val type = when (version) {
        "0.8.10.191 dev" -> "Lo/onAppOpenAdLoaded\$IconCompatParcelizer;"
        "0.8.10.226 dev" -> "Lo/setFallbackResource\$ComponentActivity;"
        "0.8.10.242 dev" -> "Ljp/syoboi/a2chMate/fragment/WebViewFragment\$IconCompatParcelizer;"
        else -> return
    }
    val owner = mutableClassDefBy(type)
    val view = "Landroid/webkit/WebView;"
    val client = "Landroid/webkit/WebViewClient;"
    val request = "Landroid/webkit/WebResourceRequest;"
    val response = "Landroid/webkit/WebResourceResponse;"
    val extension = "Lapp/morphe/extension/chmate/Ff5chBrowserAds;"
    check(owner.superclass == client)
    for ((name, helper) in listOf("onPageStarted" to "started", "onPageFinished" to "finished")) {
        val callback = owner.methods.single { it.name == name && it.parameterTypes.take(2) == listOf(view, "Ljava/lang/String;") && it.returnType == "V" }
        callback.addInstructions(0, "invoke-static/range {p1 .. p2}, $extension->$helper(${view}Ljava/lang/String;)V")
    }
    check(owner.methods.none { it.name == "shouldInterceptRequest" })
    owner.methods.add(MutableMethod(ImmutableMethod(type, "shouldInterceptRequest",
        listOf(view, request).map { ImmutableMethodParameter(it, emptySet(), null) }, response, 1,
        emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())
    )).apply {
        addInstructions(0, """
            invoke-static {p1, p2}, $extension->intercept($view$request)$response
            move-result-object v0
            if-nez v0, :result
            invoke-super {p0, p1, p2}, $client->shouldInterceptRequest($view$request)$response
            move-result-object v0
            :result
            return-object v0
        """.trimIndent())
    })
}
