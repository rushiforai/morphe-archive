/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package eightbitlab.com.blurview;

import android.graphics.Canvas;

/** Stand-in for the blur controller interface (oh.a in Apple Music 7.0.0-beta). */
public interface BlurController {
    /** draw(Canvas); returns true if BlurView should draw its background and children. */
    boolean g(Canvas canvas);
}
