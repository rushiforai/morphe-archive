package k60;

import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;
import p6.p0;

/* loaded from: classes4.dex */
public final class d extends MetricAffectingSpan {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71165a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f71166b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f71165a = i5;
        this.f71166b = obj;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        switch (this.f71165a) {
            case 0:
                i60.f fVar = (i60.f) this.f71166b;
                int i5 = fVar.f61430d;
                if (i5 != 0) {
                    textPaint.setColor(i5);
                }
                textPaint.setTypeface(Typeface.MONOSPACE);
                textPaint.setTextSize(textPaint.getTextSize() * 0.87f);
                int iC = fVar.f61431e;
                if (iC == 0) {
                    iC = p0.c(textPaint.getColor(), 25);
                }
                textPaint.bgColor = iC;
                break;
            case 1:
                textPaint.setFontFeatureSettings((String) this.f71166b);
                break;
            default:
                textPaint.setTypeface((Typeface) this.f71166b);
                break;
        }
    }

    @Override // android.text.style.MetricAffectingSpan
    public final void updateMeasureState(TextPaint textPaint) {
        switch (this.f71165a) {
            case 0:
                int i5 = ((i60.f) this.f71166b).f61430d;
                if (i5 != 0) {
                    textPaint.setColor(i5);
                }
                textPaint.setTypeface(Typeface.MONOSPACE);
                textPaint.setTextSize(textPaint.getTextSize() * 0.87f);
                break;
            case 1:
                textPaint.setFontFeatureSettings((String) this.f71166b);
                break;
            default:
                textPaint.setTypeface((Typeface) this.f71166b);
                break;
        }
    }
}
