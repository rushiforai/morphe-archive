package patches.abrp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val HOST_VALIDATOR = "LJ0/b;"
private const val HOST_INFO = "Landroidx/car/app/v;"

/**
 * ABRP ships the Android Auto Car App Library. `CarAppBinder.onHandshakeCompleted` resolves the
 * caller through `HostValidator`, and the default validator only accepts the host certificates
 * the library knows about. Any other car app host - a third-party head unit, a self-built
 * projection bridge - is rejected with "Unknown host '...'" before a session is created.
 *
 * Only the verdict is replaced: the handshake still resolves the calling package and UID, and
 * the session, template and navigation code paths are untouched.
 */
@Suppress("unused")
val customAndroidAutoHosts = bytecodePatch(
    name = "Allow custom Android Auto hosts",
    description = "Lets any car app host complete the Android Auto handshake instead of only the " +
        "hosts the bundled library already trusts, so the app also runs on third-party head " +
        "units and projection bridges.",
) {
    compatibleWith(abrp)
    dependsOn(originalInput)

    execute {
        val owner = mutableClassDefBy(HOST_VALIDATOR)
        val method = owner.methods.singleOrNull { candidate ->
            candidate.name == "b" &&
                candidate.returnType == "Z" &&
                candidate.parameterTypes.map(CharSequence::toString) == listOf(HOST_INFO)
        } ?: throw IllegalStateException("ABRP host validator changed")

        // Answer "this host is valid" before the allow-list lookup runs. The remaining
        // instructions stay in place and are simply unreachable.
        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
