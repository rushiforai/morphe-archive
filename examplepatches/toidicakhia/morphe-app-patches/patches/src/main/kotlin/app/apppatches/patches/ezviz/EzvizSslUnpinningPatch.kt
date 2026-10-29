package app.apppatches.patches.ezviz

import app.apppatches.patches.shared.Constants.EZVIZ_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

private const val PATCH = "Bypass SSL pinning"
private const val NETWORK_SECURITY_CONFIG = "res/xml/network_security_config.xml"

private val trustUserCertificatesPatch = resourcePatch(description = "Trust user-added certificates") {
    execute {
        document(NETWORK_SECURITY_CONFIG).use { config ->
            val root = config.documentElement
                ?: throw PatchException("$PATCH: $NETWORK_SECURITY_CONFIG has no root element")
            val anchors = root.getElementsByTagName("trust-anchors")
            if (anchors.length == 0) {
                throw PatchException("$PATCH: $NETWORK_SECURITY_CONFIG has no trust-anchors element")
            }
            for (index in 0 until anchors.length) {
                val set = anchors.item(index) as? Element ?: continue
                val certificates = set.getElementsByTagName("certificates")
                val user = (0 until certificates.length)
                    .mapNotNull { certificates.item(it) as? Element }
                    .firstOrNull { it.getAttribute("src") == "user" }
                    ?: config.createElement("certificates").also {
                        it.setAttribute("src", "user")
                        set.appendChild(it)
                    }
                user.setAttribute("overridePins", "true")
            }
        }
    }
}

private fun BytecodePatchContext.replaceMethodBody(
    classDef: MutableClass,
    method: MutableMethod,
    registers: Int,
    smali: String,
) {
    val replacement = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameters,
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructions(0, smali) }

    classDef.methods.remove(method)
    classDef.methods.add(replacement)
}

private fun BytecodePatchContext.replaceMethodBody(method: MutableMethod, registers: Int, smali: String) {
    replaceMethodBody(mutableClassDefBy(method.definingClass), method, registers, smali)
}

private fun ReferenceInstruction.isCallTo(owner: String, name: String): Boolean {
    val reference = reference as? MethodReference ?: return false
    return reference.definingClass == owner && reference.name == name
}

@Suppress("unused")
val ezvizSslUnpinningPatch = bytecodePatch(
    name = PATCH,
    description = "Bypasses EZVIZ certificate pinning and hostname checks so a debugging proxy can read its " +
        "HTTPS traffic. Also trusts user-installed certificates. Not selected by default.",
    default = false
) {
    compatibleWith(EZVIZ_COMPATIBILITY)
    dependsOn(ezvizSignatureCheckPatch)
    dependsOn(trustUserCertificatesPatch)

    execute {
        EzvizSslParamsFingerprint.match().method.apply {
            replaceMethodBody(
                this,
                registers = 1,
                smali = """
                    invoke-static {}, Lcom/ezplayer/http/core/client/HttpsUtils;->getSslSocketFactory()Lcom/ezplayer/http/core/client/HttpsUtils${'$'}SSLParams;
                    move-result-object v0
                    return-object v0
                """.trimIndent()
            )
        }

        EzvizHostnameVerifierFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "const/4 v0, 0x1\nreturn v0")
        }

        EzvizStreamTlsVerifierFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "const/4 v0, 0x0\nreturn v0")
        }

        EzvizVideoTalkTlsVerifierFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "const/4 v0, 0x0\nreturn v0")
        }

        OkHttpCertificatePinnerCheckFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "return-void")
        }

        EzvizLegacyHttpClientConstructorFingerprint.match().method.apply {
            val builderIndex = instructions.indexOfFirst {
                it is ReferenceInstruction && it.isCallTo("Lokhttp3/OkHttpClient\$Builder;", "<init>")
            }
            if (builderIndex == -1) {
                throw PatchException("$PATCH: ${definingClass}-><init> never creates an OkHttpClient.Builder")
            }
            addInstructions(
                builderIndex + 1,
                """
                    invoke-static {}, Lcom/videogo/util/HttpsUtils;->a()Lcom/videogo/util/HttpsUtils${'$'}SSLParams;
                    move-result-object v1
                    iget-object v1, v1, Lcom/videogo/util/HttpsUtils${'$'}SSLParams;->a:Ljavax/net/ssl/SSLSocketFactory;
                    sget-object v2, Lcom/videogo/util/HttpsUtils;->a:Ljavax/net/ssl/X509TrustManager;
                    invoke-virtual {v0, v1, v2}, Lokhttp3/OkHttpClient${'$'}Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient${'$'}Builder;
                    sget-object v1, Lcom/videogo/util/HttpsUtils;->b:Ljavax/net/ssl/HostnameVerifier;
                    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient${'$'}Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient${'$'}Builder;
                """.trimIndent()
            )
        }
    }
}
