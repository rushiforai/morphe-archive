package patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import patches.spotify.COMPATIBILITY_SPOTIFY

private val SHUFFLE_VIEWS = listOf(
    "Lcom/spotify/encoreconsumermobile/elements/shuffle/ShuffleButtonView;",
    "Lcom/spotify/encoreconsumermobile/elements/smartshufflebutton/SmartShuffleButtonView;",
)

/**
 * Hides the shuffle and Smart Shuffle controls. On a Free account the server still enforces the
 * shuffled queue, so leaving these controls visible only produces a toggle that snaps back. The
 * playback controls, queue and library are unchanged.
 */
@Suppress("unused")
val hideShuffleButtonsPatch = bytecodePatch(
    name = "Hide shuffle controls",
    description = "Removes the shuffle and Smart Shuffle buttons. Spotify Free still enforces its " +
        "shuffled queue, so the controls cannot hold an off state; playback, queue and library " +
        "actions remain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        var patched = 0
        SHUFFLE_VIEWS.forEach { type ->
            val owner = mutableClassDefByOrNull(type) ?: return@forEach
            if (owner.methods.none { it.name == "onMeasure" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "I") }) {
                owner.methods.add(
                    ImmutableMethod(
                        owner.type, "onMeasure",
                        listOf("I", "I").map { ImmutableMethodParameter(it, emptySet(), null) },
                        "V", AccessFlags.PUBLIC.value, emptySet(), emptySet(),
                        MutableMethodImplementation(5),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                invoke-virtual {p0, v0, v0}, Landroid/view/View;->setMeasuredDimension(II)V
                                return-void
                            """,
                        )
                    },
                )
            }
            patched++
        }
        check(patched == SHUFFLE_VIEWS.size) { "Spotify shuffle controls changed" }
    }
}
