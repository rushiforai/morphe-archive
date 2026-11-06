package id.ikuradachi.patches.crunchyroll.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream

internal const val SOCKS_AUTHENTICATOR = "Lid/ikuradachi/extension/crunchyroll/proxy/SocksAuthenticator;"

// Host and credentials are validated before escaping these smali string delimiters.
internal fun String.smaliLiteral() = "\"" + replace("\\", "\\\\").replace("\"", "\\\"") + "\""

internal fun proxyAuthenticatorDex(host: String, port: Int, username: String, password: String): ByteArrayInputStream {
    fun method(name: String, flags: Int, registers: Int, returnType: String = "V", body: String): MutableMethod =
        MutableMethod(
            ImmutableMethod(
                SOCKS_AUTHENTICATOR,
                name,
                emptyList(),
                returnType,
                flags,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(registers),
            ),
        ).also { it.addInstructions(0, body.trimIndent()) }

    val methods = listOf(
        method(
            "<init>",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            1,
            body = """
                invoke-direct {p0}, Ljava/net/Authenticator;-><init>()V
                return-void
            """,
        ),
        // Class initialization installs once, including when token calls race on different threads.
        method(
            "<clinit>",
            AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
            1,
            body = """
                new-instance v0, $SOCKS_AUTHENTICATOR
                invoke-direct {v0}, $SOCKS_AUTHENTICATOR-><init>()V
                invoke-static {v0}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V
                return-void
            """,
        ),
        method(
            "ensureInstalled",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            0,
            body = "return-void",
        ),
        method(
            "getPasswordAuthentication",
            AccessFlags.PROTECTED.value,
            4,
            "Ljava/net/PasswordAuthentication;",
            """
                invoke-virtual {p0}, Ljava/net/Authenticator;->getRequestingHost()Ljava/lang/String;
                move-result-object v0
                const-string v1, ${host.smaliLiteral()}
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :unrelated

                invoke-virtual {p0}, Ljava/net/Authenticator;->getRequestingPort()I
                move-result v0
                const v1, $port
                if-ne v0, v1, :unrelated

                invoke-virtual {p0}, Ljava/net/Authenticator;->getRequestingProtocol()Ljava/lang/String;
                move-result-object v0
                const-string v1, "SOCKS5"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :unrelated

                const-string v0, ${password.smaliLiteral()}
                invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C
                move-result-object v1
                const-string v0, ${username.smaliLiteral()}
                new-instance v2, Ljava/net/PasswordAuthentication;
                invoke-direct {v2, v0, v1}, Ljava/net/PasswordAuthentication;-><init>(Ljava/lang/String;[C)V
                return-object v2

                :unrelated
                const/4 v0, 0x0
                return-object v0
            """,
        ),
    )
    val classDef = ImmutableClassDef(
        SOCKS_AUTHENTICATOR,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Ljava/net/Authenticator;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        methods,
    )
    val store = MemoryDataStore()
    try {
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(26), listOf(classDef)))
        return ByteArrayInputStream(store.data)
    } finally {
        store.close()
    }
}
