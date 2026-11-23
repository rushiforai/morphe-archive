package app.zonghome.extension;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;

/** Replaces only the decorative paid-game WebP panel. All actual controls stay native. */
public final class PaidRewardBackdrop extends Drawable {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect=new RectF();
    private final String label;
    private int alpha=255;
    public PaidRewardBackdrop(String label){this.label=label;}
    @Override public void draw(Canvas canvas) {
        Rect b=getBounds();float w=b.width(),h=b.height();if(w<=0 || h<=0)return;
        float inset=w*.045f,radius=w*.045f;
        paint.setStyle(Paint.Style.FILL);paint.setColor(CharcoalTheme.SURFACE);paint.setAlpha(alpha);
        rect.set(b.left+inset,b.top+h*.115f,b.right-inset,b.bottom);
        canvas.drawRoundRect(rect,radius,radius,paint);
        rect.set(b.left+w*.18f,b.top+h*.015f,b.right-w*.18f,b.top+h*.145f);
        paint.setColor(CharcoalTheme.RAISED);paint.setAlpha(alpha);
        canvas.drawRoundRect(rect,radius,radius,paint);
        paint.setColor(CharcoalTheme.TEXT);paint.setAlpha(alpha);
        paint.setTypeface(Typeface.create(Typeface.DEFAULT,Typeface.BOLD));
        paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(Math.min(w*.075f,h*.045f));
        while(paint.measureText(label)>rect.width()*.88f && paint.getTextSize()>10)paint.setTextSize(paint.getTextSize()*.9f);
        float baseline=rect.centerY()-(paint.ascent()+paint.descent())/2;
        canvas.drawText(label,rect.centerX(),baseline,paint);
    }
    @Override public void setAlpha(int value){alpha=value;invalidateSelf();}
    @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
