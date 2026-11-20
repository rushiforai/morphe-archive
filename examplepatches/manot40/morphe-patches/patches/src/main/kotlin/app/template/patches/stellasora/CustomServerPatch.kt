package app.template.patches.stellasora

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_STELLA_SORA
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.io.File

private const val TRUST_ALL_MANAGER_CLASS = "Lcom/yostar/airisdk/core/net/NetClientManage\$1;"
private const val CUSTOM_PROVIDER_CLASS = "Lcom/YoStarEN/StellaSora/BuildConfig;"
private const val CUSTOM_TMF_SPI_CLASS = "Lcom/unity3d/player/BuildConfig;"

private fun createMutableMethod(
    definingClass: String,
    name: String,
    parameterTypes: List<String>,
    returnType: String,
    accessFlags: Int,
    registerCount: Int,
    smali: String
): MutableMethod = MutableMethod(
    ImmutableMethod(
        definingClass,
        name,
        parameterTypes.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        accessFlags,
        null,
        null,
        MutableMethodImplementation(registerCount)
    )
).apply {
    addInstructions(0, smali.trimIndent())
}

@Suppress("unused")
val customServerPatch = patch(
    name = "Custom server",
    description = "Replaces Stella Sora API endpoints with a custom server domain and bypasses X509TrustManager certificate checks.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STELLA_SORA)

    val serverDomainOption = stringOption(
        key = "serverDomain",
        default = "stellasora.local",
        title = "Server domain",
        description = "Custom domain to replace nova.stellasora.global and en-sdk-api.yostarplat.com.",
        required = true
    ) {
        !it.isNullOrBlank()
    }

    execute {
        val domain = serverDomainOption.value!!
            .trim()
            .removePrefix("https://")
            .removePrefix("http://")
            .trimEnd('/')

        // 1. Replace domains in assets/SDKConfigSettings.json
        val sdkConfigFile = resourceFile("assets/SDKConfigSettings.json")
        if (!sdkConfigFile.exists()) {
            throw PatchException("assets/SDKConfigSettings.json not found in APK")
        }
        val updatedJson = sdkConfigFile.readText()
            .replace("nova.stellasora.global", domain)
            .replace("en-sdk-api.yostarplat.com", domain)
        sdkConfigFile.writeText(updatedJson)

        // 2. Configure network_security_config.xml in AndroidManifest.xml
        var networkSecurityFileName = "network_security_config.xml"
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()
            val config = application.attribute("android:networkSecurityConfig")
            if (config != null && config.contains("/")) {
                networkSecurityFileName = config.substringAfter("/") + ".xml"
            } else {
                application.setAttribute("android:networkSecurityConfig", "@xml/network_security_config")
            }
        }
        File(resourceFile("res/xml"), networkSecurityFileName).writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <network-security-config>
                <base-config cleartextTrafficPermitted="true">
                    <trust-anchors>
                        <certificates src="system" />
                        <certificates src="user" overridePins="true" />
                    </trust-anchors>
                </base-config>
                <debug-overrides>
                    <trust-anchors>
                        <certificates src="system" />
                        <certificates src="user" overridePins="true" />
                    </trust-anchors>
                </debug-overrides>
            </network-security-config>
            """.trimIndent()
        )

        // 3. Expose Yostar's built-in trust-all X509TrustManager (NetClientManage$1) and add 3-arg checkServerTrusted
        mutableClassDefBy(TRUST_ALL_MANAGER_CLASS).apply {
            setAccessFlags((accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value)
            methods.first { it.name == "<init>" }.apply {
                setAccessFlags((accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value)
            }
            methods.add(
                createMutableMethod(
                    definingClass = TRUST_ALL_MANAGER_CLASS,
                    name = "checkServerTrusted",
                    parameterTypes = listOf(
                        "[Ljava/security/cert/X509Certificate;",
                        "Ljava/lang/String;",
                        "Ljava/lang/String;"
                    ),
                    returnType = "Ljava/util/List;",
                    accessFlags = AccessFlags.PUBLIC.value,
                    registerCount = 4,
                    smali = """
                        if-nez p1, :cond_0
                        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                        move-result-object p1
                        return-object p1
                        :cond_0
                        invoke-static { p1 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
                        move-result-object p1
                        return-object p1
                    """
                )
            )
        }

        NetClientManageSetOkHttpSslFingerprint.method.apply {
            setAccessFlags((accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value)
        }

        // 4. Configure every OkHttpClient$Builder instance to use setOkHttpSsl (trust-all X509TrustManager)
        OkHttpClientBuilderInitFingerprint.method.apply {
            addInstruction(
                instructions.lastIndex,
                "invoke-static { p0 }, Lcom/yostar/airisdk/core/net/NetClientManage;->setOkHttpSsl(Lokhttp3/OkHttpClient\$Builder;)Lokhttp3/OkHttpClient\$Builder;"
            )
        }

        // 5. Return trust-all X509TrustManager from OkHttp Platform.platformTrustManager()
        OkHttpPlatformTrustManagerFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, $TRUST_ALL_MANAGER_CLASS
                invoke-direct { v0 }, $TRUST_ALL_MANAGER_CLASS-><init>()V
                return-object v0
            """
        )

        // 6. Bypass AndroidCertificateChainCleaner.clean() (X509TrustManagerExtensions.checkServerTrusted)
        AndroidCertificateChainCleanerCleanFingerprint.method.addInstruction(
            0,
            "return-object p1"
        )

        // 7. Bypass OkHostnameVerifier.verify() for self-signed certs with mismatched SAN/CN
        val returnTrueSmali = """
            const/4 v0, 0x1
            return v0
        """
        OkHostnameVerifierVerifySessionFingerprint.method.addInstructions(0, returnTrueSmali)
        OkHostnameVerifierVerifyCertFingerprint.method.addInstructions(0, returnTrueSmali)

        // 8. Bypass X509TrustManager & HostnameVerifier in Yostar volley HttpsURLConnection (SSLSocketFactoryCompat)
        VolleySslSocketFactoryCompatInitFingerprint.method.addInstructions(
            1,
            """
                new-instance v0, $TRUST_ALL_MANAGER_CLASS
                invoke-direct { v0 }, $TRUST_ALL_MANAGER_CLASS-><init>()V
                new-instance v1, Lcom/yostar/airisdk/core/net/SSLSocketFactoryCompat;
                invoke-direct { v1, v0 }, Lcom/yostar/airisdk/core/net/SSLSocketFactoryCompat;-><init>(Ljavax/net/ssl/X509TrustManager;)V
                iput-object v1, p0, Lcom/yostar/airisdk/core/net/volley/SSLSocketFactoryCompat;->delegate:Ljavax/net/ssl/SSLSocketFactory;
                sget-object v0, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;
                invoke-static { v0 }, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
                return-void
            """
        )

        // 9. Repurpose unused BuildConfig classes as TrustManagerFactorySpi + Security Provider for Unity JNI & process-wide SSL bypass
        mutableClassDefBy(CUSTOM_TMF_SPI_CLASS).apply {
            setSuperClass("Ljavax/net/ssl/TrustManagerFactorySpi;")
            methods.clear()
            methods.add(
                createMutableMethod(
                    definingClass = CUSTOM_TMF_SPI_CLASS,
                    name = "<init>",
                    parameterTypes = emptyList(),
                    returnType = "V",
                    accessFlags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
                    registerCount = 1,
                    smali = """
                        invoke-direct { p0 }, Ljavax/net/ssl/TrustManagerFactorySpi;-><init>()V
                        return-void
                    """
                )
            )
            methods.add(
                createMutableMethod(
                    definingClass = CUSTOM_TMF_SPI_CLASS,
                    name = "engineInit",
                    parameterTypes = listOf("Ljava/security/KeyStore;"),
                    returnType = "V",
                    accessFlags = AccessFlags.PROTECTED.value,
                    registerCount = 2,
                    smali = "return-void"
                )
            )
            methods.add(
                createMutableMethod(
                    definingClass = CUSTOM_TMF_SPI_CLASS,
                    name = "engineInit",
                    parameterTypes = listOf("Ljavax/net/ssl/ManagerFactoryParameters;"),
                    returnType = "V",
                    accessFlags = AccessFlags.PROTECTED.value,
                    registerCount = 2,
                    smali = "return-void"
                )
            )
            methods.add(
                createMutableMethod(
                    definingClass = CUSTOM_TMF_SPI_CLASS,
                    name = "engineGetTrustManagers",
                    parameterTypes = emptyList(),
                    returnType = "[Ljavax/net/ssl/TrustManager;",
                    accessFlags = AccessFlags.PROTECTED.value,
                    registerCount = 4,
                    smali = """
                        const/4 v0, 0x1
                        new-array v0, v0, [Ljavax/net/ssl/TrustManager;
                        new-instance v1, $TRUST_ALL_MANAGER_CLASS
                        invoke-direct { v1 }, $TRUST_ALL_MANAGER_CLASS-><init>()V
                        const/4 v2, 0x0
                        aput-object v1, v0, v2
                        return-object v0
                    """
                )
            )
        }

        mutableClassDefBy(CUSTOM_PROVIDER_CLASS).apply {
            setSuperClass("Ljava/security/Provider;")
            methods.clear()
            methods.add(
                createMutableMethod(
                    definingClass = CUSTOM_PROVIDER_CLASS,
                    name = "<init>",
                    parameterTypes = emptyList(),
                    returnType = "V",
                    accessFlags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
                    registerCount = 4,
                    smali = """
                        const-string v0, "AndroidNSSP"
                        const-wide/high16 v1, 0x3ff0000000000000L
                        invoke-direct { p0, v0, v1, v2, v0 }, Ljava/security/Provider;-><init>(Ljava/lang/String;DLjava/lang/String;)V
                        const-string v0, "TrustManagerFactory.PKIX"
                        const-string v1, "com.unity3d.player.BuildConfig"
                        invoke-virtual { p0, v0, v1 }, Ljava/security/Provider;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                        const-string v0, "TrustManagerFactory.X509"
                        invoke-virtual { p0, v0, v1 }, Ljava/security/Provider;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                        return-void
                    """
                )
            )
        }

        mutableClassDefBy("Lcom/yostar/airisdk/core/net/NetClientManage;").apply {
            methods.add(
                createMutableMethod(
                    definingClass = "Lcom/yostar/airisdk/core/net/NetClientManage;",
                    name = "installTrustAll",
                    parameterTypes = emptyList(),
                    returnType = "V",
                    accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    registerCount = 4,
                    smali = """
                        const-string v0, "AndroidNSSP"
                        invoke-static { v0 }, Ljava/security/Security;->removeProvider(Ljava/lang/String;)V
                        new-instance v0, $CUSTOM_PROVIDER_CLASS
                        invoke-direct { v0 }, $CUSTOM_PROVIDER_CLASS-><init>()V
                        const/4 v1, 0x1
                        invoke-static { v0, v1 }, Ljava/security/Security;->insertProviderAt(Ljava/security/Provider;I)I
                        new-array v0, v1, [Ljavax/net/ssl/TrustManager;
                        new-instance v1, $TRUST_ALL_MANAGER_CLASS
                        invoke-direct { v1 }, $TRUST_ALL_MANAGER_CLASS-><init>()V
                        const/4 v2, 0x0
                        aput-object v1, v0, v2
                        const-string v1, "TLS"
                        invoke-static { v1 }, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
                        move-result-object v1
                        new-instance v2, Ljava/security/SecureRandom;
                        invoke-direct { v2 }, Ljava/security/SecureRandom;-><init>()V
                        const/4 v3, 0x0
                        invoke-virtual { v1, v3, v0, v2 }, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
                        invoke-static { v1 }, Ljavax/net/ssl/SSLContext;->setDefault(Ljavax/net/ssl/SSLContext;)V
                        invoke-virtual { v1 }, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
                        move-result-object v0
                        invoke-static { v0 }, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
                        sget-object v0, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;
                        invoke-static { v0 }, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
                        return-void
                    """
                )
            )
        }

        // 10. Install trust-all provider and SSL defaults before UnityPlayer initializes libunity.so
        UnityPlayerActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lcom/yostar/airisdk/core/net/NetClientManage;->installTrustAll()V"
        )
    }
}
