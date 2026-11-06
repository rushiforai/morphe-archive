package id.ikuradachi.patches.crunchyroll.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL
import java.net.URI
import java.util.function.Supplier

@Suppress("unused")
val tokenProxyPatch = bytecodePatch(
    name = "Proxy token requests",
    description = "Routes token acquisition and refresh through your SOCKS proxy, with optional proxy authentication.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    val proxyHost = stringOption(
        key = "proxyHost",
        title = "SOCKS proxy host",
        description = "Hostname or IP address only, without scheme, credentials, or port. Use brackets for IPv6.",
        required = true,
        validator = { value ->
            value != null && value.length in 1..253 && runCatching {
                URI("socks://$value").let {
                    it.host != null && it.rawUserInfo == null && it.rawAuthority == value && it.port == -1
                }
            }.getOrDefault(false)
        },
    )
    val proxyPort = stringOption(
        key = "proxyPort",
        title = "SOCKS proxy port",
        description = "Explicit port from 1 to 65535. Enter as a string when using a JSON options file.",
        required = true,
    )
    val proxyUsername = stringOption(
        key = "proxyUsername",
        title = "SOCKS proxy username",
        description = "Optional printable ASCII username (1–255 characters). Credentials are embedded in the patched APK. Leave both credential fields blank for no authentication.",
        required = false,
    )
    val proxyPassword = stringOption(
        key = "proxyPassword",
        title = "SOCKS proxy password",
        description = "Optional printable ASCII password (1–255 characters). Credentials are embedded in the patched APK. Supply both username and password together.",
        required = false,
    )
    val tokenDiagnostics = booleanOption(
        key = "tokenDiagnostics",
        default = false,
        title = "Local token diagnostics",
        description = "Logs token HTTP status and exception class names only, under MorpheTokenProxy. Enable for troubleshooting.",
    )

    fun host() = requireNotNull(proxyHost.value)

    // No default: CLI option conversion errors must not select an unintended endpoint.
    fun port() = requireNotNull(proxyPort.value?.toIntOrNull()?.takeIf { it in 1..65535 }) {
        "SOCKS proxy port must be an integer between 1 and 65535"
    }

    fun credentials(): Pair<String, String> {
        val username = proxyUsername.value.orEmpty()
        val password = proxyPassword.value.orEmpty()
        if (username.isBlank() && password.isBlank()) return "" to ""
        require(username.isNotBlank() && password.isNotBlank()) { "Supply both SOCKS proxy username and password" }
        require(listOf(username, password).all { value -> value.length in 1..255 && value.all { it.code in 0x20..0x7e } }) {
            "SOCKS proxy credentials must contain 1–255 printable ASCII characters each"
        }
        return username to password
    }

    extendWithAll(Supplier {
        val (username, password) = credentials()
        if (username.isEmpty()) emptyList() else listOf(Supplier {
            proxyAuthenticatorDex(host(), port(), username, password)
        })
    })

    execute {
        val host = host()
        val port = port()
        val (username, _) = credentials()
        val installAuthenticator = if (username.isEmpty()) "" else "invoke-static {}, $SOCKS_AUTHENTICATOR->ensureInstalled()V"
        val match = TokenCallFactoryFingerprint.matchAll(1..1).single()
        val classDef = match.classDef
        val helperName = "tokenProxyClient"
        check(classDef.methods.none { it.name == helperName }) { "Token proxy helper already exists" }

        val helper = MutableMethod(
            ImmutableMethod(
                classDef.type,
                helperName,
                listOf(
                    ImmutableMethodParameter("Lokhttp3/OkHttpClient;", emptySet(), null),
                    ImmutableMethodParameter("Lokhttp3/Request;", emptySet(), null),
                ),
                "Lokhttp3/OkHttpClient;",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(8),
            ),
        )
        helper.addInstructions(
            0,
            """
                invoke-virtual {p1}, Lokhttp3/Request;->method()Ljava/lang/String;
                move-result-object v1
                const-string v2, "POST"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :direct

                invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;
                move-result-object v0
                invoke-virtual {v0}, Lokhttp3/HttpUrl;->scheme()Ljava/lang/String;
                move-result-object v1
                const-string v2, "https"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :direct

                invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;
                move-result-object v1
                const-string v2, "www.crunchyroll.com"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :direct

                invoke-virtual {v0}, Lokhttp3/HttpUrl;->port()I
                move-result v1
                const/16 v2, 0x1bb
                if-ne v1, v2, :direct

                invoke-virtual {v0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;
                move-result-object v1
                const-string v2, "/auth/v1/token"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :direct

                $installAuthenticator
                invoke-virtual {p0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient${'$'}Builder;
                move-result-object v0
                new-instance v1, Ljava/net/Proxy;
                sget-object v2, Ljava/net/Proxy${'$'}Type;->SOCKS:Ljava/net/Proxy${'$'}Type;
                const-string v4, ${host.smaliLiteral()}
                const v5, $port
                invoke-static {v4, v5}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;
                move-result-object v3
                invoke-direct {v1, v2, v3}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy${'$'}Type;Ljava/net/SocketAddress;)V
                invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient${'$'}Builder;->proxy(Ljava/net/Proxy;)Lokhttp3/OkHttpClient${'$'}Builder;
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient${'$'}Builder;->followRedirects(Z)Lokhttp3/OkHttpClient${'$'}Builder;
                invoke-virtual {v0}, Lokhttp3/OkHttpClient${'$'}Builder;->build()Lokhttp3/OkHttpClient;
                move-result-object v0
                return-object v0

                :direct
                return-object p0
            """.trimIndent(),
        )
        classDef.methods.add(helper)
        match.method.addInstructions(
            match.instructionMatches[1].index,
            """
                invoke-static {p0, p1}, ${classDef.type}->$helperName(Lokhttp3/OkHttpClient;Lokhttp3/Request;)Lokhttp3/OkHttpClient;
                move-result-object p0
            """.trimIndent(),
        )

        if (tokenDiagnostics.value == true) {
            val errorMatch = TokenHttpErrorFingerprint.matchAll(1..1).single()
            val errorMethod = errorMatch.method
            val implementation = requireNotNull(errorMethod.implementation)
            val instructions = implementation.instructions
            val proceedIndex = errorMatch.instructionMatches[1].index
            val responseIndex = errorMatch.instructionMatches[2].index
            val conversionIndex = errorMatch.instructionMatches.last().index
            val transportIndex = conversionIndex - 1
            val proceed = instructions[proceedIndex] as? Instruction35c
            val response = instructions[proceedIndex + 1] as? OneRegisterInstruction
            val exception = instructions[conversionIndex - 3] as? OneRegisterInstruction
            val exceptionCopy = instructions[conversionIndex - 2] as? TwoRegisterInstruction
            check(
                implementation.registerCount == 14 && responseIndex == proceedIndex + 2 &&
                    proceed?.registerC == 13 && proceed.registerD == 1 &&
                    instructions[proceedIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT && response?.registerA == 13 &&
                    instructions[conversionIndex - 3].opcode == Opcode.MOVE_EXCEPTION && exception?.registerA == 0 &&
                    instructions[conversionIndex - 2].opcode == Opcode.MOVE_OBJECT &&
                    exceptionCopy?.registerA == 13 && exceptionCopy.registerB == 0 &&
                    instructions[transportIndex].opcode == Opcode.SGET_OBJECT,
            ) { "Unexpected token diagnostic interceptor shape" }
            val protectedCall = requireNotNull(implementation.tryBlocks.singleOrNull {
                it.start.location.index == proceedIndex && it.end.location.index == responseIndex &&
                    it.exceptionHandler.exceptionType == "Ljava/io/IOException;" &&
                    it.exceptionHandler.handler.location.index == conversionIndex - 3
            }) { "Unexpected token diagnostic exception range" }
            val errorClass = errorMatch.classDef
            check(errorClass.methods.none { it.name in listOf("logTokenStatus", "logTokenTransport") }) {
                "Token diagnostic helpers already exist"
            }
            val tokenGuard = """
                invoke-virtual {p0}, Lokhttp3/Request;->method()Ljava/lang/String;
                move-result-object v1
                const-string v2, "POST"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :done
                invoke-virtual {p0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;
                move-result-object v0
                invoke-virtual {v0}, Lokhttp3/HttpUrl;->scheme()Ljava/lang/String;
                move-result-object v1
                const-string v2, "https"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :done
                invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;
                move-result-object v1
                const-string v2, "www.crunchyroll.com"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :done
                invoke-virtual {v0}, Lokhttp3/HttpUrl;->port()I
                move-result v1
                const/16 v2, 0x1bb
                if-ne v1, v2, :done
                invoke-virtual {v0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;
                move-result-object v1
                const-string v2, "/auth/v1/token"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :done
            """.trimIndent()

            fun diagnosticMethod(name: String, argumentType: String, body: String): MutableMethod = MutableMethod(
                ImmutableMethod(
                    errorClass.type,
                    name,
                    listOf(
                        ImmutableMethodParameter("Lokhttp3/Request;", emptySet(), null),
                        ImmutableMethodParameter(argumentType, emptySet(), null),
                    ),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    emptySet(),
                    emptySet(),
                    MutableMethodImplementation(7),
                ),
            ).also { it.addInstructions(0, "$tokenGuard\n${body.trimIndent()}\n:done\nreturn-void") }

            errorClass.methods.add(diagnosticMethod(
                "logTokenStatus",
                "Lokhttp3/Response;",
                """
                    invoke-virtual {p1}, Lokhttp3/Response;->code()I
                    move-result v1
                    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                    move-result-object v1
                    const-string v0, "http_status="
                    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "MorpheTokenProxy"
                    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                """,
            ))
            errorClass.methods.add(diagnosticMethod(
                "logTokenTransport",
                "Ljava/lang/Throwable;",
                """
                    new-instance v0, Ljava/lang/StringBuilder;
                    const-string v1, "transport="
                    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
                    move-object v1, p1
                    const/4 v3, 0x4
                    :cause
                    if-eqz v1, :log
                    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                    move-result-object v2
                    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
                    move-result-object v2
                    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    add-int/lit8 v3, v3, -0x1
                    if-eqz v3, :log
                    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;
                    move-result-object v1
                    if-eqz v1, :log
                    const-string v2, " cause="
                    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    goto :cause
                    :log
                    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "MorpheTokenProxy"
                    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                """,
            ))
            errorMethod.addInstructions(
                transportIndex,
                "invoke-static {v1, p1}, ${errorClass.type}->logTokenTransport(Lokhttp3/Request;Ljava/lang/Throwable;)V",
            )
            errorMethod.addInstructions(
                responseIndex,
                "invoke-static {v1, p1}, ${errorClass.type}->logTokenStatus(Lokhttp3/Request;Lokhttp3/Response;)V",
            )
            // Insertion must not extend the existing proceed-only IOException range over logging.
            val endLabel = protectedCall.end
            check(endLabel.location.labels.remove(endLabel))
            implementation.instructions[responseIndex].location.labels.add(endLabel)
        }
    }
}
