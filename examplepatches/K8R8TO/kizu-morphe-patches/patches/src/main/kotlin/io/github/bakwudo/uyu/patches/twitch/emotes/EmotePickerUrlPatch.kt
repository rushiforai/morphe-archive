package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch

private const val URL_UTIL_CLASS = "Ltv/twitch/android/util/EmoteUrlUtil;"
private const val PICKER_BRIDGE = "Lapp/morphe/extension/twitch/emotes/EmotePickerBridge;"
private const val STRING = "Ljava/lang/String;"

internal val thirdPartyEmotePickerUrlPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(sharedExtensionPatch)

    execute {
        val classDef = classDefByOrNull(URL_UTIL_CLASS)
            ?: throw PatchException("Kizu emotes: Twitch EmoteUrlUtil was not found.")

        val method = classDef.methods.firstOrNull { candidate ->
            candidate.returnType == STRING &&
                candidate.parameterTypes.isNotEmpty() &&
                candidate.parameterTypes[0].toString() == STRING
        } ?: throw PatchException(
            "Kizu emotes: no Twitch EmoteUrlUtil String-returning URL helper was found.",
        )

        val mutable = mutableClassDefBy(classDef)
        val target = mutable.methods.first {
            it.name == method.name &&
                it.returnType == method.returnType &&
                it.parameterTypes == method.parameterTypes
        }

        target.addInstructions(
            0,
            """
                invoke-static {p0}, $PICKER_BRIDGE->getEmoteUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
                if-eqz p2, :kizu_emote_url_fallback
                return-object p2
                :kizu_emote_url_fallback
            """.trimIndent(),
        )
    }
}
