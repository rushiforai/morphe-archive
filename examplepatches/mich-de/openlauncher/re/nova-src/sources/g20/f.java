package g20;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.text.style.ReplacementSpan;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes4.dex */
public final class f extends ReplacementSpan {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56936a;

    /* renamed from: b, reason: collision with root package name */
    public final Drawable f56937b;

    public /* synthetic */ f(Drawable drawable, int i5) {
        this.f56936a = i5;
        this.f56937b = drawable;
    }

    @Override // android.text.style.ReplacementSpan
    public final void draw(Canvas canvas, CharSequence charSequence, int i5, int i11, float f11, int i12, int i13, int i14, Paint paint) {
        switch (this.f56936a) {
            case 0:
                int color = paint.getColor();
                Drawable drawable = this.f56937b;
                drawable.setTint(color);
                drawable.setAlpha(200);
                canvas.save();
                canvas.translate(f11, ((i14 - drawable.getBounds().bottom) + i12) / 2.0f);
                drawable.draw(canvas);
                canvas.restore();
                break;
            default:
                canvas.save();
                Drawable drawable2 = this.f56937b;
                canvas.translate(f11, (((i14 - i12) / 2.0f) + i12) - (drawable2.getBounds().height() / 2.0f));
                drawable2.draw(canvas);
                canvas.restore();
                break;
        }
    }

    @Override // android.text.style.ReplacementSpan
    public final int getSize(Paint paint, CharSequence charSequence, int i5, int i11, Paint.FontMetricsInt fontMetricsInt) {
        switch (this.f56936a) {
            case 0:
                if (fontMetricsInt == null) {
                    fontMetricsInt = paint.getFontMetricsInt();
                }
                Intrinsics.d(fontMetricsInt);
                int i12 = fontMetricsInt.descent - fontMetricsInt.ascent;
                int iB = MathKt.b(i12 * 0.85f);
                Drawable drawable = this.f56937b;
                drawable.setBounds(0, 0, iB, iB);
                int i13 = drawable.getBounds().bottom;
                int i14 = ((int) 0.0f) / 2;
                int i15 = fontMetricsInt.top;
                fontMetricsInt.ascent = Math.min(i15, ((i12 - i13) / 2) + i15) - i14;
                int i16 = fontMetricsInt.bottom;
                int iMax = Math.max(i16, ((i13 - i12) / 2) + i16) + i14;
                fontMetricsInt.descent = iMax;
                fontMetricsInt.top = fontMetricsInt.ascent;
                fontMetricsInt.bottom = iMax;
                return drawable.getBounds().right;
            default:
                return this.f56937b.getBounds().right;
        }
    }
}
