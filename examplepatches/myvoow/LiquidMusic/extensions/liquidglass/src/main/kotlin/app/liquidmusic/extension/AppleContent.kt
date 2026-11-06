/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.extension

import android.graphics.RenderNode
import android.os.Build
import android.view.View
import androidx.annotation.RequiresApi
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.drawIntoCanvas
import androidx.compose.ui.graphics.nativeCanvas
import java.lang.ref.WeakReference

/**
 * What Apple Music shows behind its floating views, for Backdrop's glass: the window background,
 * then the content BlurTarget records in its RenderNode on every frame. Drawn at its place in the
 * window, seen from a ComposeView at a given position.
 *
 * Positions are Compose state, updated on every frame by [update], so the drawings that use them
 * follow the views when they move.
 */
@RequiresApi(Build.VERSION_CODES.S)
internal class AppleContent(private val blurView: View) {

    private var sourceRef = WeakReference<View>(null)
    private var node: RenderNode? = null
    private val location = IntArray(2)

    private var sourceX by mutableIntStateOf(0)
    private var sourceY by mutableIntStateOf(0)
    private var rootX by mutableIntStateOf(0)
    private var rootY by mutableIntStateOf(0)

    /** Finds BlurTarget again if needed and reads where things are in the window. */
    fun update() {
        var source = sourceRef.get()
        if (source == null || !source.isAttachedToWindow) {
            source = BlurViewAccess.findBlurTarget(blurView)
            sourceRef = WeakReference(source)
            node = source?.let { BlurViewAccess.recordedNodeOf(it) as? RenderNode }
        }
        if (source != null) {
            source.getLocationInWindow(location)
            sourceX = location[0]
            sourceY = location[1]
        }
        blurView.rootView?.getLocationInWindow(location)
        rootX = location[0]
        rootY = location[1]
    }

    /** Draws the content as seen from a view whose top left corner is at (viewX, viewY) in the window. */
    fun draw(scope: DrawScope, viewX: Int, viewY: Int) {
        val node = node ?: return
        scope.drawIntoCanvas { composeCanvas ->
            val canvas = composeCanvas.nativeCanvas
            val save = canvas.save()
            canvas.translate((rootX - viewX).toFloat(), (rootY - viewY).toFloat())
            val background = blurView.rootView?.background
            if (background != null) background.draw(canvas) else canvas.drawColor(android.graphics.Color.BLACK)
            canvas.translate((sourceX - rootX).toFloat(), (sourceY - rootY).toFloat())
            canvas.drawRenderNode(node)
            canvas.restoreToCount(save)
        }
    }
}
