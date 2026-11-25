package patches.spotify.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import patches.spotify.COMPATIBILITY_SPOTIFY

private const val RESTRICTIONS = "Lcom/spotify/player/model/AutoValue_Restrictions;"
private const val EMPTY_REASONS = "Lp/yn70;"

/**
 * Removes the client-side shuffle restriction from the player model. The Free upsell sheet asks
 * this model whether toggling shuffle is disallowed; with an empty reason set the app no longer
 * opens "Want to control how you listen?" when a playlist is started in order.
 *
 * The native player still receives its own restrictions; this patch only stops the app's own
 * client gate from forcing the upsell/shuffle path.
 */
@Suppress("unused")
val removeShuffleRestrictionPatch = bytecodePatch(
    name = "Remove shuffle restriction",
    description = "Stops the Free 'Want to control how you listen?' upsell and lets the app use " +
        "normal play order/shuffle controls. The account tier and server-side playback rules are " +
        "unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val model = mutableClassDefBy(RESTRICTIONS)
        val method = model.methods.singleOrNull {
            it.name == "disallowTogglingShuffleReasons" && it.parameterTypes.isEmpty()
        } ?: throw IllegalStateException("Spotify shuffle restriction model changed")

        val replacement = ImmutableMethod(
            method.definingClass, method.name, method.parameters, method.returnType,
            method.accessFlags, method.annotations, method.hiddenApiRestrictions,
            MutableMethodImplementation(2),
        ).toMutable()
        replacement.addInstructions(
            0,
            """
                const/4 v0, 0x0
                new-array v1, v0, [Ljava/lang/Object;
                invoke-static {v0, v1}, $EMPTY_REASONS->n(I[Ljava/lang/Object;)$EMPTY_REASONS
                move-result-object v0
                return-object v0
            """,
        )
        check(model.methods.remove(method)) { "Spotify shuffle restriction disappeared" }
        model.methods.add(replacement)
    }
}
