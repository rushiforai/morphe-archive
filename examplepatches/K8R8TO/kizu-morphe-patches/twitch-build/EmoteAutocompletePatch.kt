package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch

private const val AUTOCOMPLETE_CLASS =
    "Ltv/twitch/android/shared/messageinput/impl/autocomplete/EmoteAutoCompleteMapProvider$1;"
private const val BRIDGE = "Lapp/morphe/extension/twitch/emotes/EmotePickerBridge;"
private const val LIST = "Ljava/util/List;"

internal val thirdPartyEmoteAutocompletePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(sharedExtensionPatch)

    execute {
        val classDef = classDefByOrNull(AUTOCOMPLETE_CLASS)
            ?: throw PatchException("Kizu emotes: Twitch autocomplete lambda class was not found.")

        val mutable = mutableClassDefBy(classDef)
        val method = mutable.methods.singleOrNull { candidate ->
            candidate.name == "invoke" &&
                candidate.parameterTypes.map { it.toString() } == listOf(LIST)
        } ?: throw PatchException(
            "Kizu emotes: expected one autocomplete invoke(List) method.",
        )

        method.addInstructions(
            0,
            "invoke-static {p1}, $BRIDGE->addAutocomplete(Ljava/lang/Object;)V",
        )
    }
}
