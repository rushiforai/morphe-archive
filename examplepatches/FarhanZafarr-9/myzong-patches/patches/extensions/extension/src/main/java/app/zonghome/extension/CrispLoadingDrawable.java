package app.zonghome.extension;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;

/** Resolution-independent two-ring loader; no GIF frames or bitmap scaling. */
public final class CrispLoadingDrawable extends Drawable implements Animatable {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF oval=new RectF();
    private final int size;
    private int accent,secondary,alpha=255;
    private boolean running;
    private final Runnable frame=new Runnable() {
        @Override public void run() {
            if(running && isVisible()) {
                invalidateSelf();scheduleSelf(this,SystemClock.uptimeMillis()+16);
            }
        }
    };
    public CrispLoadingDrawable(float density,int accent,int secondary) {
        size=Math.round(56*density);this.accent=accent;this.secondary=secondary;
        paint.setStyle(Paint.Style.STROKE);paint.setStrokeCap(Paint.Cap.ROUND);
    }
    public void colors(int accent,int secondary) {
        if(this.accent!=accent || this.secondary!=secondary) {
            this.accent=accent;this.secondary=secondary;invalidateSelf();
        }
    }
    @Override public void draw(Canvas canvas) {
        Rect b=getBounds();float side=Math.min(b.width(),b.height());
        if(side<=0)return;
        float cx=b.exactCenterX(),cy=b.exactCenterY(),stroke=side/18f;
        paint.setStrokeWidth(stroke);
        paint.setColor(secondary);paint.setAlpha(alpha/5);
        canvas.drawCircle(cx,cy,side*.40f,paint);canvas.drawCircle(cx,cy,side*.25f,paint);
        long elapsed=SystemClock.uptimeMillis();
        float turn=LoadingPhase.turn(elapsed);
        float pulse=LoadingPhase.pulse(elapsed);
        paint.setColor(accent);paint.setAlpha(alpha);
        oval.set(cx-side*.40f,cy-side*.40f,cx+side*.40f,cy+side*.40f);
        canvas.drawArc(oval,turn-90,95+125*pulse,false,paint);
        paint.setColor(secondary);paint.setAlpha(alpha);
        oval.set(cx-side*.25f,cy-side*.25f,cx+side*.25f,cy+side*.25f);
        canvas.drawArc(oval,-turn*1.5f+90,220-100*pulse,false,paint);
    }
    @Override public void start() {
        if(running)return;running=true;
        invalidateSelf();scheduleSelf(frame,SystemClock.uptimeMillis()+16);
    }
    @Override public void stop(){running=false;unscheduleSelf(frame);}
    @Override public boolean isRunning(){return running;}
    @Override public boolean setVisible(boolean visible,boolean restart) {
        boolean changed=super.setVisible(visible,restart);
        if(visible)start();else stop();return changed;
    }
    @Override public int getIntrinsicWidth(){return size;}
    @Override public int getIntrinsicHeight(){return size;}
    @Override public void setAlpha(int alpha){this.alpha=alpha;invalidateSelf();}
    @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
