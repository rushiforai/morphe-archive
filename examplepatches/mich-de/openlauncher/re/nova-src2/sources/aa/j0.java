package aa;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import com.android.launcher3.icons.BitmapInfo;

/* loaded from: classes.dex */
public final class j0 extends n {
    public final Path o;

    public j0(BitmapInfo bitmapInfo, Context context) {
        super(bitmapInfo);
        this.o = p.c();
        this.f626a.setColor(r4.a.j(p.b(context, 2130969551), bitmapInfo.f21152b));
    }

    @Override // aa.n
    public final void f(Canvas canvas, Rect rect) {
        int iSave = canvas.save();
        canvas.translate(rect.left, rect.top);
        canvas.scale(rect.width() / 100.0f, rect.height() / 100.0f);
        canvas.drawPath(this.o, this.f626a);
        canvas.restoreToCount(iSave);
    }

    public final void l(final Drawable drawable) {
        final int color = this.f626a.getColor();
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(Color.alpha(color), 0);
        valueAnimatorOfInt.setDuration(375L);
        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: aa.h0
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                drawable.setColorFilter(new PorterDuffColorFilter(r4.a.n(color, ((Integer) valueAnimator.getAnimatedValue()).intValue()), PorterDuff.Mode.SRC_ATOP));
            }
        });
        valueAnimatorOfInt.addListener(new i0(drawable, 0));
        valueAnimatorOfInt.start();
    }
}
