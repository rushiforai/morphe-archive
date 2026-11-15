package app.southstar21.patches.instagram.layout.liquidglass

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/liquidglass/LiquidGlassNavBarPatch;"

internal object BlurRadiusFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "blurRadiusDp",
    returnType = "I",
)

internal object RefractionStrengthFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "refractionPercent",
    returnType = "I",
)

internal object ExtendContentFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "extendContentBehindBar",
    returnType = "Z",
)

/**
 * The video player's "play in a SurfaceView" check (IgGrootPlayer, `public final ()Z`): true when
 * Instagram's config picks SurfaceView playback, unless the video's container enforces a
 * TextureView. It's the only method calling the container's `getEnforceTextureView()`, a name
 * that survives obfuscation.
 */
internal object UseSurfaceViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == "getEnforceTextureView"
        } == true
    },
)
