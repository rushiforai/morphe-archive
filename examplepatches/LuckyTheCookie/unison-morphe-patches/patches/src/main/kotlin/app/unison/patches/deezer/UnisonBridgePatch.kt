package app.unison.patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.unison.patches.shared.Constants.COMPATIBILITY_DEEZER
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Element

private const val EXTENSION = "Lapp/unison/extension/deezer"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Déclare le fournisseur de contenu par lequel Unison parle à Deezer. */
private val unisonBridgeManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            val provider = doc.createElement("provider").apply {
                setAttributeNS(ANDROID_NS, "android:name", "app.unison.extension.deezer.UnisonBridgeProvider")
                setAttributeNS(ANDROID_NS, "android:authorities", "deezer.android.app.unison.bridge")
                // Ouvert aux autres apps, mais le fournisseur refuse tout appelant qui n'est pas Unison (certificat vérifié).
                setAttributeNS(ANDROID_NS, "android:exported", "true")
            }
            app.appendChild(provider)
        }
    }
}

@Suppress("unused")
val unisonBridgePatch = bytecodePatch(
    name = "Unison bridge",
    description = "Lets the Unison app add the playing track to one of your Deezer playlists, " +
        "using the session you are already signed in with.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEEZER)

    dependsOn(unisonBridgeManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Juste après `"Bearer " + jwt`, on transmet l'en-tête à l'extension.
        val match = PipeAuthorizationFingerprint
        val index = match.instructionMatches.last().index
        val register = match.method.getInstruction<OneRegisterInstruction>(index).registerA
        match.method.addInstruction(
            index + 1,
            "invoke-static { v$register }, $EXTENSION/JwtStore;->onAuthorization(Ljava/lang/String;)V",
        )
    }
}
