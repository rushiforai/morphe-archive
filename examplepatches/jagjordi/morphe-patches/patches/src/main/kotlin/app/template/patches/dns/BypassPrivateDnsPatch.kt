package app.template.patches.dns

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val HELPER = "Lapp/template/extension/extension/DohDns;"

// OkHttp keeps its public class names in most R8 builds, but field and method names are
// renamed. The no-arg builder constructor is anchored on the store of the default
// system resolver into the builder's Dns-typed field.
val OkHttpClientBuilderConstructorFingerprint = Fingerprint(
    definingClass = "Lokhttp3/OkHttpClient\$Builder;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Lokhttp3/Dns;"),
    ),
)

// Extension helper replaced with a constant when the dohServer option is set.
val HelperDohServerFingerprint = Fingerprint(
    definingClass = HELPER,
    name = "getServer",
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val bypassPrivateDnsPatch = bytecodePatch(
    name = "Bypass private DNS",
    description = "Resolves the app's OkHttp requests with DNS over HTTPS sent directly to a " +
        "public resolver by IP address, so hosts blocked by the phone's private DNS " +
        "(for example map tile servers on an ad-blocking resolver) still load. Applies to " +
        "any app that bundles OkHttp with its class names intact.",
    default = false,
) {
    extendWith("extensions/extension.mpe")

    val dohServer by stringOption(
        key = "dohServer",
        default = "8.8.8.8",
        values = mapOf(
            "Google (8.8.8.8)" to "8.8.8.8",
            "Google secondary (8.8.4.4)" to "8.8.4.4",
            "Cloudflare (1.1.1.1)" to "1.1.1.1",
            "Cloudflare secondary (1.0.0.1)" to "1.0.0.1",
        ),
        title = "DNS over HTTPS resolver",
        description = "IP address of the DNS over HTTPS resolver to query. It must serve the " +
            "JSON API over HTTPS on its IP address, as Google and Cloudflare do.",
        required = false,
    )

    execute {
        OkHttpClientBuilderConstructorFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstruction(
                returnIndex,
                "invoke-static {p0}, $HELPER->install(Ljava/lang/Object;)V",
            )
        }

        dohServer?.trim()?.takeIf { it.isNotEmpty() }?.let { server ->
            HelperDohServerFingerprint.method.apply {
                clearBody()
                addInstructions(0, "const-string v0, \"$server\"\nreturn-object v0")
            }
        }
    }
}
