/*
 * Copyright (C) 2024 The Android Open Source Project
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: Apache-2.0
 *
 * Adapted from material-components/material-components-android:
 * https://github.com/material-components/material-components-android/commit/66b0eeb53afeb6025ffbbd37734b08e5bce197ed
 * Commit 66b0eeb53afeb6025ffbbd37734b08e5bce197ed (2026-10-12),
 * lib/java/com/google/android/material/loadingindicator/LoadingIndicatorAnimatorDelegate.java and
 * lib/java/com/google/android/material/loadingindicator/LoadingIndicatorDrawingDelegate.java
 */
package app.morphe.extension.boost;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;

/** Drawing core adapted from hxreborn's LoadingIndicatorView. Boost supplies frame
 * callbacks, bounds and loading state; this core owns no View, timer or animator.
 * Cached paths and immutable shared shape data keep steady-state drawing allocation-free. */
public final class MaterialLoadingIndicator {
    private static final double SPRING_STIFFNESS=200, SPRING_DAMPING_RATIO=0.6;
    private static final double SPRING_VALUE_THRESHOLD=0.0075, SPRING_VELOCITY_THRESHOLD=0.46875;
    private static final double NANOS_PER_SECOND=1e9;
    private static final int START_ANCHOR=0,FIRST_CONTROL=1,SECOND_CONTROL=2,END_ANCHOR=3,AXES=2;
    private static final float[][] MORPHS=MaterialLoadingShapes.decodeMorphs();
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path=new Path();
    private int morphTarget;
    private float morphFactor,rotationDegrees;
    private double morphVelocity;
    private long springFrameNanos,startNanos,lastNanos;
    private float lastScale=-1;
    private boolean wasLoading;

    public MaterialLoadingIndicator(int color) { paint.setColor(color);paint.setStyle(Paint.Style.FILL); }
    public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
    public void reset() { wasLoading=false;startNanos=lastNanos=springFrameNanos=0;morphFactor=rotationDegrees=0;morphVelocity=0; }
    public void draw(Canvas canvas,float cx,float cy,float size,int alpha,boolean loading,float progress,float durationScale,long now) {
        float fraction,rotation;float[] morph;
        if(loading && durationScale>0) {
            if(!wasLoading || lastScale!=durationScale || now-lastNanos>1000000000L) {
                startNanos=now;springFrameNanos=0;morphFactor=0;morphVelocity=0;
            }
            double elapsed=(now-startNanos)/1000000d/durationScale;
            double cycle=elapsed/650d;int completed=(int)Math.floor(cycle);
            // Keep counters bounded over very long refreshes without changing the shape order.
            if(completed>7000) {startNanos=now;cycle=0;completed=0;morphFactor=0;morphVelocity=0;springFrameNanos=0;}
            morphTarget=completed+1;
            // The analytical spring receives animation-scaled time as well as rotation.
            long scaledNow=(long)(elapsed*1000000d)+1;
            stepSpring(scaledNow);
            rotationDegrees=(float)((140d*completed+50d*(cycle-completed)+90d*(morphFactor-completed))%360d);
            int index=(int)Math.floor(morphFactor),count=MaterialLoadingShapes.INDETERMINATE_CUBIC_COUNTS.length;
            morph=MORPHS[((index%count)+count)%count];fraction=morphFactor-index;rotation=rotationDegrees;
        } else {
            fraction=Math.max(0,Math.min(1,progress));
            morph=MORPHS[MaterialLoadingShapes.DETERMINATE_MORPH_INDEX];rotation=-180*fraction;
        }
        wasLoading=loading;lastNanos=now;lastScale=durationScale;
        paint.setAlpha(alpha);buildPath(morph,fraction,size*0.5f*38f/48f);
        int save=canvas.save();canvas.translate(cx,cy);canvas.rotate(-90+rotation);canvas.drawPath(path,paint);canvas.restoreToCount(save);
    }
    private void stepSpring(long frameNanos) {
        final double elapsedSeconds = (this.springFrameNanos == 0) ? 0
                : (frameNanos - this.springFrameNanos) / NANOS_PER_SECOND;
        this.springFrameNanos = frameNanos;
        final double naturalFrequency = Math.sqrt(SPRING_STIFFNESS);
        final double dampedFrequency = naturalFrequency * Math.sqrt(1 - SPRING_DAMPING_RATIO * SPRING_DAMPING_RATIO);
        final double decayRate = SPRING_DAMPING_RATIO * naturalFrequency;
        final double displacement = this.morphFactor - this.morphTarget;
        final double sineCoefficient = (this.morphVelocity + decayRate * displacement) / dampedFrequency;
        final double decay = Math.exp(-decayRate * elapsedSeconds);
        final double cosine = Math.cos(dampedFrequency * elapsedSeconds);
        final double sine = Math.sin(dampedFrequency * elapsedSeconds);
        double nextDisplacement = decay * (displacement * cosine + sineCoefficient * sine);
        double nextVelocity = -decayRate * nextDisplacement
                + decay * dampedFrequency * (sineCoefficient * cosine - displacement * sine);
        if (Math.abs(nextDisplacement) < SPRING_VALUE_THRESHOLD && Math.abs(nextVelocity) < SPRING_VELOCITY_THRESHOLD) {
            nextDisplacement = 0;
            nextVelocity = 0;
        }
        this.morphFactor = (float) (this.morphTarget + nextDisplacement);
        this.morphVelocity = nextVelocity;
    }

    private void buildPath(float[] morph, float fraction, float scale) {
        this.path.rewind();
        final int cubics = morph.length / MaterialLoadingShapes.FLOATS_PER_CUBIC;
        this.path.moveTo(coordinate(morph, 0, START_ANCHOR, 0, fraction, scale),
                coordinate(morph, 0, START_ANCHOR, 1, fraction, scale));
        for (int cubic = 0; cubic < cubics; cubic++) {
            final boolean last = cubic == cubics - 1;
            final int endCubic = (last) ? 0 : cubic;
            final int endAnchor = (last) ? START_ANCHOR : END_ANCHOR;
            this.path.cubicTo(coordinate(morph, cubic, FIRST_CONTROL, 0, fraction, scale),
                    coordinate(morph, cubic, FIRST_CONTROL, 1, fraction, scale),
                    coordinate(morph, cubic, SECOND_CONTROL, 0, fraction, scale),
                    coordinate(morph, cubic, SECOND_CONTROL, 1, fraction, scale),
                    coordinate(morph, endCubic, endAnchor, 0, fraction, scale),
                    coordinate(morph, endCubic, endAnchor, 1, fraction, scale));
        }
        this.path.close();
    }

    private static float coordinate(float[] morph, int cubic, int point, int axis, float fraction, float scale) {
        final int index = cubic * MaterialLoadingShapes.FLOATS_PER_CUBIC + (point * AXES + axis) * 2;
        final float from = morph[index];
        final float to = morph[index + 1];
        return (from + (to - from) * fraction) * scale;
    }

}
