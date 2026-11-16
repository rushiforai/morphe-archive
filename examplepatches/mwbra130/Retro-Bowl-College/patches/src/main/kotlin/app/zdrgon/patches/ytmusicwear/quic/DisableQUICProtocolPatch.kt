package app.zdrgon.patches.ytmusicwear.quic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR
import com.android.tools.smali.dexlib2.AccessFlags

// ── Cronet QUIC switch — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// The official Morphe "Disable QUIC protocol" patch (shared/misc/quic)
// fingerprints CronetEngine$Builder.enableQuic(Z) and
// ExperimentalCronetEngine$Builder.enableQuic(Z). The Wear build
// bundles Cronet under its real library names (146 org/chromium/net
// classes), and both methods resolve exactly (verified by dex scan on
// 2026-11-15, REPORT6): public, (Z) -> builder.

object CronetEngineBuilderEnableQuicFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/net/CronetEngine\$Builder;",
    name = "enableQuic",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lorg/chromium/net/CronetEngine\$Builder;",
    parameters = listOf("Z")
)

object ExperimentalCronetEngineBuilderEnableQuicFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/net/ExperimentalCronetEngine\$Builder;",
    name = "enableQuic",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lorg/chromium/net/ExperimentalCronetEngine\$Builder;",
    parameters = listOf("Z")
)

/**
 * YouTube Music (Wear OS) — Disable QUIC protocol.
 *
 * Wear port of the official Morphe patch of the same name. The phone
 * version routes the boolean through its extension so a settings
 * toggle can re-enable QUIC; the Wear app has no Morphe settings UI,
 * so this port hardwires QUIC off: every Cronet engine the app builds
 * gets enableQuic(false), whatever the app requested. QUIC (HTTP/3
 * over UDP) is the protocol Cronet tries first for Google traffic;
 * disabling it forces TCP-based HTTP/2, which behaves better on some
 * networks and through some firewalls and proxies.
 */
@Suppress("unused")
val disableQUICProtocolWearPatch = bytecodePatch(
    name = "Disable QUIC protocol",
    description = "Disables the QUIC (HTTP/3) network protocol in the Wear OS app's Cronet stack, forcing TCP-based HTTP/2 connections.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    execute {
        listOf(
            CronetEngineBuilderEnableQuicFingerprint,
            ExperimentalCronetEngineBuilderEnableQuicFingerprint
        ).forEach { fingerprint ->
            // Instance method: p0 = builder, p1 = requested boolean.
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 p1, 0x0
                """.trimIndent()
            )
        }
    }
}
