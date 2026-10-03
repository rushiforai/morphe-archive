package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch

private const val URL_UTIL_CLASS = "Ltv/twitch/android/util/EmoteUrlUtil;"
private const val PICKER_BRIDGE = "Lapp/morphe/extension/twitch/emotes/EmotePickerBridge;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"

internal val thirdPartyEmotePickerUrlPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(sharedExtensionPatch)

    execute {
        val classDef = classDefByOrNull(URL_UTIL_CLASS)
            ?: throw PatchException("Kizu emotes: Twitch EmoteUrlUtil was not found.")

        val method = classDef.methods.singleOrNull { candidate ->
            candidate.name == "c" &&
                candidate.returnType == STRING &&
                candidate.parameterTypes.map { it.toString() } ==
                    listOf(CONTEXT, STRING)
        } ?: throw PatchException(
            "Kizu emotes: expected Twitch 31.3.1 EmoteUrlUtil.c(Context,String):String.",
        )

        val mutable = mutableClassDefBy(classDef)
        val target = mutable.methods.single {
            it.name == method.name &&
                it.returnType == method.returnType &&
                it.parameterTypes == method.parameterTypes
        }

        // Do not use p2 here: c(Context,String) has only p0/p1 parameters, and
        // clobbering an implicit local register can corrupt the native URL path.
        // Reuse p0 as the temporary result and restore the original Context before
        // falling through to Twitch's untouched implementation.
        target.addInstructions(
            0,
            """
                invoke-static {p0}, $PICKER_BRIDGE->saveUrlContext($CONTEXT)V
                invoke-static {p1}, $PICKER_BRIDGE->getEmoteUrl($STRING)$STRING
                move-result-object p0
                if-eqz p0, :kizu_emote_url_fallback
                return-object p0
                :kizu_emote_url_fallback
                invoke-static {}, $PICKER_BRIDGE->restoreUrlContext()$CONTEXT
                move-result-object p0
            """.trimIndent(),
        )
    }
}
