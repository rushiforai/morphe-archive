package patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import patches.spotify.COMPATIBILITY_SPOTIFY

private const val DOWNLOAD_BUTTON =
    "Lcom/spotify/encoreconsumermobile/elements/downloadbutton/DownloadButtonView;"

/**
 * Removes every download affordance backed by Spotify's download button. Free accounts cannot
 * download, so the control only leads to an upsell. The row and its progress state are measured at
 * zero pixels and the view starts hidden, which also covers adapters that bind visibility later.
 */
@Suppress("unused")
val hideDownloadButtonsPatch = bytecodePatch(
    name = "Hide download buttons",
    description = "Hides the download button on tracks, albums, playlists and podcasts. Downloads, " +
        "offline cache and account entitlements are unchanged; only the control is removed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val owner = mutableClassDefBy(DOWNLOAD_BUTTON)

        if (owner.methods.none { it.name == "onMeasure" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "I") }) {
            owner.methods.add(
                ImmutableMethod(
                    owner.type, "onMeasure", listOf("I", "I").map {
                        com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                            it, emptySet(), null,
                        )
                    }, "V", AccessFlags.PUBLIC.value, emptySet(), emptySet(),
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
    }
}
