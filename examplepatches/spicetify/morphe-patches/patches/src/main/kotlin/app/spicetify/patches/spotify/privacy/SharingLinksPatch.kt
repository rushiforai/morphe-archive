package app.spicetify.patches.spotify.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.spotifyCompatibility
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.settings.enableSetting
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.ClassDef

// The historical anddea ShareUrl constructor no longer exists in Spotify 9.1.80.
// Match the share URL builder instead, immediately after its final URI conversion.
internal object ShareLinkFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "L", "Ljava/util/Map;"),
    returnType = "L",
    strings = listOf("si", "context", "utm_source", "utm_medium", "utm_campaign", "Invalid uri "),
)

@Suppress("unused")
val sharingLinksPatch = bytecodePatch(
    name = "Clean sharing links",
    description = "Removes sharing identifiers and marketing parameters from open.spotify.com links. " +
        "Keeps playback timestamps, context, and other parameters.",
    default = true,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch)

    execute {
        enableSetting("cleanSharing")
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes += it }
        val resultConstructor = findShareResultConstructor(classes)
        val matches = ShareLinkFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            throw PatchException("Expected one Spotify share URL builder, found ${matches.size}.")
        }
        val method = matches.single().method
        val instructions = method.implementation!!.instructions.toList()
        val uriConversionIndex = instructions.indexOfLast { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/net/Uri;" && reference.name == "toString" &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Ljava/lang/String;"
        }
        val result = instructions.getOrNull(uriConversionIndex + 1)
        if (uriConversionIndex < 0 || result?.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Spotify share URL builder has no final URI string result.")
        }
        val register = (result as OneRegisterInstruction).registerA
        // Server-generated links bypass the local builder. Clean both final URLs
        // before they reach clipboard, native share intents, or share callbacks.
        mutableClassDefBy(resultConstructor.definingClass).methods.single { it == resultConstructor }
            .addInstructions(
                1,
                """
                    invoke-static/range { p1 .. p1 }, Lapp/spicetify/extension/spotify/privacy/SharingLinks;->onShareUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p1
                    invoke-static/range { p4 .. p4 }, Lapp/spicetify/extension/spotify/privacy/SharingLinks;->onShareUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p4
                """.trimIndent(),
            )
        method.addInstructions(
            uriConversionIndex + 2,
            """
                invoke-static/range { v$register .. v$register }, Lapp/spicetify/extension/spotify/privacy/SharingLinks;->onShareUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """.trimIndent(),
        )
    }
}
