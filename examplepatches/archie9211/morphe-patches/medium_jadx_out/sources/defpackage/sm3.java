package defpackage;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.style.ReplacementSpan;
import android.util.TypedValue;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sm3 extends ReplacementSpan implements f39 {
    public final cxd a;
    public final int b;
    public final float c;
    public final int d;

    public sm3(cxd cxdVar, mya myaVar, int i) {
        cxdVar.getClass();
        this.a = cxdVar;
        this.b = i;
        Resources resources = (Resources) myaVar.b;
        TypedValue typedValue = new TypedValue();
        resources.getValue(R.dimen.line_spacing_multiplier_title_xl, typedValue, true);
        this.c = typedValue.getFloat();
        this.d = resources.getDimensionPixelSize(R.dimen.dropcap_right_margin);
    }

    @Override // android.text.style.ReplacementSpan
    public final void draw(Canvas canvas, CharSequence charSequence, int i, int i2, float f, int i3, int i4, int i5, Paint paint) {
        canvas.getClass();
        charSequence.getClass();
        paint.getClass();
        float textSize = paint.getTextSize();
        Paint.FontMetricsInt fontMetricsInt = paint.getFontMetricsInt();
        int i6 = (int) (this.c * ((-fontMetricsInt.top) + fontMetricsInt.bottom + fontMetricsInt.leading));
        paint.setTypeface(this.a.a(nq7.SOURCE_SERIF_PRO));
        paint.setTextSize(textSize * 3.4f);
        canvas.drawText(charSequence, i, i2, (f - this.b) - this.d, i4 + i6, paint);
    }

    @Override // android.text.style.ReplacementSpan
    public final int getSize(Paint paint, CharSequence charSequence, int i, int i2, Paint.FontMetricsInt fontMetricsInt) {
        paint.getClass();
        charSequence.getClass();
        if (fontMetricsInt != null) {
            fontMetricsInt.ascent = 0;
            fontMetricsInt.descent = 0;
            fontMetricsInt.top = 0;
            fontMetricsInt.bottom = 0;
        }
        return 0;
    }
}
