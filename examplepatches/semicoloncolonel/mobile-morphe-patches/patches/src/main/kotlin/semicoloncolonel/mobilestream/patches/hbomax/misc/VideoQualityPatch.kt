package semicoloncolonel.mobilestream.patches.hbomax.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants

// HBO Max 22.0.0.321 (phone) and 22.0.0.36 (Android TV) share Discovery's
// player. Its TrackSelectionFactory builds Media3's adaptive selection, a BOLA
// selection, or a hybrid of the two, depending on the ABR config from the
// server. All of them extend Media3's BaseTrackSelection, and the player reads
// the rendition to play from getSelectedIndex().
//
// 1. Each getSelectedIndex() of those classes now returns
//    HboQuality.index(this): the rendition at the chosen height, or the
//    closest one below it. Audio and text tracks keep the app's own choice,
//    kept as getSelectedIndex$msp(). R8 compiled these methods with one
//    register, so the hook reuses p0 instead of wrapping the code in place.
// 2. The track selector passes over renditions larger than its viewport, which
//    the Android TV app sets to its 1920x1080 interface size on a 4K Shield.
//    For 2160, the viewport is at least 3840x2160.
//
// The server decides which renditions exist. On 2026-11-08 a Shield on a 4K
// plan received at most 1920x1080 for both Harry Potter 5 and The Pitt, with
// 2160 chosen, so 2160 plays the highest rendition HBO sends.

private const val HYBRID = "Lcom/discovery/player/tracks/HybridTrackSelection;"
private const val BASE_TRACK_SELECTION = "Landroidx/media3/exoplayer/trackselection/BaseTrackSelection;"
private const val QUALITY = "Lsemicoloncolonel/mobilestream/extension/hbomax/HboQuality;"

internal object TrackSelectorViewportFingerprint : Fingerprint(
    strings = listOf("4K- Track selector viewport size "),
)

@Suppress("unused")
val videoQualityPatch = bytecodePatch(
    name = "Video quality",
    description = "Plays the video resolution you choose instead of letting the app pick one. " +
        "Videos can buffer if your connection is too slow for it.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY, Constants.STREAM_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val resolution by stringOption(
        key = "resolution",
        default = "2160",
        values = mapOf("480p" to "480", "720p" to "720", "1080p" to "1080", "2160p (4K)" to "2160"),
        title = "Resolution",
        description = "The resolution to play. When a title does not have it, the closest lower one plays.",
        required = true,
    ) { it in setOf("480", "720", "1080", "2160") }

    execute {
        val height = resolution!!.toInt()
        // The Android TV build renames Media3's BaseTrackSelection; its
        // HybridTrackSelection extends it. The phone build keeps the name.
        val base = classDefByOrNull(HYBRID)?.superclass
            ?: BASE_TRACK_SELECTION.takeIf { classDefByOrNull(it) != null }
            ?: throw PatchException("HBO Max: BaseTrackSelection not found")

        // Every class below BaseTrackSelection, at any depth.
        val subclasses = mutableSetOf(base)
        var grew = true
        while (grew) {
            grew = false
            classDefForEach { classDef ->
                if (classDef.superclass in subclasses && subclasses.add(classDef.type)) grew = true
            }
        }
        subclasses.remove(base)

        var hooked = 0
        subclasses.forEach { type ->
            val classDef = mutableClassDefBy(type)
            classDef.methods.filter {
                it.name == "getSelectedIndex" && it.parameterTypes.isEmpty() && it.returnType == "I" &&
                    !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null
            }.toList().forEach { method ->
                classDef.methods.add(
                    ImmutableMethod(
                        method.definingClass,
                        "getSelectedIndex\$msp",
                        emptyList(),
                        "I",
                        method.accessFlags,
                        null,
                        null,
                        method.implementation,
                    ).toMutable(),
                )
                method.addInstructions(
                    0,
                    """
                        invoke-static { p0 }, $QUALITY->index(Ljava/lang/Object;)I
                        move-result p0
                        return p0
                    """,
                )
                hooked++
            }
        }

        // The track selector's viewport: the method that logs it reads the
        // display size into a Point first.
        val viewport = TrackSelectorViewportFingerprint.method
        val instructions = viewport.implementation!!.instructions.toList()
        val pointCall = instructions.indexOfFirst {
            (it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_VIRTUAL) &&
                ((it as ReferenceInstruction).reference as? MethodReference)?.returnType == "Landroid/graphics/Point;"
        }
        if (pointCall < 0 || instructions[pointCall + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("HBO Max: display size read not found")
        }
        val point = (instructions[pointCall + 1] as OneRegisterInstruction).registerA
        viewport.addInstructions(
            pointCall + 2,
            """
                invoke-static { v$point }, $QUALITY->viewport(Landroid/graphics/Point;)Landroid/graphics/Point;
                move-result-object v$point
            """,
        )

        if (hooked == 0) throw PatchException("HBO Max: no track selection to hook")

        // The chosen resolution.
        mutableClassDefBy(QUALITY).methods.first { it.name == "targetHeight" }.addInstructions(
            0,
            """
                const-string v0, "$height"
                return-object v0
            """,
        )
    }
}
