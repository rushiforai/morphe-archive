/*
 * Personal use only. See the README for details.
 *
 * Hooks YouTube Music's media session and injects the self-hosted scrobbler extension.
 */

package app.big1mosha.selfhostscrobble.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.resourceXmlOrNull
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import java.io.File

private const val EXTENSION_CLASS =
    "Lapp/big1mosha/selfhostscrobble/extension/ScrobbleHook;"

private const val NETWORK_SECURITY_CONFIG_ATTRIBUTE = "android:networkSecurityConfig"
private const val CLEARTEXT_CONFIG_FILE = "morphe_cleartext"

/** Finds the method that hands track metadata to the media session. */
private object MediaSessionSetMetadataFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Landroid/media/MediaMetadata;"
        ),
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setMetadata",
            parameters = listOf("Landroid/media/MediaMetadata;")
        )
    )
)

/** Finds the method that hands the playback state to the media session. */
private object MediaSessionSetPlaybackStateFingerprint : Fingerprint(
    filters = listOf(
        // Extension classes also set the playback state, but have no callbacks to notify.
        methodCall(smali = "Landroid/os/RemoteCallbackList;->beginBroadcast()I"),
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setPlaybackState",
            parameters = listOf("Landroid/media/session/PlaybackState;")
        )
    )
)

@Suppress("unused")
val selfHostScrobblePatch = patch(
    name = "Self-hosted scrobbling",
    description = "Scrobbles played tracks to a self-hosted ListenBrainz-compatible server " +
            "such as Koito or Maloja instead of listenbrainz.org.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_YOUTUBE_MUSIC)

    extendWith("extensions/extension.mpe")

    execute {
        MediaSessionSetMetadataFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val index = fingerprint.instructionMatches.last().index
                val call = getInstruction<FiveRegisterInstruction>(index)
                addInstruction(
                    index,
                    "invoke-static { v${call.registerD} }, $EXTENSION_CLASS" +
                            "->onSetMetadata(Landroid/media/MediaMetadata;)V"
                )
            }
        }

        MediaSessionSetPlaybackStateFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val index = fingerprint.instructionMatches.last().index
                val call = getInstruction<FiveRegisterInstruction>(index)
                addInstruction(
                    index,
                    "invoke-static { v${call.registerD} }, $EXTENSION_CLASS" +
                            "->onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
                )
            }
        }

        // Self-hosted servers are usually reached over plain http on the local network,
        // which Android blocks by default.
        enableCleartextTraffic()
    }
}

/**
 * Allows http:// traffic for the patched app.
 */
private fun enableCleartextTraffic() {
    var configFileName = "$CLEARTEXT_CONFIG_FILE.xml"

    resourceXml("AndroidManifest.xml").use { manifest ->
        val application = manifest.elements("application").first()
        val existingConfig = application.attribute(NETWORK_SECURITY_CONFIG_ATTRIBUTE)

        if (existingConfig != null) {
            configFileName = existingConfig.split("/")[1] + ".xml"
        } else {
            application.setAttribute(
                NETWORK_SECURITY_CONFIG_ATTRIBUTE,
                "@xml/$CLEARTEXT_CONFIG_FILE"
            )
        }

        application.setAttribute("android:usesCleartextTraffic", "true")
    }

    val existingConfig = resourceXmlOrNull("res/xml/$configFileName")
    if (existingConfig != null) {
        existingConfig.use { config ->
            val baseConfig = config.elements("base-config").firstOrNull()
                ?: config.elements("network-security-config").first()
                    .appendChild("base-config") {
                        setAttribute("cleartextTrafficPermitted", "true")
                    }

            baseConfig.setAttribute("cleartextTrafficPermitted", "true")
        }
        return
    }

    File(resourceFile("res/xml"), configFileName).writeText(
        """
        <?xml version="1.0" encoding="utf-8"?>
        <network-security-config>
            <base-config cleartextTrafficPermitted="true">
                <trust-anchors>
                    <certificates src="system" />
                </trust-anchors>
            </base-config>
        </network-security-config>
        """.trimIndent()
    )
}
