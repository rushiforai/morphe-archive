package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.video

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference

internal val parseRedditVideoNetworkResponseFingerprint = Fingerprint(
    name = "parseNetworkResponse",
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.NEW_INSTANCE,
        Opcode.IGET_OBJECT,
        Opcode.INVOKE_DIRECT,
        Opcode.CONST_WIDE_32,
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "RedditVideoRequest.java"
    }
)

internal const val IMAGE_VIEWER_FRAGMENT_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/ImageViewerFragment;"

/**
 * Whether a call moves a [android.widget.SeekBar] to a new position with an animation.
 *
 * <p>There is exactly one such call in the whole app, which is what makes it safe to find the
 * method by it: the two parameter form of <code>setProgress</code> exists only from API 24, so
 * the app reaches it from behind a version check and calls the plain one below that.
 */
internal fun Reference?.isAnimatedSeekBarProgress() =
    (this as? MethodReference)?.let {
        it.definingClass == "Landroid/widget/SeekBar;" &&
                it.name == "setProgress" &&
                it.parameterTypes.size == 2
    } == true

/**
 * Where the viewer moves the position bar along as a video plays.
 *
 * <p>Found by that one animated call rather than by the method's own name, which is the
 * minifier's. The class keeps its name, because the view binding generated for it names it.
 */
internal val seekBarProgressFingerprint = Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == IMAGE_VIEWER_FRAGMENT_CLASS &&
                method.implementation?.instructions?.any {
                    (it as? ReferenceInstruction)?.reference.isAnimatedSeekBarProgress()
                } == true
    },
)
