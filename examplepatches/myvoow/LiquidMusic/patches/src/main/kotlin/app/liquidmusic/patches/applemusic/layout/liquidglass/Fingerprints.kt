/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.patches.applemusic.layout.liquidglass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * `eightbitlab.com.blurview.BlurView.draw(Canvas)` of BlurView v3, bundled in Apple Music.
 *
 * BlurView keeps its name because layouts reference it, and draw(Canvas) overrides View.draw,
 * so neither changes with obfuscation. Decompiled (Apple Music 7.0.0-beta):
 *
 * ```
 * public final void draw(Canvas canvas) {
 *     if (this.blurController.draw(canvas)) {   // obfuscated: a.g(canvas)
 *         super.draw(canvas);
 *     }
 * }
 * ```
 *
 * The filter matches the super.draw call, whose reference is reused by the patch.
 */
internal object BlurViewDrawFingerprint : Fingerprint(
    definingClass = "Leightbitlab/com/blurview/BlurView;",
    name = "draw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
    filters = listOf(
        methodCall(
            name = "draw",
            parameters = listOf("Landroid/graphics/Canvas;"),
            returnType = "V",
            opcode = Opcode.INVOKE_SUPER,
        ),
    ),
)
