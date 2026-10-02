package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
        val classDef = classDefByOrNull(AUTOCOMPLETE_CLASS) ?: return@execute

        val mutable = mutableClassDefBy(classDef)
        val method = mutable.methods.firstOrNull { candidate ->
            candidate.name == "invoke" &&
                candidate.parameterTypes.any { it.toString() == LIST }
        } ?: return@execute

        val listIndex = method.parameterTypes.indexOfFirst { it.toString() == LIST }
        if (listIndex < 0) return@execute

        val register = "p" + (listIndex + 1)
        method.addInstructions(
            0,
            "invoke-static {" + register + "}, " + BRIDGE + "->addAutocomplete(Ljava/lang/Object;)V",
        )
    }
}