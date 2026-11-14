package app.apppatches.patches.devolutions

import app.apppatches.patches.shared.Constants.RDM_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Disable SSL Pinning"

private fun BytecodePatchContext.replaceMethodBody(method: MutableMethod, registers: Int, smali: String) {
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

    val classDef = mutableClassDefBy(method.definingClass)
    classDef.methods.remove(method)
    classDef.methods.add(replacement)
}

/**
 * Empties every X509TrustManager callback the .NET/Mono runtime installs. The
 * runtime only needs the callbacks not to throw, the handshake itself is still
 * performed by the SSLSocket. Pinning implemented in managed code keeps working.
 */
private val rdmTrustManagerBypassBytecodePatch = bytecodePatch(
    description = "Stops the .NET and Mono trust managers from rejecting certificates."
) {
    compatibleWith(RDM_COMPATIBILITY)

    execute {
        DotnetProxyTrustManagerFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "return-void")
        }

        DotnetProxyClientTrustManagerFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "return-void")
        }

        XamarinTrustManagerCheckServerTrustedFingerprint.match().method.apply {
            replaceMethodBody(this, registers = 3, smali = "return-void")
        }
    }
}

@Suppress("unused")
val rdmDisableSslPinningPatch = bytecodePatch(
    name = PATCH,
    description = "Bypasses the certificate validation of the .NET/Mono TLS stack so a debugging proxy " +
        "can read the app's HTTPS traffic. Certificate pinning implemented in managed code lives in " +
        "the ahead-of-time compiled .NET assemblies and is not affected. Not selected by default.",
    default = false
) {
    compatibleWith(RDM_COMPATIBILITY)
    dependsOn(rdmTrustManagerBypassBytecodePatch)
}
