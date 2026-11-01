package patches.medium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal val webPrivacy = bytecodePatch {
    dependsOn(webPrivacyExtension)
    execute {
        // Exact root client inventory in the pinned APK. Subclasses inherit these guards.
        for (type in setOf("Lv90;", "Le57;", "Lhcb;", "Lwnh;", "Ldfi;", "Lbx4;", "Ldoj;", "Lsprig/b/f;")) {
            val cls = Fingerprint(definingClass = type).matchAll(1..500).first().classDef
            check(cls.superclass == "Landroid/webkit/WebViewClient;") { "Web client inheritance changed: $type" }
            for (request in listOf("Landroid/webkit/WebResourceRequest;", "Ljava/lang/String;")) {
                val parameters = listOf("Landroid/webkit/WebView;", request)
                val result = "Landroid/webkit/WebResourceResponse;"
                val old = cls.methods.singleOrNull { it.name == "shouldInterceptRequest" && it.parameterTypes == parameters && it.returnType == result }
                val originalName = "mediumPrivacyInterceptRequest"
                check(cls.methods.none { it.name == originalName && it.parameterTypes == parameters }) { "Web privacy hook already present" }
                old?.setName(originalName)
                val fallback = if (old == null) "invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest" else "invoke-virtual {p0, p1, p2}, $type->$originalName"
                val url = if (request == "Ljava/lang/String;") "move-object v0, p2" else """
                    if-eqz p2, :allowed
                    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                    move-result-object v0
                    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                    move-result-object v0
                """.trimIndent()
                val method = MutableMethod(ImmutableMethod(type, "shouldInterceptRequest",
                    parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
                    AccessFlags.PUBLIC.value, emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
                method.addInstructions(0, """
                    $url
                    invoke-static {v0}, Lnl/johninnl/medium/privacy/WebPrivacy;->intercept(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    if-eqz v0, :allowed
                    return-object v0
                    :allowed
                    $fallback(Landroid/webkit/WebView;$request)$result
                    move-result-object v0
                    return-object v0
                """.trimIndent())
                cls.methods.add(method)
            }
        }
    }
}
